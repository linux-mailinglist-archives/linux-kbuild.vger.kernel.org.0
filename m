Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88ABD163E29
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Feb 2020 08:51:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbgBSHvm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 19 Feb 2020 02:51:42 -0500
Received: from conuserg-09.nifty.com ([210.131.2.76]:34486 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbgBSHvm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Feb 2020 02:51:42 -0500
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 01J7oBm0008413;
        Wed, 19 Feb 2020 16:50:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 01J7oBm0008413
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582098613;
        bh=CmAkppl+SFFJV1RkBUsjbfUnoQtSHwVJbJtqBWpmqgs=;
        h=From:To:Cc:Subject:Date:From;
        b=s4e2LiFvAWd7foi/qebZk1ywEQ32xF0d+kOi1DjnzKKpbe5UQLKkqw8c8vcHIFVlp
         lN9rLpbyNAz2hdK5TVf4/kPse1mIRuW7/r0JjIi8EKBwdzwz2/Ne+VQHKcSyJcsz/A
         17B8wd1IgKZvBL93419ZmZ1AjXGE0MY3haxcK0inoJAiAanJ0fGTzU34btlV+8lfyM
         YWjBxDtVvxQG79sgxvqeW/SggmrC5b5cvAb0Ky0qc/hQobueIL2XcHq6Q25Hkcr24l
         d11ENJQGH8SZaTFxsN61gaZotxPiAEueW+6KYAxDrh+MvlI8lAmaYIkqTyuflr7tFt
         1zDTvo1+NMmDA==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nico@fluxnic.net>,
        Richard Cochran <richardcochran@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        John Stultz <john.stultz@linaro.org>,
        Josh Triplett <josh@joshtriplett.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Magnusson <ulfalizer@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: make 'imply' obey the direct dependency
Date:   Wed, 19 Feb 2020 16:49:50 +0900
Message-Id: <20200219074950.23344-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
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

This ignores the dependency "BAZ depends on BAR".

Unlike 'select', what is worse, Kconfig never shows the
"WARNING: unmet direct dependencies detected for ..." for this case.

Because 'imply' should be weaker than 'depends on', Kconfig should
take the direct dependency into account.

Describe this case in Documentation/kbuild/kconfig-language.rst for
clarification.

Commit 237e3ad0f195 ("Kconfig: Introduce the "imply" keyword") says that
a symbol implied by y is restricted to y or n, excluding m.

As for the combination of FOO=y and BAR=m, the case of BAZ=m is excluded
by the 'imply', and BAZ=y is also excluded by 'depends on'. So, only the
possible value is BAZ=n.

Having said that, this case was probably "We don't care" at that time
because Kconfig did not handle 'depends on m' correctly until
commit f622f8279581 ("kconfig: warn unmet direct dependency of tristate
symbols selected by y") fixed it.

Backporting this to 4.19+ will probably be fine. If you care this
problem on 4.14.x, you need to backport f622f8279581 as well.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/kconfig-language.rst |  7 +++++--
 scripts/kconfig/symbol.c                  | 17 +++++++++++++----
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index d0111dd26410..9141f03ff744 100644
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
 	y		y		y		Y/n
+	n		m		n		N/m
+	m		m		m		M/n
+	y		m		n		N
 	y		n		*		N
 	===		===		=============	==============
 
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 8d38b700b314..6100e6ead8ad 100644
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
@@ -393,7 +393,17 @@ void sym_calc_value(struct symbol *sym)
 				}
 				if (sym->implied.tri != no) {
 					sym->flags |= SYMBOL_WRITE;
-					newval.tri = EXPR_OR(newval.tri, sym->implied.tri);
+					newval.tri = EXPR_OR(newval.tri,
+							     sym->implied.tri);
+					newval.tri = EXPR_AND(newval.tri,
+							      sym->dir_dep.tri);
+
+					if (newval.tri == mod && sym->implied.tri == yes) {
+						if (sym->dir_dep.tri == yes)
+							newval.tri = yes;
+						else
+							newval.tri = no;
+					}
 				}
 			}
 		calc_newval:
@@ -401,8 +411,7 @@ void sym_calc_value(struct symbol *sym)
 				sym_warn_unmet_dep(sym);
 			newval.tri = EXPR_OR(newval.tri, sym->rev_dep.tri);
 		}
-		if (newval.tri == mod &&
-		    (sym_get_type(sym) == S_BOOLEAN || sym->implied.tri == yes))
+		if (newval.tri == mod && sym_get_type(sym) == S_BOOLEAN)
 			newval.tri = yes;
 		break;
 	case S_STRING:
-- 
2.17.1

