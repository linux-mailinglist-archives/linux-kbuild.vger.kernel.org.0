Return-Path: <linux-kbuild+bounces-8356-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CEBB21CE4
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 07:33:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E889467A70
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 05:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 337E52C21FE;
	Tue, 12 Aug 2025 05:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XnX17NgP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="17Ujucg0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F276279DAA;
	Tue, 12 Aug 2025 05:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754976794; cv=none; b=fbfG0qLDUle2sZwDc66RhjRpvcb8ZPNS7pogxyphz4jFy+/QHOrDSfdcWi8vO1mgwLlVVQSta2ut+s0ghCzhCKsE2l3fHfCVpaimWU6P8VHhuuiFqCTj4O7oObllOkaSauHxut+X91pC63G5r4Og+82EMbflzPHB8QCMb8RkZsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754976794; c=relaxed/simple;
	bh=2dSS2jCFNlVevbx8VAMk9A+PtdF82mI0eqDvvJuusTU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oz/of5BRwcx/JH8OSQ8lSETsokk7WwIsnbobKhReMST83N3itx0TMTedz+88yIJl3Ih/p5SN7hAP5Pfj8SVQre5jpaWrKV89+2Iib9EVr0+1vJtdTGHTnbdTwt0wc/+HU1G7/AW0ScKKOMXlrLPUGwbLYN2RAa8eOd7RcIMdbFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XnX17NgP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=17Ujucg0; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754976790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jX8mAIJvEPb+65oHPBkYjryEElD2kYJYeMruHsijwF4=;
	b=XnX17NgPLasefRuv5zXJX77yl9sl169kQndBXumLe976o3GSwHilk4rwis8G4yk+H6TL5X
	+lvjOKUGXC9H36+BYsHQB65Tr9tz01a7m91/kc3F/xIx7DuqTbe4GpatryiHZnfx82vWNB
	CeVlMOol7fHXAoRAYy/8Tp+k2mN6SeTAh+vUq2+sPRoP336RI60E+duEOse7QgImWSfTY2
	JjiLcX0seDORCfRXP0lpP2a+cEYFy173ilAzRNf4rsI62qu6aU28IXw51Pql7ZG7HZu5yZ
	/KV5kKJoeY8O3neXsJO2/0LFRzqNBrKK9gRl588wKQCohnHzbwmMQtFijMLb4g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754976790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jX8mAIJvEPb+65oHPBkYjryEElD2kYJYeMruHsijwF4=;
	b=17Ujucg0NOjgNVmntdw6SwusTKOltx/YDB9dXKVm3q9Yos4aPnHYWCwojSz0+3cSl4yeTi
	ux3iyJPLOqDzNPAg==
Date: Tue, 12 Aug 2025 07:33:05 +0200
Subject: [PATCH 2/6] kbuild: uapi: only update hdrtest output on success
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250812-kbuild-hdrtest-fixes-v1-2-7ad2af66cd58@linutronix.de>
References: <20250812-kbuild-hdrtest-fixes-v1-0-7ad2af66cd58@linutronix.de>
In-Reply-To: <20250812-kbuild-hdrtest-fixes-v1-0-7ad2af66cd58@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754976787; l=1168;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=2dSS2jCFNlVevbx8VAMk9A+PtdF82mI0eqDvvJuusTU=;
 b=Q6Xz81+h8YM6lQLt9HTunLiOTLI2Mx0N7Xc5iTaUVlDJ5qZGnFsLTqdg8T70cFj9soT70c630
 k4LFjSz1rvJAS3R+P00Fe7EVtQXC9FJ6le1s1h1GtKeRE3T0QwqXSlt
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

If a header test fails, the output should not be updated.
Otherwise the next make invocation will not rerun the test.

Also headers_check.pl should only run if the syntax check invocation
before succeeded.

Add explicit sequencening.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 usr/include/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/usr/include/Makefile b/usr/include/Makefile
index c7f164952b33acf6c7b8eb7ce91cd192bfc39ad2..6868d183f36d532cd3d4023b936c67b8a58a9ba5 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -81,8 +81,8 @@ always-y := $(patsubst $(obj)/%.h,%.hdrtest, $(shell find $(obj) -name '*.h' 2>/
 quiet_cmd_hdrtest = HDRTEST $<
       cmd_hdrtest = \
 		$(CC) $(c_flags) -fsyntax-only -x c /dev/null \
-			$(if $(filter-out $(no-header-test), $*.h), -include $< -include $<); \
-		$(PERL) $(src)/headers_check.pl $(obj) $<; \
+			$(if $(filter-out $(no-header-test), $*.h), -include $< -include $<) && \
+		$(PERL) $(src)/headers_check.pl $(obj) $< && \
 		touch $@
 
 $(obj)/%.hdrtest: $(obj)/%.h $(src)/headers_check.pl FORCE

-- 
2.50.1


