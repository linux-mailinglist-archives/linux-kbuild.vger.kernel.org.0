Return-Path: <linux-kbuild+bounces-13805-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2Kt2BrwMM2qI8wUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13805-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 23:08:12 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 693D969C796
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 23:08:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=rMryfd6S;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13805-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13805-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10DFD30B0822
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 21:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3B0D3F58EA;
	Wed, 17 Jun 2026 21:06:48 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB383F5BF0
	for <linux-kbuild@vger.kernel.org>; Wed, 17 Jun 2026 21:06:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781730408; cv=none; b=WFrKyiWoaC6DFe51YagAnNY7PwlS8CGrMzCUm/tfMdHhDTqi0DesfvGq551CiWvJNmoekZd6hWFqL4mKx80qgq+hQPSgIUxXJdrhURjTPq725pfzlrPDUiaYRmditBN8aCpDRQg7fl0G2/9mbI3oXiP6hsQfnkKLoch+oLVPge4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781730408; c=relaxed/simple;
	bh=KzDSYEAhtHzs/JhvwKGX8fU2rygPAcAohd8y7rguVKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oaLDZ+G7JYpJlrUhtjnbt7TUyJZ6AC+QdkeiM8gxIch6giIPW36jpeJdjqOc8yvdx8iujAYFu/H66PYf5uRbhUwSgbhuBtt2ETPM/4xARValLKiTEhiwnntYFxtVNhv7ERCL9xlC7yVI6QsB8fl5kqL56qgx+w92QEPE08D6i3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rMryfd6S; arc=none smtp.client-ip=95.215.58.187
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781730404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oUus/NjHPDhyTZTlZe7hDyng+JRh3uTWD5fSvIdu+lc=;
	b=rMryfd6SJp5npDTexUZusujGvj1Lq9WAs6reBaEs2Qw+NA4/vFst3vPdhSfcs0F+L/jLLO
	F7iNtVyme1q3SH2Y0D9leZWovFBi9utAXW5rk8mmktZVp5+1AhBiX3XpxFJT+6e6eRQuqv
	RsEvk9LJfZ4wcMUjKND4Bu2EH6ux1SE=
From: Ihor Solodrai <ihor.solodrai@linux.dev>
To: Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Alan Maguire <alan.maguire@oracle.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	bpf@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH bpf-next v1 3/4] selftests/bpf: Fix resolve_btfids test reads of BTF ID sets in PIE builds
Date: Wed, 17 Jun 2026 14:06:18 -0700
Message-ID: <20260617210619.1562858-4-ihor.solodrai@linux.dev>
In-Reply-To: <20260617210619.1562858-1-ihor.solodrai@linux.dev>
References: <20260617210619.1562858-1-ihor.solodrai@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13805-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ast@kernel.org,m:andrii@kernel.org,m:daniel@iogearbox.net,m:eddyz87@gmail.com,m:memxor@gmail.com,m:alan.maguire@oracle.com,m:jolsa@kernel.org,m:emil@etsalapatis.com,m:bpf@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,iogearbox.net,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ihor.solodrai@linux.dev,linux-kbuild@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ihor.solodrai@linux.dev,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[etsalapatis.com:email,sourceware.org:url,linux.dev:dkim,linux.dev:email,linux.dev:mid,linux.dev:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,gnu.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 693D969C796

TL;DR

On aarch64 with gcc toolchain, when test_progs is linked as a PIE,
reads of BTF ID array by C name return garbage because the GNU
assembler on aarch64 unconditionally folds .local symbol references
into section+addend form, and GOT slots cannot carry an addend per the
AArch64 ELF spec.

Fix by marking the test's BTF ID objects with hidden visibility, which
makes gcc emit a direct access that bypasses the GOT entirely.

Details below.

The subsequent patches adding kfunc checks to resolve_btfids test may
cause test failures on aarch64 / gcc-15:

  test_resolve_btfids:FAIL:kfunc_set_flags  actual 13 != expected 1
  test_resolve_btfids:FAIL:kfunc_set_cnt    actual 0  != expected 4

The test defines its BTF ID sets with the same macros as the kernel
and reads them back directly by C name (in the same way as the kernel
code does).

test_kfunc_set is a .local symbol emitted into .BTF_ids by inline asm
and declared to the compiler as a plain default-visibility
extern, that is:
    extern struct btf_id_set8 test_kfunc_set;

Depending on the build environment, test_progs may be linked as a
position-independent executable (for example, gcc defaults to -fpie
[1]). In a PIE, taking the address of a default-visibility extern is
routed through the GOT (Global Offset Table) [2].

The GNU assembler's adjust_reloc_syms() pass (gas/write.c [3])
replaces references to local symbols with the corresponding section
symbol, folding the symbol's offset into the relocation addend.  On
aarch64 this conversion is unconditional: tc_fix_adjustable() is
defined to 1 for all fixups (gas/config/tc-aarch64.h [4]), so even
GOT-generating relocations are subject to it.  The resulting object
file therefore contains:

  R_AARCH64_ADR_GOT_PAGE      .BTF_ids + 0x54
  R_AARCH64_LD64_GOT_LO12_NC  .BTF_ids + 0x54

However, the AArch64 ELF specification mandates that GOT-generating
relocations must have a zero addend [5].  The +0x54 is therefore not
honored: the linker creates a GOT slot pointing at the .BTF_ids base,
and every access through that slot reads offset 0 instead of 0x54.

This is purely a read-side problem, specific to the PIE test binary on
aarch64 with gcc toolchain. resolve_btfids patches the set header
correctly and the .BTF_ids bytes in test_progs are correct. vmlinux is
unaffected because it is built with -fno-PIE [6] and reaches .BTF_ids
with direct, addend-preserving relocations rather than the GOT. clang
is unaffected because LLVM's assembler retains the original symbol for
GOT relocations instead of converting to section+addend [7].

To mitigate this issue, mark the test's .local BTF ID objects
(test_list_local and test_set) hidden with a visibility pragma so that
gcc treats them as non-interposable and emits a direct access instead
of a GOT load. test_list_global is .globl, which the assembler does not
fold into section+addend, so it is left at default visibility. This
keeps the natural by-name access, works in both PIE and non-PIE builds,
and needs no change to the BTF_ID macros or resolve_btfids.

[1] https://gcc.gnu.org/onlinedocs/gnat_ugn/Position-Independent-Executable-PIE-Enabled-by-Default-on-Linux.html
[2] https://gcc.gnu.org/wiki/Visibility
[3] https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=gas/write.c#l922
[4] https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=gas/config/tc-aarch64.h#l279
[5] https://github.com/ARM-software/abi-aa/blob/main/aaelf64/aaelf64.rst#5733relocation-operations
[6] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Makefile?h=v7.1-rc6#n593
[7] https://github.com/llvm/llvm-project/blob/4b3bc46d1d794b8ed78b75ccd35a6cc30235bf31/llvm/lib/MC/ELFObjectWriter.cpp#L1213-L1224

Acked-by: Andrii Nakryiko <andrii@kernel.org>
Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>
Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
---
 .../selftests/bpf/prog_tests/resolve_btfids.c | 29 +++++++++++++++----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c b/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c
index e549780697c7..6bcadee50bb8 100644
--- a/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c
+++ b/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c
@@ -34,6 +34,24 @@ asm (
 ".balign 4, 0;                            \n"
 ".popsection;                             \n");
 
+/*
+ * test_list_local and test_set are .local symbols placed in .BTF_ids by
+ * inline asm, and are read here directly by C name. To the compiler they
+ * are plain, default-visibility extern objects.
+ *
+ * When test_progs is linked as a position-independent executable (PIE),
+ * taking the address of such an extern is routed through the GOT. The
+ * GNU assembler on aarch64 unconditionally converts references to .local
+ * symbols into section + addend form (".BTF_ids + <offset>"), but a GOT
+ * slot cannot carry an addend (the AArch64 ELF spec mandates zero), so
+ * the linker resolves it to the .BTF_ids base.
+ *
+ * Mark them hidden so the compiler treats them as non-interposable and
+ * emits a direct, addend-preserving PC-relative access instead of a GOT
+ * load, in both PIE and non-PIE builds. test_list_global is .globl and
+ * not affected, so it is left at default visibility.
+ */
+#pragma GCC visibility push(hidden)
 BTF_ID_LIST(test_list_local)
 BTF_ID_UNUSED
 BTF_ID(typedef, S)
@@ -43,24 +61,25 @@ BTF_ID(struct,  S)
 BTF_ID(union,   U)
 BTF_ID(func,    func)
 
-extern __u32 test_list_global[];
-BTF_ID_LIST_GLOBAL(test_list_global, 1)
-BTF_ID_UNUSED
+BTF_SET_START(test_set)
 BTF_ID(typedef, S)
 BTF_ID(typedef, T)
 BTF_ID(typedef, U)
 BTF_ID(struct,  S)
 BTF_ID(union,   U)
 BTF_ID(func,    func)
+BTF_SET_END(test_set)
+#pragma GCC visibility pop
 
-BTF_SET_START(test_set)
+extern __u32 test_list_global[];
+BTF_ID_LIST_GLOBAL(test_list_global, 1)
+BTF_ID_UNUSED
 BTF_ID(typedef, S)
 BTF_ID(typedef, T)
 BTF_ID(typedef, U)
 BTF_ID(struct,  S)
 BTF_ID(union,   U)
 BTF_ID(func,    func)
-BTF_SET_END(test_set)
 
 static int
 __resolve_symbol(struct btf *btf, int type_id)
-- 
2.54.0


