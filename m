Return-Path: <linux-kbuild+bounces-5396-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF2DA05BB8
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jan 2025 13:34:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 749643A5A56
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jan 2025 12:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B489F1F9439;
	Wed,  8 Jan 2025 12:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kmKaEWyf";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PwBTqEIB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381A538F82;
	Wed,  8 Jan 2025 12:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736339687; cv=none; b=Z4O04L2QD6IGsYJRqejmP0DG97JTQLBfa8M+0kTfs4Z1R97Fuk48lpDgt009bzGZBCjZrhLTWwRF0CzmqGDHxszwcjrXoE3VzODjCjLuhEaaAP+Au1tmLaf7zE0rY/UBHM0stCL6Fca8GZzJhdeK64WguwtUDuUQ7StuP8axv0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736339687; c=relaxed/simple;
	bh=hB/bSyVY84/zNNKGCCmZNKj5Bjq6NvaJZseBtlq/8iY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FeYEEriTbGSB4G4xOkfaBVdVNS0eRjPpqS3MUrXauEHpxJiTK8gw1IPyONRV5SUkm6Y/KpJ5T1A6F2VhhPawacMfV8P+2hRU3KVIGf4IrJBtEai42kPsw8czmrDqfpUP5HIv5v+YOCHB/EDGkdpY/3pVxxUrUAz4TBjD916dPQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kmKaEWyf; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PwBTqEIB; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1736339684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=j+Iz4qlzbmwb0TEFHpgpvYyqvis5dghOs/xzxIDt1Kc=;
	b=kmKaEWyf0zn+2whjni4ayo+S90zwiS5wVUYpnPr5sL73eb/NPEHEzX0e6Zzt+1He1HThLy
	SQuU8MiBJZn/YwOO3DOWX1W5hvNzINHLrRC/kkZ4c+uS7NDzfI69hyMFqJbAePnihnehaF
	dFcXG8tDzaGOTstWHrXnHcLIX5Rujm3CbUu1I7S+wDCBTOOu4M13OBiMznzVv45KpKgb+R
	OjB61KcgQRUDVQuaReyVCeMHSf5xyP2yZpLYoijhgJLR+x43aN6WEW2bfoOLjQDaF5DWz5
	gSmWmKZcHVK7AI3fz4FiMDBjVK51kMMmIt0A/rNN88MZkWaChrTvxyiSMkoHFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1736339684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=j+Iz4qlzbmwb0TEFHpgpvYyqvis5dghOs/xzxIDt1Kc=;
	b=PwBTqEIB6t/Z+XISn4S2RIQmThYLhHBXkF2BdE9tU2fAPBX8mxR4jVJmODzqlibV69svhy
	BzmguI/FgeP2FRDw==
Subject: [PATCH 0/2] diffconfig: add verification mode
Date: Wed, 08 Jan 2025 13:34:27 +0100
Message-Id: <20250108-diffconfig-validate-v1-0-4b3d8ee489da@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANNwfmcC/x3MTQqAIBBA4avErBPUkn6uEi00xxoIDQ0JpLsnL
 b/FewUSRsIEc1MgYqZEwVeItoHt0H5HRrYaJJeKCz4yS85twTvaWdYnWX0jk51Rg5lGhaKHWl4
 RHT3/dVnf9wN9lrhqZQAAAA==
X-Change-ID: 20250108-diffconfig-validate-23b57b985e14
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736339682; l=567;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=hB/bSyVY84/zNNKGCCmZNKj5Bjq6NvaJZseBtlq/8iY=;
 b=cGKKjEdE/qE4Incd+ahaBQ66RV1TAsKqndEf48cDGLQ1a7+oQzjOS+OvTJSIFQkvY9RcuXe+e
 XjUDznSwbEtCpNBxl6iY1ZCizhuSrsgfDXkbKhDG4tEL7mm0myAWeCX
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Also add MAINTAINERS for some kconfig utility scripts.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Thomas Weißschuh (2):
      MAINTAINERS: Add kconfig utility scripts
      diffconfig: add verification mode

 MAINTAINERS        |  3 +++
 scripts/diffconfig | 23 ++++++++++++++++++-----
 2 files changed, 21 insertions(+), 5 deletions(-)
---
base-commit: fbfd64d25c7af3b8695201ebc85efe90be28c5a3
change-id: 20250108-diffconfig-validate-23b57b985e14

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


