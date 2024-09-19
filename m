Return-Path: <linux-kbuild+bounces-3633-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C82997CD2F
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Sep 2024 19:38:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DC7C1C218F8
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Sep 2024 17:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5605E1A38E1;
	Thu, 19 Sep 2024 17:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oXcsiT6H"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF071A38D7;
	Thu, 19 Sep 2024 17:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726767473; cv=none; b=dRpJvLbYg1vzrzSbszxIP+Pdjc2iDO25KB9+iSgLtoENmNG4HXrCP6O6Yzift/GoNR+EHhJGiplohrKZoaEmu84+gpZW4eCpN/DbCUN4cCnT14oCvgqqoYUABfdDaoloBkp3vpfwpfFm5+hiF/H2bheP10Rw0UdskOnrlIYuWFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726767473; c=relaxed/simple;
	bh=J7RNRqMFxFwXcjhPaEMvrPABns9MkYP8IYj+AKIiTZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WxJInSbNJNFPS+TDzmjK8fjpfpngEP3YUBsJxb3/zs4VS+4PYLU2xqhWXEZLTIjOsIAQpnaZ6wGYvM1IjdUnqTO9k3ia32kM+in2Y99VcwPTh+Hkw3SFgDOks7HhgQ+HNPZTyMG55QAGO4Ibp9I8Y1/cIO/MBkoHm822LETbTrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oXcsiT6H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38FC9C4CEC7;
	Thu, 19 Sep 2024 17:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726767472;
	bh=J7RNRqMFxFwXcjhPaEMvrPABns9MkYP8IYj+AKIiTZk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oXcsiT6HpMytKDPHfpQqyRarfme5p4c4nazWTU9w5gd2XVCqXMATnFkTaCIMiKqIU
	 2QGUGsF485cbaJGSILANi0JlHZXgXxrP6h5U3VK6zeZsB47WreaWd2RfxAjGu9X6Dm
	 DmLD2ORIkZGZvNdlgX4juPSvtXhRfR+zQ2YpE6ypwPxBr6PjJI/AX5OMrM3vwP533a
	 JA4kJxIUX0BU2xqFScFq1uRx/t6XmtIxEDhJauHg91sfF4ofHluA4ftmaO25qSdra6
	 zNHdJj+y5Hgk/Sv3wAD41ZK5bx17XwntuU7y8H3GXfx9W5cxIFJAyUNwbN9JIwQ+6U
	 2nhcocf836LZg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <n.schier@avm.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 4/5] kbuild: doc: describe the -C option precisely for external module builds
Date: Fri, 20 Sep 2024 02:37:17 +0900
Message-ID: <20240919173740.1080501-4-masahiroy@kernel.org>
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

Building external modules is typically done using this command:

  $ make -C <KERNEL_DIR> M=<EXTMOD_DIR>

Here, <KERNEL_DIR> refers to the output directory where the kernel was
built, not the kernel source directory.

When the kernel is built in the source tree, there is no ambiguity, as
the output directory and the source directory are the same.

If the kernel was built in a separate build directory, <KERNEL_DIR>
should be the kernel output directory. Otherwise, Kbuild cannot locate
necessary build artifacts such as the .config file, etc. This has been
the method for building external modules against a pre-built kernel in
a separate directory for over 20 years. [1]

If you pass the kernel source directory to the -C option, you must also
specify the kernel build directory using the O= option. This approach
works as well, though it results in a slightly longer command:

  $ make -C <KERNEL_SOURCE_DIR> O=<KERNEL_BUILD_DIR> M=<EXTMOD_DIR>

Some people mistakenly believe that O= should point to a build directory
for external modules when used together with M=. This commit adds more
clarification to Documentation/kbuild/kbuild.rst.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=e321b2ec2eb2993b3d0116e5163c78ad923e3c54

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nicolas Schier <n.schier@avm.de>
---

Changes in v2:
  - Rebase

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
index 080e11372351..b24448f789b3 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -45,7 +45,7 @@ Command Syntax
 
 	The command to build an external module is::
 
-		$ make -C <path_to_kernel_src> M=$PWD
+		$ make -C <path_to_kernel_dir> M=$PWD
 
 	The kbuild system knows that an external module is being built
 	due to the "M=<dir>" option given in the command.
@@ -62,12 +62,15 @@ Command Syntax
 Options
 -------
 
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


