Return-Path: <linux-kbuild+bounces-13453-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YCw2H1cFHmpRggkAu9opvQ
	(envelope-from <linux-kbuild+bounces-13453-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 00:19:03 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 761E5625D92
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 00:19:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7D5933016815
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2026 22:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E4B4366570;
	Mon,  1 Jun 2026 22:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Oa8YvuDV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDC7356771
	for <linux-kbuild@vger.kernel.org>; Mon,  1 Jun 2026 22:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780352338; cv=none; b=i+hM0kStZiLujoEwwRU3k6IJMMMxQgOB9JrUqfrpWzP4BmQhLUx0WpEc+nodkz/ce6of7X1nlLC0P6UL1vdnson72rCN5fDbv9jqVWTZfdikGyv552mI+wQXsUZNMZ78Ajbz/IlErlTih2XGXzPNuIwYUdokQCQP+AJwoadhLsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780352338; c=relaxed/simple;
	bh=4uaPADVujjpNomkmWtUpz8VlUCzRuobImMycNwf4glY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ffm2E/blVFEcbF9dx9D66wFpm/t88Tsk6Qij6eWwjL2zw7Dbj8QRIGrrbhkjS+9AIzaTi/5/zqCkm7UwCnNn8psVtwt7yvYKUWK8y41hGIMKx5B1Qv0jekzEDW1lNmRFZ8eKaMwRVp+6HWSVZq/DVmko07R0MPdYvXssYMBZ3xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Oa8YvuDV; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780352333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MAKnitm9pUqdvxpV5Sesk3Hd/JLr1Nfy63v+k9yPNg4=;
	b=Oa8YvuDVMtBszLf4/FzMFXYZj1rBlrf52LtJhxp8ul6w2smI905Gx2DdAUSIB9zYtvBl8B
	HwVj3tF7+hiXrorvb/qCJrhhL5/JLAg7cDbDKgnAGBIk3sS4fqlxxUEuTtUx4RZySTkNG/
	XFEhyQjkf7xMRd+7madtnW0GqfsTDPI=
From: Ihor Solodrai <ihor.solodrai@linux.dev>
To: Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Alan Maguire <alan.maguire@oracle.com>,
	Jiri Olsa <jolsa@kernel.org>,
	bpf@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH bpf-next v1 03/14] selftests/bpf: Fix resolve_btfids test reads of BTF ID sets in PIE builds
Date: Mon,  1 Jun 2026 15:17:54 -0700
Message-ID: <20260601221805.821394-4-ihor.solodrai@linux.dev>
In-Reply-To: <20260601221805.821394-1-ihor.solodrai@linux.dev>
References: <20260601221805.821394-1-ihor.solodrai@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13453-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[kernel.org,iogearbox.net,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ihor.solodrai@linux.dev,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sourceware.org:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linux.dev:mid,linux.dev:dkim]
X-Rspamd-Queue-Id: 761E5625D92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

To mitigate this issue, mark the test's BTF ID objects hidden with a
visibility pragma so that gcc treats them as non-interposable and
emits a direct access instead of a GOT load. This keeps the natural
by-name access, works in both PIE and non-PIE builds, and needs no
change to the BTF_ID macros or resolve_btfids.

[1] https://gcc.gnu.org/onlinedocs/gnat_ugn/Position-Independent-Executable-PIE-Enabled-by-Default-on-Linux.html
[2] https://gcc.gnu.org/wiki/Visibility
[3] https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=gas/write.c#l922
[4] https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=gas/config/tc-aarch64.h#l279
[5] https://github.com/ARM-software/abi-aa/blob/main/aaelf64/aaelf64.rst#5733relocation-operations
[6] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Makefile?h=v7.1-rc6#n593
[7] https://github.com/llvm/llvm-project/blob/4b3bc46d1d794b8ed78b75ccd35a6cc30235bf31/llvm/lib/MC/ELFObjectWriter.cpp#L1213-L1224

---
---
 .../selftests/bpf/prog_tests/resolve_btfids.c  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c b/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c
index d742ecb2ca8e..d0e51979d455 100644
--- a/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c
+++ b/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c
@@ -32,6 +32,23 @@ asm (
 ".balign 4, 0;                            \n"
 ".popsection;                             \n");
 
+/*
+ * The BTF ID arrays below are .local symbols placed in .BTF_ids by
+ * inline asm, and are read here directly by C name. To the compiler
+ * they are plain, default-visibility extern objects.
+ *
+ * When test_progs is linked as a position-independent executable (PIE),
+ * taking the address of such an extern is routed through the GOT. The
+ * GNU assembler on aarch64 unconditionally converts references to
+ * .local symbols into section + addend form (".BTF_ids + <offset>"),
+ * but a GOT slot cannot carry an addend (the AArch64 ELF spec mandates
+ * zero), so the linker resolves it to the .BTF_ids base.
+ *
+ * Mark these symbols hidden so the compiler treats them as
+ * non-interposable and emits a direct, addend-preserving PC-relative
+ * access instead of a GOT load, in both PIE and non-PIE builds.
+ */
+#pragma GCC visibility push(hidden)
 BTF_ID_LIST(test_list_local)
 BTF_ID_UNUSED
 BTF_ID(typedef, S)
@@ -60,6 +77,7 @@ BTF_ID(union,   U)
 BTF_ID(func,    func)
 BTF_SET_END(test_set)
 
+#pragma GCC visibility pop
 static int
 __resolve_symbol(struct btf *btf, int type_id)
 {
-- 
2.54.0


