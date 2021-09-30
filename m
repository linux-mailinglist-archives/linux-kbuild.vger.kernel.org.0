Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4206F41E3DC
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Oct 2021 00:27:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345120AbhI3W2y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Sep 2021 18:28:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344642AbhI3W2x (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Sep 2021 18:28:53 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E196C06176E
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Sep 2021 15:27:10 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id na16-20020a17090b4c1000b0019f5bb661f9so2077424pjb.0
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Sep 2021 15:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zygAiLSQoNsoIY1uvxoA1hwJtuo0y1KIlpyKLcao1qw=;
        b=YGS0FrT8KgFYxIsPD1Vmo9YWUEsTitNyDANqflXGAcsxo5zFbryKfJ3PfKygTk25ql
         O0fmHhCXQZOedvwacR/EjYGFf81Coe7XD5U+og7DwDF4ETb13Zrj2+ZmMsrzgEJNqYvZ
         PG1VS5MwQ61xDXx3Kmy6wRy0VfGli/ZIYblIM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zygAiLSQoNsoIY1uvxoA1hwJtuo0y1KIlpyKLcao1qw=;
        b=KgaFto4CRL9xOWR5vi8kgsaMmZbgjZ2KBixevG/QEoAudCpkmkDqWcLtZusaZVQsWG
         L79fEJyVMQ6v9Ib/4imzvT6GWN9DTSFQJGSEGc9SUBQM7RNQABGIro61t70NaYwDYssg
         Z1gp9lgBknkb6VD/c42lRi3Q34ecNG0CpoUMV6sfXksCMkesj3Mfw7Thul6i2pqUdLos
         eXXa6gPXrtaCxv5P8aqf7cA+Yvk3X1p67dxzUHuMj3FkojmI3Te8dvQEGPiDcliTPOpb
         CkBXZsqOOm5LGWtYrnTA9wPcuQb4RgT59T4wrIOBxjDrGcPUB1DIMD9VvL58yws/duPZ
         NXXQ==
X-Gm-Message-State: AOAM5317lvS42lUkYBUReLh+RXQUYbydqfm1fsKLyVWYw5S0YzwVIgvE
        /qlMFWg7RCv6IrOpm8amwb/AZA==
X-Google-Smtp-Source: ABdhPJwt90voN5Dif7tX7/zONpBmQ3a4brdmA7e+RYd3OUtCE8kmT7pZTDjrBs2yiQk3xt/RqH38tQ==
X-Received: by 2002:a17:90b:4d07:: with SMTP id mw7mr15084160pjb.66.1633040829698;
        Thu, 30 Sep 2021 15:27:09 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 127sm4084858pfw.10.2021.09.30.15.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 15:27:07 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Andy Whitcroft <apw@canonical.com>,
        Dennis Zhou <dennis@kernel.org>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Joe Perches <joe@perches.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Tejun Heo <tj@kernel.org>,
        Daniel Micay <danielmicay@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux@googlegroups.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: [PATCH v3 4/8] slab: Add __alloc_size attributes for better bounds checking
Date:   Thu, 30 Sep 2021 15:27:00 -0700
Message-Id: <20210930222704.2631604-5-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210930222704.2631604-1-keescook@chromium.org>
References: <20210930222704.2631604-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9514; h=from:subject; bh=jz2EabWJ4V7UBTDnXqnj7V0rrqkbx+8deuoqLgEzAyQ=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhVjm312aTAJy2rK6CUEO/3iGG5lrIgRt8I0BPxLQA ws2ETQaJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYVY5twAKCRCJcvTf3G3AJoJsEA C0rp8pQeMkm2vohx8uuRwQGOg6XG6s9CbtQeM4TyD50PjHE/lRZdMz9+1gs0isac2J/MXzvuqkuUrH 33hBSKyFFTWa7OsdpupncwDiNBrgYjdmG5ZDm4KnGt5fmFjoyHsSkoM2m/q9nvk9HNMYCRj28rIsxw thd+1X5Zp4lfCeZcuQ/Rwf89CFtQTYq4tUN0942g3ii5+uVMMVC//dHySTHaSoSsJQgaYF1cD6BtqC O8xOT4G85XQc77P3POwRAKIc25jmPB7KRDuvnA4W2QDZm7bZOd1bosuM1PIUqm2OLm3yDVJHrNqSTL K/RcyNzkD3XM8gCcXCzzquG85b0e6uLU0gtnToglQo8DrMyVMgEjgCBuYIDZsAubJrfRsUDHrG9Q6M yye6Cz/CBZPzzQp0EXnWrBYQiJcHnuaawTJy4zNUVmlQ4R+raTrwRJYUEoL0lavFq0DXTnTwrjy/yT n5jWoUBS+gIqkOrp/BR8PYnrQjmT5sziW4d5YB4BhuNWhj2KXYyy4DEIhAHk7WDdo28MeVg8xlsUZU 6ipMnWY/3LzGFN6RoJ2fdothXH0DrptbevsKo/R0owUDLmZ+DHaWygKTwv1hSBm6k7oGU3CQmxwwbP Ju2UNQEXJS77ak+emdTaVAlpSNgikS3plbXgSD9VtpE3izBIu05Jhfhs+tDg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

As already done in GrapheneOS, add the __alloc_size attribute for regular
kmalloc interfaces, to provide additional hinting for better bounds
checking, assisting CONFIG_FORTIFY_SOURCE and other compiler
optimizations.

Cc: Christoph Lameter <cl@linux.com>
Cc: Pekka Enberg <penberg@kernel.org>
Cc: David Rientjes <rientjes@google.com>
Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Andy Whitcroft <apw@canonical.com>
Cc: Dennis Zhou <dennis@kernel.org>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: Joe Perches <joe@perches.com>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Tejun Heo <tj@kernel.org>
Co-developed-by: Daniel Micay <danielmicay@gmail.com>
Signed-off-by: Daniel Micay <danielmicay@gmail.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
---
 include/linux/slab.h | 61 ++++++++++++++++++++++++--------------------
 1 file changed, 33 insertions(+), 28 deletions(-)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index d9f14125d7a2..844b776deecf 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -181,7 +181,7 @@ int kmem_cache_shrink(struct kmem_cache *s);
 /*
  * Common kmalloc functions provided by all allocators
  */
-void * __must_check krealloc(const void *objp, size_t new_size, gfp_t flags);
+void * __must_check krealloc(const void *objp, size_t new_size, gfp_t flags) __alloc_size(2);
 void kfree(const void *objp);
 void kfree_sensitive(const void *objp);
 size_t __ksize(const void *objp);
@@ -425,7 +425,7 @@ static __always_inline unsigned int __kmalloc_index(size_t size,
 #define kmalloc_index(s) __kmalloc_index(s, true)
 #endif /* !CONFIG_SLOB */
 
-void *__kmalloc(size_t size, gfp_t flags) __assume_kmalloc_alignment __malloc;
+void *__kmalloc(size_t size, gfp_t flags) __assume_kmalloc_alignment __alloc_size(1);
 void *kmem_cache_alloc(struct kmem_cache *s, gfp_t flags) __assume_slab_alignment __malloc;
 void kmem_cache_free(struct kmem_cache *s, void *objp);
 
@@ -449,11 +449,12 @@ static __always_inline void kfree_bulk(size_t size, void **p)
 }
 
 #ifdef CONFIG_NUMA
-void *__kmalloc_node(size_t size, gfp_t flags, int node) __assume_kmalloc_alignment __malloc;
+void *__kmalloc_node(size_t size, gfp_t flags, int node) __assume_kmalloc_alignment
+							 __alloc_size(1);
 void *kmem_cache_alloc_node(struct kmem_cache *s, gfp_t flags, int node) __assume_slab_alignment
 									 __malloc;
 #else
-static __always_inline void *__kmalloc_node(size_t size, gfp_t flags, int node)
+static __always_inline __alloc_size(1) void *__kmalloc_node(size_t size, gfp_t flags, int node)
 {
 	return __kmalloc(size, flags);
 }
@@ -466,23 +467,23 @@ static __always_inline void *kmem_cache_alloc_node(struct kmem_cache *s, gfp_t f
 
 #ifdef CONFIG_TRACING
 extern void *kmem_cache_alloc_trace(struct kmem_cache *s, gfp_t flags, size_t size)
-				   __assume_slab_alignment __malloc;
+				   __assume_slab_alignment __alloc_size(3);
 
 #ifdef CONFIG_NUMA
 extern void *kmem_cache_alloc_node_trace(struct kmem_cache *s, gfp_t gfpflags,
-					 int node, size_t size) __assume_slab_alignment __malloc;
+					 int node, size_t size) __assume_slab_alignment
+								__alloc_size(4);
 #else
-static __always_inline void *kmem_cache_alloc_node_trace(struct kmem_cache *s,
-							 gfp_t gfpflags, int node,
-							 size_t size)
+static __always_inline __alloc_size(4) void *kmem_cache_alloc_node_trace(struct kmem_cache *s,
+						 gfp_t gfpflags, int node, size_t size)
 {
 	return kmem_cache_alloc_trace(s, gfpflags, size);
 }
 #endif /* CONFIG_NUMA */
 
 #else /* CONFIG_TRACING */
-static __always_inline void *kmem_cache_alloc_trace(struct kmem_cache *s, gfp_t flags,
-						    size_t size)
+static __always_inline __alloc_size(3) void *kmem_cache_alloc_trace(struct kmem_cache *s,
+								    gfp_t flags, size_t size)
 {
 	void *ret = kmem_cache_alloc(s, flags);
 
@@ -501,19 +502,20 @@ static __always_inline void *kmem_cache_alloc_node_trace(struct kmem_cache *s, g
 #endif /* CONFIG_TRACING */
 
 extern void *kmalloc_order(size_t size, gfp_t flags, unsigned int order) __assume_page_alignment
-									 __malloc;
+									 __alloc_size(1);
 
 #ifdef CONFIG_TRACING
 extern void *kmalloc_order_trace(size_t size, gfp_t flags, unsigned int order)
-				__assume_page_alignment __malloc;
+				__assume_page_alignment __alloc_size(1);
 #else
-static __always_inline void *kmalloc_order_trace(size_t size, gfp_t flags, unsigned int order)
+static __always_inline __alloc_size(1) void *kmalloc_order_trace(size_t size, gfp_t flags,
+								 unsigned int order)
 {
 	return kmalloc_order(size, flags, order);
 }
 #endif
 
-static __always_inline void *kmalloc_large(size_t size, gfp_t flags)
+static __always_inline __alloc_size(1) void *kmalloc_large(size_t size, gfp_t flags)
 {
 	unsigned int order = get_order(size);
 	return kmalloc_order_trace(size, flags, order);
@@ -573,7 +575,7 @@ static __always_inline void *kmalloc_large(size_t size, gfp_t flags)
  *	Try really hard to succeed the allocation but fail
  *	eventually.
  */
-static __always_inline void *kmalloc(size_t size, gfp_t flags)
+static __always_inline __alloc_size(1) void *kmalloc(size_t size, gfp_t flags)
 {
 	if (__builtin_constant_p(size)) {
 #ifndef CONFIG_SLOB
@@ -595,7 +597,7 @@ static __always_inline void *kmalloc(size_t size, gfp_t flags)
 	return __kmalloc(size, flags);
 }
 
-static __always_inline void *kmalloc_node(size_t size, gfp_t flags, int node)
+static __always_inline __alloc_size(1) void *kmalloc_node(size_t size, gfp_t flags, int node)
 {
 #ifndef CONFIG_SLOB
 	if (__builtin_constant_p(size) &&
@@ -619,7 +621,7 @@ static __always_inline void *kmalloc_node(size_t size, gfp_t flags, int node)
  * @size: element size.
  * @flags: the type of memory to allocate (see kmalloc).
  */
-static inline void *kmalloc_array(size_t n, size_t size, gfp_t flags)
+static inline __alloc_size(1, 2) void *kmalloc_array(size_t n, size_t size, gfp_t flags)
 {
 	size_t bytes;
 
@@ -637,8 +639,10 @@ static inline void *kmalloc_array(size_t n, size_t size, gfp_t flags)
  * @new_size: new size of a single member of the array
  * @flags: the type of memory to allocate (see kmalloc)
  */
-static inline void * __must_check krealloc_array(void *p, size_t new_n, size_t new_size,
-						 gfp_t flags)
+static inline __alloc_size(2, 3) void * __must_check krealloc_array(void *p,
+								    size_t new_n,
+								    size_t new_size,
+								    gfp_t flags)
 {
 	size_t bytes;
 
@@ -654,7 +658,7 @@ static inline void * __must_check krealloc_array(void *p, size_t new_n, size_t n
  * @size: element size.
  * @flags: the type of memory to allocate (see kmalloc).
  */
-static inline void *kcalloc(size_t n, size_t size, gfp_t flags)
+static inline __alloc_size(1, 2) void *kcalloc(size_t n, size_t size, gfp_t flags)
 {
 	return kmalloc_array(n, size, flags | __GFP_ZERO);
 }
@@ -667,12 +671,13 @@ static inline void *kcalloc(size_t n, size_t size, gfp_t flags)
  * allocator where we care about the real place the memory allocation
  * request comes from.
  */
-extern void *__kmalloc_track_caller(size_t size, gfp_t flags, unsigned long caller);
+extern void *__kmalloc_track_caller(size_t size, gfp_t flags, unsigned long caller)
+				   __alloc_size(1);
 #define kmalloc_track_caller(size, flags) \
 	__kmalloc_track_caller(size, flags, _RET_IP_)
 
-static inline void *kmalloc_array_node(size_t n, size_t size, gfp_t flags,
-				       int node)
+static inline __alloc_size(1, 2) void *kmalloc_array_node(size_t n, size_t size, gfp_t flags,
+							  int node)
 {
 	size_t bytes;
 
@@ -683,7 +688,7 @@ static inline void *kmalloc_array_node(size_t n, size_t size, gfp_t flags,
 	return __kmalloc_node(bytes, flags, node);
 }
 
-static inline void *kcalloc_node(size_t n, size_t size, gfp_t flags, int node)
+static inline __alloc_size(1, 2) void *kcalloc_node(size_t n, size_t size, gfp_t flags, int node)
 {
 	return kmalloc_array_node(n, size, flags | __GFP_ZERO, node);
 }
@@ -691,7 +696,7 @@ static inline void *kcalloc_node(size_t n, size_t size, gfp_t flags, int node)
 
 #ifdef CONFIG_NUMA
 extern void *__kmalloc_node_track_caller(size_t size, gfp_t flags, int node,
-					 unsigned long caller);
+					 unsigned long caller) __alloc_size(1);
 #define kmalloc_node_track_caller(size, flags, node) \
 	__kmalloc_node_track_caller(size, flags, node, \
 			_RET_IP_)
@@ -716,7 +721,7 @@ static inline void *kmem_cache_zalloc(struct kmem_cache *k, gfp_t flags)
  * @size: how many bytes of memory are required.
  * @flags: the type of memory to allocate (see kmalloc).
  */
-static inline void *kzalloc(size_t size, gfp_t flags)
+static inline __alloc_size(1) void *kzalloc(size_t size, gfp_t flags)
 {
 	return kmalloc(size, flags | __GFP_ZERO);
 }
@@ -727,7 +732,7 @@ static inline void *kzalloc(size_t size, gfp_t flags)
  * @flags: the type of memory to allocate (see kmalloc).
  * @node: memory node from which to allocate
  */
-static inline void *kzalloc_node(size_t size, gfp_t flags, int node)
+static inline __alloc_size(1) void *kzalloc_node(size_t size, gfp_t flags, int node)
 {
 	return kmalloc_node(size, flags | __GFP_ZERO, node);
 }
-- 
2.30.2

