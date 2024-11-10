Return-Path: <linux-kbuild+bounces-4608-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 351B99C3054
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Nov 2024 02:38:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53C091C203D7
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Nov 2024 01:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7B3D14AD0E;
	Sun, 10 Nov 2024 01:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s2NB969z"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B60414A629;
	Sun, 10 Nov 2024 01:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731202626; cv=none; b=Ly+RAtyi60hCIlJQoI1tiUOMpWc+/OkBTUCXHHrHkowp+VvR5RqRdl//m7hTuN3PjC1x2e9r/iM19nIgZEB5WFHPg1t9LBPSQrZxow5rmXye5h6ZU26Ec992pf90bdo2N3bndbob94UimnK9DYtHcJrshHwBW/eWRGxazFX6RGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731202626; c=relaxed/simple;
	bh=6/uwZZEPyIGrWrIPgIcKHUZ4oPZIubvfn8y9Jxnpm00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pzLWtoQKuee2tOhna5GPfekx8oMAI+ii4eY4SY161w8LzRcGP3DX1BfOrhvVEKUJBph40y068AxHdoZhWKxRwNpokPVMwD8aWCzrLu4S6nf+iJ6YDiePIKZpFW8MhNo8SF+Njvjck94UJKsDlBRvpRedRC6MNTyGkBTuaPIZ7bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s2NB969z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5302DC4CED4;
	Sun, 10 Nov 2024 01:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731202626;
	bh=6/uwZZEPyIGrWrIPgIcKHUZ4oPZIubvfn8y9Jxnpm00=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s2NB969zGfvxq3QMT+mtUPx9bmm2IGUiP6zlHtuGLob1Dc1ZLrLRY+kIftyUqQNXY
	 OeltES4Y7rmNNY8rtz8Y81LRsAtbEneYCyASyZXm9Nk4I+CsqdayNMTz3WFpkiEguE
	 iYgHt2bqNgaZez+SeXEfEntcVJZveslun1T+bnkyLbDvasAsdHY1hHZBug5H/4GPyl
	 wHwhfs8ThbxlwaWnh5ruBAtp9LHpuLP/8qbaZZZ92Py3FfGQhNOtjUdN/az/qlT9Bs
	 l9ksghibiSjNDm0ILIr6SMWtzMwXxuoLco06kIvYa7vpdhGHBaZvE1i8fXL2zQymLT
	 +VhUnauS8suvA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	cocci@inria.fr,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 05/11] kbuild: change working directory to external module directory with M=
Date: Sun, 10 Nov 2024 10:34:33 +0900
Message-ID: <20241110013649.34903-6-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241110013649.34903-1-masahiroy@kernel.org>
References: <20241110013649.34903-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, Kbuild always operates in the output directory of the kernel,
even when building external modules. This increases the risk of external
module Makefiles attempting to write to the kernel directory.

This commit switches the working directory to the external module
directory, allowing the removal of the $(KBUILD_EXTMOD)/ prefix from
some build artifacts.

The command for building external modules maintains backward
compatibility, but Makefiles that rely on working in the kernel
directory may break. In such cases, $(objtree) and $(srctree) should
be used to refer to the output and source directories of the kernel.

The appearance of the build log will change as follows:

[Before]

  $ make -C /path/to/my/linux M=/path/to/my/externel/module
  make: Entering directory '/path/to/my/linux'
    CC [M]  /path/to/my/externel/module/helloworld.o
    MODPOST /path/to/my/externel/module/Module.symvers
    CC [M]  /path/to/my/externel/module/helloworld.mod.o
    CC [M]  /path/to/my/externel/module/.module-common.o
    LD [M]  /path/to/my/externel/module/helloworld.ko
  make: Leaving directory '/path/to/my/linux'

[After]

  $ make -C /path/to/my/linux M=/path/to/my/externel/module
  make: Entering directory '/path/to/my/linux'
  make[1]: Entering directory '/path/to/my/externel/module'
    CC [M]  helloworld.o
    MODPOST Module.symvers
    CC [M]  helloworld.mod.o
    CC [M]  .module-common.o
    LD [M]  helloworld.ko
  make[1]: Leaving directory '/path/to/my/externel/module'
  make: Leaving directory '/path/to/my/linux'

Printing "Entering directory" twice is cumbersome. This will be
addressed later.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
 - Introduce a new 'srcroot' variable and clean-up code
 - Reword Documentation/dev-tools/coccinelle.rst

 Documentation/dev-tools/coccinelle.rst | 20 ++-----
 Documentation/kbuild/makefiles.rst     | 14 +++++
 Makefile                               | 80 +++++++++++++++-----------
 rust/Makefile                          |  4 +-
 scripts/Makefile.build                 |  2 +-
 scripts/Makefile.clean                 |  2 +-
 scripts/Makefile.compiler              |  2 +-
 scripts/Makefile.modpost               |  6 +-
 scripts/coccicheck                     |  6 +-
 scripts/nsdeps                         |  8 +--
 scripts/package/install-extmod-build   |  7 +++
 11 files changed, 85 insertions(+), 66 deletions(-)

diff --git a/Documentation/dev-tools/coccinelle.rst b/Documentation/dev-tools/coccinelle.rst
index 535ce126fb4f..6e70a1e9a3c0 100644
--- a/Documentation/dev-tools/coccinelle.rst
+++ b/Documentation/dev-tools/coccinelle.rst
@@ -250,25 +250,17 @@ variables for .cocciconfig is as follows:
 - Your directory from which spatch is called is processed next
 - The directory provided with the ``--dir`` option is processed last, if used
 
-Since coccicheck runs through make, it naturally runs from the kernel
-proper dir; as such the second rule above would be implied for picking up a
-.cocciconfig when using ``make coccicheck``.
-
 ``make coccicheck`` also supports using M= targets. If you do not supply
 any M= target, it is assumed you want to target the entire kernel.
 The kernel coccicheck script has::
 
-    if [ "$KBUILD_EXTMOD" = "" ] ; then
-        OPTIONS="--dir $srctree $COCCIINCLUDE"
-    else
-        OPTIONS="--dir $KBUILD_EXTMOD $COCCIINCLUDE"
-    fi
+    OPTIONS="--dir $srcroot $COCCIINCLUDE"
 
-KBUILD_EXTMOD is set when an explicit target with M= is used. For both cases
-the spatch ``--dir`` argument is used, as such third rule applies when whether
-M= is used or not, and when M= is used the target directory can have its own
-.cocciconfig file. When M= is not passed as an argument to coccicheck the
-target directory is the same as the directory from where spatch was called.
+Here, $srcroot refers to the source directory of the target: it points to the
+external module's source directory when M= used, and otherwise, to the kernel
+source directory. The third rule ensures the spatch reads the .cocciconfig from
+the target directory, allowing external modules to have their own .cocciconfig
+file.
 
 If not using the kernel's coccicheck target, keep the above precedence
 order logic of .cocciconfig reading. If using the kernel's coccicheck target,
diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 7964e0c245ae..d36519f194dc 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -449,6 +449,20 @@ $(obj)
   to prerequisites are referenced with $(src) (because they are not
   generated files).
 
+$(srcroot)
+  $(srcroot) refers to the root of the source you are building, which can be
+  either the kernel source or the external modules source, depending on whether
+  KBUILD_EXTMOD is set. This can be either a relative or an absolute path, but
+  if KBUILD_ABS_SRCTREE=1 is set, it is always an absolute path.
+
+$(srctree)
+  $(srctree) refers to the root of the kernel source tree. When building the
+  kernel, this is the same as $(srcroot).
+
+$(objtree)
+  $(objtree) refers to the root of the kernel object tree. It is ``.`` when
+  building the kernel, but it is different when building external modules.
+
 $(kecho)
   echoing information to user in a rule is often a good practice
   but when execution ``make -s`` one does not expect to see any output
diff --git a/Makefile b/Makefile
index cf1d55560ae2..e5f7ac7647a7 100644
--- a/Makefile
+++ b/Makefile
@@ -180,7 +180,24 @@ ifeq ("$(origin O)", "command line")
   KBUILD_OUTPUT := $(O)
 endif
 
-output := $(KBUILD_OUTPUT)
+ifdef KBUILD_EXTMOD
+    ifdef KBUILD_OUTPUT
+        objtree := $(realpath $(KBUILD_OUTPUT))
+        $(if $(objtree),,$(error specified kernel directory "$(KBUILD_OUTPUT)" does not exist))
+    else
+        objtree := $(CURDIR)
+    endif
+    output := $(KBUILD_EXTMOD)
+    # KBUILD_EXTMOD might be a relative path. Remember its absolute path before
+    # Make changes the working directory.
+    srcroot := $(realpath $(KBUILD_EXTMOD))
+    $(if $(srcroot),,$(error specified external module directory "$(KBUILD_EXTMOD)" does not exist))
+else
+    objtree := .
+    output := $(KBUILD_OUTPUT)
+endif
+
+export objtree srcroot
 
 # Do we want to change the working directory?
 ifneq ($(output),)
@@ -230,35 +247,33 @@ else # need-sub-make
 
 # We process the rest of the Makefile if this is the final invocation of make
 
-ifeq ($(abs_srctree),$(CURDIR))
-        # building in the source tree
-        srctree := .
-	building_out_of_srctree :=
+ifndef KBUILD_EXTMOD
+srcroot := $(abs_srctree)
+endif
+
+ifeq ($(srcroot),$(CURDIR))
+building_out_of_srctree :=
 else
-        ifeq ($(abs_srctree)/,$(dir $(CURDIR)))
-                # building in a subdirectory of the source tree
-                srctree := ..
-        else
-                srctree := $(abs_srctree)
-        endif
-	building_out_of_srctree := 1
+export building_out_of_srctree :=1
 endif
 
-ifneq ($(KBUILD_ABS_SRCTREE),)
-srctree := $(abs_srctree)
+ifdef KBUILD_ABS_SRCTREE
+    # Do not nothing. Use the absolute path.
+else ifeq ($(srcroot),$(CURDIR))
+    # Building in the source.
+    srcroot := .
+else ifeq ($(srcroot)/,$(dir $(CURDIR)))
+    # Building in a subdirectory of the source.
+    srcroot := ..
 endif
 
-objtree		:= .
+export srctree := $(if $(KBUILD_EXTMOD),$(abs_srctree),$(srcroot))
 
-VPATH		:=
-
-ifeq ($(KBUILD_EXTMOD),)
 ifdef building_out_of_srctree
-VPATH		:= $(srctree)
+export VPATH := $(srcroot)
+else
+VPATH :=
 endif
-endif
-
-export building_out_of_srctree srctree objtree VPATH
 
 # To make sure we do not include .config for any of the *config targets
 # catch them early, and hand them over to scripts/kconfig/Makefile
@@ -711,7 +726,7 @@ endif
 # in addition to whatever we do anyway.
 # Just "make" or "make all" shall build modules as well
 
-ifneq ($(filter all modules nsdeps %compile_commands.json clang-%,$(MAKECMDGOALS)),)
+ifneq ($(filter all modules nsdeps compile_commands.json clang-%,$(MAKECMDGOALS)),)
   KBUILD_MODULES := 1
 endif
 
@@ -1107,7 +1122,7 @@ export MODLIB
 
 PHONY += prepare0
 
-export extmod_prefix = $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/)
+export extmod_prefix =
 export MODORDER := $(extmod_prefix)modules.order
 export MODULES_NSDEPS := $(extmod_prefix)modules.nsdeps
 
@@ -1799,14 +1814,10 @@ filechk_kernel.release = echo $(KERNELRELEASE)
 KBUILD_BUILTIN :=
 KBUILD_MODULES := 1
 
-build-dir := $(KBUILD_EXTMOD)
+build-dir := .
 
-compile_commands.json: $(extmod_prefix)compile_commands.json
-PHONY += compile_commands.json
-
-clean-dirs := $(KBUILD_EXTMOD)
-clean: private rm-files := $(KBUILD_EXTMOD)/Module.symvers $(KBUILD_EXTMOD)/modules.nsdeps \
-	$(KBUILD_EXTMOD)/compile_commands.json
+clean-dirs := .
+clean: private rm-files := Module.symvers modules.nsdeps compile_commands.json
 
 PHONY += prepare
 # now expand this into a simple variable to reduce the cost of shell evaluations
@@ -1948,7 +1959,7 @@ $(clean-dirs):
 
 clean: $(clean-dirs)
 	$(call cmd,rmfiles)
-	@find $(or $(KBUILD_EXTMOD), .) $(RCS_FIND_IGNORE) \
+	@find . $(RCS_FIND_IGNORE) \
 		\( -name '*.[aios]' -o -name '*.rsi' -o -name '*.ko' -o -name '.*.cmd' \
 		-o -name '*.ko.*' \
 		-o -name '*.dtb' -o -name '*.dtbo' \
@@ -1981,7 +1992,12 @@ tags TAGS cscope gtags: FORCE
 PHONY += rust-analyzer
 rust-analyzer:
 	+$(Q)$(CONFIG_SHELL) $(srctree)/scripts/rust_is_available.sh
+ifdef KBUILD_EXTMOD
+# FIXME: external modules must not descend into a sub-directory of the kernel
+	$(Q)$(MAKE) $(build)=$(objtree)/rust src=$(srctree)/rust $@
+else
 	$(Q)$(MAKE) $(build)=rust $@
+endif
 
 # Script to generate missing namespace dependencies
 # ---------------------------------------------------------------------------
diff --git a/rust/Makefile b/rust/Makefile
index b5e0a73b78f3..742740816c4b 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -362,8 +362,8 @@ rust-analyzer:
 	$(Q)$(srctree)/scripts/generate_rust_analyzer.py \
 		--cfgs='core=$(core-cfgs)' --cfgs='alloc=$(alloc-cfgs)' \
 		$(realpath $(srctree)) $(realpath $(objtree)) \
-		$(rustc_sysroot) $(RUST_LIB_SRC) $(KBUILD_EXTMOD) > \
-		$(if $(KBUILD_EXTMOD),$(extmod_prefix),$(objtree))/rust-project.json
+		$(rustc_sysroot) $(RUST_LIB_SRC) $(if $(KBUILD_EXTMOD),$(srcroot)) \
+		> rust-project.json
 
 redirect-intrinsics = \
 	__addsf3 __eqsf2 __extendsfdf2 __gesf2 __lesf2 __ltsf2 __mulsf3 __nesf2 __truncdfsf2 __unordsf2 \
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 64cd046f8fd8..1aa928a6fb4f 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -3,7 +3,7 @@
 # Building
 # ==========================================================================
 
-src := $(if $(VPATH),$(VPATH)/)$(obj)
+src := $(srcroot)/$(obj)
 
 PHONY := $(obj)/
 $(obj)/:
diff --git a/scripts/Makefile.clean b/scripts/Makefile.clean
index 4fcfab40ed61..6ead00ec7313 100644
--- a/scripts/Makefile.clean
+++ b/scripts/Makefile.clean
@@ -3,7 +3,7 @@
 # Cleaning up
 # ==========================================================================
 
-src := $(if $(VPATH),$(VPATH)/)$(obj)
+src := $(srcroot)/$(obj)
 
 PHONY := __clean
 __clean:
diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index e0842496d26e..8c1029687e2e 100644
--- a/scripts/Makefile.compiler
+++ b/scripts/Makefile.compiler
@@ -13,7 +13,7 @@ cc-cross-prefix = $(firstword $(foreach c, $(1), \
 			$(if $(shell command -v -- $(c)gcc 2>/dev/null), $(c))))
 
 # output directory for tests below
-TMPOUT = $(if $(KBUILD_EXTMOD),$(firstword $(KBUILD_EXTMOD))/).tmp_$$$$
+TMPOUT = .tmp_$$$$
 
 # try-run
 # Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 12e7c15d099c..78d2ca4f25f5 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -111,13 +111,13 @@ endif
 else
 
 # set src + obj - they may be used in the modules's Makefile
-obj := $(KBUILD_EXTMOD)
-src := $(if $(VPATH),$(VPATH)/)$(obj)
+obj := .
+src := $(srcroot)
 
 # Include the module's Makefile to find KBUILD_EXTRA_SYMBOLS
 include $(kbuild-file)
 
-output-symdump := $(KBUILD_EXTMOD)/Module.symvers
+output-symdump := Module.symvers
 
 ifeq ($(wildcard $(objtree)/Module.symvers),)
 missing-input := $(objtree)/Module.symvers
diff --git a/scripts/coccicheck b/scripts/coccicheck
index e52cb43fede6..0e6bc5a10320 100755
--- a/scripts/coccicheck
+++ b/scripts/coccicheck
@@ -80,11 +80,7 @@ command results in a shift count error.'
     NPROC=1
 else
     ONLINE=0
-    if [ "$KBUILD_EXTMOD" = "" ] ; then
-        OPTIONS="--dir $srctree $COCCIINCLUDE"
-    else
-        OPTIONS="--dir $KBUILD_EXTMOD $COCCIINCLUDE"
-    fi
+    OPTIONS="--dir $srcroot $COCCIINCLUDE"
 
     # Use only one thread per core by default if hyperthreading is enabled
     THREADS_PER_CORE=$(LANG=C lscpu | grep "Thread(s) per core: " | tr -cd "[:digit:]")
diff --git a/scripts/nsdeps b/scripts/nsdeps
index f1718cc0d700..8ca12e2b5c03 100644
--- a/scripts/nsdeps
+++ b/scripts/nsdeps
@@ -19,12 +19,6 @@ if ! { echo "$SPATCH_REQ_VERSION"; echo "$SPATCH_VERSION"; } | sort -CV ; then
 	exit 1
 fi
 
-if [ "$KBUILD_EXTMOD" ]; then
-	src_prefix=
-else
-	src_prefix=$srctree/
-fi
-
 generate_deps_for_ns() {
 	$SPATCH --very-quiet --in-place --sp-file \
 		$srctree/scripts/coccinelle/misc/add_namespace.cocci -D nsdeps -D ns=$1 $2
@@ -34,7 +28,7 @@ generate_deps() {
 	local mod=${1%.ko:}
 	shift
 	local namespaces="$*"
-	local mod_source_files=$(sed "s|^\(.*\)\.o$|${src_prefix}\1.c|" $mod.mod)
+	local mod_source_files=$(sed "s|^\(.*\)\.o$|${srcroot}/\1.c|" $mod.mod)
 
 	for ns in $namespaces; do
 		echo "Adding namespace $ns to module $mod.ko."
diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
index 7ec1f061a519..64d958ee45f3 100755
--- a/scripts/package/install-extmod-build
+++ b/scripts/package/install-extmod-build
@@ -51,6 +51,13 @@ mkdir -p "${destdir}"
 if [ "${CC}" != "${HOSTCC}" ]; then
 	echo "Rebuilding host programs with ${CC}..."
 
+	# This leverages external module building.
+	# - Clear sub_make_done to allow the top-level Makefile to redo sub-make.
+	# - Filter out --no-print-directory to print "Entering directory" logs
+	#   when Make changes the working directory.
+	unset sub_make_done
+	MAKEFLAGS=$(echo "${MAKEFLAGS}" | sed s/--no-print-directory//)
+
 	cat <<-'EOF' >  "${destdir}/Kbuild"
 	subdir-y := scripts
 	EOF
-- 
2.43.0


