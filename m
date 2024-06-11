Return-Path: <linux-kbuild+bounces-2081-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8245904370
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 20:26:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61009B250A1
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 18:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99742746D;
	Tue, 11 Jun 2024 18:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g4UMuK0h"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E25249E5;
	Tue, 11 Jun 2024 18:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718130323; cv=none; b=fN+W8ROkfNSOVR+9mcONSfE8NrLi2kztVxet3qrMwEL+0sVnVaD1NLWStH756/KVd+bj3kGxVcEWXL8LLA+r3YC2kQVtoHAE6iI6KdXcY62FcgiqxEQbZEaBbcsxXvdGwu/arCSWEBOoHpcJ5/7lz3pzredRKolHPo8fdvgfu44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718130323; c=relaxed/simple;
	bh=c9F2EtIWNuw1rAMYXXpe2/dzukpWKAKKc6UMnlXo1yA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OlZxeh92o8KIC90bbztK5uG+jvuyti+fKI/5wOOt6Fffxd0FXhER344TgY6DJ4g9EnKAzU8eE6XVCL54iK02ZLdnsc4mreYLM5UP7j3cU24u2/w6p6bjcnELFh0PKj5US7ZlLabSdmBQ/OF13PJKRR/BMxU3YCto6Y2VLZoKHoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g4UMuK0h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6217C2BD10;
	Tue, 11 Jun 2024 18:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718130323;
	bh=c9F2EtIWNuw1rAMYXXpe2/dzukpWKAKKc6UMnlXo1yA=;
	h=From:To:Cc:Subject:Date:From;
	b=g4UMuK0hjsun2CL+QsWHtAlbLYn68pS9p5E298UbQ0hxwRMwltMpULyidlPm7S67v
	 bgmZ6Di90NiV/dX+GwWULk2+jMhU63czbp/xP+j8r4LwnHxsFXdZS+gtIn2rpELpS4
	 koGdJXidu7G9MyFYO7uemzwX2L7UKLBBs5tnskM39C0QpxjLnnvlsEAqLx7NLqxzjy
	 y4e7iGFjNSFgSufJk0SPatp6EjGeRr7zh9VBKA1BQLBK5WKWXo1fcCGuVR620nXMmq
	 E2WlbUEMuwdlv3RIpziVa5PR1GVIOnorNTO1IWcyZFZiNgPUrudPNrnDIbqzpT8Wqu
	 KWxIXqDn4KPkg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] kbuild: move init/build-version to scripts/
Date: Wed, 12 Jun 2024 03:24:47 +0900
Message-ID: <20240611182502.3600062-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At first, I thought this script would be used only in init/Makefile.

However, commit 5db8face97f8 ("kbuild: Restore .version auto-increment
behaviour for Debian packages") and commit 1789fc912541 ("kbuild:
rpm-pkg: invoke the kernel build from rpmbuild for binrpm-pkg")
revealed that it was actually needed for scripts/package/mk* as well.

After all, scripts/ is a better place for it.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 init/Makefile                   | 2 +-
 {init => scripts}/build-version | 0
 scripts/package/mkdebian        | 2 +-
 scripts/package/mkspec          | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename {init => scripts}/build-version (100%)

diff --git a/init/Makefile b/init/Makefile
index ab71cedc5fd6..10b652d33e87 100644
--- a/init/Makefile
+++ b/init/Makefile
@@ -52,7 +52,7 @@ CFLAGS_version.o := -include $(obj)/utsversion-tmp.h
 # Build version-timestamp.c with final UTS_VERSION
 #
 
-include/generated/utsversion.h: build-version-auto = $(shell $(src)/build-version)
+include/generated/utsversion.h: build-version-auto = $(shell $(srctree)/scripts/build-version)
 include/generated/utsversion.h: build-timestamp-auto = $(shell LC_ALL=C date)
 include/generated/utsversion.h: FORCE
 	$(call filechk,uts_version)
diff --git a/init/build-version b/scripts/build-version
similarity index 100%
rename from init/build-version
rename to scripts/build-version
diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 070149c985fe..b9a5b789c655 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -150,7 +150,7 @@ version=$KERNELRELEASE
 if [ -n "$KDEB_PKGVERSION" ]; then
 	packageversion=$KDEB_PKGVERSION
 else
-	packageversion=$(${srctree}/scripts/setlocalversion --no-local ${srctree})-$($srctree/init/build-version)
+	packageversion=$(${srctree}/scripts/setlocalversion --no-local ${srctree})-$($srctree/scripts/build-version)
 fi
 sourcename=${KDEB_SOURCENAME:-linux-upstream}
 
diff --git a/scripts/package/mkspec b/scripts/package/mkspec
index ce201bfa8377..cffc2567bef2 100755
--- a/scripts/package/mkspec
+++ b/scripts/package/mkspec
@@ -24,7 +24,7 @@ fi
 cat<<EOF
 %define ARCH ${ARCH}
 %define KERNELRELEASE ${KERNELRELEASE}
-%define pkg_release $("${srctree}/init/build-version")
+%define pkg_release $("${srctree}/scripts/build-version")
 EOF
 
 cat "${srctree}/scripts/package/kernel.spec"
-- 
2.43.0


