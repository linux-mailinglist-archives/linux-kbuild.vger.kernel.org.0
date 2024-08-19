Return-Path: <linux-kbuild+bounces-3091-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F98956FD0
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 18:08:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD6F0B29D18
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 16:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 968B418133C;
	Mon, 19 Aug 2024 16:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jbdmjJlT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B17C16D4E1;
	Mon, 19 Aug 2024 16:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724083472; cv=none; b=sidTwlxsXka+ISMFH4vMcgtNgWp4aAafNNQ2gdSTZuZlWMS4OPrAH2r6uo+r7Tlb70CxGkgMIjoz5iqndRRhOTzz25cfmy1HHpvmOWDvLgSgDkGDJcuONnnMm5Ox+L/XukyZwOhmqa8jwHyuHk8rnQ3M3LovUydA90QxePuDAWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724083472; c=relaxed/simple;
	bh=Tq84KqCfctR+GEInmIwAfWnxRLjwEaKchRbUoOTRTnw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t9PNbhOyACBiV6EqCpNc/yJ2ar6lArxC3MoEfey3sb/2UAOwliPmi2ZjP/d1aCgOCDM1j4KeS3SYjzRpjf1eCdDz5nALY0FERQ7GqXOu/X4RV/51T0oMrhilcvf8TGNqcCjgQCkBZ6llJfWAaSHqvbudFFBkoUrSV8XB0SUWWw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jbdmjJlT; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JD6wBC004701;
	Mon, 19 Aug 2024 16:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=corp-2023-11-20; bh=/
	t9wxgjAaHurbMSjbjKpx20u+pH3Oh8bcX66OgQyT9I=; b=jbdmjJlTlJJGqQiOC
	Zo1rXgLeguCZRnJItvy4BqsJb9yDUUuC2K38hRRy3lZXb2GX+8Z6HHK1v0vuMPvV
	33uc85PqWXCfzM2T3e4e+NA24NeuncuI89zb4Xvbe67W7qSlyb5HyB7SWANI8y9c
	+SnF9HgsFaaKxAmB693hwJwruRWzMCgU6NemkODeo2qOyTZcrnZGyh8Vo0crcKGH
	pDzIO++0ghInl9k0AF74G0aP5g/9JFXULluruZIqbYq3aYsaSAjed1Q0anI+cXUw
	UE1XwpsuTe+UnPsdb3bCs+Qs3Mf90EaQBqwKROfLBPdQHr/eDJu+q9HYwXkN0Hd2
	SpvAA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m2daytf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Aug 2024 16:04:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47JEbHn4007848;
	Mon, 19 Aug 2024 16:04:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 413h3pbaw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Aug 2024 16:04:11 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 47JG3Fen014254;
	Mon, 19 Aug 2024 16:04:11 GMT
Received: from localhost.localdomain (dhcp-10-175-39-147.vpn.oracle.com [10.175.39.147])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 413h3pb9w5-7;
	Mon, 19 Aug 2024 16:04:10 +0000
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
Subject: [RFC PATCH 06/11] kbuild: set $dry_run when running in --dry-run mode
Date: Mon, 19 Aug 2024 18:03:03 +0200
Message-Id: <20240819160309.2218114-7-vegard.nossum@oracle.com>
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
X-Proofpoint-GUID: dNqzGx34NOYtguYcjNPHdRVE3Y_jqhLE
X-Proofpoint-ORIG-GUID: dNqzGx34NOYtguYcjNPHdRVE3Y_jqhLE

Add a convenience variable that allows us to use 'ifdef dry_run...endif'
in Makefiles or '[ -v dry_run ]' in shell scripts to test whether make
was invoked with '-n'.

See [1] for an explanation of this particular construction.

[1]: https://www.gnu.org/software/make/manual/make.html#Testing-Flags

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Makefile b/Makefile
index 58f3843ccfac6..953951157ec92 100644
--- a/Makefile
+++ b/Makefile
@@ -22,6 +22,11 @@ $(if $(filter __%, $(MAKECMDGOALS)), \
 PHONY := __all
 __all:
 
+# Was make invoked with --dry-run/-n? Record this in a convenience variable.
+ifeq (n,$(findstring n,$(firstword -$(MAKEFLAGS))))
+export dry_run := 1
+endif
+
 # We are using a recursive build, so we need to do a little thinking
 # to get the ordering right.
 #
-- 
2.34.1


