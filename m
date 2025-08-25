Return-Path: <linux-kbuild+bounces-8569-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2399BB343D1
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 16:31:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9328116A171
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Aug 2025 14:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FB5C2FC88A;
	Mon, 25 Aug 2025 14:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U3Amj5rS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1F72FB97D;
	Mon, 25 Aug 2025 14:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131964; cv=none; b=qDR81v2sBwjO8YT+TCgBSmaf5U/YSaohPJwzHLfqx6HVc3EWAZccxOU8uT4JSBAPuWF6O0oumVjc0FUavJ8STHJOqo12E770MeWTDUfAI+HedfBIAl8WWEgGMUE3E6rV3/S8tlJVSVcE3ylF0hR/Sy2U9YhtvSeC34DLyZCHdIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131964; c=relaxed/simple;
	bh=IfkCd4rfs8BX5W2yJlQjYBmDWGwc+WqMINKq0hNU9co=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pAFG/dAJ9wMymqR5MiYpiUW4TISDXel8ZjNOEo4TxVOSCoenwmD7V0KR5uRuFf2UfWQ41ldLRGZb9JjSQZ4roL9MUlDOx/GWDIIGcs37IpWjrHFoPO8/33kHkp/I1xDlT6+4fekE1V7fOI+2w/0u6rewQP+hTusaD7m3xqRjvwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U3Amj5rS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B565C113D0;
	Mon, 25 Aug 2025 14:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756131963;
	bh=IfkCd4rfs8BX5W2yJlQjYBmDWGwc+WqMINKq0hNU9co=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U3Amj5rSMmJyWVnF3T/eoAK/Nms1l3PXpUH86iGRHYo3YSFwmHaeB/aVkYA/uPeV1
	 1e7Tpig/n6h1ywnL+8FJks9HTlc4uMgWG6JvKkC8OR1SkiN3YVEMElL6/qY06ReHhs
	 OoEXCtt+SmQL07/18kl6FgH6PRpd+dF30bJjJyuluLB4XzkVZiFdeQW+0nDYhgZGCX
	 CLpbyr8FT5OAL6iJCqVseitwpMbApOxxWmsFqVGi1K74cHtJM7P5cZhSZAJCemF8ZT
	 4fkkyfoZ3AoWS0dyFOgIGFrQ1q1fRvGgsc3cLD+aFz1u1df4w6+dI8NSeMi05cZ3Fo
	 EUZWCroZF/vQg==
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
Subject: [PATCH 1/5] compiler_types.h: Move __nocfi out of compiler-specific header
Date: Mon, 25 Aug 2025 07:25:48 -0700
Message-Id: <20250825142603.1907143-1-kees@kernel.org>
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

Prepare for GCC KCFI support and move the __nocfi attribute from
compiler-clang.h to compiler_types.h. This was already effectively gated
by CONFIG_CFI_CLANG, so this remains safe for non-KCFI GCC builds.

Signed-off-by: Kees Cook <kees@outflux.net>
---
 include/linux/compiler-clang.h | 5 -----
 include/linux/compiler_types.h | 4 +++-
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/include/linux/compiler-clang.h b/include/linux/compiler-clang.h
index fa4ffe037bc7..7a4568e421dc 100644
--- a/include/linux/compiler-clang.h
+++ b/include/linux/compiler-clang.h
@@ -96,11 +96,6 @@
 # define __noscs	__attribute__((__no_sanitize__("shadow-call-stack")))
 #endif
 
-#if __has_feature(kcfi)
-/* Disable CFI checking inside a function. */
-#define __nocfi		__attribute__((__no_sanitize__("kcfi")))
-#endif
-
 /*
  * Turn individual warnings and errors on and off locally, depending
  * on version.
diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index 16755431fc11..a910f9fa5341 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -432,7 +432,9 @@ struct ftrace_likely_data {
 # define __noscs
 #endif
 
-#ifndef __nocfi
+#if defined(CONFIG_CFI_CLANG)
+# define __nocfi		__attribute__((__no_sanitize__("kcfi")))
+#else
 # define __nocfi
 #endif
 
-- 
2.34.1


