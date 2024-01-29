Return-Path: <linux-kbuild+bounces-715-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05323841186
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jan 2024 19:01:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBF821C24503
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jan 2024 18:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D17F715705F;
	Mon, 29 Jan 2024 18:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eVdL6wUQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA17C76043
	for <linux-kbuild@vger.kernel.org>; Mon, 29 Jan 2024 18:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706551253; cv=none; b=Y1fLWcyxwSHs6Ijj3PF2Y7ZzO6MxNB7M67z336Vc9sJBXtEi++i9WUiEw1OE/H60TXQIgdAJhECte26dD3Y22HdtIRGUdKi5/J+nzf2nfKvCZjHy+DCFQsywQ4oFbOAFgNLFQLQHvbUz+7ORs3K4YS6WtN7Thz/glL6LfzpuxNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706551253; c=relaxed/simple;
	bh=ChqR4pwLOMRrvI2mwMAhvrmBk7bFBrYJU+84/NDgMjc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s8UUq3laLIbVKz/AAebGKAmqDkI8wXxSJg/mzrk06WYos15ihVBIo7iYvbSqF7gz7LhW9uM5Im799JWp48R94vRXYhea0PNzJOhwTOKnWAhZHDi2OT6NzujKkOk1O/bJ1ucblPT7gTsxN/AHzclKxMWtCWAyWMlJPPvMTIEqu9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eVdL6wUQ; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2906bcae4feso1120305a91.3
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Jan 2024 10:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706551250; x=1707156050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZoPcgm2ExbWiklFnpgC7jG0zZ989QvpgVdI0GYP0N0=;
        b=eVdL6wUQn1OrJpjdli/1aJZg9sQIJTVlcOSwa8vWcj3jYynkilFbnin8s3lXHtE3wg
         lHTvnOZxXABCsUM5olGw7z7AgrbxHbndgBjcEvmZTmvs3/i9jecaglDPolVQfOxoUI/A
         j7Rpk4lKC3Wcmt8YjQLYwNzkmJoajH2u98Wp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706551250; x=1707156050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MZoPcgm2ExbWiklFnpgC7jG0zZ989QvpgVdI0GYP0N0=;
        b=QFyuoqZkpiywX0gsWdPKdLZRMXMIvz/Uy8vuEInya6ZzbtUOdVYGkoCYYfjzdV4sZY
         EExfv1poCtcpJXPXsNHZDchME4SCA8LnTAXorG2L9w7O5IHp7tWtBxtn6MjjPALpfBoe
         OrDQxhQnWsfPNywU3v0dfkEcg3HfzHIow6cAU5XfijztJCokp44EUS5T8urcYS2A/e5h
         BivcDNj3YaFd7m0Hm67pK2Mis66ALn2SgpB/ttpnmpB8wSiFHBHdhiDaFqe9Uu6EYryf
         X76jye7gnsFH4wP0ZtU+7B8/ta9PekX+xGX4VIt3che+sB5S4CZLgPdFn0Laeqg81+Ig
         Qj5g==
X-Gm-Message-State: AOJu0Yxtc6n4oojqWkGDThUmrkWI+whmwBc0bDLq3CxWMYQaTwYhXQgD
	l+vi3xwz1lbOR7T2PlteqnjLfkXnit4gr0yHmWg9D4YFuTH25izKbs7f5P/UcQ==
X-Google-Smtp-Source: AGHT+IFJF0hBnKPnC2NvGE/ASBC2G7DOqChpIyY5M1CvIMsaqLsisQe6MdkRA14bizZntAf3cxjpUA==
X-Received: by 2002:a17:90b:fd4:b0:294:bd32:6ddf with SMTP id gd20-20020a17090b0fd400b00294bd326ddfmr2604323pjb.38.1706551249916;
        Mon, 29 Jan 2024 10:00:49 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id c92-20020a17090a496500b0029102d936casm9508441pjh.47.2024.01.29.10.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 10:00:47 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Marco Elver <elver@google.com>
Cc: Kees Cook <keescook@chromium.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Justin Stitt <justinstitt@google.com>,
	Fangrui Song <maskray@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH 4/6] ubsan: Remove CONFIG_UBSAN_SANITIZE_ALL
Date: Mon, 29 Jan 2024 10:00:41 -0800
Message-Id: <20240129180046.3774731-4-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129175033.work.813-kees@kernel.org>
References: <20240129175033.work.813-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7713; i=keescook@chromium.org;
 h=from:subject; bh=ChqR4pwLOMRrvI2mwMAhvrmBk7bFBrYJU+84/NDgMjc=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlt+fKFqznRoc47f8x3QBqsx9X6BtCiDiZKmRIR
 0EaK8ZbstmJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZbfnygAKCRCJcvTf3G3A
 Jg4gEAChu+riNsR4c9zKObZSyCQUUAbASyVvN0lCOoFA0sP6wed+rAC2TyDu+UQ9leLyPsbImoA
 f5T1X+cih9rKYfmgsh4qZjlfZyKxDq8h7boBYb4ViPcPI6gjaK/nmcKd1p9D3kuQrosXQTOOBb0
 2A9JQAchDgi8bYBAUx4bbQDrE2PN9IlNfpNOOXIEbyMaLI2tXTmLSXkHsY7Dv0j57/D5LasGpXJ
 dnPe7wiyx7ScZiqIXARLDMEEUmRrjXoX8M79qvy6HFDxmn6DCcaOB6lDzjfYRZk+isVvloD+JsT
 aTi5iL9rwJ5QyukDAL2YcLpWdugTz6w1QDIQLTtMMiPoCxSzIQrWEquf9jvKZ4YIy8/zQxtO373
 24CyKH2XRFk2se/59wIyQrQEzaOK5LGmgKUhrLaXTTvvs2DISeeeQjyb0nmZsn9aI/nb+/1i8lM
 lMxAI6TWYY8qCyCmL+jrNeb9uxXrLKvk3jScplihgdGqY4K/5+vBbFOK1MCW96hJZy/gfzsXiJ0
 Jpy1pdy3hgyvKS+DJ967EltatLdjLYjIGBEPtG3Y6ERhC+8otnnJnwR5B6aZjyvVSX8rtD5Rfwz
 f2SLNwQcz+SJtiDV0bohAza2wbBe7E3/+4OpLDaTRaHYrr6RCKdJD2gXQwAFautWLmw5gYdanNc ZwzHb2t7GGez9gQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

For simplicity in splitting out UBSan options into separate rules,
remove CONFIG_UBSAN_SANITIZE_ALL, effectively defaulting to "y", which
is how it is generally used anyway. (There are no ":= y" cases beyond
where a specific file is enabled when a top-level ":= n" is in effect.)

Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Marco Elver <elver@google.com>
Cc: linux-doc@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Documentation/dev-tools/ubsan.rst | 28 ++++++++--------------------
 arch/arm/Kconfig                  |  2 +-
 arch/arm64/Kconfig                |  2 +-
 arch/mips/Kconfig                 |  2 +-
 arch/parisc/Kconfig               |  2 +-
 arch/powerpc/Kconfig              |  2 +-
 arch/riscv/Kconfig                |  2 +-
 arch/s390/Kconfig                 |  2 +-
 arch/x86/Kconfig                  |  2 +-
 lib/Kconfig.ubsan                 | 13 +------------
 scripts/Makefile.lib              |  2 +-
 11 files changed, 18 insertions(+), 41 deletions(-)

diff --git a/Documentation/dev-tools/ubsan.rst b/Documentation/dev-tools/ubsan.rst
index 2de7c63415da..e3591f8e9d5b 100644
--- a/Documentation/dev-tools/ubsan.rst
+++ b/Documentation/dev-tools/ubsan.rst
@@ -49,34 +49,22 @@ Report example
 Usage
 -----
 
-To enable UBSAN configure kernel with::
+To enable UBSAN, configure the kernel with::
 
-	CONFIG_UBSAN=y
+  CONFIG_UBSAN=y
 
-and to check the entire kernel::
-
-        CONFIG_UBSAN_SANITIZE_ALL=y
-
-To enable instrumentation for specific files or directories, add a line
-similar to the following to the respective kernel Makefile:
-
-- For a single file (e.g. main.o)::
-
-    UBSAN_SANITIZE_main.o := y
-
-- For all files in one directory::
-
-    UBSAN_SANITIZE := y
-
-To exclude files from being instrumented even if
-``CONFIG_UBSAN_SANITIZE_ALL=y``, use::
+To exclude files from being instrumented use::
 
   UBSAN_SANITIZE_main.o := n
 
-and::
+and to exclude all targets in one directory use::
 
   UBSAN_SANITIZE := n
 
+When disabled for all targets, specific files can be enabled using::
+
+  UBSAN_SANITIZE_main.o := y
+
 Detection of unaligned accesses controlled through the separate option -
 CONFIG_UBSAN_ALIGNMENT. It's off by default on architectures that support
 unaligned accesses (CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y). One could
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 0af6709570d1..287e62522064 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -29,7 +29,7 @@ config ARM
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG if CPU_V7 || CPU_V7M || CPU_V6K
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_KEEP_MEMBLOCK
-	select ARCH_HAS_UBSAN_SANITIZE_ALL
+	select ARCH_HAS_UBSAN
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT if CPU_V7
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index aa7c1d435139..78533d1b7f35 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -107,7 +107,7 @@ config ARM64
 	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_WANTS_NO_INSTR
 	select ARCH_WANTS_THP_SWAP if ARM64_4K_PAGES
-	select ARCH_HAS_UBSAN_SANITIZE_ALL
+	select ARCH_HAS_UBSAN
 	select ARM_AMBA
 	select ARM_ARCH_TIMER
 	select ARM_GIC
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 797ae590ebdb..9750ce3e40d5 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -14,7 +14,7 @@ config MIPS
 	select ARCH_HAS_STRNCPY_FROM_USER
 	select ARCH_HAS_STRNLEN_USER
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
-	select ARCH_HAS_UBSAN_SANITIZE_ALL
+	select ARCH_HAS_UBSAN
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_KEEP_MEMBLOCK
 	select ARCH_USE_BUILTIN_BSWAP
diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index d14ccc948a29..dbc9027ea2f4 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -12,7 +12,7 @@ config PARISC
 	select ARCH_HAS_ELF_RANDOMIZE
 	select ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_HAS_STRICT_MODULE_RWX
-	select ARCH_HAS_UBSAN_SANITIZE_ALL
+	select ARCH_HAS_UBSAN
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_NO_SG_CHAIN
 	select ARCH_SUPPORTS_HUGETLBFS if PA20
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index b9fc064d38d2..2065973e09d2 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -154,7 +154,7 @@ config PPC
 	select ARCH_HAS_SYSCALL_WRAPPER		if !SPU_BASE && !COMPAT
 	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UACCESS_FLUSHCACHE
-	select ARCH_HAS_UBSAN_SANITIZE_ALL
+	select ARCH_HAS_UBSAN
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select ARCH_KEEP_MEMBLOCK
 	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if PPC_RADIX_MMU
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bffbd869a068..d824d113a02d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -37,7 +37,7 @@ config RISCV
 	select ARCH_HAS_STRICT_MODULE_RWX if MMU && !XIP_KERNEL
 	select ARCH_HAS_SYSCALL_WRAPPER
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
-	select ARCH_HAS_UBSAN_SANITIZE_ALL
+	select ARCH_HAS_UBSAN
 	select ARCH_HAS_VDSO_DATA
 	select ARCH_KEEP_MEMBLOCK if ACPI
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index fe565f3a3a91..97dd25521617 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -82,7 +82,7 @@ config S390
 	select ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_HAS_STRICT_MODULE_RWX
 	select ARCH_HAS_SYSCALL_WRAPPER
-	select ARCH_HAS_UBSAN_SANITIZE_ALL
+	select ARCH_HAS_UBSAN
 	select ARCH_HAS_VDSO_DATA
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select ARCH_INLINE_READ_LOCK
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 5edec175b9bf..1c4c326a3640 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -100,7 +100,7 @@ config X86
 	select ARCH_HAS_STRICT_MODULE_RWX
 	select ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
 	select ARCH_HAS_SYSCALL_WRAPPER
-	select ARCH_HAS_UBSAN_SANITIZE_ALL
+	select ARCH_HAS_UBSAN
 	select ARCH_HAS_DEBUG_WX
 	select ARCH_HAS_ZONE_DMA_SET if EXPERT
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
index 04222a6d7fd9..0611120036eb 100644
--- a/lib/Kconfig.ubsan
+++ b/lib/Kconfig.ubsan
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config ARCH_HAS_UBSAN_SANITIZE_ALL
+config ARCH_HAS_UBSAN
 	bool
 
 menuconfig UBSAN
@@ -169,17 +169,6 @@ config UBSAN_ALIGNMENT
 	  Enabling this option on architectures that support unaligned
 	  accesses may produce a lot of false positives.
 
-config UBSAN_SANITIZE_ALL
-	bool "Enable instrumentation for the entire kernel"
-	depends on ARCH_HAS_UBSAN_SANITIZE_ALL
-	default y
-	help
-	  This option activates instrumentation for the entire kernel.
-	  If you don't enable this option, you have to explicitly specify
-	  UBSAN_SANITIZE := y for the files/directories you want to check for UB.
-	  Enabling this option will get kernel image size increased
-	  significantly.
-
 config TEST_UBSAN
 	tristate "Module for testing for undefined behavior detection"
 	depends on m
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index cd5b181060f1..52efc520ae4f 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -175,7 +175,7 @@ endif
 
 ifeq ($(CONFIG_UBSAN),y)
 _c_flags += $(if $(patsubst n%,, \
-		$(UBSAN_SANITIZE_$(basetarget).o)$(UBSAN_SANITIZE)$(CONFIG_UBSAN_SANITIZE_ALL)), \
+		$(UBSAN_SANITIZE_$(basetarget).o)$(UBSAN_SANITIZE)y), \
 		$(CFLAGS_UBSAN))
 endif
 
-- 
2.34.1


