Return-Path: <linux-kbuild+bounces-2042-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8D89017F6
	for <lists+linux-kbuild@lfdr.de>; Sun,  9 Jun 2024 21:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39BB31C20976
	for <lists+linux-kbuild@lfdr.de>; Sun,  9 Jun 2024 19:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30EDD17740;
	Sun,  9 Jun 2024 19:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="EOVMF6dY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002B04C84;
	Sun,  9 Jun 2024 19:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717961543; cv=none; b=bLhH9/Sz1TtssIw6Le7CkCIQXnxfg8jY3RxQAUoMh3IXBgQTl9NbpLrBcEskXZSUVRSoTSYRZw5LG5Zw2rCIOC7I+3Ve7qK8pMoH+VIHxpVCaZVCfRpE6/4pb5f70DD3jPl8xbGwz/5rOCW8cHpdoILYh6AoqzBg1TYo/s+ser4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717961543; c=relaxed/simple;
	bh=vkdJA8vgTluPGZ2BmgLw84meKO1zWoi9Stg1TKYVCD8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fbzRO+vWu4lS9XFe6ftWgGFnirbNGTuXnkT0WSHbOVPyVH1p+q3Xs2uBVI01x79Kc8RQkeDQA4Pgwr6OEpNERMOZbfp02VLi5YKwhVZKA4isWVsxys8oD1XwZeCgBgzwHjlKUx/0g6sOVgRsaZRxvNMDe1rbTxwBrG6GYY1HWVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=EOVMF6dY; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
From: Dragan Simic <dsimic@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1717961538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=97tuwoiIGpN9i00Ys+0F9wOxRoDavEIutKgl4QNUze8=;
	b=EOVMF6dY5jvh9dznstTBaBw/ZG5IKY/J8/X3BZTbJbZJfL4YvU3mSQWqewThlQzVt+J7T1
	09geiHSaBk7A+Yuc0vFZWsIV5tOnZTmS3Egk6GyUo/fMZ9wh6MLQ88tx1+4IHF2axIZSVG
	QxjFfYcJ1mXHOdAPZ1mX/0HYMKYpotElwu6RkHJLM9gVbbLCCSm5tDOwFz80xQhQcHOjcs
	cD4wPxMRhoyUqU3BYdD4AR8uaA0TwIUXkxvYBktMzIFd1/9sNBCY+bwUQDr/fM2TXb4Rh8
	CojKvsufGjkozZEVOneaYUSRtRiShwMSJwpp+0Jau1f5y2vbonJakMa5tu3WaA==
To: linux-kbuild@vger.kernel.org
Cc: masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: Install dtb files as 0644 in Makefile.dtbinst
Date: Sun,  9 Jun 2024 21:32:12 +0200
Message-Id: <ae087ef1715142f606ba6477ace3e4111972cf8b.1717961381.git.dsimic@manjaro.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

The compiled dtb files aren't executable, so install them with 0644 as their
permission mode, instead of defaulting to 0755 as the mode.

Signed-off-by: Dragan Simic <dsimic@manjaro.org>
---
 scripts/Makefile.dtbinst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.dtbinst b/scripts/Makefile.dtbinst
index 67956f6496a5..9d920419a62c 100644
--- a/scripts/Makefile.dtbinst
+++ b/scripts/Makefile.dtbinst
@@ -17,7 +17,7 @@ include $(srctree)/scripts/Kbuild.include
 dst := $(INSTALL_DTBS_PATH)
 
 quiet_cmd_dtb_install = INSTALL $@
-      cmd_dtb_install = install -D $< $@
+      cmd_dtb_install = install -D -m 0644 $< $@
 
 $(dst)/%: $(obj)/%
 	$(call cmd,dtb_install)

