Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CFB141E3D5
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Oct 2021 00:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343832AbhI3W2w (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Sep 2021 18:28:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245172AbhI3W2v (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Sep 2021 18:28:51 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C1AEC06176E
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Sep 2021 15:27:08 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id n18so7597377pgm.12
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Sep 2021 15:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jqphm/t74nfIK7/mu6AcFgxlnMC07oundR+N8B/zwSg=;
        b=GUXLeQcPSVkFzaLKSP+/cXpr9g4ODTT5kgAVqgohUTrn+LrD4gNXODt+2jhNlF9iZZ
         tl3iTlgcEGUFIOH3iAsKDS4CC2Oes6Dpn6Mscm4R6rhzq8DRsx740VlJlGFYNFnnaXje
         +o6Nbio/K/D8YPClhsnQOpx6974EkOmZr4kbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jqphm/t74nfIK7/mu6AcFgxlnMC07oundR+N8B/zwSg=;
        b=SJYQTmAFsLpDvI3ktZVAqwyMH56hO405Uofi/JgqFGYpr5XdCtxN9RvqnByTGGhMmZ
         zmiSFOoR7hPR/klRyisn1s35yF5e/QvtrCBFzsXy1dNbqPQYw1NSB5SH9s9PCYYB31zp
         aRxxGVBlCivhzOX6p/W8gaVZZ1SuHVeeTes3YJcM4o5xsB24ErzA2ZlWTzcGJId3n1RX
         Ss/Z3iO4KzFf32HG/NcWuW+PBiiiElhEPxqcZH7lPVQEw9T2coh5Jt9QOlBgtr33FHgV
         xGc69dUlpsiHm4eh9tUK1eFhdvOPdKCZQJDtOn3A01BSAiruJ/jfggfuhs6YZlZ7ApD/
         aXBQ==
X-Gm-Message-State: AOAM530bUad1BthOP4d3cDFyJIOIe0wyTxkI6HS51cU9KDZmUL9wf8Vm
        1UuPqf7NwviUVLbTHubqvg1f6w==
X-Google-Smtp-Source: ABdhPJzBwm+VUDbUCaL37snzWxDJ+ABVVniWgQ658F6dS5xXeVT9ih3tezXi6vlT3ZniRVVLYG3I5A==
X-Received: by 2002:a62:1c0e:0:b0:44b:e18c:b497 with SMTP id c14-20020a621c0e000000b0044be18cb497mr6680389pfc.2.1633040828055;
        Thu, 30 Sep 2021 15:27:08 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d12sm4224538pgf.19.2021.09.30.15.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 15:27:07 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Andy Whitcroft <apw@canonical.com>,
        Christoph Lameter <cl@linux.com>,
        Daniel Micay <danielmicay@gmail.com>,
        David Rientjes <rientjes@google.com>,
        Dennis Zhou <dennis@kernel.org>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Joe Perches <joe@perches.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Pekka Enberg <penberg@kernel.org>, Tejun Heo <tj@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux@googlegroups.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: [PATCH v3 2/8] Compiler Attributes: add __alloc_size() for better bounds checking
Date:   Thu, 30 Sep 2021 15:26:58 -0700
Message-Id: <20210930222704.2631604-3-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210930222704.2631604-1-keescook@chromium.org>
References: <20210930222704.2631604-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7935; h=from:subject; bh=Lhtx1mFqM2HAjuPryrsJ8/awNqfH8M5mYNjwTuoC5ts=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhVjm2qxr9gbYrncp+jUvaSMHaGkavg9PvHN0Z2ac8 78iBz+aJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYVY5tgAKCRCJcvTf3G3AJjYaD/ 9j21sTOV1qO/ZPTDlWzDz+1O8pgTrpZUsw7H33B4GcXGon4z9Z+sPoibx0mmTGjHLo+d+LC4873uK0 QvfGbBbzic3mc1FPmALk8Dn5czU3RAzzWHSfBVDcvLUuCHU/0gD8bkc7XC/kvnIHNcjb6zOK6bK9Y9 delHC9rSJQ4AK7X1x8hiClJ6LFP0wVDEHhlwdvI8I4+PvF9tleJ5k8Pw8KkLn85AYGUEfdgqUIuKAH rkrUruN3FMNuvvkGzl1fKK+de9Vxsxl1XaxTehkJSPqCiHFnA+zfh77L36DdITiLgNBHGTQuvq3npW 1Dt3zTOVuSzp4WcaEG7Fl+0MnlXyNFt84a5BMsHExLrerYZg7mCS3jkracEiRoBr++Fw1lSu3qnK0v bWI7hdORTKNDZE9x0OWrnW8E6accFNVNr1XJ64nx3qxqkwq1EMHF3Rt/1J5oywDQsgz8b9cL42ZSfJ 7OuTGB7tstyozps+yW935o6TIkVlOtHN7x93a9FmkhZhEePvAnfNai972lg0mnXqhTAoaI71N9er49 BDE7AVuSwn5V5LWR/tZ2lTfn9Utrm9xTg/UYX4rUo0AdnBf3vkfZ+/T260MWOSB3jS/7TvNQbWl4Gd SYHTZ58uRBlYoAVczk4GJcINy9mT6a94ilYwkDLiWqsfGGDKDcAU80ybcsIw==
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
it complains about these call sites overflowing (since SIZE_MAX is
greater than the default -Walloc-size-larger-than=PTRDIFF_MAX). This
isn't helpful since we already know a SIZE_MAX will be caught at run-time
(this was an intentional design). To deal with this, we must disable
this check as it is both a false positive and redundant. (Clang does
not have this warning option.)

Unfortunately, just checking the -Wno-alloc-size-larger-than is not
sufficient to make the __alloc_size attribute behave correctly under
older GCC versions. The attribute itself must be disabled in those
situations too, as there appears to be no way to reliably silence the
SIZE_MAX constant expression cases for GCC versions less than 9.1:

In file included from ./include/linux/resource_ext.h:11,
                 from ./include/linux/pci.h:40,
                 from drivers/net/ethernet/intel/ixgbe/ixgbe.h:9,
                 from drivers/net/ethernet/intel/ixgbe/ixgbe_lib.c:4:
In function 'kmalloc_node',
    inlined from 'ixgbe_alloc_q_vector' at ./include/linux/slab.h:743:9:
./include/linux/slab.h:618:9: error: argument 1 value '18446744073709551615' exceeds maximum object size 9223372036854775807 [-Werror=alloc-size-larger-than=]
  return __kmalloc_node(size, flags, node);
         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/slab.h: In function 'ixgbe_alloc_q_vector':
./include/linux/slab.h:455:7: note: in a call to allocation function '__kmalloc_node' declared here
 void *__kmalloc_node(size_t size, gfp_t flags, int node) __assume_slab_alignment __malloc;
       ^~~~~~~~~~~~~~

Specifically:
-Wno-alloc-size-larger-than is not correctly handled by GCC < 9.1
  https://godbolt.org/z/hqsfG7q84 (doesn't disable)
  https://godbolt.org/z/P9jdrPTYh (doesn't admit to not knowing about option)
  https://godbolt.org/z/465TPMWKb (only warns when other warnings appear)

-Walloc-size-larger-than=18446744073709551615 is not handled by GCC < 8.2
  https://godbolt.org/z/73hh1EPxz (ignores numeric value)

Since anything marked with __alloc_size would also qualify for marking
with __malloc, just include __malloc along with it to avoid redundant
markings. (Suggested by Linus Torvalds.)

Finally, make sure checkpatch.pl doesn't get confused about finding the
__alloc_size attribute on functions. (Thanks to Joe Perches.)

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Andy Whitcroft <apw@canonical.com>
Cc: Christoph Lameter <cl@linux.com>
Cc: Daniel Micay <danielmicay@gmail.com>
Cc: David Rientjes <rientjes@google.com>
Cc: Dennis Zhou <dennis@kernel.org>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: Joe Perches <joe@perches.com>
Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Pekka Enberg <penberg@kernel.org>
Cc: Tejun Heo <tj@kernel.org>
Cc: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Makefile                            | 15 +++++++++++++++
 include/linux/compiler-gcc.h        |  8 ++++++++
 include/linux/compiler_attributes.h | 10 ++++++++++
 include/linux/compiler_types.h      | 12 ++++++++++++
 scripts/checkpatch.pl               |  3 ++-
 5 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 5e7c1d854441..b1a98ac31200 100644
--- a/Makefile
+++ b/Makefile
@@ -1008,6 +1008,21 @@ ifdef CONFIG_CC_IS_GCC
 KBUILD_CFLAGS += -Wno-maybe-uninitialized
 endif
 
+ifdef CONFIG_CC_IS_GCC
+# The allocators already balk at large sizes, so silence the compiler
+# warnings for bounds checks involving those possible values. While
+# -Wno-alloc-size-larger-than would normally be used here, earlier versions
+# of gcc (<9.1) weirdly don't handle the option correctly when _other_
+# warnings are produced (?!). Using -Walloc-size-larger-than=SIZE_MAX
+# doesn't work (as it is documented to), silently resolving to "0" prior to
+# version 9.1 (and producing an error more recently). Numeric values larger
+# than PTRDIFF_MAX also don't work prior to version 9.1, which are silently
+# ignored, continuing to default to PTRDIFF_MAX. So, left with no other
+# choice, we must perform a versioned check to disable this warning.
+# https://lore.kernel.org/lkml/20210824115859.187f272f@canb.auug.org.au
+KBUILD_CFLAGS += $(call cc-ifversion, -ge, 0901, -Wno-alloc-size-larger-than)
+endif
+
 # disable invalid "can't wrap" optimizations for signed / pointers
 KBUILD_CFLAGS	+= -fno-strict-overflow
 
diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
index bd2b881c6b63..b9d5f9c373a0 100644
--- a/include/linux/compiler-gcc.h
+++ b/include/linux/compiler-gcc.h
@@ -144,3 +144,11 @@
 #else
 #define __diag_GCC_8(s)
 #endif
+
+/*
+ * Prior to 9.1, -Wno-alloc-size-larger-than (and therefore the "alloc_size"
+ * attribute) do not work, and must be disabled.
+ */
+#if GCC_VERSION < 90100
+#undef __alloc_size__
+#endif
diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
index e6ec63403965..3de06a8fae73 100644
--- a/include/linux/compiler_attributes.h
+++ b/include/linux/compiler_attributes.h
@@ -33,6 +33,15 @@
 #define __aligned(x)                    __attribute__((__aligned__(x)))
 #define __aligned_largest               __attribute__((__aligned__))
 
+/*
+ * Note: do not use this directly. Instead, use __alloc_size() since it is conditionally
+ * available and includes other attributes.
+ *
+ *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-alloc_005fsize-function-attribute
+ * clang: https://clang.llvm.org/docs/AttributeReference.html#alloc-size
+ */
+#define __alloc_size__(x, ...)		__attribute__((__alloc_size__(x, ## __VA_ARGS__)))
+
 /*
  * Note: users of __always_inline currently do not write "inline" themselves,
  * which seems to be required by gcc to apply the attribute according
@@ -153,6 +162,7 @@
 
 /*
  *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-malloc-function-attribute
+ * clang: https://clang.llvm.org/docs/AttributeReference.html#malloc
  */
 #define __malloc                        __attribute__((__malloc__))
 
diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index b6ff83a714ca..4f2203c4a257 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -250,6 +250,18 @@ struct ftrace_likely_data {
 # define __cficanonical
 #endif
 
+/*
+ * Any place that could be marked with the "alloc_size" attribute is also
+ * a place to be marked with the "malloc" attribute. Do this as part of the
+ * __alloc_size macro to avoid redundant attributes and to avoid missing a
+ * __malloc marking.
+ */
+#ifdef __alloc_size__
+# define __alloc_size(x, ...)	__alloc_size__(x, ## __VA_ARGS__) __malloc
+#else
+# define __alloc_size(x, ...)	__malloc
+#endif
+
 #ifndef asm_volatile_goto
 #define asm_volatile_goto(x...) asm goto(x)
 #endif
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index c27d2312cfc3..88cb294dc447 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -489,7 +489,8 @@ our $Attribute	= qr{
 			____cacheline_aligned|
 			____cacheline_aligned_in_smp|
 			____cacheline_internodealigned_in_smp|
-			__weak
+			__weak|
+			__alloc_size\s*\(\s*\d+\s*(?:,\s*\d+\s*)?\)
 		  }x;
 our $Modifier;
 our $Inline	= qr{inline|__always_inline|noinline|__inline|__inline__};
-- 
2.30.2

