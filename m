Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F3E3DAB0
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Apr 2019 05:16:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbfD2DQ2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 28 Apr 2019 23:16:28 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:38156 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbfD2DQ2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Apr 2019 23:16:28 -0400
Received: from grover.flets-west.jp (softbank126125154137.bbtec.net [126.125.154.137]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id x3T3FcVU011166;
        Mon, 29 Apr 2019 12:15:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x3T3FcVU011166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1556507738;
        bh=16jxTJlqvgdtc0bmtHW26mp1fSFaCwPHhBiW8YOQYHQ=;
        h=From:To:Cc:Subject:Date:From;
        b=SXaiy2bz37BrBxiz7TFTYS5t5vhN3JA7tjv4a+WVBigceHeCEde/RgD8N0DlyfmPk
         h6I8LVmQ3OXIwlb6XDD+ATEi2JyfisChSuPQy6t0nZCvV7oeFEqmS2uBTjjd7XptMT
         VeZ63rTEDBkhnBuOuySOrWaDylpR3t4qFmhaQAnbvB+B/+NV+GSj8rCuLYqsVWj9Nx
         4HkAvSn6rzt0KW5dCDSdawv4KQ43G6/GciM0RAn3S/fo59ouoo3exwmD2QecV/i+RH
         7TAaDsffT+QHhTqnnhEsyfzFlWwFrSBRfhO7gISnzGz2FJvPP/WMVto4Y0liaC7oUx
         5AMZSkItixgaA==
X-Nifty-SrcIP: [126.125.154.137]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     Olaf Weber <olaf@sgi.com>,
        Gabriel Krisman Bertazi <krisman@collabora.co.uk>,
        "Theodore Ts'o" <tytso@mit.edu>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Gabriel Krisman Bertazi <krisman@collabora.com>,
        linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-fsdevel@vger.kernel.org
Subject: [PATCH v2] unicode: refactor the rule for regenerating utf8data.h
Date:   Mon, 29 Apr 2019 12:15:31 +0900
Message-Id: <1556507731-830-1-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

scripts/mkutf8data is used only when regenerating utf8data.h,
which never happens in the normal kernel build. However, it is
irrespectively built if CONFIG_UNICODE is enabled.

Moreover, there is no good reason for it to reside in the scripts/
directory since it is only used in fs/unicode/.

Hence, move it from scripts/ to fs/unicode/.

In some cases, we bypass build artifacts in the normal build. The
conventional way to do so is to surround the code with ifdef REGENERATE_*.

For example,

 - 7373f4f83c71 ("kbuild: add implicit rules for parser generation")
 - 6aaf49b495b4 ("crypto: arm,arm64 - Fix random regeneration of S_shipped")

I rewrote the rule in a more kbuild'ish style.

In the normal build, utf8data.h is just shipped from the check-in file.

$ make
  [ snip ]
  SHIPPED fs/unicode/utf8data.h
  CC      fs/unicode/utf8-norm.o
  CC      fs/unicode/utf8-core.o
  CC      fs/unicode/utf8-selftest.o
  AR      fs/unicode/built-in.a

If you want to generate utf8data.h based on UCD, put *.txt files into
fs/unicode/, then pass REGENERATE_UTF8DATA=1 from the command line.
The mkutf8data tool will be automatically compiled to generate the
utf8data.h from the *.txt files.

$ make REGENERATE_UTF8DATA=1
  [ snip ]
  HOSTCC  fs/unicode/mkutf8data
  GEN     fs/unicode/utf8data.h
  CC      fs/unicode/utf8-norm.o
  CC      fs/unicode/utf8-core.o
  CC      fs/unicode/utf8-selftest.o
  AR      fs/unicode/built-in.a

I renamed the check-in utf8data.h to utf8data.h_shipped so that this
will work for the out-of-tree build.

You can update it based on the latest UCD like this:

$ make REGENERATE_UTF8DATA=1 fs/unicode/
$ cp fs/unicode/utf8data.h fs/unicode/utf8data.h_shipped

Also, I added entries to .gitignore and dontdiff.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
 - Make this work correctly with O= option

 Documentation/dontdiff                        |  2 ++
 fs/unicode/.gitignore                         |  2 ++
 fs/unicode/Makefile                           | 41 ++++++++++++++++++++-------
 fs/unicode/README.utf8data                    |  9 +++---
 {scripts => fs/unicode}/mkutf8data.c          |  0
 fs/unicode/{utf8data.h => utf8data.h_shipped} |  0
 scripts/Makefile                              |  1 -
 7 files changed, 38 insertions(+), 17 deletions(-)
 create mode 100644 fs/unicode/.gitignore
 rename {scripts => fs/unicode}/mkutf8data.c (100%)
 rename fs/unicode/{utf8data.h => utf8data.h_shipped} (100%)

diff --git a/Documentation/dontdiff b/Documentation/dontdiff
index ef25a06..9369377 100644
--- a/Documentation/dontdiff
+++ b/Documentation/dontdiff
@@ -176,6 +176,7 @@ mkprep
 mkregtable
 mktables
 mktree
+mkutf8data
 modpost
 modules.builtin
 modules.order
@@ -254,6 +255,7 @@ vsyscall_32.lds
 wanxlfw.inc
 uImage
 unifdef
+utf8data.h
 wakeup.bin
 wakeup.elf
 wakeup.lds
diff --git a/fs/unicode/.gitignore b/fs/unicode/.gitignore
new file mode 100644
index 0000000..0381e22
--- /dev/null
+++ b/fs/unicode/.gitignore
@@ -0,0 +1,2 @@
+mkutf8data
+utf8data.h
diff --git a/fs/unicode/Makefile b/fs/unicode/Makefile
index 671d31f..d46e9ba 100644
--- a/fs/unicode/Makefile
+++ b/fs/unicode/Makefile
@@ -5,15 +5,34 @@ obj-$(CONFIG_UNICODE_NORMALIZATION_SELFTEST) += utf8-selftest.o
 
 unicode-y := utf8-norm.o utf8-core.o
 
-# This rule is not invoked during the kernel compilation.  It is used to
-# regenerate the utf8data.h header file.
-utf8data.h.new: *.txt $(objdir)/scripts/mkutf8data
-	$(objdir)/scripts/mkutf8data \
-		-a DerivedAge.txt \
-		-c DerivedCombiningClass.txt \
-		-p DerivedCoreProperties.txt \
-		-d UnicodeData.txt \
-		-f CaseFolding.txt \
-		-n NormalizationCorrections.txt \
-		-t NormalizationTest.txt \
+$(obj)/utf8-norm.o: $(obj)/utf8data.h
+
+# In the normal build, the checked-in utf8data.h is just shipped.
+#
+# To generate utf8data.h from UCD, put *.txt files in this directory
+# and pass REGENERATE_UTF8DATA=1 from the command line.
+ifdef REGENERATE_UTF8DATA
+
+quiet_cmd_utf8data = GEN     $@
+      cmd_utf8data = $< \
+		-a $(srctree)/$(src)/DerivedAge.txt \
+		-c $(srctree)/$(src)/DerivedCombiningClass.txt \
+		-p $(srctree)/$(src)/DerivedCoreProperties.txt \
+		-d $(srctree)/$(src)/UnicodeData.txt \
+		-f $(srctree)/$(src)/CaseFolding.txt \
+		-n $(srctree)/$(src)/NormalizationCorrections.txt \
+		-t $(srctree)/$(src)/NormalizationTest.txt \
 		-o $@
+
+$(obj)/utf8data.h: $(obj)/mkutf8data $(filter %.txt, $(cmd_utf8data)) FORCE
+	$(call if_changed,utf8data)
+
+else
+
+$(obj)/utf8data.h: $(src)/utf8data.h_shipped FORCE
+	$(call if_changed,shipped)
+
+endif
+
+targets += utf8data.h
+hostprogs-y += mkutf8data
diff --git a/fs/unicode/README.utf8data b/fs/unicode/README.utf8data
index eeb7561..459eebf 100644
--- a/fs/unicode/README.utf8data
+++ b/fs/unicode/README.utf8data
@@ -41,15 +41,14 @@ released version of the UCD can be found here:
 
   http://www.unicode.org/Public/UCD/latest/
 
-To build the utf8data.h file, from a kernel tree that has been built,
-cd to this directory (fs/unicode) and run this command:
+Then, build under fs/unicode/ with REGENERATE_UTF8DATA=1:
 
-	make C=../.. objdir=../.. utf8data.h.new
+	make REGENERATE_UTF8DATA=1 fs/unicode/
 
-After sanity checking the newly generated utf8data.h.new file (the
+After sanity checking the newly generated utf8data.h file (the
 version generated from the 12.1.0 UCD should be 4,109 lines long, and
 have a total size of 324k) and/or comparing it with the older version
-of utf8data.h, rename it to utf8data.h.
+of utf8data.h_shipped, rename it to utf8data.h_shipped.
 
 If you are a kernel developer updating to a newer version of the
 Unicode Character Database, please update this README.utf8data file
diff --git a/scripts/mkutf8data.c b/fs/unicode/mkutf8data.c
similarity index 100%
rename from scripts/mkutf8data.c
rename to fs/unicode/mkutf8data.c
diff --git a/fs/unicode/utf8data.h b/fs/unicode/utf8data.h_shipped
similarity index 100%
rename from fs/unicode/utf8data.h
rename to fs/unicode/utf8data.h_shipped
diff --git a/scripts/Makefile b/scripts/Makefile
index b87e3e0..9d442ee 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -20,7 +20,6 @@ hostprogs-$(CONFIG_ASN1)	 += asn1_compiler
 hostprogs-$(CONFIG_MODULE_SIG)	 += sign-file
 hostprogs-$(CONFIG_SYSTEM_TRUSTED_KEYRING) += extract-cert
 hostprogs-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE) += insert-sys-cert
-hostprogs-$(CONFIG_UNICODE) += mkutf8data
 
 HOSTCFLAGS_sortextable.o = -I$(srctree)/tools/include
 HOSTCFLAGS_asn1_compiler.o = -I$(srctree)/include
-- 
2.7.4

