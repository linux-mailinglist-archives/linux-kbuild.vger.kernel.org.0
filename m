Return-Path: <linux-kbuild+bounces-6010-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4ADA57835
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Mar 2025 05:05:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5299B3AEDB9
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Mar 2025 04:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA14014A0B7;
	Sat,  8 Mar 2025 04:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="evn/H3V5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFCF74040;
	Sat,  8 Mar 2025 04:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741406738; cv=none; b=EQdwjfO893bItgFXkxiKKJ7kHo5LgJCY5I/kIWjpi5xr4idBYIaj1esrev3MXy6vGobX/cy1njllkd4MM+l80vwMa0kayEsDnq2rlB85OCTepzyx9YtazUSv5kYuwvSM4JQCNWHGqyyyNzcXJf/Y1ItUb2epIfXz5t8pz65QXfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741406738; c=relaxed/simple;
	bh=K+99yL0sZ4CSDoJdmI5TDT8OXmbbc7Yvgi6uhVeYI6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tRYbxuh0mSjPgY05KkSxlcmzFZUGPF1S9Dekw51/EGenAemjKH1kv7CSWlHVZ698xiAi4XqhACwuLv/jPfc6z7axbdyEUVptm1Ynjk22QP1YkUGKN87FhrL1LmxEhpPKNuw3f2gl2gMSS9Lj39hmB5mAMZ+lPvXnaKvCJOBt67c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=evn/H3V5; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from terminus.zytor.com (terminus.zytor.com [IPv6:2607:7c80:54:3:0:0:0:136])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 52844pmC585572
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 7 Mar 2025 20:04:55 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 52844pmC585572
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025021701; t=1741406696;
	bh=A40h3med0vL+BEFOR0ZaeFpXzh3uArCOZeASQFAe+r4=;
	h=From:To:Cc:Subject:Date:From;
	b=evn/H3V57XPl2oAfuDcoCJSbnsOtz6jbUPOtdFDZUbgPKtSW90F5qbLxgem37SCk6
	 DJWCa7oBNr/bN0Y1PkpchuoLHmzSw4gHuPPjG/thBBMOdOxhifE26f9oDygMgiUWp7
	 MkmI49ziusT/YBLU0Y4zyaoRmQrW8WUW/UoD6W58i+oBNX2YORX7dswYN7+XZKita9
	 REnbPvPgpFIqp3y+ZSTSWfu40obwXDNAOigdePfRc0+Wx3l5qGqN+p7/dPxAbPHMgI
	 9CHEQE8jxkZQOb/2/cuMlyUueAiFb0bIYvLMfNN99GKBmxBPG23NuLSvy95n232qCo
	 d74yrAd43hUYw==
From: "Xin Li (Intel)" <xin@zytor.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu, bp@alien8.de,
        hpa@zytor.com, sraithal@amd.com
Subject: [PATCH v1 1/1] kbuild: Add "make headers" to "make help" output
Date: Fri,  7 Mar 2025 20:04:51 -0800
Message-ID: <20250308040451.585561-1-xin@zytor.com>
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
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 70bdbf2218fc..8f5aa710105e 100644
--- a/Makefile
+++ b/Makefile
@@ -1659,7 +1659,8 @@ help:
 	@echo  '  kernelrelease	  - Output the release version string (use with make -s)'
 	@echo  '  kernelversion	  - Output the version stored in Makefile (use with make -s)'
 	@echo  '  image_name	  - Output the image name (use with make -s)'
-	@echo  '  headers_install - Install sanitised kernel headers to INSTALL_HDR_PATH'; \
+	@echo  '  headers	  - Install sanitised kernel uapi headers to usr/include'
+	@echo  '  headers_install - Install sanitised kernel uapi headers to INSTALL_HDR_PATH'; \
 	 echo  '                    (default: $(INSTALL_HDR_PATH))'; \
 	 echo  ''
 	@echo  'Static analysers:'

base-commit: 7eb172143d5508b4da468ed59ee857c6e5e01da6
-- 
2.48.1


