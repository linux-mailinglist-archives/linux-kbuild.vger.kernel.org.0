Return-Path: <linux-kbuild+bounces-12350-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMrNCwlTymkQ7wUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12350-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 12:40:09 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE3235986F
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 12:40:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5ADE33055C7A
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 10:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B7402FFFB5;
	Mon, 30 Mar 2026 10:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="EhK3R7eZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435F33B893B;
	Mon, 30 Mar 2026 10:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774866954; cv=none; b=AcG1cnit1P373yYxdz3GIziNAu5Y4MRsF0wLPs4VU8OErt+FU8lh2xRu3HXtAcuaPfOHzacKck1dU+yLE2KEkdd7+AL4RLjMrRlgDFoDEJuW1rxAL+8W24rkwKJsdZHc3TPHvEzHEDap0epP9jhz4jZRtypXgbYosNH+F4/06Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774866954; c=relaxed/simple;
	bh=nUJAIbhezvoxy9Tuf8u5aCxM0xGCCRKbLK2EFJ+X9gc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qsgdpC5mS7boPlXIFA+/8HnsHna8X3nLNQ1J82rI0X/2/qcKCk7mY5kgndjQkXSmzp3Dz4R4Vk5SdZXT28O0HSPcg5N2hQGkQ72XSNqr5+klueGdjOWnZjLri1ofkdySyHXVa89K5e8lbiwa5eDOoAwmq5xFyrxj40Dud0HIYao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=EhK3R7eZ; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TBTtd03183710;
	Mon, 30 Mar 2026 10:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=g7LjrMcOFJhmbQyG0g2szpe8vCVmFprox9SdpnjCY
	Jc=; b=EhK3R7eZpd7WKExKloWHbUW6Fb/okwWZ7eoMjjoH09QwNwg3uHyPvH0kr
	ojcSraNm728d0mj6HM10FZIvhuBMgaak2AM73qN9SLIoD6L4a/Wk5frQj/lPeMrf
	OLcVMhLIRTi9XNnH28RMWYmyvdBA1XG5hZCAwgjQVhMznzZqnQ9L2do8BCKyvPvr
	yIPuZkjDWuziu8TElNthFNYUAvPIRuS+AgLPyRc35SfrNTum6hOPEZ0LgqnmDf6O
	7nNibmS3tMLfYPfTMgvHZfRG5z8ySV6Jqt76TAA6Mj7Uel1h835dw3O6ZRo4c5/K
	qARbW73p6vd9UN17Ljn4DmcnWMrOg==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4d64dge7x4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Mar 2026 10:35:44 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 62U9GjVZ021659;
	Mon, 30 Mar 2026 10:35:44 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4d6sasckyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Mar 2026 10:35:43 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 62UAZdcK50856344
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Mar 2026 10:35:40 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D553420040;
	Mon, 30 Mar 2026 10:35:39 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 04BC02004B;
	Mon, 30 Mar 2026 10:35:36 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.240.154])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 30 Mar 2026 10:35:35 +0000 (GMT)
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com, ritesh.list@gmail.com, arnd@arndb.de,
        Christophe Leroy <chleroy@kernel.org>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [PATCH v4] char/nvram: Remove redundant nvram_mutex
Date: Mon, 30 Mar 2026 16:05:30 +0530
Message-ID: <20260330103530.6873-1-venkat88@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA4MSBTYWx0ZWRfX9JIJMdW2o6GH
 pzstJj+QDYgDWTsETnZomNNrvtDWJXMfBD6my966xLp2kP8HEC/G5C+RMoerFDY9JU/XH06blqj
 U3wfikQaEy9qgJKDNOf7IotUwF5XLExbhZO12JKOQg2qkoEsf1x3BjQE9mz90qZXDzHmqAf612W
 KE8ez2o4GEDwm91pPBQo8FcvTsKAnAKNny4EGaWqvjKRUp7Vh41lCMVjyMbU3Mykz3FHOCJEdxv
 sEyOQEOYC86Mki6bAKAbBLy0ns6U3RF1AjkDYLaUF+w8dK64VK/kadeoRZiYUHk79YIuhiKSf54
 TeqCGOmrQIdYnmkYxji28tm2fo7DxB8t8MOLW0AQRW1HFJjkdmEVbB4QSzCko8Xt0DB/+QOp8/A
 Ek9e38oP//bPNZT8s6ryRY4MN70yHSkb8YoUkeIGFLvVlRYVUPAfbSER/uby3L5DYN8n1E2rtQ7
 goWrahyXL7y589z82hw==
X-Authority-Analysis: v=2.4 cv=QKZlhwLL c=1 sm=1 tr=0 ts=69ca5201 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=WqWmceQO84Qbs2Y3kP8A:9
X-Proofpoint-GUID: F4pH8-8kn4_Oa0IGX-WCgFw8S3Vpm_Xv
X-Proofpoint-ORIG-GUID: gUMo_ErNOkLDBBaR8XOZhuLo8XNfq3zZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300081
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12350-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,linux.ibm.com,gmail.com,arndb.de,kernel.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[venkat88@linux.ibm.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.ibm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 7CE3235986F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The global nvram_mutex in drivers/char/nvram.c is redundant and unused,
and this triggers compiler warnings on some configurations.

All platform-specific nvram operations already provide their own internal
synchronization, meaning the wrapper-level mutex does not provide any
additional safety.

Remove the nvram_mutex definition along with all remaining lock/unlock
users across PPC32, x86, and m68k code paths, and rely entirely on the
per-architecture nvram implementations for locking.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
---
v4:
  - Remove all remaining nvram_mutex call sites, completing the mutex removal

v3:
  - Removed global nvram_mutex definition

 drivers/char/nvram.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/char/nvram.c b/drivers/char/nvram.c
index 9eff426a9286..e89cc1f1c89e 100644
--- a/drivers/char/nvram.c
+++ b/drivers/char/nvram.c
@@ -53,7 +53,6 @@
 #include <asm/nvram.h>
 #endif
 
-static DEFINE_MUTEX(nvram_mutex);
 static DEFINE_SPINLOCK(nvram_state_lock);
 static int nvram_open_cnt;	/* #times opened */
 static int nvram_open_mode;	/* special open modes */
@@ -310,11 +309,8 @@ static long nvram_misc_ioctl(struct file *file, unsigned int cmd,
 		break;
 #ifdef CONFIG_PPC32
 	case IOC_NVRAM_SYNC:
-		if (ppc_md.nvram_sync != NULL) {
-			mutex_lock(&nvram_mutex);
+		if (ppc_md.nvram_sync)
 			ppc_md.nvram_sync();
-			mutex_unlock(&nvram_mutex);
-		}
 		ret = 0;
 		break;
 #endif
@@ -324,11 +320,8 @@ static long nvram_misc_ioctl(struct file *file, unsigned int cmd,
 		if (!capable(CAP_SYS_ADMIN))
 			return -EACCES;
 
-		if (arch_nvram_ops.initialize != NULL) {
-			mutex_lock(&nvram_mutex);
+		if (arch_nvram_ops.initialize)
 			ret = arch_nvram_ops.initialize();
-			mutex_unlock(&nvram_mutex);
-		}
 		break;
 	case NVRAM_SETCKS:
 		/* just set checksum, contents unchanged (maybe useful after
@@ -336,11 +329,8 @@ static long nvram_misc_ioctl(struct file *file, unsigned int cmd,
 		if (!capable(CAP_SYS_ADMIN))
 			return -EACCES;
 
-		if (arch_nvram_ops.set_checksum != NULL) {
-			mutex_lock(&nvram_mutex);
+		if (arch_nvram_ops.set_checksum)
 			ret = arch_nvram_ops.set_checksum();
-			mutex_unlock(&nvram_mutex);
-		}
 		break;
 #endif /* CONFIG_X86 || CONFIG_M68K */
 	}
-- 
2.45.2


