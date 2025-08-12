Return-Path: <linux-kbuild+bounces-8357-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F2FB21CE8
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 07:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA12B683BE2
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 05:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD702D3ED6;
	Tue, 12 Aug 2025 05:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="t5kv6mpe";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4+ySJyKG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC692269811;
	Tue, 12 Aug 2025 05:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754976794; cv=none; b=BaQyw6EawMFTK8u/FoIwjAzI4vnvS/OlgoIzRLCIOY/odkMINVGUXCicaHKuQYXvP5g9n6uARpGsJg/kjIU8ips6VmZlhIW7Y5b26T4cKNu/MyO3Lbhfy8Tb3pJELp70mEFZoaeNVhSjsGm8MXWPw6puqtPCfn+4cIrMhtHvrck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754976794; c=relaxed/simple;
	bh=vzjltkuEi3N8/Cur3l6NVv0+8uIBQviOCWSpW2z0EXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E2eiWAef5dHZCqortIzDto3orZbxhoztUH0iMnILJmCwxEWu3vv9zH4xV7IdZUvi0F9iJW1iMS8uvi2VKGiyXyLyOF3Ig0S0uvNwhjK1MX0PdYWNpqYumyMXUDQIWYhnw9SPgi303yCgPabmY7cUFo8GCgH6tQ8LA0KTbvtYMwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=t5kv6mpe; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4+ySJyKG; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754976791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eIez5+KJkpfadeWsmV2pVmE0iSYj715MD+J2kPVy/U0=;
	b=t5kv6mpeFT7cvZ4YYvcslnD4KiyR1ub4/LLA7NWX2VnBMYoY/hSZ3FT++JOUCZoJF92qmw
	8drMlUQsP/aGnonh5lbY9dh8FlwVRZVjSTOsiC5MDhoXgae8+o67Feig6Z0fufbtfH0/hF
	Xw6CD9ikYksg0qz8K6Ms3G+dok+uYv0VILpuKjPGjHAfUN7ZD8Sd++CmvUy5g6axgOS4xl
	cBR1OAXmt8Gt2zV5GBXcU00mZK/oKb7y5aBnjS04MbvilHCbBBRH4FnBnpKtW0DSH6MkTX
	kc1YWyo2O6G0AcRLLzsqoJXwz4OAMRq2iKmFgRAerJQTVbB3g0f0CIkIw7+Hyw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754976791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eIez5+KJkpfadeWsmV2pVmE0iSYj715MD+J2kPVy/U0=;
	b=4+ySJyKGBX0HEM84XlWxPwUUToxk5Tguk2hb4O0XreaKU+KmSfqryaKmXcS46n+QFSwCuU
	YxZvd6xYjlDSbdDw==
Date: Tue, 12 Aug 2025 07:33:06 +0200
Subject: [PATCH 3/6] kbuild: uapi: fail header test on compiler warnings
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250812-kbuild-hdrtest-fixes-v1-3-7ad2af66cd58@linutronix.de>
References: <20250812-kbuild-hdrtest-fixes-v1-0-7ad2af66cd58@linutronix.de>
In-Reply-To: <20250812-kbuild-hdrtest-fixes-v1-0-7ad2af66cd58@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754976787; l=951;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=vzjltkuEi3N8/Cur3l6NVv0+8uIBQviOCWSpW2z0EXA=;
 b=t9pEE/WUii1++6DSntwO/85Dh5c2pAu1Hm9Qw3zCtKBOxjmM7W9QlswPi/CJFC+rNOZ6MNN1D
 vfnR/Gp0L4uAwnuQBSri3cy/RvdLkFa2awLR8IxOfyIcc2k4WV+KtzV
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Compiler warnings also indicate issues with the headers.

Make sure they don't go unnoticed.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 usr/include/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/usr/include/Makefile b/usr/include/Makefile
index 6868d183f36d532cd3d4023b936c67b8a58a9ba5..2846fe216ee4f2054effbfbb5778b4e5b24649ae 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -80,7 +80,7 @@ always-y := $(patsubst $(obj)/%.h,%.hdrtest, $(shell find $(obj) -name '*.h' 2>/
 # Include the header twice to detect missing include guard.
 quiet_cmd_hdrtest = HDRTEST $<
       cmd_hdrtest = \
-		$(CC) $(c_flags) -fsyntax-only -x c /dev/null \
+		$(CC) $(c_flags) -fsyntax-only -Werror -x c /dev/null \
 			$(if $(filter-out $(no-header-test), $*.h), -include $< -include $<) && \
 		$(PERL) $(src)/headers_check.pl $(obj) $< && \
 		touch $@

-- 
2.50.1


