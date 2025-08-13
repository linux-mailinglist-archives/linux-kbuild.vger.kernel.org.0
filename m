Return-Path: <linux-kbuild+bounces-8425-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3E1B2413F
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 08:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0232616B77B
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 06:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3102BEC39;
	Wed, 13 Aug 2025 06:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wYMVt9FF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="V08Gn3Bk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BA02BE7C6;
	Wed, 13 Aug 2025 06:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755065854; cv=none; b=J4a3urD6ANtX/C1E16zTKp/AppKr/1hG/fWBPiZMGxb0b8HIMQth87KIMveidssYg59SCKedDgejm1/kzVd7U9TiDGrfyWGumWOvS+sFda+8XuiXBoIiAvoHKFbteOghsrRLdowWQ9PRiZCrcxK9/3ifToweaDnNJdjVTT7AU7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755065854; c=relaxed/simple;
	bh=QfpgJxt4vVfX9D+LMcaeR3KA7o8uXixB0e3tRfRG5Zc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nlFOaFBOdpQsVDdvIgfkdeiJ4c6xzH1+bE5HKKnkLQ5ZJNb7bquuULIpbqQSGPFZ2Ytkz6VyOSP+aXdvB3kXmsxNLI8ZUFudECrlYxhCPBr0Qd21Qoel4K5h8Zl2vueOWLCmPTIt5Bum2JQwGGHlrGVs2Ha0FwtIHRUOfpYfyLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wYMVt9FF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=V08Gn3Bk; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755065851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KtqXVv5v+JHh4hPKtb6GPn1kobYikrH7rf3LKQjhTW8=;
	b=wYMVt9FFhDxcPgWIFLe4gjZWh3nD92Fk1GZuVYRoBEUdrYW7nFUEpZUXelhf2cZX/2ay2K
	5zaL4M7RmmPaxtPo0x2i88hRg7qlVUia/nMFDQvI/DcY7xXQzUuXVEoaE9qPU8cZG1fyJT
	J7YNHfm+2C4W2Lk3ygnzxh43m4MNFSYXZHlldZezGZMFBsSEI7X2H4hTBwVqOM0T6RS35l
	M103rbHY0QrbxTJceq9ytIbDH1Y2aNY777S3q9TtFj+kG3exHlhHLmlEJBwmby8+AdelPI
	wuI0nWcivmzpJBb32SyqqJal/cpcBPJudqn/yCHWX1aRUX9fMn1AOyOCMG+9GA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755065851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KtqXVv5v+JHh4hPKtb6GPn1kobYikrH7rf3LKQjhTW8=;
	b=V08Gn3Bk6QVe71pSSuvjs1rWf6GRkuBe4zUelhpBPwQgFeIO6hkvSyxtWBkJOMjiEk8plz
	NJ6Q9yFiKTuXcaCw==
Subject: [PATCH v2 0/5] kbuild: uapi: various fixes
Date: Wed, 13 Aug 2025 08:16:55 +0200
Message-Id: <20250813-kbuild-hdrtest-fixes-v2-0-8a7921ca3a03@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANctnGgC/22NzQ6CMBCEX4Xs2TW0yE88+R6GA2UX2Uha0xaCI
 by7lcSbx28m38wGgb1wgGu2gedFgjibQJ8y6MfOPhiFEoPOdZk3SuHTzDIRjuQjh4iDrBxQmUF
 dalMQUQFJfXk+imTe28SjhOj8+3hZ1Df9Der/g4vCHOuOdDdUVU9lc5vEztE7K+uZGNp93z8rT
 aWTvAAAAA==
X-Change-ID: 20250811-kbuild-hdrtest-fixes-1bf147b3ddd3
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolas Schier <nsc@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755065851; l=1215;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=QfpgJxt4vVfX9D+LMcaeR3KA7o8uXixB0e3tRfRG5Zc=;
 b=uv1vye0jBorib/+wUdvUerGS9OsvevBn6QwlN9yMu5WVY8ZJAbs1eMOlhdjv5N4Cpq+/Tu87G
 smOh3E6Mw+WBN2WBwNf1/5sLhwZ1xpLnDoazvSlMAoRA4x/EL0Caxus
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Various fixes and promotion of warnings to real errors.

I didn't add Fixes: tags as digging up the original changes would be
cumbersome as the code moved a lot over the years.
Backporting this doesn't make sense anyways.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Changes in v2:
- Drop patch "kbuild: uapi: only update hdrtest output on success"
- Pick up review tags from Nicolas
- Link to v1: https://lore.kernel.org/r/20250812-kbuild-hdrtest-fixes-v1-0-7ad2af66cd58@linutronix.de

---
Thomas Weißschuh (5):
      kbuild: uapi: rerun header tests when headers_check.pl changes
      kbuild: uapi: fail header test on compiler warnings
      kbuild: uapi: upgrade warning on asm/types.h inclusion to error
      kbuild: uapi: upgrade check_sizetypes() warning to error
      kbuild: uapi: upgrade check_declarations() warning to error

 usr/include/Makefile         | 4 ++--
 usr/include/headers_check.pl | 9 ++++-----
 2 files changed, 6 insertions(+), 7 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250811-kbuild-hdrtest-fixes-1bf147b3ddd3

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


