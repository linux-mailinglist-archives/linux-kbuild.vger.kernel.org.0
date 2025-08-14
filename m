Return-Path: <linux-kbuild+bounces-8450-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B50B26267
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 12:21:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F89C1887CA8
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 10:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5DE30BF50;
	Thu, 14 Aug 2025 10:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HPEJjy2C";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+r3+Uw9Q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A502FB960;
	Thu, 14 Aug 2025 10:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755166499; cv=none; b=e/MW1WiqzaHC9D0B6C8DFNDK8T5Nwn8VQPSlSBWmMQnqtQKkAe/+UNB5Qnaf7jyIw5VX7DDk0GOdPrXG4tKNOexlKlpgFmPRUAyRbeCloHMU4BZ/aD22oh4Z3UXFD6fr/wuyBrQLexvNatxlHyvjwVAJkKZxI+tOchoND2sD/0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755166499; c=relaxed/simple;
	bh=pa8PdBnag5fYYJVttkJ4ojzfP+jzfXoOjQRbMlzFjEY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VnPwRFrCbVbZ4Wltc1R0UiVDu9b+Wx6BT1j7lPJgRitoECTuggKDNx3LM1olJuRvZu1Rms03trXzcBkBUFgLWaR4IEk/GfhyDZ4pa88CqdxVdUPeKjQELzTxUMN+GaU1NH++97Mo8oYJDs+HTbHowCgz9nP7PF0AbP64bEliiW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HPEJjy2C; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+r3+Uw9Q; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755166496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EBpqRI6i2kXSfd9AzTzdOpLrFWh91/jGpWY95euJX5k=;
	b=HPEJjy2Cbh+rgvMXx0/c02wNDIA0BpKXcJ5aRR39Tk+T+A0v3NX9PSCvLBXkvhgOatFxCf
	FBM1HL/BU6Vp9h+Gyoof2N7GbOQHhIrux0NHZGYpjw7nrctnvpQz2O2Fm9Lv5kQCzAuKjH
	woL/dTO0/vZ7DjtHslMr1Tvw2recS035qMIpl6P95iZEVYYuO4VPHvbch/4Kgg0Jxl4Ugg
	990rR4I4eGMDCqNPvKFUcpwfEV5n59exFXRFwomuXfaFI/erttpJV558S44cdZm8Q+uD+X
	MrHwjRVSejEhVS9RFliOiJIcb6jZVQdJWLYzP7LGYTd/mp1XRKl2XYtSuL4Kjg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755166496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EBpqRI6i2kXSfd9AzTzdOpLrFWh91/jGpWY95euJX5k=;
	b=+r3+Uw9QPQyY3dJat11egGmNhIB6io8ka5g1VlKGsKrwGVuAC9vAGYQ2EkXSmUXHWJwpYV
	yik/5aMOSBg4kzBw==
Subject: [PATCH v2 0/6] kbuild: enable CONFIG_WERROR for more build steps
Date: Thu, 14 Aug 2025 12:14:40 +0200
Message-Id: <20250814-kbuild-werror-v2-0-c01e596309d2@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABC3nWgC/13Myw6CMBCF4VchXVszLeGiK9/DsFA6lYmkJVOoG
 NJ3txJXLv+TnG8TAZkwiHOxCcZIgbzLoQ+F6Iebe6Akk1to0BW0oOTzvtBo5AuZPUtolW20RVQ
 GRf5MjJbW3bt2uQcKs+f3zkf1XX+S0n9SVBJkWfcna+uqbAAuI7llZu9oPWa8Syl9AGipmtiuA
 AAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755166493; l=1487;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=pa8PdBnag5fYYJVttkJ4ojzfP+jzfXoOjQRbMlzFjEY=;
 b=Se4TW3EW+EJeKpwq2Y760ReNkGjdDVXlxP/8HXWtAKeJMEnvq0VC7N91W5FSgxNpUZqCrmw7S
 cBPm/dzLwyTBh1QOLANVpRpCza1Ict73l0rCOwP/+9FdnQhnIDfEFG4
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

CONFIG_WERROR is useful for all build steps, not only compilation of C and
Rust sources linked into the kernel.

Also enable it for assembler and linker invocations and userprogs.

In addition unify the implementations of CONFIG_WERROR and W=e.

This partially implements features of Miguel's Rust -Werror series [0].
The changes to $(common_rust_flags) are not incorporated as it also modifies
Rust hostprog flags.

[0] https://lore.kernel.org/rust-for-linux/20240519211235.589325-2-ojeda@kernel.org

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Changes in v2:
- Unify CONFIG_WERROR with W=e
- Unconditionally enable -Werror for C and Rust hostprogs
- Link to v1: https://lore.kernel.org/r/20250812-kbuild-werror-v1-0-36c9ff653700@linutronix.de

---
Miguel Ojeda (1):
      kbuild: rust: move `-Dwarnings` handling to `Makefile.extrawarn`

Thomas Weißschuh (5):
      kbuild: align W=e with CONFIG_WERROR
      kbuild: unify W=e and CONFIG_WERROR
      kbuild: respect CONFIG_WERROR for linker and assembler
      kbuild: respect CONFIG_WERROR for userprogs
      kbuild: enable -Werror for hostprogs

 Makefile                   |  3 ---
 scripts/Makefile.extrawarn | 18 +++++++++++++-----
 2 files changed, 13 insertions(+), 8 deletions(-)
---
base-commit: e8ee794a1f7705edd64b9eb9837e7baa4421c084
change-id: 20250801-kbuild-werror-081f72fee1de

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


