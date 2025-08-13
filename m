Return-Path: <linux-kbuild+bounces-8426-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BF0B24141
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 08:17:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 576507B67CF
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 06:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56BBE2BF01E;
	Wed, 13 Aug 2025 06:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="f1CThKoQ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+pa+McNR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EA126ACC;
	Wed, 13 Aug 2025 06:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755065855; cv=none; b=S7C3wg3MoKblY3oi5D75Cic1VR8KwGc02YjC0EtZQO8nW4FN4qukBnhYMvoNxx9MPW/gXDIYaxzppogSa6/7ljk9PSJG/VIZy0i3s/rnNKjiaYYinkIN1kSuzY0MUkbtKIJ4MIWsx46oLUorhWmwLOUWHtMH8fXJ6JrfxlT3CGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755065855; c=relaxed/simple;
	bh=Yzg7dfy7CQAoGxLwFJjO21Ljc6p003nQfc1CW+UxjyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m5jr39maF2wcBrO2vg2CkZk71jtUEXTj3UbmAef1iLmxbJObYZ7FNm3rcw8Mn+ores1oRzjtIQ/Yfl9Vm4byeLLNsT0cksUHrPVp+nuFp/Me5uJATs04BhNxfpU9a2P+M6PlB69j7ylS6fBX5GFmafmAPpDOThiPrDXbhkUHVAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=f1CThKoQ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+pa+McNR; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755065852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PkkDmhl/ZG+aA8mJZf277zrEFMKi1oBSEnkBnGz+tAs=;
	b=f1CThKoQjsiytGs/1iCVK4Yza7qlssLZonszuQF2SRcmQmM7QYWp8xh+4u2ckOqkQkox7n
	9QG08+N0fExjfsGmHum8AuCQomKRAfAzySxjXnRDl72RgKpSzIPjAZfK85jVVsi/slQMIb
	rZrK/6D9QdC6t0JVdNbnC7YsXjCyCz8xHYj5cIleTYZ5TOOQ18ShKPme3F3/X2Bob0ZPTL
	gPOBGe77nD8f5UZJM4xSF7BZAaFp5Z+p/Fx6+OyUxIepYgiP3uUyyS12brhoISN3TsBvEm
	anzjMgWhTjANSRgSg+aGmIGvKF0+c6hR+d7N+XEk3iXrOUJ15qQdwANv+XGXtw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755065852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PkkDmhl/ZG+aA8mJZf277zrEFMKi1oBSEnkBnGz+tAs=;
	b=+pa+McNREJd0sgpcUOZq43hl73u9/4Zh2Lk0n9p1qykkHKiiWwTDoaDn45KwQXMkJnpSOd
	zDBE0DQYzVvmnZAA==
Date: Wed, 13 Aug 2025 08:16:56 +0200
Subject: [PATCH v2 1/5] kbuild: uapi: rerun header tests when
 headers_check.pl changes
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250813-kbuild-hdrtest-fixes-v2-1-8a7921ca3a03@linutronix.de>
References: <20250813-kbuild-hdrtest-fixes-v2-0-8a7921ca3a03@linutronix.de>
In-Reply-To: <20250813-kbuild-hdrtest-fixes-v2-0-8a7921ca3a03@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolas Schier <nsc@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755065851; l=845;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Yzg7dfy7CQAoGxLwFJjO21Ljc6p003nQfc1CW+UxjyQ=;
 b=dN6LqYmq8ZKHF7fIPY4kO1X7jfH0sepzTfhLZqLAGCtRbdLm7N4+L+qIQDyOoifRzFXP596lj
 cT9tk6p87/FDbCHX704dRNJmnp8fHta5jxKJMzZznVMcPBMzfMG6tmM
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

If the checks change they need to be rerun.

Add a Makefile dependency so this happens.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Nicolas Schier <nsc@kernel.org>
---
 usr/include/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/usr/include/Makefile b/usr/include/Makefile
index f02f41941b60c88d921da2b955076bbff7884c1c..c7f164952b33acf6c7b8eb7ce91cd192bfc39ad2 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -85,7 +85,7 @@ quiet_cmd_hdrtest = HDRTEST $<
 		$(PERL) $(src)/headers_check.pl $(obj) $<; \
 		touch $@
 
-$(obj)/%.hdrtest: $(obj)/%.h FORCE
+$(obj)/%.hdrtest: $(obj)/%.h $(src)/headers_check.pl FORCE
 	$(call if_changed_dep,hdrtest)
 
 # Since GNU Make 4.3, $(patsubst $(obj)/%/,%,$(wildcard $(obj)/*/)) works.

-- 
2.50.1


