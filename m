Return-Path: <linux-kbuild+bounces-7989-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFE3B021AA
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Jul 2025 18:26:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09E8D1C439C5
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Jul 2025 16:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D9952EF676;
	Fri, 11 Jul 2025 16:26:12 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4BB82EF641;
	Fri, 11 Jul 2025 16:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752251172; cv=none; b=WvNfCH/EM2xrq0IUcvuBCXf9Wry0QIMkKMeltcH4Xooo6GU4nPF3xOV8WDIdi2LyowZpQEzk3iHRagP18ixRRCEgYo6wdsNddLJGg9E56eNEPpuP2jRkopVfj+jRbOw42QcroA1GdPG+ggRn15kjmlrYCQDFjz+j1g3dkm5aiv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752251172; c=relaxed/simple;
	bh=Dov6w9WQx8vyMD5aEf04cyyBjjDtz5SLoks3mppqLIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n9dMDb2hPGV+H5eCVNojUzeOPp50Q/TOtzaI+lDYgLFpxz89y6gx1h6Srj9vgThZf01WEh5uVM1RBao4b6zl5Fh6ypprUnyOn7Sqq9QCz+uyGLWSp1bjoAaT0lNJ559v+U65Mj8N0YIj6xAvlPucNfRoScckwJO4nTYg7whgYCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D1192247;
	Fri, 11 Jul 2025 09:25:59 -0700 (PDT)
Received: from u200865.usa.arm.com (unknown [10.119.38.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EBB83F6A8;
	Fri, 11 Jul 2025 09:26:09 -0700 (PDT)
From: Jeremy Linton <jeremy.linton@arm.com>
To: linux-kbuild@vger.kernel.org
Cc: masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas.schier@linux.dev,
	linux-kernel@vger.kernel.org,
	Jeremy Linton <jeremy.linton@arm.com>
Subject: [PATCH v2 1/1] scripts: add zboot support to extract-vmlinux
Date: Fri, 11 Jul 2025 11:26:05 -0500
Message-ID: <20250711162605.545514-2-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711162605.545514-1-jeremy.linton@arm.com>
References: <20250711162605.545514-1-jeremy.linton@arm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Zboot compressed kernel images are used for arm64 kernels on various
distros.

extract-vmlinux fails with those kernels because the wrapped image is
another PE. While this could be a bit confusing, the tools primary
purpose of unwrapping and decompressing the contained kernel image
makes it the obvious place for this functionality.

Add a 'file' check in check_vmlinux() that detects a contained PE
image before trying readelf. Recent (FILES_39, Jun/2020) file
implementations output something like:

"Linux kernel ARM64 boot executable Image, little-endian, 4K pages"

Which is also a stronger statement than readelf provides so drop that
part of the comment. At the same time this means that kernel images
which don't appear to contain a compressed image will be returned
rather than reporting an error. Which matches the behavior for
existing ELF files.

The extracted PE image can then be inspected, or used as would any
other kernel PE.

Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
---
 scripts/extract-vmlinux | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/scripts/extract-vmlinux b/scripts/extract-vmlinux
index 8995cd304e6e..049bab337f0e 100755
--- a/scripts/extract-vmlinux
+++ b/scripts/extract-vmlinux
@@ -12,13 +12,12 @@
 
 check_vmlinux()
 {
-	# Use readelf to check if it's a valid ELF
-	# TODO: find a better to way to check that it's really vmlinux
-	#       and not just an elf
-	readelf -h $1 > /dev/null 2>&1 || return 1
-
-	cat $1
-	exit 0
+	if file "$1" | grep -q 'Linux kernel.*boot executable' \
+		|| readelf -h "$1" > /dev/null 2>&1
+	then
+		cat "$1"
+		exit 0
+	fi
 }
 
 try_decompress()
-- 
2.50.1


