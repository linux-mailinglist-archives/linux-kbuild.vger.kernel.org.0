Return-Path: <linux-kbuild+bounces-12144-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHLZML7swGm3OgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12144-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 08:33:18 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A222EDA35
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 08:33:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B84903001CEF
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 07:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFDAE32E6BB;
	Mon, 23 Mar 2026 07:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="qF/uGaWz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A8A2BEC5E;
	Mon, 23 Mar 2026 07:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774251192; cv=none; b=JLq911SrANMOTATtY5fGhJOR5dDufFKvtkByaUYZAjgSCPcd3VqFtsA0HlkluaH0+c3BE9Fj+P/mDlQU2NDVhHrgUnYhUd25B2+/b0ko6JeXXoZtaUBsSQyazKulRR3jqXmtKxt/oaVwAC7p8aoqk3I32F+dlqmZ0Ih/rTKJgB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774251192; c=relaxed/simple;
	bh=bymp9ansitZs0cSH047hHf2zglpHIZbjfjMP4VbM7GE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P28PrffRVi/NTYqDaxNjF0iphjOMs7YMFKfTQSkRzNZYavxhbYoCKM9sd0tG+sPmrWf1bQ3+MZioQsErziY8Ys0heW80Vj/P2dZbP3fedWuoWFOKiubC4+zB3wdqYcRmRBIF2hjEbr4L5REztdDTYrecV9vUw2hj6C2PAZfGvYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=qF/uGaWz; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N3sDxX1172616;
	Mon, 23 Mar 2026 07:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=WfVpPGGWsHftmhPb50FUkrCa4gEla1qqQOvZBu1AJ
	qE=; b=qF/uGaWzAnPiPGSCX/aST6ih9w5IuMwbJBje3Dr+KCV/EfLTrmZwAkzYB
	HIMQiauWajVMeQxSUB7oIaLLX+nlpLTN/9EGj6I5iUnISkmHlHTzED0SuEPj21lV
	DnjpukZvrddqw3J0XwK4MlVCHK/hPG7GioHeDlDoFd+IrC85RYglFiBmI5flOcnG
	98/y6t2dk7cxemMeBAPs0qmv+ZLRpR98mr69DhRmh70UFL3O26/etPbh/XrIjn4k
	gkKSLKutaEB/jexbWYnAcQgaSTLsgCIObkYCREPnCKST8xQjud2pbI135gGHZXCs
	JaDJLVlMA0whygwNPMeuNd6NYnMsQ==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4d1kumdjup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 07:32:45 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 62N6YN06031631;
	Mon, 23 Mar 2026 07:32:44 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4d25nsmjty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 07:32:44 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 62N7WeQk44695994
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Mar 2026 07:32:40 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A13072004B;
	Mon, 23 Mar 2026 07:32:40 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B0EC620043;
	Mon, 23 Mar 2026 07:32:28 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.247.60])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 23 Mar 2026 07:32:28 +0000 (GMT)
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
To: arnd@arndb.de, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, nathan@kernel.org, nsc@kernel.org,
        ojeda@kernel.org, masahiroy@kernel.org, linux@weissschuh.net,
        tamird@kernel.org, rostedt@goodmis.org, ihor.solodrai@linux.dev,
        ritesh.list@gmail.com, maddy@linux.ibm.com, peterz@infradead.org,
        venkat88@linux.ibm.com
Subject: [PATCH v2] char: nvram: Remove unused nvram_mutex to fix -Wunused-variable warning
Date: Mon, 23 Mar 2026 13:02:20 +0530
Message-ID: <20260323073220.25798-1-venkat88@linux.ibm.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: Hi2CISShH6Iof_oH2JKOO9ktaPYasrmG
X-Proofpoint-ORIG-GUID: FbRJ3Hh_YJSdw1yG-6PJ7kD244G9CCmD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA1NCBTYWx0ZWRfX4tUm5R23TsI3
 kwNO6SpVXON7P1fnxwk/co3t7UJbBNXIv/5TGh1eSUP6qV9ZvmeMSuG9JJd5ySz+iYyMX6H5VBp
 +5suiYCNsozogEBQES6dxrNweNcQU6DUD0uBYOvTUpuTqlH57HtTSBUvQxiijmnaihad5819/HB
 UX3FVo/M/a3FHprIqxgZCA21K4nMrVa8m/6xnPJV8jOwz6mLlnboGUnL6oFu9RTLwtCn+zYHKlg
 AupZBFCkEz8LV00+a5spVIKP+LRrT6YRFC+RnXaAg8SNlXVuO14OJ4RJiUaPj0L5OZGUMLWtV9l
 nLDyeGErpzkeBUo7exo/pJUn93144I8NEs6hMmk1bekiLxJAboJNZ0nBLrItkvD0M0+nyAQpsIr
 okAUO6XxcpSvZFTtlWRBAatiwiutfCT770bJKPRI4efYuukXJ3Ctv1WLYSvvco3isbbqaNTUFxm
 uFy+/MIkDqPd37p3BQg==
X-Authority-Analysis: v=2.4 cv=KbXfcAYD c=1 sm=1 tr=0 ts=69c0ec9d cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8
 a=HSj1x6wVMASIhtUHg4AA:9 a=zZCYzV9kfG8A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230054
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12144-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,kernel.org,weissschuh.net,goodmis.org,linux.dev,gmail.com,linux.ibm.com,infradead.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[17];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[venkat88@linux.ibm.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: C9A222EDA35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

v2:
  - Added missing Suggested-by tag from Ritesh Harjani (IBM)

drivers/char/nvram.c defines a static mutex 'nvram_mutex' which is never
used. This results in a compiler warning on linux-next builds:

  warning: 'nvram_mutex' defined but not used [-Wunused-variable]

Remove the unused definition to avoid the warning.

Suggested-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Signed-off-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
---
 drivers/char/nvram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/nvram.c b/drivers/char/nvram.c
index 9eff426a9286..2ce3307663ed 100644
--- a/drivers/char/nvram.c
+++ b/drivers/char/nvram.c
@@ -53,7 +53,7 @@
 #include <asm/nvram.h>
 #endif
 
-static DEFINE_MUTEX(nvram_mutex);
+static __maybe_unused DEFINE_MUTEX(nvram_mutex);
 static DEFINE_SPINLOCK(nvram_state_lock);
 static int nvram_open_cnt;	/* #times opened */
 static int nvram_open_mode;	/* special open modes */
-- 
2.45.2


