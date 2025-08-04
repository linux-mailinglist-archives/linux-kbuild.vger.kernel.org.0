Return-Path: <linux-kbuild+bounces-8291-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DD8B1A982
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Aug 2025 21:19:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51B591893D59
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Aug 2025 19:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7CBE28B7FF;
	Mon,  4 Aug 2025 19:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CPaNENT9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CD128B51A
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Aug 2025 19:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754335112; cv=none; b=jzsBDt3A3rtoW6cZZcgu8dbOLR6c4EIxCgDxLrvrKy49jdAyNaMwmobpJd06vGVgpOXZxRn2D+mKRN/WaLWjrBzU4SvJs5zIZiO9NuKut0Vna+xcUwubsNGMlwFnAwTBuGan0Q/a+CxyUlJs5IvCTgzrhpbfKMrwWKrpstwj0Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754335112; c=relaxed/simple;
	bh=y9lF2CD6zfkfZgvGaHoJ5qNs6uZl48FfUZ5qO9DoJ2o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZRLsvXy1e/tPaP5Xmh43QzIE7YVxxzYIocIzXV4qJ04y7y4QXJwwjS+HJSD7q8uSbn+26JtwFBScBcpDm/lGEjv/5L3MOY2CYzKmZ8S4MktLW7veKp2P9bHLTFtrnGFe0sIBe04NEYwnQ5iAGbB2yWH92My2UUcYZL7NQBt2rl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CPaNENT9; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-459d5ab32d1so20085e9.0
        for <linux-kbuild@vger.kernel.org>; Mon, 04 Aug 2025 12:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754335108; x=1754939908; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=toe9nuO+2sDqStO+Lp3ssNFV6aT9Bxci34jiczavffM=;
        b=CPaNENT9PU5tR3xLpHP57Oeef6DIOa3HnTSwx1DeMDfInukTydqCL61vaUT7dPhKVV
         Q7g/NjyEdbUYGj9DhFKJs9edEMA4P/xzC35IRRe95UC8991T1bmekZ3VfVa3mYQw4xnt
         t+PMgLIW5GS9LAFFzPZKjUEp/u2glddHWBi6NmBL3eWKU09HxRsjA2vDH6nrycln7N+B
         1VI3tPrru2s4R2KTjcg5f2Ruvq1CA4iR+SYW/7dHoeWqrxqTmwnSVJaXFBOe5BfoSZQc
         SNYJkRecq7xWx70pJwO1eHKEtTdGKRaY+/ddsPBBg+duqI94JL1eo9iwnVQsITcf3dOW
         ZebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754335108; x=1754939908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=toe9nuO+2sDqStO+Lp3ssNFV6aT9Bxci34jiczavffM=;
        b=P9mKnN3GOIvYVmnoBfsafQjkpng2B3fjJFz3z6wvlBwsYXEWZdSKWITuOUC+Y+Xt2P
         +Gd4vB1xLbzfnnigFUOZqyuGvWM94YjSr1N7B/yentk02HW2+Vjtdaerrf+vmvb+AwvV
         DOt1QCdmPXWMXKni4vnag+rTGG8hUhE5zLXfyRvcDdoHdnXhXWfM20sgdYLjqeXuNON6
         vfLhlA8Zp2fbNHQVRFFRV3J2Pz2Fl4dFiMI/EwYv8zMZ2kkYNJ+RKJBfDUTpsBvBR75a
         z3Y1T18xw7Lsz908P6ml8EoE2hZDzbOSGQU5HoZYMtZjHg2dfUsJw0fxRP94ZeyGYqU5
         PMww==
X-Gm-Message-State: AOJu0Yx2bvUFn0MDfORKSNiXKts9bS49IcF4YjZTju2DrWA9wo/vl3V1
	YW5Qb3O5vHE/cJKRLbtxY5muWOyBfsf9Jp10nsAipvwG11ML6sSfrZEaGJxZP974UA==
X-Gm-Gg: ASbGnct7+34QPzGG8QTF7P/NlNAsBpZtEQ0B02QTLuIR1/OudYwFXkFvIjmdC5tNvLT
	b14Qt8MM7GOBilEttqvktghqu1F8vyU/qn/4dkvCiPjq4KVMElj+z55/GAqcZl64+eY/vnRTLof
	9BdiDUa4iH9cUP4uvm/yhOkFFFK/gQUuaGZJq9+OP7R2qNOydeFWKcirj1toi1s9fKxADK+o0lC
	R8ieMd/TNDRgHXNv2bCjD6dLd48xHJQbrdEgZtbI5jWcdKCWmzwGkRd+R1vwIfABd4wwITkhcF1
	U6wkRprwcZ5QE99neBDhugVG1Be8ZfP2jGcsLicnL/D9TGrzPkrBGZG40U2Sz+lmUi1wvTuuMoO
	ygK3MFHpjRA==
X-Google-Smtp-Source: AGHT+IGAJUECbMrbVo4c54ajse1G4XDEXlZalnMUSUfJ5ZXLM1xpHCzJE1+uL/+URdEhqOpnIGDI3A==
X-Received: by 2002:a05:600c:a212:b0:453:79c3:91d6 with SMTP id 5b1f17b1804b1-459e15e6259mr86595e9.1.1754335108155;
        Mon, 04 Aug 2025 12:18:28 -0700 (PDT)
Received: from localhost ([2a00:79e0:9d:4:2069:2f99:1a0c:3fdd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-459dd85f423sm33348665e9.18.2025.08.04.12.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 12:18:27 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Mon, 04 Aug 2025 21:17:07 +0200
Subject: [PATCH early RFC 3/4] kasan: add support for running via KCSAN
 hooks
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250804-kasan-via-kcsan-v1-3-823a6d5b5f84@google.com>
References: <20250804-kasan-via-kcsan-v1-0-823a6d5b5f84@google.com>
In-Reply-To: <20250804-kasan-via-kcsan-v1-0-823a6d5b5f84@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Marco Elver <elver@google.com>, 
 Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Roman Gushchin <roman.gushchin@linux.dev>, 
 Harry Yoo <harry.yoo@oracle.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-mm@kvack.org, 
 Jann Horn <jannh@google.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754335100; l=10086;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=y9lF2CD6zfkfZgvGaHoJ5qNs6uZl48FfUZ5qO9DoJ2o=;
 b=YpEZ1lrDao+pTUdAML2s5r2iEEJOkeJ6f219/fzn6kEo/SpJLJ2GwRh4rGUp3e+41ekTkTWfp
 AJPeUtPm+r7BC3tfmqlv05iHKsUBIUTu9ax8GDhAWYWUtkm2aRP0kfA
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

Inserting ASAN and TSAN instrumentation at the same time is not
supported by gcc/clang, and so the kernel currently does not support
enabling KASAN (which uses ASAN) and KCSAN (which uses TSAN) at the same
time.
But luckily, the TSAN hooks provide a large part of what we get from ASAN
hooks; so it is possible to hook up KASAN indirectly through KCSAN.

There are some trade-offs with this - in particular:

 - Since OOB detection for stack and globals relies on ASAN-specific
   redzone creation in the compiler, it won't be available when using
   TSAN instrumentation (because the compiler thinks we only want
   instrumentation for catching UAF).
 - Unlike KASAN, KCSAN does not have instrumentation for functions like
   memcpy(), and this KASAN mode inherits this issue from KCSAN.
 - It makes it impossible to selectively disable KCSAN without also
   disabling KASAN, or the other way around. To be safe, this mode only
   enables KCSAN instrumentation in files in which both KASAN and KCSAN
   are allowed.
   (There are currently some places in the kernel that disable KASAN
   without disabling KCSAN - I think that's probably unintentional, and
   we might want to refactor that at some point such that either KASAN
   and KCSAN are enabled in the same files, or files covered by KCSAN
   are a subset of files covered by KASAN if that's somehow problematic.
   Opting out of every compiler instrumentation individually in makefiles
   seems suboptimal to me.)
 - I expect its performance to be significantly worse than normal KASAN,
   but have not tested that; performance is not really something I care
   about for my usecase.

NOTE: instrument_read() and such call both KASAN and KCSAN, so KASAN
will see duplicate accesses from instrument_read().

Signed-off-by: Jann Horn <jannh@google.com>
---
 include/linux/kasan.h   | 14 ++++++++++++++
 kernel/kcsan/core.c     | 13 +++++++++++++
 lib/Kconfig.kasan       | 17 +++++++++++++++++
 lib/Kconfig.kcsan       |  2 +-
 mm/kasan/kasan.h        | 11 -----------
 mm/kasan/kasan_test_c.c |  4 ++++
 mm/kasan/shadow.c       |  3 ++-
 scripts/Makefile.lib    |  6 +++++-
 8 files changed, 56 insertions(+), 14 deletions(-)

diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index 890011071f2b..818c53707e72 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -75,6 +75,20 @@ extern void kasan_enable_current(void);
 /* Disable reporting bugs for current task */
 extern void kasan_disable_current(void);
 
+/**
+ * kasan_check_range - Check memory region, and report if invalid access.
+ * @addr: the accessed address
+ * @size: the accessed size
+ * @write: true if access is a write access
+ * @ret_ip: return address
+ * @return: true if access was valid, false if invalid
+ *
+ * This function is intended for KASAN-internal use and for integration with
+ * KCSAN.
+ */
+bool kasan_check_range(const void *addr, size_t size, bool write,
+				unsigned long ret_ip);
+
 #else /* CONFIG_KASAN_GENERIC || CONFIG_KASAN_SW_TAGS */
 
 static inline int kasan_add_zero_shadow(void *start, unsigned long size)
diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c
index 8a7baf4e332e..aaa9bf0141a8 100644
--- a/kernel/kcsan/core.c
+++ b/kernel/kcsan/core.c
@@ -728,6 +728,19 @@ check_access(const volatile void *ptr, size_t size, int type, unsigned long ip)
 	if (unlikely(size == 0))
 		return;
 
+#ifdef CONFIG_KASAN_KCSAN
+	/*
+	 * Use the KCSAN infrastructure to inform KASAN about memory accesses.
+	 * Do this only for real memory access, not for KCSAN assertions - in
+	 * particular, SLUB makes KCSAN assertions that can cross into ASAN
+	 * redzones, which would KASAN think that an OOB access occurred.
+	 */
+	if ((type & KCSAN_ACCESS_ASSERT) == 0) {
+		kasan_check_range((const void *)ptr, size,
+				  (type & (KCSAN_ACCESS_WRITE|KCSAN_ACCESS_COMPOUND)) != 0, ip);
+	}
+#endif
+
 again:
 	/*
 	 * Avoid user_access_save in fast-path: find_watchpoint is safe without
diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
index f82889a830fa..0ee9f2196448 100644
--- a/lib/Kconfig.kasan
+++ b/lib/Kconfig.kasan
@@ -133,6 +133,7 @@ choice
 
 config KASAN_OUTLINE
 	bool "Outline instrumentation"
+	depends on !KCSAN
 	help
 	  Makes the compiler insert function calls that check whether the memory
 	  is accessible before each memory access. Slower than KASAN_INLINE, but
@@ -141,17 +142,33 @@ config KASAN_OUTLINE
 config KASAN_INLINE
 	bool "Inline instrumentation"
 	depends on !ARCH_DISABLE_KASAN_INLINE
+	depends on !KCSAN
 	help
 	  Makes the compiler directly insert memory accessibility checks before
 	  each memory access. Faster than KASAN_OUTLINE (gives ~x2 boost for
 	  some workloads), but makes the kernel's .text size much bigger.
 
+config KASAN_KCSAN
+	bool "Piggyback on KCSAN (EXPERIMENTAL)"
+	depends on KASAN_GENERIC
+	depends on KCSAN
+	help
+	  Let KASAN piggyback on KCSAN instrumentation callbacks instead of
+	  using KASAN-specific compiler instrumentation.
+
+	  This limits coverage of KASAN and KCSAN to files that are supported by
+	  *both* KASAN and KCSAN.
+
+	  This is only useful if you want to run both the KASAN and KCSAN
+	  subsystems at the same time.
+
 endchoice
 
 config KASAN_STACK
 	bool "Stack instrumentation (unsafe)" if CC_IS_CLANG && !COMPILE_TEST
 	depends on KASAN_GENERIC || KASAN_SW_TAGS
 	depends on !ARCH_DISABLE_KASAN_INLINE
+	depends on !KASAN_KCSAN
 	default y if CC_IS_GCC
 	help
 	  Disables stack instrumentation and thus KASAN's ability to detect
diff --git a/lib/Kconfig.kcsan b/lib/Kconfig.kcsan
index 609ddfc73de5..86bf8f2da0a8 100644
--- a/lib/Kconfig.kcsan
+++ b/lib/Kconfig.kcsan
@@ -13,7 +13,7 @@ config HAVE_KCSAN_COMPILER
 menuconfig KCSAN
 	bool "KCSAN: dynamic data race detector"
 	depends on HAVE_ARCH_KCSAN && HAVE_KCSAN_COMPILER
-	depends on DEBUG_KERNEL && !KASAN
+	depends on DEBUG_KERNEL
 	select CONSTRUCTORS
 	select STACKTRACE
 	help
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index 129178be5e64..ec191ff1fc83 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -335,17 +335,6 @@ static __always_inline bool addr_has_metadata(const void *addr)
 }
 #endif
 
-/**
- * kasan_check_range - Check memory region, and report if invalid access.
- * @addr: the accessed address
- * @size: the accessed size
- * @write: true if access is a write access
- * @ret_ip: return address
- * @return: true if access was valid, false if invalid
- */
-bool kasan_check_range(const void *addr, size_t size, bool write,
-				unsigned long ret_ip);
-
 #else /* CONFIG_KASAN_GENERIC || CONFIG_KASAN_SW_TAGS */
 
 static __always_inline bool addr_has_metadata(const void *addr)
diff --git a/mm/kasan/kasan_test_c.c b/mm/kasan/kasan_test_c.c
index 5f922dd38ffa..c4826c67aa33 100644
--- a/mm/kasan/kasan_test_c.c
+++ b/mm/kasan/kasan_test_c.c
@@ -154,6 +154,8 @@ static void kasan_test_exit(struct kunit *test)
 #define KASAN_TEST_NEEDS_CHECKED_MEMINTRINSICS(test) do {		\
 	if (IS_ENABLED(CONFIG_KASAN_HW_TAGS))				\
 		break;  /* No compiler instrumentation. */		\
+	if (IS_ENABLED(CONFIG_KASAN_KCSAN))				\
+		kunit_skip((test), "No checked mem*() with KCSAN");	\
 	if (IS_ENABLED(CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX))	\
 		break;  /* Should always be instrumented! */		\
 	if (IS_ENABLED(CONFIG_GENERIC_ENTRY))				\
@@ -1453,6 +1455,7 @@ static void kasan_global_oob_right(struct kunit *test)
 
 	/* Only generic mode instruments globals. */
 	KASAN_TEST_NEEDS_CONFIG_ON(test, CONFIG_KASAN_GENERIC);
+	KASAN_TEST_NEEDS_CONFIG_OFF(test, CONFIG_KASAN_KCSAN);
 
 	KUNIT_EXPECT_KASAN_FAIL(test, *(volatile char *)p);
 }
@@ -1468,6 +1471,7 @@ static void kasan_global_oob_left(struct kunit *test)
 	 */
 	KASAN_TEST_NEEDS_CONFIG_ON(test, CONFIG_CC_IS_CLANG);
 	KASAN_TEST_NEEDS_CONFIG_ON(test, CONFIG_KASAN_GENERIC);
+	KASAN_TEST_NEEDS_CONFIG_OFF(test, CONFIG_KASAN_KCSAN);
 	KUNIT_EXPECT_KASAN_FAIL(test, *(volatile char *)p);
 }
 
diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
index d2c70cd2afb1..136be8e6c98d 100644
--- a/mm/kasan/shadow.c
+++ b/mm/kasan/shadow.c
@@ -38,7 +38,8 @@ bool __kasan_check_write(const volatile void *p, unsigned int size)
 }
 EXPORT_SYMBOL(__kasan_check_write);
 
-#if !defined(CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX) && !defined(CONFIG_GENERIC_ENTRY)
+#if !defined(CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX) && \
+		!defined(CONFIG_GENERIC_ENTRY) && !defined(CONFIG_KASAN_KCSAN)
 /*
  * CONFIG_GENERIC_ENTRY relies on compiler emitted mem*() calls to not be
  * instrumented. KASAN enabled toolchains should emit __asan_mem*() functions
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 017c9801b6bb..2572fcc0bf50 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -56,10 +56,13 @@ is-kasan-compatible = $(patsubst n%,, \
 	$(KASAN_SANITIZE_$(target-stem).o)$(KASAN_SANITIZE)$(is-kernel-object))
 ifeq ($(CONFIG_KASAN),y)
 ifneq ($(CONFIG_KASAN_HW_TAGS),y)
+# Disable ASAN instrumentation if KASAN is running off the KCSAN hooks.
+ifneq ($(CONFIG_KASAN_KCSAN),y)
 _c_flags += $(if $(is-kasan-compatible), $(CFLAGS_KASAN), $(CFLAGS_KASAN_NOSANITIZE))
 _rust_flags += $(if $(is-kasan-compatible), $(RUSTFLAGS_KASAN))
 endif
 endif
+endif
 
 ifeq ($(CONFIG_KMSAN),y)
 _c_flags += $(if $(patsubst n%,, \
@@ -95,7 +98,8 @@ endif
 is-kcsan-compatible = $(patsubst n%,, \
 	$(KCSAN_SANITIZE_$(target-stem).o)$(KCSAN_SANITIZE)$(is-kernel-object))
 ifeq ($(CONFIG_KCSAN),y)
-_c_flags += $(if $(is-kcsan-compatible), $(CFLAGS_KCSAN))
+enable-kcsan-instr = $(and $(is-kcsan-compatible), $(if $(CONFIG_KASAN_KCSAN),$(is-kasan-compatible),y))
+_c_flags += $(if $(enable-kcsan-instr), $(CFLAGS_KCSAN))
 # Some uninstrumented files provide implied barriers required to avoid false
 # positives: set KCSAN_INSTRUMENT_BARRIERS for barrier instrumentation only.
 _c_flags += $(if $(patsubst n%,, \

-- 
2.50.1.565.gc32cd1483b-goog


