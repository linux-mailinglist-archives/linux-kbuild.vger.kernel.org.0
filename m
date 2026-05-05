Return-Path: <linux-kbuild+bounces-13003-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uG4bGGyv+Wk+/AIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13003-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 05 May 2026 10:50:52 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FBA4C8E81
	for <lists+linux-kbuild@lfdr.de>; Tue, 05 May 2026 10:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14DB1307F97B
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 May 2026 08:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9FEE38AC90;
	Tue,  5 May 2026 08:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="V1YCmaKG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726E636165A;
	Tue,  5 May 2026 08:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777970867; cv=none; b=GGffRaLnQxoyjXL7Worxr3gW42qDihW+0+XxYDpXhsOKJi7KT42UiD9Vv5LwI8CmFxkVZ6obJ1MovYzsh3FqsInUmnVviHW7QiKxELOrv5P3g3xqZqYOtatKhmuXJOFRdjTZzONdR7GiH5lakwbXzt//0jzkkiZ4z3PR5U3A7jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777970867; c=relaxed/simple;
	bh=/N//trj709H4QqHLbpgBuIpvzN+zQx6SDqgOTz1z3Uc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UfqHr5T49IUU77AnC6b+KxqjnuEB/2MDbmDGJLRHy7T/GiNXAA6ey77srStcPh4q5CvEQJ+tcF+h37wCsbMdeO+4z1tBSn9TqLwBUbQBz6MfrbGp3my9eC6ltplgDR0YMiNCC/PnGPMFaM5knlLM8teR8eGsC2Cz/NdCP53wqyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=V1YCmaKG; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64583SNB3012905;
	Tue, 5 May 2026 08:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=ldEaI3/NxF2VB410A
	U5fZYV6Tmr5i8LAzGkBmKI8gYU=; b=V1YCmaKGgb27iLCj2QTnIk2JbaNfXPQDh
	jcsH0quwyvqEFiFxCV57xKNq4HIvne9PO9F4WGc1C/O8FkCm6tOeuCObg+ZrWw8V
	/YYrDLug63ADdFCQCppipY3h+odlFNpfTIU4P/UAWMkxj9S+uc9qolBdw0aFMJQP
	toYwjnFSQwVaT9AA3DwF9aY6cNM9yMktlqv+6Nuji59YvP6h389grZlGG5oBU/i0
	6u558AXm8BGfT3NnzB6Fgc4JVCB0mQvPlOSGBFt0U5oMobXL9WEzXnvqUf+Be46j
	7nQtvDncgmhSaLCRFtzJc4rD8BkLilD4clzdmzqgBwm24XaC1Rdmw==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dw9y4jf9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 08:46:51 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6458dQQN032036;
	Tue, 5 May 2026 08:46:50 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4dwwtg8mrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 08:46:49 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6458kktr51839472
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 May 2026 08:46:46 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DF84C2004F;
	Tue,  5 May 2026 08:46:45 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A18C620043;
	Tue,  5 May 2026 08:46:39 +0000 (GMT)
Received: from li-2fa77bcc-2701-11b2-a85c-cd621c23b6bd.bl1-in.ibm.com (unknown [9.123.13.4])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  5 May 2026 08:46:39 +0000 (GMT)
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
Subject: [PATCH v1 1/6] objtool/powerpc: Add build-time fixup of alternate feature branch targets
Date: Tue,  5 May 2026 14:16:23 +0530
Message-ID: <20260505084628.17940-2-sv@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA3OSBTYWx0ZWRfXyfKJ7yInZmR/
 3tl88Qhc+4XvCePHUIEl2BMSg5sbQgYzwyH/uvDifF7bFBrmU0u0FIquZaF/RLdpMkGkFIVFvC/
 EQ52YvZr0lN0ExGt/devXLHIBR9FbmGjnNo1BUONrmV42v/6uQdHvs21rpugB5tmTmsVU7tKQQ1
 z6Vf72ax9rIzSbLqejRqh54SUsMZO//SwDosb8R3gab9ubhQN6+x4cSvr3JVZztJt6KfTkzNt/1
 romWHvNXNgw87mPKDq4GXp71JlycPtGbngpEn+XzQS0hsXdRUNsUQMmoOJTbJDzVPznGEFSO37v
 9l8VY7aC8IQCctjAhVtEr3jfjL5yDByqcUQnV0D99pNW/Q/jpsj/gsRNVO28ok2ZJui7sSJLd9X
 0HZXDFh5VUX2/gLqc19MWSYymEyz4fjq/pd837Sj9D2fovhJnILNqsbSRYrmpxxC4TFcoAD+S9F
 jISgyBGFyZKPNlWsfIQ==
X-Authority-Analysis: v=2.4 cv=J4GaKgnS c=1 sm=1 tr=0 ts=69f9ae7b cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8
 a=Bgn1OAOv2882JTcyVjQA:9
X-Proofpoint-GUID: 267gpyc1wiufNxZXHhD2pVq8M8N7wFju
X-Proofpoint-ORIG-GUID: xN9asAEjZ5_U4KaxRqsh90CYKrm1Ch7L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050079
X-Rspamd-Queue-Id: B5FBA4C8E81
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13003-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.ibm.com:mid,opts.link:url];
	DKIM_TRACE(0.00)[ibm.com:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[30];
	RCVD_COUNT_SEVEN(0.00)[11]

PowerPC __ftr_alt* sections must currently be placed near .text because
they lack the executable attribute, preventing the linker from inserting
stubs. Branches in the alternate code must reach their targets directly.
This can cause build failures as the kernel grows.

Fix this by processing alternate feature relocations at build time with
objtool. Link with --emit-relocs to preserve relocation information,
mark __ftr_alt* sections executable ("ax") so the linker can insert
stubs, then use objtool --ftr-fixup to recompute branch offsets based
on their runtime locations.

objtool already has ELF parsing and instruction patching infrastructure,
so this avoids introducing a separate tool as was originally proposed [1].

[1] https://lore.kernel.org/linuxppc-dev/20170521010130.13552-1-npiggin@gmail.com/

Co-developed-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
---
 tools/objtool/arch/powerpc/decode.c     |  15 +-
 tools/objtool/arch/powerpc/special.c    | 451 ++++++++++++++++++++++++
 tools/objtool/builtin-check.c           |   2 +
 tools/objtool/check.c                   |  29 +-
 tools/objtool/elf.c                     |   1 +
 tools/objtool/include/objtool/builtin.h |   1 +
 tools/objtool/include/objtool/special.h |  56 +++
 tools/objtool/special.c                 |  29 ++
 8 files changed, 582 insertions(+), 2 deletions(-)

diff --git a/tools/objtool/arch/powerpc/decode.c b/tools/objtool/arch/powerpc/decode.c
index e534ac1123b3..f6e69d074f28 100644
--- a/tools/objtool/arch/powerpc/decode.c
+++ b/tools/objtool/arch/powerpc/decode.c
@@ -59,13 +59,26 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 	enum insn_type typ;
 	unsigned long imm;
 	u32 ins;
+	unsigned int aa;
 
 	ins = bswap_if_needed(file->elf, *(u32 *)(sec->data->d_buf + offset));
 	opcode = ins >> 26;
 	typ = INSN_OTHER;
 	imm = 0;
+	aa = ins & 2;
 
 	switch (opcode) {
+	case 16:
+		if (ins & 1)
+			typ = INSN_OTHER;
+		else
+			typ = INSN_JUMP_CONDITIONAL;
+		imm = ins & 0xfffc;
+		if (imm & 0x8000)
+			imm -= 0x10000;
+		insn->immediate = imm | aa;
+		break;
+
 	case 18: /* b[l][a] */
 		if (ins == 0x48000005)	/* bl .+4 */
 			typ = INSN_OTHER;
@@ -77,7 +90,7 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 		imm = ins & 0x3fffffc;
 		if (imm & 0x2000000)
 			imm -= 0x4000000;
-		imm |= ins & 2;	/* AA flag */
+		insn->immediate = imm | aa;
 		break;
 	}
 
diff --git a/tools/objtool/arch/powerpc/special.c b/tools/objtool/arch/powerpc/special.c
index 8f9bf61ca089..deb248c63bca 100644
--- a/tools/objtool/arch/powerpc/special.c
+++ b/tools/objtool/arch/powerpc/special.c
@@ -3,7 +3,17 @@
 #include <stdlib.h>
 #include <objtool/special.h>
 #include <objtool/builtin.h>
+#include <objtool/warn.h>
+#include <asm/byteorder.h>
+#include <errno.h>
 
+struct section *ftr_alt;
+
+struct fixup_entry *fes;
+unsigned int nr_fes;
+
+uint64_t fe_alt_start = -1;
+uint64_t fe_alt_end;
 
 bool arch_support_alt_relocation(struct special_alt *special_alt,
 				 struct instruction *insn,
@@ -23,3 +33,444 @@ const char *arch_cpu_feature_name(int feature_number)
 {
 	return NULL;
 }
+
+
+int process_alt_data(struct objtool_file *file)
+{
+	struct section *section;
+
+	section = find_section_by_name(file->elf, ".__ftr_alternates.text");
+	ftr_alt = section;
+
+	if (!ftr_alt) {
+		if (opts.link)
+			WARN(".__ftr_alternates.text section not found in vmlinux\n");
+		return opts.link ? -1 : 0;
+	}
+
+	fe_alt_start = ftr_alt->sh.sh_addr;
+	fe_alt_end = ftr_alt->sh.sh_addr + ftr_alt->sh.sh_size;
+
+	return 0;
+
+}
+
+static int is_le(struct objtool_file *file)
+{
+	return file->elf->ehdr.e_ident[EI_DATA] == ELFDATA2LSB;
+}
+
+static int is_64bit(struct objtool_file *file)
+{
+	return file->elf->ehdr.e_ident[EI_CLASS] == ELFCLASS64;
+}
+
+static uint32_t f32_to_cpu(struct objtool_file *file, uint32_t val)
+{
+	if (is_le(file))
+		return __le32_to_cpu(val);
+	else
+		return __be32_to_cpu(val);
+}
+
+static uint64_t f64_to_cpu(struct objtool_file *file, uint64_t val)
+{
+	if (is_le(file))
+		return __le64_to_cpu(val);
+	else
+		return __be64_to_cpu(val);
+}
+
+static uint32_t cpu_to_f32(struct objtool_file *file, uint32_t val)
+{
+	if (is_le(file))
+		return __cpu_to_le32(val);
+	else
+		return __cpu_to_be32(val);
+}
+
+int process_fixup_entries(struct objtool_file *file)
+{
+	struct section *sec;
+	int i;
+
+	for_each_sec(file->elf, sec) {
+		Elf_Data *data;
+		unsigned int nr;
+
+		if (strstr(sec->name, "_ftr_fixup") == NULL)
+			continue;
+
+		if (strstr(sec->name, ".rela") != NULL)
+			continue;
+
+		data = sec->data;
+		if (!data || data->d_size == 0)
+			continue;
+
+		if (is_64bit(file))
+			nr = data->d_size / sizeof(struct fixup_entry_64);
+		else
+			nr = data->d_size / sizeof(struct fixup_entry_32);
+
+		for (i = 0; i < nr; i++) {
+			unsigned long idx;
+			unsigned long long off;
+			struct fixup_entry *dst;
+
+			if (is_64bit(file)) {
+				struct fixup_entry_64 *src;
+
+				idx = i * sizeof(struct fixup_entry_64);
+				off = sec->sh.sh_addr + data->d_off + idx;
+				src = data->d_buf + idx;
+
+				if (src->alt_start_off == src->alt_end_off)
+					continue;
+
+				struct fixup_entry *tmp = realloc(fes, (nr_fes + 1)
+					* sizeof(struct fixup_entry));
+
+				if (!tmp) {
+					free(fes);
+					fes = NULL;
+					return -1;
+				}
+				fes = tmp;
+				dst = &fes[nr_fes++];
+
+				dst->mask = f64_to_cpu(file, src->mask);
+				dst->value = f64_to_cpu(file, src->value);
+				dst->start_off = f64_to_cpu(file, src->start_off) + off;
+				dst->end_off = f64_to_cpu(file, src->end_off) + off;
+				dst->alt_start_off = f64_to_cpu(file, src->alt_start_off) + off;
+				dst->alt_end_off = f64_to_cpu(file, src->alt_end_off) + off;
+			} else {
+				struct fixup_entry_32 *src;
+
+				idx = i * sizeof(struct fixup_entry_32);
+				off = sec->sh.sh_addr + data->d_off + idx;
+				src = data->d_buf + idx;
+
+				if (src->alt_start_off == src->alt_end_off)
+					continue;
+
+				struct fixup_entry *tmp = realloc(fes, (nr_fes + 1)
+					* sizeof(struct fixup_entry));
+
+				if (!tmp) {
+					free(fes);
+					fes = NULL;
+					return -1;
+				}
+				fes = tmp;
+				dst = &fes[nr_fes++];
+
+				dst->mask = f32_to_cpu(file, src->mask);
+				dst->value = f32_to_cpu(file, src->value);
+				dst->start_off = (int32_t)f32_to_cpu(file, src->start_off) + off;
+				dst->end_off = (int32_t)f32_to_cpu(file, src->end_off) + off;
+				dst->alt_start_off = (int32_t)f32_to_cpu(file,
+								src->alt_start_off) + off;
+				dst->alt_end_off = (int32_t)f32_to_cpu(file,
+								src->alt_end_off) + off;
+			}
+		}
+	}
+	return 0;
+}
+
+struct fixup_entry *find_fe_altaddr(uint64_t addr)
+{
+	unsigned int i;
+
+	if (addr < fe_alt_start)
+		return NULL;
+	if (addr >= fe_alt_end)
+		return NULL;
+
+	for (i = 0; i < nr_fes; i++) {
+		if (addr >= fes[i].alt_start_off && addr < fes[i].alt_end_off)
+			return &fes[i];
+	}
+	return NULL;
+}
+
+int set_uncond_branch_target(uint32_t *insn,
+		const uint64_t addr, uint64_t target)
+{
+	uint32_t i = *insn;
+	int64_t offset;
+
+	offset = target;
+	if (!(i & BRANCH_ABSOLUTE))
+		offset = offset - addr;
+
+	/* Check we can represent the target in the instruction format */
+	if (offset < -0x2000000 || offset > 0x1fffffc || offset & 0x3)
+		return -EOVERFLOW;
+
+	/* Mask out the flags and target, so they don't step on each other. */
+	*insn = 0x48000000 | (i & 0x3) | (offset & 0x03FFFFFC);
+
+	return 0;
+}
+
+int set_cond_branch_target(uint32_t *insn,
+		const uint64_t addr, uint64_t target)
+{
+	uint32_t i = *insn;
+	int64_t offset;
+
+	offset = target;
+
+	if (!(i & BRANCH_ABSOLUTE))
+		offset = offset - addr;
+
+	/* Check we can represent the target in the instruction format */
+	if (offset < -0x8000 || offset > 0x7FFF || offset & 0x3)
+		return -EOVERFLOW;
+
+	/* Mask out the flags and target, so they don't step on each other. */
+	*insn = 0x40000000 | (i & 0x3FF0003) | (offset & 0xFFFC);
+
+	return 0;
+}
+
+void check_and_flatten_fixup_entries(void)
+{
+	static struct fixup_entry *fe;
+	unsigned int i;
+
+	for (i = 0; i < nr_fes; i++) {
+		struct fixup_entry *parent;
+		uint64_t nested_off;
+		uint64_t size;
+
+		fe = &fes[i];
+
+		parent = find_fe_altaddr(fe->start_off);
+		if (!parent)
+			continue;
+
+		size = fe->end_off - fe->start_off;
+		nested_off = fe->start_off - parent->alt_start_off;
+
+		fe->start_off = parent->start_off + nested_off;
+		fe->end_off = fe->start_off + size;
+	}
+}
+
+
+static struct symbol *find_symbol_at_address_within_section(struct section *sec,
+				unsigned long address)
+{
+	struct symbol *sym;
+
+	sec_for_each_sym(sec, sym) {
+		if (sym->sym.st_value <= address && address < sym->sym.st_value + sym->len)
+			return sym;
+	}
+
+	return NULL;
+}
+
+static int is_local_symbol(uint8_t st_other)
+{
+	/* STO_PPC64_LOCAL_MASK: bits [7:5] encode the local entry point offset */
+	return (st_other & (7 << 5)) == 0;
+}
+
+static struct symbol *find_symbol_at_address(struct objtool_file *file,
+					unsigned long address)
+{
+	struct section *sec;
+	struct symbol *sym;
+
+	list_for_each_entry(sec, &file->elf->sections, list) {
+		sym = find_symbol_at_address_within_section(sec, address);
+		if (sym)
+			return sym;
+		}
+	return NULL;
+}
+
+int process_alt_relocations(struct objtool_file *file)
+{
+	struct section *section;
+	size_t n = 0;
+	struct reloc *relocation;
+	struct symbol *sym;
+	struct fixup_entry *fe;
+	uint64_t addr;
+	uint64_t scn_delta;
+	uint64_t dst_addr;
+	const char *insn_ptr;
+	unsigned long target;
+	struct symbol *symbol;
+	int is_local;
+	int j;
+	uint32_t new_insn;
+	uint32_t file_insn;
+	struct instruction decoded_insn = {0};
+	uint32_t *insn_ptr_raw;
+	uint32_t insn;
+
+	section = find_section_by_name(file->elf, ".rela.__ftr_alternates.text");
+	if (!section) {
+		printf(".rela.__ftr_alternates.text section not found.\n");
+		return 0;
+	}
+
+	for (j = 0; j < sec_num_entries(section); j++) {
+
+		relocation = &section->relocs[j];
+		sym = relocation->sym;
+
+		addr = reloc_offset(relocation);
+		target = sym->sym.st_value + reloc_addend(relocation);
+		symbol = find_symbol_at_address(file, target);
+
+		if (symbol) {
+			is_local = is_local_symbol(symbol->sym.st_other);
+			if (!is_local)
+				target = target + 0x8;
+		}
+
+		n++;
+		fe = find_fe_altaddr(addr);
+		if (!fe)
+			continue;
+
+		if (target >= fe->alt_start_off && target < fe->alt_end_off)
+			continue;
+
+		if (target >= ftr_alt->sh.sh_addr &&
+			target < ftr_alt->sh.sh_addr + ftr_alt->sh.sh_size)
+			return -1;
+
+		scn_delta = addr - ftr_alt->sh.sh_addr;
+		dst_addr = addr - fe->alt_start_off + fe->start_off;
+
+		if (!ftr_alt->data || !ftr_alt->data->d_buf)
+			continue;
+
+		if (arch_decode_instruction(file, ftr_alt, scn_delta, 4, &decoded_insn) < 0)
+			continue;
+
+		insn_ptr_raw = (uint32_t *)(ftr_alt->data->d_buf + scn_delta);
+
+		insn = f32_to_cpu(file, *insn_ptr_raw);
+		new_insn = insn;
+
+		switch (decoded_insn.type) {
+		case INSN_JUMP_CONDITIONAL:
+			if (set_cond_branch_target(&new_insn, dst_addr, target) != 0)
+				continue;
+			break;
+
+		case INSN_JUMP_UNCONDITIONAL:
+			if (set_uncond_branch_target(&new_insn, dst_addr, target) != 0)
+				continue;
+			break;
+
+		case INSN_CALL:
+			if (set_uncond_branch_target(&new_insn, dst_addr, target) != 0)
+				continue;
+			break;
+		default:
+			continue;
+		}
+
+		if (new_insn == insn)
+			continue;
+
+		file_insn = cpu_to_f32(file, new_insn);
+		insn_ptr = (const char *)&file_insn;
+		elf_write_insn(file->elf, ftr_alt, scn_delta, sizeof(file_insn), insn_ptr);
+	}
+	return 0;
+}
+
+int process_exception_entries(struct objtool_file *file)
+{
+	struct section *section;
+	Elf_Data *data;
+	unsigned int nr, i;
+
+	section = find_section_by_name(file->elf, "__ex_table");
+	if (!section) {
+		printf("__ex_table section not found\n");
+		return 0;
+	}
+
+	data = section->data;
+	if (!data || data->d_size == 0)
+		return 0;
+
+	nr = data->d_size / sizeof(struct exception_entry);
+
+	for (i = 0; i < nr; i++) {
+		struct exception_entry *ex;
+		unsigned long idx;
+		uint64_t exaddr;
+		unsigned long long off;
+
+		idx = i * sizeof(struct exception_entry);
+		off = section->sh.sh_addr + data->d_off + idx;
+		ex = data->d_buf + idx;
+
+		exaddr = off + (int32_t)f32_to_cpu(file, ex->insn);
+
+		if (exaddr < fe_alt_start)
+			continue;
+		if (exaddr >= fe_alt_end)
+			continue;
+
+		return -1;
+	}
+	return 0;
+}
+
+int process_bug_entries(struct objtool_file *file)
+{
+	struct section *section;
+	Elf_Data *data;
+	unsigned int nr, i;
+
+	section = find_section_by_name(file->elf, "__bug_table");
+	if (!section) {
+		printf("__bug_table section not found\n");
+		return 0;
+	}
+
+	data = section->data;
+	if (!data || data->d_size == 0)
+		return 0;
+
+	if (data->d_size % sizeof(struct bug_entry) != 0)
+		return -1;
+
+	nr = data->d_size / sizeof(struct bug_entry);
+	for (i = 0; i < nr; i++) {
+		struct bug_entry *bug;
+		unsigned long idx;
+		uint64_t entry_addr;
+		uint64_t bugaddr;
+		int32_t bug_disp;
+
+		idx = i * sizeof(struct bug_entry);
+		entry_addr = section->sh.sh_addr + data->d_off + idx;
+		bug = (struct bug_entry *)(data->d_buf + idx);
+		bug_disp = f32_to_cpu(file, bug->bug_addr_disp);
+		bugaddr = entry_addr + bug_disp;
+
+		if (bugaddr < fe_alt_start)
+			continue;
+		if (bugaddr >= fe_alt_end)
+			continue;
+
+		return -1;
+	}
+	return 0;
+}
diff --git a/tools/objtool/builtin-check.c b/tools/objtool/builtin-check.c
index b780df513715..5ee0880baec5 100644
--- a/tools/objtool/builtin-check.c
+++ b/tools/objtool/builtin-check.c
@@ -78,6 +78,7 @@ static const struct option check_options[] = {
 	OPT_STRING_OPTARG('d',	 "disas", &opts.disas, "function-pattern", "disassemble functions", "*"),
 	OPT_CALLBACK_OPTARG('h', "hacks", NULL, NULL, "jump_label,noinstr,skylake", "patch toolchain bugs/limitations", parse_hacks),
 	OPT_BOOLEAN('i',	 "ibt", &opts.ibt, "validate and annotate IBT"),
+	OPT_BOOLEAN('f',	 "ftr-fixup", &opts.ftr_fixup, "feature fixup"),
 	OPT_BOOLEAN('m',	 "mcount", &opts.mcount, "annotate mcount/fentry calls for ftrace"),
 	OPT_BOOLEAN(0,		 "noabs", &opts.noabs, "reject absolute references in allocatable sections"),
 	OPT_BOOLEAN('n',	 "noinstr", &opts.noinstr, "validate noinstr rules"),
@@ -181,6 +182,7 @@ static bool opts_valid(void)
 	    opts.disas			||
 	    opts.hack_jump_label	||
 	    opts.hack_noinstr		||
+	    opts.ftr_fixup		||
 	    opts.ibt			||
 	    opts.mcount			||
 	    opts.noabs			||
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index b6765e876507..8cb55fe6e1dc 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1636,9 +1636,11 @@ static int add_jump_destinations(struct objtool_file *file)
 			    dest_off == func->offset + func->len)
 				continue;
 
+
 			ERROR_INSN(insn, "can't find jump dest instruction at %s",
-				   offstr(dest_sec, dest_off));
+				offstr(dest_sec, dest_off));
 			return -1;
+
 		}
 
 		if (!dest_sym || is_sec_sym(dest_sym)) {
@@ -5021,6 +5023,31 @@ int check(struct objtool_file *file)
 	if (!nr_insns)
 		goto out;
 
+	if (opts.ftr_fixup) {
+		ret = process_alt_data(file);
+		if (ret < 0)
+			return ret;
+
+		ret = process_fixup_entries(file);
+		if (ret < 0)
+			return ret;
+
+		check_and_flatten_fixup_entries();
+
+		ret = process_exception_entries(file);
+		if (ret < 0)
+			return ret;
+
+		ret = process_bug_entries(file);
+		if (ret < 0)
+			return ret;
+
+		ret = process_alt_relocations(file);
+		if (ret < 0)
+			return ret;
+	}
+
+
 	if (opts.retpoline)
 		warnings += validate_retpoline(file);
 
diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index 2ffe3ebfbe37..2ca2a4e4b92e 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -1156,6 +1156,7 @@ struct elf *elf_open_read(const char *name, int flags)
 		cmd = ELF_C_WRITE;
 
 	elf->elf = elf_begin(elf->fd, cmd, NULL);
+
 	if (!elf->elf) {
 		ERROR_ELF("elf_begin");
 		goto err;
diff --git a/tools/objtool/include/objtool/builtin.h b/tools/objtool/include/objtool/builtin.h
index b9e229ed4dc0..3578ec174a59 100644
--- a/tools/objtool/include/objtool/builtin.h
+++ b/tools/objtool/include/objtool/builtin.h
@@ -13,6 +13,7 @@ struct opts {
 	bool checksum;
 	bool dump_orc;
 	bool hack_jump_label;
+	bool ftr_fixup;
 	bool hack_noinstr;
 	bool hack_skylake;
 	bool ibt;
diff --git a/tools/objtool/include/objtool/special.h b/tools/objtool/include/objtool/special.h
index 121c3761899c..0a5efbfa29d0 100644
--- a/tools/objtool/include/objtool/special.h
+++ b/tools/objtool/include/objtool/special.h
@@ -12,6 +12,41 @@
 
 #define C_JUMP_TABLE_SECTION ".data.rel.ro.c_jump_table"
 
+#define BRANCH_SET_LINK 0x1
+#define BRANCH_ABSOLUTE 0x2
+
+struct bug_entry {
+	int32_t  bug_addr_disp;
+	int32_t  file_disp;
+	uint16_t line;
+	uint16_t flags;
+};
+
+struct exception_entry {
+	int32_t insn;
+	int32_t fixup;
+};
+
+struct fixup_entry_64 {
+	uint64_t mask;
+	uint64_t value;
+	uint64_t start_off;
+	uint64_t end_off;
+	uint64_t alt_start_off;
+	uint64_t alt_end_off;
+};
+
+#define fixup_entry fixup_entry_64
+
+struct fixup_entry_32 {
+	uint32_t mask;
+	uint32_t value;
+	uint32_t start_off;
+	uint32_t end_off;
+	uint32_t alt_start_off;
+	uint32_t alt_end_off;
+};
+
 struct special_alt {
 	struct list_head list;
 
@@ -28,6 +63,8 @@ struct special_alt {
 	unsigned int orig_len, new_len, feature; /* group only */
 };
 
+int process_alt_data(struct objtool_file *file);
+
 int special_get_alts(struct elf *elf, struct list_head *alts);
 
 void arch_handle_alternative(struct special_alt *alt);
@@ -40,4 +77,23 @@ struct reloc *arch_find_switch_table(struct objtool_file *file,
 				     unsigned long *table_size);
 const char *arch_cpu_feature_name(int feature_number);
 
+int process_fixup_entries(struct objtool_file *file);
+
+void check_and_flatten_fixup_entries(void);
+
+int process_exception_entries(struct objtool_file *file);
+
+int process_bug_entries(struct objtool_file *file);
+
+int process_alt_relocations(struct objtool_file *file);
+
+struct fixup_entry *find_fe_altaddr(uint64_t addr);
+
+int set_uncond_branch_target(uint32_t *insn,
+		const uint64_t addr, uint64_t target);
+
+int set_cond_branch_target(uint32_t *insn,
+		const uint64_t addr, uint64_t target);
+
+
 #endif /* _SPECIAL_H */
diff --git a/tools/objtool/special.c b/tools/objtool/special.c
index 2a533afbc69a..43b60bf789dd 100644
--- a/tools/objtool/special.c
+++ b/tools/objtool/special.c
@@ -167,3 +167,32 @@ int special_get_alts(struct elf *elf, struct list_head *alts)
 
 	return 0;
 }
+
+int __weak process_alt_data(struct objtool_file *file)
+{
+	return 0;
+}
+
+int __weak process_fixup_entries(struct objtool_file *file)
+{
+	return 0;
+}
+
+void __weak check_and_flatten_fixup_entries(void)
+{
+}
+
+int __weak process_exception_entries(struct objtool_file *file)
+{
+	return 0;
+}
+
+int __weak process_bug_entries(struct objtool_file *file)
+{
+	return 0;
+}
+
+int __weak process_alt_relocations(struct objtool_file *file)
+{
+	return 0;
+}
-- 
2.43.0


