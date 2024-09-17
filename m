Return-Path: <linux-kbuild+bounces-3610-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A5C97B15C
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 16:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 278C7B268D9
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 14:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE7119752C;
	Tue, 17 Sep 2024 14:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qFZRWt3b"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628DE1974FE;
	Tue, 17 Sep 2024 14:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726582702; cv=none; b=rhe6V0Yp69d5cWeBcd4NlJ1QuW0vERgN3H3XSjciFnsbfyctVM7dtaVNxRgpxyl98VCg/BSPJ4CzfzQfldqnGKu/tnQNk4Ud3gZTwm6TzkN5rvSAV5Yt0nNDfyVgFBPzBfetqWPSBatKc97V2b+eYSuYcOAELjbpYM/Yo/3myxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726582702; c=relaxed/simple;
	bh=pVqPlXHwRAmKMtMxmsQTphSqu9eVJ5zq5Yus+QdHq+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OFrJwUrqpPD6fKVonu1Kn2t2M1FXbI4bFHyjAWC4t2UlhYmn7b7P1xiRk28C02mxxNRLSFVYCBZg0WLuEBFn0GKwGTSF59xeqP8pesfp0F4ZMKfL7tBnBHivDTJqiceGcHfN5tNUGgpdhfutXNKnwaszgZRRzTaOP7K3AqshpeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qFZRWt3b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32AF8C4CEC5;
	Tue, 17 Sep 2024 14:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726582702;
	bh=pVqPlXHwRAmKMtMxmsQTphSqu9eVJ5zq5Yus+QdHq+Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qFZRWt3bLzlLXEazL48GBC+oGSAyKzF5TRwsK3RJi9kuKr7Wm+eTzqSILwkzH4l7t
	 e7GF3zChXVOv/eL2+dq17FaFYgpGuKlqnTSgI3C77zxkQR6k6IC58Q6b199ewt+4iS
	 9xeqRkcEDLFM3aAt0l4AQhmXiAYQ2zGipdr3A2ovuX3yoIikkyf/mmTbttthFL9trF
	 QxYX00wpSikIluRDyIqNdXjqKfXsLnn3FKCGw8vNIJwTbUhN3Xv0bv5c5Vfi1kcLjc
	 cHDjtsj1NBLne3wa4+AI/4pXbIqjg4cGKByuzP3ssqKQil2NW8qSc79WJoWbv1qVz8
	 Zsvvwl0Jyw0Kw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 23/23] kbuild: allow to start building external module in any directory
Date: Tue, 17 Sep 2024 23:16:51 +0900
Message-ID: <20240917141725.466514-24-masahiroy@kernel.org>
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

Unless an explicit O= option is provided, external module builds must
start from the kernel directory.

This can be achieved by using the -C option:

  $ make -C /path/to/kernel M=/path/to/external/module

This commit allows starting external module builds from any directory,
so you can also do the following:

  $ make -f /path/to/kernel/Makefile M=/path/to/external/module

The key difference is that the -C option changes the working directory
and parses the Makefile located there, while the -f option only
specifies the Makefile to use.

As shown in the examples in Documentation/kbuild/modules.rst, external
modules usually have a wrapper Makefile that allows you to build them
without specifying any make arguments. The Makefile typically contains
a rule as follows:

    KDIR ?= /path/to/kernel
    default:
            $(MAKE) -C $(KDIR) M=$(CURDIR) $(MAKECMDGOALS)

The log will appear as follows:

    $ make
    make -C /path/to/kernel M=/path/to/external/module
    make[1]: Entering directory '/path/to/kernel'
    make[2]: Entering directory '/path/to/exernal/module'
      CC [M]  helloworld.o
      MODPOST Module.symvers
      CC [M]  helloworld.mod.o
      CC [M]  .module-common.o
      LD [M]  helloworld.ko
    make[2]: Leaving directory '/path/to/exernal/module'
    make[1]: Leaving directory '/path/to/kernel'

This changes the working directory twice because the -C option first
switches to the kernel directory, and then Kbuild internally recurses
back to the external module directory.

With this commit, the wrapper Makefile can directly include the kernel
Makefile:

    KDIR ?= /path/to/kernel
    export KBUILD_EXTMOD = $(CURDIR)
    include $(KDIR)/Makefile

This avoids unnecessary sub-make invocations:

    $ make
      CC [M]  helloworld.o
      MODPOST Module.symvers
      CC [M]  helloworld.mod.o
      CC [M]  .module-common.o
      LD [M]  helloworld.ko

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/modules.rst | 21 +++++++++++++++++++++
 Makefile                         |  8 ++++++--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index 03347e13eeb5..5610cfa426bb 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -88,6 +88,12 @@ executed to make module versioning work.
 
 		$ make -C /lib/modules/`uname -r`/build M=$PWD modules_install
 
+	Starting from Linux 6.13, you can use the -f option instead of -C. This
+	will avoid unnecessary change of the working directory. The external
+	module will be output to the directory where you invoke make.
+
+		$ make -f /lib/modules/`uname -r`/build/Makefile M=$PWD
+
 2.2 Options
 ===========
 
@@ -246,6 +252,21 @@ module 8123.ko, which is built from the following files::
 	consisting of several hundred lines, and here it really pays
 	off to separate the kbuild part from the rest.
 
+	Linux 6.13 and later support another way. The external module Makefile
+	can include the kernel Makefile directly, rather than invoking sub Make.
+
+	Example 3::
+
+		--> filename: Kbuild
+		obj-m  := 8123.o
+		8123-y := 8123_if.o 8123_pci.o
+
+		--> filename: Makefile
+		KDIR ?= /lib/modules/`uname -r`/build
+		export KBUILD_EXTMOD = $(CURDIR)
+		include $(KDIR)/Makefile
+
+
 3.4 Building Multiple Modules
 =============================
 
diff --git a/Makefile b/Makefile
index 81603a50c757..88c160ac7b3c 100644
--- a/Makefile
+++ b/Makefile
@@ -189,9 +189,13 @@ ifdef KBUILD_EXTMOD
         objtree := $(realpath $(KBUILD_OUTPUT))
         $(if $(objtree),,$(error specified kernel directory "$(KBUILD_OUTPUT)" does not exist))
     else
-        objtree := $(CURDIR)
+        objtree := $(abs_srctree)
     endif
-    output := $(or $(KBUILD_EXTMOD_OUTPUT),$(KBUILD_EXTMOD))
+    # If Make is invoked from the kernel directory (either kernel
+    # source directory or kernel build directory), external modules
+    # are built in $(KBUILD_EXTMOD) for backward compatibility,
+    # otherwise, built in the current directory.
+    output := $(or $(KBUILD_EXTMOD_OUTPUT),$(if $(filter $(CURDIR),$(objtree) $(abs_srctree)),$(KBUILD_EXTMOD)))
     # KBUILD_EXTMOD might be a relative path. Remember its absolute path before
     # Make changes the working directory.
     export abs_extmodtree := $(realpath $(KBUILD_EXTMOD))
-- 
2.43.0


