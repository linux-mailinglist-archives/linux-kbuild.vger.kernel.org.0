Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24E383F0D8A
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Aug 2021 23:40:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233971AbhHRVlQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 17:41:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234131AbhHRVlP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 17:41:15 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 583BFC061796
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 14:40:40 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id 28-20020a17090a031cb0290178dcd8a4d1so6016328pje.0
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 14:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O8qjYY2cJtsRmGm/zdMlQTzE6OnnaKrP94K9BZF3rSA=;
        b=nMy7A/nPsqqnV8Mg5wlS7/0IsGs50z8tCUXJYrfOg4AsWZa9SXVsUnl6Wo70zFzIzZ
         APXXBcZVA5rMrWVOlBjoM+3eOPYHijbfKlzO6eAP+gry0FfUhhpaeBU0hN4k179yh+Z+
         jqvpR1Mn8CSchx3dmcpXjwm6mRiWmterswDCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O8qjYY2cJtsRmGm/zdMlQTzE6OnnaKrP94K9BZF3rSA=;
        b=T3mg7HUQp5RhxlDYGy8ZD84bN71iIlHYIPNMbI3O+aiUqbmT1+3/AoTqXOF/cfV53T
         kpZHbSinBYYkas/lmqUT93jVjfpMLZxeLAx/24GWabhYXWUr/o9/rN1uFTZJlrE7IRfB
         iRNOiR2xEqXJprrO7t3tIKWyhVIKHNW7kp0dd6rtcUg2mY5yNWe2bwfykmB5uQlxLIfR
         QifcqXhF9nC0h8Ajx74qWqpMe2hx0KYIl5X8tH3lAxrV5LsIPfhFMtdDIwEwvFi86znY
         tl1GqWlNwnhGI53eHnOGiqC8qbNCpm23hC18okyTquFpvwqFyNPyL5GU1HMBMpPOnQcn
         ryCg==
X-Gm-Message-State: AOAM530io+ItEndjKiCtovuTaMe4A7pjO1+i57HliU4nIekYrSET4Z71
        TpX7ZJMC1ahTNlpYxHX4adHmgg==
X-Google-Smtp-Source: ABdhPJxYjaN+DPPuAIQ69L5BdqEKlPPf/7kM7hgR09tYFR4qxImDaw4J7iKHF/Tk7z+ejQWXelFwSA==
X-Received: by 2002:a17:902:9a47:b0:12f:6a05:caaf with SMTP id x7-20020a1709029a4700b0012f6a05caafmr2040047plv.55.1629322839915;
        Wed, 18 Aug 2021 14:40:39 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x13sm713276pjh.30.2021.08.18.14.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 14:40:36 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>, Joe Perches <joe@perches.com>,
        Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org,
        Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andy Whitcroft <apw@canonical.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Daniel Micay <danielmicay@gmail.com>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: [PATCH v2 3/7] slab: Clean up function declarations
Date:   Wed, 18 Aug 2021 14:40:17 -0700
Message-Id: <20210818214021.2476230-4-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818214021.2476230-1-keescook@chromium.org>
References: <20210818214021.2476230-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7386; h=from:subject; bh=twU3C8Odrnjtt0fLQV1v3kpwGFqUFkkEJcF/jNvyyhw=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHX5DwWG8Hbuzv1t4kr4ppi1TMFFQ+1095F1DCS+E ugeeNVeJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYR1+QwAKCRCJcvTf3G3AJrrJEA CiuNoKbuv3vd4OKjhaJsh/uzJaVSeJtUBbZd3/9tG9s4xBEiQv2TlQu0xZaF6WmgcCcuqQIstsDoAa QSaY4YKqRiBrUSqEXm6RtvXyFALNQIcRO64dkTw/k6NlY1vnQ+cznAbzY7uUemCoMXMRFWGTrFAjNL h4nYkrsKvd7bJS8rKfhkqhQDjQFHxtxAjYRFEYi018DHon/MmNrWxLSRHwwVfg61CpTHknF6VL5ekk PqE6RbO3HAI94bkmZXP2e09oyfgedXdMHdydBH6m0rXYJXls3R3e3IdGGnG8Lln/FcUMtKuQ+AQYUb uRrqf12S29q1WuPsb9oiBrvP1Faqo5PlB2gFK0Z2pF1ZVWDRFqTkX0hcEJacHbxHTcOfEFoBQDwZYR pECQpkqKGrR4Jft3sMcMHYl9fqRBMIrHg3FR66qExZGsErEYgsDkY8HvzCz7fCjkJZfTW1ZQ7XBdn8 spXz/cTL1OnWA9T+8AFCne8QCjrrGsnCQwaxCStrQc3Oh8sBJ9mwDGXxV+kiqyHyy1LShFc99t2Zz4 vljcX0jpG1gk9KBTw5xPUTxLm++BeNjFJfbKP3k4tUYpXT/A4047+XLEXjnmAWCKUX6p/6sqd8C6F7 kTLOE8Mk9+/O7V/BXO4FZiCjuMmSNstND0eEUVgfzhfaFiAqjYhAtf8HI0dw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

In order to have more readable and regular declarations, move __must_check
to the line above the main function declaration and add all the missing
parameter names.

Suggested-by: Joe Perches <joe@perches.com>
Cc: Christoph Lameter <cl@linux.com>
Cc: Pekka Enberg <penberg@kernel.org>
Cc: David Rientjes <rientjes@google.com>
Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: linux-mm@kvack.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/slab.h | 68 +++++++++++++++++++++++---------------------
 1 file changed, 35 insertions(+), 33 deletions(-)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index c0d46b6fa12a..10fd0a8c816a 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -152,8 +152,8 @@ struct kmem_cache *kmem_cache_create_usercopy(const char *name,
 			slab_flags_t flags,
 			unsigned int useroffset, unsigned int usersize,
 			void (*ctor)(void *));
-void kmem_cache_destroy(struct kmem_cache *);
-int kmem_cache_shrink(struct kmem_cache *);
+void kmem_cache_destroy(struct kmem_cache *s);
+int kmem_cache_shrink(struct kmem_cache *s);
 
 /*
  * Please use this macro to create slab caches. Simply specify the
@@ -181,11 +181,12 @@ int kmem_cache_shrink(struct kmem_cache *);
 /*
  * Common kmalloc functions provided by all allocators
  */
-void * __must_check krealloc(const void *, size_t, gfp_t);
-void kfree(const void *);
-void kfree_sensitive(const void *);
-size_t __ksize(const void *);
-size_t ksize(const void *);
+__must_check
+void *krealloc(const void *objp, size_t new_size, gfp_t flags);
+void kfree(const void *objp);
+void kfree_sensitive(const void *objp);
+size_t __ksize(const void *objp);
+size_t ksize(const void *objp);
 #ifdef CONFIG_PRINTK
 bool kmem_valid_obj(void *object);
 void kmem_dump_obj(void *object);
@@ -426,8 +427,8 @@ static __always_inline unsigned int __kmalloc_index(size_t size,
 #endif /* !CONFIG_SLOB */
 
 void *__kmalloc(size_t size, gfp_t flags) __assume_kmalloc_alignment __malloc;
-void *kmem_cache_alloc(struct kmem_cache *, gfp_t flags) __assume_slab_alignment __malloc;
-void kmem_cache_free(struct kmem_cache *, void *);
+void *kmem_cache_alloc(struct kmem_cache *s, gfp_t flags) __assume_kmalloc_alignment __malloc;
+void kmem_cache_free(struct kmem_cache *s, void *objp);
 
 /*
  * Bulk allocation and freeing operations. These are accelerated in an
@@ -436,8 +437,8 @@ void kmem_cache_free(struct kmem_cache *, void *);
  *
  * Note that interrupts must be enabled when calling these functions.
  */
-void kmem_cache_free_bulk(struct kmem_cache *, size_t, void **);
-int kmem_cache_alloc_bulk(struct kmem_cache *, gfp_t, size_t, void **);
+void kmem_cache_free_bulk(struct kmem_cache *orig_s, size_t size, void **p);
+int kmem_cache_alloc_bulk(struct kmem_cache *s, gfp_t flags, size_t size, void **p);
 
 /*
  * Caller must not use kfree_bulk() on memory not originally allocated
@@ -449,8 +450,9 @@ static __always_inline void kfree_bulk(size_t size, void **p)
 }
 
 #ifdef CONFIG_NUMA
-void *__kmalloc_node(size_t size, gfp_t flags, int node) __assume_kmalloc_alignment __malloc;
-void *kmem_cache_alloc_node(struct kmem_cache *, gfp_t flags, int node) __assume_slab_alignment __malloc;
+void *__kmalloc_node(size_t size, gfp_t flags, int node) __assume_slab_alignment __malloc;
+void *kmem_cache_alloc_node(struct kmem_cache *s, gfp_t flags, int node)
+			    __assume_slab_alignment __malloc;
 #else
 static __always_inline void *__kmalloc_node(size_t size, gfp_t flags, int node)
 {
@@ -464,17 +466,15 @@ static __always_inline void *kmem_cache_alloc_node(struct kmem_cache *s, gfp_t f
 #endif
 
 #ifdef CONFIG_TRACING
-extern void *kmem_cache_alloc_trace(struct kmem_cache *, gfp_t, size_t) __assume_slab_alignment __malloc;
+extern void *kmem_cache_alloc_trace(struct kmem_cache *s, gfp_t flags, size_t size)
+				    __assume_slab_alignment __malloc;
 
 #ifdef CONFIG_NUMA
-extern void *kmem_cache_alloc_node_trace(struct kmem_cache *s,
-					   gfp_t gfpflags,
-					   int node, size_t size) __assume_slab_alignment __malloc;
+extern void *kmem_cache_alloc_node_trace(struct kmem_cache *s, gfp_t gfpflags,
+					 int node, size_t size) __assume_slab_alignment __malloc;
 #else
-static __always_inline void *
-kmem_cache_alloc_node_trace(struct kmem_cache *s,
-			      gfp_t gfpflags,
-			      int node, size_t size)
+static __always_inline void *kmem_cache_alloc_node_trace(struct kmem_cache *s,
+					gfp_t gfpflags, int node, size_t size)
 {
 	return kmem_cache_alloc_trace(s, gfpflags, size);
 }
@@ -490,10 +490,8 @@ static __always_inline void *kmem_cache_alloc_trace(struct kmem_cache *s,
 	return ret;
 }
 
-static __always_inline void *
-kmem_cache_alloc_node_trace(struct kmem_cache *s,
-			      gfp_t gfpflags,
-			      int node, size_t size)
+static __always_inline void *kmem_cache_alloc_node_trace(struct kmem_cache *s,
+					gfp_t gfpflags, int node, size_t size)
 {
 	void *ret = kmem_cache_alloc_node(s, gfpflags, node);
 
@@ -502,13 +500,15 @@ kmem_cache_alloc_node_trace(struct kmem_cache *s,
 }
 #endif /* CONFIG_TRACING */
 
-extern void *kmalloc_order(size_t size, gfp_t flags, unsigned int order) __assume_page_alignment __malloc;
+extern void *kmalloc_order(size_t size, gfp_t flags, unsigned int order)
+			   __assume_page_alignment __malloc;
 
 #ifdef CONFIG_TRACING
-extern void *kmalloc_order_trace(size_t size, gfp_t flags, unsigned int order) __assume_page_alignment __malloc;
+extern void *kmalloc_order_trace(size_t size, gfp_t flags, unsigned int order)
+				 __assume_page_alignment __malloc;
 #else
-static __always_inline void *
-kmalloc_order_trace(size_t size, gfp_t flags, unsigned int order)
+static __always_inline void *kmalloc_order_trace(size_t size, gfp_t flags,
+						 unsigned int order)
 {
 	return kmalloc_order(size, flags, order);
 }
@@ -638,8 +638,9 @@ static inline void *kmalloc_array(size_t n, size_t size, gfp_t flags)
  * @new_size: new size of a single member of the array
  * @flags: the type of memory to allocate (see kmalloc)
  */
-static __must_check inline void *
-krealloc_array(void *p, size_t new_n, size_t new_size, gfp_t flags)
+__must_check
+static inline void *krealloc_array(void *p, size_t new_n, size_t new_size,
+				   gfp_t flags)
 {
 	size_t bytes;
 
@@ -668,7 +669,7 @@ static inline void *kcalloc(size_t n, size_t size, gfp_t flags)
  * allocator where we care about the real place the memory allocation
  * request comes from.
  */
-extern void *__kmalloc_track_caller(size_t, gfp_t, unsigned long);
+extern void *__kmalloc_track_caller(size_t size, gfp_t flags, unsigned long caller);
 #define kmalloc_track_caller(size, flags) \
 	__kmalloc_track_caller(size, flags, _RET_IP_)
 
@@ -691,7 +692,8 @@ static inline void *kcalloc_node(size_t n, size_t size, gfp_t flags, int node)
 
 
 #ifdef CONFIG_NUMA
-extern void *__kmalloc_node_track_caller(size_t, gfp_t, int, unsigned long);
+extern void *__kmalloc_node_track_caller(size_t size, gfp_t flags, int node,
+					 unsigned long caller);
 #define kmalloc_node_track_caller(size, flags, node) \
 	__kmalloc_node_track_caller(size, flags, node, \
 			_RET_IP_)
-- 
2.30.2

