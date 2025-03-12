Return-Path: <linux-kbuild+bounces-6077-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EFAA5D4C5
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Mar 2025 04:35:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A9BD1793FE
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Mar 2025 03:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906A378F44;
	Wed, 12 Mar 2025 03:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="IDSg4D9t"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A625679EA;
	Wed, 12 Mar 2025 03:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741750505; cv=none; b=rSjMM3HKZ8Pm82ZjieiXIXNTWLerOLpvG2O/ONZrDUX2bouPfMDRD/BwGqInVivx1zZrK8BOmEs7I755T9Bw36zuP5diqlR9+ISH21IpAbXhUDlPqC8AR4IycB0kyV13jVsLLJWktdktIFkCcEVsn0KiL977pjE7+mKUSrMyVEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741750505; c=relaxed/simple;
	bh=HIxFMT3KC4NSqGNWjQ9kfWLBop+Y5Xq5RRV9Zpj4uvg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VaOSvEaMiswNlLLI2tkXNdz6tf2NlCv7zyV3nIhuo/ykfRwQLLRRi70tk7tx71SF/isp2tj6xznXSMMaAA24V6UQnBL/V+JNisrcuTjilN3ld/tR9hlhN9C/trPrt9kIQciAazGGxFLsFGtRKzjCfqTKSMwoAJzAW/0LX8g4mag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=IDSg4D9t; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from terminus.zytor.com (terminus.zytor.com [IPv6:2607:7c80:54:3:0:0:0:136])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 52C3YLCE2365211
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Tue, 11 Mar 2025 20:34:25 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 52C3YLCE2365211
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025021701; t=1741750467;
	bh=qHk1sd29R3O16b3aqrjLVVhRLyzf7AZMMPeMDmfqqDI=;
	h=From:To:Cc:Subject:Date:From;
	b=IDSg4D9tDh+xh8v3PDa3t9qHaZLZa04psYHIiGXPQorvPLAL6gee6inBI4WPL9ktI
	 nH/RcObNp2Q5u3U4e3EWXEXNdF1IFJDD7lv9ybPYa7VYtyrJPJTAOBSEk9u10Ehk94
	 vSo7kk1kZy2JD0Q773HOmD7aQxNjtha8p3dWjZJLoMtQ3i9hDcd5rggco5HMCCzPNT
	 GxLAqfx1Filsj8+fu7v7lV1M9HmPxY8oA0qW7+GvTUv4Z5hAdniBrz7edIYlgp0LwM
	 AMJRNXJ6uN3S6Pwf/SvOhMx0KuwbesKcIYvMeyoJmsCtghXdkPrAp7AsEncCiOOsbG
	 leGJzaLIgW59Q==
From: "Xin Li (Intel)" <xin@zytor.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu, bp@alien8.de,
        hpa@zytor.com, sraithal@amd.com, n.schier@avm.de
Subject: [PATCH v3 1/1] kbuild: Add a help message for "headers"
Date: Tue, 11 Mar 2025 20:34:21 -0700
Message-ID: <20250312033421.2365201-1-xin@zytor.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Meanwhile explicitly state that the headers are uapi headers.

Suggested-by: Borislav Petkov <bp@alien8.de>
Signed-off-by: Xin Li (Intel) <xin@zytor.com>
---

Change in v3:
* Fix a typo and write uapi in capital letters (Nicolas Schier).

Changes in v2:
* Revise the help message for "headers" (Masahiro Yamada).
* Revise the shortlog (Masahiro Yamada).
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 70bdbf2218fc..08918088ab35 100644
--- a/Makefile
+++ b/Makefile
@@ -1659,7 +1659,8 @@ help:
 	@echo  '  kernelrelease	  - Output the release version string (use with make -s)'
 	@echo  '  kernelversion	  - Output the version stored in Makefile (use with make -s)'
 	@echo  '  image_name	  - Output the image name (use with make -s)'
-	@echo  '  headers_install - Install sanitised kernel headers to INSTALL_HDR_PATH'; \
+	@echo  '  headers	  - Build ready-to-install UAPI headers in usr/include'
+	@echo  '  headers_install - Install sanitised kernel UAPI headers to INSTALL_HDR_PATH'; \
 	 echo  '                    (default: $(INSTALL_HDR_PATH))'; \
 	 echo  ''
 	@echo  'Static analysers:'

base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
-- 
2.48.1


