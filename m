Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7568B3F0D7C
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Aug 2021 23:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234048AbhHRVlN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 17:41:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbhHRVlN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 17:41:13 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC892C061764
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 14:40:37 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id c17so3746659pgc.0
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 14:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XLWKK7LIN3Cbqy3W2WG3JLeHKbBTWFft4ZXFdFk9oXg=;
        b=iGBFjWUFZQWs5tJxDH1zVSYBBvZeKZmjtKDzzDV/bHENQO/+/SVex15OXmv5bKOox8
         l1/ZJUuNgNWsTqdylnHEuL68VupV+5Esam26T+2T/VEKF6mHyeATWOFYeeaYMRSynJGo
         Qg31Vaqz4JIjA32QsGquNnsojx8UC480D2RGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XLWKK7LIN3Cbqy3W2WG3JLeHKbBTWFft4ZXFdFk9oXg=;
        b=QyIV6qSJdqX127uUmniDcWk0wVyM9ZwxL5ujHvmg/i65hip7ClzbkEi/csHqJxPcEJ
         ieIYVUcsa86vTar3TOmlRCZQ4wjNmEwOCjbMfm2v2J87Ea0fC1IoBEVv4uvX27aCTmPu
         SxeOciqn5e+3UjhZeQwaNnic0Egl7XK2RseP/1wpfKpdg8jVtgU33eQoYK2v0xQGf0C6
         sLjUbF0eXwXizKR7eRCjHcPRxb8jw3kDPJktL/zjwd3v1BHNwaIa+KJLLEDud2B1YTSM
         CSQnWOFIMg7CSs4RN/5ZdkirZU20OQt/iqBlc30Ep5cfcpimvyv15Ozh+fvIsS6rKVL2
         KgyA==
X-Gm-Message-State: AOAM530FY+r+KskiZfv6ftORTeM93ZkuBBwuLEvfvU1L70zkbG/Y9oYI
        A0ftAMDoP8LryMC9LhLuCJEE9g==
X-Google-Smtp-Source: ABdhPJziMmG6PE0Pt8e5A81cwjUWvVn8KVdE0CAWH55XJhYyFQ8cyWD/wnWI9zJoxkQCi3/DdE1R9A==
X-Received: by 2002:a63:4a55:: with SMTP id j21mr10729161pgl.187.1629322837472;
        Wed, 18 Aug 2021 14:40:37 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id p10sm733567pfw.28.2021.08.18.14.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 14:40:36 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>, Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com, Joe Perches <joe@perches.com>,
        Andy Whitcroft <apw@canonical.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Daniel Micay <danielmicay@gmail.com>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>, linux-mm@kvack.org,
        linux-kbuild@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: [PATCH v2 1/7] Compiler Attributes: Add __alloc_size() for better bounds checking
Date:   Wed, 18 Aug 2021 14:40:15 -0700
Message-Id: <20210818214021.2476230-2-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818214021.2476230-1-keescook@chromium.org>
References: <20210818214021.2476230-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2756; h=from:subject; bh=kP6BgOKRNS6IGb207/dpbelm3mOMw4/bS5t0UhzraAE=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHX5Dq2QiOaeJq1Tj5NGc1dgSWvBgwfJAXIGyj+oL W+yI7feJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYR1+QwAKCRCJcvTf3G3AJnAYD/ 9S/10XpWJFiW6irIxn1Dci3UXeTaYnlapjvA0tEslOoyvPQVNvDbbtNLWWHgdV2hTr+XBIHJIur28v A7Xakugzm+7yFl6YeZTUQe4KtY3TnrzpIW/ADLn9VeJEwbm3Z6guch1tTPonEB/fNjrPd9y+ymvn3o V68VUOEp3Kl1CaGJnfxPwylMu75z6hn8cDBtpx0YXGTNSiR61ScVZIvqdWYmcJkgHB5FCdUY8PddHs cbYZQqMm/AO1/bb/BjABFx3hJ1OBH4L67gBqXXF4rp1IUzx5+r8buFg4dnfe96CAoPaYCTUq32ooKZ 8bCw/3fuM14Rkz9Q4clEt2Ip10fu6f8dY7bg6H2X+66buRxpc84yFlm68N9SeHZatLiQzU361cSscZ HpjrBWBKG8IZFX/yb6lbpbmEpTUJZg+HEK1z0M+bqp+YIsXoV3P04y9YvpfzuJxI+2Y0iuMQcoVK2a IgOCkNBJXpJOYyT3/ahDUhL504XWhbMqxUycST3NEOKK9Qre9M6eQJnr3AwPBl78mvjJw0dpL3Udk4 ocFoq+Kgk1s0F4/okTEQq71CGxjVrdVyJEPDcOOw28/r+NdKvytkpxCXgtV5kxLkKHC3OpsNIOh/ox UjFVO4rREbJdr6qsgDDPo4jDzWk1N3E/oIFKRyk2wCZwpsBPogv1hwZyjZIA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

GCC and Clang can use the "alloc_size" attribute to better inform the
results of __builtin_object_size() (for compile-time constant values).
Clang can additionally use alloc_size to inform the results of
__builtin_dynamic_object_size() (for run-time values).

Because GCC sees the frequent use of struct_size() as an allocator size
argument, and notices it can return SIZE_MAX (the overflow indication),
it complains about these call sites may overflow (since SIZE_MAX is
greater than the default -Walloc-size-larger-than=PTRDIFF_MAX). This
isn't helpful since we already know a SIZE_MAX will be caught at run-time
(this was an intentional design). Instead, just disable this check as
it is both a false positive and redundant. (Clang does not have this
warning option.)

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
index 72f9e2b0202c..34cffcdfd5dc 100644
--- a/Makefile
+++ b/Makefile
@@ -1078,9 +1078,13 @@ KBUILD_CFLAGS += $(call cc-disable-warning, stringop-overflow)
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

