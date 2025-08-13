Return-Path: <linux-kbuild+bounces-8430-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B77B2414E
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 08:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56E8F581AFD
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 06:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C18F2C08CB;
	Wed, 13 Aug 2025 06:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ax8C1lNJ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EG41VEdo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377A62C3260;
	Wed, 13 Aug 2025 06:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755065861; cv=none; b=XWzs9mI8Rl7tp3NoJChIKQ8x6lfbN1RPCUgkIrty29ERs5KeWvonZOdoVfKsrK2ZKoqZGWuBBFGCdKKRg1Hjd8LBWoC3V9Xg05dhtSza1Myjutmg5ct8Ygb8RGAHvfeXwBqLz84vpPZD3WMmfeKrZlnTdf+65XK35gDzXkF5M+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755065861; c=relaxed/simple;
	bh=kpV66cB9Wo8nPSJi2XVwVFy1yO7ARG71cTbANz6Cl6w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=InBtGq3jcf3VyG4N22t2MzcNYuNQXop3eZX2/+uuoMY45tnWFIo/s2mtbjbAc+Pfg62gKgoFaSd08MQS9Tf9EtmwQmSDUhC/rnm65n5svVthCPoDdwccEdWwwyFaU/a54TrZWpXv3o1QEKqYNQDiDePTre5Rq/whVixzcA6/tYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ax8C1lNJ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EG41VEdo; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755065854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1TaAb2/O5AqHu/imE1DBL2PwKIuKAFFZwS3fbmpaJBc=;
	b=ax8C1lNJVJ/75kjFm0E+MNrKLp/moL3yneaeJ22odKeA9BV3chmSAFBtBkVwjA9Hh11Yh4
	+iCEyTYAMx8YHq+6oJJKcFxgLhMrrVrlJ/lccFiQ694m83x8xodWfuMriYRwjODalv8Hz6
	Umj/a5WGvsesM2dEhi38K0rdsMRwE5dUeOaQ6DKyM6mrpJu/JG0GxezDTo6Gv1ExBsZ/fe
	bfq0w7TEQ0+sNIB7H7w99m/xluda6rYZPZHP6qBYOXKL7ZZgGpygsLYiJwfB+pxO8xr3FW
	hn5uTgMwSujJPHp0rwIgEhaVLmwIb6mLAvdZdtRvjw17aEDH7npVtIpjHlIH6w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755065854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1TaAb2/O5AqHu/imE1DBL2PwKIuKAFFZwS3fbmpaJBc=;
	b=EG41VEdoof6yOMeO9OYo/n1QCp5RrHjrwkNhVJcf0hHM5vs7Tnq4FoAfqcYVALKR9vRTMU
	JeATwuKW7SWrapAA==
Date: Wed, 13 Aug 2025 08:17:00 +0200
Subject: [PATCH v2 5/5] kbuild: uapi: upgrade check_declarations() warning
 to error
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250813-kbuild-hdrtest-fixes-v2-5-8a7921ca3a03@linutronix.de>
References: <20250813-kbuild-hdrtest-fixes-v2-0-8a7921ca3a03@linutronix.de>
In-Reply-To: <20250813-kbuild-hdrtest-fixes-v2-0-8a7921ca3a03@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolas Schier <nsc@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755065851; l=739;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=kpV66cB9Wo8nPSJi2XVwVFy1yO7ARG71cTbANz6Cl6w=;
 b=GhaXc2d3GsKx6dq145tHbuRAWkcgjc2Y10zyoLN0e01hc1IVRdSRBnxMRdg90fUSQ5aGD6Zry
 7HI4n4YQol3AbrckuNeS02+E2+eZx8flGLmqpEUKyJ1Zbrt27HI8L/M
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

No problematic declarations exist anymore.

Make sure it stays this way.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Nicolas Schier <nsc@kernel.org>
---
 usr/include/headers_check.pl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/usr/include/headers_check.pl b/usr/include/headers_check.pl
index 36349b21cef5d55241b68ca24dabe6a321b7ce27..21c2fb9520e6af2d6ebf2decce69f6eea64efd88 100755
--- a/usr/include/headers_check.pl
+++ b/usr/include/headers_check.pl
@@ -74,6 +74,7 @@ sub check_declarations
 		printf STDERR "$filename:$lineno: " .
 			      "userspace cannot reference function or " .
 			      "variable defined in the kernel\n";
+		$ret = 1;
 	}
 }
 

-- 
2.50.1


