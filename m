Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C31DC3AF920
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Jun 2021 01:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231788AbhFUXVL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Jun 2021 19:21:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231749AbhFUXVK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Jun 2021 19:21:10 -0400
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 656A1C06175F
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Jun 2021 16:18:55 -0700 (PDT)
Received: by mail-qk1-x749.google.com with SMTP id b125-20020a3799830000b02903ad1e638ccaso15782131qke.4
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Jun 2021 16:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=2N9bjWxC1f9f54oNFWZySIPRwoyseYMLbsiVnq37oAQ=;
        b=vXVDzsEzurcdRRJt5TZ/exgrf5jWqqP6v6+f4EHT6jni7xg/fCT7hRB0bEFjBHCf1k
         UQbAMcvlmxB9n0rZNZRgsRFrTm5BkeLenopg1zaZq07ceL0perNNhOj/iZ+iLGHWfqLu
         zsEzegqhyP5yfaz9CPRcHT2LgIx1Csa4VDTgmNz+Jz0zPPx9NSZpNljvdkMkIRZfY7CQ
         a/dsR3+I9XJ8sov7Hy7DJRJLboxLkUritm2R/l5OKTIZt8KtDAuiq7OnqVg9qP3y9Qcm
         SL5In+wgcNf1Jz8tWXabtpxG7NZQ8MCw/7jxGfNWnTAUOT1ZsYO40ygPnUyILdOS3Xsa
         RCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=2N9bjWxC1f9f54oNFWZySIPRwoyseYMLbsiVnq37oAQ=;
        b=Eh+Y1fmhuTp7OLCl5jf2k2n+O+/DkkEzXSvX2qwoAe1fH+Lk1mr8+joa+sTtS69eH3
         bPoLzsRzNsmtwssESsSWHCyGRjylUJh6Hxzk0OqWQmTMBOmHCZ0NhP/H8XJKGQBJ3GX8
         vjViVpummkVIO7B5zTBNOOdEZVk9sB9/R8NeiG7ac5JtzPfMqk4H8kiHWGBF527vV9RK
         5xvynZUQpU8IEsdHxRmL/uYvDIqpr1HEeBi/QYoOh/oo1nl0u1VmWeAywMgaxTJGPR3e
         Tqn8PottoTBirLAYYPEEStTzva4tXEx6GCSjacNOXYwStX0Rt+Aw2eQ6Oo85oq8a6EvQ
         iP3w==
X-Gm-Message-State: AOAM532yEvzEhqGoXge/SiDI+I5ZBHIE5BrZMc6WPUHkXX96lKwZNGXZ
        ZlbB4CJ2Pikf9EQxuC2a7qBkjbd4xrUYGmBbEQg=
X-Google-Smtp-Source: ABdhPJwjfIQo78aB8H6zV1xNOpuaeWEgoPd6DNwDkvyEKXQKuITcPpo/8OJYzqUHE7GlfjZiG+d9QDZJyQFf8J65NtU=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:dfd:ebf9:4ec7:1783])
 (user=ndesaulniers job=sendgmr) by 2002:a25:3626:: with SMTP id
 d38mr817378yba.338.1624317534496; Mon, 21 Jun 2021 16:18:54 -0700 (PDT)
Date:   Mon, 21 Jun 2021 16:18:20 -0700
In-Reply-To: <20210621231822.2848305-1-ndesaulniers@google.com>
Message-Id: <20210621231822.2848305-2-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20210621231822.2848305-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
Subject: [PATCH v2 1/3] compiler_attributes.h: define __no_profile, add to noinstr
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Bill Wendling <wcw@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        x86@kernel.org, Borislav Petkov <bp@alien8.de>,
        Martin Liska <mliska@suse.cz>, Marco Elver <elver@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Fangrui Song <maskray@google.com>, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>,
        johannes.berg@intel.com, linux-toolchains@vger.kernel.org,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

noinstr implies that we would like the compiler to avoid instrumenting a
function.  Add support for the compiler attribute
no_profile_instrument_function to compiler_attributes.h, then add
__no_profile to the definition of noinstr.

Link: https://lore.kernel.org/lkml/20210614162018.GD68749@worktop.programming.kicks-ass.net/
Link: https://reviews.llvm.org/D104257
Link: https://reviews.llvm.org/D104475
Link: https://reviews.llvm.org/D104658
Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=80223
Reviewed-by: Fangrui Song <maskray@google.com>
Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes V1 -> V2:
* s/no_profile/no_profile_instrument_function/
* fix trailing double underscore on GCC 4 define, as per Fangrui+Miguel.
* Pick up Fangrui + Miguel's reviewed-by tag.
* Add link to GCC's doc.
* Fix clang's doc format; will appear once clang-13 is released.

 include/linux/compiler_attributes.h | 13 +++++++++++++
 include/linux/compiler_types.h      |  2 +-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
index c043b8d2b17b..225511b17223 100644
--- a/include/linux/compiler_attributes.h
+++ b/include/linux/compiler_attributes.h
@@ -33,6 +33,7 @@
 # define __GCC4_has_attribute___externally_visible__  1
 # define __GCC4_has_attribute___no_caller_saved_registers__ 0
 # define __GCC4_has_attribute___noclone__             1
+# define __GCC4_has_attribute___no_profile_instrument_function__ 0
 # define __GCC4_has_attribute___nonstring__           0
 # define __GCC4_has_attribute___no_sanitize_address__ (__GNUC_MINOR__ >= 8)
 # define __GCC4_has_attribute___no_sanitize_undefined__ (__GNUC_MINOR__ >= 9)
@@ -237,6 +238,18 @@
 # define __nonstring
 #endif
 
+/*
+ * Optional: only supported since GCC >= 7.1, clang >= 13.0.
+ *
+ *      gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-no_005fprofile_005finstrument_005ffunction-function-attribute
+ *    clang: https://clang.llvm.org/docs/AttributeReference.html#no-profile-instrument-function
+ */
+#if __has_attribute(__no_profile_instrument_function__)
+# define __no_profile                  __attribute__((__no_profile_instrument_function__))
+#else
+# define __no_profile
+#endif
+
 /*
  *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-noreturn-function-attribute
  * clang: https://clang.llvm.org/docs/AttributeReference.html#noreturn
diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index d29bda7f6ebd..d509169860f1 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -210,7 +210,7 @@ struct ftrace_likely_data {
 /* Section for code which can't be instrumented at all */
 #define noinstr								\
 	noinline notrace __attribute((__section__(".noinstr.text")))	\
-	__no_kcsan __no_sanitize_address
+	__no_kcsan __no_sanitize_address __no_profile
 
 #endif /* __KERNEL__ */
 
-- 
2.32.0.288.g62a8d224e6-goog

