Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D7C22CCB31
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Dec 2020 01:47:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728139AbgLCAqQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Dec 2020 19:46:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728090AbgLCAqQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Dec 2020 19:46:16 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FDD2C061A4E
        for <linux-kbuild@vger.kernel.org>; Wed,  2 Dec 2020 16:44:52 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id w187so146803pfd.5
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Dec 2020 16:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D3rSAsRP5x/CxsRx1K7+9IiYGckWnNmsJInSwUMhv5g=;
        b=eoR3a558YUW0zQVtWJzpKXO8Ku7gX4+fRG6Umi1lqcleS34JfREwI/NTJ9wKaZBsGD
         r9e1MEW9IGZzmEstid7zIadkRgNIPB1HMbolfrLw8mDZhhGuIGV1bsZJ8UEYQT4xF0nY
         flo0E91lNOm/czn/X5n9WLEL09xGJh5SPXftA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D3rSAsRP5x/CxsRx1K7+9IiYGckWnNmsJInSwUMhv5g=;
        b=VytsUMSt7Bly7bROgEafL7ve0bq2D0fNS7LzttFqVkL97NqeCDhPVIaLEO9n1wu7AW
         7awaL3ETaCtW10ij49mLSOn9dq9vkC28s/6v1QP0DuVRAIrSjTZ1ZkQvdhL83fI+bSnl
         OW/eVX3/duP1nRPkNp/uaXrUKHcPKaaYTOo4NwqTkR2FByWQ0fIUXmI5KaNC+0YUTc70
         rycwsrdraSDaV38mtCFVX7rFp156BiBmKnUVVOZaCNRLaED+x+7qLLbdITukCjn2F7Bi
         28JERTAAvONC7UndNVrmgu9huXThIONB7hRNkSEzKkgzHAGl/RobGwyDN2czPH5ilkUm
         nheg==
X-Gm-Message-State: AOAM532OD5q4Is3vvFTMEQV2uAL/GIvCaXRza5XgJUqq52HCb2My9Ezx
        B//JTGthuxnAcVY3phiqu0Jd4Q==
X-Google-Smtp-Source: ABdhPJw7jToabYGbU5tDQP8U8BkLj8bNhmDVtrlJVGbwkvpxVM3/jclTBRITaF8qP2gBf2rmnkRewg==
X-Received: by 2002:a63:ed0b:: with SMTP id d11mr760249pgi.261.1606956291860;
        Wed, 02 Dec 2020 16:44:51 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id n21sm230422pfo.182.2020.12.02.16.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 16:44:50 -0800 (PST)
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
Subject: [PATCH v2 6/7] ubsan: Remove UBSAN_MISC in favor of individual options
Date:   Wed,  2 Dec 2020 16:44:36 -0800
Message-Id: <20201203004437.389959-7-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201203004437.389959-1-keescook@chromium.org>
References: <20201203004437.389959-1-keescook@chromium.org>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; g=98f34d5fbfed6ff416ce29bc14c98da671c5a74e; i=qsNPBp3XqKD5ClMcmoFVdPno8vVa6V82W9N+tYkUn5o=; m=X9WlXliVH0dggoDRXxIEqhpygHwSBybiBEFjYbQarK0=; p=9rwQpbxNzNmGzM3mxzigXaMASvy49MXh/Xrd8ThGD6A=
X-Patch-Sig: m=pgp; i=keescook@chromium.org; s=0x0x8972F4DFDC6DC026; b=iQIzBAABCgAdFiEEpcP2jyKd1g9yPm4TiXL039xtwCYFAl/INPQACgkQiXL039xtwCZXQA//Stz jVORVR8zVmwIBKAiJEq7TE/rVKuZvRM47faxrT9A2J52n527SKIFojrlXHMgvckVGI1AL60z9GJFw rdQ/uXUNUCShg9MlTDNjLFel3yRmTIV5ohvRZJdNSiFWxqmpvfbXZC68MwgwGFBbXvGaAcGF2A0Ec hzFrLDFJKQj1LoFj7vVz+LCo9nrlgpwh+7hrnNGzySqtdC0DmB3RjXA2j0SHCTnHNyuTNfoJAQ9bt ZzkrKZldAhrq35eurB82kb0/QXpvUFE4wqFGpp9w295ztTBrG8A9Y6nG4SjhC6EzYgj3ueD7EOc5m HHPyTcnTsM4hobUXJuvnOn5znpwKXQPBiIcEg+ehw04/AG5binRyb/Nrk5Tb0xaELWT5fwyly0+BN VgwtPDwSf9BT0LXk8b8k16IbHGKXxf256bLsBVLNxb7TeC3ZL8MG9ACuRqK/nOrHz2SClAFUAOnxU TAQResBPkL43zH/uS6ux1K9z6s1KhP8UW1euApYceGlXX51XDuGO6CMqfGxcQbT+N6NIqq7l8M8c1 QgHTCvtlV0EoJ5LQmy4fHbxsgSdYm+40xQs1XD/eqrIDomFSsCSqWOCztkSYIe/32DAEVgkniNdcO EPvYaYd6ssPkrQN59NEUgmGhZrGx3hbd3d8lQnyUWXAOICnhJU8g73TDiO/8P9Bo=
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Make each UBSAN option individually selectable and remove UBSAN_MISC
which no longer has any purpose. Add help text for each Kconfig, and
include a reference to the Clang sanitizer documentation. Disable
unsigned overflow by default (not available with GCC and makes x86
unbootable with Clang). Disable unreachable when objtool is in use
(redundant and confuses things: instrumentation appears at unreachable
locations).

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Documentation/dev-tools/ubsan.rst |  1 +
 lib/Kconfig.ubsan                 | 82 +++++++++++++++++++++----------
 2 files changed, 57 insertions(+), 26 deletions(-)

diff --git a/Documentation/dev-tools/ubsan.rst b/Documentation/dev-tools/ubsan.rst
index 655e6b63c227..1be6618e232d 100644
--- a/Documentation/dev-tools/ubsan.rst
+++ b/Documentation/dev-tools/ubsan.rst
@@ -86,3 +86,4 @@ References
 
 .. _1: https://gcc.gnu.org/onlinedocs/gcc-4.9.0/gcc/Debugging-Options.html
 .. _2: https://gcc.gnu.org/onlinedocs/gcc/Debugging-Options.html
+.. _3: https://clang.llvm.org/docs/UndefinedBehaviorSanitizer.html
diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
index fa78f0f3c1dc..8b635fd75fe4 100644
--- a/lib/Kconfig.ubsan
+++ b/lib/Kconfig.ubsan
@@ -84,48 +84,88 @@ config UBSAN_LOCAL_BOUNDS
 	  where an added offset (which may not be known statically) is
 	  out-of-bounds.
 
-config UBSAN_MISC
-	bool "Enable all other Undefined Behavior sanity checks"
-	default UBSAN
-	help
-	  This option enables all sanity checks that don't have their
-	  own Kconfig options. Disable this if you only want to have
-	  individually selected checks.
-
 config UBSAN_SHIFT
-	def_bool UBSAN_MISC
+	bool "Perform checking for bit-shift overflows"
+	default UBSAN
 	depends on $(cc-option,-fsanitize=shift)
+	help
+	  This option enables -fsanitize=shift which checks for bit-shift
+	  operations that overflow to the left or go switch to negative
+	  for signed types.
 
 config UBSAN_DIV_ZERO
-	def_bool UBSAN_MISC
+	bool "Perform checking for integer divide-by-zero"
 	depends on $(cc-option,-fsanitize=integer-divide-by-zero)
+	help
+	  This option enables -fsanitize=integer-divide-by-zero which checks
+	  for integer division by zero. This is effectively redundant with the
+	  kernel's existing exception handling, though it can provide greater
+	  debugging information under CONFIG_UBSAN_REPORT_FULL.
 
 config UBSAN_UNREACHABLE
-	def_bool UBSAN_MISC
+	bool "Perform checking for unreachable code"
+	# objtool already handles unreachable checking and gets angry about
+	# seeing UBSan instrumentation located in unreachable places.
+	depends on !STACK_VALIDATION
 	depends on $(cc-option,-fsanitize=unreachable)
+	help
+	  This option enables -fsanitize=unreachable which checks for control
+	  flow reaching an expected-to-be-unreachable position.
 
 config UBSAN_SIGNED_OVERFLOW
-	def_bool UBSAN_MISC
+	bool "Perform checking for signed arithmetic overflow"
+	default UBSAN
 	depends on $(cc-option,-fsanitize=signed-integer-overflow)
+	help
+	  This option enables -fsanitize=signed-integer-overflow which checks
+	  for overflow of any arithmetic operations with signed integers.
 
 config UBSAN_UNSIGNED_OVERFLOW
-	def_bool UBSAN_MISC
+	bool "Perform checking for unsigned arithmetic overflow"
 	depends on $(cc-option,-fsanitize=unsigned-integer-overflow)
+	help
+	  This option enables -fsanitize=unsigned-integer-overflow which checks
+	  for overflow of any arithmetic operations with unsigned integers. This
+	  currently causes x86 to fail to boot.
 
 config UBSAN_OBJECT_SIZE
-	def_bool UBSAN_MISC
+	bool "Perform checking for accesses beyond the end of objects"
+	default UBSAN
 	# gcc hugely expands stack usage with -fsanitize=object-size
 	# https://lore.kernel.org/lkml/CAHk-=wjPasyJrDuwDnpHJS2TuQfExwe=px-SzLeN8GFMAQJPmQ@mail.gmail.com/
 	depends on !CC_IS_GCC
 	depends on $(cc-option,-fsanitize=object-size)
+	help
+	  This option enables -fsanitize=object-size which checks for accesses
+	  beyond the end of objects where the optimizer can determine both the
+	  object being operated on and its size, usually seen with bad downcasts,
+	  or access to struct members from NULL pointers.
 
 config UBSAN_BOOL
-	def_bool UBSAN_MISC
+	bool "Perform checking for non-boolean values used as boolean"
+	default UBSAN
 	depends on $(cc-option,-fsanitize=bool)
+	help
+	  This option enables -fsanitize=bool which checks for boolean values being
+	  loaded that are neither 0 nor 1.
 
 config UBSAN_ENUM
-	def_bool UBSAN_MISC
+	bool "Perform checking for out of bounds enum values"
+	default UBSAN
 	depends on $(cc-option,-fsanitize=enum)
+	help
+	  This option enables -fsanitize=enum which checks for values being loaded
+	  into an enum that are outside the range of given values for the given enum.
+
+config UBSAN_ALIGNMENT
+	bool "Perform checking for misaligned pointer usage"
+	default !HAVE_EFFICIENT_UNALIGNED_ACCESS
+	depends on !UBSAN_TRAP && !COMPILE_TEST
+	depends on $(cc-option,-fsanitize=alignment)
+	help
+	  This option enables the check of unaligned memory accesses.
+	  Enabling this option on architectures that support unaligned
+	  accesses may produce a lot of false positives.
 
 config UBSAN_SANITIZE_ALL
 	bool "Enable instrumentation for the entire kernel"
@@ -138,16 +178,6 @@ config UBSAN_SANITIZE_ALL
 	  Enabling this option will get kernel image size increased
 	  significantly.
 
-config UBSAN_ALIGNMENT
-	bool "Enable checks for pointers alignment"
-	default !HAVE_EFFICIENT_UNALIGNED_ACCESS
-	depends on !UBSAN_TRAP && !COMPILE_TEST
-	depends on $(cc-option,-fsanitize=alignment)
-	help
-	  This option enables the check of unaligned memory accesses.
-	  Enabling this option on architectures that support unaligned
-	  accesses may produce a lot of false positives.
-
 config TEST_UBSAN
 	tristate "Module for testing for undefined behavior detection"
 	depends on m
-- 
2.25.1

