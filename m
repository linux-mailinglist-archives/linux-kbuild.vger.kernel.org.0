Return-Path: <linux-kbuild+bounces-8421-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E986CB2407C
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 07:43:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E5C394E0364
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 05:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D61D52BEFE3;
	Wed, 13 Aug 2025 05:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="G43M3/Eu";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fZC2Lul5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8788462;
	Wed, 13 Aug 2025 05:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755063828; cv=none; b=T3EWPEKJ4xo7SAkHAgoWSWderr9iuZgULiNxHc+lWFu9JJwVIyaGF3V8WPRQxBUxvChn1cZU0AqLEYK3DXZoZbCfafaK6bFmnMO2inh4r1hDXpD4Uqj+g3+OxtKl/U7rQfBayGUl5Lvd7YgV+JebQX/sTGRCgeG19rmYt3uk5jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755063828; c=relaxed/simple;
	bh=vP+mEMF62ZxB+CQTd3DW4S+/ofi1vI/hpcMlDiLTr6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UyfLoGG832w+ZdVhstYeweuzkpf4HIbOJsg5SUNRlZFg/8SvZiSG8lgaJk36POuXGRi2d6nxIYzvBGp1QET9PBBa6VB807gEuNYA249bMxaE9QG0tbrmD2EwUDQx08vbHK+2M5fiQMlGfYAZ5Vu5tbU6VwNSmE27P8HyezhOruc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=G43M3/Eu; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fZC2Lul5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755063825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lda1+k9NvAni072lcSmj/XvjHbnivRVjlPOdUFZuhk0=;
	b=G43M3/Euc4h+od5NZgN6q6JrNOCthzCh/G8bdMLklkVKKI+E1m6veDY2/foLihis0JBw3n
	TT2Qbb6OhjUFc+RLxh8WDIF1ByLDyuFNB8vnlE2ptt8AP5AQ2w60tUv2u7apbmy4kQDka/
	M9YjVo4TuCGArAg7+4CPS5H6Fg+hBQeST05ncnCpF3gvvTXIJoB+AhMZiymimzUsfz7XQl
	m8EyY37WskEdX7lmZVp3qalj4IXqRjP6qdMsOTTZKZwoo5sztn9SabyrN6rgepiXgns9yW
	Bw0CW5ZkXI+pz2Ron/Shtzm9ae9BUuEl2/rJvIgstwIDt16MjCPyNv93W8B2cA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755063825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lda1+k9NvAni072lcSmj/XvjHbnivRVjlPOdUFZuhk0=;
	b=fZC2Lul5TrKY+M0zMieULtXYpvwNSc5nECRdGlD8UO8fSu2q7iJgNIUbs4SYxGslZNlI8N
	KBGnSP4mCe4YZdDg==
Date: Wed, 13 Aug 2025 07:43:40 +0200
Subject: [PATCH 1/2] kbuild: userprogs: avoid duplication of flags
 inherited from kernel
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250813-kbuild-userprogs-bits-v1-1-2d9f7f411083@linutronix.de>
References: <20250813-kbuild-userprogs-bits-v1-0-2d9f7f411083@linutronix.de>
In-Reply-To: <20250813-kbuild-userprogs-bits-v1-0-2d9f7f411083@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Nicolas Schier <nicolas.schier@linux.dev>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755063823; l=1255;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=vP+mEMF62ZxB+CQTd3DW4S+/ofi1vI/hpcMlDiLTr6M=;
 b=rQMgzncsTYfaPjfHhfNgQ+ukSBY44NlFn9xqwCvAuJ2OT1XLw+adRLqXpjbroZw9pk0gIVL2j
 Q9LDpoHmfHBAWdKAiHbDNFDtRbsIdqpTXM2BqTU8kjbZbIG4XPWYOyh
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The duplication makes maintenance harder. Changes need to be done in two
places and the lines will grow overly long.

Use an intermediary variable instead.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Nicolas Schier <n.schier@avm.de>
Acked-by: Masahiro Yamada <masahiroy@kernel.org>
---
 Makefile | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 6bfe776bf3c5ff0cf187dc6719dd5817cd4af2ca..d0f5262a9c0f3b4aa79a91c20cc149d034ffa0b7 100644
--- a/Makefile
+++ b/Makefile
@@ -1138,8 +1138,9 @@ LDFLAGS_vmlinux	+= --emit-relocs --discard-none
 endif
 
 # Align the bit size of userspace programs with the kernel
-KBUILD_USERCFLAGS  += $(filter -m32 -m64 --target=%, $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
-KBUILD_USERLDFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
+USERFLAGS_FROM_KERNEL := -m32 -m64 --target=%
+KBUILD_USERCFLAGS  += $(filter $(USERFLAGS_FROM_KERNEL), $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
+KBUILD_USERLDFLAGS += $(filter $(USERFLAGS_FROM_KERNEL), $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
 
 # userspace programs are linked via the compiler, use the correct linker
 ifdef CONFIG_CC_IS_CLANG

-- 
2.50.1


