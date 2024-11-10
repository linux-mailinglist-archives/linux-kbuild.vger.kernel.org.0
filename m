Return-Path: <linux-kbuild+bounces-4615-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA599C3062
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Nov 2024 02:40:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AFDA1C20BB0
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Nov 2024 01:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D3115665E;
	Sun, 10 Nov 2024 01:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bwaaGq2H"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC991531E1;
	Sun, 10 Nov 2024 01:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731202636; cv=none; b=eMyxE4hjlyrFuLQN0IJ9ARxr6WbnI3WWQ8BSlFQnmqyDcgENMChjvcccRtzh3zTgX6ZCDQPG2luax3m0o9icgBBxAPDoO3lADuAEctY5eJ7nUxRgmcAwW1YxLOLi51VpBlozqaU2lXoN0fl6qRMGE/JqVYjecsJMUk2I4wooDmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731202636; c=relaxed/simple;
	bh=JnWxdVvEakJui+gj8y0AxBpvkUHKa2A9Zi/L+iOkT1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ElVZnibyjkgk1bmpLtvkkU/Iv8FYdp0lwQVrgG463APoXO3oAa2W8jhFsY2BA3rYA03Bs+Gem4a4JSDFRh6xrG3dD+vbuUlDmleIvVVClpnWh4JmvP1OjXkL8dLITiOInUfAXjO91a49qbX8R4Y86cAyRnAGeV9Q8mzjPlYINQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bwaaGq2H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D4A0C4CED4;
	Sun, 10 Nov 2024 01:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731202636;
	bh=JnWxdVvEakJui+gj8y0AxBpvkUHKa2A9Zi/L+iOkT1Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bwaaGq2HqiVB2ahWcOSdWO3oIJXB7Eg6GV61J+xbFylFN/twskGjDMCQccPPIldvI
	 zS0AxzPzUaaV/bw1hlYH+M74PtywkLUgBmISlhKQyFACz962upk1J4iuF6uhL8QKnL
	 xy3mlAamzLiMZRvFiAqQItnFPAeTmxb9wzxzQrz/M5ul1BqXMQ+1T53dc9O7mp75oP
	 m+zaJzb2Sje2GMiWQ/5XADl2KZK75KQhtD9hjFRlOL7DABkghTsk+SUjUxgHlIKtm9
	 j/tqReUhKCoTZ2r41ztMH5Kyhf4ksju/aRIIHqCqkRNs4F1fL/VRW+FBOEhWPfSVkC
	 ODb2gw/ITRmKg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	cocci@inria.fr,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH v2 11/11] kbuild: allow to start building external modules in any directory
Date: Sun, 10 Nov 2024 10:34:39 +0900
Message-ID: <20241110013649.34903-12-masahiroy@kernel.org>
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
    make[2]: Entering directory '/path/to/external/module'
      CC [M]  helloworld.o
      MODPOST Module.symvers
      CC [M]  helloworld.mod.o
      CC [M]  .module-common.o
      LD [M]  helloworld.ko
    make[2]: Leaving directory '/path/to/external/module'
    make[1]: Leaving directory '/path/to/kernel'

This changes the working directory twice because the -C option first
switches to the kernel directory, and then Kbuild internally recurses
back to the external module directory.

With this commit, the wrapper Makefile can directly include the kernel
Makefile:

    KDIR ?= /path/to/kernel
    export KBUILD_EXTMOD := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
    include $(KDIR)/Makefile

This avoids unnecessary sub-make invocations:

    $ make
      CC [M]  helloworld.o
      MODPOST Module.symvers
      CC [M]  helloworld.mod.o
      CC [M]  .module-common.o
      LD [M]  helloworld.ko

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
---

Changes in v2:
  - Fix typos in the commit description (s/exernal/external/)
  - Fix `uname -r` to $(shell uname -r) in Example 3

 Documentation/kbuild/modules.rst | 21 +++++++++++++++++++++
 Makefile                         |  8 ++++++--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index a01f3754c7fc..101de236cd0c 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -59,6 +59,12 @@ Command Syntax
 
 		$ make -C /lib/modules/`uname -r`/build M=$PWD modules_install
 
+	Starting from Linux 6.13, you can use the -f option instead of -C. This
+	will avoid unnecessary change of the working directory. The external
+	module will be output to the directory where you invoke make.
+
+		$ make -f /lib/modules/`uname -r`/build/Makefile M=$PWD
+
 Options
 -------
 
@@ -221,6 +227,21 @@ Separate Kbuild File and Makefile
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
+		KDIR ?= /lib/modules/$(shell uname -r)/build
+		export KBUILD_EXTMOD := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
+		include $(KDIR)/Makefile
+
+
 Building Multiple Modules
 -------------------------
 
diff --git a/Makefile b/Makefile
index df002595341a..0825a9a58ca9 100644
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
     srcroot := $(realpath $(KBUILD_EXTMOD))
-- 
2.43.0


