Return-Path: <linux-kbuild+bounces-4610-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A28A39C3058
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Nov 2024 02:38:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2AF11C20B56
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Nov 2024 01:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A72A214EC5B;
	Sun, 10 Nov 2024 01:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iGy/5q8R"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCB814E2ED;
	Sun, 10 Nov 2024 01:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731202630; cv=none; b=PavzmLDNQESuGNErUBVw/KmxcbtPNZWe63/6aC9fwWq9D3fIdw+7rRXz8DZ/0/SiLjYfnK/QiF9X25pUzk+iFtq0q5uuk2tkZNQsh4qbZnB02DDVz/AY1TsE9BCcZ1RtEOW3j9ae45gZz/C+Jw0ZBu5zwwr3qNJnwTg0YZSupzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731202630; c=relaxed/simple;
	bh=Wf268ApS1D6QJ4TyEFsF5qod3tLLDRZrfLTApp+4NVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SrwmebUPx+M8jUjAXx00dmSIHX9bTUx35dgT5X+FS6lbD+vHsCOSyF+1d327yNMdDoICof1SG5YhALUAdtHIKrLsvMkTR9g+7pdrbQzPvU4l5qz9U8v3tpmVMntPzzMh9ktiTSVUvrJlXWmZ2VgnUMk1ISuWRxMCQgZfPU4OQqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iGy/5q8R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB330C4CED4;
	Sun, 10 Nov 2024 01:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731202630;
	bh=Wf268ApS1D6QJ4TyEFsF5qod3tLLDRZrfLTApp+4NVI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iGy/5q8R96N0gt2yyUnabXRSlHEhCzw6rpmrevpY7csp+2OFpPbxjAV7WNgsIO91K
	 kvgyshHY+E8rhnFv79EaxAn//O5gAsVUJWeEVTo7DfMTV/kG6iAyK6KYZXorXtANJe
	 VFhxXhp6o0MVTo+ZcURcN3ZL6b8GOmVEf0ZkhBNEQqhRlWAGFaHP/gD85i0O1OdC2e
	 BEYemZX0IRp3wvPoJbdoCZ3po8rDbkUe+h+1NakUH3jU99TEGpKHtLuvjdF95SduSB
	 sRIQ3zi+pBO4Ev9264K/LZ8kfA/k94+KPWup79dS4/N7ONDVRA8U6AMwsf+DGTJyXc
	 tIz0w5dT6Q9RA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	cocci@inria.fr,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH v2 07/11] kbuild: support building external modules in a separate build directory
Date: Sun, 10 Nov 2024 10:34:35 +0900
Message-ID: <20241110013649.34903-8-masahiroy@kernel.org>
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

There has been a long-standing request to support building external
modules in a separate build directory.

This commit introduces a new environment variable, KBUILD_EXTMOD_OUTPUT,
and its shorthand Make variable, MO.

A simple usage:

 $ make -C <kernel-dir> M=<module-src-dir> MO=<module-build-dir>

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
---

Changes in v2:
  - Add -I $(src) -I $(obj) for external modules as well
  - Fix a typo 'Speficies' to 'Specifies'.

 Documentation/kbuild/kbuild.rst  |  8 +++++++-
 Documentation/kbuild/modules.rst |  8 +++++++-
 Makefile                         | 22 +++++++++++++++++++---
 scripts/Makefile.host            |  8 +++-----
 scripts/Makefile.lib             |  2 --
 5 files changed, 36 insertions(+), 12 deletions(-)

diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index 1796b3eba37b..17c9f920f03d 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -137,12 +137,18 @@ Specify the output directory when building the kernel.
 This variable can also be used to point to the kernel output directory when
 building external modules against a pre-built kernel in a separate build
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
index cd5a54d91e6d..a01f3754c7fc 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -66,7 +66,10 @@ Options
 	of the kernel output directory if the kernel was built in a separate
 	build directory.)
 
-	make -C $KDIR M=$PWD
+	You can optionally pass MO= option if you want to build the modules in
+	a separate directory.
+
+	make -C $KDIR M=$PWD [MO=$BUILD_DIR]
 
 	-C $KDIR
 		The directory that contains the kernel and relevant build
@@ -80,6 +83,9 @@ Options
 		directory where the external module (kbuild file) is
 		located.
 
+	MO=$BUILD_DIR
+		Specifies a separate output directory for the external module.
+
 Targets
 -------
 
diff --git a/Makefile b/Makefile
index c7eeb10455b6..38ce19747728 100644
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
 
@@ -187,7 +191,7 @@ ifdef KBUILD_EXTMOD
     else
         objtree := $(CURDIR)
     endif
-    output := $(KBUILD_EXTMOD)
+    output := $(or $(KBUILD_EXTMOD_OUTPUT),$(KBUILD_EXTMOD))
     # KBUILD_EXTMOD might be a relative path. Remember its absolute path before
     # Make changes the working directory.
     srcroot := $(realpath $(KBUILD_EXTMOD))
@@ -555,7 +559,7 @@ USERINCLUDE    := \
 LINUXINCLUDE    := \
 		-I$(srctree)/arch/$(SRCARCH)/include \
 		-I$(objtree)/arch/$(SRCARCH)/include/generated \
-		$(if $(building_out_of_srctree),-I$(srctree)/include) \
+		-I$(srctree)/include \
 		-I$(objtree)/include \
 		$(USERINCLUDE)
 
@@ -645,6 +649,7 @@ quiet_cmd_makefile = GEN     Makefile
 	} > Makefile
 
 outputmakefile:
+ifeq ($(KBUILD_EXTMOD),)
 	@if [ -f $(srctree)/.config -o \
 		 -d $(srctree)/include/config -o \
 		 -d $(srctree)/arch/$(SRCARCH)/include/generated ]; then \
@@ -654,7 +659,16 @@ outputmakefile:
 		echo >&2 "***"; \
 		false; \
 	fi
-	$(Q)ln -fsn $(srctree) source
+else
+	@if [ -f $(srcroot)/modules.order ]; then \
+		echo >&2 "***"; \
+		echo >&2 "*** The external module source tree is not clean."; \
+		echo >&2 "*** Please run 'make -C $(abs_srctree) M=$(realpath $(srcroot)) clean'"; \
+		echo >&2 "***"; \
+		false; \
+	fi
+endif
+	$(Q)ln -fsn $(srcroot) source
 	$(call cmd,makefile)
 	$(Q)test -e .gitignore || \
 	{ echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
@@ -1940,6 +1954,8 @@ KBUILD_MODULES := 1
 
 endif
 
+prepare: outputmakefile
+
 # Preset locale variables to speed up the build process. Limit locale
 # tweaks to this spot to avoid wrong language settings when running
 # make menuconfig etc.
diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index e01c13a588dd..c1dedf646a39 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -96,12 +96,10 @@ hostrust_flags = --out-dir $(dir $@) --emit=dep-info=$(depfile) \
                  $(KBUILD_HOSTRUSTFLAGS) $(HOST_EXTRARUSTFLAGS) \
                  $(HOSTRUSTFLAGS_$(target-stem))
 
-# $(objtree)/$(obj) for including generated headers from checkin source files
-ifeq ($(KBUILD_EXTMOD),)
+# $(obj) for including generated headers from checkin source files
 ifdef building_out_of_srctree
-hostc_flags   += -I $(objtree)/$(obj)
-hostcxx_flags += -I $(objtree)/$(obj)
-endif
+hostc_flags   += -I $(obj)
+hostcxx_flags += -I $(obj)
 endif
 
 #####
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index e7859ad90224..5660dfc9ed36 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -213,13 +213,11 @@ endif
 
 # $(src) for including checkin headers from generated source files
 # $(obj) for including generated headers from checkin source files
-ifeq ($(KBUILD_EXTMOD),)
 ifdef building_out_of_srctree
 _c_flags   += $(addprefix -I, $(src) $(obj))
 _a_flags   += $(addprefix -I, $(src) $(obj))
 _cpp_flags += $(addprefix -I, $(src) $(obj))
 endif
-endif
 
 # If $(is-kernel-object) is 'y', this object will be linked to vmlinux or modules
 is-kernel-object = $(or $(part-of-builtin),$(part-of-module))
-- 
2.43.0


