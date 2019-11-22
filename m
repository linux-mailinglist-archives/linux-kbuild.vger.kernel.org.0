Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F07E106819
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Nov 2019 09:27:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727187AbfKVI1W (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 22 Nov 2019 03:27:22 -0500
Received: from condef-05.nifty.com ([202.248.20.70]:59410 "EHLO
        condef-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727184AbfKVI1V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Nov 2019 03:27:21 -0500
X-Greylist: delayed 394 seconds by postgrey-1.27 at vger.kernel.org; Fri, 22 Nov 2019 03:27:20 EST
Received: from conuserg-09.nifty.com ([10.126.8.72])by condef-05.nifty.com with ESMTP id xAM8C8D6005198;
        Fri, 22 Nov 2019 17:12:11 +0900
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id xAM8B69D003819;
        Fri, 22 Nov 2019 17:11:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com xAM8B69D003819
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1574410266;
        bh=Hwpn9dTrOnKWNzBjRbeo5zgicQbERpM9jetyXIWTTZY=;
        h=From:To:Cc:Subject:Date:From;
        b=14cAQKK4DZUsgFFMy3GC5LfItYVOBvPBptV5CweOtOqbEEXyHWzWLypXVFI4WsLo1
         oJmIb3T9RTNUyrQ85vqDcUIKFMa1oMz4nukFoXDud1Fju086LYtV62pcrHL4CWM3Q0
         WCFl6RLCZhmJbxBWEx/rP3ZoTyKfDt5+1Lq8E4l90DNUVIkHBsK4jw3waoEIuzO76d
         k7dB9iONTIu89MdmryqVKGRdHTxv2N0WxkdtP8bddmO5lcSOjrcjsPWkdWBMrWWvcm
         UtsZjtfLNt7ctdW6NA64x8FM8Dv7u4QgB7QcbpADrewqJSQ4PflJmLjOg5gfnsZBWk
         LY2Y1pGMKpDSw==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Paul Gortmaker <paul.gortmaker@windriver.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] kbuild: check MODULE_* macros in non-modular code
Date:   Fri, 22 Nov 2019 17:11:00 +0900
Message-Id: <20191122081100.27695-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Paul Gortmaker sent a lot of patches to remove orphan modular code.
You can see his contributions by:

  $ git log --grep='make.* explicitly non-modular'

To help this work, this commit adds simple shell-script to detect
MODULE_ tags used in non-modular code.

It displays suspicious use of MODULE_LICENSE, MODULE_AUTHOR,
MODULE_DESCRIPTION, etc.

I was not sure about module_param() or MODULE_PARM_DESC(). A lot of
non-modular code uses module_param() to prefix the kernel parameter
with the file name it resides in. If we changed module_param() to
core_param(), the interface would be broken. MODULE_PARM_DESC() in
non-modular code could be turned into comments or something, but I
am not sure. I did not check them.

I built x86_64_defconfig of v5.4-rc8, and this script detected
the following:

notice: asymmetric_keys: MODULE macros found in non-modular code
notice: binfmt_elf: MODULE macros found in non-modular code
notice: bsg: MODULE macros found in non-modular code
notice: compat_binfmt_elf: MODULE macros found in non-modular code
notice: component: MODULE macros found in non-modular code
notice: debugfs: MODULE macros found in non-modular code
notice: drm_mipi_dsi: MODULE macros found in non-modular code
notice: freq_table: MODULE macros found in non-modular code
notice: glob: MODULE macros found in non-modular code
notice: intel_pstate: MODULE macros found in non-modular code
notice: n_null: MODULE macros found in non-modular code
notice: nvmem_core: MODULE macros found in non-modular code
notice: power_supply: MODULE macros found in non-modular code
notice: thermal_sys: MODULE macros found in non-modular code
notice: tracefs: MODULE macros found in non-modular code
notice: vgacon: MODULE macros found in non-modular code
 To fix above, check MODULE_LICENSE(), MODULE_AUTHOR(), etc.
 Please check #include <linux/module.h>, THIS_MODULE, too.

I confirmed they are all valid.

Maybe the 'debugfs' is unclear because there are tons of debugfs
stuff in the source tree. It is talking about MODULE_ALIAS_FS()
in fs/debugfs/inode.c because fs/debugfs/debugfs.o never becomes
a module.

[How to fix the warnings]

Let's take 'asymmetric_keys' as an example.

(1) grep Makefiles to find the relevant code

$ git grep -A2 asymmetric_keys -- '*/Makefile' '*/Kbuild'
crypto/Makefile:obj-$(CONFIG_ASYMMETRIC_KEY_TYPE) += asymmetric_keys/
crypto/Makefile-obj-$(CONFIG_CRYPTO_HASH_INFO) += hash_info.o
crypto/Makefile-crypto_simd-y := simd.o
--
crypto/asymmetric_keys/Makefile:obj-$(CONFIG_ASYMMETRIC_KEY_TYPE) += asymmetric_keys.o
crypto/asymmetric_keys/Makefile-
crypto/asymmetric_keys/Makefile:asymmetric_keys-y := \
crypto/asymmetric_keys/Makefile-        asymmetric_type.o \
crypto/asymmetric_keys/Makefile-        restrict.o \

Then, you notice it is associated with CONFIG_ASYMMETRIC_KEY_TYPE
and is a composite object that consists of asymmetric_type.o,
restrict.o, ...

(2) Confirm the CONFIG is boolean

$ git grep -A2 'config ASYMMETRIC_KEY_TYPE' -- '*/Kconfig*'
crypto/asymmetric_keys/Kconfig:menuconfig ASYMMETRIC_KEY_TYPE
crypto/asymmetric_keys/Kconfig- bool "Asymmetric (public-key cryptographic) key type"
crypto/asymmetric_keys/Kconfig- depends on KEYS

Now you are sure it never get compiled as a module since
ASYMMETRIC_KEY_TYPE is a bool type option.

(3) Grep the source file(s)

$ grep '^MODULE' crypto/asymmetric_keys/asymmetric_type.c
MODULE_LICENSE("GPL");

Remove the orphan MODULE tags. You may also need to do some additional
works such as:

 - replace module_*_driver with builtin_*_driver
 - replace <linux/module.h> with <linux/init.h>
 - remove module_exit code
 - move credit in MODULE_AUTHOR() to the top of the file

Please see Paul's commits.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Remove redundant back-slashes after the pipe operator '|'

 scripts/modules-check.sh | 54 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/scripts/modules-check.sh b/scripts/modules-check.sh
index f51f446707b8..7975aa61ddb8 100755
--- a/scripts/modules-check.sh
+++ b/scripts/modules-check.sh
@@ -13,4 +13,58 @@ check_same_name_modules()
 	done
 }
 
+# Check MODULE_ macros in non-modular code
+check_orphan_module_macros()
+{
+	# modules.builtin.modinfo is created while linking vmlinux.
+	# It may not exist when you do 'make modules'.
+	if [ ! -r modules.builtin.modinfo ]; then
+		return
+	fi
+
+	# modules.builtin lists *real* built-in modules, i.e. controlled by
+	# tristate CONFIG options, but currently built with =y.
+	#
+	# modules.builtin.modinfo is the list of MODULE_ macros compiled
+	# into vmlinux.
+	#
+	# By diff'ing them, users of bogus MODULE_* macros will show up.
+
+	# Kbuild replaces ',' and '-' in file names with '_' for use in C.
+	real_builtin_modules=$(sed -e 's:.*/::' -e 's/\.ko$//' -e 's/,/_/g' \
+			       -e 's/-/_/g' modules.builtin | sort | uniq)
+
+	show_hint=
+
+	# Exclude '.paramtype=' and '.param=' to skip checking module_param()
+	# and MODULE_PARM_DESC().
+	module_macro_users=$(tr '\0' '\n' < modules.builtin.modinfo |
+			     sed -e '/\.parmtype=/d' -e '/\.parm=/d' |
+			     sed -n 's/\..*//p' | sort | uniq)
+
+	for m in $module_macro_users
+	do
+		warn=1
+
+		for n in $real_builtin_modules
+		do
+			if [ "$m" = "$n" ]; then
+				warn=
+				break
+			fi
+		done
+
+		if [ -n "$warn" ]; then
+			echo "notice: $m: MODULE macros found in non-modular code"
+			show_hint=1
+		fi
+	done
+
+	if [ -n "$show_hint" ]; then
+		echo " To fix above, check MODULE_LICENSE(), MODULE_AUTHOR(), etc."
+		echo " Please check #include <linux/module.h>, THIS_MODULE, too."
+	fi
+}
+
 check_same_name_modules
+check_orphan_module_macros
-- 
2.17.1

