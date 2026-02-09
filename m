Return-Path: <linux-kbuild+bounces-11084-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NoxLcifiWlU/wQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11084-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Feb 2026 09:50:16 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9B010D369
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Feb 2026 09:50:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3EA703027B43
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Feb 2026 08:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98B1325721;
	Mon,  9 Feb 2026 08:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="pMUhXotN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A187E32571F;
	Mon,  9 Feb 2026 08:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770626965; cv=none; b=n8IoFKUho0Y5wZ7v+Gsu2dtdOblIRk/3KKNH7BuIPWoa+52ptETu0HVMMY1fORxD0OCCHuHKP3MJsayelLYgzfSCBoWC2Gyr7bHXgXBoDybt9XaqRcv+zWJduDrjn10RL8K9Gz+3KoWu+Bb06hHdjjWQ75ydQz13y7feuVYWaFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770626965; c=relaxed/simple;
	bh=Gj1a9EyQR16Fric/kz+4z6lDEBgbAmqodcIhTi7k+EE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l5QTQdNKlUHJ/hqizJmuPNTd/nnnnfsUMWp6cFar9OGijDYGEZw41aolzTLGIRFTe5nG/HlYfz80De1d9m5jWeSvGWeoUUz1mHJYR8srAhthaLY1bIQLS/Ah/Ncc5KCN1mW1VwBBWcKRmZudFSrlg3CxvsPvumPiHFDsP7Ri9c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=pMUhXotN; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 618BvvYF3433326;
	Mon, 9 Feb 2026 08:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Vx7hbLDugiI3L3ECk
	ZfvUG8sfxKhjD8t7xBTjwQ9vfA=; b=pMUhXotNE6QWIuJicnNQcIKepYc3H2K5n
	7wD2OZ/mEVRO56fkHFgL5oLYfFWGpd7y4VZOiJSS5xcjFg7AJ2XDGB9PTBo06Juj
	eis9Towvz9T0GDCobTHLVGYpmuBw2CfU8VQYBe83Axf93Thaf/uU+Ypde7XBmq5X
	nwwd89B9rECFVTkqOeSv0O4Z9wpkws9bG9uI75aZzHYdITxp9hZNebL0LjxBkT0z
	gr2kWFUtdqMXWqMS3A7RZVoZ32P7li9Ky1D74X9+p9I2eI9dEEOPt9CPCqkyINkz
	JKrDEwY6kWnfHu/iHomDbPZy+DM3vuomIe/O6zAG2uhY51F+jbr7g==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c696uvye4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Feb 2026 08:48:59 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6197N6Lo002575;
	Mon, 9 Feb 2026 08:48:58 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4c6fqsckyy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Feb 2026 08:48:58 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6198msjm50266568
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Feb 2026 08:48:54 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 02CDA2004E;
	Mon,  9 Feb 2026 08:48:54 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 449532004D;
	Mon,  9 Feb 2026 08:48:50 +0000 (GMT)
Received: from li-2fa77bcc-2701-11b2-a85c-cd621c23b6bd.in.ibm.com (unknown [9.79.195.233])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Feb 2026 08:48:50 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: nathan@kernel.org, masahiroy@kernel.org, kees@kernel.org,
        naveen@kernel.org, jpoimboe@kernel.org, peterz@infradead.org,
        npiggin@gmail.com, maddy@linux.ibm.com, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu, mingo@kernel.org, mpe@ellerman.id.au,
        sv@linux.ibm.com, nsc@kernel.org
Subject: [RFC PATCH v3 2/6] objtool: Set ELF_F_LAYOUT flag to preserve vmlinux segment layout
Date: Mon,  9 Feb 2026 14:18:16 +0530
Message-ID: <20260209084820.57298-3-sv@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260209084820.57298-1-sv@linux.ibm.com>
References: <20260209084820.57298-1-sv@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: Mf87jfHInFbk69MapXEC8CeS9cKIVSeh
X-Proofpoint-ORIG-GUID: -apIo1t-HJUBbk6XG9wBOjLD7VpqBG94
X-Authority-Analysis: v=2.4 cv=JdWxbEKV c=1 sm=1 tr=0 ts=69899f7b cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VnNF1IyMAAAA:8 a=dGyo4u3eiptz4-Zsc8UA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA3MiBTYWx0ZWRfX/knWIYESMxKs
 0bei1RzS8Bs2yVrwie3PjynjnciDD49G0Hw5Pt1tZWp4WY7hWYwZRKHGetdR/NsLBmnL7rsjbnj
 KTM+N+R2ZZ06/Vl/CLlXtAzWmkpqj+dtil7dpdYMKVk7z1DM6tm/p2AbLnVemc2pS2xv65rn45h
 9yrsHNpuhQ6jxa1NVo4t+zyIt8grbiwR1CXVSz7NeSMgKS1+MheCY57rkoClZzHeJ7FGF7iCG8r
 3fwTxrqfy0h5nTxZCjY8tyh9X9c/idCS4LVUW/l9VHpISBVNx5eVISjxR7rYLV4kQZLg+R/SIE/
 zCc8Nd5VVEYmS4gaQirv1zh+oZ5h81TNXwmT8cy78R/pHsg1yoFW7PdKbKWKEj6JU9hxVMUVSFU
 EsUQ3ho/wMnGR92QgQFgRY59p/8xvtq7BkDwXS52tDfM8jwgs0VzknJ4/JpH7iCg89Ijevc0XSS
 5uJaprYpErs+5N6eb0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090072
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11084-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,infradead.org,gmail.com,linux.ibm.com,kernel.crashing.org,csgroup.eu,ellerman.id.au];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_NEQ_ENVFROM(0.00)[sv@linux.ibm.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 5F9B010D369
X-Rspamd-Action: no action

When objtool writes changes back to vmlinux with --ftr-fixup --link,
libelf recalculates the file layout and inserts padding between
sections. This corrupts the ELF segment structure, causing kexec to
fail with:

    ELF Note corrupted !
    Cannot determine the file type of vmlinux

This happens because libelf's default behavior assumes it can freely
rearrange section offsets when writing, which breaks the carefully
constructed vmlinux layout produced by the linker.

Set ELF_F_LAYOUT after elf_begin() to instruct libelf that the
application is responsible for the file layout. This prevents libelf
from inserting padding or repositioning sections while still allowing
data modifications to be written back.

Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 tools/objtool/elf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index 94370a470cbb..f7c6fd68ffcb 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -1159,6 +1159,9 @@ struct elf *elf_open_read(const char *name, int flags)
 
 	elf->elf = elf_begin(elf->fd, cmd, NULL);
 
+	if (opts.ftr_fixup)
+		elf_flagelf(elf->elf, ELF_C_SET, ELF_F_LAYOUT);
+
 	if (!elf->elf) {
 		ERROR_ELF("elf_begin");
 		goto err;
-- 
2.43.0


