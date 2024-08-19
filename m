Return-Path: <linux-kbuild+bounces-3085-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF3D95700B
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 18:17:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3200B29AE6
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 16:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 069FD181B9A;
	Mon, 19 Aug 2024 16:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kkRdwu8q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4A917C98C;
	Mon, 19 Aug 2024 16:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724083459; cv=none; b=P4xBazNuhpxutc/VxQmSze5EYyaYVAOJoLF9prNZG2EUx2HFBf1hLByAlPHu+WxBsl8gtBKm8hOn3UcgqGOPPwR3+Z8Q3VbCqQCdAu6FjhNM1ZN3sO3edsDxwTlDCWJWl+Xmj/XiAlQMk/MlWyzrH/8T+YtJMBufwU45g6IZwVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724083459; c=relaxed/simple;
	bh=Csihlk2vDZs70+nrzXlJHCOQudBO1ZCxtt99gI9gNEc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T5DgKH3aSQxSnd85A9U0fjZsmc7Jcg0OXibinFbRf3SLGmY70BrbnyMWMrY4+yCo5eS+JRYIHUSdV8cvu0Nz44iAGbHwxOeFkEzJqguusEkaQbeTmBk86luPuBpLwUvBL2zSAL9LJ92PjY+Lb8vyV3xsPIYryxzGGo7jgFfaiIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kkRdwu8q; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JD6xWL019063;
	Mon, 19 Aug 2024 16:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=corp-2023-11-20; bh=3
	bnHuno5/U3qhB7809Tn0t9u8YGb5A9kVmLS19g7oZ0=; b=kkRdwu8qooKwhvRcJ
	EQmC791NkOIPKTP2DAZnOtglip/TusA8giF6He4kGsppQnXCpdINQZG1xcRY977o
	CX09qllYC6uRUPX939H+hT6WyLQBWvYPd5wDnyZMcI8r67py+TJNI8OnkW0mVEj7
	tMLkLBuIdaHYgtGNpPFp4hTApPGOKrHExkSaBxZdqbQgUf0ReqUSh9olMM6evxKh
	UFkmVrhEfJuX7c4JC+nMYuqBAY4Xnh0PBT34yajfhkMqtIAENbst7TM/FDOZFYju
	RMBuASLTnPl31DgBLfQXP/+D28takuPhUTVoMsxWujKRPHV8xF7qlq2YpGhBixss
	fHimg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m3hjxsu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Aug 2024 16:03:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47JEbHTv007813;
	Mon, 19 Aug 2024 16:03:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 413h3pba63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Aug 2024 16:03:52 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 47JG3Fed014254;
	Mon, 19 Aug 2024 16:03:51 GMT
Received: from localhost.localdomain (dhcp-10-175-39-147.vpn.oracle.com [10.175.39.147])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 413h3pb9w5-2;
	Mon, 19 Aug 2024 16:03:51 +0000
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
Subject: [RFC PATCH 01/11] kbuild: ignore .config rule for make --always-make
Date: Mon, 19 Aug 2024 18:02:58 +0200
Message-Id: <20240819160309.2218114-2-vegard.nossum@oracle.com>
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
X-Proofpoint-ORIG-GUID: 1_NWZdCAXjfwFV1hUeX64qkrZUNXouYh
X-Proofpoint-GUID: 1_NWZdCAXjfwFV1hUeX64qkrZUNXouYh

Before this patch, using 'make --always-make' would always result in the
error message about the missing .config being displayed.

Detect the -B/--always-make flag and leave this rule out, which allows the
rest of the build to proceed. See [1] for an explanation of this particular
construction.

[1]: https://www.gnu.org/software/make/manual/make.html#Testing-Flags

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Makefile b/Makefile
index 44c02a6f60a14..f09c036daf2f5 100644
--- a/Makefile
+++ b/Makefile
@@ -757,6 +757,10 @@ ifdef may-sync-config
 # because some architectures define CROSS_COMPILE there.
 include include/config/auto.conf.cmd
 
+ifeq (,$(findstring B,$(firstword -$(MAKEFLAGS))))
+# This is a dummy target, only meant as a help for the user invoking make.
+# We don't want it to take effect when running 'make --always-make', since
+# that renders the --always-make option effectively useless.
 $(KCONFIG_CONFIG):
 	@echo >&2 '***'
 	@echo >&2 '*** Configuration file "$@" not found!'
@@ -765,6 +769,7 @@ $(KCONFIG_CONFIG):
 	@echo >&2 '*** "make menuconfig" or "make xconfig").'
 	@echo >&2 '***'
 	@/bin/false
+endif
 
 # The actual configuration files used during the build are stored in
 # include/generated/ and include/config/. Update them if .config is newer than
-- 
2.34.1


