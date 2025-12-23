Return-Path: <linux-kbuild+bounces-10327-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D74CD857E
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Dec 2025 08:04:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 26E3130049C9
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Dec 2025 07:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 724CD2F2910;
	Tue, 23 Dec 2025 07:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="19JnU+1R";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EqyPUknW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F3E26C3A2;
	Tue, 23 Dec 2025 07:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766473459; cv=none; b=W8n2NU4IhlfN5SfeAAsBAzfQEKGQKSYoOuZpo1NW32CUPThjusUx+VlL9XUo3ldvWXZqYgbBXWEg5F92YaQXf6bFs3O5qm8Ns5JuuMyMubb5XoIQ11/Rw8MGc6uTbdpBbH8qffvCmXtGB76WKxPy482X/WYtJ81HPeJ5squO2sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766473459; c=relaxed/simple;
	bh=Yd4HmCaRPrqWYEU2zhoNXtl8+qOP1jtlDRWKrpC3Rdw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pxKlWPCb41rUIETmLEi9OCxgp/RbtkdOIe0UkuwlF9h5qyF7qHf9/NNvaNZEk8ZYIdZnZdCeqQ4XuH32E4Ky7trTYWELzDI11dXLka+q0C5INu/x31caqdo1D2mUxoKTbSKGAUkVVLbQkmC7vgXvzLEea1jjA9F9264JjRggV+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=19JnU+1R; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EqyPUknW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1766473456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=K3gV414u+Yc4wMSM7xqi5LXM3RbWQDpMH3ISLeml8MU=;
	b=19JnU+1Rur1a0TnxKuiHnVkvpb6GcboXTafU6NdPXNaPK9WEjtx8mdpgj5QHng+ea0J2MQ
	Is1p/shSi54ql2p7oQIt4G361E+qfvpIFk1jblEPXkwDoHBkyYfPHzDGsQo+rqGRJcdokj
	BCAlpaMEdwdbeESm0cQBPk5FEOZFxpRpokf/4nQwCDINeZnh0+cYxEb41h9WyQhNBhIgB2
	7FWZ5qpGicCu9h75uHA76eCisLsiWzkL5zQma7sclLHSxzOqzMHEjn9YZ1l3RLQeJ+SCrb
	2zi7DT9Od0Md2cQaT2M1ZIuyVr5C60ydnMWoN90h8/ylBCal6qk0bnomqnhZTQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1766473456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=K3gV414u+Yc4wMSM7xqi5LXM3RbWQDpMH3ISLeml8MU=;
	b=EqyPUknWWUXXjSEbeevo5fopEy/0NA1OMj34iRei21C6W6r1DkHCU3Y/7tzlLyxCC1xw5Q
	2xxnHZgOZ8QfQAAw==
Subject: [PATCH 0/5] kbuild: uapi: improvements to header testing
Date: Tue, 23 Dec 2025 08:04:07 +0100
Message-Id: <20251223-uapi-nostdinc-v1-0-d91545d794f7@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOg+SmkC/x3MQQqAIBBA0avIrBPUVKKrRAvRqWajohWBdPek5
 Vv836BiIawwswYFb6qUYoccGPjDxR05hW5QQhmpxMgvl4nHVM9A0XOrMXicTNBWQ29ywY2e/7e
 s7/sBK1mgWF8AAAA=
X-Change-ID: 20251203-uapi-nostdinc-64edce85d464
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Brian Cain <bcain@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-hexagon@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766473456; l=919;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Yd4HmCaRPrqWYEU2zhoNXtl8+qOP1jtlDRWKrpC3Rdw=;
 b=XBPuvpG9XsVr3yJuVGQuyOrzv7eDF1hmJg8VSPhLx8A8gXFqWGi0R0owIqYYuhbw6iiRm2Iwf
 fbxZaGFxdSnC66ytOn9X+ZgsxKJA2YL2oGrcAYQmHHWSH640uskGskD
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Also validate that UAPI headers do not depend on libc and remove the
dependency on CC_CAN_LINK.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Thomas Weißschuh (5):
      kbuild: uapi: validate that headers do not use libc
      hexagon: Drop invalid UAPI header asm/signal.h
      kbuild: uapi: don't compile test bpf_perf_event.h on xtensa
      kbuild: uapi: split out command conditions into variables
      kbuild: uapi: drop dependency on CC_CAN_LINK

 arch/hexagon/include/{uapi => }/asm/signal.h |  0
 init/Kconfig                                 |  2 +-
 usr/include/Makefile                         | 87 +++++++++++++++++++++++++++-
 3 files changed, 87 insertions(+), 2 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251203-uapi-nostdinc-64edce85d464

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


