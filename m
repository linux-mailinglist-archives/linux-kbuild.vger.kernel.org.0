Return-Path: <linux-kbuild+bounces-3631-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5A897CD29
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Sep 2024 19:38:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FC7B1C21828
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Sep 2024 17:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7C91A2C0E;
	Thu, 19 Sep 2024 17:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nX2dcIoW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222671A287C;
	Thu, 19 Sep 2024 17:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726767469; cv=none; b=iZ8IPHI6/Hn7g7qm0Ylt6k0PZ9nxZORcecHKvAd3D96xNSsCRiexAI8GE31AeyCEMRyqsUH4MtyK5QiCTNt/ecJtgAISBfXfOW4EA99F8tWmzxlasF8G6qlTUWYh5HSqyGx33f38XKwNzsyoTcfraSfK9XQDr0wnkd2JTOMRgPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726767469; c=relaxed/simple;
	bh=I5cwRWTXa4jyJfEbVmnWyX/hYKFsekUA+7vxG+tn8Wc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mAJyRCFZwnAKB9BIaDVx5WWffJ/vqCSLTt6l6/sO+y789kIhKGfhs4EY8FRCvnDTUaLRB+oM63eTcP12RoSYY9LSrobiQLHav22Y8H5A9klcfm6YCEkMdmsiid1w7dLi7ar1mzlPK5UGrCY79/Nq+9xTGq1dEwVaD9K86i1GOX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nX2dcIoW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EF09C4CEC5;
	Thu, 19 Sep 2024 17:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726767468;
	bh=I5cwRWTXa4jyJfEbVmnWyX/hYKFsekUA+7vxG+tn8Wc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nX2dcIoW3boOEqx6F2EfW1dGUyBHlVOSp4Y76kfWpeU8S2H5uRW0aClTdB6dgU36K
	 JBquApPcB20SKNyNn16RKoiacJaaWrfff9/Zuu7Cto3Q9cmUQbZXiKd43CCiya6N+x
	 qWXWaJFoPdtEvldpwZz6ZSfdrHZxSAXizciQ9zPRbztjdGOi++tPXpyXoJjtLmajQg
	 A8Iz+1sZ8c9T+god4rxrnhFAfev+HrldsKGXOFCxD5E3g8sbXCAkqSGolpBPcrKYc4
	 idKOyesYxKVeWCNJO/ezFv1BAoKZW0sWQUak/IPHFeUFdzLzJI9cDs8Wibv8Kky26F
	 /8/nY+tg93alg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 2/5] kbuild: doc: drop section numbering, use references in modules.rst
Date: Fri, 20 Sep 2024 02:37:15 +0900
Message-ID: <20240919173740.1080501-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240919173740.1080501-1-masahiroy@kernel.org>
References: <20240919173740.1080501-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do similar to commit 1a4c1c9df72e ("docs/kbuild/makefiles: drop section
numbering, use references").

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - New patch

 Documentation/kbuild/modules.rst | 101 ++++++++++++++++---------------
 1 file changed, 51 insertions(+), 50 deletions(-)

diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index 4f67e6a27afe..c4a0598aa276 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -4,8 +4,8 @@ Building External Modules
 
 This document describes how to build an out-of-tree kernel module.
 
-1. Introduction
-===============
+Introduction
+============
 
 "kbuild" is the build system used by the Linux kernel. Modules must use
 kbuild to stay compatible with changes in the build infrastructure and
@@ -19,11 +19,11 @@ in building out-of-tree (or "external") modules. The author of an
 external module should supply a makefile that hides most of the
 complexity, so one only has to type "make" to build the module. This is
 easily accomplished, and a complete example will be presented in
-section 3.
+section `Creating a Kbuild File for an External Module`_.
 
 
-2. How to Build External Modules
-================================
+How to Build External Modules
+=============================
 
 To build external modules, you must have a prebuilt kernel available
 that contains the configuration and header files used in the build.
@@ -40,8 +40,8 @@ NOTE: "modules_prepare" will not build Module.symvers even if
 CONFIG_MODVERSIONS is set; therefore, a full kernel build needs to be
 executed to make module versioning work.
 
-2.1 Command Syntax
-==================
+Command Syntax
+--------------
 
 	The command to build an external module is::
 
@@ -59,8 +59,8 @@ executed to make module versioning work.
 
 		$ make -C /lib/modules/`uname -r`/build M=$PWD modules_install
 
-2.2 Options
-===========
+Options
+-------
 
 	($KDIR refers to the path of the kernel source directory.)
 
@@ -77,8 +77,8 @@ executed to make module versioning work.
 		directory where the external module (kbuild file) is
 		located.
 
-2.3 Targets
-===========
+Targets
+-------
 
 	When building an external module, only a subset of the "make"
 	targets are available.
@@ -100,7 +100,8 @@ executed to make module versioning work.
 	modules_install
 		Install the external module(s). The default location is
 		/lib/modules/<kernel_release>/updates/, but a prefix may
-		be added with INSTALL_MOD_PATH (discussed in section 5).
+		be added with INSTALL_MOD_PATH (discussed in section
+		`Module Installation`_).
 
 	clean
 		Remove all generated files in the module directory only.
@@ -108,8 +109,8 @@ executed to make module versioning work.
 	help
 		List the available targets for external modules.
 
-2.4 Building Separate Files
-===========================
+Building Separate Files
+-----------------------
 
 	It is possible to build single files that are part of a module.
 	This works equally well for the kernel, a module, and even for
@@ -123,8 +124,8 @@ executed to make module versioning work.
 		make -C $KDIR M=$PWD ./
 
 
-3. Creating a Kbuild File for an External Module
-================================================
+Creating a Kbuild File for an External Module
+=============================================
 
 In the last section we saw the command to build a module for the
 running kernel. The module is not actually built, however, because a
@@ -153,8 +154,8 @@ module 8123.ko, which is built from the following files::
 	8123_pci.c
 	8123_bin.o_shipped	<= Binary blob
 
-3.1 Shared Makefile
--------------------
+Shared Makefile
+---------------
 
 	An external module always includes a wrapper makefile that
 	supports building the module using "make" with no arguments.
@@ -192,8 +193,8 @@ module 8123.ko, which is built from the following files::
 	line; the second pass is by the kbuild system, which is
 	initiated by the parameterized "make" in the default target.
 
-3.2 Separate Kbuild File and Makefile
--------------------------------------
+Separate Kbuild File and Makefile
+---------------------------------
 
 	Kbuild will first look for a file named "Kbuild", and if it is not
 	found, it will then look for "Makefile". Utilizing a "Kbuild" file
@@ -220,8 +221,8 @@ module 8123.ko, which is built from the following files::
 	consisting of several hundred lines, and here it really pays
 	off to separate the kbuild part from the rest.
 
-3.3 Binary Blobs
-----------------
+Binary Blobs
+------------
 
 	Some external modules need to include an object file as a blob.
 	kbuild has support for this, but requires the blob file to be
@@ -240,8 +241,8 @@ module 8123.ko, which is built from the following files::
 	files and the binary file, kbuild will pick up different rules
 	when creating the object file for the module.
 
-3.4 Building Multiple Modules
-=============================
+Building Multiple Modules
+-------------------------
 
 	kbuild supports building multiple modules with a single build
 	file. For example, if you wanted to build two modules, foo.ko
@@ -254,8 +255,8 @@ module 8123.ko, which is built from the following files::
 	It is that simple!
 
 
-4. Include Files
-================
+Include Files
+=============
 
 Within the kernel, header files are kept in standard locations
 according to the following rule:
@@ -273,8 +274,8 @@ according to the following rule:
 	      include/scsi; and architecture specific headers are located
 	      under arch/$(SRCARCH)/include/.
 
-4.1 Kernel Includes
--------------------
+Kernel Includes
+---------------
 
 	To include a header file located under include/linux/, simply
 	use::
@@ -284,8 +285,8 @@ according to the following rule:
 	kbuild will add options to "gcc" so the relevant directories
 	are searched.
 
-4.2 Single Subdirectory
------------------------
+Single Subdirectory
+-------------------
 
 	External modules tend to place header files in a separate
 	include/ directory where their source is located, although this
@@ -302,8 +303,8 @@ according to the following rule:
 		ccflags-y := -I $(src)/include
 		8123-y := 8123_if.o 8123_pci.o 8123_bin.o
 
-4.3 Several Subdirectories
---------------------------
+Several Subdirectories
+----------------------
 
 	kbuild can handle files that are spread over several directories.
 	Consider the following example::
@@ -342,8 +343,8 @@ according to the following rule:
 	file is located.
 
 
-5. Module Installation
-======================
+Module Installation
+===================
 
 Modules which are included in the kernel are installed in the
 directory:
@@ -354,8 +355,8 @@ And external modules are installed in:
 
 	/lib/modules/$(KERNELRELEASE)/updates/
 
-5.1 INSTALL_MOD_PATH
---------------------
+INSTALL_MOD_PATH
+----------------
 
 	Above are the default directories but as always some level of
 	customization is possible. A prefix can be added to the
@@ -369,8 +370,8 @@ And external modules are installed in:
 	calling "make." This has effect when installing both in-tree
 	and out-of-tree modules.
 
-5.2 INSTALL_MOD_DIR
--------------------
+INSTALL_MOD_DIR
+---------------
 
 	External modules are by default installed to a directory under
 	/lib/modules/$(KERNELRELEASE)/updates/, but you may wish to
@@ -383,8 +384,8 @@ And external modules are installed in:
 		=> Install dir: /lib/modules/$(KERNELRELEASE)/gandalf/
 
 
-6. Module Versioning
-====================
+Module Versioning
+=================
 
 Module versioning is enabled by the CONFIG_MODVERSIONS tag, and is used
 as a simple ABI consistency check. A CRC value of the full prototype
@@ -396,8 +397,8 @@ module.
 Module.symvers contains a list of all exported symbols from a kernel
 build.
 
-6.1 Symbols From the Kernel (vmlinux + modules)
------------------------------------------------
+Symbols From the Kernel (vmlinux + modules)
+-------------------------------------------
 
 	During a kernel build, a file named Module.symvers will be
 	generated. Module.symvers contains all exported symbols from
@@ -421,8 +422,8 @@ build.
 	1) It lists all exported symbols from vmlinux and all modules.
 	2) It lists the CRC if CONFIG_MODVERSIONS is enabled.
 
-6.2 Symbols and External Modules
---------------------------------
+Symbols and External Modules
+----------------------------
 
 	When building an external module, the build system needs access
 	to the symbols from the kernel to check if all external symbols
@@ -431,8 +432,8 @@ build.
 	tree. During the MODPOST step, a new Module.symvers file will be
 	written containing all exported symbols from that external module.
 
-6.3 Symbols From Another External Module
-----------------------------------------
+Symbols From Another External Module
+------------------------------------
 
 	Sometimes, an external module uses exported symbols from
 	another external module. Kbuild needs to have full knowledge of
@@ -472,11 +473,11 @@ build.
 		initialization of its symbol tables.
 
 
-7. Tips & Tricks
-================
+Tips & Tricks
+=============
 
-7.1 Testing for CONFIG_FOO_BAR
-------------------------------
+Testing for CONFIG_FOO_BAR
+--------------------------
 
 	Modules often need to check for certain `CONFIG_` options to
 	decide if a specific feature is included in the module. In
-- 
2.43.0


