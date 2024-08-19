Return-Path: <linux-kbuild+bounces-3095-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE0B956FC5
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 18:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E86F91F2310D
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 16:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD65187854;
	Mon, 19 Aug 2024 16:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JK6o8PGo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044D316D4EA;
	Mon, 19 Aug 2024 16:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724083486; cv=none; b=hCaGG9zbzAe//H6KEpqOjzhEVaMF9n70I1Aseiv8jIGo1Yfuz9q7Sgahsb2lHf3yJKp4nDk0ZNbUbBeCnyPuq0l4Em/1xtfrGPfsooy+YgFJqv3uKIWE2G3LTKt6pZxKrqCdf1EFmn03H2i+s8zhM936Yo7LDB56EqgGmVwVcyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724083486; c=relaxed/simple;
	bh=iDgdDjvLeA3c1RUJaOpeZqGAnyV3W+vMth9fSp7FUKw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TRJyRdxFDbV0jLyoOzRA8yXaCuFbq4jfPMc3En6dIqH1JQM4YL8Rjs704nrRrspQbAr/sLs/zGWCZH2FZ8HrHnzF9GiDcwxZ+2ws8/0/8xSN6i4xqYkqFe+9WiKVAQ3CVvs7cYMvZ3MNj2m7USu116e+Pw/vgdvhw/moaXJophY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JK6o8PGo; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JD6we5004698;
	Mon, 19 Aug 2024 16:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=corp-2023-11-20; bh=y
	JAUYg+BxVCuyiXZyU2h1A/9sQ4OxkyC85U6c8PKAPQ=; b=JK6o8PGo5rARAg0MM
	mxwVniuB1QUjQRtadLYbbYCQkZw8YUNKg1kW8oe+6shFfwpDFW9OsCJrZOOfa3lG
	1fLD17VB1H1WouH74sttSQwjU7T+DTgbTqqvalA6m/Rw8amwqy3v9qaDfbEekanF
	hJ95wiFd36iSDHv5GDCkvZKk/vT7lvppI70uo491Ba8kNKAVqG38Afy/B/1b8kYS
	oiDrM++LUPr3iqCqEgswlwlG3dPKSz+9H51SD8rQSqHd3ZXSg0JIN1jd4eJD47qo
	m3i+s/4t6KFzgNKfVngvZrcnW9/ismWZHWiCvjOtJnEaMHPcHpst/gnGWtv2c2qo
	X1Gnw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m2dayu5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Aug 2024 16:04:28 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47JEbHoe007842;
	Mon, 19 Aug 2024 16:04:27 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 413h3pbba5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Aug 2024 16:04:27 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 47JG3Fev014254;
	Mon, 19 Aug 2024 16:04:26 GMT
Received: from localhost.localdomain (dhcp-10-175-39-147.vpn.oracle.com [10.175.39.147])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 413h3pb9w5-11;
	Mon, 19 Aug 2024 16:04:26 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Morten Linderud <morten@linderud.pw>,
        Haelwenn Monnier <contact@lanodan.eu>, Jann Horn <jannh@google.com>,
        Kees Cook <kees@kernel.org>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        Theodore Ts'o <tytso@mit.edu>, linux-hardening@vger.kernel.org,
        Vegard Nossum <vegard.nossum@oracle.com>
Subject: [RFC PATCH 10/11] kbuild: don't test for file presence in --dry-run mode
Date: Mon, 19 Aug 2024 18:03:07 +0200
Message-Id: <20240819160309.2218114-11-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240819160309.2218114-1-vegard.nossum@oracle.com>
References: <20240819160309.2218114-1-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_13,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0
 adultscore=0 spamscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408190107
X-Proofpoint-GUID: y83bWz6pT--oiwbk3p3YrmU5sfo4WeNx
X-Proofpoint-ORIG-GUID: y83bWz6pT--oiwbk3p3YrmU5sfo4WeNx

I'm not really sure if this is correct as I'm not sure under which
circumstances the files tested for with $(wildcard) would NOT be
present. I'm not even sure if this is the right approach to take.

However, it _should_ keep working the same as before for regular
'make' invocations and is necessary for 'make --dry-run' to work.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 scripts/Makefile.modpost | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 65f2bdc702369..139fa0b087b6d 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -99,7 +99,7 @@ modpost-args += -t $(addprefix -u , $(ksym-wl))
 modpost-deps += $(ksym-wl)
 endif
 
-ifeq ($(wildcard vmlinux.o),)
+ifeq ($(or $(wildcard vmlinux.o), $(dry_run)),)
 missing-input := vmlinux.o
 output-symdump := modules-only.symvers
 else
@@ -119,7 +119,7 @@ include $(kbuild-file)
 
 output-symdump := $(KBUILD_EXTMOD)/Module.symvers
 
-ifeq ($(wildcard Module.symvers),)
+ifeq ($(or $(wildcard Module.symvers), $(dry_run)),)
 missing-input := Module.symvers
 else
 modpost-args += -i Module.symvers
-- 
2.34.1


