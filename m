Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E044D41538D
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Sep 2021 00:41:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238298AbhIVWmx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 22 Sep 2021 18:42:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhIVWmw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 Sep 2021 18:42:52 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08311C061574
        for <linux-kbuild@vger.kernel.org>; Wed, 22 Sep 2021 15:41:22 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id s16so4048041pfk.0
        for <linux-kbuild@vger.kernel.org>; Wed, 22 Sep 2021 15:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Clu/CMqYqn57kn46zv2wUM8gp0cFgkCwKnhfOw8qQMI=;
        b=hH+Rj6HlaGlPQp6NFxLkmROyfSvwLx3LMaDtWfSjaFXTqrZCHbHXaEsmv6Y47g/PcV
         RBFDqTp3/UIXHeRV63Sr4Ba6HoGY/8m5UCnuU8HfyIVQSnCDlKkXMJCa/+tfwrVRFvpE
         ROF6Jy/7wkMSv2XeWz8Z4C4VWUF1DbRKg1gw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Clu/CMqYqn57kn46zv2wUM8gp0cFgkCwKnhfOw8qQMI=;
        b=HP734A/9W9ruQxocINyBSpsWP+qhNFadcune2w6nXGhhUzl65srBf35j1f4DoF1F7J
         DBGZBfY+r/8TXX8YrLUCOHPrKHwVz19l06HKt3ej93JQ/1zqPsK4ELgf/IWeyEQMv77F
         5g57MLLFkwQtJOmtv+rzBtP9qf4H59aI55Iqtnv8moic9/Q6+Ce3d4F35xF2TBjMIpFO
         3grPtQ7OVqpfV0+HQMxUJYgU9n8HRcGEBCc0Rim5hj3ir7801mglQ7qFZa7FqwY4nuND
         Ptl7EaeeJcyK7YUYGgztI7/Lvjc9c94iuYqduef8iAHhsUUJHnZCYnqg+JmErEnU5ycb
         c3zA==
X-Gm-Message-State: AOAM532+un8b+Kw+MQPmjG5cp85EJnUEOtp1rUQesIdNpalxqo5kElwQ
        uvP37+NTRy4JxI3Ezi/5lkTnsA==
X-Google-Smtp-Source: ABdhPJxf+QLmUC5cRgbS/VVEhwW9zCuavMHGFysr+qdZC0KIYuUCa1BenaP9lNNzkbho+Il3Wr6kog==
X-Received: by 2002:a63:b04c:: with SMTP id z12mr1164353pgo.371.1632350481421;
        Wed, 22 Sep 2021 15:41:21 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z62sm6856436pjj.53.2021.09.22.15.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 15:41:20 -0700 (PDT)
Date:   Wed, 22 Sep 2021 15:41:19 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     linux-kernel@vger.kernel.org, Daniel Micay <danielmicay@gmail.com>,
        Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org,
        Joe Perches <joe@perches.com>, Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Andy Whitcroft <apw@canonical.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 4/7] slab: Add __alloc_size attributes for better
 bounds checking
Message-ID: <202109211608.B9B6DEE@keescook>
References: <20210818214021.2476230-1-keescook@chromium.org>
 <20210818214021.2476230-5-keescook@chromium.org>
 <CAKwvOdmxRMcwKtWt+FogVY8iXn=vQ+0AZ36maJP2LbSdo_NNjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdmxRMcwKtWt+FogVY8iXn=vQ+0AZ36maJP2LbSdo_NNjg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 25, 2021 at 02:31:34PM -0700, Nick Desaulniers wrote:
> On Wed, Aug 18, 2021 at 2:40 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > As already done in GrapheneOS, add the __alloc_size attribute for
> > regular kmalloc interfaces, to provide additional hinting for better
> > bounds checking, assisting CONFIG_FORTIFY_SOURCE and other compiler
> > optimizations.
> >
> > Co-developed-by: Daniel Micay <danielmicay@gmail.com>
> > Signed-off-by: Daniel Micay <danielmicay@gmail.com>
> > Cc: Christoph Lameter <cl@linux.com>
> > Cc: Pekka Enberg <penberg@kernel.org>
> > Cc: David Rientjes <rientjes@google.com>
> > Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Vlastimil Babka <vbabka@suse.cz>
> > Cc: linux-mm@kvack.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> This is a good start, so
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Thanks!

> Do we also want to attribute:
> * __kmalloc_index

This is just the bucketizer (it returns "int" for the kmalloc bucket).

> * kmem_cache_free_bulk

Not an allocator.

> * kmem_cache_alloc_bulk

This allocates a list of pointers, where "size" is the length of the
list.

> * kmalloc_order
> * kmalloc_order_trace
> * kmalloc_large

Yes, these should be marked, good point.

> * kmalloc_node

This was already marked.

> * kmem_cache_alloc_trace
> * __kmalloc_track_caller
> * __kmalloc_node_track_caller

Yeah, these might get passed through in LTO situations. I'll add them.

> * kmalloc_array_node

I'll add this -- I thought it was already here but it got missed.

Thanks!

-Kees

> 
> > ---
> >  include/linux/slab.h | 20 ++++++++++++++++++--
> >  1 file changed, 18 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/linux/slab.h b/include/linux/slab.h
> > index 10fd0a8c816a..6ce826d8194d 100644
> > --- a/include/linux/slab.h
> > +++ b/include/linux/slab.h
> > @@ -181,7 +181,7 @@ int kmem_cache_shrink(struct kmem_cache *s);
> >  /*
> >   * Common kmalloc functions provided by all allocators
> >   */
> > -__must_check
> > +__must_check __alloc_size(2)
> >  void *krealloc(const void *objp, size_t new_size, gfp_t flags);
> >  void kfree(const void *objp);
> >  void kfree_sensitive(const void *objp);
> > @@ -426,6 +426,7 @@ static __always_inline unsigned int __kmalloc_index(size_t size,
> >  #define kmalloc_index(s) __kmalloc_index(s, true)
> >  #endif /* !CONFIG_SLOB */
> >
> > +__alloc_size(1)
> >  void *__kmalloc(size_t size, gfp_t flags) __assume_kmalloc_alignment __malloc;
> >  void *kmem_cache_alloc(struct kmem_cache *s, gfp_t flags) __assume_kmalloc_alignment __malloc;
> >  void kmem_cache_free(struct kmem_cache *s, void *objp);
> > @@ -450,6 +451,7 @@ static __always_inline void kfree_bulk(size_t size, void **p)
> >  }
> >
> >  #ifdef CONFIG_NUMA
> > +__alloc_size(1)
> >  void *__kmalloc_node(size_t size, gfp_t flags, int node) __assume_slab_alignment __malloc;
> >  void *kmem_cache_alloc_node(struct kmem_cache *s, gfp_t flags, int node)
> >                             __assume_slab_alignment __malloc;
> > @@ -574,6 +576,7 @@ static __always_inline void *kmalloc_large(size_t size, gfp_t flags)
> >   *     Try really hard to succeed the allocation but fail
> >   *     eventually.
> >   */
> > +__alloc_size(1)
> >  static __always_inline void *kmalloc(size_t size, gfp_t flags)
> >  {
> >         if (__builtin_constant_p(size)) {
> > @@ -596,6 +599,7 @@ static __always_inline void *kmalloc(size_t size, gfp_t flags)
> >         return __kmalloc(size, flags);
> >  }
> >
> > +__alloc_size(1)
> >  static __always_inline void *kmalloc_node(size_t size, gfp_t flags, int node)
> >  {
> >  #ifndef CONFIG_SLOB
> > @@ -620,6 +624,7 @@ static __always_inline void *kmalloc_node(size_t size, gfp_t flags, int node)
> >   * @size: element size.
> >   * @flags: the type of memory to allocate (see kmalloc).
> >   */
> > +__alloc_size(1, 2)
> >  static inline void *kmalloc_array(size_t n, size_t size, gfp_t flags)
> >  {
> >         size_t bytes;
> > @@ -638,7 +643,7 @@ static inline void *kmalloc_array(size_t n, size_t size, gfp_t flags)
> >   * @new_size: new size of a single member of the array
> >   * @flags: the type of memory to allocate (see kmalloc)
> >   */
> > -__must_check
> > +__must_check __alloc_size(2, 3)
> >  static inline void *krealloc_array(void *p, size_t new_n, size_t new_size,
> >                                    gfp_t flags)
> >  {
> > @@ -656,6 +661,7 @@ static inline void *krealloc_array(void *p, size_t new_n, size_t new_size,
> >   * @size: element size.
> >   * @flags: the type of memory to allocate (see kmalloc).
> >   */
> > +__alloc_size(1, 2)
> >  static inline void *kcalloc(size_t n, size_t size, gfp_t flags)
> >  {
> >         return kmalloc_array(n, size, flags | __GFP_ZERO);
> > @@ -685,6 +691,7 @@ static inline void *kmalloc_array_node(size_t n, size_t size, gfp_t flags,
> >         return __kmalloc_node(bytes, flags, node);
> >  }
> >
> > +__alloc_size(1, 2)
> >  static inline void *kcalloc_node(size_t n, size_t size, gfp_t flags, int node)
> >  {
> >         return kmalloc_array_node(n, size, flags | __GFP_ZERO, node);
> > @@ -718,6 +725,7 @@ static inline void *kmem_cache_zalloc(struct kmem_cache *k, gfp_t flags)
> >   * @size: how many bytes of memory are required.
> >   * @flags: the type of memory to allocate (see kmalloc).
> >   */
> > +__alloc_size(1)
> >  static inline void *kzalloc(size_t size, gfp_t flags)
> >  {
> >         return kmalloc(size, flags | __GFP_ZERO);
> > @@ -729,25 +737,31 @@ static inline void *kzalloc(size_t size, gfp_t flags)
> >   * @flags: the type of memory to allocate (see kmalloc).
> >   * @node: memory node from which to allocate
> >   */
> > +__alloc_size(1)
> >  static inline void *kzalloc_node(size_t size, gfp_t flags, int node)
> >  {
> >         return kmalloc_node(size, flags | __GFP_ZERO, node);
> >  }
> >
> > +__alloc_size(1)
> >  extern void *kvmalloc_node(size_t size, gfp_t flags, int node);
> > +__alloc_size(1)
> >  static inline void *kvmalloc(size_t size, gfp_t flags)
> >  {
> >         return kvmalloc_node(size, flags, NUMA_NO_NODE);
> >  }
> > +__alloc_size(1)
> >  static inline void *kvzalloc_node(size_t size, gfp_t flags, int node)
> >  {
> >         return kvmalloc_node(size, flags | __GFP_ZERO, node);
> >  }
> > +__alloc_size(1)
> >  static inline void *kvzalloc(size_t size, gfp_t flags)
> >  {
> >         return kvmalloc(size, flags | __GFP_ZERO);
> >  }
> >
> > +__alloc_size(1, 2)
> >  static inline void *kvmalloc_array(size_t n, size_t size, gfp_t flags)
> >  {
> >         size_t bytes;
> > @@ -758,11 +772,13 @@ static inline void *kvmalloc_array(size_t n, size_t size, gfp_t flags)
> >         return kvmalloc(bytes, flags);
> >  }
> >
> > +__alloc_size(1, 2)
> >  static inline void *kvcalloc(size_t n, size_t size, gfp_t flags)
> >  {
> >         return kvmalloc_array(n, size, flags | __GFP_ZERO);
> >  }
> >
> > +__alloc_size(3)
> >  extern void *kvrealloc(const void *p, size_t oldsize, size_t newsize,
> >                 gfp_t flags);
> >  extern void kvfree(const void *addr);
> > --
> 
> -- 
> Thanks,
> ~Nick Desaulniers

-- 
Kees Cook
