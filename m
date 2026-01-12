Return-Path: <linux-kbuild+bounces-10484-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE45D10BB7
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jan 2026 07:44:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4DBCC302426D
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jan 2026 06:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1349315D53;
	Mon, 12 Jan 2026 06:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="A69xnhlF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A1F315D30;
	Mon, 12 Jan 2026 06:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768200245; cv=none; b=AJssOMRMxSK8tEMIuqYu9QIdh96mX9aZMNmaeR/3zI1Sm7v5sx9ZMgDszjuHp/JEUPHgANWaIo0jrs7pXBDTca+KZNS5ADuQ7wx09Plii+W/O5C6nB+VMlEG5ZxWTxTXFGrPpgNZIjO9StySSvaUN3cPU0c8FD3SseUrz4ZrpWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768200245; c=relaxed/simple;
	bh=E6o6SdP51AFFLb1ppQSdkahvWHsXfMXww8e/aPSyd94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZWjp70Wd/lRFpfN6o7gQ7Za7+L31FRT32smtZz8fm+kz7h+vfe5c8iearBikNXL9tFKHW+WytYhuYa2RsrPDu3yFe/7tmBKBdPdq9mUq/IVSkRltPmoZcgRiJ9VPdesx4Y7liEnAyUR7qK4Kk2FpWKYJNJ3NC0smU8VJpolm6SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=A69xnhlF; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1768200234;
	bh=E6o6SdP51AFFLb1ppQSdkahvWHsXfMXww8e/aPSyd94=;
	h=From:Date:Subject:To:Cc:From;
	b=A69xnhlFWHcyE+Zk8p4a9Od3+9N0XZKOytnqXFtEIczT1G00bnjykMOc4mhroGQSx
	 38W12uqwjT6/F5Y4O3W4T35zDisNeJtsWxEKBHoAFg5kIPtR7xW2tqUib/VvQD1l5m
	 cuXEAeR1b02hkHfPMDn2uQYJShQEOoK42VRWBoPw=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 12 Jan 2026 07:43:52 +0100
Subject: [PATCH] kbuild: Reject unexpected values for LLVM=
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260112-kbuild-llvm-arg-v1-1-8e9bbdae996f@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0ND3eyk0sycFN2cnLJc3cSidN1kc2MTs0STNKMk40QloK6CotS0zAq
 widGxtbUAcCaO7mEAAAA=
X-Change-ID: 20260111-kbuild-llvm-arg-c7346a4f2b3a
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768200234; l=1123;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=E6o6SdP51AFFLb1ppQSdkahvWHsXfMXww8e/aPSyd94=;
 b=KWmaKuyzWxEUYt9keqXzS09/mO73ym+aK1579eE771u2P40K2QyxALwbaXHKkNdZjT2mhH4fP
 1z6YndeskRqCg11e558LpGrUVF0DTCajYfFfX6xkSCyEp2QR0Xr49qZ
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The LLVM argument is documented to accept one of three forms:
* a literal '1' to use the default 'clang',
* a toolchain prefix path, ending in a trailing '/',
* a version suffix.

All other values are silently treated as '1'. If for example
the user accidentally forgets the trailing '/' of a toolchain prefix,
kbuild will unexpectedly and silently fall back to the system toolchain.

Instead report an error if the user specified an invalid value for LLVM.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index e404e4767944..2a085a1b6875 100644
--- a/Makefile
+++ b/Makefile
@@ -447,6 +447,8 @@ ifneq ($(filter %/,$(LLVM)),)
 LLVM_PREFIX := $(LLVM)
 else ifneq ($(filter -%,$(LLVM)),)
 LLVM_SUFFIX := $(LLVM)
+else ifneq ($(LLVM),1)
+$(error Invalid value for LLVM=)
 endif
 
 HOSTCC	= $(LLVM_PREFIX)clang$(LLVM_SUFFIX)

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260111-kbuild-llvm-arg-c7346a4f2b3a

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


