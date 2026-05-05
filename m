Return-Path: <linux-kbuild+bounces-13006-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOOQLAiv+Wky+wIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13006-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 05 May 2026 10:49:12 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8FA4C8DFA
	for <lists+linux-kbuild@lfdr.de>; Tue, 05 May 2026 10:49:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7EEB8301F4D8
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 May 2026 08:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6236839934C;
	Tue,  5 May 2026 08:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="OknEysb3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D4F3C6A39;
	Tue,  5 May 2026 08:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777970888; cv=none; b=hqMB5AU/g7WL9e3hwezEtB89Zainu9B47hpZs2AMeZrNXw7kuhnhIl38S+RthFWnNVFPPlekD0nCJBIZkNWGhFbvmpLHC5fNUloyX3WqkzdOmmaJyAWhjwp5/QStYdbO2206CS2UIfFvvZHU6sSi6ty9QRXqSnj5IqwA4neHtHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777970888; c=relaxed/simple;
	bh=3rktnoIkXXya+u/8GoNZoQLYEyGo8U+1c1ku44KBkUE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o/3R92BFX74u7VHjtg5ZRkKeKaNvMHeLUekUMPVlmvDLAV4X4Pi3nqjmcGJ1z+s7rCNu4Scod20ysNZwTgdCOOIMnCY9TVu2PuoR0IKSZPNVm4uEAw6Hcq+n5fW4SsfWTsB3esppzrrgXHCe2NkYbi5wlSc6QaJJhWCSnvCDqaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=OknEysb3; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644Fu4Qr3001038;
	Tue, 5 May 2026 08:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=k+DJ/QKgnsJRWP5aa
	3/5HeOk4bQEztdyefO8B9y+e94=; b=OknEysb3PN/f4lhNgazWJGAAsz4GamKkh
	SJ4NeJnI4VgeYLikfEAbPatwlSSRSd66wRb6g001QJkZW1Hy6OVu9qavb05l2i0g
	zvylTQdTEATewQ/ZJkpKR0CVYOCRKcu0DOunKnD0K4LE0CdE4MERwM7SbLy4llNh
	meoVV/tRY9w+dHhFiuezvE84ag/DeJs/jOPcUr7z/ki+8bXEJP9gBp4sji6YlKfQ
	jI4RVf2GhRW2FqmQUqeQ6E5leFu2G1HhcI1aTx31pNNV2DUE+Smc6c5gZ1A2NlDS
	FOyCBZWvs9pKqs2TDRuLeu2L9elKA19JX9EFgLlegubr48kfPwbYA==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dw9y4jfb6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 08:47:12 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6458dson030084;
	Tue, 5 May 2026 08:47:11 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4dww3h0qk7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 08:47:11 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6458l7ZX51839262
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 May 2026 08:47:07 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 759122004B;
	Tue,  5 May 2026 08:47:07 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C3DE2004E;
	Tue,  5 May 2026 08:47:01 +0000 (GMT)
Received: from li-2fa77bcc-2701-11b2-a85c-cd621c23b6bd.bl1-in.ibm.com (unknown [9.123.13.4])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  5 May 2026 08:47:01 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: nathan@kernel.org, nsc@kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, chleroy@kernel.org, jpoimboe@kernel.org,
        peterz@infradead.org, ojeda@kernel.org, masahiroy@kernel.org,
        lossin@kernel.org, tamird@kernel.org, thomas.weissschuh@linutronix.de,
        rostedt@goodmis.org, ihor.solodrai@linux.dev, thuth@redhat.com,
        pmladek@suse.com, aliceryhl@google.com, elver@google.com,
        kees@kernel.org, legion@kernel.org, ardb@kernel.org,
        yuxuan.zuo@outlook.com, alexghiti@rivosinc.com,
        alexandre.chartre@oracle.com, bp@alien8.de,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sv@linux.ibm.com
Subject: [PATCH v1 4/6] objtool/powerpc: Skip jump destination analysis and unnanotated intra-function call warnings for --ftr-fixup
Date: Tue,  5 May 2026 14:16:26 +0530
Message-ID: <20260505084628.17940-5-sv@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260505084628.17940-1-sv@linux.ibm.com>
References: <20260505084628.17940-1-sv@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA3OSBTYWx0ZWRfX6qvbi3Gfi4tO
 2Q1e/6qX0hywOVz01hfLDmgNYwvWMBYFkbRAmn+X6zqN6sI/GTGrml+X6hNNLEzsUyX0e3m31+c
 nX807DfHGfdKtx4mjjF9/V/wRzVfZ5So8vpFyjg04H1k/zRXV2nBKKVogx/P26si2hOyvAmgsvN
 6KwI26ivTbRjA3XqiE1yzGf3V1HIH+bjtJWvBP+IYtM9CzVbjZbxz8fc8DCiSTSDHJaCpkTANKw
 t551eHkVsYPBJO/d0GI09IToJh3D54NyiDUMHHdoKOMwxmixR116KO156PwKmCd1vmFfVjQg5gb
 EQfzhic/c6+Y/cVQGJgZITkQwSUF/ty4Nk1KwbxF6OVXtEWMoQVZKgcdLOMKCMG1L0xJZPvPVnA
 xgREkSjNBGJNRQVPHlnqdc6eXVHpCEuTp2i8P3krMa+/u/Pkk/xHJSQCWrsBThh/Py+YiKhYiJ/
 HkSkf2qCJpEKJriGTSg==
X-Authority-Analysis: v=2.4 cv=J4GaKgnS c=1 sm=1 tr=0 ts=69f9ae90 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8 a=8-sZ6GPjQPUUxCpKAYwA:9
X-Proofpoint-GUID: Vz2DgZck83xZqSxidr6EDdXScLdcBd5h
X-Proofpoint-ORIG-GUID: 18Uy7SmtzprzGPQbqVRJ2gJ5ZJcGmxA7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050079
X-Rspamd-Queue-Id: AC8FA4C8DFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13006-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,infradead.org,linutronix.de,goodmis.org,linux.dev,redhat.com,suse.com,google.com,outlook.com,rivosinc.com,oracle.com,alien8.de,vger.kernel.org,lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[sv@linux.ibm.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux.ibm.com:mid];
	DKIM_TRACE(0.00)[ibm.com:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_COUNT_SEVEN(0.00)[11]

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
 tools/objtool/check.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index f3501b149829..14644ca36d73 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1644,7 +1644,6 @@ static int add_jump_destinations(struct objtool_file *file)
 			    dest_off == func->offset + func->len)
 				continue;
 
-
 			ERROR_INSN(insn, "can't find jump dest instruction at %s",
 				offstr(dest_sec, dest_off));
 			return -1;
@@ -1727,8 +1726,11 @@ static int add_call_destinations(struct objtool_file *file)
 				continue;
 
 			if (!insn_call_dest(insn)) {
-				ERROR_INSN(insn, "unannotated intra-function call");
-				return -1;
+				if (!opts.ftr_fixup) {
+					ERROR_INSN(insn, "unannotated intra-function call");
+					return -1;
+				}
+				continue;
 			}
 
 			if (func && !is_func_sym(insn_call_dest(insn))) {
@@ -2681,8 +2683,10 @@ static int decode_sections(struct objtool_file *file)
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


