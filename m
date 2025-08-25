Return-Path: <linux-kbuild+bounces-8571-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 720F6B343AB
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 16:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9371F18829CB
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 14:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F7102FCBE6;
	Mon, 25 Aug 2025 14:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pLBCL5Lm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2742FB982;
	Mon, 25 Aug 2025 14:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131964; cv=none; b=iBpb4ldwyasbnlokDemQhbxNeTQZEb0JktnMODdRb968OTt4CbPG0vdn15FWYwfGx5cXd4ubHGE02jB6Mio3hBBLaPVpA7gtfxhXEQw1k5ffH/2lc5CogtJzBMhiFd99fhCmGxidTW1kAuEIXTXbtrJT8cbZv25gtu1dxp/WzS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131964; c=relaxed/simple;
	bh=Sla/GNQ9pAAGrUEI5zQMMAiO+21DTDPiIwuUTYkcitE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lHGhIChAYt7rLttTdUcFKKoN5pYmmVFw6GUtxcvohkIi5pKXYSEI96FWhSpGbWFJ9r4cqiAdn+NjjCdXeTPDI1sNoKEampOJF4nVEBsudGk55Yb9f+d3kliL106IZ0nogRNdUDjGen2BQNnc2W0LUcXPDz10AbH23I0QjkczWuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pLBCL5Lm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AEA2C4CEF4;
	Mon, 25 Aug 2025 14:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756131963;
	bh=Sla/GNQ9pAAGrUEI5zQMMAiO+21DTDPiIwuUTYkcitE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pLBCL5LmhQPyqoqY1f6E3wEghXn6T6CCiDmYS6qt+GNFEkabqrkJTMUNAVeo62M+e
	 85A97g70Fe6SZFcPD8c/KkMc7d5WGpKstwfKegv24ribLMZJKCJWyZJbRqV7/X/LQj
	 KTNlzVf7wIpwFVGCMf8g/uXdk3s6VznZCcJeRWGF7ygEu31oLPRDNeYw8pczbtj66Z
	 SMxQpT57KBuUtsMrD2wiVcUkC22UmxkxpQuB0UUL/zHZNRIzrXcHxtwB50E/YpgdLq
	 pIxJCOS/+hH2fFWr1AVbW+3dYUxMClez490yXToCWxKYJ+cpqtNgCJdYLE0rsvIK/2
	 KfpqFSeJEw9ww==
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>,
	Kees Cook <kees@outflux.net>,
	Sami Tolvanen <samitolvanen@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	x86@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH 3/5] x86/cfi: Add option for cfi=debug bootparam
Date: Mon, 25 Aug 2025 07:25:50 -0700
Message-Id: <20250825142603.1907143-3-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250825141316.work.967-kees@kernel.org>
References: <20250825141316.work.967-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kees Cook <kees@outflux.net>

Add "debug" option for "cfi=" bootparam to get details on early CFI
initialization steps. Standardize CFI pr_info() lines to use "CFI:"
prefix. Standardize "CFI: Using ..." to always report which CFI mode is
being used, regardless of CONFIG_FINEIBT. Document all the "cfi=" options.

Signed-off-by: Kees Cook <kees@outflux.net>
---
 .../admin-guide/kernel-parameters.txt         | 18 +++++++++
 arch/x86/kernel/alternative.c                 | 39 +++++++++++++++----
 2 files changed, 50 insertions(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 747a55abf494..7b4bddb5a030 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -608,6 +608,24 @@
 	ccw_timeout_log	[S390]
 			See Documentation/arch/s390/common_io.rst for details.
 
+	cfi=		[X86-64] Set Control Flow Integrity checking features
+			when CONFIG_FINEIBT is enabled.
+			Format: feature[,feature...]
+			Default: auto
+
+			auto:	  Use FineIBT if IBT available, otherwise kCFI.
+				  Under FineIBT, enable "paranoid" mode when
+				  FRED is not available.
+			off:	  Turn off CFI checking.
+			kcfi:	  Use kCFI (disable FineIBT).
+			fineibt:  Use FineIBT (even if IBT not available).
+			norand:   Do not re-randomize CFI hashes.
+			paranoid: Add caller hash checking under FineIBT.
+			bhi:	  Enable register poisoning to stop speculation
+				  across FineIBT. (Disabled by default.)
+			warn:	  Do not enforce CFI checking: warn only.
+			debug:	  Report CFI initialization details.
+
 	cgroup_disable=	[KNL] Disable a particular controller or optional feature
 			Format: {name of the controller(s) or feature(s) to disable}
 			The effects of cgroup_disable=foo are:
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 7bde68247b5f..5d80ae77c042 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -1225,6 +1225,7 @@ int cfi_get_func_arity(void *func)
 
 static bool cfi_rand __ro_after_init = true;
 static u32  cfi_seed __ro_after_init;
+static bool cfi_debug __ro_after_init;
 
 /*
  * Re-hash the CFI hash with a boot-time seed while making sure the result is
@@ -1259,6 +1260,8 @@ static __init int cfi_parse_cmdline(char *str)
 		} else if (!strcmp(str, "off")) {
 			cfi_mode = CFI_OFF;
 			cfi_rand = false;
+		} else if (!strcmp(str, "debug")) {
+			cfi_debug = true;
 		} else if (!strcmp(str, "kcfi")) {
 			cfi_mode = CFI_KCFI;
 		} else if (!strcmp(str, "fineibt")) {
@@ -1266,26 +1269,26 @@ static __init int cfi_parse_cmdline(char *str)
 		} else if (!strcmp(str, "norand")) {
 			cfi_rand = false;
 		} else if (!strcmp(str, "warn")) {
-			pr_alert("CFI mismatch non-fatal!\n");
+			pr_alert("CFI: mismatch non-fatal!\n");
 			cfi_warn = true;
 		} else if (!strcmp(str, "paranoid")) {
 			if (cfi_mode == CFI_FINEIBT) {
 				cfi_paranoid = true;
 			} else {
-				pr_err("Ignoring paranoid; depends on fineibt.\n");
+				pr_err("CFI: ignoring paranoid; depends on fineibt.\n");
 			}
 		} else if (!strcmp(str, "bhi")) {
 #ifdef CONFIG_FINEIBT_BHI
 			if (cfi_mode == CFI_FINEIBT) {
 				cfi_bhi = true;
 			} else {
-				pr_err("Ignoring bhi; depends on fineibt.\n");
+				pr_err("CFI: ignoring bhi; depends on fineibt.\n");
 			}
 #else
-			pr_err("Ignoring bhi; depends on FINEIBT_BHI=y.\n");
+			pr_err("CFI: ignoring bhi; depends on FINEIBT_BHI=y.\n");
 #endif
 		} else {
-			pr_err("Ignoring unknown cfi option (%s).", str);
+			pr_err("CFI: Ignoring unknown option (%s).", str);
 		}
 
 		str = next;
@@ -1734,6 +1737,8 @@ static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
 	 * rewrite them. This disables all CFI. If this succeeds but any of the
 	 * later stages fails, we're without CFI.
 	 */
+	if (builtin && cfi_debug)
+		pr_info("CFI: disabling all indirect call checking\n");
 	ret = cfi_disable_callers(start_retpoline, end_retpoline);
 	if (ret)
 		goto err;
@@ -1744,43 +1749,61 @@ static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
 			cfi_bpf_hash = cfi_rehash(cfi_bpf_hash);
 			cfi_bpf_subprog_hash = cfi_rehash(cfi_bpf_subprog_hash);
 		}
+		if (builtin && cfi_debug)
+			pr_info("CFI: cfi_seed: 0x%08x\n", cfi_seed);
 
+		if (builtin && cfi_debug)
+			pr_info("CFI: rehashing all preambles\n");
 		ret = cfi_rand_preamble(start_cfi, end_cfi);
 		if (ret)
 			goto err;
 
+		if (builtin && cfi_debug)
+			pr_info("CFI: rehashing all indirect calls\n");
 		ret = cfi_rand_callers(start_retpoline, end_retpoline);
 		if (ret)
 			goto err;
+	} else {
+		if (builtin && cfi_debug)
+			pr_info("CFI: rehashing disabled\n");
 	}
 
 	switch (cfi_mode) {
 	case CFI_OFF:
 		if (builtin)
-			pr_info("Disabling CFI\n");
+			pr_info("CFI: disabled\n");
 		return;
 
 	case CFI_KCFI:
+		if (builtin && cfi_debug)
+			pr_info("CFI: enabling all indirect call checking\n");
 		ret = cfi_enable_callers(start_retpoline, end_retpoline);
 		if (ret)
 			goto err;
 
 		if (builtin)
-			pr_info("Using kCFI\n");
+			pr_info("CFI: Using %s kCFI\n",
+				cfi_rand ? "rehashed" : "retpoline");
 		return;
 
 	case CFI_FINEIBT:
+		if (builtin && cfi_debug)
+			pr_info("CFI: adding FineIBT to all preambles\n");
 		/* place the FineIBT preamble at func()-16 */
 		ret = cfi_rewrite_preamble(start_cfi, end_cfi);
 		if (ret)
 			goto err;
 
 		/* rewrite the callers to target func()-16 */
+		if (builtin && cfi_debug)
+			pr_info("CFI: rewriting indirect call sites to use FineIBT\n");
 		ret = cfi_rewrite_callers(start_retpoline, end_retpoline);
 		if (ret)
 			goto err;
 
 		/* now that nobody targets func()+0, remove ENDBR there */
+		if (builtin && cfi_debug)
+			pr_info("CFI: removing old endbr insns\n");
 		cfi_rewrite_endbr(start_cfi, end_cfi);
 
 		if (builtin) {
@@ -2005,6 +2028,8 @@ bool decode_fineibt_insn(struct pt_regs *regs, unsigned long *target, u32 *type)
 static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
 			    s32 *start_cfi, s32 *end_cfi, bool builtin)
 {
+	if (builtin)
+		pr_info("CFI: Using standard kCFI\n");
 }
 
 #ifdef CONFIG_X86_KERNEL_IBT
-- 
2.34.1


