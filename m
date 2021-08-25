Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4A83F7DC1
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Aug 2021 23:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232049AbhHYVcf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 25 Aug 2021 17:32:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231881AbhHYVce (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Aug 2021 17:32:34 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F1BEC061757
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Aug 2021 14:31:48 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id bq28so1849141lfb.7
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Aug 2021 14:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CY0qbvVPjAOFzT8qiDPpTkDYSNAZtyk57huJIJzryLM=;
        b=M9bx0SOnsGDlg6EdWvfUJiOzp+LnJnCsliu6HetKE4lwMQsYMSjkRyiS3ej7A9NE0K
         DirdJBjr4GEtvvADd7Uc/jozQEKtnOFqDn0569t2NcV7iaelhyQwfhLPmCTbNgEqlliO
         6BgOXWTb5RqcSy2DGb2XzxNvSx0AhAIVNmRJyzySizRH7yVnnsCUJCGzNnYAT6gh1GBg
         8wIjkuqvRlbdWQs/Vzk0LX1gXpdNB/xsdOr4Z57Iqftv68a/gbamW2ZnkKJBfVJZKngN
         8vnPfc/n8NDG9AcAFmH+uVPJdHEjtz7lG2+/14IWR/DSRAujCLGzTFBIvdPFCAM8AWMm
         h/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CY0qbvVPjAOFzT8qiDPpTkDYSNAZtyk57huJIJzryLM=;
        b=g4Taq6yX4Wj3x53IwVaTSdQiRNbycYC8xgwE7FukbYvr72DASJvmB41T6+LdTTlxLM
         NUQr1enCSigJjqMz0aXUfamAWfJBd3V90FJqdEXM4K1qq+odQ+KoVm0fl7iuEiOIbsto
         5lG1alflg+nn5blW0OT7RYhJCQaxWzJoxWVRC4tqKttl78Pb4mcw6rWcko3uQQ50IoWo
         VfROV1K4sc/1yfVRf725Gp3FAkhV9tVWFyYoD+LBmYDJlNSbvGz+LGxejc8h9Mby+Pkz
         yYkm4981485jnk6Rq0URiOEzSCCyuqDDpRZEFU42NtKiY1BpzmSBYjMj1F6Rv4d3pRH8
         4rnA==
X-Gm-Message-State: AOAM5337BcOtvFSV7fevV9ijTtuqqOgiEe2I9vEwa/0XEHeoTCq9OMRH
        rLNqXL2vtiqItIy11N6nFk5/iyboYHyencn2et6pCg==
X-Google-Smtp-Source: ABdhPJz+RJT6IU3xUkzodKecOyUDoT1qdKVVe/S3mJKfCjuy3YGChtWjD6clJDWnMDm5h5aQ27DVyF2DNjR7rql3B48=
X-Received: by 2002:a19:7117:: with SMTP id m23mr134039lfc.73.1629927106160;
 Wed, 25 Aug 2021 14:31:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210818214021.2476230-1-keescook@chromium.org> <20210818214021.2476230-5-keescook@chromium.org>
In-Reply-To: <20210818214021.2476230-5-keescook@chromium.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 25 Aug 2021 14:31:34 -0700
Message-ID: <CAKwvOdmxRMcwKtWt+FogVY8iXn=vQ+0AZ36maJP2LbSdo_NNjg@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] slab: Add __alloc_size attributes for better
 bounds checking
To:     Kees Cook <keescook@chromium.org>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 18, 2021 at 2:40 PM Kees Cook <keescook@chromium.org> wrote:
>
> As already done in GrapheneOS, add the __alloc_size attribute for
> regular kmalloc interfaces, to provide additional hinting for better
> bounds checking, assisting CONFIG_FORTIFY_SOURCE and other compiler
> optimizations.
>
> Co-developed-by: Daniel Micay <danielmicay@gmail.com>
> Signed-off-by: Daniel Micay <danielmicay@gmail.com>
> Cc: Christoph Lameter <cl@linux.com>
> Cc: Pekka Enberg <penberg@kernel.org>
> Cc: David Rientjes <rientjes@google.com>
> Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: linux-mm@kvack.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

This is a good start, so
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Do we also want to attribute:
* __kmalloc_index
* kmem_cache_free_bulk
* kmem_cache_alloc_bulk
* kmem_cache_alloc_trace
* kmalloc_order
* kmalloc_order_trace
* kmalloc_large
* kmalloc_node
* __kmalloc_track_caller
* kmalloc_array_node
* __kmalloc_node_track_caller

> ---
>  include/linux/slab.h | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/slab.h b/include/linux/slab.h
> index 10fd0a8c816a..6ce826d8194d 100644
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -181,7 +181,7 @@ int kmem_cache_shrink(struct kmem_cache *s);
>  /*
>   * Common kmalloc functions provided by all allocators
>   */
> -__must_check
> +__must_check __alloc_size(2)
>  void *krealloc(const void *objp, size_t new_size, gfp_t flags);
>  void kfree(const void *objp);
>  void kfree_sensitive(const void *objp);
> @@ -426,6 +426,7 @@ static __always_inline unsigned int __kmalloc_index(size_t size,
>  #define kmalloc_index(s) __kmalloc_index(s, true)
>  #endif /* !CONFIG_SLOB */
>
> +__alloc_size(1)
>  void *__kmalloc(size_t size, gfp_t flags) __assume_kmalloc_alignment __malloc;
>  void *kmem_cache_alloc(struct kmem_cache *s, gfp_t flags) __assume_kmalloc_alignment __malloc;
>  void kmem_cache_free(struct kmem_cache *s, void *objp);
> @@ -450,6 +451,7 @@ static __always_inline void kfree_bulk(size_t size, void **p)
>  }
>
>  #ifdef CONFIG_NUMA
> +__alloc_size(1)
>  void *__kmalloc_node(size_t size, gfp_t flags, int node) __assume_slab_alignment __malloc;
>  void *kmem_cache_alloc_node(struct kmem_cache *s, gfp_t flags, int node)
>                             __assume_slab_alignment __malloc;
> @@ -574,6 +576,7 @@ static __always_inline void *kmalloc_large(size_t size, gfp_t flags)
>   *     Try really hard to succeed the allocation but fail
>   *     eventually.
>   */
> +__alloc_size(1)
>  static __always_inline void *kmalloc(size_t size, gfp_t flags)
>  {
>         if (__builtin_constant_p(size)) {
> @@ -596,6 +599,7 @@ static __always_inline void *kmalloc(size_t size, gfp_t flags)
>         return __kmalloc(size, flags);
>  }
>
> +__alloc_size(1)
>  static __always_inline void *kmalloc_node(size_t size, gfp_t flags, int node)
>  {
>  #ifndef CONFIG_SLOB
> @@ -620,6 +624,7 @@ static __always_inline void *kmalloc_node(size_t size, gfp_t flags, int node)
>   * @size: element size.
>   * @flags: the type of memory to allocate (see kmalloc).
>   */
> +__alloc_size(1, 2)
>  static inline void *kmalloc_array(size_t n, size_t size, gfp_t flags)
>  {
>         size_t bytes;
> @@ -638,7 +643,7 @@ static inline void *kmalloc_array(size_t n, size_t size, gfp_t flags)
>   * @new_size: new size of a single member of the array
>   * @flags: the type of memory to allocate (see kmalloc)
>   */
> -__must_check
> +__must_check __alloc_size(2, 3)
>  static inline void *krealloc_array(void *p, size_t new_n, size_t new_size,
>                                    gfp_t flags)
>  {
> @@ -656,6 +661,7 @@ static inline void *krealloc_array(void *p, size_t new_n, size_t new_size,
>   * @size: element size.
>   * @flags: the type of memory to allocate (see kmalloc).
>   */
> +__alloc_size(1, 2)
>  static inline void *kcalloc(size_t n, size_t size, gfp_t flags)
>  {
>         return kmalloc_array(n, size, flags | __GFP_ZERO);
> @@ -685,6 +691,7 @@ static inline void *kmalloc_array_node(size_t n, size_t size, gfp_t flags,
>         return __kmalloc_node(bytes, flags, node);
>  }
>
> +__alloc_size(1, 2)
>  static inline void *kcalloc_node(size_t n, size_t size, gfp_t flags, int node)
>  {
>         return kmalloc_array_node(n, size, flags | __GFP_ZERO, node);
> @@ -718,6 +725,7 @@ static inline void *kmem_cache_zalloc(struct kmem_cache *k, gfp_t flags)
>   * @size: how many bytes of memory are required.
>   * @flags: the type of memory to allocate (see kmalloc).
>   */
> +__alloc_size(1)
>  static inline void *kzalloc(size_t size, gfp_t flags)
>  {
>         return kmalloc(size, flags | __GFP_ZERO);
> @@ -729,25 +737,31 @@ static inline void *kzalloc(size_t size, gfp_t flags)
>   * @flags: the type of memory to allocate (see kmalloc).
>   * @node: memory node from which to allocate
>   */
> +__alloc_size(1)
>  static inline void *kzalloc_node(size_t size, gfp_t flags, int node)
>  {
>         return kmalloc_node(size, flags | __GFP_ZERO, node);
>  }
>
> +__alloc_size(1)
>  extern void *kvmalloc_node(size_t size, gfp_t flags, int node);
> +__alloc_size(1)
>  static inline void *kvmalloc(size_t size, gfp_t flags)
>  {
>         return kvmalloc_node(size, flags, NUMA_NO_NODE);
>  }
> +__alloc_size(1)
>  static inline void *kvzalloc_node(size_t size, gfp_t flags, int node)
>  {
>         return kvmalloc_node(size, flags | __GFP_ZERO, node);
>  }
> +__alloc_size(1)
>  static inline void *kvzalloc(size_t size, gfp_t flags)
>  {
>         return kvmalloc(size, flags | __GFP_ZERO);
>  }
>
> +__alloc_size(1, 2)
>  static inline void *kvmalloc_array(size_t n, size_t size, gfp_t flags)
>  {
>         size_t bytes;
> @@ -758,11 +772,13 @@ static inline void *kvmalloc_array(size_t n, size_t size, gfp_t flags)
>         return kvmalloc(bytes, flags);
>  }
>
> +__alloc_size(1, 2)
>  static inline void *kvcalloc(size_t n, size_t size, gfp_t flags)
>  {
>         return kvmalloc_array(n, size, flags | __GFP_ZERO);
>  }
>
> +__alloc_size(3)
>  extern void *kvrealloc(const void *p, size_t oldsize, size_t newsize,
>                 gfp_t flags);
>  extern void kvfree(const void *addr);
> --

-- 
Thanks,
~Nick Desaulniers
