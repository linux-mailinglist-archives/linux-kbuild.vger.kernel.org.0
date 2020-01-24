Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2531148EF8
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Jan 2020 20:59:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389024AbgAXT7E (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 24 Jan 2020 14:59:04 -0500
Received: from mga05.intel.com ([192.55.52.43]:12968 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388974AbgAXT7E (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Jan 2020 14:59:04 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Jan 2020 11:59:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,358,1574150400"; 
   d="scan'208";a="260351273"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 24 Jan 2020 11:59:01 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 40B2C107; Fri, 24 Jan 2020 21:58:59 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Michal Simek <monstr@monstr.eu>, linux-kernel@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] kbuild: Fix off-by-one error when generate a new version
Date:   Fri, 24 Jan 2020 21:58:59 +0200
Message-Id: <20200124195859.86991-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When build on, for example, x86 using `make O=... -j64` the version
in the built kernel comes from include/generated/compile.h, which is:

	#define UTS_VERSION "#351 SMP Fri Jan 24 18:46:34 EET 2020"

While at the end the x86 specific Makefile prints the contents of
the .version file:

	Kernel: arch/x86/boot/bzImage is ready  (#352)

Obviously the latter is not true. This happens because we first
check compile.h and update it and then generate new version, which is
incorrect flow:

  CHK     include/generated/compile.h
  UPD     include/generated/compile.h
  ...
  GEN     .version

In order to fix this, move the version generation from link-vmlinux.sh
to scripts/version.sh and re-use it in init/Makefile.

Additionally provide a unified way to get the current version of the build
and use this in few callers. This will respect the KBUILD_BUILD_VERSION
in case it's provided.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/microblaze/Makefile |  4 ++--
 arch/x86/boot/Makefile   |  2 +-
 init/Makefile            |  8 ++++++-
 scripts/kversion.sh      | 45 ++++++++++++++++++++++++++++++++++++++++
 scripts/link-vmlinux.sh  | 10 ---------
 scripts/mkcompile_h      |  9 +++-----
 scripts/package/mkdebian |  2 +-
 scripts/package/mkspec   |  2 +-
 8 files changed, 60 insertions(+), 22 deletions(-)
 create mode 100755 scripts/kversion.sh

diff --git a/arch/microblaze/Makefile b/arch/microblaze/Makefile
index 7b340a35b194..eead2533e2b7 100644
--- a/arch/microblaze/Makefile
+++ b/arch/microblaze/Makefile
@@ -87,12 +87,12 @@ linux.bin.ub linux.bin.gz: linux.bin
 linux.bin: vmlinux
 linux.bin linux.bin.gz linux.bin.ub:
 	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
-	@echo 'Kernel: $(boot)/$@ is ready' ' (#'`cat .version`')'
+	@echo 'Kernel: $(boot)/$@ is ready' ' (#'`$(srctree)/scripts/kversion.sh --show`')'
 
 PHONY += simpleImage.$(DTB)
 simpleImage.$(DTB): vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $(addprefix $(boot)/$@., ub unstrip strip)
-	@echo 'Kernel: $(boot)/$@ is ready' ' (#'`cat .version`')'
+	@echo 'Kernel: $(boot)/$@ is ready' ' (#'`$(srctree)/scripts/kversion.sh --show`')'
 
 define archhelp
   echo '* linux.bin    - Create raw binary'
diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
index 9ba7557863e7..2ff13d835cb8 100644
--- a/arch/x86/boot/Makefile
+++ b/arch/x86/boot/Makefile
@@ -82,7 +82,7 @@ cmd_image = $(obj)/tools/build $(obj)/setup.bin $(obj)/vmlinux.bin \
 
 $(obj)/bzImage: $(obj)/setup.bin $(obj)/vmlinux.bin $(obj)/tools/build FORCE
 	$(call if_changed,image)
-	@$(kecho) 'Kernel: $@ is ready' ' (#'`cat .version`')'
+	@$(kecho) 'Kernel: $@ is ready' ' (#'`$(srctree)/scripts/kversion.sh --show`')'
 
 OBJCOPYFLAGS_vmlinux.bin := -O binary -R .note -R .comment -S
 $(obj)/vmlinux.bin: $(obj)/compressed/vmlinux FORCE
diff --git a/init/Makefile b/init/Makefile
index 6246a06364d0..f544aeb27901 100644
--- a/init/Makefile
+++ b/init/Makefile
@@ -31,8 +31,14 @@ $(obj)/version.o: include/generated/compile.h
        chk_compile.h = :
  quiet_chk_compile.h = echo '  CHK     $@'
 silent_chk_compile.h = :
-include/generated/compile.h: FORCE
+include/generated/compile.h: kversion FORCE
 	@$($(quiet)chk_compile.h)
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkcompile_h $@	\
 	"$(UTS_MACHINE)" "$(CONFIG_SMP)" "$(CONFIG_PREEMPT)"	\
 	"$(CONFIG_PREEMPT_RT)" "$(CC) $(KBUILD_CFLAGS)"
+
+quiet_cmd_kversion = CALL    $<
+      cmd_kversion = $(CONFIG_SHELL) $< --update
+
+kversion: $(srctree)/scripts/kversion.sh FORCE
+	$(call cmd,kversion)
diff --git a/scripts/kversion.sh b/scripts/kversion.sh
new file mode 100755
index 000000000000..8d9000cd5b62
--- /dev/null
+++ b/scripts/kversion.sh
@@ -0,0 +1,45 @@
+#!/bin/sh -e
+
+show_version() {
+	local dotversion="$1"; shift
+
+	# Check if special build version is requested
+	if [ -n "$KBUILD_BUILD_VERSION" ]; then
+		echo "$KBUILD_BUILD_VERSION"
+	else
+		cat $dotversion 2>/dev/null || echo 1
+	fi
+}
+
+update_version() {
+	local dotversion="$1"; shift
+
+	# Don't update local version if special build version is requested
+	if [ -n "$KBUILD_BUILD_VERSION" ]; then return; fi
+
+	if [ -r $dotversion ]; then
+		local version="$(expr 0$(cat $dotversion) + 1)"
+		echo "$version" > $dotversion
+	else
+		rm -f $dotversion
+		echo "1" > $dotversion
+	fi
+}
+
+VERSION_FILE_NAME=".version"
+
+show=
+update=
+while [ "$#" -ge "1" ]; do
+	case "$1" in
+		--show) show=1 ;;
+		--update) update=1 ;;
+		--) break ;;
+	esac
+	shift
+done
+
+if [ -n "$1" ]; then VERSION_FILE_NAME="$1"; fi
+
+if [ -n "$show" ]; then show_version "$VERSION_FILE_NAME"; fi
+if [ -n "$update" ]; then update_version "$VERSION_FILE_NAME"; fi
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 1919c311c149..c9a1b4f44f47 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -228,16 +228,6 @@ fi
 # We need access to CONFIG_ symbols
 . include/config/auto.conf
 
-# Update version
-info GEN .version
-if [ -r .version ]; then
-	VERSION=$(expr 0$(cat .version) + 1)
-	echo $VERSION > .version
-else
-	rm -f .version
-	echo 1 > .version
-fi;
-
 # final build of init/
 ${MAKE} -f "${srctree}/scripts/Makefile.build" obj=init
 
diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
index 3a5a4b210c86..ef9085a63a04 100755
--- a/scripts/mkcompile_h
+++ b/scripts/mkcompile_h
@@ -28,12 +28,6 @@ set -f
 LC_ALL=C
 export LC_ALL
 
-if [ -z "$KBUILD_BUILD_VERSION" ]; then
-	VERSION=$(cat .version 2>/dev/null || echo 1)
-else
-	VERSION=$KBUILD_BUILD_VERSION
-fi
-
 if [ -z "$KBUILD_BUILD_TIMESTAMP" ]; then
 	TIMESTAMP=`date`
 else
@@ -50,7 +44,10 @@ else
 	LINUX_COMPILE_HOST=$KBUILD_BUILD_HOST
 fi
 
+VERSION=$($srctree/scripts/kversion.sh --show)
+
 UTS_VERSION="#$VERSION"
+
 CONFIG_FLAGS=""
 if [ -n "$SMP" ] ; then CONFIG_FLAGS="SMP"; fi
 if [ -n "$PREEMPT" ] ; then CONFIG_FLAGS="$CONFIG_FLAGS PREEMPT"; fi
diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 357dc56bcf30..a4ef9c6c7d35 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -90,7 +90,7 @@ if [ -n "$KDEB_PKGVERSION" ]; then
 	packageversion=$KDEB_PKGVERSION
 	revision=${packageversion##*-}
 else
-	revision=$(cat .version 2>/dev/null||echo 1)
+	revision=$($srctree/scripts/kversion.sh --show)
 	packageversion=$version-$revision
 fi
 sourcename=$KDEB_SOURCENAME
diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index 8640c278f1aa..0039eb9d62bd 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -42,7 +42,7 @@ sed -e '/^DEL/d' -e 's/^\t*//' <<EOF
 	Name: kernel
 	Summary: The Linux Kernel
 	Version: $__KERNELRELEASE
-	Release: $(cat .version 2>/dev/null || echo 1)
+	Release: $($srctree/scripts/kversion.sh --show)
 	License: GPL
 	Group: System Environment/Kernel
 	Vendor: The Linux Community
-- 
2.24.1

