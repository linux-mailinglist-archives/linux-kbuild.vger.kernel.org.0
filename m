Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC1AD41E3D3
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Oct 2021 00:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343780AbhI3W2w (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Sep 2021 18:28:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbhI3W2v (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Sep 2021 18:28:51 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C273C06176D
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Sep 2021 15:27:08 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id ce20-20020a17090aff1400b0019f13f6a749so7564085pjb.4
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Sep 2021 15:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BT90LCkstOs8lo40mx0B1wAunL8tBqNcKJloICKrjPQ=;
        b=RC1OHFyjxktnPOJtgBxUBH84zn9fSZ38Zhq8Wi83FTysSaB3pmYPxNijtvte3iAUAH
         vwX8yXUhSKj4wUx4cTBotgH0tICjEVvlEeCAknggHrsRqJhJEo1YEciktEIQivGeHh75
         bXf7j0es7Sa8cOpUBQ9hSh4c3BOebAV2Grn1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BT90LCkstOs8lo40mx0B1wAunL8tBqNcKJloICKrjPQ=;
        b=75+jUB/8oSRrSCqRFSy4e/dO4oOEHBfSUxOIbqRrC6VCU237dsJUy2giCyhbRs351E
         ZLJ7mTIipSGAjYnWIWGhsNIMbYWSrgQQEkB4MHiI5xJ5M8/owngXHf/VY+i++TohqqF5
         819TNFRys1ekKobHqzGPWOCtHtB6fdWtjBjav/uSA8OfWUSa0hMl72wXD6BAAgtQqgJG
         qSFJoQUh3hUeMoDi7qY2LeQEaPFpiTRwRmpc76/2JIx1McIQrTVkprZaYaeNp7ruvd+N
         r6fUym3TBjskq9lB6k/fxXhtgLDs1ii5ZAsrt1LdOH+mIkfQSC8oDMkfpTU7KRP1ctEK
         nrvA==
X-Gm-Message-State: AOAM533I5+diFRysMkL4a3eZybJTYbpYd9Y23Rkh3z6Amz2DOLMfW0JG
        AF6H00hwI5mWM/z4hYVoJfzehQ==
X-Google-Smtp-Source: ABdhPJyMfjpC76ypDMyp3+NLQz9t5YC7E7dp/eMNGw7umGk0OtlkjaRm0QXZ32bmrT30OgO49awBTA==
X-Received: by 2002:a17:90b:3e84:: with SMTP id rj4mr15805970pjb.208.1633040827758;
        Thu, 30 Sep 2021 15:27:07 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d5sm3528826pjs.53.2021.09.30.15.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 15:27:07 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org,
        Joe Perches <joe@perches.com>, Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andy Whitcroft <apw@canonical.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Daniel Micay <danielmicay@gmail.com>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: [PATCH v3 3/8] slab: Clean up function prototypes
Date:   Thu, 30 Sep 2021 15:26:59 -0700
Message-Id: <20210930222704.2631604-4-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210930222704.2631604-1-keescook@chromium.org>
References: <20210930222704.2631604-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7538; h=from:subject; bh=4zGyVVwporv8ja7RCDSosI43pqvJgeMGlgRJrQqRrvI=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhVjm38v31ZVQqC6PbDKBvc3yzNA+GO2RmSS9QSIVZ CEBfQX6JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYVY5twAKCRCJcvTf3G3AJmN4D/ 4vNGbbh2hscU2eFW3AiHCopH+L3OHR+xl7Sn5RTZrk1m49xZUHxkzxOJsuxYXhy1A/uknbc29G8NrP KwGpHfPdQ+AjTbaqt5hcMOP7z0ffFK6t6RCGvVu0dBpEMsBk0YDN+lG7xS5aCm9pLgXDCOT5Q/2m30 mtMjTpEVIpRFeLWSpieVomarBGwQ5q2Bv42PWTnUmL8A+iNbY426xt1VkNh67lWl8TfhUKJ6gUd5Nj pLM7NpBQH3P3/0PYamPaJzPA6ShBVCTTc3EIjA/efKRZBDx2fR+8VXRvDgKorjtlh+T6/e/dnpCA4L n1RFBxOnRqGvpOss5V00nWIeJna+DRdZaGWrrDcr7TkT8I6w0NtKlhHmKNwMrrQkJrMl6X2Ebiq4Hz tPBDAVmTdS17XVAGKPhcaBV3krF6NWj9Vtw97hrrY8zQLlDiRW2wPkug5KTrWEkYQXPBK4X8v7bDV4 M2cXzTw6K0meXie2c9UcIR4CYepC5vFj3kfaSmCwUVBb0ZkCehShHV8kqUqxfD9AA2Ahzozh2Vsqc3 P/uTWkwXaEA7ZpL0fagn4IBEdLgKf3pFvNp7yIJkm8pYQPoTcDw3aBQ1t/4nhxk3rRlRFe1IiGTDiM D7eBTHrpDKRzGi1BE3EV+JuvSOzcyI8QnotreEGoS+HGqFBBH5zSzUSD2q5w==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Based on feedback from Joe Perches and Linus Torvalds, regularize the
slab function prototypes before making attribute changes.

Cc: Christoph Lameter <cl@linux.com>
Cc: Pekka Enberg <penberg@kernel.org>
Cc: David Rientjes <rientjes@google.com>
Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: linux-mm@kvack.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/slab.h | 68 ++++++++++++++++++++++----------------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index 083f3ce550bc..d9f14125d7a2 100644
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
@@ -181,11 +181,11 @@ int kmem_cache_shrink(struct kmem_cache *);
 /*
  * Common kmalloc functions provided by all allocators
  */
-void * __must_check krealloc(const void *, size_t, gfp_t);
-void kfree(const void *);
-void kfree_sensitive(const void *);
-size_t __ksize(const void *);
-size_t ksize(const void *);
+void * __must_check krealloc(const void *objp, size_t new_size, gfp_t flags);
+void kfree(const void *objp);
+void kfree_sensitive(const void *objp);
+size_t __ksize(const void *objp);
+size_t ksize(const void *objp);
 #ifdef CONFIG_PRINTK
 bool kmem_valid_obj(void *object);
 void kmem_dump_obj(void *object);
@@ -426,8 +426,8 @@ static __always_inline unsigned int __kmalloc_index(size_t size,
 #endif /* !CONFIG_SLOB */
 
 void *__kmalloc(size_t size, gfp_t flags) __assume_kmalloc_alignment __malloc;
-void *kmem_cache_alloc(struct kmem_cache *, gfp_t flags) __assume_slab_alignment __malloc;
-void kmem_cache_free(struct kmem_cache *, void *);
+void *kmem_cache_alloc(struct kmem_cache *s, gfp_t flags) __assume_slab_alignment __malloc;
+void kmem_cache_free(struct kmem_cache *s, void *objp);
 
 /*
  * Bulk allocation and freeing operations. These are accelerated in an
@@ -436,8 +436,8 @@ void kmem_cache_free(struct kmem_cache *, void *);
  *
  * Note that interrupts must be enabled when calling these functions.
  */
-void kmem_cache_free_bulk(struct kmem_cache *, size_t, void **);
-int kmem_cache_alloc_bulk(struct kmem_cache *, gfp_t, size_t, void **);
+void kmem_cache_free_bulk(struct kmem_cache *s, size_t size, void **p);
+int kmem_cache_alloc_bulk(struct kmem_cache *s, gfp_t flags, size_t size, void **p);
 
 /*
  * Caller must not use kfree_bulk() on memory not originally allocated
@@ -450,7 +450,8 @@ static __always_inline void kfree_bulk(size_t size, void **p)
 
 #ifdef CONFIG_NUMA
 void *__kmalloc_node(size_t size, gfp_t flags, int node) __assume_kmalloc_alignment __malloc;
-void *kmem_cache_alloc_node(struct kmem_cache *, gfp_t flags, int node) __assume_slab_alignment __malloc;
+void *kmem_cache_alloc_node(struct kmem_cache *s, gfp_t flags, int node) __assume_slab_alignment
+									 __malloc;
 #else
 static __always_inline void *__kmalloc_node(size_t size, gfp_t flags, int node)
 {
@@ -464,25 +465,24 @@ static __always_inline void *kmem_cache_alloc_node(struct kmem_cache *s, gfp_t f
 #endif
 
 #ifdef CONFIG_TRACING
-extern void *kmem_cache_alloc_trace(struct kmem_cache *, gfp_t, size_t) __assume_slab_alignment __malloc;
+extern void *kmem_cache_alloc_trace(struct kmem_cache *s, gfp_t flags, size_t size)
+				   __assume_slab_alignment __malloc;
 
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
+							 gfp_t gfpflags, int node,
+							 size_t size)
 {
 	return kmem_cache_alloc_trace(s, gfpflags, size);
 }
 #endif /* CONFIG_NUMA */
 
 #else /* CONFIG_TRACING */
-static __always_inline void *kmem_cache_alloc_trace(struct kmem_cache *s,
-		gfp_t flags, size_t size)
+static __always_inline void *kmem_cache_alloc_trace(struct kmem_cache *s, gfp_t flags,
+						    size_t size)
 {
 	void *ret = kmem_cache_alloc(s, flags);
 
@@ -490,10 +490,8 @@ static __always_inline void *kmem_cache_alloc_trace(struct kmem_cache *s,
 	return ret;
 }
 
-static __always_inline void *
-kmem_cache_alloc_node_trace(struct kmem_cache *s,
-			      gfp_t gfpflags,
-			      int node, size_t size)
+static __always_inline void *kmem_cache_alloc_node_trace(struct kmem_cache *s, gfp_t gfpflags,
+							 int node, size_t size)
 {
 	void *ret = kmem_cache_alloc_node(s, gfpflags, node);
 
@@ -502,13 +500,14 @@ kmem_cache_alloc_node_trace(struct kmem_cache *s,
 }
 #endif /* CONFIG_TRACING */
 
-extern void *kmalloc_order(size_t size, gfp_t flags, unsigned int order) __assume_page_alignment __malloc;
+extern void *kmalloc_order(size_t size, gfp_t flags, unsigned int order) __assume_page_alignment
+									 __malloc;
 
 #ifdef CONFIG_TRACING
-extern void *kmalloc_order_trace(size_t size, gfp_t flags, unsigned int order) __assume_page_alignment __malloc;
+extern void *kmalloc_order_trace(size_t size, gfp_t flags, unsigned int order)
+				__assume_page_alignment __malloc;
 #else
-static __always_inline void *
-kmalloc_order_trace(size_t size, gfp_t flags, unsigned int order)
+static __always_inline void *kmalloc_order_trace(size_t size, gfp_t flags, unsigned int order)
 {
 	return kmalloc_order(size, flags, order);
 }
@@ -638,8 +637,8 @@ static inline void *kmalloc_array(size_t n, size_t size, gfp_t flags)
  * @new_size: new size of a single member of the array
  * @flags: the type of memory to allocate (see kmalloc)
  */
-static __must_check inline void *
-krealloc_array(void *p, size_t new_n, size_t new_size, gfp_t flags)
+static inline void * __must_check krealloc_array(void *p, size_t new_n, size_t new_size,
+						 gfp_t flags)
 {
 	size_t bytes;
 
@@ -668,7 +667,7 @@ static inline void *kcalloc(size_t n, size_t size, gfp_t flags)
  * allocator where we care about the real place the memory allocation
  * request comes from.
  */
-extern void *__kmalloc_track_caller(size_t, gfp_t, unsigned long);
+extern void *__kmalloc_track_caller(size_t size, gfp_t flags, unsigned long caller);
 #define kmalloc_track_caller(size, flags) \
 	__kmalloc_track_caller(size, flags, _RET_IP_)
 
@@ -691,7 +690,8 @@ static inline void *kcalloc_node(size_t n, size_t size, gfp_t flags, int node)
 
 
 #ifdef CONFIG_NUMA
-extern void *__kmalloc_node_track_caller(size_t, gfp_t, int, unsigned long);
+extern void *__kmalloc_node_track_caller(size_t size, gfp_t flags, int node,
+					 unsigned long caller);
 #define kmalloc_node_track_caller(size, flags, node) \
 	__kmalloc_node_track_caller(size, flags, node, \
 			_RET_IP_)
-- 
2.30.2

