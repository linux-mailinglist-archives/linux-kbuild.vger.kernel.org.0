Return-Path: <linux-kbuild+bounces-13002-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FjyOrWu+Wky+wIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13002-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 05 May 2026 10:47:49 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B344C8D6A
	for <lists+linux-kbuild@lfdr.de>; Tue, 05 May 2026 10:47:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 25B4F3016B01
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 May 2026 08:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFD8F30E828;
	Tue,  5 May 2026 08:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="TWiD9N/P"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1D726F476;
	Tue,  5 May 2026 08:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777970864; cv=none; b=ip42udjXlE+/2VJs1V3CQFWvfOUoe8bo8JljAJLh7lmLWlSFBX5iG42WCWnSxUMxG4QazdtkpfRkxKob7B5EzfsQ7rSM7D1pl6HvKOwpL1TYt04GBnC6vNH25GI6AuDdiho5H5Ryv8/jjg8Kow6bc2ldtI1a/nBbMSQQ2efdkTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777970864; c=relaxed/simple;
	bh=MR30btQ1qvhndTWwiWd7A6CfyvtCTBZZas3qPiG9ugw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cra3KKOHwUQy+jkwN5v3XWSUmClGmSomiTjfHNzMRmHs06vjM4hUbt13UsI6M19BI9rGCXY3Wt9bO0z4qbw4OPwlUsvv7llnI6elQCm6QQ2rHZG9V211qGVblM3w1Q3dfEc6vbzHtEnm8zaSiON9rRWc02a0JgFTjgtWvx22Uaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=TWiD9N/P; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644JpBdb1430407;
	Tue, 5 May 2026 08:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=hGJh2f4c0LNFYVx89
	4cgxHv+USKOgC1gectplGa8nBc=; b=TWiD9N/Pn0Zm3VDNJ8Fn/okMnfvB1ihGg
	LCTylcO9z92uHZYzPwrtPhtzj4QsRZTUjxA4XgNghhcF0f5nNPK4S4truf6/h3oa
	rY710tU4nml6a7UE9wyC8zTWsW/Tkw4WI1ZnXT7Qhb9/vlMS9n+jEKNRaZHPkD8e
	6pjklGHQEmyexhCSEdhfFvgytCH2W6dM+w37G+pgCWHHmRc23wfWO9abBWtIBJeW
	mpV3zT5DE6EiAgrZeTWovgBcc7HW+gYkTwn1Sn3L9ea+zmsrCzBupaULB2lqyBYh
	m4hSUPnbcPX8kExB/4uMnq57oBzcA03Nf00llkC8iH6QiXgEFONdA==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dw9xxjdf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 08:47:05 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6458OaL3020973;
	Tue, 5 May 2026 08:47:04 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4dwvkjrrvk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 08:47:04 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6458l0dg52625690
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 May 2026 08:47:00 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 973A82005A;
	Tue,  5 May 2026 08:47:00 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D79682004B;
	Tue,  5 May 2026 08:46:54 +0000 (GMT)
Received: from li-2fa77bcc-2701-11b2-a85c-cd621c23b6bd.bl1-in.ibm.com (unknown [9.123.13.4])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  5 May 2026 08:46:54 +0000 (GMT)
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
Subject: [PATCH v1 3/6] objtool: Fix "can't find starting instruction" warnings on vmlinux
Date: Tue,  5 May 2026 14:16:25 +0530
Message-ID: <20260505084628.17940-4-sv@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA3OSBTYWx0ZWRfX7vQaoCu9debt
 16/NsQoQpYxjxaGQsnkT8wgPhfMGrWrEu+uDtT21yOz01mQY259DSIQZqNzT+941jrHFT8+3kP6
 VXIkTBOvMyRoAjKhwUhBmaisnRS0JwCQLI1M8RPA4IdgbJqGUpY1nn/beQJipJ+COq9UvblyeaH
 2u3wPn5jlMOEkbzW+oGiSa5QBC1lMA/DIOyzI8nhPIss1s7KdVOSt0qsB6ba9xV2wneM5JdI3dM
 x937HTSFfp4ue9385IFCsEMDxrupR3lTZCdBrjEt/vPGu3pcLkOU/R2Ht39zX9NaL8/A+tGMdgp
 4YTSOXtoi7OxIVr3gp/Yz6s4KKTFh/WNUnUsQzg67LCphNIHZbBnr80wXZ3XPzweR6vD27GyluE
 3IiBl127mjYq92tQsoX2RLtDp0yXYD98f8svHSAHO3fCYpzYixup6Df/aAB22MaMHUFnAxbKg35
 Qdr1ly9AKD5Btv59eyQ==
X-Proofpoint-ORIG-GUID: HBXI0MPVD3JpW_3ioLPeEBYqDKWCjLBo
X-Proofpoint-GUID: R61SQUfzhjeWGwAFZqAdlgwYkUYuwUG9
X-Authority-Analysis: v=2.4 cv=ctWrVV4i c=1 sm=1 tr=0 ts=69f9ae89 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8 a=0ZCZ8pRhY7ETOmrAYN0A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050079
X-Rspamd-Queue-Id: E0B344C8D6A
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
	TAGGED_FROM(0.00)[bounces-13002-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[ibm.com:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_COUNT_SEVEN(0.00)[11]

Objtool throws a lot of can't find starting instruction warnings
when run on vmlinux with --ftr-fixup option.

These warnings are seen because find_insn() function looks for
instructions at offsets that are relative to the start of the section.
In case of individual object files (.o), there are no can't find
starting instruction warnings seen because the actual offset
associated with an instruction is itself a relative offset since the
sections start at offset 0x0.

However, in case of vmlinux, find_insn() function fails to find
instructions at the actual offset associated with an instruction
since the sections in vmlinux do not start at offset 0x0. Due to
this, find_insn() will look for absolute offset and not the relative
offset. This is resulting in a lot of can't find starting instruction
warnings when objtool is run on vmlinux.

To fix this, pass offset that is relative to the start of the section
to find_insn().

find_insn() is also looking for symbols of size 0. But, objtool does
not store empty STT_NOTYPE symbols in the rbtree. Due to this,
for empty symbols, objtool is throwing can't find starting
instruction warnings. Fix this by ignoring symbols that are of
size 0 since objtool does not add them to the rbtree.

Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 tools/objtool/check.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 8cb55fe6e1dc..f3501b149829 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -412,7 +412,7 @@ static int decode_instructions(struct objtool_file *file)
 {
 	struct section *sec;
 	struct symbol *func;
-	unsigned long offset;
+	unsigned long offset, func_off;
 	struct instruction *insn;
 
 	for_each_sec(file->elf, sec) {
@@ -494,17 +494,25 @@ static int decode_instructions(struct objtool_file *file)
 			if (func->embedded_insn || func->alias != func)
 				continue;
 
-			if (!find_insn(file, sec, func->offset)) {
+			if (func->len == 0 && is_notype_sym(func))
+				continue;
+
+			func_off = opts.ftr_fixup ?
+				func->offset - sec->sh.sh_addr : func->offset;
+
+			if (!find_insn(file, sec, func_off)) {
 				ERROR("%s(): can't find starting instruction", func->name);
 				return -1;
 			}
 
-			sym_for_each_insn(file, func, insn) {
+			for (insn = find_insn(file, sec, func_off);
+				insn && insn->offset < func_off + func->len;
+				insn = next_insn_same_sec(file, insn)) {
 				insn->sym = func;
 				if (is_func_sym(func) &&
 				    insn->type == INSN_ENDBR &&
 				    list_empty(&insn->call_node)) {
-					if (insn->offset == func->offset) {
+					if (insn->offset == func_off) {
 						list_add_tail(&insn->call_node, &file->endbr_list);
 						file->nr_endbr++;
 					} else {
-- 
2.43.0


