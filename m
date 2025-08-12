Return-Path: <linux-kbuild+bounces-8355-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 778AAB21CE1
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 07:33:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CBB246776D
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 05:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85C7E2C21C2;
	Tue, 12 Aug 2025 05:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pyw3yaLf";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="K1rBEwDU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B9829BD9F;
	Tue, 12 Aug 2025 05:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754976793; cv=none; b=dcw978GLM9j4K+9HomrE4iDG6013XeNOKDvO9fIOJQIeDBi/V6pdwnK/BtTFKDzLPVE805qAXE6aplIl2+nMRFnYfYusbA6dvoixCxkbVLJc+E/FR+1B42XJlYNa+fshXFZ8reFNxUFPq+G2SJ2ltQzi63wp/Symt8I3M+hs7hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754976793; c=relaxed/simple;
	bh=jpiYXlkarPKLOWnAfKbo1es5FwEuGW1Vj5uf3ESynpE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rdLEwQw6uz7PLkieIjADsyDeWflFtK6D9v2DJEKxSPCICRTvz1vlMQ9R0lpQ/WtBx3aR6mIYBjNg0xooM/U+anj8brp8j0vCwSLc7LNPSrNWr3m4X83XuzHOSqDDlr93Wn+fuQXMNqOK7IBfJcNdTBOXVN202kEIN5c93w4QoGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pyw3yaLf; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=K1rBEwDU; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754976790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fN8mEinkURCbzhnn4Ak+rUkW62hSiG3SOmyZ4DyaLZU=;
	b=pyw3yaLfLzCIw7KrcHkYaKJqMRis5U+YvGmBxu8FX584v4BwsfLbOG0CUdBen3d7cxuL5p
	IxsqyauUuGwauFFYL8J6yES8IbyOeeyDkbnvb3TA4VluzprAfrkK7/oiiK2WCXuYsqEQMC
	BaGc89LAJx7wpKPV/0u2Xh5tOq/UlYOyqqmLJmUTTham8RuXcPK+cPMemLTH6fvmDfumWd
	C3IbWzgPPsG6fx2rUhsTnY7U6T//wGi59EGrSs+dGiql5+f3cS7YxpI/RoW4e9rJj1Uq0m
	M7mo7wm75mYeriJPLLTDD5VOKbmWPl71PglinDMVDu3SKBRkcrXofoqDxs6zFw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754976790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fN8mEinkURCbzhnn4Ak+rUkW62hSiG3SOmyZ4DyaLZU=;
	b=K1rBEwDUsAULrKaJtcR45XwSHKtq4ICAHQS2JWRxavgSHa97z6IY/RCQ4gba1J4c7SIr0e
	E0Qu4DEIB3E/5+BQ==
Date: Tue, 12 Aug 2025 07:33:04 +0200
Subject: [PATCH 1/6] kbuild: uapi: rerun header tests when headers_check.pl
 changes
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250812-kbuild-hdrtest-fixes-v1-1-7ad2af66cd58@linutronix.de>
References: <20250812-kbuild-hdrtest-fixes-v1-0-7ad2af66cd58@linutronix.de>
In-Reply-To: <20250812-kbuild-hdrtest-fixes-v1-0-7ad2af66cd58@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754976787; l=799;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=jpiYXlkarPKLOWnAfKbo1es5FwEuGW1Vj5uf3ESynpE=;
 b=X5tStPrDkM2p4fHctj6O4rZfMOhYCGmfVjLZOx0o+Ua03O68rXQv1JgmX0bT/DHn62w0zoRvp
 Z9lcuxTC3iJBv7Mc2mAzsZhjo9byW+qOO8Bv44YART33XrE7CNfY/YL
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

If the checks change they need to be rerun.

Add a Makefile dependency so this happens.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
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


