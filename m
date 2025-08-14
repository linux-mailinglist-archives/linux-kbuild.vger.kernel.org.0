Return-Path: <linux-kbuild+bounces-8456-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E886DB2626F
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 12:22:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02C845C2F8D
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 10:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E04330D09D;
	Thu, 14 Aug 2025 10:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QJ9KW2NF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NNaslw3r"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD78430C90C;
	Thu, 14 Aug 2025 10:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755166504; cv=none; b=qFdaF9tzea9+3snAtQ3NnStgZlLjuWDruoYB+Vpe3uxupywKCUMaYZpjVVrfLrVJdNJWDpAqgfY/R3UGM87k0I/r2mKcf85NZqi4sfJ5b5R72M/DM0xzHKuib29PoP0s5MI8FIMB0E7B+6iFAfEYRJ9tJayU4Zbqh7k0dN/MHJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755166504; c=relaxed/simple;
	bh=f1CS2VIWQbY8mqOlPEfsez31acj0r6vOn5h2GAEgQx8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qEOhaSHKQ93BRbpCj0Sd5I9OlkGPeM1ZX1K2sX9ivBH/ZXqh34liPQidu6cDCSGakbkMJesSwdKJKAIzA1HrMEgB3VwtxTSaZ5r+wFZYhnE//yD0HDLQYr6jeA2aO/H/V81FGoncsLRxaei8x6P7yZ3mxMMwNB5PT2JZY0utrJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QJ9KW2NF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NNaslw3r; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755166499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=to+JGxG1GuQ3pUanrHLU8cpAbRux/zwfu75r2skKHHA=;
	b=QJ9KW2NFL4djCo69Tkh6cENzgWu5nCipeYttVR5H70uTbVwx8BQlBPSoHvEvjpHw9i/nFp
	hrwv4luzZCN1ZG7aiC5KIoMz6eE+BSjptj1TeJ6ht5bnY9vviYLdGo2G58MeXwCsWxMLPo
	dALgv4hKChgjtoZogULpaz+Xjx61upjPt+MhsmoB43xNb9EWoXsZAO0acieRwuWmwbzcG3
	WvascBzJrIPR33iMVDHXFHrsztjLD9j0dJyHC+/13KKnn+qonHS/sTjXHthSgFMzygI4ZO
	xgjQnBuM+7h1HVx/c5dWyUsfnZACY0a3gQ5ICU/5a+powHkY2TE23HquxQ+2kg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755166499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=to+JGxG1GuQ3pUanrHLU8cpAbRux/zwfu75r2skKHHA=;
	b=NNaslw3rFrWQfsd+4ek8lyLoRIO1PGaiz6GNwom16RGpZJvrp03dXISEX0h9HLvVVyktpF
	2xfhZn3VqswBMcCA==
Date: Thu, 14 Aug 2025 12:14:46 +0200
Subject: [PATCH v2 6/6] kbuild: enable -Werror for hostprogs
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250814-kbuild-werror-v2-6-c01e596309d2@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755166493; l=1107;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=f1CS2VIWQbY8mqOlPEfsez31acj0r6vOn5h2GAEgQx8=;
 b=Ychs4ju/XrBO8iisbBKsFf5dGG0tMUlTh1L86wu4YL/VhEjedBC4es09EBmpqR3EPAt6SkfOO
 2K1Y4ahYIqID6BZRYF9WIZmtR5eQuEaNQ7AoK5CfBT11ktKRu6arLwU
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The hostprog compilers and linkers do not share the regular compiler flags,
so they are not affected by CONFIG_WERROR or W=e. As hostprogs are used
during the bootstrap of the build, they can't depend on kconfig options.

Enable -Werror unconditionally.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

---
For testing in -next, as discussed in
https://lore.kernel.org/lkml/20250812-kbuild-werror-v1-2-36c9ff653700@linutronix.de/
---
 scripts/Makefile.extrawarn | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 96ff3f5582d651f0016c8ccd49d46022cc6fe070..1434cb6208cb82f20aeb29cc8c059220d1a1f6d2 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -224,3 +224,8 @@ KBUILD_USERLDFLAGS	+= -Wl,--fatal-warnings
 KBUILD_RUSTFLAGS	+= -Dwarnings
 
 endif
+
+# Hostprog flags are used during build bootstrapping and can not rely on CONFIG_ symbols.
+KBUILD_HOSTCFLAGS	+= -Werror
+KBUILD_HOSTLDFLAGS	+= -Wl,--fatal-warnings
+KBUILD_HOSTRUSTFLAGS	+= -Dwarnings

-- 
2.50.1


