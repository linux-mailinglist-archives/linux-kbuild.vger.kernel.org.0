Return-Path: <linux-kbuild+bounces-3632-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FAA97CD2B
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Sep 2024 19:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D7FE1F24FD6
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Sep 2024 17:38:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E4C01A2C3A;
	Thu, 19 Sep 2024 17:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JI/uxqtI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C991A2C35;
	Thu, 19 Sep 2024 17:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726767471; cv=none; b=JOW+1UYbNO62/wyo+6hp0M/HsDhU/g3CCxCApijp/m5pGhtl6x+eSe5vA+tHC8a1yEI1imKZLXFMq+Dc3sdbbkUI4Hci9tbW9aDaebokk3gOAPk/Woibk8rddcWAc38Ec6qP8Tn6F95yaPsYszWPLPIPFC4L6J4te63PXltqTEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726767471; c=relaxed/simple;
	bh=dAgeAUB+fMnBXcv/96LKcW7XGV9i/ZJLpRzgncAtrz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p9zrJfzpn2VsvA3q5exdRYu3qglngsorcbBEaEACpDy6RvV9u05C0zFGeK7B5h12YMkidjWbZ/gJEFS3NmnA1XGm98tQATiFt6D0qpVGbgNxJEo01MNpkCc6JxN+W6D8Pt8+0Qlo7bmPBN/5ItPzfC9ebkNMSVcYXqSieeheTtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JI/uxqtI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D54BC4CECF;
	Thu, 19 Sep 2024 17:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726767470;
	bh=dAgeAUB+fMnBXcv/96LKcW7XGV9i/ZJLpRzgncAtrz4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JI/uxqtInochdeiZHeqEAUAvfAdKQXjJBm4RHDtd+sdeTwfOkt3Xsirb7BWiZciUV
	 /dIYxpy85kkFF5QR23mjSQ73eBeXs3yrFczKGAGiwcBuCUAg5Wchht7ML1+b1EF0v4
	 uCKMiWJU3mzvgnfBvFCJkFPVBYb78huCeA0FUrXPLVnNjfb3b1HUWHz07tbqFOCbVv
	 fkHgdjo+1iywDZuwtOZstaiT+wP7kD7O+uwx+iUKCFrA9vc0PzptUOs+cg3BVKZ1n8
	 q9HubGSPjvYK+3ITVxTbd2OZjfBe7cGLpA2x5MczdISq0MgMDAI5yCq449lj2PG6ib
	 AcpVLYVqMnubw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <n.schier@avm.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 3/5] kbuild: doc: remove the description about shipped files
Date: Fri, 20 Sep 2024 02:37:16 +0900
Message-ID: <20240919173740.1080501-3-masahiroy@kernel.org>
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

The use of shipped files is discouraged in the upstream kernel these
days. [1]

Downstream Makefiles have the freedom to use shipped files or other
options to handle binaries, but this should not be advertised in the
upstream document.

[1]: https://lore.kernel.org/all/CAHk-=wgSEi_ZrHdqr=20xv+d6dr5G895CbOAi8ok+7-CQUN=fQ@mail.gmail.com/

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nicolas Schier <n.schier@avm.de>
---

Changes in v2:
  - Remove TODO item in makefiles.rst

 Documentation/kbuild/makefiles.rst |  1 -
 Documentation/kbuild/modules.rst   | 35 +++---------------------------
 2 files changed, 3 insertions(+), 33 deletions(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index be43990f1e7f..7964e0c245ae 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -1665,6 +1665,5 @@ Credits
 TODO
 ====
 
-- Describe how kbuild supports shipped files with _shipped.
 - Generating offset header files.
 - Add more variables to chapters 7 or 9?
diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index c4a0598aa276..080e11372351 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -152,7 +152,6 @@ module 8123.ko, which is built from the following files::
 	8123_if.c
 	8123_if.h
 	8123_pci.c
-	8123_bin.o_shipped	<= Binary blob
 
 Shared Makefile
 ---------------
@@ -170,7 +169,7 @@ Shared Makefile
 		ifneq ($(KERNELRELEASE),)
 		# kbuild part of makefile
 		obj-m  := 8123.o
-		8123-y := 8123_if.o 8123_pci.o 8123_bin.o
+		8123-y := 8123_if.o 8123_pci.o
 
 		else
 		# normal makefile
@@ -179,10 +178,6 @@ Shared Makefile
 		default:
 			$(MAKE) -C $(KDIR) M=$$PWD
 
-		# Module specific targets
-		genbin:
-			echo "X" > 8123_bin.o_shipped
-
 		endif
 
 	The check for KERNELRELEASE is used to separate the two parts
@@ -204,7 +199,7 @@ Separate Kbuild File and Makefile
 
 		--> filename: Kbuild
 		obj-m  := 8123.o
-		8123-y := 8123_if.o 8123_pci.o 8123_bin.o
+		8123-y := 8123_if.o 8123_pci.o
 
 		--> filename: Makefile
 		KDIR ?= /lib/modules/`uname -r`/build
@@ -212,35 +207,11 @@ Separate Kbuild File and Makefile
 		default:
 			$(MAKE) -C $(KDIR) M=$$PWD
 
-		# Module specific targets
-		genbin:
-			echo "X" > 8123_bin.o_shipped
-
 	The split in example 2 is questionable due to the simplicity of
 	each file; however, some external modules use makefiles
 	consisting of several hundred lines, and here it really pays
 	off to separate the kbuild part from the rest.
 
-Binary Blobs
-------------
-
-	Some external modules need to include an object file as a blob.
-	kbuild has support for this, but requires the blob file to be
-	named <filename>_shipped. When the kbuild rules kick in, a copy
-	of <filename>_shipped is created with _shipped stripped off,
-	giving us <filename>. This shortened filename can be used in
-	the assignment to the module.
-
-	Throughout this section, 8123_bin.o_shipped has been used to
-	build the kernel module 8123.ko; it has been included as
-	8123_bin.o::
-
-		8123-y := 8123_if.o 8123_pci.o 8123_bin.o
-
-	Although there is no distinction between the ordinary source
-	files and the binary file, kbuild will pick up different rules
-	when creating the object file for the module.
-
 Building Multiple Modules
 -------------------------
 
@@ -301,7 +272,7 @@ Single Subdirectory
 		obj-m := 8123.o
 
 		ccflags-y := -I $(src)/include
-		8123-y := 8123_if.o 8123_pci.o 8123_bin.o
+		8123-y := 8123_if.o 8123_pci.o
 
 Several Subdirectories
 ----------------------
-- 
2.43.0


