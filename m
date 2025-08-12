Return-Path: <linux-kbuild+bounces-8358-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 426E4B21CE7
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 07:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52B8C1A26E05
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 05:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6272E0410;
	Tue, 12 Aug 2025 05:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="M/ThQWH/";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="X37J7zkr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA6A273D6B;
	Tue, 12 Aug 2025 05:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754976795; cv=none; b=bKWP/cc4/rMwyW6BkGICM1HPllCW/r0KezKSAnSONUtwQcVmoA0DPvPIlfhSLXEGwvDIpV4Izwu+XZUHpPaReJqpZoKFAC1IEFZLpNx758ge4F63rn0Uu4Dm1izTtYrm5OasuO4w7RmvoKRvCEvs2+DytQAjIucQrWczseXnwIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754976795; c=relaxed/simple;
	bh=PyeDTO0WRvjQ2H0nGQ3V9Ec1EE1YAZNeO5y3b07V+00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nzT4o6jPTcPkLnqevpQQ9iGwsVRnw41AbeKTon0jIo9fZtxFK1+3lJbCmmexbwmXqfOoPPq0adSTbfo2O4ubk6pfNpMnAW7B67xjQDVDjPIAUWJHlzMdjxrElDkSc1c7QTwZnVGskNPKsmZzvrB8hnA+ocjTI1gtZ7MVnCdRZKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=M/ThQWH/; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=X37J7zkr; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754976792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jvkf1zbH1yXIJhJUPSKZokDxDIyBL5E7H40ReZ/gyp8=;
	b=M/ThQWH/rO+vkoK38c8SuuZkMI9h8zHkkUCXjhXA257e5DU2PCGW9DGAyvOtbYNXnLvWlD
	cg11DUgoyqa087zUYDwjkCgTUvluWzWoLwuBDixA50YsGuzLjjvSj+MwSOKFj2+bKQp01+
	uasAu3weauji2CUduSUNf1rXHMsxPtRhbKUm29E+LrWdyECdWor1ewJoKcaNizFEe6H4yO
	uB53/iDhmoewTBAkT54aT6+6WzZHcAZBe0jw6OdC3xfHfnJaxTXrJw8kIzyzsZDMk/pw1b
	N/lmZunTnUffZEmHocDHJiITB1gwy0FJxTGcy1oDxAk/Lu0OPD1YPoIDx0z5DQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754976792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jvkf1zbH1yXIJhJUPSKZokDxDIyBL5E7H40ReZ/gyp8=;
	b=X37J7zkrLjDPox6a6s907rW8YuBixV7mUkcnogv1GQEYbwO4YAPOefa/9uu2KbMXYWDinT
	0gbg1WFHUPfnTaDg==
Date: Tue, 12 Aug 2025 07:33:07 +0200
Subject: [PATCH 4/6] kbuild: uapi: upgrade warning on asm/types.h inclusion
 to error
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250812-kbuild-hdrtest-fixes-v1-4-7ad2af66cd58@linutronix.de>
References: <20250812-kbuild-hdrtest-fixes-v1-0-7ad2af66cd58@linutronix.de>
In-Reply-To: <20250812-kbuild-hdrtest-fixes-v1-0-7ad2af66cd58@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754976787; l=993;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=PyeDTO0WRvjQ2H0nGQ3V9Ec1EE1YAZNeO5y3b07V+00=;
 b=tuwgQzi6zOhu0waC6mZFZyafr9Ev74n3VCkqdcgXz8KCsWtbyRinL4//gnS/gjx6vnpEHGXpf
 mI87rb2DqyMDpusJ6V+D+igb+I4LUXfao2ibhghjfAB7woEFsfA+L2b
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

No usages of '#include <asm/types.h> in the UAPI headers exist anymore.

Make sure it stays this way.

Add a semicolon to the end of the previous printf call to keep the
syntax valid.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
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


