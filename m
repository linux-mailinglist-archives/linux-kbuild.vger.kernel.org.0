Return-Path: <linux-kbuild+bounces-11946-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAjGLfWit2lTTwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11946-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 07:28:05 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 290E02951E9
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 07:28:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4445304302F
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 06:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E93E34C128;
	Mon, 16 Mar 2026 06:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="TmtEBPrk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC0434B662;
	Mon, 16 Mar 2026 06:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773642375; cv=none; b=bTM2XoS1FJ7nRXOB7dpOAXbhx1BVFyuRYHXz6RIVG+49rF8o0ZTjT400RYCMW7gLTALF+nC6Ko65dkIVl531uUQtUMpkl2w3gEJEFeWEybwF7/6ksSYQrMH9i/wjCFnxPMfvG/Q9L43696EqJgb0V8A2EhUN1dCWsH4NjrnYqpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773642375; c=relaxed/simple;
	bh=/fzZCe9XpKrXiHMTJ/WhtkRbpoyhUJUS92iUZhswMlg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DCZiJSSmCiO04FmMEJaSq4AmDQm+FUiTpNIM7yoSYdXIYQ3vEv5Tu0xMaPv2FDbgpdQu2QC/UR+CZ3bppT7jpMeyDWaTMO+kzkCgUrnE6YQCUNrpq258TgafcqeEu/Ohi9ewzHPQVf558eJs+X9rzEYgDVJzBcAGpgBpeTBOx6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=TmtEBPrk; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62FNKPn31021429;
	Mon, 16 Mar 2026 06:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=UXhjmtqVsij/LUlly
	HwnJ+xDPArOzo01zjKtMLmdHTM=; b=TmtEBPrkELM2wP5T5JWeNBxmUUEMi+MPW
	hhSdBqfaSR/7+xlm+6nPhVez+MSpuF6Cl1oYyd85broLV6rL7ULS0xsALxGMosom
	wHnDWSv6C1Wz+CAkw5g7MRydkaLNILQg1lLU98jJ9us/s+cfKu48b5qdwCFVj4N+
	yttXTGz8z7BUteccO2gi7sxCyITUTItZqBpRqT1WhQxR+7Eve8V2NUWNyrrgNQ+i
	gcJ2uqccSXOGu1bDnWpejE/ZDJg21oRP6H91/CG0dqhuTKhDnw/Pr39ejJl5Lu1U
	jzOM+sqEs0jJLza+OVHAuNJMzRHyhSZ9fyRlHsjvjc5RO80y5U/5A==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cvw3hpdm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Mar 2026 06:25:55 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 62G63TxN032346;
	Mon, 16 Mar 2026 06:25:54 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cwm7jkhur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Mar 2026 06:25:54 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 62G6PpVx50266528
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Mar 2026 06:25:51 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2670020049;
	Mon, 16 Mar 2026 06:25:51 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C158920040;
	Mon, 16 Mar 2026 06:25:47 +0000 (GMT)
Received: from li-2fa77bcc-2701-11b2-a85c-cd621c23b6bd.bl1-in.ibm.com (unknown [9.123.13.4])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 16 Mar 2026 06:25:47 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: nathan@kernel.org, masahiroy@kernel.org, kees@kernel.org,
        naveen@kernel.org, jpoimboe@kernel.org, peterz@infradead.org,
        npiggin@gmail.com, maddy@linux.ibm.com, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu, mingo@kernel.org, mpe@ellerman.id.au,
        sv@linux.ibm.com, nsc@kernel.org
Subject: [RFC PATCH v4 4/6] objtool/powerpc: Skip jump destination analysis and unnanotated intra-function call warnings for --ftr-fixup
Date: Mon, 16 Mar 2026 11:52:35 +0530
Message-ID: <20260316062237.30948-5-sv@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260316062237.30948-1-sv@linux.ibm.com>
References: <20260316062237.30948-1-sv@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 27Zq6sbknyaviqxCBAU34fPJbi7vFMzn
X-Proofpoint-ORIG-GUID: XYuYc58Qj3sFI0SeWPiHcHaOl4PIG0UF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA0NSBTYWx0ZWRfX7r+UEjy4EzJp
 f6pFtZr48Ix+8ttY0vZNm36KKX/ywAi2IBTMsgRx3oWo+WOgDf+pyldzRt5BRYOwhlUXhVsEg4z
 Rev7/gv7NxWC369oIUJPqWeagB8s7l2fYPCWLG2ZNSiShFlougtfYxP2jw++rfK4xs6dZOSPXow
 HE6jg8W7CWCaxwoTT8t39d22dk9yU0UbBRxr8jn6obohmv7rqmsveHPdICSnGHpRTlCJkmR77vJ
 eAxgauVcc6dNNF9gY+KbUMag1L2TqGzAHkpV+loW+2H6aYk0cOYjfzDgV+vONnWKAGRkjEiPVgu
 3pdVE/uWeDaSIBM4JLQqNtSOucQxaaBT0uBiu43Gcn7S2kqkrxMgOXFQQbIbO7qWmL9L5ZKyPq+
 8RW0NjaCjjM77cW9fOigj6rclqscjI45aekLJFNOY5kfplu4DPMZgVB0fugJsmDSc3/3WClRb5m
 VNa8XAmiAPYjO/ZUZPQ==
X-Authority-Analysis: v=2.4 cv=Hf8ZjyE8 c=1 sm=1 tr=0 ts=69b7a274 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=8-sZ6GPjQPUUxCpKAYwA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160045
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11946-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,infradead.org,gmail.com,linux.ibm.com,kernel.crashing.org,csgroup.eu,ellerman.id.au];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[sv@linux.ibm.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[ibm.com:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 290E02951E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index 7b95ddb0460d..ba194446df0a 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1599,7 +1599,6 @@ static int add_jump_destinations(struct objtool_file *file)
 			    dest_off == func->offset + func->len)
 				continue;
 
-
 			ERROR_INSN(insn, "can't find jump dest instruction at %s",
 				offstr(dest_sec, dest_off));
 			return -1;
@@ -1681,7 +1680,7 @@ static int add_call_destinations(struct objtool_file *file)
 			if (func && func->ignore)
 				continue;
 
-			if (!insn_call_dest(insn)) {
+			if (!insn_call_dest(insn) && !opts.ftr_fixup) {
 				ERROR_INSN(insn, "unannotated intra-function call");
 				return -1;
 			}
@@ -2637,8 +2636,10 @@ static int decode_sections(struct objtool_file *file)
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


