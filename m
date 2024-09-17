Return-Path: <linux-kbuild+bounces-3592-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1CE97B136
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 16:18:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E332A2837C3
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 14:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29802188A02;
	Tue, 17 Sep 2024 14:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NRkSmNbJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F74178397;
	Tue, 17 Sep 2024 14:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726582662; cv=none; b=QviSODDb49UyiLyL52Ta7oNwrnhoqTnWcotWTJ1eu4EvDCF7IBqYfkcRaVNqao7kFXIyeiv0RpD32eqhnRGGlo4oSav7T7OrVRMNzMFdLSj07iOX4yf4QzyDgw8xeevHw1ayMpcwfsFypU89cjIxAdnPXFD1pEywsPm/g58UKi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726582662; c=relaxed/simple;
	bh=zOKWLWOiEYUwJiA94nx2gJuvgncyH0kFTF0myUNTP9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gNRuaQRCq3ivusGiFEBE0RyGN9GXJY8P02EGGmw2HKdQ3tKXliAqa+OzWW9yoDOTO/EwkuFRRDlisTCN4hKkUsXfT+RTXGU0MzCcwBXKfK9xxo1hIWa1EmPvsSXbl6qUscr4qFdZTk9YoT2o7pvR24cpsmB4WXwlg/vm4jxot0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NRkSmNbJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E3BFC4CECE;
	Tue, 17 Sep 2024 14:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726582661;
	bh=zOKWLWOiEYUwJiA94nx2gJuvgncyH0kFTF0myUNTP9U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NRkSmNbJuo3Hq9ZTl320PZn/MO+WmCugD2N6q31nRrCb16Ne1BdOLsPzdPaBrjphn
	 +cTQcD48Ad5XjpNwkIQn3PtgNL5CHssJnHoy23ym60aEu1MgoNDhjftZ29YvHQNlIs
	 yKLR6yrLc3Yi53Ls7yQwNkW1FZZGzFxr3/Deb05iUmDd2Bqh9qZHcVjNlEn6otEQNj
	 dxonGv/z9mJyZDSZK/jnCgc6rbTMB0TWZhR8iZOnCImU13KK2ujhWWkGxzHN2cbz+w
	 kzdhqjbvLN0jODN0E6VJreNegwxvPr8tYsUdgCHvwfHwKWQhi0/ceJrVi/4OpZSnvE
	 L4E9DcPKIhayg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 05/23] kbuild: doc: describe the -C option precisely for external module builds
Date: Tue, 17 Sep 2024 23:16:33 +0900
Message-ID: <20240917141725.466514-6-masahiroy@kernel.org>
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

Building external modules is typically done using this command:

  $ make -C <KERNEL_DIR> M=<EXTMOD_DIR>

Here, <KERNEL_DIR> refers to the output directory where the kernel was
built, not the kernel source directory.

When the kernel is built in-tree, there is no ambiguity, as the output
directory and the source directory are the same.

If the kernel was built in a separate build directory, <KERNEL_DIR>
should be the kernel output directory. Otherwise, Kbuild cannot locate
necessary build artifacts such as the .config file, etc. This has been
the method for building external modules based on the kernel compiled in
a separate directory for over 20 years. [1]

If you pass the kernel source directory to the -C option, you must also
specify the kernel build directory using the O= option. This approach
works as well, though it results in a slightly longer command:

  $ make -C <KERNEL_SOURCE_DIR> O=<KERNEL_BUILD_DIR> M=<EXTMOD_DIR>

Some people mistakenly believe that O= should point to a separate output
directory for external modules when used together with M=. This commit
adds more clarification to Documentation/kbuild/kbuild.rst.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=e321b2ec2eb2993b3d0116e5163c78ad923e3c54

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/kbuild.rst  | 5 +++++
 Documentation/kbuild/modules.rst | 9 ++++++---
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index 9c8d1d046ea5..716f6fb70829 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -129,6 +129,11 @@ KBUILD_OUTPUT
 -------------
 Specify the output directory when building the kernel.
 
+This variable can also be used to point to the kernel output directory when
+building external modules using kernel build artifacts in a separate build
+directory. Please note that this does NOT specify the output directory for the
+external modules themselves.
+
 The output directory can also be specified using "O=...".
 
 Setting "O=..." takes precedence over KBUILD_OUTPUT.
diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index 1afa6b1b4090..a80bff699e77 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -74,7 +74,7 @@ executed to make module versioning work.
 
 	The command to build an external module is::
 
-		$ make -C <path_to_kernel_src> M=$PWD
+		$ make -C <path_to_kernel_dir> M=$PWD
 
 	The kbuild system knows that an external module is being built
 	due to the "M=<dir>" option given in the command.
@@ -91,12 +91,15 @@ executed to make module versioning work.
 2.2 Options
 ===========
 
-	($KDIR refers to the path of the kernel source directory.)
+	($KDIR refers to the path of the kernel source directory, or the path
+	of the kernel output directory if the kernel was built in a separate
+	build directory.)
 
 	make -C $KDIR M=$PWD
 
 	-C $KDIR
-		The directory where the kernel source is located.
+		The directory that contains the kernel and relevant build
+		artifacts used for building an external module.
 		"make" will actually change to the specified directory
 		when executing and will change back when finished.
 
-- 
2.43.0


