Return-Path: <linux-kbuild+bounces-3092-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BC1956FC4
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 18:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1690B282990
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 16:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C652418757F;
	Mon, 19 Aug 2024 16:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="S7ZtxWIU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396B6184528;
	Mon, 19 Aug 2024 16:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724083481; cv=none; b=Ew3eRRY4mUiFM9aUf1GES6OJgqXL/QtrDHbKHOU5Kq6RqdyodytThKkK1IHds3aikvB3+PigcwufOxitTAiv1HzkWZPGT9Y+V67RfEoNQWbatPeFW6Olkg8fHDvCPMGZv8wlltmxZ7rqat4Nkp/+yVvvNVp8mesjZC7KFn6V5yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724083481; c=relaxed/simple;
	bh=d3elD88fZIEaKNWJwRokI50chu9Ry7OezwpNId9EsUQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t0nrbVn7BDT/Lv76xzG5GDshoLOS5ENjFROXc9+MJKUB8Kk19xo8nLW3Ck5EQJvhy0Qgi/Drm+v8QIpFu2vbvCWcnN4LkOokHz+oNqlHaauyeMfqodBt34XUQtWLn+Nt+R8i2HvjHgFnnaf95lGOHlMIvn6GIurd+ikNDrU0fLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=S7ZtxWIU; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JD6xab022423;
	Mon, 19 Aug 2024 16:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=corp-2023-11-20; bh=f
	wjNpatZXKEVUIxn1sL7/EqLVpS6bcnnOEWTBSsVVDc=; b=S7ZtxWIU/Mip+Q/mK
	2/H6p5tUEaGHb/ML2mubtoWfyXNAJ2xVkmNwNtMlzpQK3F5KvUfceZN5SGIJQ1Rw
	eU9Br5hbuITK6IIbx0NwXvVbVBaPOyQzNJcbo1MKuhvNQmG08DgY+UOElm9k4VOG
	RumiNGxnW70qDOgWTEotrhIUZlBC+r9L/TExNEzfEQSrdivgsHw4VdxTW6lMJAVQ
	TZDnxBiDceZHNHcXlt/a9KUg8KAYsz7Tc3ZKtDIpuFTiWw/mN2Eyi/0TYymicKsM
	VYbfrlrvjiQ4POD4aLIx3AAhlILYVyUkujqquwVf71YUhTN8uNnUn+Zx5y1NJyAk
	CV+QQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m3dk14g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Aug 2024 16:04:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47JEbHoS007842;
	Mon, 19 Aug 2024 16:04:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 413h3pbb0m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Aug 2024 16:04:15 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 47JG3Fep014254;
	Mon, 19 Aug 2024 16:04:15 GMT
Received: from localhost.localdomain (dhcp-10-175-39-147.vpn.oracle.com [10.175.39.147])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 413h3pb9w5-8;
	Mon, 19 Aug 2024 16:04:15 +0000
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
Subject: [RFC PATCH 07/11] kbuild: define 'make' as a no-op in --dry-run mode
Date: Mon, 19 Aug 2024 18:03:04 +0200
Message-Id: <20240819160309.2218114-8-vegard.nossum@oracle.com>
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
X-Proofpoint-ORIG-GUID: BaZ3RWBemoMov_g8Pk82EfAgUCAUb7n6
X-Proofpoint-GUID: BaZ3RWBemoMov_g8Pk82EfAgUCAUb7n6

Output 'make() { :; }' at the start of the script in order to make
all 'make' invocations in the resulting build script no-ops (GNU Make
will actually execute -- and print -- all recipe lines that include
$(MAKE), even when invoked with -n).

Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Makefile b/Makefile
index 953951157ec92..d08ade5791c2e 100644
--- a/Makefile
+++ b/Makefile
@@ -226,6 +226,12 @@ $(filter-out $(this-makefile), $(MAKECMDGOALS)) __all: __sub-make
 
 # Invoke a second make in the output directory, passing relevant variables
 __sub-make:
+ifdef dry_run
+	# define 'make' as a no-op alias so that those commands are not
+	# actually run
+	@make() { :; }
+	@export -f make
+endif
 	$(Q)$(MAKE) $(no-print-directory) -C $(abs_objtree) \
 	-f $(abs_srctree)/Makefile $(MAKECMDGOALS)
 
-- 
2.34.1


