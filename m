Return-Path: <linux-kbuild+bounces-5738-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6423DA344AC
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Feb 2025 16:07:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BBB918950D3
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Feb 2025 14:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA0CB20013A;
	Thu, 13 Feb 2025 14:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jhvWygYo";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gMdo1Fxu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A50A2A1D1;
	Thu, 13 Feb 2025 14:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739458536; cv=none; b=nVJSX4Lu9V8KBh7NHJlfVeBy+whbRwIgkD0n60cClJ7BqVGarnX13/MbBCHw78N+L3dhuyiicVRS33blauKZwNVvmGJZTDfMCzi+elDk6V9nGJpd+N6ub9qMQhxxBT8kqjfylSLJrAzeMPKQwa5LtZBn+yz1VdoCwg5S/e87Hiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739458536; c=relaxed/simple;
	bh=vodOrnA+mp/Kiz6MLJ6Gms4MHuag31+UDR9YzBcrYwU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XsAJRm5pJjR/KJy3pgrGPhmifhz3YaQuMRDJekCHv0EQX+93+MRAKYarhWulW316BVzANzweLFTOqJbzjTznYCZqkxMd1ZMytJ02xQnZKhdLpQ8iPMcznFxAAiY6KFvZKRwn0MMU9AxCanugTlEw02RW1qmeg7HSGvyUI1bDMqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jhvWygYo; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gMdo1Fxu; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739458533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=U9uQyD9MxiTKtzDeq5SkjdXy3TxsjG73sLxqRoM0omM=;
	b=jhvWygYorfUcEr4jsOp6nTps494CSDslJzFbvopeMHTFVsOIkr/Vk+n/TFk9Nln8/Mlwhb
	kIcv0zSccNdh2fNMMvatrWKLWpKetypX/OYUpsDhJ6FuKWlffg8+wTcbeaZhOEQK+wn4U1
	bZlJTG23de1q+TBV0n/yl2XjB2IpZcc+XVPQ5Y9vf5aBJ6/RhNI9qfJ1KP4aXOW65UT0eJ
	ZuTkZvxpU+hSaybfvEWGKL+e9wMFO9PIes1UWPu/dWjtRJqJeTHV2hDc8gQNIz6pcuetxi
	fk15leYRewDcJGFN/lUcwk8UWVTNCj/sHePMNNjGoPdwwysY+a+3iFWSPXysmw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739458533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=U9uQyD9MxiTKtzDeq5SkjdXy3TxsjG73sLxqRoM0omM=;
	b=gMdo1FxuD9SidanWXipL9Lv4ACmkefZFyTNtMze37yMRx4bfcept1gupP1JuQOVq/aX+Xu
	rGK8/fgILPYi0PBQ==
Subject: [PATCH 0/2] kbuild: userprogs: two fixes for LLVM=1
Date: Thu, 13 Feb 2025 15:55:16 +0100
Message-Id: <20250213-kbuild-userprog-fixes-v1-0-f255fb477d98@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANQHrmcC/x3LSQqAMAxA0auUrA20dSpeRVw4RA1KKy2KIN7d4
 PLzeQ8kikwJGvVApIsTBy9hMgXj2vuFkCdpsNqW2poct+HkfcJT3BHDgjPflLCYdT1UtidnHIg
 9Iv1DaNu97wdn91mfZwAAAA==
X-Change-ID: 20250213-kbuild-userprog-fixes-4f07b62ae818
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 stable@vger.kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739458532; l=992;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=vodOrnA+mp/Kiz6MLJ6Gms4MHuag31+UDR9YzBcrYwU=;
 b=4cIfzXuaJsZ1Sg5xxpN9sCsSCIyYL4yS+JkK2zcNv5fYt6Ts1JtfWrRmDece8We8pFRhr95YV
 E5pFV93gukJC/yPiRsLzEugJnIDqW+rlo0Rxfdzl7rYzIEwyc7q14vS
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Fix two issues when cross-building userprogs with clang.

Reproducer, using nolibc to avoid libc requirements for cross building:

$ tail -2 init/Makefile
userprogs-always-y += test-llvm
test-llvm-userccflags += -nostdlib -nolibc -static -isystem usr/ -include $(srctree)/tools/include/nolibc/nolibc.h

$ cat init/test-llvm.c
int main(void)
{
	return 0;
}

$ make ARCH=arm64 LLVM=1 allnoconfig headers_install init/

Validate that init/test-llvm builds and has the correct binary format.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Thomas Weißschuh (2):
      kbuild: userprogs: fix bitsize and target detection on clang
      kbuild: userprogs: use lld to link through clang

 Makefile | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250213-kbuild-userprog-fixes-4f07b62ae818

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


