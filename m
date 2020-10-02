Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BCEF281E1B
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Oct 2020 00:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725780AbgJBWPg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 2 Oct 2020 18:15:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbgJBWPe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 2 Oct 2020 18:15:34 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 920E6C0613D0
        for <linux-kbuild@vger.kernel.org>; Fri,  2 Oct 2020 15:15:32 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id y14so1722184pgf.12
        for <linux-kbuild@vger.kernel.org>; Fri, 02 Oct 2020 15:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZbgeNKSFkQV6HyhEuVenlb7h0oRDKk8aNnzV1dp+u/c=;
        b=jxxjLAVhqgNV8pV6V+zph33zFLdgUf+5TWx4YYjqEojQm4I0eEVVBoM1H6Hp5FvfLC
         QYt82Esp0qBHXqXKM0Ax1a4r6Iik1ZtaxQhprJrY1fFkOiOVtoeTgRczHdsY/OgOI75P
         A9p1ol+7i5xnMeVnG4sek2DBQoZgTRm4BDBek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZbgeNKSFkQV6HyhEuVenlb7h0oRDKk8aNnzV1dp+u/c=;
        b=dir1jUmxZ7IM1Eqwnx591vA8ej3sZJhiv5SrYF8WYY+tWtPgt6JcxQhBnx5pP/PvSH
         Qw2Y/ESMDsp7aBWc6lusvJEknmi3BfIE4ECklJn1JrMMXBci9kGFt5PTS0TdIwPV3yH5
         a1Hemw6IPWD/wTdT8YWjCH/koq0yNMiqQmaXTj506YcQF7cSpmz4VPciGFzLPiSNys8A
         gU1p8454AfaQ2hdM71gyjyvhwN1IRBzjazTBo0/pFSoeUYu4UQ8DCFMCvGL/UnCUy6iM
         j8zhTTZctEbdTbhaQ8jFY4s1NwRkIZNwadvHi0Gd85a13tCyA2jW0hXo0lyHCiE41Pmd
         SArw==
X-Gm-Message-State: AOAM533ZUn1BryNkQVblXdpnvqdPJr4CApds36xtTQ0HaFfb09688hCo
        cTwuubaN3cKmoy3Mc1U4hQ3fng==
X-Google-Smtp-Source: ABdhPJwSla2mXu1bnKfnCi7nfqWrHkn3nEgEq/mYJgCSxqxrMOE9rx9AIP2Kdh7JzaQK5Mb0rgOzNQ==
X-Received: by 2002:a63:454f:: with SMTP id u15mr4144313pgk.198.1601676932082;
        Fri, 02 Oct 2020 15:15:32 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id j25sm3071266pfn.212.2020.10.02.15.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 15:15:29 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Marco Elver <elver@google.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        George Popescu <georgepope@android.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] ubsan: Move cc-option tests into Kconfig
Date:   Fri,  2 Oct 2020 15:15:24 -0700
Message-Id: <20201002221527.177500-2-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201002221527.177500-1-keescook@chromium.org>
References: <20201002221527.177500-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Instead of doing if/endif blocks with cc-option calls in the UBSAN
Makefile, move all the tests into Kconfig and use the Makefile to
collect the results.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/lkml/CAHk-=wjPasyJrDuwDnpHJS2TuQfExwe=px-SzLeN8GFMAQJPmQ@mail.gmail.com/
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 lib/Kconfig.ubsan      | 48 +++++++++++++++++++++++++++++++++++++++-
 scripts/Makefile.ubsan | 50 ++++++++++++++----------------------------
 2 files changed, 64 insertions(+), 34 deletions(-)

diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
index 58f8d03d037b..c0b801871e0b 100644
--- a/lib/Kconfig.ubsan
+++ b/lib/Kconfig.ubsan
@@ -36,10 +36,17 @@ config UBSAN_KCOV_BROKEN
 	  See https://bugs.llvm.org/show_bug.cgi?id=45831 for the status
 	  in newer releases.
 
+config CC_HAS_UBSAN_BOUNDS
+	def_bool $(cc-option,-fsanitize=bounds)
+
+config CC_HAS_UBSAN_ARRAY_BOUNDS
+	def_bool $(cc-option,-fsanitize=array-bounds)
+
 config UBSAN_BOUNDS
 	bool "Perform array index bounds checking"
 	default UBSAN
 	depends on !UBSAN_KCOV_BROKEN
+	depends on CC_HAS_UBSAN_ARRAY_BOUNDS || CC_HAS_UBSAN_BOUNDS
 	help
 	  This option enables detection of directly indexed out of bounds
 	  array accesses, where the array size is known at compile time.
@@ -47,11 +54,17 @@ config UBSAN_BOUNDS
 	  to the {str,mem}*cpy() family of functions (that is addressed
 	  by CONFIG_FORTIFY_SOURCE).
 
+config CC_ARG_UBSAN_BOUNDS
+	string
+	default "-fsanitize=array-bounds" if CC_HAS_UBSAN_ARRAY_BOUNDS
+	default "-fsanitize=bounds"
+	depends on UBSAN_BOUNDS
+
 config UBSAN_LOCAL_BOUNDS
 	bool "Perform array local bounds checking"
 	depends on UBSAN_TRAP
-	depends on CC_IS_CLANG
 	depends on !UBSAN_KCOV_BROKEN
+	depends on $(cc-option,-fsanitize=local-bounds)
 	help
 	  This option enables -fsanitize=local-bounds which traps when an
 	  exception/error is detected. Therefore, it should be enabled only
@@ -69,6 +82,38 @@ config UBSAN_MISC
 	  own Kconfig options. Disable this if you only want to have
 	  individually selected checks.
 
+config UBSAN_SHIFT
+	def_bool UBSAN_MISC
+	depends on $(cc-option,-fsanitize=shift)
+
+config UBSAN_DIV_ZERO
+	def_bool UBSAN_MISC
+	depends on $(cc-option,-fsanitize=integer-divide-by-zero)
+
+config UBSAN_UNREACHABLE
+	def_bool UBSAN_MISC
+	depends on $(cc-option,-fsanitize=unreachable)
+
+config UBSAN_SIGNED_OVERFLOW
+	def_bool UBSAN_MISC
+	depends on $(cc-option,-fsanitize=signed-integer-overflow)
+
+config UBSAN_UNSIGNED_OVERFLOW
+	def_bool UBSAN_MISC
+	depends on $(cc-option,-fsanitize=unsigned-integer-overflow)
+
+config UBSAN_OBJECT_SIZE
+	def_bool UBSAN_MISC
+	depends on $(cc-option,-fsanitize=object-size)
+
+config UBSAN_BOOL
+	def_bool UBSAN_MISC
+	depends on $(cc-option,-fsanitize=bool)
+
+config UBSAN_ENUM
+	def_bool UBSAN_MISC
+	depends on $(cc-option,-fsanitize=enum)
+
 config UBSAN_SANITIZE_ALL
 	bool "Enable instrumentation for the entire kernel"
 	depends on ARCH_HAS_UBSAN_SANITIZE_ALL
@@ -89,6 +134,7 @@ config UBSAN_ALIGNMENT
 	bool "Enable checks for pointers alignment"
 	default !HAVE_EFFICIENT_UNALIGNED_ACCESS
 	depends on !UBSAN_TRAP
+	depends on $(cc-option,-fsanitize=alignment)
 	help
 	  This option enables the check of unaligned memory accesses.
 	  Enabling this option on architectures that support unaligned
diff --git a/scripts/Makefile.ubsan b/scripts/Makefile.ubsan
index 9716dab06bc7..72862da47baf 100644
--- a/scripts/Makefile.ubsan
+++ b/scripts/Makefile.ubsan
@@ -1,37 +1,21 @@
 # SPDX-License-Identifier: GPL-2.0
 
-export CFLAGS_UBSAN :=
+# -fsanitize=* options makes GCC less smart than usual and
+# increases the number of 'maybe-uninitialized' false-positives.
+ubsan-cflags-$(CONFIG_UBSAN) += $(call cc-disable-warning, maybe-uninitialized)
 
-ifdef CONFIG_UBSAN_ALIGNMENT
-      CFLAGS_UBSAN += $(call cc-option, -fsanitize=alignment)
-endif
+# Enable available and selected UBSAN features.
+ubsan-cflags-$(CONFIG_UBSAN_ALIGNMENT)		+= -fsanitize=alignment
+ubsan-cflags-$(CONFIG_UBSAN_BOUNDS)		+= $(CONFIG_CC_ARG_UBSAN_BOUNDS)
+ubsan-cflags-$(CONFIG_UBSAN_LOCAL_BOUNDS)	+= -fsanitize=local-bounds
+ubsan-cflags-$(CONFIG_UBSAN_SHIFT)		+= -fsanitize=shift
+ubsan-cflags-$(CONFIG_UBSAN_DIV_ZERO)		+= -fsanitize=integer-divide-by-zero
+ubsan-cflags-$(CONFIG_UBSAN_UNREACHABLE)	+= -fsanitize=unreachable
+ubsan-cflags-$(CONFIG_UBSAN_SIGNED_OVERFLOW)	+= -fsanitize=signed-integer-overflow
+ubsan-cflags-$(CONFIG_UBSAN_UNSIGNED_OVERFLOW)	+= -fsanitize=unsigned-integer-overflow
+ubsan-cflags-$(CONFIG_UBSAN_OBJECT_SIZE)	+= -fsanitize=object-size
+ubsan-cflags-$(CONFIG_UBSAN_BOOL)		+= -fsanitize=bool
+ubsan-cflags-$(CONFIG_UBSAN_ENUM)		+= -fsanitize=enum
+ubsan-cflags-$(CONFIG_UBSAN_TRAP)		+= -fsanitize-undefined-trap-on-error
 
-ifdef CONFIG_UBSAN_BOUNDS
-      ifdef CONFIG_CC_IS_CLANG
-            CFLAGS_UBSAN += -fsanitize=array-bounds
-      else
-            CFLAGS_UBSAN += $(call cc-option, -fsanitize=bounds)
-      endif
-endif
-
-ifdef CONFIG_UBSAN_LOCAL_BOUNDS
-      CFLAGS_UBSAN += -fsanitize=local-bounds
-endif
-
-ifdef CONFIG_UBSAN_MISC
-      CFLAGS_UBSAN += $(call cc-option, -fsanitize=shift)
-      CFLAGS_UBSAN += $(call cc-option, -fsanitize=integer-divide-by-zero)
-      CFLAGS_UBSAN += $(call cc-option, -fsanitize=unreachable)
-      CFLAGS_UBSAN += $(call cc-option, -fsanitize=signed-integer-overflow)
-      CFLAGS_UBSAN += $(call cc-option, -fsanitize=object-size)
-      CFLAGS_UBSAN += $(call cc-option, -fsanitize=bool)
-      CFLAGS_UBSAN += $(call cc-option, -fsanitize=enum)
-endif
-
-ifdef CONFIG_UBSAN_TRAP
-      CFLAGS_UBSAN += $(call cc-option, -fsanitize-undefined-trap-on-error)
-endif
-
-      # -fsanitize=* options makes GCC less smart than usual and
-      # increase number of 'maybe-uninitialized false-positives
-      CFLAGS_UBSAN += $(call cc-option, -Wno-maybe-uninitialized)
+export CFLAGS_UBSAN := $(ubsan-cflags-y)
-- 
2.25.1

