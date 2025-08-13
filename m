Return-Path: <linux-kbuild+bounces-8427-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F110B24142
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 08:17:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18D121890D16
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 06:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C172C3242;
	Wed, 13 Aug 2025 06:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Xo/VONKK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="n23oYa/y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E0A2BD5BC;
	Wed, 13 Aug 2025 06:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755065855; cv=none; b=PwCLa8z0/s08hrHJAzQW7nYBb6HILFKwrX5F5wbMcIQhHaLRmvgyooIb13dAPsM5vSrzEU1asBNFYhQ1w31Gkwwl7kWtA1doNS/+7huUgQ6fU9NM0fsYjdb8YoYZHyW+xv2exLNGf4fj7Tv2cCJ95e71+odVAn2ShcBKNV5i+5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755065855; c=relaxed/simple;
	bh=hGD1Xk4CyCtbyQNtKzuOFhKivBxKtvGCFOlOotG/MGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rnY9KbazpW5gx2VVxuYT9wNARvwPeBb1ILzzCGJE37fucXwRV/oL50rdYo/w0bUYvPlz2YW7K9/em4xcQWB+N6ngOrXT0Z96hLWsDSQbjOC1H1o+nMApn/5t7KoidVcIH7Ri0boidE0UsHmfe5GE1Zhm/1pGxPOlFxKdISBaJx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Xo/VONKK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=n23oYa/y; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755065852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Ii0CVpVwuPC0DCc+uSADJuPPRgXUAgjPCiyH6hpDHg=;
	b=Xo/VONKKgk04hfn061RqKAeNMnZ4rheUQbiFzVjTH4rtHeP8P3nDaRVZlRul5XXOs3rOG/
	mgXJ/G/Qg+GCmAn/4gjALHb/vZSarRB6XltxWepzdKp1QtWrJxP0O/TV9qZfCwcULUTBNr
	kfXBMa25QFPgyj3cYX0WMnlAF5s1iExd5oWePrCMgbcnx92z096jadHQu3SPJAIQ69MNZE
	RoHqI14GKysGZfdNZGQNg70pqQPZRE/KakzifwtB1LIGYjHuNzJVk1ZjYO9wyvCbMEn4VL
	wuI/0uiP1G/TyJRRBX55Bd+4cxaNzsNDr6pHgTzHjuHOQHevi0Ft9w6G+6zR3w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755065852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Ii0CVpVwuPC0DCc+uSADJuPPRgXUAgjPCiyH6hpDHg=;
	b=n23oYa/yKQGuyCLMPssbN+j30DgI9Yra9VXYIHFzxOPwLkFDousOeW2VorhKeoKyhdiQ4s
	P6jpSTni9O20axCg==
Date: Wed, 13 Aug 2025 08:16:57 +0200
Subject: [PATCH v2 2/5] kbuild: uapi: fail header test on compiler warnings
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250813-kbuild-hdrtest-fixes-v2-2-8a7921ca3a03@linutronix.de>
References: <20250813-kbuild-hdrtest-fixes-v2-0-8a7921ca3a03@linutronix.de>
In-Reply-To: <20250813-kbuild-hdrtest-fixes-v2-0-8a7921ca3a03@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolas Schier <nsc@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755065851; l=993;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=hGD1Xk4CyCtbyQNtKzuOFhKivBxKtvGCFOlOotG/MGw=;
 b=COcBT0Sh5pihLdkv7L3is/GJS1LNLtxtQMdkyqBjG2G5iFs04trAbEGQsW4nYU/QB/hq8HasJ
 WYFoME2jgssC1AO5jBflmbdhZWlBl+bOO0OQWFRC26B9MRfapcjNxvd
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Compiler warnings also indicate issues with the headers.

Make sure they don't go unnoticed.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Nicolas Schier <nsc@kernel.org>
---
 usr/include/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/usr/include/Makefile b/usr/include/Makefile
index c7f164952b33acf6c7b8eb7ce91cd192bfc39ad2..61a7dd4fc05f004d785c64c0019ad846c84719d5 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -80,7 +80,7 @@ always-y := $(patsubst $(obj)/%.h,%.hdrtest, $(shell find $(obj) -name '*.h' 2>/
 # Include the header twice to detect missing include guard.
 quiet_cmd_hdrtest = HDRTEST $<
       cmd_hdrtest = \
-		$(CC) $(c_flags) -fsyntax-only -x c /dev/null \
+		$(CC) $(c_flags) -fsyntax-only -Werror -x c /dev/null \
 			$(if $(filter-out $(no-header-test), $*.h), -include $< -include $<); \
 		$(PERL) $(src)/headers_check.pl $(obj) $<; \
 		touch $@

-- 
2.50.1


