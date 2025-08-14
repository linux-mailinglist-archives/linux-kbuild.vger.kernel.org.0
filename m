Return-Path: <linux-kbuild+bounces-8453-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6854B26274
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 12:23:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCA53A262F3
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 10:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D56F30BF7C;
	Thu, 14 Aug 2025 10:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vALB1DMe";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dtAFNzlZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589B430BF45;
	Thu, 14 Aug 2025 10:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755166501; cv=none; b=dZ9W6skRJEly/5rGm3SBHnvFRqlo/MZObweAnrJqlA9IxyJFw2jZjgXCAAJNeDA/TahaV+3t1ydVVkgNWnfq/wDdke60n4HSWH73gpJV1nyXJeUZlGN29sWcKbqGomxutRfVjLT1At3YKsp2bCFgUbbyekhUcPtmcoJAoNlkXwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755166501; c=relaxed/simple;
	bh=2F7nxcTe7hXryFkci/KCe/kGxSHE1bkTeg5FE3ZVLd4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OjE0TYjFgHQYIkxcvKlhCT3w3ILFG4TWOFI0P5+2SmJT5Z5SvBvtoWXv8YPkbWUMeKxkALmkPyk94WDqmAe5hFYqgVFs8J+izlQMAZmS30V5xXIXIM/G/fJfVO/07NuN9dCX6Up3BV3ziz1KTxryhJew7IP9ZoCoFU4Cepf0bcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vALB1DMe; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dtAFNzlZ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755166497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TKEeX77iwhdlQ8dac1b+w5iNdxbmLR5Puf3vvfvbj58=;
	b=vALB1DMeIxX7n0WQ/CJEoKMQuXC8xlh4nbR7zWQbVLgYTU22WLCrkf+s/C/NTT7Anku2Pc
	s7b8sSYwX6H9fPFlcv/0TY9OyS1TrjhPMI698teGmSTjsNgpQ93lo37ls4IpyY9ES/Kx7n
	bchypCyMN4EvSjFiu65QbIciwbEwwb47f0KM799vvnESchPFkny7JIVStyHEEwJUfuLszN
	E5wyLZJxP/GjXckZ/Vyq5upas01eflaZzGioX3RY3Zj+MU1pumKVdh2BYJcxi3jyemDYlK
	K3DOKcNoSpbLx6EQO6as1r8eAeleqKECeT4m5dh9a4LQjs5HoIB+3aKYI9kwDQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755166497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TKEeX77iwhdlQ8dac1b+w5iNdxbmLR5Puf3vvfvbj58=;
	b=dtAFNzlZNi0x+f89/xVUw/2pFUzToACOk4fyeWzIOfRBzj/uSOwmC+cFR1O7Afkd2PiinB
	dTWLc/c4d0lMwTCQ==
Date: Thu, 14 Aug 2025 12:14:43 +0200
Subject: [PATCH v2 3/6] kbuild: rust: move `-Dwarnings` handling to
 `Makefile.extrawarn`
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-kbuild-werror-v2-3-c01e596309d2@linutronix.de>
References: <20250814-kbuild-werror-v2-0-c01e596309d2@linutronix.de>
In-Reply-To: <20250814-kbuild-werror-v2-0-c01e596309d2@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755166493; l=1356;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ii4ARBWmvlOmKgONh0VQaqjjFhoXOCbpDHXbIE5Bd0k=;
 b=WSOhmy0Y9cQaBX0ourPWdygl4ATiiF6LsDYIeHSfIjScIA6wauBhlbye5C9jQA7eoT0CuTorU
 G7/2QW/McfwCGMuZPWncj7lGddlaBFAwSGrFI1SxEDkveAPV7RgmSYA
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

From: Miguel Ojeda <ojeda@kernel.org>

Following commit e88ca24319e4 ("kbuild: consolidate warning flags
in scripts/Makefile.extrawarn"), move `-Dwarnings` handling into
`Makefile.extrawarn` like C's `-Werror`.

No functional change intended.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Makefile                   | 3 ---
 scripts/Makefile.extrawarn | 1 +
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 6bfe776bf3c5ff0cf187dc6719dd5817cd4af2ca..6630a66659c6d1ca7e72448b04d16c3fdd1fbe24 100644
--- a/Makefile
+++ b/Makefile
@@ -901,9 +901,6 @@ stackp-flags-$(CONFIG_STACKPROTECTOR_STRONG)      := -fstack-protector-strong
 
 KBUILD_CFLAGS += $(stackp-flags-y)
 
-KBUILD_RUSTFLAGS-$(CONFIG_WERROR) += -Dwarnings
-KBUILD_RUSTFLAGS += $(KBUILD_RUSTFLAGS-y)
-
 ifdef CONFIG_FRAME_POINTER
 KBUILD_CFLAGS	+= -fno-omit-frame-pointer -fno-optimize-sibling-calls
 KBUILD_RUSTFLAGS += -Cforce-frame-pointers=y
diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 1ffc7beca43bc9e373064194dc8975182815a872..b04b3062e0e49c3ae7471973251017e8738cd244 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -217,5 +217,6 @@ endif
 ifneq ($(findstring e, $(KBUILD_EXTRA_WARN))$(CONFIG_WERROR),)
 
 KBUILD_CPPFLAGS		+= -Werror
+KBUILD_RUSTFLAGS	+= -Dwarnings
 
 endif

-- 
2.50.1


