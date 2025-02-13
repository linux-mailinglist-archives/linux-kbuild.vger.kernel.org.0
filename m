Return-Path: <linux-kbuild+bounces-5739-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC99A344C4
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Feb 2025 16:09:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 797501895424
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Feb 2025 14:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A28522010E8;
	Thu, 13 Feb 2025 14:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="O1Ebdatk";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gN7K7qt6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE011FFC69;
	Thu, 13 Feb 2025 14:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739458537; cv=none; b=TlyIdELweyVMiUBGa3bH0dOgFMdL+c1/AFx3x3paoBs1htXELwCs8AVW3digjCB0Mj954IoB4F5gyrOvdyquOzoK+RpzweLLUs/Xx+OE/q/wBff84LPzRVYNiWtwkRKX/IJgSfAEGPmMKgrm9fQErFP2Bi6khxo1H1UMJBYkUWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739458537; c=relaxed/simple;
	bh=FrlWzJ/Y0927Wnn4CmnicCMg6JslJXYpO2GlTTnKQWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nrtnOKGVi9TojH8Zt1dintvVkVHbRI9LBsKJa91t2BA5zSOhsa3j0wWdXciMpvOh+DudV7og/eXG2gi8P66Gdqr5fIJsHx7Xxff3LwFcXUQArdjvRTbQDDsDMNbtYaX+WBExjxs7PJzF1IlHe9izD8KZzmHNH+DLAOfnjPdnRhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=O1Ebdatk; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gN7K7qt6; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739458533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QxpViyIyD6RBVQ05WeptWSdoHP/MRHDR6Dst2542JiE=;
	b=O1Ebdatku65ug216me4MAN28DYtauUw0aM3tldxhVdcFIw4/WFf/uW/HHum9TN7KNtGsD9
	rjKRzDHi5EiGTfY4T1JN4vQs5QnTlHDphRTbXQi2DpqAJIl7wnUx3PiOGscCyP8p0FAHh+
	vOei7o//A3dCB0pJdeXibuA+UQ7e8H5Xic9T2x7n5UQhw5NGbwxOmEVFPe/osB025Q+Fu4
	VdQbn0CGCle9LZrQIZupcozmnwDFdIvIaQpnn/eTOcF1ykvuvh86abVA8WRnedtnCtgzMq
	ZnvsBH+Bx8Ri5usCKecuP+oGlHr73ikbRmB4X56Y3MVRZw7G2d6HvnzIiE0jFQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739458533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QxpViyIyD6RBVQ05WeptWSdoHP/MRHDR6Dst2542JiE=;
	b=gN7K7qt6ZfVgMg6MTMU+3eMP5j4jwTaCrOet/znrGheZzwPafa7mzwRpJXiZRVTcHANEY5
	I8Dp7G+R41+NkYBg==
Date: Thu, 13 Feb 2025 15:55:17 +0100
Subject: [PATCH 1/2] kbuild: userprogs: fix bitsize and target detection on
 clang
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250213-kbuild-userprog-fixes-v1-1-f255fb477d98@linutronix.de>
References: <20250213-kbuild-userprog-fixes-v1-0-f255fb477d98@linutronix.de>
In-Reply-To: <20250213-kbuild-userprog-fixes-v1-0-f255fb477d98@linutronix.de>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 stable@vger.kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739458532; l=1335;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=FrlWzJ/Y0927Wnn4CmnicCMg6JslJXYpO2GlTTnKQWk=;
 b=adzptC/mQxCXrGt1noEivABB6gpXcDp5mhYQmQ3Km5NW0CIrAsc9uSZkmMdT9LWQxLwYYehRB
 4MQonHw1uTKDhyt+8jNqUurHFYBpohaLCbLljbiJseYHORuf7Lxb1ft
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

scripts/Makefile.clang was changed in the linked commit to move --target from
KBUILD_CFLAGS to KBUILD_CPPFLAGS, as that generally has a broader scope.
However that variable is not inspected by the userprogs logic,
breaking cross compilation on clang.

Use both variables to detect bitsize and target arguments for userprogs.

Fixes: feb843a469fb ("kbuild: add $(CLANG_FLAGS) to KBUILD_CPPFLAGS")
Cc: stable@vger.kernel.org
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 9e0d63d9d94b90672f91929e5e148e5a0c346cb6..bb5737ce7f9e79f4023c9c1f578a49a951d1e239 100644
--- a/Makefile
+++ b/Makefile
@@ -1120,8 +1120,8 @@ LDFLAGS_vmlinux += --orphan-handling=$(CONFIG_LD_ORPHAN_WARN_LEVEL)
 endif
 
 # Align the bit size of userspace programs with the kernel
-KBUILD_USERCFLAGS  += $(filter -m32 -m64 --target=%, $(KBUILD_CFLAGS))
-KBUILD_USERLDFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CFLAGS))
+KBUILD_USERCFLAGS  += $(filter -m32 -m64 --target=%, $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
+KBUILD_USERLDFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
 
 # make the checker run with the right architecture
 CHECKFLAGS += --arch=$(ARCH)

-- 
2.48.1


