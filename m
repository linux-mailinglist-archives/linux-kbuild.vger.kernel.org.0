Return-Path: <linux-kbuild+bounces-11085-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLtROpifiWlU/wQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11085-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Feb 2026 09:49:28 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0E710D308
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Feb 2026 09:49:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BD25C30058E6
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Feb 2026 08:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEECB32573A;
	Mon,  9 Feb 2026 08:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="qWztqHfi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA73C3242C8;
	Mon,  9 Feb 2026 08:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770626966; cv=none; b=bov6ijNytX7G6/WtY+XPy8jKFCn4RpGpu6DzVb9To1kGeG7KTerBlytnG8tU9pYnfDoWBWWD7yjZm6bII5VfWM1jc6eKPr3j1cE6wnlL4V+OmHmifDJUtzsmoKhrEfFAyUaW+xb+weXPyKKLZo1RVTI6oJGlHxNmCEqBuC7QXcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770626966; c=relaxed/simple;
	bh=b33lM7g4Mtd91TjJ9IVGi+uv5ciyNzrA4fTzxhiPqrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l/LlG/tkv0SbPs2d4NA5wjbdbZqTf2s+gKPHli2t0kbMUoFQ+b3hcEUYMmX/0ypzGKOPut7mKKcPCMyA3BqG4vyrGil9YvE37wRpULeXQgRWwn984HtG7EYIF9AXkDHHevxd3kvTdBFJjBrim/ZS6f/Qyy0sRljmPC4ov9dSSfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=qWztqHfi; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6191c5ap693544;
	Mon, 9 Feb 2026 08:49:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=6pTFAo/qNgU6OYUJN
	OjZ00Qdyl2NOyAzAlaEd2uhLNU=; b=qWztqHfiEpwpI4HhhBtIrDr9C4e4Xgl4V
	fdZ9VoSH4f0dvsgwDRqrWOvwxMgawnbPoMCl1p1jW7hl+GXF/dfTGssF6pb0e+xW
	QmYk7I3xL7pPR1VUkQotJYBa+uFzfIga3iuYFZv+wbSsS8v3r8G8D9T5i0OrEw++
	iSi/vviq1naoLblYvlbOVcxIQB4Y3ODadmp3/bNELFgBLVFOXSAQzjrE2oyQBRfL
	sfCCN+ymmPzWaM6wOtGGBYJVGD+jUAwAUJA+BiYfaZvbmBeBK82oaSLJHO0iurwY
	9bDbHbfVX8Ck7KHA8ur/oY38XgoVOLc4AWdrg8oi1mHLVfhp+1Now==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c696vx67m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Feb 2026 08:49:08 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6194I9X6019336;
	Mon, 9 Feb 2026 08:49:07 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4c6hxjv84b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Feb 2026 08:49:07 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6198n39Q53543224
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Feb 2026 08:49:03 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7634D20040;
	Mon,  9 Feb 2026 08:49:03 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B48A22004D;
	Mon,  9 Feb 2026 08:48:59 +0000 (GMT)
Received: from li-2fa77bcc-2701-11b2-a85c-cd621c23b6bd.in.ibm.com (unknown [9.79.195.233])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Feb 2026 08:48:59 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: nathan@kernel.org, masahiroy@kernel.org, kees@kernel.org,
        naveen@kernel.org, jpoimboe@kernel.org, peterz@infradead.org,
        npiggin@gmail.com, maddy@linux.ibm.com, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu, mingo@kernel.org, mpe@ellerman.id.au,
        sv@linux.ibm.com, nsc@kernel.org
Subject: [RFC PATCH v3 4/6] objtool/powerpc: Skip jump destination analysis and unnanotated intra-function call warnings for --ftr-fixup
Date: Mon,  9 Feb 2026 14:18:18 +0530
Message-ID: <20260209084820.57298-5-sv@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=YeCwJgRf c=1 sm=1 tr=0 ts=69899f84 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VnNF1IyMAAAA:8 a=8-sZ6GPjQPUUxCpKAYwA:9
X-Proofpoint-GUID: qDkfc-DJNCXacmFDikyxmhcNuGda5RJQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA3MiBTYWx0ZWRfX+Ld5l8kAw2q7
 7eUbqIrsR7xEkqth1IaLV4St1LEvU4oZQY7P3puTEAJUrxEsm5TbXzxcF7NJWN2rKsBLyeq+B0R
 1TW9aiAkkXUfspi9BNa8UQTPSpvwSZ1qMgj+bxfyYWzosqHKnGXhaRllDGsWsmGPy0hTcMWn0kD
 OMsJsaGSG7E306m/OPY2/wf37N2n2mZVuHX/W4g3WG3o88Nzq2Q0Q578iRSJPfEal5IjeEGP+So
 WTugZr9Kz3QHYiAeheCOaWn6Zpwt3cIhitEPcIffMgH9wy7/Sl0a4WBZt4nFev8qnlUbLZphDkP
 /zEQquIVSRwkKkOwshRCRDUu0oBkP/URk7Ww+dKot5wHD1a9y2MWpFqlxcBXQqnI0uHL79/gny0
 Cuwl7CY6fX0E8bCHbUO0YwzUxdxEqQO0j6Txvm67YG8F0q4SLs0s05myS8rIi+9VQZ83g+rIz2U
 7ysMbEiPKgfKe2i3zQg==
X-Proofpoint-ORIG-GUID: hlklK367W2znF8mxiCFFgnhIl6K75Mtr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090072
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11085-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,infradead.org,gmail.com,linux.ibm.com,kernel.crashing.org,csgroup.eu,ellerman.id.au];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[sv@linux.ibm.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[ibm.com:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 7C0E710D308
X-Rspamd-Action: no action

Objtool is throwing unannotated intra-function call warnings
when run on vmlinux with --ftr-fixup option.

One such example:

vmlinux: warning: objtool: .text+0x3d94:
                        unannotated intra-function call

.text + 0x3d94 = c000000000008000 + 3d94 = c0000000000081d4

c0000000000081d4: 45 24 02 48  bl c00000000002a618
<system_reset_exception+0x8>

c00000000002a610 <system_reset_exception>:
c00000000002a610:       0e 01 4c 3c     addis   r2,r12,270
                        c00000000002a610: R_PPC64_REL16_HA    .TOC.
c00000000002a614:       f0 6c 42 38     addi    r2,r2,27888
                        c00000000002a614: R_PPC64_REL16_LO    .TOC.+0x4
c00000000002a618:       a6 02 08 7c     mflr    r0

This is happening because we should be looking for destination
symbols that are at absolute offsets instead of relative offsets.
After fixing dest_off to point to absolute offset, there are still
a lot of these warnings shown.

In the above example, objtool is computing the destination
offset to be c00000000002a618, which points to a completely
different instruction. find_call_destination() is looking for this
offset and failing. Instead, we should be looking for destination
offset c00000000002a610 which points to system_reset_exception
function.

Even after fixing the way destination offset is computed, and
after looking for dest_off - 0x8 in cases where the original offset
is not found, there are still a lot of unannotated intra-function
call warnings generated. This is due to symbols that are not
properly annotated.

So, for now, as a hack to curb these warnings, do not emit
unannotated intra-function call warnings when objtool is run
with --ftr-fixup option.

Skip add_jump_destinations() and suppress intra-function call
errors in --ftr-fixup mode. The feature fixup pass only needs fixup
entry tables, relocation entries from .__ftr_alternates.text, and
elf_write_insn() to patch branch offsets.

Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 tools/objtool/check.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 92fe5dc05cdb..9c6b892792a4 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1598,7 +1598,6 @@ static int add_jump_destinations(struct objtool_file *file)
 			    dest_off == func->offset + func->len)
 				continue;
 
-
 			ERROR_INSN(insn, "can't find jump dest instruction at %s",
 				offstr(dest_sec, dest_off));
 			return -1;
@@ -1680,7 +1679,7 @@ static int add_call_destinations(struct objtool_file *file)
 			if (func && func->ignore)
 				continue;
 
-			if (!insn_call_dest(insn)) {
+			if (!insn_call_dest(insn) && !opts.ftr_fixup) {
 				ERROR_INSN(insn, "unannotated intra-function call");
 				return -1;
 			}
@@ -2636,8 +2635,10 @@ static int decode_sections(struct objtool_file *file)
 			return -1;
 	}
 
-	if (add_jump_destinations(file))
-		return -1;
+	if (!opts.ftr_fixup) {
+		if (add_jump_destinations(file))
+			return -1;
+	}
 
 	/*
 	 * Must be before add_call_destination(); it changes INSN_CALL to
-- 
2.43.0


