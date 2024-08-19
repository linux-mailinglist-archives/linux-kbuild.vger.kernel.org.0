Return-Path: <linux-kbuild+bounces-3087-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C335956FBF
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 18:07:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06A111C21D64
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 16:07:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBEFC185E6A;
	Mon, 19 Aug 2024 16:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LbeiPn3D"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D56C8287D;
	Mon, 19 Aug 2024 16:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724083462; cv=none; b=SCfdRwH9FNTZL0R2gGKuKGummfmIjYW/kgq1EwdFR7TTCEKXGu2JeyrI8Qbr5+v0cocVuI6v8za1y0cVmX1QzS9V/00lWWCwh502ENgNXWAQfAEiEck8vWLBXP/xWeELFYrpCna7kTy/lcMDiA76/z6nbi35K4xmze2wWbDAM8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724083462; c=relaxed/simple;
	bh=J57vH6+xb3CLqbGuaNDOp1pArYBV6p/7PeEANvE7wQ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aoN2mm3+3cszNM7OGkuuMgtQTFaZ1VoBQlTAvcgSvrT2mhgwD3dDOLVMC8D86Pv9Bj+omVavrBKjUQTz6puhMxzG34jY6zmDCQkoyKEEiCoAQl5PV41rPUwNNpYgkcp9ELwHPlNQwHn+h5gakkKX+6YeNsL85YfSYi3I/KfecbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LbeiPn3D; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JD6qVh004652;
	Mon, 19 Aug 2024 16:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=corp-2023-11-20; bh=l
	ZBL59Au43pCklhhwPVB73vcLhjp+oPHjVQAId5X/PY=; b=LbeiPn3Dz0jei06Ur
	b8SWlRThDgg9vDj+cRLvTU0+pGMdyz92p+zyb5J6gcjGVv5i/9vr29pmKILcotyg
	QsENXwvO0xSZpYt4+m0Rwi/YdeCgJXx+QBP8rLn12hGW0FukwZxu1W0VCxTt7emK
	0/YOb9/yaJMHsnFHkN6/6BsvbNsQgGpX8l0XZD6DVBupFB4TG7bVDdoRbakaUcmx
	ZAZOz++DB31YzlLrP47OJ0BUzin4KHfEPFzRL5ChcPml++sG8a9dmvTHAL2H1XgD
	oQtUFJIelPTeT2Ds0Pp6CKbOUG7YdNFiPmZoc42OK+ZB6ODzM4/MJutmgSSHVdKq
	omyLw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m2dayru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Aug 2024 16:04:00 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47JEbHVc007830;
	Mon, 19 Aug 2024 16:03:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 413h3pbadx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Aug 2024 16:03:59 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 47JG3Feh014254;
	Mon, 19 Aug 2024 16:03:59 GMT
Received: from localhost.localdomain (dhcp-10-175-39-147.vpn.oracle.com [10.175.39.147])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 413h3pb9w5-4;
	Mon, 19 Aug 2024 16:03:58 +0000
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
Subject: [RFC PATCH 03/11] kbuild: pass KERNELVERSION and LOCALVERSION explicitly to setlocalversion
Date: Mon, 19 Aug 2024 18:03:00 +0200
Message-Id: <20240819160309.2218114-4-vegard.nossum@oracle.com>
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
X-Proofpoint-GUID: Ll0YTOBB0zw4SHfn5qMjkKr9bxP_O2jr
X-Proofpoint-ORIG-GUID: Ll0YTOBB0zw4SHfn5qMjkKr9bxP_O2jr

These environment variables are passed when invoking 'make', but if
running 'make -n' we need to pass them explicitly so they become part
of the printed command.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index f09c036daf2f5..58f3843ccfac6 100644
--- a/Makefile
+++ b/Makefile
@@ -1165,7 +1165,10 @@ vmlinux: vmlinux.o $(KBUILD_LDS) modpost
 $(sort $(KBUILD_LDS) $(KBUILD_VMLINUX_OBJS) $(KBUILD_VMLINUX_LIBS)): . ;
 
 ifeq ($(origin KERNELRELEASE),file)
-filechk_kernel.release = $(srctree)/scripts/setlocalversion $(srctree)
+filechk_kernel.release = \
+	KERNELVERSION="$(KERNELVERSION)" \
+	LOCALVERSION="$(LOCALVERSION)" \
+	$(srctree)/scripts/setlocalversion $(srctree)
 else
 filechk_kernel.release = echo $(KERNELRELEASE)
 endif
-- 
2.34.1


