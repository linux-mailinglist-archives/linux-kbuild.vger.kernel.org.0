Return-Path: <linux-kbuild+bounces-8429-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B174DB24145
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 08:18:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41A131B60159
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 06:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08AF42C375E;
	Wed, 13 Aug 2025 06:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jCjOLhl9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aJD1rKqU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601772C08D9;
	Wed, 13 Aug 2025 06:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755065856; cv=none; b=ug39FGEX3ZlyWsWYqOoq5GnV4xWK3NpDGEPZduuuPNiw+miTu5gwehHjY50iv6yoMUsGnfErWsmqMsgRrUjrOgOm2UB58I3PwCSqT7afJX1LCrAjasyQZO2Qab8htRec8T89KRfKAwTs2NwDnZVdVTsKChNKtnGkTAXrXdAdxWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755065856; c=relaxed/simple;
	bh=QqZcd1GEDGsRKapc2KlbsIHYlTJfZ/P0Zy9fk1mT1cQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UUMqLgPU5DIYFG2EMYsE4u6IqnS6q2YgADBYN+tStf8ZS0+AW0tEcLrhh5JX8ugG/H7FMwqge4zGSLBmYt1cIvnCt01zMX/v+gm7oNL43XAEZ2+Fk2RHePuf9sJFH7HgDDFTa/chF5rNaZyrqB76VlnwTo/n32oOPdcRn8VtLWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jCjOLhl9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aJD1rKqU; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755065853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ipkvgMt3yu9PvMBYUezk2UrYiGpKlL6cQqj+qQZUaJs=;
	b=jCjOLhl9MWja4FM8LOTKnEs5E6wn2ijZ3WcMQon0BWu405QCtZ0BHgYc3nPK0YkZ56TP/Z
	tU6Y7JjMD+0vKOBzzqAwDRjyDitQv4gQEBWCkXFOACGeONE2OjESi7IQTr0oAHdJvbQMcB
	v03niUPDXW2FXRQJxbASlLFQnwORZeW6HUVfXTXS+jFtlTuBr86ScglpDzEOzXrCZm/BBh
	dzBgeir/l50gLVwC7qvg7a2p7x4EkN/xobF2mvGnSeILLorF3BWn6Kd4n0pydCClZe6efL
	GHIgqroGv7ZKg2t9637gLN1sTe4WKhjQ9olQmPwN9lWbNNGc4k3qrCFxWWAS8A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755065853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ipkvgMt3yu9PvMBYUezk2UrYiGpKlL6cQqj+qQZUaJs=;
	b=aJD1rKqUcm+v2E8PBM6cZypcdlTcxlCru00hG5FcNBV91FeEOMzkmpsxp9FHqZxNyjTEQD
	X2CVQ2hywLrjVEAw==
Date: Wed, 13 Aug 2025 08:16:59 +0200
Subject: [PATCH v2 4/5] kbuild: uapi: upgrade check_sizetypes() warning to
 error
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250813-kbuild-hdrtest-fixes-v2-4-8a7921ca3a03@linutronix.de>
References: <20250813-kbuild-hdrtest-fixes-v2-0-8a7921ca3a03@linutronix.de>
In-Reply-To: <20250813-kbuild-hdrtest-fixes-v2-0-8a7921ca3a03@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolas Schier <nsc@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755065851; l=793;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=QqZcd1GEDGsRKapc2KlbsIHYlTJfZ/P0Zy9fk1mT1cQ=;
 b=qSb/NmV6riYwu3mg76YidW1HxplN9waduquVqbfnafdgewmPQ0qDEmNT7K5mhTy8oVzDQN99+
 Zv86EXVJWe6AZld0Wa3z+gYAd7sRkbWMvREBPn5R6eZ/e66UDa+FmJe
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

No problematic type usages exist anymore.

Make sure it stays this way.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Nicolas Schier <nsc@kernel.org>
---
 usr/include/headers_check.pl | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/usr/include/headers_check.pl b/usr/include/headers_check.pl
index 36307a137cc1e109e3e1c253f66f3e5935499fc8..36349b21cef5d55241b68ca24dabe6a321b7ce27 100755
--- a/usr/include/headers_check.pl
+++ b/usr/include/headers_check.pl
@@ -159,7 +159,6 @@ sub check_sizetypes
 		              "found __[us]{8,16,32,64} type " .
 		              "without #include <linux/types.h>\n";
 		$linux_types = 2;
-		# Warn until headers are all fixed
-		#$ret = 1;
+		$ret = 1;
 	}
 }

-- 
2.50.1


