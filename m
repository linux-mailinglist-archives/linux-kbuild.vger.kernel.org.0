Return-Path: <linux-kbuild+bounces-5397-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F2EA05BB9
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jan 2025 13:34:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F483161969
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jan 2025 12:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2FCA1F9A84;
	Wed,  8 Jan 2025 12:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AeAqOg11";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="9N6+Y2qf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382021F893B;
	Wed,  8 Jan 2025 12:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736339687; cv=none; b=EkT4Z6Ivk6cZjdsPfFgBsEMd2Pf2kuqxEuMtGetgwCSEuDSei5MCwPePHWNueEdQULsmF9fm3uoTk+NkqVL/36Bfdy3YzzpmiPim5MQy7jcOo9jx7Pl93tJCoIWPXfzFX6rgjyMq+7gE+S/ga5476MA0ums48oIqhFOqmoZiuuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736339687; c=relaxed/simple;
	bh=j66gD95If1V7rLlG4SXXf7QqhU5PkFrIZZE9CHa3Bn0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u9WQP8Z6BbskZ2yKz0bQjjbFIec51Cp/jZ8x3A9t9FDad2hxNEEs5wbEYXju3p7uiCYyxaCPPT5yiA/A+9KXXGxfSv4EZ8rrCWVTFtxG53YWDxV4p6HXC1VfVbgsW0Pt1GrCBukiBMOI5wDiOkZQzW0Hxp0a0D5rcfHfXLOd1po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AeAqOg11; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=9N6+Y2qf; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1736339684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zG/VKkeXbPRVyyZufxWVimpdiaJHj3WpHkAHreHDIAA=;
	b=AeAqOg11j+mWHQnUeep4+g+6kXaSvetgtIKKL1ANGRy1mQ8cpK6rlcmnsKDashmtpYN161
	r6ynlmBEGPuIdMxhFEYWTFAcgRGW6Tkd5PNCYx5KJv2fVJfLmpwlc/xks9iffh8AgfWfl5
	KheHZOnohJxC+Y5gSFV/TvP4bQeBemmh1eHy6pbsZn1UTvajjkRsugPvle95peQgpQRlGe
	9I7RW4sH5+vl/sx3IrYY8RBFJO2UXZFN3WVv8iY02L6nSQnBnNZHHY154xKD7XpGnZuUT2
	FxnhaDv6uJ+E5uUOTDzsgrC3hwTvs0noX+6mA5+uNIsODm2lx6vZVk33fPKSgw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1736339684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zG/VKkeXbPRVyyZufxWVimpdiaJHj3WpHkAHreHDIAA=;
	b=9N6+Y2qfVndcU3gpijOnWxa6RIX8v9hjoJnNSvQZKLfZUcM4kps/8g2W39CgzVirEC9tWt
	S3Xn+S/AURa5MtAQ==
Date: Wed, 08 Jan 2025 13:34:28 +0100
Subject: [PATCH 1/2] MAINTAINERS: Add kconfig utility scripts
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250108-diffconfig-validate-v1-1-4b3d8ee489da@linutronix.de>
References: <20250108-diffconfig-validate-v1-0-4b3d8ee489da@linutronix.de>
In-Reply-To: <20250108-diffconfig-validate-v1-0-4b3d8ee489da@linutronix.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736339682; l=890;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=j66gD95If1V7rLlG4SXXf7QqhU5PkFrIZZE9CHa3Bn0=;
 b=uIcd0GpuHSixW45HfDXjQW12IXBorBp7xPEq1UI5fek4Ba7lT/q/umbEWNEHPefXCzZa9iVKP
 ehYhREStp4ACB0KZqN47RtRWHaKbSMso3QvxEcogpWXVU/YjheIiZRJ
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

There are various utilities in scripts/ which work with kconfig files.
These have currently no maintainer.
As most patches for them are applied through kconfig/kbuild anyways,
add an explicit maintainership entry.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 30cbc3d44cd53e6b1a81d56161004d7ab825d7a9..2bd414fb3e6d6515b57a57a5f3d4d735137edcce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12385,6 +12385,9 @@ Q:	https://patchwork.kernel.org/project/linux-kbuild/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
 F:	Documentation/kbuild/kconfig*
 F:	scripts/Kconfig.include
+F:	scripts/checkkconfigsymbols.py
+F:	scripts/config
+F:	scripts/diffconfig
 F:	scripts/kconfig/
 
 KCOV

-- 
2.47.1


