Return-Path: <linux-kbuild+bounces-3090-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CEC956FC2
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 18:07:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67E251F223D5
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 16:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC13F185628;
	Mon, 19 Aug 2024 16:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BHFG4CKV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6457C186289;
	Mon, 19 Aug 2024 16:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724083467; cv=none; b=Ec1zU8PhJ2AXM+tq4liaeosgrNRzoaIDGFTUaTdwBvPUZO2cxLa0g6GZk8+RJNl5tNp1vcjCB8Mm3eo+A9KY5DavdyxuJHoQF70nkErXAVftguRbsRtUWcc82R3D0i1I5+I4z66/nJydUFmBCxMuDoljWcEqxdOcIyERWCozfUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724083467; c=relaxed/simple;
	bh=4xlZeP9eY5bvMNYZgvTnXZWDUEGzmXMbYJDjd9EvUsw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ptRZTRvygyZn5NJyHadHsy4w1+XvBRdspO7PdLKavnvGrrBeUzmeNdPwfqvBituFp6BrQJB/kQps1C3cD4azVjT3FH6lymMrdmmuU7jSZSfem0kYvK3A7AWgBJ36ekqrkycwi9jfXgyY9QARTGa21cq16lvYFAO+rxIIl49gNXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BHFG4CKV; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JD6qT1004656;
	Mon, 19 Aug 2024 16:04:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=corp-2023-11-20; bh=f
	VL4d7OwTk5iZUhQ9Tud4T42E1TQK9FykGhDZVf+KwU=; b=BHFG4CKVg+GGkjWzM
	eG6ZV0vz2U0Ywii6MLlN00G1FOUnyH3U5agHLxo4vNKmn3fvhZ6yNx3NBQwFY38X
	TQtI37Co4yt4Hih7MKPE0NHOxTHzVNH0lOQAGJRvQBIc/w2Fj+MNQwBo1SZPRlZJ
	Ik+7goVIEr69DX/DG1Psmi3c3/2CcDGmlWLCl7ZZ1y8RU28prGYMdQUMN5rqA1xK
	5ONfqsoBaiJVMHGuDi0Hiogxsc+fY234gk9gzoyHfCILyQw4CDSHHUY3r3kNSq4c
	G6R02nbq1MIHu2TWlGTkMkgNMRGenqdwA25EguJqRTvRqW+YPYRl9Ol2f3jLxEXN
	CvKDw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m2dayt5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Aug 2024 16:04:08 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47JEbI9q007857;
	Mon, 19 Aug 2024 16:04:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 413h3pbarq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Aug 2024 16:04:07 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 47JG3Fel014254;
	Mon, 19 Aug 2024 16:04:06 GMT
Received: from localhost.localdomain (dhcp-10-175-39-147.vpn.oracle.com [10.175.39.147])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 413h3pb9w5-6;
	Mon, 19 Aug 2024 16:04:06 +0000
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
Subject: [RFC PATCH 05/11] kbuild: execute modules.order recipe in --dry-run mode
Date: Mon, 19 Aug 2024 18:03:02 +0200
Message-Id: <20240819160309.2218114-6-vegard.nossum@oracle.com>
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
X-Proofpoint-GUID: Y8VCc3AHCh_c8hGF13RluGss-u2hi8nK
X-Proofpoint-ORIG-GUID: Y8VCc3AHCh_c8hGF13RluGss-u2hi8nK

modules.order is read by scripts/Makefile.modfinal to determine which
modules to build, so we need this recipe to execute if we want to be able
to output the recipes for building modules in dry-run mode.

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 scripts/Makefile.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index efacca63c8976..34f86dced67f3 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -417,7 +417,7 @@ cmd_gen_order = { $(foreach m, $(real-prereqs), \
 	> $@
 
 $(obj)/modules.order: $(obj-m) FORCE
-	$(call if_changed,gen_order)
+	+$(call if_changed,gen_order)
 
 $(obj)/dtbs-list: $(dtb-y) FORCE
 	$(call if_changed,gen_order)
-- 
2.34.1


