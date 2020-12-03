Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CBA42CCB25
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Dec 2020 01:47:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727179AbgLCApf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Dec 2020 19:45:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgLCApa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Dec 2020 19:45:30 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B41D5C061A47
        for <linux-kbuild@vger.kernel.org>; Wed,  2 Dec 2020 16:44:49 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id b23so166134pls.11
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Dec 2020 16:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4mF58RYpIRG7fPZoiTOvLhS/VFugc/ZHEabEBpUkj84=;
        b=Tiwu9KphWULhR4iRZiPZXb2JBsC00BpNWVfUXY8k7af0ucipf0sSge1YTtmxVBZvYY
         EiiuOlUxKP9GyWwRTVwmcTh8OgeGMHSrFvp53uVAIj6iRd7CmsRawSstRYvCzYWllnev
         Mzc5P8GRwPxBxjnPWDxEKndrmiconuJSC/o0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4mF58RYpIRG7fPZoiTOvLhS/VFugc/ZHEabEBpUkj84=;
        b=hYoicjP//DIAmodXV5906/SChHskuZrlVuDIPOlgBARxBqBmp/tD4Vfo/9V0RsN71R
         cLmDh2FgS+CrzloO0QwMcB/aB/s3x0MmQAE50yqsVw5wk2hDNb5lXKtq+P/BK/ideUu+
         9J2qMDEZUsC0LJuxG3jF/roiDPKwAt1nSmg33XzYlRWd5bU3Rn20kdQ4+PTMQmvQlPx+
         lrti/bdaRdfFwtvEx57rV3H1OINqfkSZeoG6B4VwtwlIj9l1XvMLIHK9LexIvjJ9zv95
         D2hFIzU86EQoGuEv0pb05ua44n4JzgPEJeUelzFn3WlisgzE1Nx9XZE12MFjEEBzgRC4
         mRpA==
X-Gm-Message-State: AOAM531rMd6ngyH7l3AZcKUht+l/A2qxE1eCC7s6+U0Gm3EIhmVOKE46
        m7LnxF5VIJbVn7cMTYN3zyz5Xg==
X-Google-Smtp-Source: ABdhPJweuwwektM2cxwa327VLzhoUoNGxVbyWLmAsQzy++7Jk0gw1HWK6NgmumXCIN8zue+S51HzEA==
X-Received: by 2002:a17:902:26f:b029:d9:f9dc:e2db with SMTP id 102-20020a170902026fb02900d9f9dce2dbmr719428plc.65.1606956288968;
        Wed, 02 Dec 2020 16:44:48 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a81sm224989pfd.178.2020.12.02.16.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 16:44:46 -0800 (PST)
From:   Kees Cook <keescook@chromium.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
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
Subject: [PATCH v2 2/7] ubsan: Move cc-option tests into Kconfig
Date:   Wed,  2 Dec 2020 16:44:32 -0800
Message-Id: <20201203004437.389959-3-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201203004437.389959-1-keescook@chromium.org>
References: <20201203004437.389959-1-keescook@chromium.org>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; g=23601034a948399652856e383ce3b9baabd734cb; i=1TQY5Z7nukcRSTlMqgOgFhdwdnp7eQleiAAeYfV7E8U=; m=olsT5dGDBAih2Gr5eudSRiOFe9OaxbgoUVU4R/ZLtgM=; p=eVrpb0BFWCi/Oj2Iv4KBoX7jRJwE291OHoHKFNJZ4eY=
X-Patch-Sig: m=pgp; i=keescook@chromium.org; s=0x0x8972F4DFDC6DC026; b=iQIzBAABCgAdFiEEpcP2jyKd1g9yPm4TiXL039xtwCYFAl/INPMACgkQiXL039xtwCY/bQ/8DV3 0y2AKRc4TPksw0LQDrOqk39XV9Fu94KJk2jOQ3zx8POuqGHo4pKShuPf6VsGAAn5asA3tdNEI2TeX 5qPo/ahYc1HX5WZ5CwZpXiz4ldk3xKXDwaO8BC4MfljKyG6tsNagiKpYAfAafddx+9/n6tM1fTGh9 cPPG4DeOLiHznSlROZpFMaQN/az/Mpixwvih8A554oxEzJE0FM/nkHxruC3bkRhf0GV2UtsYRE5Zs uYnDGHm42c3iuntA9u9W9R16cpwBzkLsxSvMmRFVktF7Tn8o1RGYEiH5QLDplqgR74rFk8gSfxaYn fOnWZaYKvztDBxss/eHcBh9+Jceft2Jfcn/TxNJAGCFdclyXfHC9zxYIy+g0RtqVqr9NVmTe/PBVr YsfeP7Jb5pw/fiN9k/Z/pYIzQJqrnu09ey6pyfvv0ehhFIB0LIzXCr+C4CvzmnZXhdrD8j4HnyJ8S aiDS014u1AWuaqX2DLdbZUka4xsQYqg/kvDC6hYFE2mU0MuByE9MIQh7i/oNSydYTyLP3L3dHj91C 2ZOSWrCpFhubPN4JUQmXP3cJOB4YtEKuhy6SGQPd5k1qinA4bAl9BgKRWj2a3tj3AbA7U/rbhAsvq BS4axf3aYIn4CI+TdG1xgOmM6ELNxTeaN77Ib+WjJW34KYOhMRWtfOP3zoL91gVU=
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Instead of doing if/endif blocks with cc-option calls in the UBSAN
Makefile, move all the tests into Kconfig and use the Makefile to
collect the results.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/lkml/CAHk-=wjPasyJrDuwDnpHJS2TuQfExwe=px-SzLeN8GFMAQJPmQ@mail.gmail.com/
Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 lib/Kconfig.ubsan      | 61 +++++++++++++++++++++++++++++++++++++++---
 scripts/Makefile.ubsan | 45 +++++++++++--------------------
 2 files changed, 73 insertions(+), 33 deletions(-)

diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
index d8d4d6557b80..05147112b355 100644
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
@@ -47,15 +54,30 @@ config UBSAN_BOUNDS
 	  to the {str,mem}*cpy() family of functions (that is addressed
 	  by CONFIG_FORTIFY_SOURCE).
 
+config UBSAN_ONLY_BOUNDS
+	def_bool CC_HAS_UBSAN_BOUNDS && !CC_HAS_UBSAN_ARRAY_BOUNDS
+	depends on UBSAN_BOUNDS
+	help
+	  This is a weird case: Clang's -fsanitize=bounds includes
+	  -fsanitize=local-bounds, but it's trapping-only, so for
+	  Clang, we must use -fsanitize=array-bounds when we want
+	  traditional array bounds checking enabled. For GCC, we
+	  want -fsanitize=bounds.
+
+config UBSAN_ARRAY_BOUNDS
+	def_bool CC_HAS_UBSAN_ARRAY_BOUNDS
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
-	  exception/error is detected. Therefore, it should be enabled only
-	  if trapping is expected.
+	  exception/error is detected. Therefore, it may only be enabled
+	  with CONFIG_UBSAN_TRAP.
+
 	  Enabling this option detects errors due to accesses through a
 	  pointer that is derived from an object of a statically-known size,
 	  where an added offset (which may not be known statically) is
@@ -69,6 +91,38 @@ config UBSAN_MISC
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
@@ -85,6 +139,7 @@ config UBSAN_ALIGNMENT
 	bool "Enable checks for pointers alignment"
 	default !HAVE_EFFICIENT_UNALIGNED_ACCESS
 	depends on !UBSAN_TRAP
+	depends on $(cc-option,-fsanitize=alignment)
 	help
 	  This option enables the check of unaligned memory accesses.
 	  Enabling this option on architectures that support unaligned
diff --git a/scripts/Makefile.ubsan b/scripts/Makefile.ubsan
index c18fecc53605..0e53a93e8f15 100644
--- a/scripts/Makefile.ubsan
+++ b/scripts/Makefile.ubsan
@@ -1,33 +1,18 @@
 # SPDX-License-Identifier: GPL-2.0
 
-export CFLAGS_UBSAN :=
+# Enable available and selected UBSAN features.
+ubsan-cflags-$(CONFIG_UBSAN_ALIGNMENT)		+= -fsanitize=alignment
+ubsan-cflags-$(CONFIG_UBSAN_ONLY_BOUNDS)	+= -fsanitize=bounds
+ubsan-cflags-$(CONFIG_UBSAN_ARRAY_BOUNDS)	+= -fsanitize=array-bounds
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
 
-ifdef CONFIG_UBSAN_ALIGNMENT
-      CFLAGS_UBSAN += $(call cc-option, -fsanitize=alignment)
-endif
-
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
+export CFLAGS_UBSAN := $(ubsan-cflags-y)
-- 
2.25.1

