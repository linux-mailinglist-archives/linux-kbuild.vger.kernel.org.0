Return-Path: <linux-kbuild+bounces-8454-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6EBB2627A
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 12:23:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E971A26778
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 10:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18DA730C91F;
	Thu, 14 Aug 2025 10:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="j31T6Enj";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JtJJ7qfs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5B530BF53;
	Thu, 14 Aug 2025 10:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755166502; cv=none; b=eqwZibDhfA3h2fOZsNkeBgMlSwNCk9GDfA+x5Xz/AuBP/UJSOcFnkJ+r9cASmw0JQf7CCr1uHzxnL/JBivSOtinQomoBRPoIg3YMKkmo0FCAmQ/PYDJRTQHqTQg9lFP+CwH4+NPPNsdNynwnR92a7NZfWMb89qfuZCtozS2RW/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755166502; c=relaxed/simple;
	bh=NBqee1aVMn/SXi53H4inWlePlYoLzUuVMoqYmUyZV6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iKerc318iKowZ42bixQG5jIC3XWgLI6BxJRTDM0nS/WrZ4OFLpHF6TSfhlNrHy38osog7FemdczTHx/fipiDnG8DDpZWVwQjuBqCh6ENlRIKdeQbZKA/7ZQFFgF14oSKGssrwitK4AspikNakEh2mo0ZAvhnts1ZVt/RoZYjSYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=j31T6Enj; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JtJJ7qfs; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755166498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KfWWYTST21w8k61TdCEXDzlrxASLLCtleuIz5f50OrI=;
	b=j31T6EnjDjhfkoHhB3o0SfdFt5Pqsy8PfDlhLLe7vcFwhOIzN3aU8R0AVE9ioDBlm0eY0P
	pcO4tgtYSjzwG/NT9p6h4NYwDQLcZ/wUMap7FKqYOfla2uLtCsQvl7LmYQZXyucLtkUGpM
	pIpuPCYhwJrXrrI6t2X0zUMCaSWWeEMNqjvPtOrcaQZXcX/hAXOpO+xpw/RLAMHlexlewu
	QKgOz+QNskKvtpIx9Mtvyx2i5EUs2PgGciGYSsE4GYTJDcpE+rQh6spaD+fYHjJXjToSnm
	3Ycwhm+dMFDob0Va18K7Nxkl4CkMN4X3y81j/PtX0TE2i9F6TLIHX+8omm2nLw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755166498;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KfWWYTST21w8k61TdCEXDzlrxASLLCtleuIz5f50OrI=;
	b=JtJJ7qfsI7JHZ5UgjP08qT1l0lKCZu3HXAhDmeaV1MPACaAeETE8LiY1MgnONuzeG1FHHU
	MRBegGXAh/LNFsDQ==
Date: Thu, 14 Aug 2025 12:14:44 +0200
Subject: [PATCH v2 4/6] kbuild: respect CONFIG_WERROR for linker and
 assembler
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250814-kbuild-werror-v2-4-c01e596309d2@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755166493; l=772;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=NBqee1aVMn/SXi53H4inWlePlYoLzUuVMoqYmUyZV6o=;
 b=S53WlTiHeQyJS88eX7u1LfaIPxvWJzz/+ERrmebB1URYUsBvjJ89GdvWkxkSTIY3PU6DCHyWU
 h8uzEkdPmQ3CcefcmoZjwLzFHEhPnWrhhedwRC83rXlhFNHQntvabcz
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The linker and assembler do not share the compiler flags.

Make sure they also fail on warnings with CONFIG_WERROR and W=e.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 scripts/Makefile.extrawarn | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index b04b3062e0e49c3ae7471973251017e8738cd244..6efb9e5eeeed0696a061a17e029a92caba50826f 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -217,6 +217,8 @@ endif
 ifneq ($(findstring e, $(KBUILD_EXTRA_WARN))$(CONFIG_WERROR),)
 
 KBUILD_CPPFLAGS		+= -Werror
+KBUILD_AFLAGS		+= -Wa,--fatal-warnings
+KBUILD_LDFLAGS		+= --fatal-warnings
 KBUILD_RUSTFLAGS	+= -Dwarnings
 
 endif

-- 
2.50.1


