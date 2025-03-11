Return-Path: <linux-kbuild+bounces-6042-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE0BA5B8A8
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 06:50:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 904A417176F
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 05:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D035B1EBFED;
	Tue, 11 Mar 2025 05:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="gr2ebCVP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C88B1EB1B2;
	Tue, 11 Mar 2025 05:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741672211; cv=none; b=e96CT8WZYay8Gqk5m6BCZkPr1Fy4ymCnDArjtgkP5NsAdF2qHNNmSffc8m+sOFDAclF7FLwPvfr0l2O8IYfsphWsk2kaNX7BSFtNNnSwCcUqGdVrgDeDPsqWsUI6UAbkYAAlxNCv6nYCQZXm/VBZHngfVCxCbv0KEW2RIB0boFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741672211; c=relaxed/simple;
	bh=oWRpxtJB/FelnjuQ3NXHWuCWMzFylicv4QynWBgbBDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cS6a5YSVUS09RBziVqYHsrZmzLP3JH02dX7kYUjwXzAsemku3C5SESbIMMHgFITHt2mkJTF/3PxQZQGpTU8uKQsHBtR5YUyGOj/peS1trxEg+0SC64NoO62O586/wXDFJN6sof+qb4pEODz1nQV+PC6U3YCQKmuOauJEIP0I0ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=gr2ebCVP; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from terminus.zytor.com (terminus.zytor.com [IPv6:2607:7c80:54:3:0:0:0:136])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 52B5nWYs1931863
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 10 Mar 2025 22:49:36 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 52B5nWYs1931863
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025021701; t=1741672177;
	bh=ICPCL1git9asKYdudvh4W4dCOKLtucXhSdOWJbk8bjw=;
	h=From:To:Cc:Subject:Date:From;
	b=gr2ebCVPxmKTivILGL/t3m8ix/871CSup2Sf00LLgz6uHFVLzqiu0dklNeXUfRCgU
	 q8KsHkcZ0KfdVsSNeSgj+Mk8jTJNyrMlXE23+l3X6dBRmvfAGnw2l+YhdelLilcaBp
	 ZuhwqFjzt6dX57h3huaATm4UCnFDXFAI3pKy26GxBJILMBAcCHXicHhUyQT2S/yxHX
	 z39e9TCV7wUYJhVqReAXqnnv2cVIPOv/QFOfHqqB6ovv0/mjmylH/oz3fK3pJJhN8Z
	 X6yoAPO6isQRRx7n0VOVqO5VyF7E2ADe1NaebX2TOayaDr1z4NPLe867ucaf8rMiP/
	 LAOLZJKGC9C3Q==
From: "Xin Li (Intel)" <xin@zytor.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu, bp@alien8.de,
        hpa@zytor.com, sraithal@amd.com
Subject: [PATCH v2 1/1] kbuild: Add a help message for "headers"
Date: Mon, 10 Mar 2025 22:49:31 -0700
Message-ID: <20250311054932.1931853-1-xin@zytor.com>
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

Changes in v2:
* Revise the help message for "headers" (Masahiro Yamada).
* Revise the shortlog (Masahiro Yamada).
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 70bdbf2218fc..62afeda58080 100644
--- a/Makefile
+++ b/Makefile
@@ -1659,7 +1659,8 @@ help:
 	@echo  '  kernelrelease	  - Output the release version string (use with make -s)'
 	@echo  '  kernelversion	  - Output the version stored in Makefile (use with make -s)'
 	@echo  '  image_name	  - Output the image name (use with make -s)'
-	@echo  '  headers_install - Install sanitised kernel headers to INSTALL_HDR_PATH'; \
+	@echo  '  headers	  - Build read-to-install uapi headers in usr/include'
+	@echo  '  headers_install - Install sanitised kernel uapi headers to INSTALL_HDR_PATH'; \
 	 echo  '                    (default: $(INSTALL_HDR_PATH))'; \
 	 echo  ''
 	@echo  'Static analysers:'

base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
-- 
2.48.1


