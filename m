Return-Path: <linux-kbuild+bounces-8353-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0D6B21CDD
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 07:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA2DD4669DC
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 05:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F0129BDB2;
	Tue, 12 Aug 2025 05:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1RTwGAlR";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0xCyD6x9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A749A1B87F2;
	Tue, 12 Aug 2025 05:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754976716; cv=none; b=CV7SdgGDdrQEQ/5nbMD83T5jgHhwv4UEc0iYlO5UgnJTPtYNKg+8eHFpjRmPgAtszxMQ4qnsFvlJeEVqTwFx2TLNkX4/34K3SjCdCPBDt538LvYBDqEI9cE5CGo+xhLifFjaFGKyJmWBwyZnwnGyZ5oXQMKruL9h3qL4nmE4Lbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754976716; c=relaxed/simple;
	bh=199jqnuENzWnrpGEyS7K8NCNISB0w+htLgooBWZBoSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WtlHdepzfIwDlSuBfB7FmMo+pA3ZVYsdNWa9nPUz6C+OxvpX2BlNi2YBGt71G5Nc6LuCVKLzmRYRKgr9j0adzzDAF205x26a+9fGSf34IZlz2Y06gP+UuWebA11VLipElRlZJi5UOHWuxx+SbE37/HLejwcea8Ndxj6M+1Zx1nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1RTwGAlR; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0xCyD6x9; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754976712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Fgbf4fMGL3aMEojbqf8eZ7kbt8x9M3xaRMZUgtDiLc=;
	b=1RTwGAlRr1vHERRQUZ8KQxyUMmRm5PjxMpIuCAy8UsNZ25QbqKIxJE7lbvXRMWQA1VmYbE
	iqrJUhVtyfeYNLd2sPI4WuuNJCaZvyM8C1QbuLyU6Wk7/TRBdMFvZI/GPIP2FFRVFkWB+6
	R2BIv6lZBZhobAn+gxADTwO78LFNGfnJJtGmqoz8AwqY2/Pidg3iY/UoOrbZpsKV4su09S
	6beRcEktEC9IrKO1xENFX+UgVypVzZjCYngaAoA9ogbK2f4jqX2LFpeZs63iQcOp3R+76V
	WHjujG8mWdwBKRxOZrIcE5fqkH6Bj6gHBXRNK81JLH0ALqe4MEL+MME91rEFPw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754976712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Fgbf4fMGL3aMEojbqf8eZ7kbt8x9M3xaRMZUgtDiLc=;
	b=0xCyD6x96MDmqfYg1piwzeem07nzrPLJOuPV+gKmct/QDwO7lXGac4fQZckvah77qYe0d/
	ohc7FXto9d8DTjBg==
Date: Tue, 12 Aug 2025 07:31:40 +0200
Subject: [PATCH 2/2] kbuild: enable CONFIG_WERROR for more build steps
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250812-kbuild-werror-v1-2-36c9ff653700@linutronix.de>
References: <20250812-kbuild-werror-v1-0-36c9ff653700@linutronix.de>
In-Reply-To: <20250812-kbuild-werror-v1-0-36c9ff653700@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754976708; l=1036;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=199jqnuENzWnrpGEyS7K8NCNISB0w+htLgooBWZBoSw=;
 b=TcbxOA384FmqtpyGxKlcvKrdS4SuCHHs1cH17xG/17i/zl7tzl7UCvrmUlJvax0dg5TOFKfId
 u6Vwnu840SIBb8VfKRDipCT/iBOGVWaE+p21oNX4t7YF0d79hsj/rbJ
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

CONFIG_WERROR is useful for all build steps, not only compilation of C and
Rust sources linked into the kernel.

Also enable it for assembler and linker invocations, userprogs, as well as
C and Rust hostprogs.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 scripts/Makefile.werror | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/Makefile.werror b/scripts/Makefile.werror
index db14b5490ba83444be39a18109f103cabc5b95e9..e741ae45757c7864f5132d37f39fa3fea5b9d247 100644
--- a/scripts/Makefile.werror
+++ b/scripts/Makefile.werror
@@ -7,5 +7,12 @@
 # ==========================================================================
 
 KBUILD_CPPFLAGS		+= -Werror
+KBUILD_AFLAGS		+= -Wa,--fatal-warnings
+KBUILD_LDFLAGS		+= --fatal-warnings
+KBUILD_USERCFLAGS	+= -Werror
+KBUILD_USERLDFLAGS	+= -Wl,--fatal-warnings
+KBUILD_HOSTCFLAGS	+= -Werror
+KBUILD_HOSTLDFLAGS	+= -Wl,--fatal-warnings
 
 KBUILD_RUSTFLAGS	+= -Dwarnings
+KBUILD_HOSTRUSTFLAGS	+= -Dwarnings

-- 
2.50.1


