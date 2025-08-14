Return-Path: <linux-kbuild+bounces-8452-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28447B2625F
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 12:21:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A11F5C3C67
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 10:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C5030BF64;
	Thu, 14 Aug 2025 10:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="reLH1ZTm";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HEoV2FG8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01702FD7CE;
	Thu, 14 Aug 2025 10:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755166500; cv=none; b=REPrQah2awRWVeRbImP0L+Gkdti/0LmaD22i7uf2QvU/hAj+v1KJh3W4ApqaopTEeHAHCLiP9IwwZrGkaIjEZJTCIi8k2BScKlJeW5oes5lESG+FOEG8KmTaVhww0NpQip0nPKvKXF4FXLT8NGjAZvmc8Ep6A7lp8F0t46zwokw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755166500; c=relaxed/simple;
	bh=qc6s/o/LyYp06RKUIld/LehlwrmJT/8PCAa5xj674fU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qK6lOwv8lb3q3t1LGJ6Xg1AYcDn7qF/AD3v+g3RPoZrsZThO795HRvQUt1HsbyfOyvTd7dPQ4E7TxdvCat5FPzq9buOi03pfnpGyMrWN4/2rGfHV1p/wY52ALFhEVY0tdosmDy10ycaToA+NGlx4NCAhEXxbiw8aMim+yclmmfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=reLH1ZTm; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HEoV2FG8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755166497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JGXNHovK0Rv6hJZnkYAoodDdRUtyycKbdiEHDzpvrj8=;
	b=reLH1ZTmOhIveTpqqLUUeK6+jtJgljbayWp/xMzc1TzwdzrrvEp5aH93seAz2E0geYs1Uc
	E7NLxoregfP8Hx6J/O+flF6Ubtk5JCGdW8OsycY52IGr8JuWAtIyNXmfp8SV94tHYUZS7b
	8wroHXql9rSzWxKroz5AQpuonPXqQlABnYf2+7d9K7u60lg0YcLBdRLFPPBVp0owQW6v6F
	FHGbLALBNwkB3fuAXeI23+7r7YRNeJcSFwImu48kGTa69k+yXwvEJwkyzgbIVxdEcZjxtu
	JpaWG/Yjbyn/7qarrZXKDF16tsKUbiKZ/LIpy10QiSdg7xGiC+5ySLlUMOFeVQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755166497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JGXNHovK0Rv6hJZnkYAoodDdRUtyycKbdiEHDzpvrj8=;
	b=HEoV2FG8rYYUSXPEBsJjInuYE+hL1jRlx1fVsQ+MqeMMPW97hoMUIeN6PJXpmVxyKLNa0d
	VWl/sf6h8m3kJtCw==
Date: Thu, 14 Aug 2025 12:14:42 +0200
Subject: [PATCH v2 2/6] kbuild: unify W=e and CONFIG_WERROR
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250814-kbuild-werror-v2-2-c01e596309d2@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755166493; l=1167;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=qc6s/o/LyYp06RKUIld/LehlwrmJT/8PCAa5xj674fU=;
 b=vNFyLfyI/yZ6kHHhLdDv2uacUtjaYvYbU5Huz5Q0CnegkpJiM3Z7Ly4mXi+XrmglcdDjOU/XB
 wXfUqwOr2mEC3BpRyFnJef279kWhdtwACyO9uGzNTOw2kWFtgiYVsqR
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The two mechanisms have the same effect, unify their implementation.

Also avoid spurious rebuilds when switching between the two.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 scripts/Makefile.extrawarn | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 4b4e8e136ce6b45f43dc7658eda78ae2b37bd792..1ffc7beca43bc9e373064194dc8975182815a872 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -25,8 +25,6 @@ ifneq ($(CONFIG_FRAME_WARN),0)
 KBUILD_CFLAGS += -Wframe-larger-than=$(CONFIG_FRAME_WARN)
 endif
 
-KBUILD_CPPFLAGS-$(CONFIG_WERROR) += -Werror
-KBUILD_CPPFLAGS += $(KBUILD_CPPFLAGS-y)
 KBUILD_CFLAGS-$(CONFIG_CC_NO_ARRAY_BOUNDS) += -Wno-array-bounds
 
 ifdef CONFIG_CC_IS_CLANG
@@ -214,9 +212,9 @@ KBUILD_CFLAGS += -Wno-unused-parameter
 endif
 
 #
-# W=e - error out on warnings
+# W=e and CONFIG_WERROR - error out on warnings
 #
-ifneq ($(findstring e, $(KBUILD_EXTRA_WARN)),)
+ifneq ($(findstring e, $(KBUILD_EXTRA_WARN))$(CONFIG_WERROR),)
 
 KBUILD_CPPFLAGS		+= -Werror
 

-- 
2.50.1


