Return-Path: <linux-kbuild+bounces-3604-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB7797B150
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 16:21:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15C711C2223D
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 14:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC001940A9;
	Tue, 17 Sep 2024 14:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GbAuieaB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E30F194090;
	Tue, 17 Sep 2024 14:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726582689; cv=none; b=B6qp/xjBZx2V/fUsZezKx+0o7BlfjfF5526RAh+Ids1YaKtABZoZbJQaZtP3RRLZC3gfl4N2CAzj1yWxsBLOAXlfrWR4fxczRxGbcK9YpRubNW6gLvjXRIR01gPowORw8DIXwjPyhul/BxepK8KNQPbcfvszjwQdaHS0lge3cHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726582689; c=relaxed/simple;
	bh=rC19NpWl2LrUP5KgEEq6tX2ykKFGea+wJn+TOwWQ65k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F4V2dOw3ffCyebSz9Vtz30KEYXvmm6CXz8AtBlF1halb20XY2L07TZ1Yy4h75SnRefwvS8jbzhyK7OXMC80xo6KKOcP+T4DltDQldaT+jHRqeIoTnMvQepvUhJKdIG6akyi2Elqnt+Ke+CvZSXXpjrnMfNS+W5VVX9rB1MNgmWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GbAuieaB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31088C4CEC5;
	Tue, 17 Sep 2024 14:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726582688;
	bh=rC19NpWl2LrUP5KgEEq6tX2ykKFGea+wJn+TOwWQ65k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GbAuieaBOcq4UwSovs/7O1oA27Zl7P2iltGJJDnuucQLOQNdUvauWS1hVjHprHRle
	 JQ3tM/EZHYnvdtRUuxD++OAD3x7sXA8lSQPoy/lQaoEr0cU2kT3KF9/NlebINxnF/z
	 cWnjBSuxO7amFrryjyIt30Tef3/gMdrdXowud6n50pkJwrI5BxhXyh4KFJ4GWZaXsK
	 xhLScUhTFfo1lEuo5OD5nT4jVW59mn1vB+/LgVXbIhDrbMvXaChy5Acc+a8VGYr7It
	 a+931lABvTmqrHNVsLmE6z2sfQjXnA0l7yBBoQeZaX2B/YHgVquHog9LmPHnlgkNtW
	 2uZKR08uevCWg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 17/23] kbuild: build external modules in their directory
Date: Tue, 17 Sep 2024 23:16:45 +0900
Message-ID: <20240917141725.466514-18-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240917141725.466514-1-masahiroy@kernel.org>
References: <20240917141725.466514-1-masahiroy@kernel.org>
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

 Documentation/dev-tools/coccinelle.rst | 19 +++++-------
 Makefile                               | 40 +++++++++++++++++---------
 rust/Makefile                          |  4 +--
 scripts/Makefile.compiler              |  2 +-
 scripts/Makefile.modpost               |  6 ++--
 scripts/coccicheck                     |  6 ++--
 scripts/package/install-extmod-build   |  7 +++++
 7 files changed, 49 insertions(+), 35 deletions(-)

diff --git a/Documentation/dev-tools/coccinelle.rst b/Documentation/dev-tools/coccinelle.rst
index 535ce126fb4f..80c83ce0babc 100644
--- a/Documentation/dev-tools/coccinelle.rst
+++ b/Documentation/dev-tools/coccinelle.rst
@@ -250,25 +250,20 @@ variables for .cocciconfig is as follows:
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
+    if [ "$VPATH" ] ; then
+        OPTIONS="--dir $VPATH $COCCIINCLUDE"
     else
-        OPTIONS="--dir $KBUILD_EXTMOD $COCCIINCLUDE"
+        OPTIONS="--dir . $COCCIINCLUDE"
     fi
 
-KBUILD_EXTMOD is set when an explicit target with M= is used. For both cases
-the spatch ``--dir`` argument is used, as such third rule applies when whether
-M= is used or not, and when M= is used the target directory can have its own
-.cocciconfig file. When M= is not passed as an argument to coccicheck the
-target directory is the same as the directory from where spatch was called.
+When an explicit target is executed with a separate output directory, VPATH is
+set to the target source directory. The third rule ensures the spatch reads the
+.cocciconfig from the target directory. When M= is used, the external module
+directory can have its own.cocciconfig file.
 
 If not using the kernel's coccicheck target, keep the above precedence
 order logic of .cocciconfig reading. If using the kernel's coccicheck target,
diff --git a/Makefile b/Makefile
index 7a76452049ea..4db22c3a8555 100644
--- a/Makefile
+++ b/Makefile
@@ -180,7 +180,20 @@ ifeq ("$(origin O)", "command line")
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
+else
+    objtree := .
+    output := $(KBUILD_OUTPUT)
+endif
+
+export objtree
 
 # Do we want to change the working directory?
 ifneq ($(output),)
@@ -248,8 +261,6 @@ ifneq ($(KBUILD_ABS_SRCTREE),)
 srctree := $(abs_srctree)
 endif
 
-objtree		:= .
-
 VPATH		:=
 
 ifeq ($(KBUILD_EXTMOD),)
@@ -258,7 +269,7 @@ VPATH		:= $(srctree)
 endif
 endif
 
-export building_out_of_srctree srctree objtree VPATH
+export building_out_of_srctree srctree VPATH
 
 # To make sure we do not include .config for any of the *config targets
 # catch them early, and hand them over to scripts/kconfig/Makefile
@@ -708,7 +719,7 @@ endif
 # in addition to whatever we do anyway.
 # Just "make" or "make all" shall build modules as well
 
-ifneq ($(filter all modules nsdeps %compile_commands.json clang-%,$(MAKECMDGOALS)),)
+ifneq ($(filter all modules nsdeps compile_commands.json clang-%,$(MAKECMDGOALS)),)
   KBUILD_MODULES := 1
 endif
 
@@ -1091,7 +1102,7 @@ export MODLIB
 
 PHONY += prepare0
 
-export extmod_prefix = $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/)
+export extmod_prefix =
 export MODORDER := $(extmod_prefix)modules.order
 export MODULES_NSDEPS := $(extmod_prefix)modules.nsdeps
 
@@ -1789,14 +1800,10 @@ filechk_kernel.release = echo $(KERNELRELEASE)
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
@@ -1938,7 +1945,7 @@ $(clean-dirs):
 
 clean: $(clean-dirs)
 	$(call cmd,rmfiles)
-	@find $(or $(KBUILD_EXTMOD), .) $(RCS_FIND_IGNORE) \
+	@find . $(RCS_FIND_IGNORE) \
 		\( -name '*.[aios]' -o -name '*.rsi' -o -name '*.ko' -o -name '.*.cmd' \
 		-o -name '*.ko.*' \
 		-o -name '*.dtb' -o -name '*.dtbo' \
@@ -1971,7 +1978,12 @@ tags TAGS cscope gtags: FORCE
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
index 8de3ebba9551..8a686ffbd3a2 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -350,8 +350,8 @@ rust-analyzer:
 	$(Q)$(srctree)/scripts/generate_rust_analyzer.py \
 		--cfgs='core=$(core-cfgs)' --cfgs='alloc=$(alloc-cfgs)' \
 		$(realpath $(srctree)) $(realpath $(objtree)) \
-		$(rustc_sysroot) $(RUST_LIB_SRC) $(KBUILD_EXTMOD) > \
-		$(if $(KBUILD_EXTMOD),$(extmod_prefix),$(objtree))/rust-project.json
+		$(rustc_sysroot) $(RUST_LIB_SRC) $(if $(KBUILD_EXTMOD),$(realpath $(or $(VPATH),.))) \
+		> rust-project.json
 
 redirect-intrinsics = \
 	__addsf3 __eqsf2 __extendsfdf2 __gesf2 __lesf2 __ltsf2 __mulsf3 __nesf2 __truncdfsf2 __unordsf2 \
diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index 92be0c9a13ee..4b80b525d386 100644
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
index 12e7c15d099c..ccca705bc389 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -111,13 +111,13 @@ endif
 else
 
 # set src + obj - they may be used in the modules's Makefile
-obj := $(KBUILD_EXTMOD)
-src := $(if $(VPATH),$(VPATH)/)$(obj)
+obj := .
+src := $(or $(VPATH),.)
 
 # Include the module's Makefile to find KBUILD_EXTRA_SYMBOLS
 include $(kbuild-file)
 
-output-symdump := $(KBUILD_EXTMOD)/Module.symvers
+output-symdump := Module.symvers
 
 ifeq ($(wildcard $(objtree)/Module.symvers),)
 missing-input := $(objtree)/Module.symvers
diff --git a/scripts/coccicheck b/scripts/coccicheck
index e52cb43fede6..6272fe4814cd 100755
--- a/scripts/coccicheck
+++ b/scripts/coccicheck
@@ -80,10 +80,10 @@ command results in a shift count error.'
     NPROC=1
 else
     ONLINE=0
-    if [ "$KBUILD_EXTMOD" = "" ] ; then
-        OPTIONS="--dir $srctree $COCCIINCLUDE"
+    if [ "${VPATH+set}" ] ; then
+        OPTIONS="--dir $VPATH $COCCIINCLUDE"
     else
-        OPTIONS="--dir $KBUILD_EXTMOD $COCCIINCLUDE"
+        OPTIONS="--dir . $COCCIINCLUDE"
     fi
 
     # Use only one thread per core by default if hyperthreading is enabled
diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
index d2c9cacecc0c..5d7d79a23bf9 100755
--- a/scripts/package/install-extmod-build
+++ b/scripts/package/install-extmod-build
@@ -53,6 +53,13 @@ mkdir -p "${destdir}"
 if [ "${CC}" != "${HOSTCC}" ] && is_enabled CONFIG_CC_CAN_LINK; then
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


