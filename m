Return-Path: <linux-kbuild+bounces-12143-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIQgHN3qwGl6OQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12143-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 08:25:17 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D85D2ED841
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 08:25:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 726C73001FEE
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 07:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 433E735F182;
	Mon, 23 Mar 2026 07:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="jx+o0ZDc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CF9217F33;
	Mon, 23 Mar 2026 07:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774250713; cv=none; b=KgY0LFxQBudY1HqxJhCKkuBHjcXSFMincoQ9phHDbKxRLMZNDlH/OlxqBkjrGYN3berPFhUZmLbhuEOCM5hJcH5KB7mrdA1FOdDIFzAAvi+RNSBgn0lnub1AIDaaRyomxdKJDgnmgJhqATUs9lEgE7UmwiTwaRj02xxe6Hjj1c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774250713; c=relaxed/simple;
	bh=jE7CXzjIhYsrMQZQTnyURMk/tHpDDdx8oW2yXMIAGfw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bI4vp4oZxxjIPauRU6cVKEDaZRZa1EmzUGOuti0DsPFTu3XOyVadF8ezFK2cs2kWPUum2/JCi5YSMIVamh3f41rvY+D4EO5A6I2/7DEolg3K1K76XgbxQfw8D6R4fVS/nCN8R38CK7AXhiOLgemhf1wAdybJYUUE6ZiG9qqZh6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=jx+o0ZDc; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MB0K4o3743898;
	Mon, 23 Mar 2026 07:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=jAO59f310du7QormdyuLxv3apotxnRlrU6xoEvAIX
	r8=; b=jx+o0ZDcFg1AlC9LpBRt9rF3So2ZwVvjFn73OdrJB7f4nfFGLX6SngQ7P
	E7B+NB+ytbBXaHjY1R1AMSuHkv7DcYEzLA2sUvZdf2y0OcxehirJE5/NUHDqySC7
	+vCaksidPvjqXELkHbj6ENVvcsaKc8amxwS2+V0wVbNhsvqsCxjTipqBVH8/s9s1
	Uu+YQ8GYY5CvnQAEU79omJJfPk7M5izU0zpZJ/wrooiZodJAHjjAda8pI/cyD+Ob
	3PupuwebZwM6HqN31QFCRyANQotk6z81UDV7AQENf/gcuJE8qDOdobPm4uTFOEA9
	6mFa332LxXX+cWz02gnURPr8YpPBw==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4d1kxq5swq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 07:24:41 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 62N7ItZr008749;
	Mon, 23 Mar 2026 07:24:40 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4d26nncdxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 07:24:40 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 62N7OawB22086016
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Mar 2026 07:24:36 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 43EE92004E;
	Mon, 23 Mar 2026 07:24:36 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A483020040;
	Mon, 23 Mar 2026 07:24:27 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.247.60])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 23 Mar 2026 07:24:27 +0000 (GMT)
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
To: arnd@arndb.de, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, nathan@kernel.org, nsc@kernel.org,
        ojeda@kernel.org, masahiroy@kernel.org, linux@weissschuh.net,
        tamird@kernel.org, rostedt@goodmis.org, ihor.solodrai@linux.dev,
        ritesh.list@gmail.com, maddy@linux.ibm.com, peterz@infradead.org,
        venkat88@linux.ibm.com
Subject: [PATCH] char: nvram: Remove unused nvram_mutex to fix -Wunused-variable warning
Date: Mon, 23 Mar 2026 12:54:22 +0530
Message-ID: <20260323072422.25730-1-venkat88@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: 7EOGw3xU-fF7FPWBWLwp8g_3yTZxUJat
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA1NCBTYWx0ZWRfXwtVcgvRfCMLi
 0BfkRj+clU+sJN9YBDTvMWimUa6YHaFe6EFWb1TLaTiD8xVd//sATAiUymq98oIQ9trSTp9gOk4
 4wy6Rvf1iFWRkP/p99VYKxKigHU5Rldc5K/nbq0JMDrxnw0/gDFQGGjYR9V5FeQ6RlZuK7X151s
 rOSkjuz4fiymmocmIamRm+QGnMUHpR+1J6ZC3b6/fPoEnoedEdM2uJ9iO3Wk51WQr4eBzuYKqfr
 e3ZV4SD9ud0gGpwjhH6HkHWYBjW+xnCP0VE7r74VIrrqB4PtZLRMSsQfoinj3e86xuo3BaAFtT7
 0WRFvgcKomKGFGk1lohR2XXEnmPfiCBB9/mo4iR586jY+bmMQcDToi+DP6NR4dnTr1K4UdanvbH
 XoSKmjlzG1AqKMBuqQ53yHlkb0686eoziIspB+ITz/5qB4xII2YDZgLjdZV29uEcvmJJARU/RwY
 GYAdZ6oZqAUna9zAYvg==
X-Authority-Analysis: v=2.4 cv=bLEb4f+Z c=1 sm=1 tr=0 ts=69c0eaba cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=HSj1x6wVMASIhtUHg4AA:9
 a=zZCYzV9kfG8A:10
X-Proofpoint-GUID: _M4EmJC2Qippd94GV-49dPGM0g5gFrUc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1011 phishscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230054
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12143-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,kernel.org,weissschuh.net,goodmis.org,linux.dev,gmail.com,linux.ibm.com,infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[venkat88@linux.ibm.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 0D85D2ED841
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

drivers/char/nvram.c defines a static mutex 'nvram_mutex' which is never
used. This results in a compiler warning on linux-next builds:

  warning: 'nvram_mutex' defined but not used [-Wunused-variable]

Remove the unused definition to avoid the warning.

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


