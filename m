Return-Path: <linux-kbuild+bounces-12346-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIRhOBQXyml85AUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12346-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 08:24:20 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C960355E2B
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 08:24:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9BEB3014C00
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2026 06:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D9A385525;
	Mon, 30 Mar 2026 06:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Tf9hSzZM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CF437D135;
	Mon, 30 Mar 2026 06:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774851750; cv=none; b=cVc2OKtGEfmUcESQLZF/TxbKftgcWPNUlOi9h8/lu7t+aUPK22b3/jNXb50J+STWnTzIUNVWxRkPfKfErP04yESWLUVjzDS4l0By8FPemSN3dJVoxZ2rTn7UgFu+LD3bnwMF697/U6hzvKxQ6/ynZGYAv9tE+0aw3bSEL595law=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774851750; c=relaxed/simple;
	bh=8C/JlBssnPIHqBYAS088QRKh1K8s4c7tmSxa8YXiuUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jOAU6rUDmWRDVJfaGtcmVaTnRXCsogWQXll2PTCyZgMsf9o0ZuTDwR92w3lR6mWguROW/fUBJ293b0U34TJILCK/gbfAkrhr3LUSydZjTERBJkv30OxL1zG8vAcvcCMb3XeDzSEgDNQFIkDeKIimlOHCfSl5rAn37xXiQepGL8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Tf9hSzZM; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62T4WrVF2411380;
	Mon, 30 Mar 2026 06:22:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=AysGbeP2sl0w5KLqpo1+5bdxDIFqyUGWAcoJQ4pVI
	ew=; b=Tf9hSzZMSLNo/WTQQQSqTbgjGY64tPoDDJv2Tz+8V+wtBaYXw3BIZmaid
	mMQi2Yi4NDX2ic7bO9NXhdJ9Fu7haYThE5RqcVrg5HW7zLOQq/6QTjVSNHgk9W8B
	15Kf0yxXYirrqjZdmyEj0y7O8+rOjPoQ118ZOCN7V5hpoqk6V++Cq/OOw14cUPYE
	V0oIWnTDEECoF5jEUWgKsGQGy/a/hoWcWD3b5+rucMJxzpoIOhKiO60Jb4ra5vmp
	1ATzLAUcExyXy8PqPu1PBuHJxXHEuoW0z93iMa/Air2VWSJdkqgI2U9OpOSoFtN3
	dX313zQUJUsaesbh+5TYTI+jAUHDA==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4d64dgdcht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Mar 2026 06:22:20 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 62U4uV6O005980;
	Mon, 30 Mar 2026 06:22:20 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4d6spxurg3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Mar 2026 06:22:20 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 62U6MGvl52298164
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Mar 2026 06:22:16 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1AFBD2004B;
	Mon, 30 Mar 2026 06:22:16 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 02BE520040;
	Mon, 30 Mar 2026 06:22:12 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.240.154])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 30 Mar 2026 06:22:11 +0000 (GMT)
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com, ritesh.list@gmail.com, arnd@arndb.de,
        chleroy@kernel.org, Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [PATCH v3] char: nvram: Remove unused nvram_mutex to fix -Wunused-variable warning
Date: Mon, 30 Mar 2026 11:52:01 +0530
Message-ID: <20260330062201.2581-1-venkat88@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA0NyBTYWx0ZWRfXz03hlpfJFT+Q
 +rtWUBtKOGIsIXnRC8DQJAO3aYwinSuHxDZKObux4gZHz2JI/c/vFJ2L5Th8k7D9XCZaV0okkkq
 cJucyMs0bP0n017r/E8a4q4hZr0hZlymqxm4k0Sps7l/P6xTKqggc0ubkzHLOcr05sJcY6+VCEG
 mDFOpkyI5YsJFzIRmuakblooyrls95SBjEtRs79VhvFIa3wtaRjP7Zk5HUoOyZVAiWYf2ZJsHtI
 mPwyYtPs2Qqo08EYGQenveIGknVs2c/eqaIzDW4N6Nwqb68OxHQl4k4F2IXbrrGIowRjc9ooCZf
 8mPoC6xa2K9eef7WBUiq/SSqCbQiydwRUNPICsvSx/XUZ+BEdFb+r/klonufnEu9WjDvT8flPlM
 h1tReDm7/F9e5BHhJljtbusfQyo4QYyXJHgXYeyHTi9550MpOv4sipA2JHuPTSNdiX1Cw6EJDzh
 GUBYLXhLXIg+Ku43YoA==
X-Authority-Analysis: v=2.4 cv=QKZlhwLL c=1 sm=1 tr=0 ts=69ca169d cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8
 a=1sboiQz5TgUy5XRvxJ4A:9 a=zZCYzV9kfG8A:10
X-Proofpoint-GUID: 9LAJ6FKGBqwJequDGSOWCXIM5UGnFKiJ
X-Proofpoint-ORIG-GUID: 58y5gv5o_vxrupyRU_j4CNgRxrQmzl4z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300047
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12346-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.ibm.com:mid,arndb.de:email];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 4C960355E2B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

drivers/char/nvram.c defines a static mutex 'nvram_mutex' which is never
used. This results in a compiler warning on linux-next builds:

  warning: 'nvram_mutex' defined but not used [-Wunused-variable]

Remove the unused definition to avoid the warning.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Suggested-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Signed-off-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
---
v3:
 - Removed global nvram_mutex entirely

 drivers/char/nvram.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/char/nvram.c b/drivers/char/nvram.c
index 9eff426a9286..9ab2744cd375 100644
--- a/drivers/char/nvram.c
+++ b/drivers/char/nvram.c
@@ -53,7 +53,6 @@
 #include <asm/nvram.h>
 #endif
 
-static DEFINE_MUTEX(nvram_mutex);
 static DEFINE_SPINLOCK(nvram_state_lock);
 static int nvram_open_cnt;	/* #times opened */
 static int nvram_open_mode;	/* special open modes */
-- 
2.45.2


