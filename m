Return-Path: <linux-kbuild+bounces-12845-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IM55CwPV5WnWoQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12845-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Apr 2026 09:25:55 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 67337427B86
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Apr 2026 09:25:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13F913006B07
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Apr 2026 07:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E8BE38228F;
	Mon, 20 Apr 2026 07:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IdBG2FS/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6F91C84A2;
	Mon, 20 Apr 2026 07:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776669950; cv=none; b=A16pNq7NQbUC1O78gfF8fkA4oexA811jIdSOHLnPbPMXlcCPC9EueaIvJEfCTD9DWU4Ivl0GMmhHj/hh/gRtd+y+4bLxwRZmHV+r8zCc1i9zK1KHOnbGL2oqb1zUZd2OdM6YDwUP+P78+uHNdf/uy+3Lc6unmwFnvKBdEmt1wGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776669950; c=relaxed/simple;
	bh=p1D8Xweg1jdAmSkPELMmKzimxNcrJhz1peS6PXGoO8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROABUnWgmzNO185jtfrNMzbeXc87hBH1KL5B4w8fsmmYI/qjuVZjIKRpIdcYM/myqjhCW7CCPO7wDPxIXAnMEQwuApkJBi7+G1bQv2KHZeBSfIVGcyPQ+smVKBv9sGLxtFL+vTWfoxZ8ZJLvttY9RtcgdOctm6nyl0+SPFPYocw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IdBG2FS/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B34FC19425;
	Mon, 20 Apr 2026 07:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776669949;
	bh=p1D8Xweg1jdAmSkPELMmKzimxNcrJhz1peS6PXGoO8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IdBG2FS/8oVkFVTQy793NRoJkgq4QSGWhziraSZ9I7r8EJE/t3ymcHnuolUo5KYFi
	 Y+dwpZKEuAiEn9BwUQIjAfOT0xMxha6IIDhlRU8GhLX9ndTWztuYhhaCWWR4CCpzuw
	 maEIcn+qc8Dym8A5CSZVEtIEFNSEFWq9hF81t3qrJwvW7do46jT6xMlAsHyt3keFYP
	 uF6GiXjSjYIqZ5yNk2NOwzu5nDuRqpBOXEaHCjLY5BA6s2oV/ZYrztRZrZwzSBU7PP
	 uO3pBBbfS9kxf5BDBTDgRlLwPuRjLeghQa7rbDdKlo2zZZSwKzoBywX4SpLyPkLe+6
	 nxYUz1hnh2yTw==
Date: Mon, 20 Apr 2026 16:25:47 +0900
From: "Harry Yoo (Oracle)" <harry@kernel.org>
To: Marco Elver <elver@google.com>
Cc: Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
	Hao Li <hao.li@linux.dev>, David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, kasan-dev@googlegroups.com,
	llvm@lists.linux.dev, Andrey Konovalov <andreyknvl@gmail.com>,
	Florent Revest <revest@google.com>, Jann Horn <jannh@google.com>,
	KP Singh <kpsingh@kernel.org>,
	Matteo Rizzo <matteorizzo@google.com>,
	GONG Ruiqi <gongruiqi1@huawei.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] slab: support for compiler-assisted type-based slab
 cache partitioning
Message-ID: <aeXU-wwGSwcx2dvy@hyeyoo>
References: <20260415143735.2974230-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415143735.2974230-1-elver@google.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12845-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[39];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,gentwo.org,linux.dev,google.com,oracle.com,suse.com,gmail.com,vger.kernel.org,kvack.org,googlegroups.com,lists.linux.dev,huawei.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harry@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:url,llvm.org:url,huawei.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 67337427B86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

[CC'ing RUST ALLOC folks for rust bindings]

On Wed, Apr 15, 2026 at 04:37:05PM +0200, Marco Elver wrote:
> Rework the general infrastructure around RANDOM_KMALLOC_CACHES into more
> flexible PARTITION_KMALLOC_CACHES, with the former being a partitioning
> mode of the latter.
> 
> Introduce a new mode, TYPED_KMALLOC_CACHES, which leverages a feature
> available in Clang 22 and later, called "allocation tokens" via
> __builtin_infer_alloc_token [1]. Unlike RANDOM_KMALLOC_CACHES, this mode
> deterministically assigns a slab cache to an allocation of type T,
> regardless of allocation site.
> 
> The builtin __builtin_infer_alloc_token(<malloc-args>, ...) instructs
> the compiler to infer an allocation type from arguments commonly passed
> to memory-allocating functions and returns a type-derived token ID. The
> implementation passes kmalloc-args to the builtin: the compiler performs
> best-effort type inference, and then recognizes common patterns such as
> `kmalloc(sizeof(T), ...)`, `kmalloc(sizeof(T) * n, ...)`, but also
> `(T *)kmalloc(...)`. Where the compiler fails to infer a type the
> fallback token (default: 0) is chosen.
> 
> Note: kmalloc_obj(..) APIs fix the pattern how size and result type are
> expressed, and therefore ensures there's not much drift in which
> patterns the compiler needs to recognize. Specifically, kmalloc_obj()
> and friends expand to `(TYPE *)KMALLOC(__obj_size, GFP)`, which the
> compiler recognizes via the cast to TYPE*.
> 
> Clang's default token ID calculation is described as [1]:
> 
>    typehashpointersplit: This mode assigns a token ID based on the hash
>    of the allocated type's name, where the top half ID-space is reserved
>    for types that contain pointers and the bottom half for types that do
>    not contain pointers.
> 
> Separating pointer-containing objects from pointerless objects and data
> allocations can help mitigate certain classes of memory corruption
> exploits [2]: attackers who gains a buffer overflow on a primitive
> buffer cannot use it to directly corrupt pointers or other critical
> metadata in an object residing in a different, isolated heap region.
> 
> It is important to note that heap isolation strategies offer a
> best-effort approach, and do not provide a 100% security guarantee,
> albeit achievable at relatively low performance cost. Note that this
> also does not prevent cross-cache attacks: while waiting for future
> features like SLAB_VIRTUAL [3] to provide physical page isolation, this
> feature should be deployed alongside SHUFFLE_PAGE_ALLOCATOR and
> init_on_free=1 to mitigate cross-cache attacks and page-reuse attacks as
> much as possible today.
> 
> With all that, my kernel (x86 defconfig) shows me a histogram of slab
> cache object distribution per /proc/slabinfo (after boot):
> 
>   <slab cache>      <objs> <hist>
>   kmalloc-part-15    1465  ++++++++++++++
>   kmalloc-part-14    2988  +++++++++++++++++++++++++++++
>   kmalloc-part-13    1656  ++++++++++++++++
>   kmalloc-part-12    1045  ++++++++++
>   kmalloc-part-11    1697  ++++++++++++++++
>   kmalloc-part-10    1489  ++++++++++++++
>   kmalloc-part-09     965  +++++++++
>   kmalloc-part-08     710  +++++++
>   kmalloc-part-07     100  +
>   kmalloc-part-06     217  ++
>   kmalloc-part-05     105  +
>   kmalloc-part-04    4047  ++++++++++++++++++++++++++++++++++++++++
>   kmalloc-part-03     183  +
>   kmalloc-part-02     283  ++
>   kmalloc-part-01     316  +++
>   kmalloc            1422  ++++++++++++++
> 
> The above /proc/slabinfo snapshot shows me there are 6673 allocated
> objects (slabs 00 - 07) that the compiler claims contain no pointers or
> it was unable to infer the type of, and 12015 objects that contain
> pointers (slabs 08 - 15). On a whole, this looks relatively sane.
> 
> Additionally, when I compile my kernel with -Rpass=alloc-token, which
> provides diagnostics where (after dead-code elimination) type inference
> failed, I see 186 allocation sites where the compiler failed to identify
> a type (down from 966 when I sent the RFC [4]). Some initial review
> confirms these are mostly variable sized buffers, but also include
> structs with trailing flexible length arrays.
> 
> Link: https://clang.llvm.org/docs/AllocToken.html [1]
> Link: https://blog.dfsec.com/ios/2025/05/30/blasting-past-ios-18/ [2]
> Link: https://lwn.net/Articles/944647/ [3]
> Link: https://lore.kernel.org/all/20250825154505.1558444-1-elver@google.com/ [4]
> Link: https://discourse.llvm.org/t/rfc-a-framework-for-allocator-partitioning-hints/87434
> Acked-by: GONG Ruiqi <gongruiqi1@huawei.com>
> Co-developed-by: Harry Yoo (Oracle) <harry@kernel.org>
> Signed-off-by: Harry Yoo (Oracle) <harry@kernel.org>
> Signed-off-by: Marco Elver <elver@google.com>
> ---
> v2:
> * Avoid empty function argument if !PARTITION_KMALLOC_CACHES
>   (co-developed-by Harry). While Clang does optimize out the empty
>   struct argument (and generated code is identical to before if
>   PARTITION_KMALLOC_CACHES is disabled), GCC doesn't do so. So we need
>   to fully remove the argument if not actually required.
> * Cover krealloc() which was missed before, resulting in ~100 additional
>   objects in the pointer-containing caches in above histogram.
> * Unify kmalloc_token_t definition.

> * Expand Kconfig help text.

Thanks. I find the help text much more useful.

> 
> v1: https://lore.kernel.org/all/20260331111240.153913-1-elver@google.com/
> * Rebase and switch to builtin name that was released in Clang 22.
> * Keep RANDOM_KMALLOC_CACHES the default.
> 
> RFC: https://lore.kernel.org/all/20250825154505.1558444-1-elver@google.com/
> ---

A few comments on V2:

# comment 1

I'm not a big fan of how k[v]realloc_node_align()
and kmalloc_nolock() define and pass the token parameter.

IMHO it'll be fine to use {DECL,PASS}_KMALLOC_PARAMS() in those
functions, since SLAB_BUCKETS users already passes NULL bucket
to most of __kmalloc*() calls anyway.

# comment 2

This breaks Documentation/.

Problems:

- The document generator doesn't handle DECL_KMALLOC_PARAMS() well.

- The signature of the function that users call (krealloc_node_align())
  and the function that has kerneldoc (krealloc_node_align_noprof())
  don't match.

- Even worse, moving kerneldoc to the macro doesn't work because
  it uses variable arguments (...) 

# comment 3

Looking at how rust generates helper functions,
in rust/helpers/slab.c:
| // SPDX-License-Identifier: GPL-2.0
| 
| #include <linux/slab.h>
| 
| __rust_helper void *__must_check __realloc_size(2)
| rust_helper_krealloc_node_align(const void *objp, size_t new_size, unsigned long align,
| 				gfp_t flags, int node)
| {
| 	return krealloc_node_align(objp, new_size, align, flags, node);
| }
| 
| __rust_helper void *__must_check __realloc_size(2)
| rust_helper_kvrealloc_node_align(const void *p, size_t size, unsigned long align,
| 				 gfp_t flags, int node)
| {
| 	return kvrealloc_node_align(p, size, align, flags, node);
| }

Rust code probably won't pass any meaningful token?
(something you may want to address in the future)

-- 
Cheers,
Harry / Hyeonggon

[Not trimming the rest of the patch for those added to Cc]

>  Makefile                        |   5 ++
>  include/linux/percpu.h          |   2 +-
>  include/linux/slab.h            | 127 ++++++++++++++++++++------------
>  kernel/configs/hardening.config |   2 +-
>  mm/Kconfig                      |  65 +++++++++++++---
>  mm/kfence/kfence_test.c         |   4 +-
>  mm/slab.h                       |   4 +-
>  mm/slab_common.c                |  48 ++++++------
>  mm/slub.c                       |  54 +++++++-------
>  9 files changed, 200 insertions(+), 111 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 54e1ae602000..f70170ed1522 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -989,6 +989,11 @@ KBUILD_CFLAGS	+= $(CC_AUTO_VAR_INIT_ZERO_ENABLER)
>  endif
>  endif
>  
> +ifdef CONFIG_TYPED_KMALLOC_CACHES
> +# PARTITION_KMALLOC_CACHES_NR + 1
> +KBUILD_CFLAGS	+= -falloc-token-max=16
> +endif
> +
>  ifdef CONFIG_CC_IS_CLANG
>  ifdef CONFIG_CC_HAS_COUNTED_BY_PTR
>  KBUILD_CFLAGS	+= -fexperimental-late-parse-attributes
> diff --git a/include/linux/percpu.h b/include/linux/percpu.h
> index 85bf8dd9f087..271b41be314d 100644
> --- a/include/linux/percpu.h
> +++ b/include/linux/percpu.h
> @@ -36,7 +36,7 @@
>  #define PCPU_BITMAP_BLOCK_BITS		(PCPU_BITMAP_BLOCK_SIZE >>	\
>  					 PCPU_MIN_ALLOC_SHIFT)
>  
> -#ifdef CONFIG_RANDOM_KMALLOC_CACHES
> +#ifdef CONFIG_PARTITION_KMALLOC_CACHES
>  # if defined(CONFIG_LOCKDEP) && !defined(CONFIG_PAGE_SIZE_4KB)
>  # define PERCPU_DYNAMIC_SIZE_SHIFT      13
>  # else
> diff --git a/include/linux/slab.h b/include/linux/slab.h
> index 15a60b501b95..3bd0db0ec95f 100644
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -499,14 +499,33 @@ int kmem_cache_shrink(struct kmem_cache *s);
>  				.usersize	= sizeof_field(struct __struct, __field),	\
>  			}, (__flags))
>  
> +#ifdef CONFIG_PARTITION_KMALLOC_CACHES
> +typedef struct { unsigned long v; } kmalloc_token_t;
> +#ifdef CONFIG_RANDOM_KMALLOC_CACHES
> +extern unsigned long random_kmalloc_seed;
> +#define __kmalloc_token(...) ((kmalloc_token_t){ .v = _RET_IP_ })
> +#elif defined(CONFIG_TYPED_KMALLOC_CACHES)
> +#define __kmalloc_token(...) ((kmalloc_token_t){ .v = __builtin_infer_alloc_token(__VA_ARGS__) })
> +#endif
> +#define DECL_TOKEN_PARAM(_token)	, kmalloc_token_t (_token)
> +#define _PASS_TOKEN_PARAM(_token)	, (_token)
> +#define PASS_TOKEN_PARAM(_token)	(_token)
> +#else /* !CONFIG_PARTITION_KMALLOC_CACHES */
> +typedef struct {} kmalloc_token_t;
> +#define __kmalloc_token(...) ((kmalloc_token_t){}) /* no-op */
> +#define DECL_TOKEN_PARAM(_token)
> +#define _PASS_TOKEN_PARAM(_token)
> +#define PASS_TOKEN_PARAM(_token)	((kmalloc_token_t){})
> +#endif /* CONFIG_PARTITION_KMALLOC_CACHES */
> +
>  /*
>   * Common kmalloc functions provided by all allocators
>   */
>  void * __must_check krealloc_node_align_noprof(const void *objp, size_t new_size,
>  					       unsigned long align,
> -					       gfp_t flags, int nid) __realloc_size(2);
> -#define krealloc_noprof(_o, _s, _f)	krealloc_node_align_noprof(_o, _s, 1, _f, NUMA_NO_NODE)
> -#define krealloc_node_align(...)	alloc_hooks(krealloc_node_align_noprof(__VA_ARGS__))
> +					       gfp_t flags, int nid DECL_TOKEN_PARAM(token)) __realloc_size(2);
> +#define krealloc_noprof(_o, _s, _f)	krealloc_node_align_noprof(_o, _s, 1, _f, NUMA_NO_NODE _PASS_TOKEN_PARAM(__kmalloc_token(_o, _s, _f)))
> +#define krealloc_node_align(...)	alloc_hooks(krealloc_node_align_noprof(__VA_ARGS__ _PASS_TOKEN_PARAM(__kmalloc_token(__VA_ARGS__))))
>  #define krealloc_node(_o, _s, _f, _n)	krealloc_node_align(_o, _s, 1, _f, _n)
>  #define krealloc(...)			krealloc_node(__VA_ARGS__, NUMA_NO_NODE)
>  
> @@ -612,10 +631,10 @@ static inline unsigned int arch_slab_minalign(void)
>  #define SLAB_OBJ_MIN_SIZE      (KMALLOC_MIN_SIZE < 16 ? \
>                                 (KMALLOC_MIN_SIZE) : 16)
>  
> -#ifdef CONFIG_RANDOM_KMALLOC_CACHES
> -#define RANDOM_KMALLOC_CACHES_NR	15 // # of cache copies
> +#ifdef CONFIG_PARTITION_KMALLOC_CACHES
> +#define PARTITION_KMALLOC_CACHES_NR	15 // # of cache copies
>  #else
> -#define RANDOM_KMALLOC_CACHES_NR	0
> +#define PARTITION_KMALLOC_CACHES_NR	0
>  #endif
>  
>  /*
> @@ -634,8 +653,8 @@ enum kmalloc_cache_type {
>  #ifndef CONFIG_MEMCG
>  	KMALLOC_CGROUP = KMALLOC_NORMAL,
>  #endif
> -	KMALLOC_RANDOM_START = KMALLOC_NORMAL,
> -	KMALLOC_RANDOM_END = KMALLOC_RANDOM_START + RANDOM_KMALLOC_CACHES_NR,
> +	KMALLOC_PARTITION_START = KMALLOC_NORMAL,
> +	KMALLOC_PARTITION_END = KMALLOC_PARTITION_START + PARTITION_KMALLOC_CACHES_NR,
>  #ifdef CONFIG_SLUB_TINY
>  	KMALLOC_RECLAIM = KMALLOC_NORMAL,
>  #else
> @@ -662,9 +681,7 @@ extern kmem_buckets kmalloc_caches[NR_KMALLOC_TYPES];
>  	(IS_ENABLED(CONFIG_ZONE_DMA)   ? __GFP_DMA : 0) |	\
>  	(IS_ENABLED(CONFIG_MEMCG) ? __GFP_ACCOUNT : 0))
>  
> -extern unsigned long random_kmalloc_seed;
> -
> -static __always_inline enum kmalloc_cache_type kmalloc_type(gfp_t flags, unsigned long caller)
> +static __always_inline enum kmalloc_cache_type kmalloc_type(gfp_t flags, kmalloc_token_t token)
>  {
>  	/*
>  	 * The most common case is KMALLOC_NORMAL, so test for it
> @@ -672,9 +689,11 @@ static __always_inline enum kmalloc_cache_type kmalloc_type(gfp_t flags, unsigne
>  	 */
>  	if (likely((flags & KMALLOC_NOT_NORMAL_BITS) == 0))
>  #ifdef CONFIG_RANDOM_KMALLOC_CACHES
> -		/* RANDOM_KMALLOC_CACHES_NR (=15) copies + the KMALLOC_NORMAL */
> -		return KMALLOC_RANDOM_START + hash_64(caller ^ random_kmalloc_seed,
> -						      ilog2(RANDOM_KMALLOC_CACHES_NR + 1));
> +		/* PARTITION_KMALLOC_CACHES_NR (=15) copies + the KMALLOC_NORMAL */
> +		return KMALLOC_PARTITION_START + hash_64(token.v ^ random_kmalloc_seed,
> +							 ilog2(PARTITION_KMALLOC_CACHES_NR + 1));
> +#elif defined(CONFIG_TYPED_KMALLOC_CACHES)
> +		return KMALLOC_PARTITION_START + token.v;
>  #else
>  		return KMALLOC_NORMAL;
>  #endif
> @@ -858,16 +877,22 @@ unsigned int kmem_cache_sheaf_size(struct slab_sheaf *sheaf);
>  #define PASS_BUCKET_PARAM(_b)		NULL
>  #endif
>  
> +#define DECL_KMALLOC_PARAMS(_size, _b, _token) DECL_BUCKET_PARAMS(_size, _b) \
> +					       DECL_TOKEN_PARAM(_token)
> +
> +#define PASS_KMALLOC_PARAMS(_size, _b, _token) PASS_BUCKET_PARAMS(_size, _b) \
> +					       _PASS_TOKEN_PARAM(_token)
> +
>  /*
>   * The following functions are not to be used directly and are intended only
>   * for internal use from kmalloc() and kmalloc_node()
>   * with the exception of kunit tests
>   */
>  
> -void *__kmalloc_noprof(size_t size, gfp_t flags)
> +void *__kmalloc_noprof(DECL_KMALLOC_PARAMS(size, b, token), gfp_t flags)
>  				__assume_kmalloc_alignment __alloc_size(1);
>  
> -void *__kmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags, int node)
> +void *__kmalloc_node_noprof(DECL_KMALLOC_PARAMS(size, b, token), gfp_t flags, int node)
>  				__assume_kmalloc_alignment __alloc_size(1);
>  
>  void *__kmalloc_cache_noprof(struct kmem_cache *s, gfp_t flags, size_t size)
> @@ -938,7 +963,7 @@ void *__kmalloc_large_node_noprof(size_t size, gfp_t flags, int node)
>   *	Try really hard to succeed the allocation but fail
>   *	eventually.
>   */
> -static __always_inline __alloc_size(1) void *kmalloc_noprof(size_t size, gfp_t flags)
> +static __always_inline __alloc_size(1) void *_kmalloc_noprof(size_t size, gfp_t flags, kmalloc_token_t token)
>  {
>  	if (__builtin_constant_p(size) && size) {
>  		unsigned int index;
> @@ -948,14 +973,16 @@ static __always_inline __alloc_size(1) void *kmalloc_noprof(size_t size, gfp_t f
>  
>  		index = kmalloc_index(size);
>  		return __kmalloc_cache_noprof(
> -				kmalloc_caches[kmalloc_type(flags, _RET_IP_)][index],
> +				kmalloc_caches[kmalloc_type(flags, token)][index],
>  				flags, size);
>  	}
> -	return __kmalloc_noprof(size, flags);
> +	return __kmalloc_noprof(PASS_KMALLOC_PARAMS(size, NULL, token), flags);
>  }
> +#define kmalloc_noprof(...)			_kmalloc_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
>  #define kmalloc(...)				alloc_hooks(kmalloc_noprof(__VA_ARGS__))
>  
> -void *kmalloc_nolock_noprof(size_t size, gfp_t gfp_flags, int node);
> +void *_kmalloc_nolock_noprof(size_t size, gfp_t gfp_flags, int node DECL_TOKEN_PARAM(token));
> +#define kmalloc_nolock_noprof(...)		_kmalloc_nolock_noprof(__VA_ARGS__ _PASS_TOKEN_PARAM(__kmalloc_token(__VA_ARGS__)))
>  #define kmalloc_nolock(...)			alloc_hooks(kmalloc_nolock_noprof(__VA_ARGS__))
>  
>  /**
> @@ -1060,12 +1087,12 @@ void *kmalloc_nolock_noprof(size_t size, gfp_t gfp_flags, int node);
>  	__alloc_flex(kvzalloc, default_gfp(__VA_ARGS__), typeof(P), FAM, COUNT)
>  
>  #define kmem_buckets_alloc(_b, _size, _flags)	\
> -	alloc_hooks(__kmalloc_node_noprof(PASS_BUCKET_PARAMS(_size, _b), _flags, NUMA_NO_NODE))
> +	alloc_hooks(__kmalloc_node_noprof(PASS_KMALLOC_PARAMS(_size, _b, __kmalloc_token(_size)), _flags, NUMA_NO_NODE))
>  
>  #define kmem_buckets_alloc_track_caller(_b, _size, _flags)	\
> -	alloc_hooks(__kmalloc_node_track_caller_noprof(PASS_BUCKET_PARAMS(_size, _b), _flags, NUMA_NO_NODE, _RET_IP_))
> +	alloc_hooks(__kmalloc_node_track_caller_noprof(PASS_KMALLOC_PARAMS(_size, _b, __kmalloc_token(_size)), _flags, NUMA_NO_NODE, _RET_IP_))
>  
> -static __always_inline __alloc_size(1) void *kmalloc_node_noprof(size_t size, gfp_t flags, int node)
> +static __always_inline __alloc_size(1) void *_kmalloc_node_noprof(size_t size, gfp_t flags, int node, kmalloc_token_t token)
>  {
>  	if (__builtin_constant_p(size) && size) {
>  		unsigned int index;
> @@ -1075,11 +1102,12 @@ static __always_inline __alloc_size(1) void *kmalloc_node_noprof(size_t size, gf
>  
>  		index = kmalloc_index(size);
>  		return __kmalloc_cache_node_noprof(
> -				kmalloc_caches[kmalloc_type(flags, _RET_IP_)][index],
> +				kmalloc_caches[kmalloc_type(flags, token)][index],
>  				flags, node, size);
>  	}
> -	return __kmalloc_node_noprof(PASS_BUCKET_PARAMS(size, NULL), flags, node);
> +	return __kmalloc_node_noprof(PASS_KMALLOC_PARAMS(size, NULL, token), flags, node);
>  }
> +#define kmalloc_node_noprof(...)		_kmalloc_node_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
>  #define kmalloc_node(...)			alloc_hooks(kmalloc_node_noprof(__VA_ARGS__))
>  
>  /**
> @@ -1088,14 +1116,15 @@ static __always_inline __alloc_size(1) void *kmalloc_node_noprof(size_t size, gf
>   * @size: element size.
>   * @flags: the type of memory to allocate (see kmalloc).
>   */
> -static inline __alloc_size(1, 2) void *kmalloc_array_noprof(size_t n, size_t size, gfp_t flags)
> +static inline __alloc_size(1, 2) void *_kmalloc_array_noprof(size_t n, size_t size, gfp_t flags, kmalloc_token_t token)
>  {
>  	size_t bytes;
>  
>  	if (unlikely(check_mul_overflow(n, size, &bytes)))
>  		return NULL;
> -	return kmalloc_noprof(bytes, flags);
> +	return _kmalloc_noprof(bytes, flags, token);
>  }
> +#define kmalloc_array_noprof(...)		_kmalloc_array_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
>  #define kmalloc_array(...)			alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
>  
>  /**
> @@ -1115,18 +1144,19 @@ static inline __alloc_size(1, 2) void *kmalloc_array_noprof(size_t n, size_t siz
>   * In any case, the contents of the object pointed to are preserved up to the
>   * lesser of the new and old sizes.
>   */
> -static inline __realloc_size(2, 3) void * __must_check krealloc_array_noprof(void *p,
> +static inline __realloc_size(2, 3) void * __must_check _krealloc_array_noprof(void *p,
>  								       size_t new_n,
>  								       size_t new_size,
> -								       gfp_t flags)
> +								       gfp_t flags, kmalloc_token_t token)
>  {
>  	size_t bytes;
>  
>  	if (unlikely(check_mul_overflow(new_n, new_size, &bytes)))
>  		return NULL;
>  
> -	return krealloc_noprof(p, bytes, flags);
> +	return krealloc_node_align_noprof(p, bytes, 1, flags, NUMA_NO_NODE _PASS_TOKEN_PARAM(token));
>  }
> +#define krealloc_array_noprof(...)		_krealloc_array_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
>  #define krealloc_array(...)			alloc_hooks(krealloc_array_noprof(__VA_ARGS__))
>  
>  /**
> @@ -1137,10 +1167,10 @@ static inline __realloc_size(2, 3) void * __must_check krealloc_array_noprof(voi
>   */
>  #define kcalloc(n, size, flags)		kmalloc_array(n, size, (flags) | __GFP_ZERO)
>  
> -void *__kmalloc_node_track_caller_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags, int node,
> +void *__kmalloc_node_track_caller_noprof(DECL_KMALLOC_PARAMS(size, b, token), gfp_t flags, int node,
>  					 unsigned long caller) __alloc_size(1);
>  #define kmalloc_node_track_caller_noprof(size, flags, node, caller) \
> -	__kmalloc_node_track_caller_noprof(PASS_BUCKET_PARAMS(size, NULL), flags, node, caller)
> +	__kmalloc_node_track_caller_noprof(PASS_KMALLOC_PARAMS(size, NULL, __kmalloc_token(size)), flags, node, caller)
>  #define kmalloc_node_track_caller(...)		\
>  	alloc_hooks(kmalloc_node_track_caller_noprof(__VA_ARGS__, _RET_IP_))
>  
> @@ -1157,17 +1187,18 @@ void *__kmalloc_node_track_caller_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flag
>  #define kmalloc_track_caller_noprof(...)	\
>  		kmalloc_node_track_caller_noprof(__VA_ARGS__, NUMA_NO_NODE, _RET_IP_)
>  
> -static inline __alloc_size(1, 2) void *kmalloc_array_node_noprof(size_t n, size_t size, gfp_t flags,
> -							  int node)
> +static inline __alloc_size(1, 2) void *_kmalloc_array_node_noprof(size_t n, size_t size, gfp_t flags,
> +								  int node, kmalloc_token_t token)
>  {
>  	size_t bytes;
>  
>  	if (unlikely(check_mul_overflow(n, size, &bytes)))
>  		return NULL;
>  	if (__builtin_constant_p(n) && __builtin_constant_p(size))
> -		return kmalloc_node_noprof(bytes, flags, node);
> -	return __kmalloc_node_noprof(PASS_BUCKET_PARAMS(bytes, NULL), flags, node);
> +		return _kmalloc_node_noprof(bytes, flags, node, token);
> +	return __kmalloc_node_noprof(PASS_KMALLOC_PARAMS(bytes, NULL, token), flags, node);
>  }
> +#define kmalloc_array_node_noprof(...)		_kmalloc_array_node_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
>  #define kmalloc_array_node(...)			alloc_hooks(kmalloc_array_node_noprof(__VA_ARGS__))
>  
>  #define kcalloc_node(_n, _size, _flags, _node)	\
> @@ -1183,39 +1214,43 @@ static inline __alloc_size(1, 2) void *kmalloc_array_node_noprof(size_t n, size_
>   * @size: how many bytes of memory are required.
>   * @flags: the type of memory to allocate (see kmalloc).
>   */
> -static inline __alloc_size(1) void *kzalloc_noprof(size_t size, gfp_t flags)
> +static inline __alloc_size(1) void *_kzalloc_noprof(size_t size, gfp_t flags, kmalloc_token_t token)
>  {
> -	return kmalloc_noprof(size, flags | __GFP_ZERO);
> +	return _kmalloc_noprof(size, flags | __GFP_ZERO, token);
>  }
> +#define kzalloc_noprof(...)			_kzalloc_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
>  #define kzalloc(...)				alloc_hooks(kzalloc_noprof(__VA_ARGS__))
>  #define kzalloc_node(_size, _flags, _node)	kmalloc_node(_size, (_flags)|__GFP_ZERO, _node)
>  
> -void *__kvmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), unsigned long align,
> +void *__kvmalloc_node_noprof(DECL_KMALLOC_PARAMS(size, b, token), unsigned long align,
>  			     gfp_t flags, int node) __alloc_size(1);
>  #define kvmalloc_node_align_noprof(_size, _align, _flags, _node)	\
> -	__kvmalloc_node_noprof(PASS_BUCKET_PARAMS(_size, NULL), _align, _flags, _node)
> +	__kvmalloc_node_noprof(PASS_KMALLOC_PARAMS(_size, NULL, __kmalloc_token(_size)), _align, _flags, _node)
>  #define kvmalloc_node_align(...)		\
>  	alloc_hooks(kvmalloc_node_align_noprof(__VA_ARGS__))
>  #define kvmalloc_node(_s, _f, _n)		kvmalloc_node_align(_s, 1, _f, _n)
> +#define kvmalloc_node_noprof(size, flags, node)	\
> +	kvmalloc_node_align_noprof(size, 1, flags, node)
>  #define kvmalloc(...)				kvmalloc_node(__VA_ARGS__, NUMA_NO_NODE)
> +#define kvmalloc_noprof(_size, _flags)		kvmalloc_node_noprof(_size, _flags, NUMA_NO_NODE)
>  #define kvzalloc(_size, _flags)			kvmalloc(_size, (_flags)|__GFP_ZERO)
>  
>  #define kvzalloc_node(_size, _flags, _node)	kvmalloc_node(_size, (_flags)|__GFP_ZERO, _node)
>  
>  #define kmem_buckets_valloc(_b, _size, _flags)	\
> -	alloc_hooks(__kvmalloc_node_noprof(PASS_BUCKET_PARAMS(_size, _b), 1, _flags, NUMA_NO_NODE))
> +	alloc_hooks(__kvmalloc_node_noprof(PASS_KMALLOC_PARAMS(_size, _b, __kmalloc_token(_size)), 1, _flags, NUMA_NO_NODE))
>  
>  static inline __alloc_size(1, 2) void *
> -kvmalloc_array_node_noprof(size_t n, size_t size, gfp_t flags, int node)
> +_kvmalloc_array_node_noprof(size_t n, size_t size, gfp_t flags, int node, kmalloc_token_t token)
>  {
>  	size_t bytes;
>  
>  	if (unlikely(check_mul_overflow(n, size, &bytes)))
>  		return NULL;
>  
> -	return kvmalloc_node_align_noprof(bytes, 1, flags, node);
> +	return __kvmalloc_node_noprof(PASS_KMALLOC_PARAMS(bytes, NULL, token), 1, flags, node);
>  }
> -
> +#define kvmalloc_array_node_noprof(...)		_kvmalloc_array_node_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
>  #define kvmalloc_array_noprof(...)		kvmalloc_array_node_noprof(__VA_ARGS__, NUMA_NO_NODE)
>  #define kvcalloc_node_noprof(_n,_s,_f,_node)	kvmalloc_array_node_noprof(_n,_s,(_f)|__GFP_ZERO,_node)
>  #define kvcalloc_noprof(...)			kvcalloc_node_noprof(__VA_ARGS__, NUMA_NO_NODE)
> @@ -1225,9 +1260,9 @@ kvmalloc_array_node_noprof(size_t n, size_t size, gfp_t flags, int node)
>  #define kvcalloc(...)				alloc_hooks(kvcalloc_noprof(__VA_ARGS__))
>  
>  void *kvrealloc_node_align_noprof(const void *p, size_t size, unsigned long align,
> -				  gfp_t flags, int nid) __realloc_size(2);
> +				  gfp_t flags, int nid DECL_TOKEN_PARAM(token)) __realloc_size(2);
>  #define kvrealloc_node_align(...)		\
> -	alloc_hooks(kvrealloc_node_align_noprof(__VA_ARGS__))
> +	alloc_hooks(kvrealloc_node_align_noprof(__VA_ARGS__ _PASS_TOKEN_PARAM(__kmalloc_token(__VA_ARGS__))))
>  #define kvrealloc_node(_p, _s, _f, _n)		kvrealloc_node_align(_p, _s, 1, _f, _n)
>  #define kvrealloc(...)				kvrealloc_node(__VA_ARGS__, NUMA_NO_NODE)
>  
> diff --git a/kernel/configs/hardening.config b/kernel/configs/hardening.config
> index 7c3924614e01..2963b6bd890f 100644
> --- a/kernel/configs/hardening.config
> +++ b/kernel/configs/hardening.config
> @@ -22,7 +22,7 @@ CONFIG_SLAB_FREELIST_RANDOM=y
>  CONFIG_SLAB_FREELIST_HARDENED=y
>  CONFIG_SLAB_BUCKETS=y
>  CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
> -CONFIG_RANDOM_KMALLOC_CACHES=y
> +CONFIG_PARTITION_KMALLOC_CACHES=y
>  
>  # Sanity check userspace page table mappings.
>  CONFIG_PAGE_TABLE_CHECK=y
> diff --git a/mm/Kconfig b/mm/Kconfig
> index ebd8ea353687..47f323816de7 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -247,22 +247,67 @@ config SLUB_STATS
>  	  out which slabs are relevant to a particular load.
>  	  Try running: slabinfo -DA
>  
> -config RANDOM_KMALLOC_CACHES
> -	default n
> +config PARTITION_KMALLOC_CACHES
>  	depends on !SLUB_TINY
> -	bool "Randomize slab caches for normal kmalloc"
> +	bool "Partitioned slab caches for normal kmalloc"
>  	help
> -	  A hardening feature that creates multiple copies of slab caches for
> -	  normal kmalloc allocation and makes kmalloc randomly pick one based
> -	  on code address, which makes the attackers more difficult to spray
> -	  vulnerable memory objects on the heap for the purpose of exploiting
> -	  memory vulnerabilities.
> +	  A hardening feature that creates multiple isolated copies of slab
> +	  caches for normal kmalloc allocations. This makes it more difficult
> +	  to exploit memory-safety vulnerabilities by attacking vulnerable
> +	  co-located memory objects. Several modes are provided.
>  
>  	  Currently the number of copies is set to 16, a reasonably large value
>  	  that effectively diverges the memory objects allocated for different
>  	  subsystems or modules into different caches, at the expense of a
> -	  limited degree of memory and CPU overhead that relates to hardware and
> -	  system workload.
> +	  limited degree of memory and CPU overhead that relates to hardware
> +	  and system workload.
> +
> +choice
> +	prompt "Partitioned slab cache mode"
> +	depends on PARTITION_KMALLOC_CACHES
> +	default RANDOM_KMALLOC_CACHES
> +	help
> +	  Selects the slab cache partitioning mode.
> +
> +config RANDOM_KMALLOC_CACHES
> +	bool "Randomize slab caches for normal kmalloc"
> +	help
> +	  Randomly pick a slab cache based on code address and a per-boot
> +	  random seed.
> +
> +	  This makes it harder for attackers to predict object co-location.
> +	  The placement is random: while attackers don't know which kmalloc
> +	  cache an object will be allocated from, they might circumvent
> +	  the randomization by retrying attacks across multiple machines until
> +	  the target objects are co-located.
> +
> +config TYPED_KMALLOC_CACHES
> +	bool "Type based slab cache selection for normal kmalloc"
> +	depends on $(cc-option,-falloc-token-max=123)
> +	help
> +	  Rely on Clang's allocation tokens to choose a slab cache, where token
> +	  IDs are derived from the allocated type.
> +
> +	  Unlike RANDOM_KMALLOC_CACHES, cache assignment is deterministic based
> +	  on type, which guarantees that objects of certain types are not
> +	  placed in the same cache. This effectively mitigates certain classes
> +	  of exploits that probabilistic defenses like RANDOM_KMALLOC_CACHES
> +	  only make harder but not impossible. However, this also means the
> +	  cache assignment is predictable.
> +
> +	  Clang's default token ID calculation returns a bounded hash with
> +	  disjoint ranges for pointer-containing and pointerless objects: when
> +	  used as the slab cache index, this prevents buffer overflows on
> +	  primitive buffers from directly corrupting pointer-containing
> +	  objects.
> +
> +	  The current effectiveness of Clang's type inference can be judged by
> +	  -Rpass=alloc-token, which provides diagnostics where (after dead-code
> +	  elimination) type inference failed.
> +
> +	  Requires Clang 22 or later.
> +
> +endchoice
>  
>  endmenu # Slab allocator options
>  
> diff --git a/mm/kfence/kfence_test.c b/mm/kfence/kfence_test.c
> index 5725a367246d..8807ea8ed0d3 100644
> --- a/mm/kfence/kfence_test.c
> +++ b/mm/kfence/kfence_test.c
> @@ -214,7 +214,7 @@ static void test_cache_destroy(void)
>  static inline size_t kmalloc_cache_alignment(size_t size)
>  {
>  	/* just to get ->align so no need to pass in the real caller */
> -	enum kmalloc_cache_type type = kmalloc_type(GFP_KERNEL, 0);
> +	enum kmalloc_cache_type type = kmalloc_type(GFP_KERNEL, __kmalloc_token(0));
>  	return kmalloc_caches[type][__kmalloc_index(size, false)]->align;
>  }
>  
> @@ -285,7 +285,7 @@ static void *test_alloc(struct kunit *test, size_t size, gfp_t gfp, enum allocat
>  
>  		if (is_kfence_address(alloc)) {
>  			struct slab *slab = virt_to_slab(alloc);
> -			enum kmalloc_cache_type type = kmalloc_type(GFP_KERNEL, _RET_IP_);
> +			enum kmalloc_cache_type type = kmalloc_type(GFP_KERNEL, __kmalloc_token(size));
>  			struct kmem_cache *s = test_cache ?:
>  					kmalloc_caches[type][__kmalloc_index(size, false)];
>  
> diff --git a/mm/slab.h b/mm/slab.h
> index e9ab292acd22..dd49d37e253d 100644
> --- a/mm/slab.h
> +++ b/mm/slab.h
> @@ -361,12 +361,12 @@ static inline unsigned int size_index_elem(unsigned int bytes)
>   * KMALLOC_MAX_CACHE_SIZE and the caller must check that.
>   */
>  static inline struct kmem_cache *
> -kmalloc_slab(size_t size, kmem_buckets *b, gfp_t flags, unsigned long caller)
> +kmalloc_slab(size_t size, kmem_buckets *b, gfp_t flags, kmalloc_token_t token)
>  {
>  	unsigned int index;
>  
>  	if (!b)
> -		b = &kmalloc_caches[kmalloc_type(flags, caller)];
> +		b = &kmalloc_caches[kmalloc_type(flags, token)];
>  	if (size <= 192)
>  		index = kmalloc_size_index[size_index_elem(size)];
>  	else
> diff --git a/mm/slab_common.c b/mm/slab_common.c
> index d5a70a831a2a..21ab7dd79b5e 100644
> --- a/mm/slab_common.c
> +++ b/mm/slab_common.c
> @@ -787,7 +787,7 @@ size_t kmalloc_size_roundup(size_t size)
>  		 * The flags don't matter since size_index is common to all.
>  		 * Neither does the caller for just getting ->object_size.
>  		 */
> -		return kmalloc_slab(size, NULL, GFP_KERNEL, 0)->object_size;
> +		return kmalloc_slab(size, NULL, GFP_KERNEL, __kmalloc_token(0))->object_size;
>  	}
>  
>  	/* Above the smaller buckets, size is a multiple of page size. */
> @@ -821,26 +821,26 @@ EXPORT_SYMBOL(kmalloc_size_roundup);
>  #define KMALLOC_RCL_NAME(sz)
>  #endif
>  
> -#ifdef CONFIG_RANDOM_KMALLOC_CACHES
> -#define __KMALLOC_RANDOM_CONCAT(a, b) a ## b
> -#define KMALLOC_RANDOM_NAME(N, sz) __KMALLOC_RANDOM_CONCAT(KMA_RAND_, N)(sz)
> -#define KMA_RAND_1(sz)                  .name[KMALLOC_RANDOM_START +  1] = "kmalloc-rnd-01-" #sz,
> -#define KMA_RAND_2(sz)  KMA_RAND_1(sz)  .name[KMALLOC_RANDOM_START +  2] = "kmalloc-rnd-02-" #sz,
> -#define KMA_RAND_3(sz)  KMA_RAND_2(sz)  .name[KMALLOC_RANDOM_START +  3] = "kmalloc-rnd-03-" #sz,
> -#define KMA_RAND_4(sz)  KMA_RAND_3(sz)  .name[KMALLOC_RANDOM_START +  4] = "kmalloc-rnd-04-" #sz,
> -#define KMA_RAND_5(sz)  KMA_RAND_4(sz)  .name[KMALLOC_RANDOM_START +  5] = "kmalloc-rnd-05-" #sz,
> -#define KMA_RAND_6(sz)  KMA_RAND_5(sz)  .name[KMALLOC_RANDOM_START +  6] = "kmalloc-rnd-06-" #sz,
> -#define KMA_RAND_7(sz)  KMA_RAND_6(sz)  .name[KMALLOC_RANDOM_START +  7] = "kmalloc-rnd-07-" #sz,
> -#define KMA_RAND_8(sz)  KMA_RAND_7(sz)  .name[KMALLOC_RANDOM_START +  8] = "kmalloc-rnd-08-" #sz,
> -#define KMA_RAND_9(sz)  KMA_RAND_8(sz)  .name[KMALLOC_RANDOM_START +  9] = "kmalloc-rnd-09-" #sz,
> -#define KMA_RAND_10(sz) KMA_RAND_9(sz)  .name[KMALLOC_RANDOM_START + 10] = "kmalloc-rnd-10-" #sz,
> -#define KMA_RAND_11(sz) KMA_RAND_10(sz) .name[KMALLOC_RANDOM_START + 11] = "kmalloc-rnd-11-" #sz,
> -#define KMA_RAND_12(sz) KMA_RAND_11(sz) .name[KMALLOC_RANDOM_START + 12] = "kmalloc-rnd-12-" #sz,
> -#define KMA_RAND_13(sz) KMA_RAND_12(sz) .name[KMALLOC_RANDOM_START + 13] = "kmalloc-rnd-13-" #sz,
> -#define KMA_RAND_14(sz) KMA_RAND_13(sz) .name[KMALLOC_RANDOM_START + 14] = "kmalloc-rnd-14-" #sz,
> -#define KMA_RAND_15(sz) KMA_RAND_14(sz) .name[KMALLOC_RANDOM_START + 15] = "kmalloc-rnd-15-" #sz,
> -#else // CONFIG_RANDOM_KMALLOC_CACHES
> -#define KMALLOC_RANDOM_NAME(N, sz)
> +#ifdef CONFIG_PARTITION_KMALLOC_CACHES
> +#define __KMALLOC_PARTITION_CONCAT(a, b) a ## b
> +#define KMALLOC_PARTITION_NAME(N, sz) __KMALLOC_PARTITION_CONCAT(KMA_PART_, N)(sz)
> +#define KMA_PART_1(sz)                  .name[KMALLOC_PARTITION_START +  1] = "kmalloc-part-01-" #sz,
> +#define KMA_PART_2(sz)  KMA_PART_1(sz)  .name[KMALLOC_PARTITION_START +  2] = "kmalloc-part-02-" #sz,
> +#define KMA_PART_3(sz)  KMA_PART_2(sz)  .name[KMALLOC_PARTITION_START +  3] = "kmalloc-part-03-" #sz,
> +#define KMA_PART_4(sz)  KMA_PART_3(sz)  .name[KMALLOC_PARTITION_START +  4] = "kmalloc-part-04-" #sz,
> +#define KMA_PART_5(sz)  KMA_PART_4(sz)  .name[KMALLOC_PARTITION_START +  5] = "kmalloc-part-05-" #sz,
> +#define KMA_PART_6(sz)  KMA_PART_5(sz)  .name[KMALLOC_PARTITION_START +  6] = "kmalloc-part-06-" #sz,
> +#define KMA_PART_7(sz)  KMA_PART_6(sz)  .name[KMALLOC_PARTITION_START +  7] = "kmalloc-part-07-" #sz,
> +#define KMA_PART_8(sz)  KMA_PART_7(sz)  .name[KMALLOC_PARTITION_START +  8] = "kmalloc-part-08-" #sz,
> +#define KMA_PART_9(sz)  KMA_PART_8(sz)  .name[KMALLOC_PARTITION_START +  9] = "kmalloc-part-09-" #sz,
> +#define KMA_PART_10(sz) KMA_PART_9(sz)  .name[KMALLOC_PARTITION_START + 10] = "kmalloc-part-10-" #sz,
> +#define KMA_PART_11(sz) KMA_PART_10(sz) .name[KMALLOC_PARTITION_START + 11] = "kmalloc-part-11-" #sz,
> +#define KMA_PART_12(sz) KMA_PART_11(sz) .name[KMALLOC_PARTITION_START + 12] = "kmalloc-part-12-" #sz,
> +#define KMA_PART_13(sz) KMA_PART_12(sz) .name[KMALLOC_PARTITION_START + 13] = "kmalloc-part-13-" #sz,
> +#define KMA_PART_14(sz) KMA_PART_13(sz) .name[KMALLOC_PARTITION_START + 14] = "kmalloc-part-14-" #sz,
> +#define KMA_PART_15(sz) KMA_PART_14(sz) .name[KMALLOC_PARTITION_START + 15] = "kmalloc-part-15-" #sz,
> +#else // CONFIG_PARTITION_KMALLOC_CACHES
> +#define KMALLOC_PARTITION_NAME(N, sz)
>  #endif
>  
>  #define INIT_KMALLOC_INFO(__size, __short_size)			\
> @@ -849,7 +849,7 @@ EXPORT_SYMBOL(kmalloc_size_roundup);
>  	KMALLOC_RCL_NAME(__short_size)				\
>  	KMALLOC_CGROUP_NAME(__short_size)			\
>  	KMALLOC_DMA_NAME(__short_size)				\
> -	KMALLOC_RANDOM_NAME(RANDOM_KMALLOC_CACHES_NR, __short_size)	\
> +	KMALLOC_PARTITION_NAME(PARTITION_KMALLOC_CACHES_NR, __short_size)	\
>  	.size = __size,						\
>  }
>  
> @@ -961,8 +961,8 @@ new_kmalloc_cache(int idx, enum kmalloc_cache_type type)
>  		flags |= SLAB_CACHE_DMA;
>  	}
>  
> -#ifdef CONFIG_RANDOM_KMALLOC_CACHES
> -	if (type >= KMALLOC_RANDOM_START && type <= KMALLOC_RANDOM_END)
> +#ifdef CONFIG_PARTITION_KMALLOC_CACHES
> +	if (type >= KMALLOC_PARTITION_START && type <= KMALLOC_PARTITION_END)
>  		flags |= SLAB_NO_MERGE;
>  #endif
>  
> diff --git a/mm/slub.c b/mm/slub.c
> index 2b2d33cc735c..f033aae90bdc 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -2125,11 +2125,11 @@ static inline size_t obj_exts_alloc_size(struct kmem_cache *s,
>  	if (!is_kmalloc_normal(s))
>  		return sz;
>  
> -	obj_exts_cache = kmalloc_slab(sz, NULL, gfp, 0);
> +	obj_exts_cache = kmalloc_slab(sz, NULL, gfp, __kmalloc_token(0));
>  	/*
> -	 * We can't simply compare s with obj_exts_cache, because random kmalloc
> -	 * caches have multiple caches per size, selected by caller address.
> -	 * Since caller address may differ between kmalloc_slab() and actual
> +	 * We can't simply compare s with obj_exts_cache, because partitioned kmalloc
> +	 * caches have multiple caches per size, selected by caller address or type.
> +	 * Since caller address or type may differ between kmalloc_slab() and actual
>  	 * allocation, bump size when sizes are equal.
>  	 */
>  	if (s->object_size == obj_exts_cache->object_size)
> @@ -5239,7 +5239,7 @@ EXPORT_SYMBOL(__kmalloc_large_node_noprof);
>  
>  static __always_inline
>  void *__do_kmalloc_node(size_t size, kmem_buckets *b, gfp_t flags, int node,
> -			unsigned long caller)
> +			unsigned long caller, kmalloc_token_t token)
>  {
>  	struct kmem_cache *s;
>  	void *ret;
> @@ -5254,22 +5254,24 @@ void *__do_kmalloc_node(size_t size, kmem_buckets *b, gfp_t flags, int node,
>  	if (unlikely(!size))
>  		return ZERO_SIZE_PTR;
>  
> -	s = kmalloc_slab(size, b, flags, caller);
> +	s = kmalloc_slab(size, b, flags, token);
>  
>  	ret = slab_alloc_node(s, NULL, flags, node, caller, size);
>  	ret = kasan_kmalloc(s, ret, size, flags);
>  	trace_kmalloc(caller, ret, size, s->size, flags, node);
>  	return ret;
>  }
> -void *__kmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags, int node)
> +void *__kmalloc_node_noprof(DECL_KMALLOC_PARAMS(size, b, token), gfp_t flags, int node)
>  {
> -	return __do_kmalloc_node(size, PASS_BUCKET_PARAM(b), flags, node, _RET_IP_);
> +	return __do_kmalloc_node(size, PASS_BUCKET_PARAM(b), flags, node,
> +				 _RET_IP_, PASS_TOKEN_PARAM(token));
>  }
>  EXPORT_SYMBOL(__kmalloc_node_noprof);
>  
> -void *__kmalloc_noprof(size_t size, gfp_t flags)
> +void *__kmalloc_noprof(DECL_KMALLOC_PARAMS(size, b, token), gfp_t flags)
>  {
> -	return __do_kmalloc_node(size, NULL, flags, NUMA_NO_NODE, _RET_IP_);
> +	return __do_kmalloc_node(size, PASS_BUCKET_PARAM(b), flags,
> +				 NUMA_NO_NODE, _RET_IP_, PASS_TOKEN_PARAM(token));
>  }
>  EXPORT_SYMBOL(__kmalloc_noprof);
>  
> @@ -5284,7 +5286,7 @@ EXPORT_SYMBOL(__kmalloc_noprof);
>   * NULL does not mean EBUSY or EAGAIN. It means ENOMEM.
>   * There is no reason to call it again and expect !NULL.
>   */
> -void *kmalloc_nolock_noprof(size_t size, gfp_t gfp_flags, int node)
> +void *_kmalloc_nolock_noprof(size_t size, gfp_t gfp_flags, int node DECL_TOKEN_PARAM(token))
>  {
>  	gfp_t alloc_gfp = __GFP_NOWARN | __GFP_NOMEMALLOC | gfp_flags;
>  	struct kmem_cache *s;
> @@ -5307,7 +5309,7 @@ void *kmalloc_nolock_noprof(size_t size, gfp_t gfp_flags, int node)
>  retry:
>  	if (unlikely(size > KMALLOC_MAX_CACHE_SIZE))
>  		return NULL;
> -	s = kmalloc_slab(size, NULL, alloc_gfp, _RET_IP_);
> +	s = kmalloc_slab(size, NULL, alloc_gfp, PASS_TOKEN_PARAM(token));
>  
>  	if (!(s->flags & __CMPXCHG_DOUBLE) && !kmem_cache_debug(s))
>  		/*
> @@ -5360,12 +5362,13 @@ void *kmalloc_nolock_noprof(size_t size, gfp_t gfp_flags, int node)
>  	ret = kasan_kmalloc(s, ret, size, alloc_gfp);
>  	return ret;
>  }
> -EXPORT_SYMBOL_GPL(kmalloc_nolock_noprof);
> +EXPORT_SYMBOL_GPL(_kmalloc_nolock_noprof);
>  
> -void *__kmalloc_node_track_caller_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags,
> +void *__kmalloc_node_track_caller_noprof(DECL_KMALLOC_PARAMS(size, b, token), gfp_t flags,
>  					 int node, unsigned long caller)
>  {
> -	return __do_kmalloc_node(size, PASS_BUCKET_PARAM(b), flags, node, caller);
> +	return __do_kmalloc_node(size, PASS_BUCKET_PARAM(b), flags, node,
> +				 caller, PASS_TOKEN_PARAM(token));
>  
>  }
>  EXPORT_SYMBOL(__kmalloc_node_track_caller_noprof);
> @@ -6555,7 +6558,7 @@ void kfree_nolock(const void *object)
>  EXPORT_SYMBOL_GPL(kfree_nolock);
>  
>  static __always_inline __realloc_size(2) void *
> -__do_krealloc(const void *p, size_t new_size, unsigned long align, gfp_t flags, int nid)
> +__do_krealloc(const void *p, size_t new_size, unsigned long align, gfp_t flags, int nid, kmalloc_token_t token)
>  {
>  	void *ret;
>  	size_t ks = 0;
> @@ -6627,7 +6630,7 @@ __do_krealloc(const void *p, size_t new_size, unsigned long align, gfp_t flags,
>  	return (void *)p;
>  
>  alloc_new:
> -	ret = kmalloc_node_track_caller_noprof(new_size, flags, nid, _RET_IP_);
> +	ret = __kmalloc_node_track_caller_noprof(PASS_KMALLOC_PARAMS(new_size, NULL, token), flags, nid, _RET_IP_);
>  	if (ret && p) {
>  		/* Disable KASAN checks as the object's redzone is accessed. */
>  		kasan_disable_current();
> @@ -6677,7 +6680,7 @@ __do_krealloc(const void *p, size_t new_size, unsigned long align, gfp_t flags,
>   * Return: pointer to the allocated memory or %NULL in case of error
>   */
>  void *krealloc_node_align_noprof(const void *p, size_t new_size, unsigned long align,
> -				 gfp_t flags, int nid)
> +				 gfp_t flags, int nid DECL_TOKEN_PARAM(token))
>  {
>  	void *ret;
>  
> @@ -6686,7 +6689,7 @@ void *krealloc_node_align_noprof(const void *p, size_t new_size, unsigned long a
>  		return ZERO_SIZE_PTR;
>  	}
>  
> -	ret = __do_krealloc(p, new_size, align, flags, nid);
> +	ret = __do_krealloc(p, new_size, align, flags, nid, PASS_TOKEN_PARAM(token));
>  	if (ret && kasan_reset_tag(p) != kasan_reset_tag(ret))
>  		kfree(p);
>  
> @@ -6723,6 +6726,7 @@ static gfp_t kmalloc_gfp_adjust(gfp_t flags, size_t size)
>   * failure, fall back to non-contiguous (vmalloc) allocation.
>   * @size: size of the request.
>   * @b: which set of kmalloc buckets to allocate from.
> + * @token: allocation token.
>   * @align: desired alignment.
>   * @flags: gfp mask for the allocation - must be compatible (superset) with GFP_KERNEL.
>   * @node: numa node to allocate from
> @@ -6739,7 +6743,7 @@ static gfp_t kmalloc_gfp_adjust(gfp_t flags, size_t size)
>   *
>   * Return: pointer to the allocated memory of %NULL in case of failure
>   */
> -void *__kvmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), unsigned long align,
> +void *__kvmalloc_node_noprof(DECL_KMALLOC_PARAMS(size, b, token), unsigned long align,
>  			     gfp_t flags, int node)
>  {
>  	bool allow_block;
> @@ -6751,7 +6755,7 @@ void *__kvmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), unsigned long align,
>  	 */
>  	ret = __do_kmalloc_node(size, PASS_BUCKET_PARAM(b),
>  				kmalloc_gfp_adjust(flags, size),
> -				node, _RET_IP_);
> +				node, _RET_IP_, PASS_TOKEN_PARAM(token));
>  	if (ret || size <= PAGE_SIZE)
>  		return ret;
>  
> @@ -6848,17 +6852,17 @@ EXPORT_SYMBOL(kvfree_sensitive);
>   * Return: pointer to the allocated memory or %NULL in case of error
>   */
>  void *kvrealloc_node_align_noprof(const void *p, size_t size, unsigned long align,
> -				  gfp_t flags, int nid)
> +				  gfp_t flags, int nid DECL_TOKEN_PARAM(token))
>  {
>  	void *n;
>  
>  	if (is_vmalloc_addr(p))
>  		return vrealloc_node_align_noprof(p, size, align, flags, nid);
>  
> -	n = krealloc_node_align_noprof(p, size, align, kmalloc_gfp_adjust(flags, size), nid);
> +	n = krealloc_node_align_noprof(p, size, align, kmalloc_gfp_adjust(flags, size), nid _PASS_TOKEN_PARAM(token));
>  	if (!n) {
>  		/* We failed to krealloc(), fall back to kvmalloc(). */
> -		n = kvmalloc_node_align_noprof(size, align, flags, nid);
> +		n = __kvmalloc_node_noprof(PASS_KMALLOC_PARAMS(size, NULL, token), align, flags, nid);
>  		if (!n)
>  			return NULL;
>  
> @@ -8351,7 +8355,7 @@ static void __init bootstrap_kmalloc_sheaves(void)
>  {
>  	enum kmalloc_cache_type type;
>  
> -	for (type = KMALLOC_NORMAL; type <= KMALLOC_RANDOM_END; type++) {
> +	for (type = KMALLOC_NORMAL; type <= KMALLOC_PARTITION_END; type++) {
>  		for (int idx = 0; idx < KMALLOC_SHIFT_HIGH + 1; idx++) {
>  			if (kmalloc_caches[type][idx])
>  				bootstrap_cache_sheaves(kmalloc_caches[type][idx]);
> -- 
> 2.54.0.rc1.513.gad8abe7a5a-goog
> 

