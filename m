Return-Path: <linux-kbuild+bounces-3096-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF7F95700C
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 18:17:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1CBFFB290AA
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 16:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABE93171E43;
	Mon, 19 Aug 2024 16:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="B5+Ydgci"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5BE17BED0;
	Mon, 19 Aug 2024 16:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724083492; cv=none; b=qHb61V+u0gL7gEjkvJap9Lf5V0LCD6hHAt7ujxQC8BYgGQbmNuqmV0grCdfzpiRZ/+51CDzT4yt3AP38rmUS1VqGoOAzQfiZ9oN8kCP5auzoF5UjxDY+xMDi26nkCkq0jEubJrqkUKUjInStNTA10DnZyK61Or4B1QiwEAi5UDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724083492; c=relaxed/simple;
	bh=UROqIgc9Nq6hwnGbMe5qpcJ5S3JpUgYDfQ3zqb/R2lU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LFkU65Vp68yDSXgQbJr6d0CUcCxkbi6bVi7VgBVyDDlt77QWXvnomRXm7jq/yJfoOJ7nVkF5dUigO9fqhgL2/cC1e7w2LCgJeVafVb8XQ+lkMlcaNUremupF+xn+UsM4geGhi0Pe2URhquDBPFmS9Nc6N1JyOa3vQsgk3N9YIa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=B5+Ydgci; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JD6vqf018670;
	Mon, 19 Aug 2024 16:04:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=corp-2023-11-20; bh=o
	UGJoOzcNlu4e1Btzz6EDrdKUE5D/s09/B09A0jdYhQ=; b=B5+Ydgcil8DBJ/7SE
	4AQIQxYvzEfOq+aIQmzbr9p9JsbOq+mnF4dsxBIy9o9aLm7OlwMsJMSbu3oNUhZN
	jgAqAUsE2jdWVUhwwbuAdQN8PSemZuEF8Oao9qFxKpsTBLChgr3DFKeAOns1q6ox
	u+wFp9vqyF+PVNC5w6l8HpikOC0MZjYi5jUgT+q8r7aBqhxFNmWpviU9vt09VnH3
	dSn5Edgdod7u9fihxuAXB4aszrXlBs0qC5+z/zAuTEpJuGccHFEDCDwNoHraOSl7
	rpzI2yja+J5invp1N6VmK1JXkoB/u7l9pXKMbEg9tBtyYhTEFkL09dFELqQSUA6J
	LQcyw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m3hjxw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Aug 2024 16:04:32 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47JEbJJQ008119;
	Mon, 19 Aug 2024 16:04:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 413h3pbbcx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Aug 2024 16:04:31 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 47JG3Fex014254;
	Mon, 19 Aug 2024 16:04:30 GMT
Received: from localhost.localdomain (dhcp-10-175-39-147.vpn.oracle.com [10.175.39.147])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 413h3pb9w5-12;
	Mon, 19 Aug 2024 16:04:30 +0000
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
Subject: [RFC PATCH 11/11] kbuild: suppress echoing of commands in --dry-run mode
Date: Mon, 19 Aug 2024 18:03:08 +0200
Message-Id: <20240819160309.2218114-12-vegard.nossum@oracle.com>
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
X-Proofpoint-ORIG-GUID: 0NvHgeI2o8y5pGCXm_gQktbN_3koB2c4
X-Proofpoint-GUID: 0NvHgeI2o8y5pGCXm_gQktbN_3koB2c4

If the user ran 'make -n' then we will already print all commands.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Makefile | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index d08ade5791c2e..a1a3e96a10ea2 100644
--- a/Makefile
+++ b/Makefile
@@ -96,9 +96,10 @@ ifneq ($(findstring 1, $(KBUILD_VERBOSE)),)
   Q =
 endif
 
-# If the user is running make -s (silent mode), suppress echoing of
-# commands
-ifneq ($(findstring s,$(firstword -$(MAKEFLAGS))),)
+# If the user is running make -s (silent mode) or -n (dry run mode),
+# suppress echoing of commands
+ifneq (,$(or $(findstring s,$(firstword -$(MAKEFLAGS))), \
+	$(findstring n,$(firstword -$(MAKEFLAGS)))))
 quiet=silent_
 override KBUILD_VERBOSE :=
 endif
-- 
2.34.1


