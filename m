Return-Path: <linux-kbuild+bounces-3588-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4492297B12C
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 16:17:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09C7E283391
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 14:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C79817AE11;
	Tue, 17 Sep 2024 14:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fV67669S"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F228117A918;
	Tue, 17 Sep 2024 14:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726582654; cv=none; b=Z9aTTsWQ3C7uobKJkMPsxAv4f5JwlONR3qjOfMTin4Pfo2jFw00YdWoZSkLObMee5YI/wC7arctfPAir4l5N/BboSDkCk411DWrtd/KWQWLJcLjTOSh5J/MSAqPlaCghQXcPYCvnrGO5Y7VWUo6swM80/3A21axAokt2rdx/jjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726582654; c=relaxed/simple;
	bh=GKorpVSUF9hPEdB9ymdQzxEwHHwAdZIW5qqmtDYc5C4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NQr3qw81eYvGHViuNGdRStT2D6YloeN8q+fKFQx8PLt6lyOal29Ekt4FSlwAHgd2q7lb1U5PL+s2RtFevcJxpRE1s8+EGLI9xNjXDT+qmo0FN6Kejn8JKqHE85FUnQjHd5BEUENvmp0ipM7web5VBq6uR3pK+ZRa/2RpUT+pVf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fV67669S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D504DC4CECD;
	Tue, 17 Sep 2024 14:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726582653;
	bh=GKorpVSUF9hPEdB9ymdQzxEwHHwAdZIW5qqmtDYc5C4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fV67669SoEfCdMzvPe0nT1FhMAqa+yt3j6JOM4c2H4eQDv2fgYSx7MKqcWzUtiMks
	 dt8YKP2m+wCvYY0yqeNLLH8eDBUjon6woZ2fPMf+kDY5BTkQAQSi1mXZEATmhxDs/5
	 /OAodKIuxy8kM7sA3856Bp6YRDTq5Lh062SBcXTFySlWiq3W1c0jsvajIYXXdwG4u/
	 5642QIx9ciVyqgWK2BxKA0U65KgdjP4ru1+3W95Q9nuyOSkVAUO9Jzlc4uMvTXeIrG
	 Sj5GAypokuRbe8BPBf/l1xW6SVkJPOTnvVFVuSnH+sY5JoVCGW8c0SWe3U5on0zAhv
	 oStCLYKEZToyA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 01/23] kbuild: doc: update the description about Kbuild/Makefile split
Date: Tue, 17 Sep 2024 23:16:29 +0900
Message-ID: <20240917141725.466514-2-masahiroy@kernel.org>
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

The phrase "In newer versions of the kernel" was added by commit
efdf02cf0651 ("Documentation/kbuild: major edit of modules.txt sections
1-4"). This feature is no longer new, so remove it and update the paragraph.

Example 3 was written 20 years ago. [1] There is no need to note about
backward compatibility with such an old build system. Remove Example 3
entirely.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=65e433436b5794ae056d22ddba60fe9194bba007

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/modules.rst | 38 +++-----------------------------
 1 file changed, 3 insertions(+), 35 deletions(-)

diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index 131863142cbb..1014a275a7e1 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -224,10 +224,9 @@ module 8123.ko, which is built from the following files::
 3.2 Separate Kbuild File and Makefile
 -------------------------------------
 
-	In newer versions of the kernel, kbuild will first look for a
-	file named "Kbuild," and only if that is not found, will it
-	then look for a makefile. Utilizing a "Kbuild" file allows us
-	to split up the makefile from example 1 into two files:
+	Kbuild will first look for a file named "Kbuild", and if it is not
+	found, it will then look for "Makefile". Utilizing a "Kbuild" file
+	allows us to split up the "Makefile" from example 1 into two files:
 
 	Example 2::
 
@@ -250,37 +249,6 @@ module 8123.ko, which is built from the following files::
 	consisting of several hundred lines, and here it really pays
 	off to separate the kbuild part from the rest.
 
-	The next example shows a backward compatible version.
-
-	Example 3::
-
-		--> filename: Kbuild
-		obj-m  := 8123.o
-		8123-y := 8123_if.o 8123_pci.o 8123_bin.o
-
-		--> filename: Makefile
-		ifneq ($(KERNELRELEASE),)
-		# kbuild part of makefile
-		include Kbuild
-
-		else
-		# normal makefile
-		KDIR ?= /lib/modules/`uname -r`/build
-
-		default:
-			$(MAKE) -C $(KDIR) M=$$PWD
-
-		# Module specific targets
-		genbin:
-			echo "X" > 8123_bin.o_shipped
-
-		endif
-
-	Here the "Kbuild" file is included from the makefile. This
-	allows an older version of kbuild, which only knows of
-	makefiles, to be used when the "make" and kbuild parts are
-	split into separate files.
-
 3.3 Binary Blobs
 ----------------
 
-- 
2.43.0


