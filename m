Return-Path: <linux-kbuild+bounces-8354-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 239E7B21CE2
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 07:33:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 636F068252C
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 05:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F092B29BDAE;
	Tue, 12 Aug 2025 05:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wBu4z1eC";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FX/YlG4S"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656951DB92A;
	Tue, 12 Aug 2025 05:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754976792; cv=none; b=K9hwknCLGnXcspdGnaotSeNXvlcYi8Ucvs4r1n0WDUqAVs3S+agpQtolh3jG4yc1EGaCdONHwSawXdtzPX7Juc4XFenHJAUsLbpxGb4DN6UXCW5yYtKFznEdo/VIsF+cHBuuW/EuLtvXpNJNpmWThgoaDug3SXuADjj/a9VUbDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754976792; c=relaxed/simple;
	bh=+AGJqaFmcLyguG2X/KcR0y7Ea40NMlnG9z0NWoSskUE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cDKPZ4Qi6wabbKcGbCb6CdMJbbKy7g5AmHPmzj7XHo+MVDIIEUNye66c7kG6KAVYC/juNxdU4F/VmtF5CcU6gf508L+XIduV4RLj7M4SHQGui+7tAM6dYUBL1iT0d324pGNXo65pQePZSCVw4M93aDLE303vBIlX4y7xpBpAV90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wBu4z1eC; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FX/YlG4S; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754976788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5XEd4qLpBKB5MMIt4pSmgjtI6brHG7ckhsBHEa+vXVc=;
	b=wBu4z1eCjX5ZMM03NuFtTIf1tlsZ3oUazbqRFiIuO7wGLLwx2NEo1xY9t3A2LYEddxuyfq
	HjII51tzsjvtqCbgk0ZN5KWeada/OY7mWW/e2tTnmOdkAfJUogLPQFbDPcrRQbWSA5IT+B
	QZyOJ/VQEnQAF2+ZfUepEdUpD5AtkqknME2iAS7escGqzKD7I315onTakW2x/eM8RbTRuP
	FX295WUB1POKuassOaX0z+Tu1kAq1XPuzM7HtW+zHkXCwiRpCxgKG2ByMBRH1D1BrWTePc
	3LvdBFSgVjp6oRFSyACyDYT/fJBSTVROAA3BXKw8Q/tdfJETiHFq/rFU2M/1sw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754976788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5XEd4qLpBKB5MMIt4pSmgjtI6brHG7ckhsBHEa+vXVc=;
	b=FX/YlG4SPg9sCXMHE92mExNiMr6mQii/NtsYz19BBLjiXazGihwc76ZxmiurW1qo2Y1PLO
	gfiChbsUhDgvZfBQ==
Subject: [PATCH 0/6] kbuild: uapi: various fixes
Date: Tue, 12 Aug 2025 07:33:03 +0200
Message-Id: <20250812-kbuild-hdrtest-fixes-v1-0-7ad2af66cd58@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAA/SmmgC/x3LXQpAUBBA4a1onk0ZP5GtyINrBhOhO0jJ3t08f
 p3OAyZexaCOHvByqem2BlAcQT916yioHAxpkhZJRYSzO3VhnNgfYgcOeoshuYHy0mXMnEFYdy9
 /CGfTvu8HmOQW22YAAAA=
X-Change-ID: 20250811-kbuild-hdrtest-fixes-1bf147b3ddd3
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754976787; l=1048;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=+AGJqaFmcLyguG2X/KcR0y7Ea40NMlnG9z0NWoSskUE=;
 b=CmViqgbD+jtWERt18tK5oS3vyHRtqKR7pMU75a0uLoGwoLI9oo2IoTg+EuZZ1u52Y5rDnR1IC
 Mjv6F/8xQZWCVGMRE7F13C8DEgE7BsN833MY4UTykVeRb81lZkxQXmE
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Various fixes and promotion of warnings to real errors.

I didn't add Fixes: tags as digging up the original changes would be
cumbersome as the code moved a lot over the years.
Backporting this doesn't make sense anyways.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Thomas Weißschuh (6):
      kbuild: uapi: rerun header tests when headers_check.pl changes
      kbuild: uapi: only update hdrtest output on success
      kbuild: uapi: fail header test on compiler warnings
      kbuild: uapi: upgrade warning on asm/types.h inclusion to error
      kbuild: uapi: upgrade check_sizetypes() warning to error
      kbuild: uapi: upgrade check_declarations() warning to error

 usr/include/Makefile         | 8 ++++----
 usr/include/headers_check.pl | 9 ++++-----
 2 files changed, 8 insertions(+), 9 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250811-kbuild-hdrtest-fixes-1bf147b3ddd3

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


