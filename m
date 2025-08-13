Return-Path: <linux-kbuild+bounces-8428-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96221B24146
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 08:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BE4216E133
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 06:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBFAE2C3755;
	Wed, 13 Aug 2025 06:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="I7I4l9xm";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fqQ9Fyfq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601E12C1589;
	Wed, 13 Aug 2025 06:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755065856; cv=none; b=ANfEC3gov56F8XueDaltB58hab88IX3zMe62F3DS9pFiggoEfsfGLuIASrYYd1tqMT7HjVRTyF3+rVUOgoOohgf60E3EUMHfdO4Rg25/6Lm9uJcuPFU4jdlJjkkocp7Vxaw9Dq31+9oqWhJPqqdOoMPF0hyS2HmE1j3XCvqAStg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755065856; c=relaxed/simple;
	bh=Quxn/mBPM3o4WRGn3gYbmMnYLCoS4oNQgYxFlhjvVZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=js9bDE+KPpqRhdYhX2cJT12pPxDwBbSsE1oECr5A2fjBsDbOHGb1vONniWDrI89lrWQJ0ZqAKe4LJdoMVvPnEisiAL3BOfNW1ZvhBt/csPXAP22LTCkbd2DubxpdcAgyxXPiIyXJy2cu4Nf35WQ8tRWYxja9BQJHvK4HCEhIgPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=I7I4l9xm; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fqQ9Fyfq; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755065853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jMaqWMFXrmGHYmScBMoCKvpUp8L3Afjo1tvHSrPfvkU=;
	b=I7I4l9xmakdVcrwyJwL3GEJDTuNp02gBRW5v+4766nJy0bVEBxnRe9rTtgA+6u1Q03Rhyk
	CNheiqAyUdsMp1+DOv3M6inE9bRtsvE1x/WCVV3Sh11ac7kdQ2+ej1HLCZ00E38QWfTN4m
	20/+qIsMRMzyxLmh9dLceF6pDot0pfnV2ktuAgRLMnzJsp0DmmKsmOb6CBHjoDjga2hSzh
	eTQfFugTZtBnIQ1m8I3iaWDWGIKBruVcswGGJYsCtutlq71t/JEder2QNWkdYcUsU07TMV
	zJvQEEtQAZPvoLJ/I1Arhd9D+l7i0a3vrJ3YXbtEV/AGhrOj2f9I9Xlt05GY0A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755065853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jMaqWMFXrmGHYmScBMoCKvpUp8L3Afjo1tvHSrPfvkU=;
	b=fqQ9Fyfqtr9q8VO0qsIVLHFDNn2pJZx5dH1kQRwJe4DRsdiw+C8H5CF/8xnOi44TZ4PwE2
	OT0rYvT72c3uIHDA==
Date: Wed, 13 Aug 2025 08:16:58 +0200
Subject: [PATCH v2 3/5] kbuild: uapi: upgrade warning on asm/types.h
 inclusion to error
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250813-kbuild-hdrtest-fixes-v2-3-8a7921ca3a03@linutronix.de>
References: <20250813-kbuild-hdrtest-fixes-v2-0-8a7921ca3a03@linutronix.de>
In-Reply-To: <20250813-kbuild-hdrtest-fixes-v2-0-8a7921ca3a03@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolas Schier <nsc@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755065851; l=1039;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Quxn/mBPM3o4WRGn3gYbmMnYLCoS4oNQgYxFlhjvVZg=;
 b=LdP8fqwBoL4bWakPCgOejRetO3vSKq0Uy3P5RLu+33wkh8nmeXXI6oAnZR+/rN2njkW9sIBSR
 ALHGPRbam/XAP7ABZ98gNWsync0LXCpMrGYp+EaeF4iFr8UoyqVr+YF
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

No usages of '#include <asm/types.h> in the UAPI headers exist anymore.

Make sure it stays this way.

Add a semicolon to the end of the previous printf call to keep the
syntax valid.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Nicolas Schier <nsc@kernel.org>
---
 usr/include/headers_check.pl | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/usr/include/headers_check.pl b/usr/include/headers_check.pl
index 2b70bfa5558e64518808a22f2f926291da6e47a9..36307a137cc1e109e3e1c253f66f3e5935499fc8 100755
--- a/usr/include/headers_check.pl
+++ b/usr/include/headers_check.pl
@@ -98,9 +98,8 @@ sub check_asm_types
 	if ($line =~ m/^\s*#\s*include\s+<asm\/types.h>/) {
 		$linux_asm_types = 1;
 		printf STDERR "$filename:$lineno: " .
-		"include of <linux/types.h> is preferred over <asm/types.h>\n"
-		# Warn until headers are all fixed
-		#$ret = 1;
+		"include of <linux/types.h> is preferred over <asm/types.h>\n";
+		$ret = 1;
 	}
 }
 

-- 
2.50.1


