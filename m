Return-Path: <linux-kbuild+bounces-8702-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B8AB4308A
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 05:47:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07AF71C20431
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 03:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10DE62253FB;
	Thu,  4 Sep 2025 03:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WgQf/Pim"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EF019F127;
	Thu,  4 Sep 2025 03:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756957617; cv=none; b=liu3NMQGHqrhShXCxvszE2/Exgw5H6pN/1d5OOsrENw+AuHoI7xD+ejA/CeiebykcfmZkolfE4dO/0t1Z8tgHsfu068DJK04CGgMp1SKn7CSSTtJ+IzGtm7ouNF1TlAYap7EssuC3kDjJOqkIlXYypgR78lJCjG6kVQV+vXZe4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756957617; c=relaxed/simple;
	bh=d3lOLi68KOsHVuJ/f3j08zMj0QWctUjZ54+wY+NXD08=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L5PcTkGEAbwovUOcrhx7wGDvuyFGnWd0WJXTUEf+P2iBmB9GLxATfRAolgo720NIJn1MALawdE4Ps9iF5KR0ETxs2UVpLwm2gDXtupm+XgYFTZ9gUbEl8kzzf4RWkA/MYMgIhDJoC+V3g0tzRZwS4vIJbg9eZvaSnRSXNllYrTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WgQf/Pim; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 625BAC4CEF6;
	Thu,  4 Sep 2025 03:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756957616;
	bh=d3lOLi68KOsHVuJ/f3j08zMj0QWctUjZ54+wY+NXD08=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WgQf/PimBcqXFchHFFEXbGkt8CPsVDbpv3hGvURMfReygav6u5xf86AMUd5DROUP6
	 fNC3wlARQSAoXfliV/h+AXt/o27Ivu9RfomLqUxm0+VdkuU5Nzk11H6HAohoCpzy6+
	 rbIMn0HY71k68cSQtrjQFhE2gFUFMtMOqoB+wbFR4PEGbhPCzXNb7Z70z/EY6zc5Ax
	 /lamD6uEhHQoHb3eW9UsQ4Tfw8JaEvOKTNv+0rhHdZhj0LEt1u8h9DgOrUth8TLAEN
	 /g+wNzxYIDGe18HCyIQNPgM4YFUvb06pMfW7n/JpltZ4z4x7wDWtoBIKF/UcW/DEPt
	 1iJYogmhAdLDQ==
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Marco Elver <elver@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Ramon de C Valle <rcvalle@google.com>,
	llvm@lists.linux.dev,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Jonathan Corbet <corbet@lwn.net>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 1/9] compiler_types.h: Move __nocfi out of compiler-specific header
Date: Wed,  3 Sep 2025 20:46:40 -0700
Message-Id: <20250904034656.3670313-1-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904033217.it.414-kees@kernel.org>
References: <20250904033217.it.414-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1743; i=kees@kernel.org; h=from:subject; bh=d3lOLi68KOsHVuJ/f3j08zMj0QWctUjZ54+wY+NXD08=; b=owGbwMvMwCVmps19z/KJym7G02pJDBk7OYtuJi1qLixhqb860yLcbsEPyaa/uQe18+7JeZj9F RMXrm7sKGVhEONikBVTZAmyc49z8XjbHu4+VxFmDisTyBAGLk4BmMiSCIb/MfMWcC1u7nPcvDS9 tlDJtsX0xvJV3CKsf/eJimm8OfoxjZHhZYDFc4NVL3fzS9216vF/erDP5f6VnveKx15OPcOeoMn ADgA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for GCC KCFI support and move the __nocfi attribute from
compiler-clang.h to compiler_types.h. This was already gated by
CONFIG_CFI_CLANG, so this remains safe for non-KCFI GCC builds.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: Bill Wendling <morbo@google.com>
Cc: Justin Stitt <justinstitt@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: Marco Elver <elver@google.com>
Cc: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: Ramon de C Valle <rcvalle@google.com>
Cc: <llvm@lists.linux.dev>
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


