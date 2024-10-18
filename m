Return-Path: <linux-kbuild+bounces-4193-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A354C9A450C
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Oct 2024 19:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 229BB1F216C0
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Oct 2024 17:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005E320ADDB;
	Fri, 18 Oct 2024 17:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="iEFRACPt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0D4204958;
	Fri, 18 Oct 2024 17:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729273085; cv=none; b=S3ypARFopAIerrhx1j4cG4PcRVM+udfzNQw+MQOtOHpeeGhD7qL3Ob3hDWIA5u+GhHGf+TWjOsLA4FmeP8KdFYDBa98XLZAGgBoh84tdwBbuZksG9AhxUFzLHAA29BohD37qCdHiwpID7WqOD8Mh6psfmcVVZuTHtCy4E4ebYPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729273085; c=relaxed/simple;
	bh=IO4zROvR+gsKk5VANo54VUHNVCFE1w4uyjbXrUE07vM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LT4ASgwsrGoXb5BxIcrA0a5nkC/kwHaMJtKlW3hkDt5aaWBioNHSbWL+JOjaFX/qh54ONkLBeo5/xO6ukNmCp5tqJOots5rAQFOUlcZFhmMtrNSwbUKCWtdHuAczRYyNqKaQ5chBPki/Q8u9pF9NrqqdML1hjUEXyCyfjx9zy5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=iEFRACPt; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I5Z1nc011653;
	Fri, 18 Oct 2024 17:37:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=5wNAcgYXO8snlYYEF
	kriQMiZ8si2kNFSED277zisR3Q=; b=iEFRACPtPHSqFs79kflRw7/Xezp51J/O4
	+aW+GRaBWoBjKOcmIKTnlngE53Pi4DsUpfgMorQSDv5jLP+b1Sx0KnS62CPVzLUX
	poT8m2I9PPzDHw0OJ1oHD/stVzhdxQ2fs4uujbooSxEbo40WLL/ql5o3YrMMyzGB
	USL1peNgVrXYzEHE3b5dY9poTOH+2Z84juHtPrqcL5nYZtGbyFnP3+8uyop9gWak
	awFUecy6O42idXCHOLA8HFLvCW2yZetWK5ixtH9vLZtrCtLnK8SM3dV2/xSgZJip
	CRpwaTbMLrilIl78bwXuKyZl50n9UnY3+pU84u/lV4Fj2cxl7Qa9g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42bhnfbs3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 17:37:38 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49IHbb2t024586;
	Fri, 18 Oct 2024 17:37:37 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42bhnfbs36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 17:37:37 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49IF1JuA002452;
	Fri, 18 Oct 2024 17:37:36 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4284en601y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 17:37:35 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49IHbWns8257908
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Oct 2024 17:37:32 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E8E7720043;
	Fri, 18 Oct 2024 17:37:31 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ACE6420040;
	Fri, 18 Oct 2024 17:37:27 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.99.188])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Oct 2024 17:37:27 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>, "Naveen N. Rao" <naveen@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Vishal Chourasia <vishalc@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Subject: [PATCH v6 12/17] powerpc64/ftrace: Move ftrace sequence out of line
Date: Fri, 18 Oct 2024 23:06:27 +0530
Message-ID: <20241018173632.277333-13-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241018173632.277333-1-hbathini@linux.ibm.com>
References: <20241018173632.277333-1-hbathini@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KpqJzSkI27oLmajW3V3d2VUMfKCz7G2w
X-Proofpoint-ORIG-GUID: cyE3qO1xaAMrCNS1nB7iyC3NriKALdzx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180111

From: Naveen N Rao <naveen@kernel.org>

Function profile sequence on powerpc includes two instructions at the
beginning of each function:
	mflr	r0
	bl	ftrace_caller

The call to ftrace_caller() gets nop'ed out during kernel boot and is
patched in when ftrace is enabled.

Given the sequence, we cannot return from ftrace_caller with 'blr' as we
need to keep LR and r0 intact. This results in link stack (return
address predictor) imbalance when ftrace is enabled. To address that, we
would like to use a three instruction sequence:
	mflr	r0
	bl	ftrace_caller
	mtlr	r0

Further more, to support DYNAMIC_FTRACE_WITH_CALL_OPS, we need to
reserve two instruction slots before the function. This results in a
total of five instruction slots to be reserved for ftrace use on each
function that is traced.

Move the function profile sequence out-of-line to minimize its impact.
To do this, we reserve a single nop at function entry using
-fpatchable-function-entry=1 and add a pass on vmlinux.o to determine
the total number of functions that can be traced. This is then used to
generate a .S file reserving the appropriate amount of space for use as
ftrace stubs, which is built and linked into vmlinux.

On bootup, the stub space is split into separate stubs per function and
populated with the proper instruction sequence. A pointer to the
associated stub is maintained in dyn_arch_ftrace.

For modules, space for ftrace stubs is reserved from the generic module
stub space.

This is restricted to and enabled by default only on 64-bit powerpc,
though there are some changes to accommodate 32-bit powerpc. This is
done so that 32-bit powerpc could choose to opt into this based on
further tests and benchmarks.

As an example, after this patch, kernel functions will have a single nop
at function entry:
<kernel_clone>:
	addis	r2,r12,467
	addi	r2,r2,-16028
	nop
	mfocrf	r11,8
	...

When ftrace is enabled, the nop is converted to an unconditional branch
to the stub associated with that function:
<kernel_clone>:
	addis	r2,r12,467
	addi	r2,r2,-16028
	b	ftrace_ool_stub_text_end+0x11b28
	mfocrf	r11,8
	...

The associated stub:
<ftrace_ool_stub_text_end+0x11b28>:
	mflr	r0
	bl	ftrace_caller
	mtlr	r0
	b	kernel_clone+0xc
	...

This change showed an improvement of ~10% in null_syscall benchmark on a
Power 10 system with ftrace enabled.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes in v6:
* Redundant 'depends on PPC64' removed
* Added .gitignore for vmlinux.arch.S
* "$(CONFIG_64BIT)" & "$(OBJDUMP)" passed via commandline for
  arch/powerpc/tools/ftrace-gen-ool-stubs.sh
* Dropped redundant rule for $(obj)/vmlinux.arch.S
* Added vmlinux.arch.S to targets
* Shellcheck warnings fixed for arch/powerpc/tools/ftrace-gen-ool-stubs.sh


 arch/powerpc/Kbuild                        |   2 +-
 arch/powerpc/Kconfig                       |   4 +
 arch/powerpc/Makefile                      |   4 +
 arch/powerpc/include/asm/ftrace.h          |  11 ++
 arch/powerpc/include/asm/module.h          |   5 +
 arch/powerpc/kernel/asm-offsets.c          |   4 +
 arch/powerpc/kernel/module_64.c            |  58 +++++++-
 arch/powerpc/kernel/trace/ftrace.c         | 162 +++++++++++++++++++--
 arch/powerpc/kernel/trace/ftrace_entry.S   | 116 +++++++++++----
 arch/powerpc/tools/.gitignore              |   2 +
 arch/powerpc/tools/Makefile                |   9 ++
 arch/powerpc/tools/ftrace-gen-ool-stubs.sh |  41 ++++++
 12 files changed, 380 insertions(+), 38 deletions(-)
 create mode 100644 arch/powerpc/tools/.gitignore
 create mode 100644 arch/powerpc/tools/Makefile
 create mode 100755 arch/powerpc/tools/ftrace-gen-ool-stubs.sh

diff --git a/arch/powerpc/Kbuild b/arch/powerpc/Kbuild
index 571f260b0842..b010ccb071b6 100644
--- a/arch/powerpc/Kbuild
+++ b/arch/powerpc/Kbuild
@@ -19,4 +19,4 @@ obj-$(CONFIG_KEXEC_CORE)  += kexec/
 obj-$(CONFIG_KEXEC_FILE)  += purgatory/
 
 # for cleaning
-subdir- += boot
+subdir- += boot tools
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index bd1ca813e71c..26e3060e44f4 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -569,6 +569,10 @@ config ARCH_USING_PATCHABLE_FUNCTION_ENTRY
 	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh $(CC) -mlittle-endian) if PPC64 && CPU_LITTLE_ENDIAN
 	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh $(CC) -mbig-endian) if PPC64 && CPU_BIG_ENDIAN
 
+config PPC_FTRACE_OUT_OF_LINE
+	def_bool PPC64 && ARCH_USING_PATCHABLE_FUNCTION_ENTRY
+	select ARCH_WANTS_PRE_LINK_VMLINUX
+
 config HOTPLUG_CPU
 	bool "Support for enabling/disabling CPUs"
 	depends on SMP && (PPC_PSERIES || \
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index bbfe4a1f06ef..c973e6cd1ae8 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -155,7 +155,11 @@ CC_FLAGS_NO_FPU		:= $(call cc-option,-msoft-float)
 ifdef CONFIG_FUNCTION_TRACER
 ifdef CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY
 KBUILD_CPPFLAGS	+= -DCC_USING_PATCHABLE_FUNCTION_ENTRY
+ifdef CONFIG_PPC_FTRACE_OUT_OF_LINE
+CC_FLAGS_FTRACE := -fpatchable-function-entry=1
+else
 CC_FLAGS_FTRACE := -fpatchable-function-entry=2
+endif
 else
 CC_FLAGS_FTRACE := -pg
 ifdef CONFIG_MPROFILE_KERNEL
diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
index 278d4548e8f1..bdbafc668b20 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -24,6 +24,10 @@ unsigned long prepare_ftrace_return(unsigned long parent, unsigned long ip,
 struct module;
 struct dyn_ftrace;
 struct dyn_arch_ftrace {
+#ifdef CONFIG_PPC_FTRACE_OUT_OF_LINE
+	/* pointer to the associated out-of-line stub */
+	unsigned long ool_stub;
+#endif
 };
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
@@ -130,6 +134,13 @@ static inline u8 this_cpu_get_ftrace_enabled(void) { return 1; }
 
 #ifdef CONFIG_FUNCTION_TRACER
 extern unsigned int ftrace_tramp_text[], ftrace_tramp_init[];
+#ifdef CONFIG_PPC_FTRACE_OUT_OF_LINE
+struct ftrace_ool_stub {
+	u32	insn[4];
+};
+extern struct ftrace_ool_stub ftrace_ool_stub_text_end[], ftrace_ool_stub_inittext[];
+extern unsigned int ftrace_ool_stub_text_end_count, ftrace_ool_stub_inittext_count;
+#endif
 void ftrace_free_init_tramp(void);
 unsigned long ftrace_call_adjust(unsigned long addr);
 #else
diff --git a/arch/powerpc/include/asm/module.h b/arch/powerpc/include/asm/module.h
index 300c777cc307..9ee70a4a0fde 100644
--- a/arch/powerpc/include/asm/module.h
+++ b/arch/powerpc/include/asm/module.h
@@ -47,6 +47,11 @@ struct mod_arch_specific {
 #ifdef CONFIG_DYNAMIC_FTRACE
 	unsigned long tramp;
 	unsigned long tramp_regs;
+#ifdef CONFIG_PPC_FTRACE_OUT_OF_LINE
+	struct ftrace_ool_stub *ool_stubs;
+	unsigned int ool_stub_count;
+	unsigned int ool_stub_index;
+#endif
 #endif
 };
 
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 7b3feb6bc210..9f27ea489cd4 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -676,5 +676,9 @@ int main(void)
 	DEFINE(BPT_SIZE, BPT_SIZE);
 #endif
 
+#ifdef CONFIG_PPC_FTRACE_OUT_OF_LINE
+	DEFINE(FTRACE_OOL_STUB_SIZE, sizeof(struct ftrace_ool_stub));
+#endif
+
 	return 0;
 }
diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 1db88409bd95..6816e9967cab 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -205,7 +205,9 @@ static int relacmp(const void *_x, const void *_y)
 
 /* Get size of potential trampolines required. */
 static unsigned long get_stubs_size(const Elf64_Ehdr *hdr,
-				    const Elf64_Shdr *sechdrs)
+				    const Elf64_Shdr *sechdrs,
+				    char *secstrings,
+				    struct module *me)
 {
 	/* One extra reloc so it's always 0-addr terminated */
 	unsigned long relocs = 1;
@@ -244,6 +246,24 @@ static unsigned long get_stubs_size(const Elf64_Ehdr *hdr,
 	/* stubs for ftrace_caller and ftrace_regs_caller */
 	relocs += IS_ENABLED(CONFIG_DYNAMIC_FTRACE) + IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_REGS);
 
+#ifdef CONFIG_PPC_FTRACE_OUT_OF_LINE
+	/* stubs for the function tracer */
+	for (i = 1; i < hdr->e_shnum; i++) {
+		if (!strcmp(secstrings + sechdrs[i].sh_name, "__patchable_function_entries")) {
+			me->arch.ool_stub_count = sechdrs[i].sh_size / sizeof(unsigned long);
+			me->arch.ool_stub_index = 0;
+			relocs += roundup(me->arch.ool_stub_count * sizeof(struct ftrace_ool_stub),
+					  sizeof(struct ppc64_stub_entry)) /
+				  sizeof(struct ppc64_stub_entry);
+			break;
+		}
+	}
+	if (i == hdr->e_shnum) {
+		pr_err("%s: doesn't contain __patchable_function_entries.\n", me->name);
+		return -ENOEXEC;
+	}
+#endif
+
 	pr_debug("Looks like a total of %lu stubs, max\n", relocs);
 	return relocs * sizeof(struct ppc64_stub_entry);
 }
@@ -454,7 +474,7 @@ int module_frob_arch_sections(Elf64_Ehdr *hdr,
 #endif
 
 	/* Override the stubs size */
-	sechdrs[me->arch.stubs_section].sh_size = get_stubs_size(hdr, sechdrs);
+	sechdrs[me->arch.stubs_section].sh_size = get_stubs_size(hdr, sechdrs, secstrings, me);
 
 	return 0;
 }
@@ -1079,6 +1099,37 @@ int module_trampoline_target(struct module *mod, unsigned long addr,
 	return 0;
 }
 
+static int setup_ftrace_ool_stubs(const Elf64_Shdr *sechdrs, unsigned long addr, struct module *me)
+{
+#ifdef CONFIG_PPC_FTRACE_OUT_OF_LINE
+	unsigned int i, total_stubs, num_stubs;
+	struct ppc64_stub_entry *stub;
+
+	total_stubs = sechdrs[me->arch.stubs_section].sh_size / sizeof(*stub);
+	num_stubs = roundup(me->arch.ool_stub_count * sizeof(struct ftrace_ool_stub),
+			    sizeof(struct ppc64_stub_entry)) / sizeof(struct ppc64_stub_entry);
+
+	/* Find the next available entry */
+	stub = (void *)sechdrs[me->arch.stubs_section].sh_addr;
+	for (i = 0; stub_func_addr(stub[i].funcdata); i++)
+		if (WARN_ON(i >= total_stubs))
+			return -1;
+
+	if (WARN_ON(i + num_stubs > total_stubs))
+		return -1;
+
+	stub += i;
+	me->arch.ool_stubs = (struct ftrace_ool_stub *)stub;
+
+	/* reserve stubs */
+	for (i = 0; i < num_stubs; i++)
+		if (patch_u32((void *)&stub->funcdata, PPC_RAW_NOP()))
+			return -1;
+#endif
+
+	return 0;
+}
+
 int module_finalize_ftrace(struct module *mod, const Elf_Shdr *sechdrs)
 {
 	mod->arch.tramp = stub_for_addr(sechdrs,
@@ -1097,6 +1148,9 @@ int module_finalize_ftrace(struct module *mod, const Elf_Shdr *sechdrs)
 	if (!mod->arch.tramp)
 		return -ENOENT;
 
+	if (setup_ftrace_ool_stubs(sechdrs, mod->arch.tramp, mod))
+		return -ENOENT;
+
 	return 0;
 }
 #endif
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 719517265d39..1fee074388cc 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -37,7 +37,8 @@ unsigned long ftrace_call_adjust(unsigned long addr)
 	if (addr >= (unsigned long)__exittext_begin && addr < (unsigned long)__exittext_end)
 		return 0;
 
-	if (IS_ENABLED(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY))
+	if (IS_ENABLED(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY) &&
+	    !IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE))
 		addr += MCOUNT_INSN_SIZE;
 
 	return addr;
@@ -127,11 +128,25 @@ static unsigned long ftrace_lookup_module_stub(unsigned long ip, unsigned long a
 }
 #endif
 
+static unsigned long ftrace_get_ool_stub(struct dyn_ftrace *rec)
+{
+#ifdef CONFIG_PPC_FTRACE_OUT_OF_LINE
+	return rec->arch.ool_stub;
+#else
+	BUILD_BUG();
+#endif
+}
+
 static int ftrace_get_call_inst(struct dyn_ftrace *rec, unsigned long addr, ppc_inst_t *call_inst)
 {
-	unsigned long ip = rec->ip;
+	unsigned long ip;
 	unsigned long stub;
 
+	if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE))
+		ip = ftrace_get_ool_stub(rec) + MCOUNT_INSN_SIZE; /* second instruction in stub */
+	else
+		ip = rec->ip;
+
 	if (is_offset_in_branch_range(addr - ip))
 		/* Within range */
 		stub = addr;
@@ -142,7 +157,7 @@ static int ftrace_get_call_inst(struct dyn_ftrace *rec, unsigned long addr, ppc_
 		stub = ftrace_lookup_module_stub(ip, addr);
 
 	if (!stub) {
-		pr_err("0x%lx: No ftrace stubs reachable\n", ip);
+		pr_err("0x%lx (0x%lx): No ftrace stubs reachable\n", ip, rec->ip);
 		return -EINVAL;
 	}
 
@@ -150,6 +165,92 @@ static int ftrace_get_call_inst(struct dyn_ftrace *rec, unsigned long addr, ppc_
 	return 0;
 }
 
+static int ftrace_init_ool_stub(struct module *mod, struct dyn_ftrace *rec)
+{
+#ifdef CONFIG_PPC_FTRACE_OUT_OF_LINE
+	static int ool_stub_text_end_index, ool_stub_inittext_index;
+	int ret = 0, ool_stub_count, *ool_stub_index;
+	ppc_inst_t inst;
+	/*
+	 * See ftrace_entry.S if changing the below instruction sequence, as we rely on
+	 * decoding the last branch instruction here to recover the correct function ip.
+	 */
+	struct ftrace_ool_stub *ool_stub, ool_stub_template = {
+		.insn = {
+			PPC_RAW_MFLR(_R0),
+			PPC_RAW_NOP(),		/* bl ftrace_caller */
+			PPC_RAW_MTLR(_R0),
+			PPC_RAW_NOP()		/* b rec->ip + 4 */
+		}
+	};
+
+	WARN_ON(rec->arch.ool_stub);
+
+	if (is_kernel_inittext(rec->ip)) {
+		ool_stub = ftrace_ool_stub_inittext;
+		ool_stub_index = &ool_stub_inittext_index;
+		ool_stub_count = ftrace_ool_stub_inittext_count;
+	} else if (is_kernel_text(rec->ip)) {
+		ool_stub = ftrace_ool_stub_text_end;
+		ool_stub_index = &ool_stub_text_end_index;
+		ool_stub_count = ftrace_ool_stub_text_end_count;
+#ifdef CONFIG_MODULES
+	} else if (mod) {
+		ool_stub = mod->arch.ool_stubs;
+		ool_stub_index = &mod->arch.ool_stub_index;
+		ool_stub_count = mod->arch.ool_stub_count;
+#endif
+	} else {
+		return -EINVAL;
+	}
+
+	ool_stub += (*ool_stub_index)++;
+
+	if (WARN_ON(*ool_stub_index > ool_stub_count))
+		return -EINVAL;
+
+	if (!is_offset_in_branch_range((long)rec->ip - (long)&ool_stub->insn[0]) ||
+	    !is_offset_in_branch_range((long)(rec->ip + MCOUNT_INSN_SIZE) -
+				       (long)&ool_stub->insn[3])) {
+		pr_err("%s: ftrace ool stub out of range (%p -> %p).\n",
+					__func__, (void *)rec->ip, (void *)&ool_stub->insn[0]);
+		return -EINVAL;
+	}
+
+	rec->arch.ool_stub = (unsigned long)&ool_stub->insn[0];
+
+	/* bl ftrace_caller */
+	if (!mod)
+		ret = ftrace_get_call_inst(rec, (unsigned long)ftrace_caller, &inst);
+#ifdef CONFIG_MODULES
+	else
+		/*
+		 * We can't use ftrace_get_call_inst() since that uses
+		 * __module_text_address(rec->ip) to look up the module.
+		 * But, since the module is not fully formed at this stage,
+		 * the lookup fails. We know the target though, so generate
+		 * the branch inst directly.
+		 */
+		inst = ftrace_create_branch_inst(ftrace_get_ool_stub(rec) + MCOUNT_INSN_SIZE,
+						 mod->arch.tramp, 1);
+#endif
+	ool_stub_template.insn[1] = ppc_inst_val(inst);
+
+	/* b rec->ip + 4 */
+	if (!ret && create_branch(&inst, &ool_stub->insn[3], rec->ip + MCOUNT_INSN_SIZE, 0))
+		return -EINVAL;
+	ool_stub_template.insn[3] = ppc_inst_val(inst);
+
+	if (!ret)
+		ret = patch_instructions((u32 *)ool_stub, (u32 *)&ool_stub_template,
+					 sizeof(ool_stub_template), false);
+
+	return ret;
+#else /* !CONFIG_PPC_FTRACE_OUT_OF_LINE */
+	BUILD_BUG();
+#endif
+}
+
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
 int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr, unsigned long addr)
 {
@@ -162,18 +263,29 @@ int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr, unsigned
 int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 {
 	ppc_inst_t old, new;
-	int ret;
+	unsigned long ip = rec->ip;
+	int ret = 0;
 
 	/* This can only ever be called during module load */
-	if (WARN_ON(!IS_ENABLED(CONFIG_MODULES) || core_kernel_text(rec->ip)))
+	if (WARN_ON(!IS_ENABLED(CONFIG_MODULES) || core_kernel_text(ip)))
 		return -EINVAL;
 
 	old = ppc_inst(PPC_RAW_NOP());
-	ret = ftrace_get_call_inst(rec, addr, &new);
-	if (ret)
-		return ret;
+	if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE)) {
+		ip = ftrace_get_ool_stub(rec) + MCOUNT_INSN_SIZE; /* second instruction in stub */
+		ret = ftrace_get_call_inst(rec, (unsigned long)ftrace_caller, &old);
+	}
+
+	ret |= ftrace_get_call_inst(rec, addr, &new);
+
+	if (!ret)
+		ret = ftrace_modify_code(ip, old, new);
 
-	return ftrace_modify_code(rec->ip, old, new);
+	if (!ret && IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE))
+		ret = ftrace_modify_code(rec->ip, ppc_inst(PPC_RAW_NOP()),
+			 ppc_inst(PPC_RAW_BRANCH((long)ftrace_get_ool_stub(rec) - (long)rec->ip)));
+
+	return ret;
 }
 
 int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec, unsigned long addr)
@@ -206,6 +318,13 @@ void ftrace_replace_code(int enable)
 		new_addr = ftrace_get_addr_new(rec);
 		update = ftrace_update_record(rec, enable);
 
+		if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE) && update != FTRACE_UPDATE_IGNORE) {
+			ip = ftrace_get_ool_stub(rec) + MCOUNT_INSN_SIZE;
+			ret = ftrace_get_call_inst(rec, (unsigned long)ftrace_caller, &nop_inst);
+			if (ret)
+				goto out;
+		}
+
 		switch (update) {
 		case FTRACE_UPDATE_IGNORE:
 		default:
@@ -230,6 +349,24 @@ void ftrace_replace_code(int enable)
 
 		if (!ret)
 			ret = ftrace_modify_code(ip, old, new);
+
+		if (!ret && IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE) &&
+		    (update == FTRACE_UPDATE_MAKE_NOP || update == FTRACE_UPDATE_MAKE_CALL)) {
+			/* Update the actual ftrace location */
+			call_inst = ppc_inst(PPC_RAW_BRANCH((long)ftrace_get_ool_stub(rec) -
+							    (long)rec->ip));
+			nop_inst = ppc_inst(PPC_RAW_NOP());
+			ip = rec->ip;
+
+			if (update == FTRACE_UPDATE_MAKE_NOP)
+				ret = ftrace_modify_code(ip, call_inst, nop_inst);
+			else
+				ret = ftrace_modify_code(ip, nop_inst, call_inst);
+
+			if (ret)
+				goto out;
+		}
+
 		if (ret)
 			goto out;
 	}
@@ -249,7 +386,8 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
 	/* Verify instructions surrounding the ftrace location */
 	if (IS_ENABLED(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY)) {
 		/* Expect nops */
-		ret = ftrace_validate_inst(ip - 4, ppc_inst(PPC_RAW_NOP()));
+		if (!IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE))
+			ret = ftrace_validate_inst(ip - 4, ppc_inst(PPC_RAW_NOP()));
 		if (!ret)
 			ret = ftrace_validate_inst(ip, ppc_inst(PPC_RAW_NOP()));
 	} else if (IS_ENABLED(CONFIG_PPC32)) {
@@ -277,6 +415,10 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
 	if (ret)
 		return ret;
 
+	/* Set up out-of-line stub */
+	if (IS_ENABLED(CONFIG_PPC_FTRACE_OUT_OF_LINE))
+		return ftrace_init_ool_stub(mod, rec);
+
 	/* Nop-out the ftrace location */
 	new = ppc_inst(PPC_RAW_NOP());
 	addr = MCOUNT_ADDR;
diff --git a/arch/powerpc/kernel/trace/ftrace_entry.S b/arch/powerpc/kernel/trace/ftrace_entry.S
index 244a1c7bb1e8..5b2fc6483dce 100644
--- a/arch/powerpc/kernel/trace/ftrace_entry.S
+++ b/arch/powerpc/kernel/trace/ftrace_entry.S
@@ -56,7 +56,7 @@
 	SAVE_GPR(2, r1)
 	SAVE_GPRS(11, 31, r1)
 	.else
-#ifdef CONFIG_LIVEPATCH_64
+#if defined(CONFIG_LIVEPATCH_64) || defined(CONFIG_PPC_FTRACE_OUT_OF_LINE)
 	SAVE_GPR(14, r1)
 #endif
 	.endif
@@ -78,10 +78,6 @@
 
 	/* Get the _mcount() call site out of LR */
 	mflr	r7
-	/* Save it as pt_regs->nip */
-	PPC_STL	r7, _NIP(r1)
-	/* Also save it in B's stackframe header for proper unwind */
-	PPC_STL	r7, LRSAVE+SWITCH_FRAME_SIZE(r1)
 	/* Save the read LR in pt_regs->link */
 	PPC_STL	r0, _LINK(r1)
 
@@ -96,16 +92,6 @@
 	lwz	r5,function_trace_op@l(r3)
 #endif
 
-#ifdef CONFIG_LIVEPATCH_64
-	mr	r14, r7		/* remember old NIP */
-#endif
-
-	/* Calculate ip from nip-4 into r3 for call below */
-	subi    r3, r7, MCOUNT_INSN_SIZE
-
-	/* Put the original return address in r4 as parent_ip */
-	mr	r4, r0
-
 	/* Save special regs */
 	PPC_STL	r8, _MSR(r1)
 	.if \allregs == 1
@@ -114,17 +100,69 @@
 	PPC_STL	r11, _CCR(r1)
 	.endif
 
+#ifdef CONFIG_PPC_FTRACE_OUT_OF_LINE
+	/* Save our real return address in nvr for return */
+	.if \allregs == 0
+	SAVE_GPR(15, r1)
+	.endif
+	mr	r15, r7
+	/*
+	 * We want the ftrace location in the function, but our lr (in r7)
+	 * points at the 'mtlr r0' instruction in the out of line stub.  To
+	 * recover the ftrace location, we read the branch instruction in the
+	 * stub, and adjust our lr by the branch offset.
+	 *
+	 * See ftrace_init_ool_stub() for the profile sequence.
+	 */
+	lwz	r8, MCOUNT_INSN_SIZE(r7)
+	slwi	r8, r8, 6
+	srawi	r8, r8, 6
+	add	r3, r7, r8
+	/*
+	 * Override our nip to point past the branch in the original function.
+	 * This allows reliable stack trace and the ftrace stack tracer to work as-is.
+	 */
+	addi	r7, r3, MCOUNT_INSN_SIZE
+#else
+	/* Calculate ip from nip-4 into r3 for call below */
+	subi    r3, r7, MCOUNT_INSN_SIZE
+#endif
+
+	/* Save NIP as pt_regs->nip */
+	PPC_STL	r7, _NIP(r1)
+	/* Also save it in B's stackframe header for proper unwind */
+	PPC_STL	r7, LRSAVE+SWITCH_FRAME_SIZE(r1)
+#if defined(CONFIG_LIVEPATCH_64) || defined(CONFIG_PPC_FTRACE_OUT_OF_LINE)
+	mr	r14, r7		/* remember old NIP */
+#endif
+
+	/* Put the original return address in r4 as parent_ip */
+	mr	r4, r0
+
 	/* Load &pt_regs in r6 for call below */
 	addi    r6, r1, STACK_INT_FRAME_REGS
 .endm
 
 .macro	ftrace_regs_exit allregs
+#ifndef CONFIG_PPC_FTRACE_OUT_OF_LINE
 	/* Load ctr with the possibly modified NIP */
 	PPC_LL	r3, _NIP(r1)
 	mtctr	r3
 
 #ifdef CONFIG_LIVEPATCH_64
 	cmpd	r14, r3		/* has NIP been altered? */
+#endif
+#else /* !CONFIG_PPC_FTRACE_OUT_OF_LINE */
+	/* Load LR with the possibly modified NIP */
+	PPC_LL	r3, _NIP(r1)
+	cmpd	r14, r3		/* has NIP been altered? */
+	bne-	1f
+
+	mr	r3, r15
+	.if \allregs == 0
+	REST_GPR(15, r1)
+	.endif
+1:	mtlr	r3
 #endif
 
 	/* Restore gprs */
@@ -132,14 +170,16 @@
 	REST_GPRS(2, 31, r1)
 	.else
 	REST_GPRS(3, 10, r1)
-#ifdef CONFIG_LIVEPATCH_64
+#if defined(CONFIG_LIVEPATCH_64) || defined(CONFIG_PPC_FTRACE_OUT_OF_LINE)
 	REST_GPR(14, r1)
 #endif
 	.endif
 
 	/* Restore possibly modified LR */
 	PPC_LL	r0, _LINK(r1)
+#ifndef CONFIG_PPC_FTRACE_OUT_OF_LINE
 	mtlr	r0
+#endif
 
 #ifdef CONFIG_PPC64
 	/* Restore callee's TOC */
@@ -153,7 +193,16 @@
         /* Based on the cmpd above, if the NIP was altered handle livepatch */
 	bne-	livepatch_handler
 #endif
-	bctr			/* jump after _mcount site */
+	/* jump after _mcount site */
+#ifdef CONFIG_PPC_FTRACE_OUT_OF_LINE
+	/*
+	 * Return with blr to keep the link stack balanced. The function profiling sequence
+	 * uses 'mtlr r0' to restore LR.
+	 */
+	blr
+#else
+	bctr
+#endif
 .endm
 
 _GLOBAL(ftrace_regs_caller)
@@ -177,6 +226,11 @@ _GLOBAL(ftrace_stub)
 
 #ifdef CONFIG_PPC64
 ftrace_no_trace:
+#ifdef CONFIG_PPC_FTRACE_OUT_OF_LINE
+	REST_GPR(3, r1)
+	addi	r1, r1, SWITCH_FRAME_SIZE+STACK_FRAME_MIN_SIZE
+	blr
+#else
 	mflr	r3
 	mtctr	r3
 	REST_GPR(3, r1)
@@ -184,6 +238,7 @@ ftrace_no_trace:
 	mtlr	r0
 	bctr
 #endif
+#endif
 
 #ifdef CONFIG_LIVEPATCH_64
 	/*
@@ -194,11 +249,17 @@ ftrace_no_trace:
 	 * We get here when a function A, calls another function B, but B has
 	 * been live patched with a new function C.
 	 *
-	 * On entry:
-	 *  - we have no stack frame and can not allocate one
+	 * On entry, we have no stack frame and can not allocate one.
+	 *
+	 * With PPC_FTRACE_OUT_OF_LINE=n, on entry:
 	 *  - LR points back to the original caller (in A)
 	 *  - CTR holds the new NIP in C
 	 *  - r0, r11 & r12 are free
+	 *
+	 * With PPC_FTRACE_OUT_OF_LINE=y, on entry:
+	 *  - r0 points back to the original caller (in A)
+	 *  - LR holds the new NIP in C
+	 *  - r11 & r12 are free
 	 */
 livepatch_handler:
 	ld	r12, PACA_THREAD_INFO(r13)
@@ -208,18 +269,23 @@ livepatch_handler:
 	addi	r11, r11, 24
 	std	r11, TI_livepatch_sp(r12)
 
-	/* Save toc & real LR on livepatch stack */
-	std	r2,  -24(r11)
-	mflr	r12
-	std	r12, -16(r11)
-
 	/* Store stack end marker */
 	lis     r12, STACK_END_MAGIC@h
 	ori     r12, r12, STACK_END_MAGIC@l
 	std	r12, -8(r11)
 
-	/* Put ctr in r12 for global entry and branch there */
+	/* Save toc & real LR on livepatch stack */
+	std	r2,  -24(r11)
+#ifndef CONFIG_PPC_FTRACE_OUT_OF_LINE
+	mflr	r12
+	std	r12, -16(r11)
 	mfctr	r12
+#else
+	std	r0, -16(r11)
+	mflr	r12
+	/* Put ctr in r12 for global entry and branch there */
+	mtctr	r12
+#endif
 	bctrl
 
 	/*
diff --git a/arch/powerpc/tools/.gitignore b/arch/powerpc/tools/.gitignore
new file mode 100644
index 000000000000..ec380a14a09a
--- /dev/null
+++ b/arch/powerpc/tools/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+/vmlinux.arch.S
diff --git a/arch/powerpc/tools/Makefile b/arch/powerpc/tools/Makefile
new file mode 100644
index 000000000000..d2e7ecd5f46f
--- /dev/null
+++ b/arch/powerpc/tools/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+quiet_cmd_gen_ftrace_ool_stubs = GEN     $@
+      cmd_gen_ftrace_ool_stubs = $< "$(CONFIG_64BIT)" "$(OBJDUMP)" vmlinux.o $@
+
+$(obj)/vmlinux.arch.S: $(src)/ftrace-gen-ool-stubs.sh vmlinux.o FORCE
+	$(call if_changed,gen_ftrace_ool_stubs)
+
+targets += vmlinux.arch.S
diff --git a/arch/powerpc/tools/ftrace-gen-ool-stubs.sh b/arch/powerpc/tools/ftrace-gen-ool-stubs.sh
new file mode 100755
index 000000000000..96e1ca5803e4
--- /dev/null
+++ b/arch/powerpc/tools/ftrace-gen-ool-stubs.sh
@@ -0,0 +1,41 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+# Error out on error
+set -e
+
+is_64bit="$1"
+objdump="$2"
+vmlinux_o="$3"
+arch_vmlinux_S="$4"
+
+RELOCATION=R_PPC64_ADDR64
+if [ -z "$is_64bit" ]; then
+	RELOCATION=R_PPC_ADDR32
+fi
+
+num_ool_stubs_text=$($objdump -r -j __patchable_function_entries "$vmlinux_o" |
+		     grep -v ".init.text" | grep -c "$RELOCATION")
+num_ool_stubs_inittext=$($objdump -r -j __patchable_function_entries "$vmlinux_o" |
+			 grep ".init.text" | grep -c "$RELOCATION")
+
+cat > "$arch_vmlinux_S" <<EOF
+#include <asm/asm-offsets.h>
+#include <linux/linkage.h>
+
+.pushsection .tramp.ftrace.text,"aw"
+SYM_DATA(ftrace_ool_stub_text_end_count, .long $num_ool_stubs_text)
+
+SYM_CODE_START(ftrace_ool_stub_text_end)
+	.space $num_ool_stubs_text * FTRACE_OOL_STUB_SIZE
+SYM_CODE_END(ftrace_ool_stub_text_end)
+.popsection
+
+.pushsection .tramp.ftrace.init,"aw"
+SYM_DATA(ftrace_ool_stub_inittext_count, .long $num_ool_stubs_inittext)
+
+SYM_CODE_START(ftrace_ool_stub_inittext)
+	.space $num_ool_stubs_inittext * FTRACE_OOL_STUB_SIZE
+SYM_CODE_END(ftrace_ool_stub_inittext)
+.popsection
+EOF
-- 
2.47.0


