Return-Path: <linux-kbuild+bounces-3591-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1B797B134
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 16:18:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1980C1C20DF7
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 14:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63D5F18786A;
	Tue, 17 Sep 2024 14:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MWc/OAQJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396DA18757D;
	Tue, 17 Sep 2024 14:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726582660; cv=none; b=fuyzplkj8YNFMZbxix20w+b47oc8u0h3f9FskL8T4/Bu1ePIRY/rOBPzzZinR+PlBExQXilJ/JADQJY4gG5M0o2A7hVV54eUTaoxlS/G3cBICDkF4s3molCUBLE5tF5zt+q9NaCq/DvwqgXd+S5sZV/00tEgUaBflWlBJmgE3x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726582660; c=relaxed/simple;
	bh=M5hwbxGmb3kFIwBUjhm/vKr9Jp1vcsNIkcx9cZ1dz/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P1FTPIcdYxrhSnK/f9YC8sgAWubMADudVJvLFXxkYFCsz5BhDXaYJW6WXeOL6c9AGBTOEe87Agiwq/2KlcnIjwhbLNci7LrpK+lOLouBYmc7+67YZhMdJFLNPJHENyuVhjnkM8Kxx8A0Zz+b8KhOtduB5RWimuaZl595VdLmU40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MWc/OAQJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F4BEC4CECF;
	Tue, 17 Sep 2024 14:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726582659;
	bh=M5hwbxGmb3kFIwBUjhm/vKr9Jp1vcsNIkcx9cZ1dz/U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MWc/OAQJOTgPjXBC/zSjUa4v5+Mr++4m5gzJFVPj/+Z1TxHe9TfkRecHrs3e0f7Le
	 ++eq01SBf39lsPA5zraelQ1Q2NGhtMEm9OZYIL9/JWpMFg22Bv1S5KhF34flw3TIEt
	 eY8YMhAa3+YEl555Fh67Oza/yuOGH1jKbwAEP1/JVSFcK8Pk876xxFxJbr5SCfvncG
	 dS9ib/pTO/wkUQ889CJyYMIl5s4NO090BckwTlHLZE/DMQPDKlm4TBXeRC4UZTi13C
	 Q3wn0S1VZhNh2vGQzoZeLpMjNEYqmIxyQRlKrWaSC3AVhiVs/LV5H8lQlT7j4DYrbZ
	 B4OPqFAnY/QYg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 04/23] kbuild: doc: remove the description about shipped files
Date: Tue, 17 Sep 2024 23:16:32 +0900
Message-ID: <20240917141725.466514-5-masahiroy@kernel.org>
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

The use of shipped files is discouraged in the upstream kernel these
days. [1]

Downstream Makefiles have the freedom to use shipped files or other
options to handle binaries, but this is not what should be advertised
in the upstream document.

[1]: https://lore.kernel.org/all/CAHk-=wgSEi_ZrHdqr=20xv+d6dr5G895CbOAi8ok+7-CQUN=fQ@mail.gmail.com/

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/modules.rst | 35 +++-----------------------------
 1 file changed, 3 insertions(+), 32 deletions(-)

diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index 7eceb9a65e9c..1afa6b1b4090 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -180,7 +180,6 @@ module 8123.ko, which is built from the following files::
 	8123_if.c
 	8123_if.h
 	8123_pci.c
-	8123_bin.o_shipped	<= Binary blob
 
 3.1 Shared Makefile
 -------------------
@@ -198,7 +197,7 @@ module 8123.ko, which is built from the following files::
 		ifneq ($(KERNELRELEASE),)
 		# kbuild part of makefile
 		obj-m  := 8123.o
-		8123-y := 8123_if.o 8123_pci.o 8123_bin.o
+		8123-y := 8123_if.o 8123_pci.o
 
 		else
 		# normal makefile
@@ -207,10 +206,6 @@ module 8123.ko, which is built from the following files::
 		default:
 			$(MAKE) -C $(KDIR) M=$$PWD
 
-		# Module specific targets
-		genbin:
-			echo "X" > 8123_bin.o_shipped
-
 		endif
 
 	The check for KERNELRELEASE is used to separate the two parts
@@ -232,7 +227,7 @@ module 8123.ko, which is built from the following files::
 
 		--> filename: Kbuild
 		obj-m  := 8123.o
-		8123-y := 8123_if.o 8123_pci.o 8123_bin.o
+		8123-y := 8123_if.o 8123_pci.o
 
 		--> filename: Makefile
 		KDIR ?= /lib/modules/`uname -r`/build
@@ -240,35 +235,11 @@ module 8123.ko, which is built from the following files::
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
 
-3.3 Binary Blobs
-----------------
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
 3.4 Building Multiple Modules
 =============================
 
@@ -329,7 +300,7 @@ according to the following rule:
 		obj-m := 8123.o
 
 		ccflags-y := -I $(src)/include
-		8123-y := 8123_if.o 8123_pci.o 8123_bin.o
+		8123-y := 8123_if.o 8123_pci.o
 
 4.3 Several Subdirectories
 --------------------------
-- 
2.43.0


