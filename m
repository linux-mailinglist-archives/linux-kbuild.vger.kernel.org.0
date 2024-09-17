Return-Path: <linux-kbuild+bounces-3606-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4493997B154
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 16:22:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA5931F21F15
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 14:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 669E7194A53;
	Tue, 17 Sep 2024 14:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KJdjwRDY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308B9194A4B;
	Tue, 17 Sep 2024 14:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726582693; cv=none; b=gXzTizwG+7W1iB07M3jennmgt0Q9Ns1DBi/Ohdk2khCqsj2IBLVQQTkRcxJ323c2b5ZGgydGfmlfV9UMkZaNnFt5miwAE6nE4bwi97EI/ZRQEcIAccuSbnE1EMq/m4BSoUI6XOorhCGlBvyHlA633a6nJbwYty8HsRYIszsNMo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726582693; c=relaxed/simple;
	bh=FI3kBAdkWmeCKCnshcw4HjVMuzXsQc84gzzbOu4ug78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NF507QhGFtfLEw+9xoSmtE476SYIteTEvu1xk6NgPCjX1Wr9cBDcV8zo7Vc5JP0L68x/ZZDP0Vth6G4DjEPzb5nVpEC3wv3pMlEIDf+C+YTmY5iMRNfnjSJ7FEl+KuP2SGdw2w0s8P7IguG6EtiTlMbxuoLqqx8X+JKfYbFoEaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KJdjwRDY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A21C4CECD;
	Tue, 17 Sep 2024 14:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726582693;
	bh=FI3kBAdkWmeCKCnshcw4HjVMuzXsQc84gzzbOu4ug78=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KJdjwRDYVqIaBYqJlmBD1QiMZBvwzt8Y03mjrrThgG1wa4NmXiSaI1c6ZazZ9AOcN
	 bKKUWRAID9yfu2nltrNlxbFBoLLU35FGEXOUMhmlkykUXWvBYWmR/C3BiAIKnSRJGh
	 Z35xx6zpvPycfYktWKWHDGVRBLQEifxRAd/xZd0HyOnMx1Sz69T3iRdH9KmYDGJ6ck
	 +nX6Dvck8jhQEN/k8MMEouFICumxRFMlc2zLOTLxQ0oOWu5mWaMAFyhQ3N8eLBiwwg
	 k5+heFtOIy6Y63S1bjDPpr1KsTW0E04AOepjB2t+ZntAQr/Z2vsx4RKv8ZSKrxc3TU
	 Wa12r9NLkNXDA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 19/23] kbuild: support building external modules in a separate build directory
Date: Tue, 17 Sep 2024 23:16:47 +0900
Message-ID: <20240917141725.466514-20-masahiroy@kernel.org>
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

There has been a long-standing request to support building external
modules in a separate build directory.

This commit introduces a new environment variable, KBUILD_EXTMOD_OUTPUT,
and its shorthand Make variable, MO.

A simple usage:

 $ make -C <kernel-dir> M=<module-src-dir> MO=<module-build-dir>

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/kbuild.rst  |  8 +++++-
 Documentation/kbuild/modules.rst |  5 +++-
 Makefile                         | 44 +++++++++++++++++++++++---------
 3 files changed, 43 insertions(+), 14 deletions(-)

diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index 716f6fb70829..66a9dc44ea28 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -132,12 +132,18 @@ Specify the output directory when building the kernel.
 This variable can also be used to point to the kernel output directory when
 building external modules using kernel build artifacts in a separate build
 directory. Please note that this does NOT specify the output directory for the
-external modules themselves.
+external modules themselves. (Use KBUILD_EXTMOD_OUTPUT for that purpose.)
 
 The output directory can also be specified using "O=...".
 
 Setting "O=..." takes precedence over KBUILD_OUTPUT.
 
+KBUILD_EXTMOD_OUTPUT
+--------------------
+Specify the output directory for external modules.
+
+Setting "MO=..." takes precedence over KBUILD_EXTMOD_OUTPUT.
+
 KBUILD_EXTRA_WARN
 -----------------
 Specify the extra build checks. The same value can be assigned by passing
diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index 3a6e7bdc0889..03347e13eeb5 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -95,7 +95,7 @@ executed to make module versioning work.
 	of the kernel output directory if the kernel was built in a separate
 	build directory.)
 
-	make -C $KDIR M=$PWD
+	make -C $KDIR M=$PWD [MO=$BUILD_DIR]
 
 	-C $KDIR
 		The directory that contains the kernel and relevant build
@@ -109,6 +109,9 @@ executed to make module versioning work.
 		directory where the external module (kbuild file) is
 		located.
 
+	MO=$BUILD_DIR
+		Speficies a separate output directory for the external module.
+
 2.3 Targets
 ===========
 
diff --git a/Makefile b/Makefile
index 9fbf7ef6e394..b654baa0763a 100644
--- a/Makefile
+++ b/Makefile
@@ -134,6 +134,10 @@ ifeq ("$(origin M)", "command line")
   KBUILD_EXTMOD := $(M)
 endif
 
+ifeq ("$(origin MO)", "command line")
+  KBUILD_EXTMOD_OUTPUT := $(MO)
+endif
+
 $(if $(word 2, $(KBUILD_EXTMOD)), \
 	$(error building multiple external modules is not supported))
 
@@ -187,7 +191,11 @@ ifdef KBUILD_EXTMOD
     else
         objtree := $(CURDIR)
     endif
-    output := $(KBUILD_EXTMOD)
+    output := $(or $(KBUILD_EXTMOD_OUTPUT),$(KBUILD_EXTMOD))
+    # KBUILD_EXTMOD might be a relative path. Remember its absolute path before
+    # Make changes the working directory.
+    export abs_extmodtree := $(realpath $(KBUILD_EXTMOD))
+    $(if $(abs_extmodtree),,$(error specified external module directory "$(KBUILD_EXTMOD)" does not exist))
 else
     objtree := .
     output := $(KBUILD_OUTPUT)
@@ -246,7 +254,6 @@ else # need-sub-make
 ifeq ($(abs_srctree),$(CURDIR))
         # building in the source tree
         srctree := .
-	building_out_of_srctree :=
 else
         ifeq ($(abs_srctree)/,$(dir $(CURDIR)))
                 # building in a subdirectory of the source tree
@@ -254,22 +261,23 @@ else
         else
                 srctree := $(abs_srctree)
         endif
-	building_out_of_srctree := 1
 endif
 
 ifneq ($(KBUILD_ABS_SRCTREE),)
 srctree := $(abs_srctree)
 endif
 
-VPATH		:=
+export srctree
 
-ifeq ($(KBUILD_EXTMOD),)
-ifdef building_out_of_srctree
-VPATH		:= $(srctree)
-endif
-endif
+_vpath = $(or $(abs_extmodtree),$(srctree))
 
-export building_out_of_srctree srctree VPATH
+ifeq ($(realpath $(_vpath)),$(CURDIR))
+building_out_of_srctree :=
+VPATH :=
+else
+export building_out_of_srctree := 1
+export VPATH := $(_vpath)
+endif
 
 # To make sure we do not include .config for any of the *config targets
 # catch them early, and hand them over to scripts/kconfig/Makefile
@@ -550,7 +558,7 @@ USERINCLUDE    := \
 LINUXINCLUDE    := \
 		-I$(srctree)/arch/$(SRCARCH)/include \
 		-I$(objtree)/arch/$(SRCARCH)/include/generated \
-		$(if $(building_out_of_srctree),-I$(srctree)/include) \
+		-I$(srctree)/include \
 		-I$(objtree)/include \
 		$(USERINCLUDE)
 
@@ -640,6 +648,7 @@ quiet_cmd_makefile = GEN     Makefile
 	} > Makefile
 
 outputmakefile:
+ifeq ($(KBUILD_EXTMOD),)
 	@if [ -f $(srctree)/.config -o \
 		 -d $(srctree)/include/config -o \
 		 -d $(srctree)/arch/$(SRCARCH)/include/generated ]; then \
@@ -649,7 +658,16 @@ outputmakefile:
 		echo >&2 "***"; \
 		false; \
 	fi
-	$(Q)ln -fsn $(srctree) source
+else
+	@if [ -f $(KBUILD_EXTMOD)/modules.order ]; then \
+		echo >&2 "***"; \
+		echo >&2 "*** The external module source tree is not clean."; \
+		echo >&2 "*** Please run 'make -C $(abs_srctree) M=$(realpath $(KBUILD_EXTMOD)) clean'"; \
+		echo >&2 "***"; \
+		false; \
+	fi
+endif
+	$(Q)ln -fsn $(_vpath) source
 	$(call cmd,makefile)
 	$(Q)test -e .gitignore || \
 	{ echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
@@ -1926,6 +1944,8 @@ KBUILD_MODULES := 1
 
 endif
 
+prepare: outputmakefile
+
 # Preset locale variables to speed up the build process. Limit locale
 # tweaks to this spot to avoid wrong language settings when running
 # make menuconfig etc.
-- 
2.43.0


