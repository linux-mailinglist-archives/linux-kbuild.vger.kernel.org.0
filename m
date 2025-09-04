Return-Path: <linux-kbuild+bounces-8708-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6A3B43096
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 05:47:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63DF6A0050C
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 03:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818CE230BEC;
	Thu,  4 Sep 2025 03:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MlnAoabs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47886227EB9;
	Thu,  4 Sep 2025 03:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756957617; cv=none; b=PD1ire6OUkQezpSYIc/ag91j4MsEuy7hiGHmyOLm6LOVmhKh5Q4whjJlrNT1OrCNCl9tBkhLWMGkjhL6qrDuJhCU3I5ABi0PW3VUjmX+uGshdFQKThQzTdAI4JsWBm4vPOj0A/EZ+Bd0toBM4xcZ6Wq6osNPiKhecOSW1YGb1E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756957617; c=relaxed/simple;
	bh=fZM4pUskzgVzzDbqpdGr74pYeEbdYleorCSgkPRkjPo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RXk6v+GNNZyzjceynnS2zqJNfCGRhKZSWRWZYW1SfCCEv3CgULRbt8CtwvaUdpfLPzIw4VFlEfqIxqRDda9vtGx2HPW+PzyshQM1zC2XysY82BFn0G8dSIJc6N+A0h0uBvY6J1UW8mNKl2Q+7twrdPUO8Cnd3qczvtL21cwNFFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MlnAoabs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F35AC4CEF8;
	Thu,  4 Sep 2025 03:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756957616;
	bh=fZM4pUskzgVzzDbqpdGr74pYeEbdYleorCSgkPRkjPo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MlnAoabsXDFgD+6GMVKhYGy490ebRIpVqlFFJafvlL4ISa9St9CrbCfmn4ifzaKP8
	 bX9ZGnDeiMZ9WVD74hcOBdalYxSesR/Y9E9Xp3fZUVaPSxEkYly/tS8sPOMzpqyamg
	 7ZHv5Lp3GL2zmaMDwclI3/cNq7KoLXqTKIynvUJeGCKg90SxQUiTnmFB39Hin5/IT3
	 zQnghkY80irwD/oWDUCf5PD59IuxNJmHwRDfk7+Ntr/3jMiSf0Y1EZQyhZ9V+rTbe8
	 IOFKkMm4JzBrzgo8BT4ZoAPLtu54jkDTYU9ucIiuUIpe+BFusthdcwzaJnimNmfjhR
	 fdeZ2DNVeIaVQ==
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
Subject: [PATCH v2 4/9] x86/cfi: Standardize on common "CFI:" prefix for CFI reports
Date: Wed,  3 Sep 2025 20:46:43 -0700
Message-Id: <20250904034656.3670313-4-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904033217.it.414-kees@kernel.org>
References: <20250904033217.it.414-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2513; i=kees@kernel.org; h=from:subject; bh=fZM4pUskzgVzzDbqpdGr74pYeEbdYleorCSgkPRkjPo=; b=owGbwMvMwCVmps19z/KJym7G02pJDBk7OYsz1+h4pN6YrHiFfYKc4nMzjk9TFqvsF3i0eLNp4 e85Dt13O0pZGMS4GGTFFFmC7NzjXDzetoe7z1WEmcPKBDKEgYtTACZi2Mjwm71UTUCCm2ldnMdv n4CjPns8o37m5s18lb9NMcX97cNHfQz/lC+c1Jm4xNF6WfbPZ38mljIdef+n5p3DY2Nr7cz783f e4AUA
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Use a regular "CFI:" prefix for CFI reports during alternatives setup,
including reporting when nothing has happened (i.e. CONFIG_FINEIBT=n).

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Peter Zijlstra <peterz@infradead.org>
---
 arch/x86/kernel/alternative.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 7bde68247b5f..d8f4ac95b4df 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -1266,26 +1266,26 @@ static __init int cfi_parse_cmdline(char *str)
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
@@ -1757,7 +1757,7 @@ static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
 	switch (cfi_mode) {
 	case CFI_OFF:
 		if (builtin)
-			pr_info("Disabling CFI\n");
+			pr_info("CFI: disabled\n");
 		return;
 
 	case CFI_KCFI:
@@ -1766,7 +1766,8 @@ static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
 			goto err;
 
 		if (builtin)
-			pr_info("Using kCFI\n");
+			pr_info("CFI: Using %sretpoline kCFI\n",
+				cfi_rand ? "rehashed " : "");
 		return;
 
 	case CFI_FINEIBT:
@@ -2005,6 +2006,8 @@ bool decode_fineibt_insn(struct pt_regs *regs, unsigned long *target, u32 *type)
 static void __apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
 			    s32 *start_cfi, s32 *end_cfi, bool builtin)
 {
+	if (IS_ENABLED(CONFIG_CFI) && builtin)
+		pr_info("CFI: Using standard kCFI\n");
 }
 
 #ifdef CONFIG_X86_KERNEL_IBT
-- 
2.34.1


