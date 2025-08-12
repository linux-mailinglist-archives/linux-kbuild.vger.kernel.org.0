Return-Path: <linux-kbuild+bounces-8352-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8CAB21CDA
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 07:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C65C7467608
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 05:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8007320409A;
	Tue, 12 Aug 2025 05:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fULi33JI";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mQU4KmAL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9C91B87E9;
	Tue, 12 Aug 2025 05:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754976715; cv=none; b=h2mW4K++I+sw1cAuhEQUVXPOc5hv1VeNmQcTc0MO4q0NXyNhXZMpeSuKPjMaGYR6HzC4gpeMxOVZQXMYwPYDx3CVKXnABwwbALvYCypC93DPD43QaKCKRhz29s+uLIIepTWiGr73ZwR+kMLkFL6efT7ZWecXEqbifqihhRMulb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754976715; c=relaxed/simple;
	bh=hGlRGUQPOxYdXO63IY//FAbcfpSGiOPeueyUZO+4+qs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kv1VNw76Dc/RhKr7YBZZ/w83fappZDFN2HXjwv6Qi9vclW2suKN5BNm65HujRrWnWwQecxNon62YlyEUiZhMMvOsznjdGpMZpowtQjQS2OECSrisaeY84trqacMiI3rjuhGknhniUx1SyJywJ9x3lSisTYCDizCokdn2WU7hAd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fULi33JI; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mQU4KmAL; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754976711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=olWvykyxI1rrVqeY2oJHymcMd1aXrfVsmUw1sQfuxtw=;
	b=fULi33JIi2PPC5Wrhj5sq5utItOVseJMOWxH+jjjVHhufDM4X2IJg9qJKT5spPlftGwBcs
	fi+RsNfaGBfgofwNIZhCnA6trYuTWoZFd9l0cSpAovZ+9qkdB8CmWXYDasH++fDR43JX1d
	prjOhVF9krOWedkFN2i8J8xVG1GIQVj5iBvyRRWu5KE7kmHaq8OIWf/OXhOQU80M1FYJ5a
	kmY11u+LX6C+xUhxh3hi8mohVk0WhOHR2sQVSAqz4MVLUTPvPGkEQ5O/W5CxBzNGpDxxGh
	K9ey0bmnxaP81VCXNv/L7FyW72xVrnWNtTECKaXKoE8AVv7ZbUw4ObMi6cm+AA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754976711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=olWvykyxI1rrVqeY2oJHymcMd1aXrfVsmUw1sQfuxtw=;
	b=mQU4KmAL7z9bNVoYygJ7EmcpJYAx7eDf6ygC9tTVjkjq2d9K8GyW1UDD13k0C3ueScEb62
	j55gUjD8y86+toDQ==
Subject: [PATCH 0/2] kbuild: enable CONFIG_WERROR for more build steps
Date: Tue, 12 Aug 2025 07:31:38 +0200
Message-Id: <20250812-kbuild-werror-v1-0-36c9ff653700@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALrRmmgC/x3MSwqAIBRG4a3EHSeoEElbiQaVv3UpLK70gGjvS
 cNvcM5DCcJI1BQPCU5OvMUMUxY0zn2coNhnk9W20k4btQwHr15dENlEaWdCbQNgPCg3uyDw/f/
 a7n0/ABlcyF8AAAA=
X-Change-ID: 20250801-kbuild-werror-081f72fee1de
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754976708; l=810;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=hGlRGUQPOxYdXO63IY//FAbcfpSGiOPeueyUZO+4+qs=;
 b=dBM7DmTCkJrN4VCYN+tAjRS+QAvBtS+uOysxlNLGBUSv0XGrFRema4cNncOuIndbwp1Sa5U2n
 DEa3pKIq5xYCxZD2E5+3jG4HtKmzcuB5QhtB1GSjgGI88IAjczrZbeD
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

CONFIG_WERROR is useful for all build steps, not only compilation of C and
Rust sources linked into the kernel.

Also enable it for assembler and linker invocations, userprogs, as well as
C and Rust hostprogs.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Thomas Weißschuh (2):
      kbuild: move existing CONFIG_WERROR flags into dedicated Makefile
      kbuild: enable CONFIG_WERROR for more build steps

 Makefile                   |  4 +---
 scripts/Makefile.extrawarn |  2 --
 scripts/Makefile.werror    | 18 ++++++++++++++++++
 3 files changed, 19 insertions(+), 5 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250801-kbuild-werror-081f72fee1de

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


