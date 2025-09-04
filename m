Return-Path: <linux-kbuild+bounces-8710-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66352B43099
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 05:47:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7670AA00483
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 03:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93CF3233149;
	Thu,  4 Sep 2025 03:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K9kvhgem"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B0C229B2E;
	Thu,  4 Sep 2025 03:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756957617; cv=none; b=QI1EqpFjexLQkRsU5gwBVyjCNjPGVsZiOkuwyvh1K9/wAI9E/5nDQO2HXaDcclwJNA+DO0j92iZQFcn5hFsJpoXQ07mwam/iBORsqw25gnyIOoszQOn2lDGYcq8X/U6as7KO87QV8vg8YPlvrbNX9jj9Vit2BfWGtwLZcb8hLFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756957617; c=relaxed/simple;
	bh=9qnhoP2qHT9CRFXlDqVxSaXFtL9InbhntKhaSQiQx6M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FIKKrnfPKChg/GcxEPo7Sbi2XBZ3XEC0yxadHC7W8bkl6GJictQR7WF5qFXiLq4LrVeQyLp2Zr8cCDDN4vcOLezTVTjJuahmUeQayTERhoxBz9Grug4g30KL5dclk4HMBHKs9sMTWnJcGH/sBQnlVMElbH4PzQ8x1Vozo1N1BBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K9kvhgem; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB9D7C4CEF7;
	Thu,  4 Sep 2025 03:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756957616;
	bh=9qnhoP2qHT9CRFXlDqVxSaXFtL9InbhntKhaSQiQx6M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K9kvhgemZLc77NjaYChu+kfIy+lKgj4STMzZqVPEwORHSSWEBrXn4s28M0SnG4nxC
	 Wu3xHCZbZ/nUM6ZPODEIyL6cWsjx1VApf6RxkEsXzFjkDC/O/QWKXu4NuAEYF8B+S+
	 LgS9vE8UZc3doXOMiVJxVW5JgzTcEDFTlQN/Omyb40rAKUxim0AV5p2QywaxzuMJgK
	 +ii+sEYsQJHg74flff0DDp00tpDyiYnODBeLUR/4F02RivsopYizPEw1L5QZq2N6L2
	 h63pd+G8sOubOQudI/lcfUNufiNWH+cxJ07zDP3VSGFy4QXa0WAtP4Pf1FVDMkTelw
	 CSfXhtx0Foqkw==
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
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
Subject: [PATCH v2 6/9] x86/cfi: Remove __noinitretpoline and __noretpoline
Date: Wed,  3 Sep 2025 20:46:45 -0700
Message-Id: <20250904034656.3670313-6-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904033217.it.414-kees@kernel.org>
References: <20250904033217.it.414-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3285; i=kees@kernel.org; h=from:subject; bh=9qnhoP2qHT9CRFXlDqVxSaXFtL9InbhntKhaSQiQx6M=; b=owGbwMvMwCVmps19z/KJym7G02pJDBk7OUt2nPcJtw664XD+lmLHE+dcGSFbRbaJLz7YMDVtu tyzxmBCRykLgxgXg6yYIkuQnXuci8fb9nD3uYowc1iZQIYwcHEKwET0nzP8L1j/7tX/ua+naOr3 T560tb/6T7/W6pkx4g++H/nKwDxBmIfhf8lKDsddi5Lmigdk8W1S16msOXe4ZuO2SwsSBANvfSp bwQYA
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Commit 66f793099a63 ("x86/retpoline: Avoid retpolines for built-in __init
functions") disabled retpolines in __init sections (__noinitretpoline)
as a precaution against potential issues with retpolines in early boot,
but it has not been a problem in practice (i.e. see Clang below).

Commit 87358710c1fb ("x86/retpoline: Support retpoline builds with Clang")
narrowed this to only GCC, as Clang doesn't have per-function control
over retpoline emission. As such, Clang has been booting with retpolines
in __init since retpoline support was introduced.

Clang KCFI has been instrumenting __init since CFI was introduced.

With the introduction of KCFI for GCC, KCFI instrumentation with
retpolines disabled means that objtool does not construct .retpoline_sites
section entries for the non-retpoline KCFI calls. At boot, the KCFI
rehashing code, via __apply_fineibt(), misses all __init KCFI calls
(since they are not retpolines), resulting in immediate hash mismatches:
all preambles are rehashed (via .cfi_sites) and none of the __init call
sites are rehashed.

Remove __noinitretpoline since it provides no meaningful utility and
creates problems with CFI. Additionally remove __noretpoline since it
is now unused.

Alternatively, cfi_rand_callers() could walk the .kcfi_traps section which
is exactly the list of KCFI instrumentation sites. But it seems better to
have as few differences in common instruction sequences between compilers
as possible, so better to remove the special handling of retpolines in
__init for GCC.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>
---
 include/linux/compiler-gcc.h | 4 ----
 include/linux/init.h         | 8 --------
 2 files changed, 12 deletions(-)

diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
index 5d07c469b571..5de824a0b3d7 100644
--- a/include/linux/compiler-gcc.h
+++ b/include/linux/compiler-gcc.h
@@ -35,10 +35,6 @@
 	(typeof(ptr)) (__ptr + (off));					\
 })
 
-#ifdef CONFIG_MITIGATION_RETPOLINE
-#define __noretpoline __attribute__((__indirect_branch__("keep")))
-#endif
-
 #if defined(LATENT_ENTROPY_PLUGIN) && !defined(__CHECKER__)
 #define __latent_entropy __attribute__((latent_entropy))
 #endif
diff --git a/include/linux/init.h b/include/linux/init.h
index a60d32d227ee..17c1bc712e23 100644
--- a/include/linux/init.h
+++ b/include/linux/init.h
@@ -7,13 +7,6 @@
 #include <linux/stringify.h>
 #include <linux/types.h>
 
-/* Built-in __init functions needn't be compiled with retpoline */
-#if defined(__noretpoline) && !defined(MODULE)
-#define __noinitretpoline __noretpoline
-#else
-#define __noinitretpoline
-#endif
-
 /* These macros are used to mark some functions or 
  * initialized data (doesn't apply to uninitialized data)
  * as `initialization' functions. The kernel can take this
@@ -50,7 +43,6 @@
 /* These are for everybody (although not all archs will actually
    discard it in modules) */
 #define __init		__section(".init.text") __cold __latent_entropy	\
-						__noinitretpoline	\
 						__no_kstack_erase
 #define __initdata	__section(".init.data")
 #define __initconst	__section(".init.rodata")
-- 
2.34.1


