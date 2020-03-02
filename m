Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DACE1753A3
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Mar 2020 07:24:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgCBGY2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Mar 2020 01:24:28 -0500
Received: from conuserg-11.nifty.com ([210.131.2.78]:57529 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgCBGY2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Mar 2020 01:24:28 -0500
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 0226NfKn030880;
        Mon, 2 Mar 2020 15:23:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 0226NfKn030880
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1583130224;
        bh=wnLhMgIgggfdJrGLtUh15Of/AoVkbl1wJ7X2YZ58njk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=v6hVUWy5WwyAlcJJb3l/KJUxUWIRiIShof48EqopIpSHgwyFLOX9B7ddtMil3lO5g
         OnYhC0Qib3IRxAzvZeTxW2udp3w08lU8kZBv/luNPtway5Dd2/G+pKLuRQJYlJK5nm
         +Nyj24K8NjSJw3uZlItRCET9KiBKZ2rTfuNum+2ZqQHJhWNw+l/qAszGAfghwFqZJ2
         uEQlGAhEtcHHnFMhxF7wx36tSDKYJ7FkiulE6GgNfdbnBFfjXU/kokU3rWaTDDXojV
         0Mya/P4pwfZAMhFEGtbctJFLipEX/QuocdK4CLUl3SeNS2212vG++OzphNyTdeNdt9
         SEfeBJrm07mtw==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>,
        Ulf Magnusson <ulfalizer@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org
Subject: [PATCH 2/2] kconfig: make 'imply' obey the direct dependency
Date:   Mon,  2 Mar 2020 15:23:40 +0900
Message-Id: <20200302062340.21453-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200302062340.21453-1-masahiroy@kernel.org>
References: <20200302062340.21453-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The 'imply' statement may create unmet direct dependency when the
implied symbol depends on m.

[Test Code]

  config FOO
          tristate "foo"
          imply BAZ

  config BAZ
          tristate "baz"
          depends on BAR

  config BAR
          def_tristate m

  config MODULES
          def_bool y
          option modules

If you set FOO=y, BAZ is also promoted to y, which results in the
following .config file:

  CONFIG_FOO=y
  CONFIG_BAZ=y
  CONFIG_BAR=m
  CONFIG_MODULES=y

This does not meet the dependency 'BAZ depends on BAR'.

Unlike 'select', what is worse, Kconfig never shows the
'WARNING: unmet direct dependencies detected for ...' for this case.

Because 'imply' is considered to be weaker than 'depends on', Kconfig
should take the direct dependency into account.

For clarification, describe this case in kconfig-language.rst too.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/kconfig-language.rst | 7 +++++--
 scripts/kconfig/symbol.c                  | 4 +++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index d4d988aea679..68719e78ff85 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -159,11 +159,11 @@ applicable everywhere (see syntax).
   Given the following example::
 
     config FOO
-	tristate
+	tristate "foo"
 	imply BAZ
 
     config BAZ
-	tristate
+	tristate "baz"
 	depends on BAR
 
   The following values are possible:
@@ -174,6 +174,9 @@ applicable everywhere (see syntax).
 	n		y		n		N/m/y
 	m		y		m		M/y/n
 	y		y		y		Y/m/n
+	n		m		n		N/m
+	m		m		m		M/n
+	y		m		n		M/n
 	y		n		*		N
 	===		===		=============	==============
 
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index b101ef3c377a..3dc81397d003 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -221,7 +221,7 @@ static void sym_calc_visibility(struct symbol *sym)
 		sym_set_changed(sym);
 	}
 	tri = no;
-	if (sym->implied.expr && sym->dir_dep.tri != no)
+	if (sym->implied.expr)
 		tri = expr_calc_value(sym->implied.expr);
 	if (tri == mod && sym_get_type(sym) == S_BOOLEAN)
 		tri = yes;
@@ -394,6 +394,8 @@ void sym_calc_value(struct symbol *sym)
 				if (sym->implied.tri != no) {
 					sym->flags |= SYMBOL_WRITE;
 					newval.tri = EXPR_OR(newval.tri, sym->implied.tri);
+					newval.tri = EXPR_AND(newval.tri,
+							      sym->dir_dep.tri);
 				}
 			}
 		calc_newval:
-- 
2.17.1

