Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C33971753A7
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Mar 2020 07:24:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726829AbgCBGY3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Mar 2020 01:24:29 -0500
Received: from conuserg-11.nifty.com ([210.131.2.78]:57551 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbgCBGY3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Mar 2020 01:24:29 -0500
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 0226NfKm030880;
        Mon, 2 Mar 2020 15:23:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 0226NfKm030880
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1583130222;
        bh=dLJGtmHzi5rst42jrQBM/khBnOAWWgwO3JKYbMyi3SY=;
        h=From:To:Cc:Subject:Date:From;
        b=wXI8SixO3CUvqd8AYVrMt7G+hfKz0IVxwN0p18hqHfohg8yKa9CyUxgeXoP56ZgpW
         gRSP6bv707i9VnWAzNWrLntE9VW6VwKICgs/yonfXEO87yZYlFfVxrsidy5l3kZy5b
         dz7SEhGG+qi4N3tof/mCPfKTnuVxD92Exp3WA+bmMH7hQD9Mizy3qwAfCXeQAQzhfO
         CRqp6QU2pPqP1Nh5xy8JxvQnKy+SE/MMzM5FS8xoYuODjvxb4bSrP7Ia40ZT1VG719
         TlnJ6zEXbVvSIxi0CqBN3gKhC6fzm4KKO9RU5A9wqcrBElQ3ZKo9dQaDl3O8zxE8Wc
         5QQIL5jrt3/HA==
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
Subject: [PATCH 1/2] kconfig: allow symbols implied by y to become m
Date:   Mon,  2 Mar 2020 15:23:39 +0900
Message-Id: <20200302062340.21453-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The 'imply' keyword restricts a symbol to y or n, excluding m
when it is implied by y. This is the original behavior since
commit 237e3ad0f195 ("Kconfig: Introduce the "imply" keyword").

However, the author of the 'imply' keyword, Nicolas Pitre, stated
that the 'imply' keyword should not impose any restrictions. [1]

I agree, and want to get rid of this tricky behavior.

[1]: https://lkml.org/lkml/2020/2/19/714

Suggested-by: Nicolas Pitre <nico@fluxnic.net>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/kconfig-language.rst | 12 +++++++++++-
 scripts/kconfig/symbol.c                  |  5 +----
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index d0111dd26410..d4d988aea679 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -173,7 +173,7 @@ applicable everywhere (see syntax).
 	===		===		=============	==============
 	n		y		n		N/m/y
 	m		y		m		M/y/n
-	y		y		y		Y/n
+	y		y		y		Y/m/n
 	y		n		*		N
 	===		===		=============	==============
 
@@ -181,6 +181,16 @@ applicable everywhere (see syntax).
   ability to hook into a secondary subsystem while allowing the user to
   configure that subsystem out without also having to unset these drivers.
 
+  Note: If the combination of FOO=y and BAR=m causes a link error,
+  you can guard the function call with IS_REACHABLE()::
+
+	foo_init()
+	{
+		if (IS_REACHABLE(CONFIG_BAZ))
+			baz_register(&foo);
+		...
+	}
+
 - limiting menu display: "visible if" <expr>
 
   This attribute is only applicable to menu blocks, if the condition is
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 8d38b700b314..b101ef3c377a 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -401,8 +401,7 @@ void sym_calc_value(struct symbol *sym)
 				sym_warn_unmet_dep(sym);
 			newval.tri = EXPR_OR(newval.tri, sym->rev_dep.tri);
 		}
-		if (newval.tri == mod &&
-		    (sym_get_type(sym) == S_BOOLEAN || sym->implied.tri == yes))
+		if (newval.tri == mod && sym_get_type(sym) == S_BOOLEAN)
 			newval.tri = yes;
 		break;
 	case S_STRING:
@@ -484,8 +483,6 @@ bool sym_tristate_within_range(struct symbol *sym, tristate val)
 		return false;
 	if (sym->visible <= sym->rev_dep.tri)
 		return false;
-	if (sym->implied.tri == yes && val == mod)
-		return false;
 	if (sym_is_choice_value(sym) && sym->visible == yes)
 		return val == yes;
 	return val >= sym->rev_dep.tri && val <= sym->visible;
-- 
2.17.1

