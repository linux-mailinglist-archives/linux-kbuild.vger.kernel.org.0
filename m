Return-Path: <linux-kbuild+bounces-9002-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C955BBD635
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Oct 2025 10:49:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3320318951D4
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Oct 2025 08:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3858325F988;
	Mon,  6 Oct 2025 08:49:34 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164641DE885;
	Mon,  6 Oct 2025 08:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759740574; cv=none; b=CnU+gALd2BtPvj7NMnDCme59ANX3YGpT+TCQFg7q7BjH441VcY5NaDsDzWP1QfA5pe0FZwnccha7cR/ZGHy9d2oHrw0AgjJxi9TbZpcvx6Om6Fmlmlx4wrQvIaJs6J8YcRbakZP9Z4f6JNPEnYbXHb1ZsQYVecrI75ZJhSQZgu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759740574; c=relaxed/simple;
	bh=aXmz6nZG9iimp8CMRFiQ572c26X2QginbFUwsrzfckI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GnSJmwf9enroV1+vEGpnDGPyAjhGSNpNVsXYyN1a6dfSuLLV0Xyz32EDDZTa1p37RqMKljidIL+DS8Gttb3Yp3uT0tyjHEOwpBXoTZlslszTZWtTzY28MMwl7drU9tI8brMKLsSGKpyndaACh0gJbEL6Aq+vqCooNnc4hvKqD0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EFBFC4CEF5;
	Mon,  6 Oct 2025 08:49:32 +0000 (UTC)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-kbuild@vger.kernel.org,
	linux-m68k@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] kbuild: uapi: Strip comments before size type check
Date: Mon,  6 Oct 2025 10:49:28 +0200
Message-ID: <6e68ab921a728caea4f3f37bfae9b1896edfa97a.1759740354.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
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
---
 usr/include/headers_check.pl | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/usr/include/headers_check.pl b/usr/include/headers_check.pl
index 21c2fb9520e6af2d..75dfdce39e7f4610 100755
--- a/usr/include/headers_check.pl
+++ b/usr/include/headers_check.pl
@@ -155,6 +155,9 @@ sub check_sizetypes
 	if (my $included = ($line =~ /^\s*#\s*include\s+[<"](\S+)[>"]/)[0]) {
 		check_include_typesh($included);
 	}
+	# strip comments (single-line and C99 only)
+	$line =~ s@\/\*.*?\*\/@@;
+	$line =~ s@\/\/.*$@@;
 	if ($line =~ m/__[us](8|16|32|64)\b/) {
 		printf STDERR "$filename:$lineno: " .
 		              "found __[us]{8,16,32,64} type " .
-- 
2.43.0


