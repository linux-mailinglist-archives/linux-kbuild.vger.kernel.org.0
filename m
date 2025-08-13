Return-Path: <linux-kbuild+bounces-8422-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90225B2407E
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 07:44:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8601417C2DF
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Aug 2025 05:44:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C252BF3DB;
	Wed, 13 Aug 2025 05:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lBGnGSy2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gjTREMR1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AC92BEC45;
	Wed, 13 Aug 2025 05:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755063829; cv=none; b=UVp3LjqalGO2YljbiJDjgc2fAkH11GXF7HrJMsYEMYJFOLFl4AtL2edhMsxkjI47YYdIs2Q+LN7Kc6lcGYj7JRAjhwvBKJLDNv0ocqXsB0mN4JB9AnjmZMzaTC8eKPFBkiZukQMRFV4zvDSTMyNJJ2/mdWOTJlpv/ZXsbb3Ekeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755063829; c=relaxed/simple;
	bh=WR4nebXv6cq3ocU+EuA9grEkBv0PYXkTdupjBs02LlI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZQlQ2SRwBubi5Ig31v4FypXnvA11y2teL1V6rmcmEso6uP6zWlhxzmuD/OQmbSxNLal5qZwr97vTx2II5JeJC7l94m6qenrhe3i8u54zEZPzfIwTeCtUsQy/wI8J8TtKjyt2rAAh0Hy5AQi07E8k1Y4wr2h9xZvGCig43VEmKVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lBGnGSy2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gjTREMR1; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755063825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TC4Oy3+8Vj3UOd09UD4NHTiWUTfFsnY6dc7LNc275Jg=;
	b=lBGnGSy28P1ZdeaXXFxA8xg9buVI4cBlTI0xeKaIBfBFzskm9E85XDFOoIphEIbGJAHydL
	7XzgglSqwEUoq/uwVFubP0EPwsJ3ScSa0OnVYyasEUrC8uRJE1P1gj/3MCKJCrodDpIDxx
	9B1EzeaoFm95EUguSa/kYuPy8VeCQXYTpdDIinqNrMY7tYGcqWm5wJCyCkTRT5sc4Wa+FC
	+Ipn87ZH14WlHkigpJU+dIoY7E3mPtFZyfyRA8urChptNArAuwV1JJ+18Q/kJsrmd90o01
	FhGZvHt4m6Mv3zPlGDX3OH4P3TkJxqDB/w/tKs00TImC2cpRTxuwwTWyVjaOmg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755063825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TC4Oy3+8Vj3UOd09UD4NHTiWUTfFsnY6dc7LNc275Jg=;
	b=gjTREMR1jNcfJo/oW+tErZnE+Jza12tSDHFjb8E9ZA+u+Y1DXEenldfGUhdmU+cGvnOwA5
	8xPAp908F5SUdfCw==
Date: Wed, 13 Aug 2025 07:43:41 +0200
Subject: [PATCH 2/2] kbuild: userprogs: also inherit byte order and ABI
 from kernel
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250813-kbuild-userprogs-bits-v1-2-2d9f7f411083@linutronix.de>
References: <20250813-kbuild-userprogs-bits-v1-0-2d9f7f411083@linutronix.de>
In-Reply-To: <20250813-kbuild-userprogs-bits-v1-0-2d9f7f411083@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Nicolas Schier <nicolas.schier@linux.dev>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755063823; l=1353;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=WR4nebXv6cq3ocU+EuA9grEkBv0PYXkTdupjBs02LlI=;
 b=M0fP1hKhNJ4QE+hfgk9YoyPLzju+wy9ByxE9ZDs+uqBWz3MfKczC/npr8PqVA6BuXcLRIhUgO
 e9xFb7OASSHAZ7/4M5ri2E1YKLFyM+wDkTmOcapcGnqXXHGFkmtc1Ui
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Make sure the byte order and ABI of the userprogs matches the one of the
kernel, similar to how the bit size is handled.
Otherwise the userprogs may not be executable.
This happens for example on powerpc little endian, or riscv32.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Nicolas Schier <n.schier@avm.de>
Acked-by: Masahiro Yamada <masahiroy@kernel.org>

---
Difference to original series:
* Also handle -EL/-EB for MIPS
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index d0f5262a9c0f3b4aa79a91c20cc149d034ffa0b7..7d40f84d5efde18ed3a2f4d8cf7a9b1ec3610ed4 100644
--- a/Makefile
+++ b/Makefile
@@ -1137,8 +1137,8 @@ ifneq ($(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS),)
 LDFLAGS_vmlinux	+= --emit-relocs --discard-none
 endif
 
-# Align the bit size of userspace programs with the kernel
-USERFLAGS_FROM_KERNEL := -m32 -m64 --target=%
+# Align the bit size, byte order and architecture of userspace programs with the kernel
+USERFLAGS_FROM_KERNEL := -m32 -m64 -mlittle-endian -mbig-endian -EL -EB --target=% -march=% -mabi=%
 KBUILD_USERCFLAGS  += $(filter $(USERFLAGS_FROM_KERNEL), $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
 KBUILD_USERLDFLAGS += $(filter $(USERFLAGS_FROM_KERNEL), $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
 

-- 
2.50.1


