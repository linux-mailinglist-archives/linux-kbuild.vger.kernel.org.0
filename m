Return-Path: <linux-kbuild+bounces-8451-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 815ECB26251
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 12:20:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5453AB60786
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 10:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E71430BF57;
	Thu, 14 Aug 2025 10:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GjEX0AD/";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KXbLC4Mj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717633019DA;
	Thu, 14 Aug 2025 10:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755166499; cv=none; b=Q/cptU6aPc56pxMi/GB7RZjThauaP2ufvyas6f8wbf39GJ/OoZCU+eQWrwGorvrd3emVbeng01qqJzVu1BQZeS4bPoRmqrvNGKEuCVEcPiONpmGuCHerPyJYQv4W0WNS0Tbw5hPSXTODgObIsWFoaUkmi8lzP5AdQEFFg7/2SIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755166499; c=relaxed/simple;
	bh=ZuvIADmUUGtpchbKBOPgW/rNXtkxB2I3BNnT9Y+9wVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EdczG/Wfm9nQq6sawfH/wojk7p+HVYU+esg9nJRlgCDslvhZOXVXEn/WxEplX93rqtwMiv+4pvdodQu+QEo751WxN2UvcjuMVEaR+oFqeutJBGOZVe6K6m08zcZSgUCGaaZVoSEsAragLT8Dtlp4lxTQGGHU/5LwdECiNxWuv6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GjEX0AD/; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KXbLC4Mj; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755166496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cvsevthinn7F8DSgD8Man+edmmcMgA+QVpWsJlXj67s=;
	b=GjEX0AD/Wg/15/rLq8vNxADmR9+93K4bEo11Bhp6aFTQbNqHVrla3RvBTgqL25iICU7k14
	hZ7SIu1ccQTVWUAYqubjC61ZQnXpZngxISf3wFMvkOOkA83QodrPt0kb5LYJVMYG+asuuK
	pD2mrwmgBdDYV4pnBi6fSrDV/dOoasozhPqqU5CNr0JBGuOEtKDcgbR2Z7URwG/3dbMsg7
	Gkqeml/+Xk+jlO/iJrKbIKzfVSDyI+iftRs6RTQu4kQ4lRDGg260rEtt0v/223ZA80uOtT
	uFjHeW8Q84LrWkAFhRSYq8ouTP8E31DiUb69VXSZbyRQcDBxLB8bbpQsumClXw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755166496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cvsevthinn7F8DSgD8Man+edmmcMgA+QVpWsJlXj67s=;
	b=KXbLC4MjleoSXjOoHfYqkIdd7d+YtblH6c9P8CvqVQfvijhJFBS451wtMTCIy8PrgR+GPK
	dz7GVEOk6mdDZeAg==
Date: Thu, 14 Aug 2025 12:14:41 +0200
Subject: [PATCH v2 1/6] kbuild: align W=e with CONFIG_WERROR
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250814-kbuild-werror-v2-1-c01e596309d2@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755166493; l=819;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ZuvIADmUUGtpchbKBOPgW/rNXtkxB2I3BNnT9Y+9wVA=;
 b=yRMx73nOt0ndank2Cw5E4iHCsgOs5x+7rKmBDY0TYa9q0XixZgcjqgKtZVShobg1Aazza/ges
 900cnZBQgo1CCSNs9JD8j7q98LrmXmUL977RY2VK7PfCGn97KP4+Wmq
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

CONFIG_WERROR sets KBUILD_CPPFLAGS while W=e would only set KBUILD_CFLAGS.

As a preparation to unify the two mechanism, align their effects.

While at it, add some alignment whitespace to prepare for later additions
to the list of changed variables.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 scripts/Makefile.extrawarn | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index dca175fffcabeb2d942814f0a096a7efbf8bc819..4b4e8e136ce6b45f43dc7658eda78ae2b37bd792 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -218,6 +218,6 @@ endif
 #
 ifneq ($(findstring e, $(KBUILD_EXTRA_WARN)),)
 
-KBUILD_CFLAGS += -Werror
+KBUILD_CPPFLAGS		+= -Werror
 
 endif

-- 
2.50.1


