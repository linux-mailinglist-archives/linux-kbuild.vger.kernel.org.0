Return-Path: <linux-kbuild+bounces-8707-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F40B43094
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 05:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E549F1C204AD
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 03:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ADEB22E3F0;
	Thu,  4 Sep 2025 03:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MQ1wii6x"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47467227B95;
	Thu,  4 Sep 2025 03:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756957617; cv=none; b=gMdU/neYrJ34f1Y7/XKLr6/z5bi3v4krMLvwRTvqUeeWDQPkNXJyPosx+DO0x++cuqp4zwGo8mFw3d4VOT3uHrAjtdB2yZuw4fEUeADXm7QK5JgmuU5ttyxK7cdNx1xdtpqliWODVcSh65o/Aa11X9k4xlH3x5f1EMfC2VVKEsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756957617; c=relaxed/simple;
	bh=fAYAUBGJzo8b71uhoB5b/MGQo+Cci4aVf5GCY6U9+Og=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rw453e6whmIuS3oQNsnnT4ENy9MSNEoe2TKetTLZst2HthssYaONPlXhD+hIwpNrNQF14hH9nyA8Z9YwTtpCz6Yv9TB2G0QsNhpPUOBYLApoTMdlvQsCeyVOa2BZzTyMS6qZIIRIXJNMMh698M4h2ZWVn6/PoJ2zwe5qkOsfAr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MQ1wii6x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC035C4CEF9;
	Thu,  4 Sep 2025 03:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756957616;
	bh=fAYAUBGJzo8b71uhoB5b/MGQo+Cci4aVf5GCY6U9+Og=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MQ1wii6xQtLMVMyBk31+A/kBaQZrsWcYyRslt3wRiqrIgJwSD/vMPaXxjHvlXQ70q
	 woTlgLahuOMaNldVXWLhxv2VMw2yg/a+mZCFThs/9eKCSPvWWRfFrEOFKQtQiGkT8z
	 sktrp+AQAN1Pdu004OOJa/HLhNZSkHtv9w1bXPvGVrCtnMgPiKUnBGz3Xmyr8+3RmF
	 5LJR8DZfAIL+HlnYDABwGlNeuiP5F6UhvbusAD7TJS/CpsANxCtcciMaUcy11PtthN
	 xsT3PWpg8CJApz2ug6Z9Qhf11n7EK75u9A1C8Y5jXxW5j90q3cig/joCyV0pxelZI3
	 12GobLSRdOnrg==
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Ramon de C Valle <rcvalle@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 5/9] x86/cfi: Add "debug" option to "cfi=" bootparam
Date: Wed,  3 Sep 2025 20:46:44 -0700
Message-Id: <20250904034656.3670313-5-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904033217.it.414-kees@kernel.org>
References: <20250904033217.it.414-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4249; i=kees@kernel.org; h=from:subject; bh=fAYAUBGJzo8b71uhoB5b/MGQo+Cci4aVf5GCY6U9+Og=; b=owGbwMvMwCVmps19z/KJym7G02pJDBk7OYuNvPgOPD79OO+JnXXRp6Xu8nwx71xY93EVlCf3x 6bxXNvQUcrCIMbFICumyBJk5x7n4vG2Pdx9riLMHFYmkCEMXJwCMJGpYgy/2VR2/91myqOcFp/c 6yV1dvuyNcnb3k/h3Mb8pmgBG98MTYZ/Vv2fVK7qNr275O/OvuS9daCF9u2IlUJSrJ9OcjL0z+V mAwA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Add "debug" option for "cfi=" bootparam to get details on early CFI
initialization steps so future Kees can find breakage easier.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Peter Zijlstra <peterz@infradead.org>
---
 .../admin-guide/kernel-parameters.txt         |  1 +
 arch/x86/kernel/alternative.c                 | 23 +++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 8bbffbb334ab..c8337d0e6ba3 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -624,6 +624,7 @@
 			bhi:	  Enable register poisoning to stop speculation
 				  across FineIBT. (Disabled by default.)
 			warn:	  Do not enforce CFI checking: warn only.
+			debug:    Report CFI initialization details.
 
 	cgroup_disable=	[KNL] Disable a particular controller or optional feature
 			Format: {name of the controller(s) or feature(s) to disable}
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index d8f4ac95b4df..b311e31a9056 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -1177,6 +1177,7 @@ void __init_or_module apply_seal_endbr(s32 *start, s32 *end) { }
 #endif
 
 enum cfi_mode cfi_mode __ro_after_init = __CFI_DEFAULT;
+static bool cfi_debug __ro_after_init;
 
 #ifdef CONFIG_FINEIBT_BHI
 bool cfi_bhi __ro_after_init = false;
@@ -1259,6 +1260,8 @@ static __init int cfi_parse_cmdline(char *str)
 		} else if (!strcmp(str, "off")) {
 			cfi_mode = CFI_OFF;
 			cfi_rand = false;
+		} else if (!strcmp(str, "debug")) {
+			cfi_debug = true;
 		} else if (!strcmp(str, "kcfi")) {
 			cfi_mode = CFI_KCFI;
 		} else if (!strcmp(str, "fineibt")) {
@@ -1734,6 +1737,8 @@ static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
 	 * rewrite them. This disables all CFI. If this succeeds but any of the
 	 * later stages fails, we're without CFI.
 	 */
+	if (cfi_debug)
+		pr_info("CFI: disabling all indirect call checking\n");
 	ret = cfi_disable_callers(start_retpoline, end_retpoline);
 	if (ret)
 		goto err;
@@ -1744,14 +1749,23 @@ static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
 			cfi_bpf_hash = cfi_rehash(cfi_bpf_hash);
 			cfi_bpf_subprog_hash = cfi_rehash(cfi_bpf_subprog_hash);
 		}
+		if (cfi_debug)
+			pr_info("CFI: cfi_seed: 0x%08x\n", cfi_seed);
 
+		if (cfi_debug)
+			pr_info("CFI: rehashing all preambles\n");
 		ret = cfi_rand_preamble(start_cfi, end_cfi);
 		if (ret)
 			goto err;
 
+		if (cfi_debug)
+			pr_info("CFI: rehashing all indirect calls\n");
 		ret = cfi_rand_callers(start_retpoline, end_retpoline);
 		if (ret)
 			goto err;
+	} else {
+		if (cfi_debug)
+			pr_info("CFI: rehashing disabled\n");
 	}
 
 	switch (cfi_mode) {
@@ -1761,6 +1775,8 @@ static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
 		return;
 
 	case CFI_KCFI:
+		if (cfi_debug)
+			pr_info("CFI: enabling all indirect call checking\n");
 		ret = cfi_enable_callers(start_retpoline, end_retpoline);
 		if (ret)
 			goto err;
@@ -1771,17 +1787,23 @@ static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
 		return;
 
 	case CFI_FINEIBT:
+		if (cfi_debug)
+			pr_info("CFI: adding FineIBT to all preambles\n");
 		/* place the FineIBT preamble at func()-16 */
 		ret = cfi_rewrite_preamble(start_cfi, end_cfi);
 		if (ret)
 			goto err;
 
 		/* rewrite the callers to target func()-16 */
+		if (cfi_debug)
+			pr_info("CFI: rewriting indirect call sites to use FineIBT\n");
 		ret = cfi_rewrite_callers(start_retpoline, end_retpoline);
 		if (ret)
 			goto err;
 
 		/* now that nobody targets func()+0, remove ENDBR there */
+		if (cfi_debug)
+			pr_info("CFI: removing old endbr insns\n");
 		cfi_rewrite_endbr(start_cfi, end_cfi);
 
 		if (builtin) {
@@ -2324,6 +2346,7 @@ void __init alternative_instructions(void)
 
 	__apply_fineibt(__retpoline_sites, __retpoline_sites_end,
 			__cfi_sites, __cfi_sites_end, true);
+	cfi_debug = false;
 
 	/*
 	 * Rewrite the retpolines, must be done before alternatives since
-- 
2.34.1


