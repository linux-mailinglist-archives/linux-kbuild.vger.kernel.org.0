Return-Path: <linux-kbuild+bounces-9629-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3899EC5D6CE
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Nov 2025 14:49:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 672A44F0052
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Nov 2025 13:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E7331A54B;
	Fri, 14 Nov 2025 13:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="o2Ng2v6q";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="z9P48ICb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0892B19AD5C;
	Fri, 14 Nov 2025 13:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763127846; cv=none; b=Vbe81RswvWCPdTPZMkMSWnrvhlxVtQdoNlFfd94OmZqW4wP6S/86ZkwXtG+xCvxy44CQOQaiXwKOJpLWKvuXzgydHXkOcGbG7pSj9B075kWUCL7EcSfsVdGjulgvp5jSl3vEZ0aDKpNQSxKiXNHFeQmQlebkT9SBz6oFwiuUMAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763127846; c=relaxed/simple;
	bh=ridHJFhLRQMLTPgJCQ9HyR305XGZNw1pWnOs7cDr3NQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X+oYKs2oGPN4Ql24gPosRM9x/sdU76NElp3rDggiksZ4vp+bgKtKHUv8hrPTFoVeIEgGBT8jMSmaPUVuQlPrAGqx1S2ge0kBh0jTCrgf6ovmr8jRNgXNkU9nwv6mgE2O5xEwQWGiH3z1NJMWkLQWaXbE2IH44bFWs06mTSwOez4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=o2Ng2v6q; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=z9P48ICb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763127843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9WvY3nQae8dyQgGN5IEubkD3c/BJ6GPPyQv+TucbTOo=;
	b=o2Ng2v6qL2ax/jgVEPVacAWyqJ8/EEHdjfzSMstVi29mdD/b1Jfg/quaOmprOYZXfSSJjH
	v3LIe1YdQTPAp78s7142HWZdmkvN+5nWBhR5iJh7dEm91y0YB580BkRtg2zAsLwHu4pkAC
	oEcU4YL9Y7vnTj5wU/y5549MZklvrkhRysppZ0WCpJtsfFSVHNFbqAmLo/+CUJ+EGFESbN
	cmg8OOhlyid/IQ+pBo6EiqI8nMfqCH4L3E0dxF8PK4tsCpg5KQd2S6V/nh29x415qjz6nO
	5EihTmekuy5+WpDtTaoxf1apvRtvhkq9aEg+14KbVm8ruvSfxoY2nGFLcyul3w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763127843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9WvY3nQae8dyQgGN5IEubkD3c/BJ6GPPyQv+TucbTOo=;
	b=z9P48ICbD6N8VFTdyrwYxOE+1CcQfm/sPt5VpSl6O3ztj2Lx9FvWYqmy22CDtsufcoLjkK
	01gXBe9Jt0jZmqDA==
Date: Fri, 14 Nov 2025 14:43:56 +0100
Subject: [PATCH v3 1/3] kbuild: don't enable CC_CAN_LINK if the dummy
 program generates warnings
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251114-kbuild-userprogs-bits-v3-1-4dee0d74d439@linutronix.de>
References: <20251114-kbuild-userprogs-bits-v3-0-4dee0d74d439@linutronix.de>
In-Reply-To: <20251114-kbuild-userprogs-bits-v3-0-4dee0d74d439@linutronix.de>
To: Nicolas Schier <nsc@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763127841; l=1584;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ridHJFhLRQMLTPgJCQ9HyR305XGZNw1pWnOs7cDr3NQ=;
 b=fQASWlA8C4eSuXw0skVJNZrPvx4hDybJDOr84s0xBsN1nAFHZ2RaVsRWzkHusa0HaAsDSQi0q
 5pGdf81mYT0B8HerMgEu/upDD2RmkZ+S7rszIJaHhn38ibTbnUFSkbF
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

It is possible that the kernel toolchain generates warnings when used
together with the system toolchain. This happens for example when the
older kernel toolchain does not handle new versions of sframe debug
information. While these warnings where ignored during the evaluation
of CC_CAN_LINK, together with CONFIG_WERROR the actual userprog build
will later fail.

Example warning:

.../x86_64-linux/13.2.0/../../../../x86_64-linux/bin/ld:
error in /lib/../lib64/crt1.o(.sframe); no .sframe will be created
collect2: error: ld returned 1 exit status

Make sure that the very simple example program does not generate
warnings already to avoid breaking the userprog compilations.

Fixes: ec4a3992bc0b ("kbuild: respect CONFIG_WERROR for linker and assembler")
Fixes: 3f0ff4cc6ffb ("kbuild: respect CONFIG_WERROR for userprogs")
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Nicolas Schier <nsc@kernel.org>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
---
 scripts/cc-can-link.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/cc-can-link.sh b/scripts/cc-can-link.sh
index 6efcead3198989d2ab2ab6772c72d8bb61c89c4e..e67fd8d7b6841e53341045b28dc5196cc1327cbe 100755
--- a/scripts/cc-can-link.sh
+++ b/scripts/cc-can-link.sh
@@ -1,7 +1,7 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
 
-cat << "END" | $@ -x c - -o /dev/null >/dev/null 2>&1
+cat << "END" | $@ -Werror -Wl,--fatal-warnings -x c - -o /dev/null >/dev/null 2>&1
 #include <stdio.h>
 int main(void)
 {

-- 
2.51.0


