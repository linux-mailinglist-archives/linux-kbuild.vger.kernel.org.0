Return-Path: <linux-kbuild+bounces-9009-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB51BBE09B
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Oct 2025 14:33:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7730E3B9C9F
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Oct 2025 12:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A20A27F19B;
	Mon,  6 Oct 2025 12:33:49 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786EB35898;
	Mon,  6 Oct 2025 12:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759754029; cv=none; b=fLRLLUoMB+/Nxvt/kYBCi5BJ2cPCGQwU87gtRlfMpFZhXKZQ74MWSQ8rkmV/qy5540gfRK+95zz51LwbWZX5g1d7yf9fwwmGUyBFX+wILyHs8tzssVOh2+Yz3vsomfIb7rPG159EZxIgQl3xTVxAS6Td/vxRc+Ny02U/i7Dqh38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759754029; c=relaxed/simple;
	bh=nI44LgrbD2JrAwsczLJrzBMIgQX/oR138L1JHXuUMe4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DhRtpQAlmGLsYTIGobwebdHC3nIDYRsy6MX6eDIHb26ewijJl4sAiAfXfMEjt3OJ9ysqUQl7N+7Peaab9pWUokN5rsYd1FmebnexB4Ap4Wqlj6OMT1+vxrbop9wWZivHYLHuwYXhVl/8qQxG4rfiR1FEQDqsJ2swY19SxlAyT18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84658C4CEF5;
	Mon,  6 Oct 2025 12:33:45 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-kbuild@vger.kernel.org,
	linux-m68k@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2] kbuild: uapi: Strip comments before size type check
Date: Mon,  6 Oct 2025 14:33:42 +0200
Message-ID: <949f096337e28d50510e970ae3ba3ec9c1342ec0.1759753998.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On m68k, check_sizetypes in headers_check reports:

    ./usr/include/asm/bootinfo-amiga.h:17: found __[us]{8,16,32,64} type without #include <linux/types.h>

This header file does not use any of the Linux-specific integer types,
but merely refers to them from comments, so this is a false positive.
As of commit c3a9d74ee413bdb3 ("kbuild: uapi: upgrade check_sizetypes()
warning to error"), this check was promoted to an error, breaking m68k
all{mod,yes}config builds.

Fix this by stripping simple comments before looking for Linux-specific
integer types.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
v2:
  - Add Reviewed-by,
  - Drop support for C99 comments.
---
 usr/include/headers_check.pl | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/usr/include/headers_check.pl b/usr/include/headers_check.pl
index 21c2fb9520e6af2d..16c238aadfebb061 100755
--- a/usr/include/headers_check.pl
+++ b/usr/include/headers_check.pl
@@ -155,6 +155,8 @@ sub check_sizetypes
 	if (my $included = ($line =~ /^\s*#\s*include\s+[<"](\S+)[>"]/)[0]) {
 		check_include_typesh($included);
 	}
+	# strip comments (single-line only)
+	$line =~ s@\/\*.*?\*\/@@;
 	if ($line =~ m/__[us](8|16|32|64)\b/) {
 		printf STDERR "$filename:$lineno: " .
 		              "found __[us]{8,16,32,64} type " .
-- 
2.43.0


