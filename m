Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFAD23EF9CF
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Aug 2021 07:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237108AbhHRFJY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 01:09:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237407AbhHRFJU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 01:09:20 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9767FC06129E
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Aug 2021 22:08:46 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id hv22-20020a17090ae416b0290178c579e424so1536173pjb.3
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Aug 2021 22:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kwe+7x098AFAsp6HObDqzLfsA9AaOtdAmm10Ri6lneY=;
        b=MDQc7Qo02bOhSp6zRlMQC4IeCrHYouMZFpUhtC90CCzr8ee4bgtADw7WJnMmR8Wmde
         URG7TOK86bHRsFlzUqsgTNi0YyrLB7weLtwkv8Ak+ccKHi9pCgKNnt90yC+fdoK+wZkC
         TJ0BzO5ZuVEzNajnEbXLjfq0UK/kjxlV6xIVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kwe+7x098AFAsp6HObDqzLfsA9AaOtdAmm10Ri6lneY=;
        b=cfH+Q4hlCzzcVbEwqe4j7MZdUXF52dD7PuV66qhgSm+6gLxKy+WUCsfikdZ0RWaPBM
         D7JLZESwYHuncgI8mc5TwEJf1P5cm7YMOxOIFm4Z+h53pCDuUIgOMz9BnRMX5PG17SDm
         7fFDMoLEAbo/uJvTUJsaMu92DDB9HBtObnizkflPYFLAwD7Yjr7K+PyN1dfTdi5IXNE2
         ScBwQk23aRKVGCT81e20raGEXU1w4Z6D7JLPuqED/GyrsB+oBqsgnOaN4cuMG8AuQqkU
         Dg7Y5DjfVj+zq26GYB00FFy1WgPoLN40WpSAe3oUj4F4Abi9hnXQ3xqKZR6L1UxkeF4x
         sVzg==
X-Gm-Message-State: AOAM530vtdFEWd2/zetDEhATBodJxe6akjUWsnD5t2MIA4IOY6Q6dopv
        wgnxF3R2fG7QGkHiwm0FdMbCEQ==
X-Google-Smtp-Source: ABdhPJzy6VMfPK5oBN2vdQiwzq502wZ6o1gktGF4zz2dRHmXGhIoIyhC+5rofIDWNjaIiYrrtPc8GA==
X-Received: by 2002:a17:90a:f3cc:: with SMTP id ha12mr7432352pjb.195.1629263326119;
        Tue, 17 Aug 2021 22:08:46 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a6sm3604432pjs.40.2021.08.17.22.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 22:08:43 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>, Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        Andrew Morton <akpm@linux-foundation.org>,
        Daniel Micay <danielmicay@gmail.com>,
        Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>, linux-mm@kvack.org,
        linux-kbuild@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: [PATCH 1/5] Compiler Attributes: Add __alloc_size() for better bounds checking
Date:   Tue, 17 Aug 2021 22:08:37 -0700
Message-Id: <20210818050841.2226600-2-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818050841.2226600-1-keescook@chromium.org>
References: <20210818050841.2226600-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2380; h=from:subject; bh=Z77R0+fHluP6o4NcvIwdkfyyrw0mnaqgtPexTL+jzKw=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHJXXXWv8HAUEH70BjLM8r9L44FwLbXyX7U2SbMJG cW7X2W2JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyV1wAKCRCJcvTf3G3AJs7vD/ 9D6DcToe9pHFn5VltA0eOO5yqBac9LT4thRelqAQ6laxUduO5B+8FOxZL1OSulQlHAssoA3PddQ2rY mVpL4OrFcFpbtY2UXGJ/x/aqyeSOQ9uqc98i8zR47nEaK8YS6Gj5t7MqZvza+An/3E0WFvpeYSr4/P C109T9G+TfMaEsTELu5ATpiYLUzpDfADQsOuHv8ArEwVqwmZKZ4Uypjg6BZ5K7SyiLRaxytnIK5BKg uvC9PDWqZf8t2bpKtUpMipLPG1jEJqzfUOYTbXStV5WOYALSkvEOW+DZbDVYb+LkX6Pclzw4hSr2zZ nMKVnI+7XYK8ZE0/JBfW1KGNsgBfuRh7HYEgbypFfqzhX98Io6pNdGs0gecrX6MWNRDKFXS5JDgzmI nlCUKfV+akKM7wnefg8W5jF68bNPS3imqX4Qs6vrh4mF+0mHsK3t8Gxei0V19G0KU1BQYa2uFFhTtd ZYKAJCRrLu6r5YYTsW9eaPk9EYHpBnOMd6jASQ6WdPQFMsyzMb7x2JzXNNx9Q1v3ZnJL83pxj4g5L0 Bai0QE6rMeDH4kkazpjhSSOdOoZeUYJrcTNmlQD0MSJMK0LDVtjsvvmzdjwwPZQu9fJvsGuoAKk5Za +sS3ucLwhHMw7F1zksA5eG5+qFMGvKGBpn9fFleWOuKlJMxDM/tV5rrm7ukA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

GCC and Clang can use the alloc_size attribute to better inform the
results of __builtin_object_size() (for compile-time constant values).
Clang can additionally use alloc_size to informt the results of
__builtin_dynamic_object_size() (for run-time values).

Additionally disables -Wno-alloc-size-larger-than since the allocators
already reject SIZE_MAX, and the compile-time warnings aren't helpful.

Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: clang-built-linux@googlegroups.com
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Makefile                            | 6 +++++-
 include/linux/compiler_attributes.h | 6 ++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 1b238ce86ed4..3b6fb740584e 100644
--- a/Makefile
+++ b/Makefile
@@ -1076,9 +1076,13 @@ KBUILD_CFLAGS += $(call cc-disable-warning, stringop-overflow)
 # Another good warning that we'll want to enable eventually
 KBUILD_CFLAGS += $(call cc-disable-warning, restrict)
 
-# Enabled with W=2, disabled by default as noisy
 ifdef CONFIG_CC_IS_GCC
+# Enabled with W=2, disabled by default as noisy
 KBUILD_CFLAGS += -Wno-maybe-uninitialized
+
+# The allocators already balk at large sizes, so silence the compiler
+# warnings for bounds checks involving those possible values.
+KBUILD_CFLAGS += -Wno-alloc-size-larger-than
 endif
 
 # disable invalid "can't wrap" optimizations for signed / pointers
diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
index 67c5667f8042..203b0ac62d15 100644
--- a/include/linux/compiler_attributes.h
+++ b/include/linux/compiler_attributes.h
@@ -54,6 +54,12 @@
 #define __aligned(x)                    __attribute__((__aligned__(x)))
 #define __aligned_largest               __attribute__((__aligned__))
 
+/*
+ *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-alloc_005fsize-function-attribute
+ * clang: https://clang.llvm.org/docs/AttributeReference.html#alloc-size
+ */
+#define __alloc_size(x, ...)		__attribute__((__alloc_size__(x, ## __VA_ARGS__)))
+
 /*
  * Note: users of __always_inline currently do not write "inline" themselves,
  * which seems to be required by gcc to apply the attribute according
-- 
2.30.2

