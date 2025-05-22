Return-Path: <linux-kbuild+bounces-7221-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9829AAC1217
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 May 2025 19:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BB18166028
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 May 2025 17:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A3F192B8C;
	Thu, 22 May 2025 17:29:51 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52B8318EFD4;
	Thu, 22 May 2025 17:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747934991; cv=none; b=dr0ibhLxdLv/o7ZrANLaDKbpT5fVeCdVpin0MHilj7qk864YXa3deAAUmOSFb7Vnuo29iOb6sTJFwfpK2zFzSHS/YD5kNtFojjIB7gkyoiD83Id5vB0HORF90A3/ng0Hl46wYnq321RiWTN/2j1XHcBoFedx4Grdp9X+a+qFonM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747934991; c=relaxed/simple;
	bh=nNle4kF5RtKTaOp5O+lQMGf2me4v54+rD916Fo4zeRU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kqh38Jq4csVi0JAcdvIBydW9lTe2MAVkW3WFETdmLAQvGY1wRnFOhD589ZakohnHIRe/C8Wu1qE5s+aQeR46e5OHkPbp/SyeLA/OKqtx0Lxok/2f18Qw5YCrVQBpIT2v98qODVyIpMkRkSkHh7avmLb31U3kqOfuCL80tyRPA9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 185E31A2D;
	Thu, 22 May 2025 10:29:34 -0700 (PDT)
Received: from u200865.usa.arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C123F3F673;
	Thu, 22 May 2025 10:29:47 -0700 (PDT)
From: Jeremy Linton <jeremy.linton@arm.com>
To: linux-kbuild@vger.kernel.org
Cc: masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas.schier@linux.dev,
	linux-kernel@vger.kernel.org,
	Jeremy Linton <jeremy.linton@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH] scripts: add zboot support to extract-vmlinux
Date: Thu, 22 May 2025 12:29:41 -0500
Message-ID: <20250522172941.1669424-1-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Zboot compressed kernel images are used for arm kernels on various
distros.

extract-vmlinux fails with those kernels because the wrapped image is
another PE. While this could be a bit confusing, the tools primary
purpose of unwrapping and decompressing the contained vmlinux image
makes it the obvious place for this functionality.

Add a 'file' check in check_vmlinux() that detects a contained PE
image before trying readelf. Recent file implementations output
something like:

"Linux kernel ARM64 boot executable Image, little-endian, 4K pages"

Which is also a stronger statement than readelf provides so drop that
part of the comment. At the same time this means that kernel images
which don't appear to contain a compressed image will be returned
rather than reporting an error. Which matches the behavior for
existing ELF files.

Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
---
 scripts/extract-vmlinux | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/scripts/extract-vmlinux b/scripts/extract-vmlinux
index 8995cd304e6e..edda1abe226c 100755
--- a/scripts/extract-vmlinux
+++ b/scripts/extract-vmlinux
@@ -12,10 +12,11 @@
 
 check_vmlinux()
 {
-	# Use readelf to check if it's a valid ELF
-	# TODO: find a better to way to check that it's really vmlinux
-	#       and not just an elf
-	readelf -h $1 > /dev/null 2>&1 || return 1
+	file $1 |grep 'Linux kernel.*boot executable Image' > /dev/null
+	if [ "$?" -ne "0" ]; then
+		# Use readelf to check if it's a valid ELF, if 'file' fails
+		readelf -h $1 > /dev/null 2>&1 || return 1
+	fi
 
 	cat $1
 	exit 0
-- 
2.49.0


