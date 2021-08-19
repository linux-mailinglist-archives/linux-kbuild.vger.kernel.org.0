Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC24B3F0FBC
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 02:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235265AbhHSA7V (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 20:59:21 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:60449 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234824AbhHSA7T (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 20:59:19 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 17J0vl4s017219;
        Thu, 19 Aug 2021 09:57:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 17J0vl4s017219
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629334673;
        bh=DRNxRpsX6v3sRE7LHBWEe79xZacYol4xWprhfU+M1UA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jOnXaT2WSYXbNGjHay06GAvXr51PfP53DEAuQ3FHoTE59dG1gSyFgN9qA0lbgDFEU
         VQ7sO6Wf12xYo0q4SbFXnQpc5syEHmoCYy9/swu9eO3BBdj8C2wueJ7N5qh4kzhZRu
         lC1HOoYfK6JzPbxTbrd2erEIdCCxAzL2GtOsmiMxU7juMiXC986PaIcBwzS40DoorT
         82cGvQHr3lVVMQ95ezUIbLrwzXA5+us0je2uFeFVZr3/kb4WHtylSyoEp0yKvs5ymv
         QIt3pfx4kEeU6tdY/B75R1+a4+rgGwgEym7n6RoT7/7EJ1/ooQjtt0SOB7SV+CSr3V
         cgCNZ3cFSgrJg==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Sami Tolvanen <samitolvanen@google.com>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH 09/13] kbuild: do not create built-in.a.symversions or lib.a.symversions
Date:   Thu, 19 Aug 2021 09:57:40 +0900
Message-Id: <20210819005744.644908-10-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210819005744.644908-1-masahiroy@kernel.org>
References: <20210819005744.644908-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Merge all *.o.symversions in scripts/link-vmlinux.sh instead of
merging them in the unit of built-in.a or lib.a.

This is a preparation for further code cleanups.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build  | 10 ++--------
 scripts/link-vmlinux.sh | 22 ++++++++++++++++++----
 2 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 585dae34746a..37d6f6da34d6 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -430,11 +430,8 @@ endif
 quiet_cmd_ar_builtin = AR      $@
       cmd_ar_builtin = rm -f $@; $(AR) cDPrST $@ $(real-prereqs)
 
-quiet_cmd_ar_and_symver = AR      $@
-      cmd_ar_and_symver = $(cmd_update_lto_symversions); $(cmd_ar_builtin)
-
 $(obj)/built-in.a: $(real-obj-y) FORCE
-	$(call if_changed,ar_and_symver)
+	$(call if_changed,ar_builtin)
 
 #
 # Rule to create modules.order file
@@ -454,11 +451,8 @@ $(obj)/modules.order: $(obj-m) FORCE
 #
 # Rule to compile a set of .o files into one .a file (with symbol table)
 #
-quiet_cmd_ar_lib = AR      $@
-      cmd_ar_lib = $(cmd_update_lto_symversions); $(cmd_ar)
-
 $(obj)/lib.a: $(lib-y) FORCE
-	$(call if_changed,ar_lib)
+	$(call if_changed,ar)
 
 # NOTE:
 # Do not replace $(filter %.o,^) with $(real-prereqs). When a single object
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index d74cee5c4326..17976609c2d8 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -52,6 +52,13 @@ gen_initcalls()
 		> .tmp_initcalls.lds
 }
 
+append_symversion()
+{
+	if [ -f ${1}.symversions ]; then
+		cat ${1}.symversions >> .tmp_symversions.lds
+	fi
+}
+
 # If CONFIG_LTO_CLANG is selected, collect generated symbol versions into
 # .tmp_symversions.lds
 gen_symversions()
@@ -59,10 +66,17 @@ gen_symversions()
 	info GEN .tmp_symversions.lds
 	rm -f .tmp_symversions.lds
 
-	for o in ${KBUILD_VMLINUX_OBJS} ${KBUILD_VMLINUX_LIBS}; do
-		if [ -f ${o}.symversions ]; then
-			cat ${o}.symversions >> .tmp_symversions.lds
-		fi
+	for a in ${KBUILD_VMLINUX_OBJS} ${KBUILD_VMLINUX_LIBS}; do
+		case $a in
+		*.a)
+			for o in $(${AR} t ${a}); do
+				append_symversion ${o}
+			done
+			;;
+		*)
+			append_symversion ${a}
+			;;
+		esac
 	done
 }
 
-- 
2.30.2

