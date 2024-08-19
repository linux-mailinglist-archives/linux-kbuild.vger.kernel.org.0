Return-Path: <linux-kbuild+bounces-3088-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 297D4956FC0
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 18:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6E261F219C4
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 16:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF068287D;
	Mon, 19 Aug 2024 16:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HJbMfpW+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9828A185628;
	Mon, 19 Aug 2024 16:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724083464; cv=none; b=ZbSkgTgMlqddTxj/otio6Oau+pdLFKC8U/OHwTwH87h2fi6KFwKXzHgUHg4vEdUwPYlM1fUa7VN7D12mJK+JYRpkvQgO7eBIun/O2nnFR8krsOlRHKcSbEyWwKkLTF9W2ZwXvsCDKImC9lN2MyvykLMFOmzcxeVabl65XiX1ddc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724083464; c=relaxed/simple;
	bh=3w4Y2J/fOiqJ3huhO+LscgxZqE488ZLUMBysFo7u4+8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eCa6e1LjEINfDcpl8JrKPhE/hWw94t9TKMOwsdQ83vAKhP4ZoxDmKo9Gyc3RBdXvcXzLNuAIXvirYzDRBPPzeJBwsmVHbtmmLLcNqeddO0wJaRiIgMJPoku1RUWjU/GfiX2pnWt99rBU999enXX13W/ZmRLyj0zCSzNU24gMQk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HJbMfpW+; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JD7f3E003174;
	Mon, 19 Aug 2024 16:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=corp-2023-11-20; bh=5
	BgnP9uUFC04LGUJy6VfpUMDDksg1vYxSNcRrVpSIGA=; b=HJbMfpW+mP5KmfIHX
	7dBg7zklEmemCobcXsOg9xHajhRtjBRBrAmmn5pCNB2DarN6SXS2qup6XrafLUPK
	jk7+VvNzynDa9qH+FJ6y17AzPFGwtCBkHMKADjfoJID0verOy8/PVTVCYfwwR/3H
	wTVgDQwyYAm8WX63yWVrxaqXs792AlFgpnpLM7wy1edIHhJ6JRamMBXwKfnpGSZN
	/CRwwh6A5WGbcVXeIVo5H2+Pqws3Yedr3M1TfdGUYQQhzH9xzknvqUtJ9mKTilg/
	b0qDRUfDQx7ef6zwQ+6NewG33B40A+fhixKwjGKhhncbnuTACQqjFnoVJl5CSR3W
	HP2qQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m6gaync-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Aug 2024 16:04:05 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47JEbHh4007843;
	Mon, 19 Aug 2024 16:04:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 413h3pbamp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Aug 2024 16:04:04 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 47JG3Fej014254;
	Mon, 19 Aug 2024 16:04:03 GMT
Received: from localhost.localdomain (dhcp-10-175-39-147.vpn.oracle.com [10.175.39.147])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 413h3pb9w5-5;
	Mon, 19 Aug 2024 16:04:03 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Morten Linderud <morten@linderud.pw>,
        Haelwenn Monnier <contact@lanodan.eu>, Jann Horn <jannh@google.com>,
        Kees Cook <kees@kernel.org>,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        Theodore Ts'o <tytso@mit.edu>, linux-hardening@vger.kernel.org,
        Vegard Nossum <vegard.nossum@oracle.com>,
        Andrii Nakryiko <andrii@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>
Subject: [RFC PATCH 04/11] kbuild: don't execute .ko recipe in --dry-run mode
Date: Mon, 19 Aug 2024 18:03:01 +0200
Message-Id: <20240819160309.2218114-5-vegard.nossum@oracle.com>
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
X-Proofpoint-ORIG-GUID: hqNG9Y67zETK8DzDVPDoy6kdoPkrmStE
X-Proofpoint-GUID: hqNG9Y67zETK8DzDVPDoy6kdoPkrmStE

Prefixing a line in a make recipe with + makes that command execute even
in --dry-run mode. We don't need that here; remove it.

Fixes: 5f9ae91f7c0d ("kbuild: Build kernel module BTFs if BTF is enabled and pahole supports it")
Cc: Andrii Nakryiko <andrii@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>
Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 scripts/Makefile.modfinal | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 696888f0a0bde..2679304f158ad 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -60,9 +60,9 @@ if_changed_except = $(if $(call newer_prereqs_except,$(2))$(cmd-check),      \
 
 # Re-generate module BTFs if either module's .ko or vmlinux changed
 %.ko: %.o %.mod.o scripts/module.lds $(and $(CONFIG_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN),vmlinux) FORCE
-	+$(call if_changed_except,ld_ko_o,vmlinux)
+	$(call if_changed_except,ld_ko_o,vmlinux)
 ifdef CONFIG_DEBUG_INFO_BTF_MODULES
-	+$(if $(newer-prereqs),$(call cmd,btf_ko))
+	$(if $(newer-prereqs),$(call cmd,btf_ko))
 endif
 
 targets += $(modules:%.o=%.ko) $(modules:%.o=%.mod.o)
-- 
2.34.1


