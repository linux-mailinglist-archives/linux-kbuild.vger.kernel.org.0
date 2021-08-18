Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 014013F0D85
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Aug 2021 23:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234152AbhHRVlP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 17:41:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233986AbhHRVlP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 17:41:15 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F173EC0613D9
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 14:40:39 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id l11so2689617plk.6
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 14:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MwqyUyVBfuGOdnrF3tl+l2Mzk/6qR2NKBKGCWMmBzR4=;
        b=lJaSXy0lYdah6JlaBB6JCDKQ2od42DJIgRCsFUgHsBBkFpAugC7RyzzubprgIsCsXZ
         9DQDgGpSKtlIeBQELVxglQndJc5/IwgT1v+VvnCeu08kNR5l23Q33fHaFs1sjuUkvC1Q
         SaoIpXooxKVHvS+E/tHb9grtgqN4dMSP75Tkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MwqyUyVBfuGOdnrF3tl+l2Mzk/6qR2NKBKGCWMmBzR4=;
        b=VX5qlUtPcqF70vRxPNXuLQY9RGQxw2XLDUkoE5XQ+PQnuK5NjZXx+d8kyqsQPbUcLn
         XZu6aoPy3vGzZYMWd54USnXzd6/dWzrLf1OcQk6a9r/LbQWFScJvPsc3sBtVs5IBG87o
         ACxMNj4ZWPlT8/ukThQaSkxTEQ26cCPXI23kpM8zTlwzst7nivtDR1f9MKSc5/t77hqP
         /+AVK+qn93N77TABm4u8HPpGgcEHKM+xMNWUBJSWnka7Bv2B64+0ODMJh/FXLp276Z8B
         50RImXeJiFvFvpjvtQ2qZB/yQ1h/+XVDmFEe2DrLlgJr30rL4UBHzFro6dap/4UOGN01
         CTqQ==
X-Gm-Message-State: AOAM530CwLQjFYArC/+nnqUXtccChLb2rFMuA41Zabo3lF3SQ3QaqL1E
        7N5ngeMUgqtlCNa2OoSv6f99vg==
X-Google-Smtp-Source: ABdhPJyyi7ErTbm+ViiZvCfJWCAymEafpFEKY15NWZprddMDTt1sR71iauCzPKqMFd7+RlNs3K2WQw==
X-Received: by 2002:a17:902:d343:b029:12d:3624:d997 with SMTP id l3-20020a170902d343b029012d3624d997mr9013434plk.79.1629322839521;
        Wed, 18 Aug 2021 14:40:39 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id n5sm784454pfj.49.2021.08.18.14.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 14:40:36 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        Daniel Micay <danielmicay@gmail.com>,
        Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org,
        Joe Perches <joe@perches.com>, Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andy Whitcroft <apw@canonical.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: [PATCH v2 4/7] slab: Add __alloc_size attributes for better bounds checking
Date:   Wed, 18 Aug 2021 14:40:18 -0700
Message-Id: <20210818214021.2476230-5-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818214021.2476230-1-keescook@chromium.org>
References: <20210818214021.2476230-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5608; h=from:subject; bh=AW2v9G59SMc9b2TjyulXwopISZ5N5UugKCOULL9fb0g=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHX5DF+L11JdRBLUW37gUf3S/QgZ9yRAYxPnw6Q5k rK1KJQ+JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYR1+QwAKCRCJcvTf3G3AJoW8EA CDq9Jkfm5K3l1TaVzOEW/WA0AfLKl/mG8AZKQHZbrk3EUW1tUrvcARr4YvCurHpfayCK2mdIFt0GIw Hh0y0T8Q06jg9bE5y6an/1XGvQXzFzowT0kvZLIIo/TyvZWmc2AbFXw621OA7tmldlP9x4hbhLkgMi nWYvZmMF32QWod+5iOwwPT3J01bnmGlJ/5IceWnCUrWslK88vS277HFMVAmEO85i/lLXi3oT0I/k2V jhg89zp3n2ozHJWEJ5DJ/o8akLgkaN9rsn159jGQKOcMoChQel2R6Jz+740W6pbfbhNyKamS26+Ocb 58aXqfzxYjoym/TNuU7FKENR+835OudmiWZoQqrfMDdyFVisNqSktorQ/mzluQc10gC4GC2sBhsLI0 s28g1QorO89zcfaK7hh4GEeTleyChCevyhWuG1voD4/Nu+cUAbw5sgZprunMbuc2vC9xTACQbkVNO/ k6LEMglwD89MLoVJ9850MJ+QU1qpFwCQAsqJ4Wx8zuRK79tdqgsfIlgq/eh4pvMCk/ERvXQ3/Y0nhO i9OkcUWaiKVjP29BjemVqIBtgDriJWQPrwn7i6uOwE9PjGWjvTy8VvX73yxIvtBgj76E94gVrZTdEy D3CzpNDxiSxMMvDJT9F5MUzEACKmTVOHzk6cg+20nic6/oMh3FGFaRMesCIQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

As already done in GrapheneOS, add the __alloc_size attribute for
regular kmalloc interfaces, to provide additional hinting for better
bounds checking, assisting CONFIG_FORTIFY_SOURCE and other compiler
optimizations.

Co-developed-by: Daniel Micay <danielmicay@gmail.com>
Signed-off-by: Daniel Micay <danielmicay@gmail.com>
Cc: Christoph Lameter <cl@linux.com>
Cc: Pekka Enberg <penberg@kernel.org>
Cc: David Rientjes <rientjes@google.com>
Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: linux-mm@kvack.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/slab.h | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index 10fd0a8c816a..6ce826d8194d 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -181,7 +181,7 @@ int kmem_cache_shrink(struct kmem_cache *s);
 /*
  * Common kmalloc functions provided by all allocators
  */
-__must_check
+__must_check __alloc_size(2)
 void *krealloc(const void *objp, size_t new_size, gfp_t flags);
 void kfree(const void *objp);
 void kfree_sensitive(const void *objp);
@@ -426,6 +426,7 @@ static __always_inline unsigned int __kmalloc_index(size_t size,
 #define kmalloc_index(s) __kmalloc_index(s, true)
 #endif /* !CONFIG_SLOB */
 
+__alloc_size(1)
 void *__kmalloc(size_t size, gfp_t flags) __assume_kmalloc_alignment __malloc;
 void *kmem_cache_alloc(struct kmem_cache *s, gfp_t flags) __assume_kmalloc_alignment __malloc;
 void kmem_cache_free(struct kmem_cache *s, void *objp);
@@ -450,6 +451,7 @@ static __always_inline void kfree_bulk(size_t size, void **p)
 }
 
 #ifdef CONFIG_NUMA
+__alloc_size(1)
 void *__kmalloc_node(size_t size, gfp_t flags, int node) __assume_slab_alignment __malloc;
 void *kmem_cache_alloc_node(struct kmem_cache *s, gfp_t flags, int node)
 			    __assume_slab_alignment __malloc;
@@ -574,6 +576,7 @@ static __always_inline void *kmalloc_large(size_t size, gfp_t flags)
  *	Try really hard to succeed the allocation but fail
  *	eventually.
  */
+__alloc_size(1)
 static __always_inline void *kmalloc(size_t size, gfp_t flags)
 {
 	if (__builtin_constant_p(size)) {
@@ -596,6 +599,7 @@ static __always_inline void *kmalloc(size_t size, gfp_t flags)
 	return __kmalloc(size, flags);
 }
 
+__alloc_size(1)
 static __always_inline void *kmalloc_node(size_t size, gfp_t flags, int node)
 {
 #ifndef CONFIG_SLOB
@@ -620,6 +624,7 @@ static __always_inline void *kmalloc_node(size_t size, gfp_t flags, int node)
  * @size: element size.
  * @flags: the type of memory to allocate (see kmalloc).
  */
+__alloc_size(1, 2)
 static inline void *kmalloc_array(size_t n, size_t size, gfp_t flags)
 {
 	size_t bytes;
@@ -638,7 +643,7 @@ static inline void *kmalloc_array(size_t n, size_t size, gfp_t flags)
  * @new_size: new size of a single member of the array
  * @flags: the type of memory to allocate (see kmalloc)
  */
-__must_check
+__must_check __alloc_size(2, 3)
 static inline void *krealloc_array(void *p, size_t new_n, size_t new_size,
 				   gfp_t flags)
 {
@@ -656,6 +661,7 @@ static inline void *krealloc_array(void *p, size_t new_n, size_t new_size,
  * @size: element size.
  * @flags: the type of memory to allocate (see kmalloc).
  */
+__alloc_size(1, 2)
 static inline void *kcalloc(size_t n, size_t size, gfp_t flags)
 {
 	return kmalloc_array(n, size, flags | __GFP_ZERO);
@@ -685,6 +691,7 @@ static inline void *kmalloc_array_node(size_t n, size_t size, gfp_t flags,
 	return __kmalloc_node(bytes, flags, node);
 }
 
+__alloc_size(1, 2)
 static inline void *kcalloc_node(size_t n, size_t size, gfp_t flags, int node)
 {
 	return kmalloc_array_node(n, size, flags | __GFP_ZERO, node);
@@ -718,6 +725,7 @@ static inline void *kmem_cache_zalloc(struct kmem_cache *k, gfp_t flags)
  * @size: how many bytes of memory are required.
  * @flags: the type of memory to allocate (see kmalloc).
  */
+__alloc_size(1)
 static inline void *kzalloc(size_t size, gfp_t flags)
 {
 	return kmalloc(size, flags | __GFP_ZERO);
@@ -729,25 +737,31 @@ static inline void *kzalloc(size_t size, gfp_t flags)
  * @flags: the type of memory to allocate (see kmalloc).
  * @node: memory node from which to allocate
  */
+__alloc_size(1)
 static inline void *kzalloc_node(size_t size, gfp_t flags, int node)
 {
 	return kmalloc_node(size, flags | __GFP_ZERO, node);
 }
 
+__alloc_size(1)
 extern void *kvmalloc_node(size_t size, gfp_t flags, int node);
+__alloc_size(1)
 static inline void *kvmalloc(size_t size, gfp_t flags)
 {
 	return kvmalloc_node(size, flags, NUMA_NO_NODE);
 }
+__alloc_size(1)
 static inline void *kvzalloc_node(size_t size, gfp_t flags, int node)
 {
 	return kvmalloc_node(size, flags | __GFP_ZERO, node);
 }
+__alloc_size(1)
 static inline void *kvzalloc(size_t size, gfp_t flags)
 {
 	return kvmalloc(size, flags | __GFP_ZERO);
 }
 
+__alloc_size(1, 2)
 static inline void *kvmalloc_array(size_t n, size_t size, gfp_t flags)
 {
 	size_t bytes;
@@ -758,11 +772,13 @@ static inline void *kvmalloc_array(size_t n, size_t size, gfp_t flags)
 	return kvmalloc(bytes, flags);
 }
 
+__alloc_size(1, 2)
 static inline void *kvcalloc(size_t n, size_t size, gfp_t flags)
 {
 	return kvmalloc_array(n, size, flags | __GFP_ZERO);
 }
 
+__alloc_size(3)
 extern void *kvrealloc(const void *p, size_t oldsize, size_t newsize,
 		gfp_t flags);
 extern void kvfree(const void *addr);
-- 
2.30.2

