Return-Path: <linux-kbuild+bounces-12685-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIa0CmQ202l4fwcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12685-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 06:28:20 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CA23A16D9
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 06:28:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08DE03002A33
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Apr 2026 04:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9509834CFA1;
	Mon,  6 Apr 2026 04:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LrIhyVRw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E8734A788;
	Mon,  6 Apr 2026 04:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775449696; cv=none; b=RFl/vLDyrgq4UnO7Ca93grurU8ytex6RvKjuymU7JY0yFUpE4VvrTEepdh5jud7uP+E/lCbopOELLAb1XX8TfjgRUVOUPSjAzlYtrrgSY5+iu+Q4tTcmE1sTPZD035nqsXY+4hUIpzf4brMdTzg1AL5n9tA4eSCgYUMlTicGloI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775449696; c=relaxed/simple;
	bh=uYGceNTzNuZmnfMgHyxFjYMImRSA6EY2IdzY776syzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mlani9lGQlXObkyqMvelX+SiQMXAS15vVKmKuhnwcOQCDpnk42cDQHxyAJJWdd5SrgbWI+gZIArsP6aDwbKp+G+4Pl0+SDV17q7B67F9BhcW/jIHSQo5VZJDbAbn4XYoQ5VCJOeTafgJtadGu3vBgWC39GXos9la9gD9DqqVeus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LrIhyVRw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD13C4CEF7;
	Mon,  6 Apr 2026 04:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775449695;
	bh=uYGceNTzNuZmnfMgHyxFjYMImRSA6EY2IdzY776syzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LrIhyVRwlhPr2buj/spqkEinh0TSUCphFFxWRJXa2SZtyWFV6c4MxfuD5ms92G8Gl
	 vF2Xwudli8dgQTWDDFEh2TVvmX9GKFpLuavPEKdvydy+HtFjT5cJUef0ABrMCT60Bh
	 7jGHLax2sgOPSsQvn0dFRvioqMBwroi6D1bIVOv3zMa8uJc1tQU4nXJY0ouygzxw4d
	 BSuRScIDayM5+b1FbWHSly4IL1lsYndWt71ihRoSN3F/8njW79cQ5nAfOC8QuJgyYW
	 JRi2kSAo5UKGNlmcsgsdFWu0K7wAXftMgPVNCSFAi5N4Xegxsa1y1AlDGKWok42OFq
	 MW/UF3hsWgP/w==
Date: Mon, 6 Apr 2026 13:28:13 +0900
From: "Harry Yoo (Oracle)" <harry@kernel.org>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Marco Elver <elver@google.com>,
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
	Florent Revest <revest@google.com>,
	GONG Ruiqi <gongruiqi@huaweicloud.com>,
	Jann Horn <jannh@google.com>, KP Singh <kpsingh@kernel.org>,
	Matteo Rizzo <matteorizzo@google.com>
Subject: Re: [PATCH v1] slab: support for compiler-assisted type-based slab
 cache partitioning
Message-ID: <adM2XVZf1DekahlY@hyeyoo>
References: <20260331111240.153913-1-elver@google.com>
 <ac9d5O5XehnXRc5A@hyeyoo>
 <d0fe363c-2e8f-44a4-9b64-3fa3ba9a5773@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0fe363c-2e8f-44a4-9b64-3fa3ba9a5773@kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12685-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[google.com,linux-foundation.org,kernel.org,gentwo.org,linux.dev,oracle.com,suse.com,gmail.com,vger.kernel.org,kvack.org,googlegroups.com,lists.linux.dev,huaweicloud.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harry@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 85CA23A16D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 08:29:22PM +0200, Vlastimil Babka (SUSE) wrote:
> On 4/3/26 08:27, Harry Yoo (Oracle) wrote:
> >> diff --git a/include/linux/slab.h b/include/linux/slab.h
> >> index 15a60b501b95..c0bf00ee6025 100644
> >> --- a/include/linux/slab.h
> >> +++ b/include/linux/slab.h
> >> @@ -864,10 +877,10 @@ unsigned int kmem_cache_sheaf_size(struct slab_sheaf *sheaf);
> >>   * with the exception of kunit tests
> >>   */
> >>  
> >> -void *__kmalloc_noprof(size_t size, gfp_t flags)
> >> +void *__kmalloc_noprof(size_t size, gfp_t flags, kmalloc_token_t token)
> >>  				__assume_kmalloc_alignment __alloc_size(1);
> >>  
> >> -void *__kmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags, int node)
> >> +void *__kmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags, int node, kmalloc_token_t token)
> >>  				__assume_kmalloc_alignment __alloc_size(1);
> > 
> > So the @token parameter is unused when CONFIG_PARTITION_KMALLOC_CACHES is
> > disabled but still increases the kernel size by a few kilobytes...
> > but yeah I'm not sure if we can get avoid it without hurting readability.
> > 
> > Just saying. (does anybody care?)
> 
> Well we did care enough with CONFIG_SLAB_BUCKETS to hide the unused param
> using DECL_BUCKET_PARAMS(),

Hmm yeah.

I wasn't sure if we could do this without hurting readability,
but perhaps we could...

> so maybe extend that idea?
> I think it's not just kernel size, but increased register pressure etc.

Something like this should work? (diff on top of this patch)

-- 
Cheers,
Harry / Hyeonggon

diff --git a/include/linux/slab.h b/include/linux/slab.h
index c0bf00ee6025..0496d2e63f5e 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -871,16 +871,32 @@ unsigned int kmem_cache_sheaf_size(struct slab_sheaf *sheaf);
 #define PASS_BUCKET_PARAM(_b)		NULL
 #endif

+#ifdef CONFIG_PARTITION_KMALLOC_CACHES
+#define DECL_TOKEN_PARAM(_token)	, kmalloc_token_t (_token)
+#define _PASS_TOKEN_PARAM(_token)	, (_token)
+#define PASS_TOKEN_PARAM(_token)	(_token)
+#else
+#define DECL_TOKEN_PARAM(_token)
+#define _PASS_TOKEN_PARAM(_token)
+#define PASS_TOKEN_PARAM(_token)	((kmalloc_token_t){})
+#endif
+
+#define DECL_KMALLOC_PARAMS(_size, _b, _token)	DECL_BUCKET_PARAMS(_size, _b) \
+						DECL_TOKEN_PARAM(_token)
+
+#define PASS_KMALLOC_PARAMS(_size, _b, _token)	PASS_BUCKET_PARAMS(_size, _b) \
+						_PASS_TOKEN_PARAM(_token)
+
 /*
  * The following functions are not to be used directly and are intended only
  * for internal use from kmalloc() and kmalloc_node()
  * with the exception of kunit tests
  */

-void *__kmalloc_noprof(size_t size, gfp_t flags, kmalloc_token_t token)
+void *__kmalloc_noprof(DECL_KMALLOC_PARAMS(size, b, token), gfp_t flags)
 				__assume_kmalloc_alignment __alloc_size(1);

-void *__kmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags, int node, kmalloc_token_t token)
+void *__kmalloc_node_noprof(DECL_KMALLOC_PARAMS(size, b, token), gfp_t flags, int node)
 				__assume_kmalloc_alignment __alloc_size(1);

 void *__kmalloc_cache_noprof(struct kmem_cache *s, gfp_t flags, size_t size)
@@ -964,7 +980,7 @@ static __always_inline __alloc_size(1) void *_kmalloc_noprof(size_t size, gfp_t
 				kmalloc_caches[kmalloc_type(flags, token)][index],
 				flags, size);
 	}
-	return __kmalloc_noprof(size, flags, token);
+	return __kmalloc_noprof(PASS_KMALLOC_PARAMS(size, NULL, token), flags);
 }
 #define kmalloc_noprof(...)			_kmalloc_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
 #define kmalloc(...)				alloc_hooks(kmalloc_noprof(__VA_ARGS__))
@@ -1075,10 +1091,10 @@ void *_kmalloc_nolock_noprof(size_t size, gfp_t gfp_flags, int node, kmalloc_tok
 	__alloc_flex(kvzalloc, default_gfp(__VA_ARGS__), typeof(P), FAM, COUNT)

 #define kmem_buckets_alloc(_b, _size, _flags)	\
-	alloc_hooks(__kmalloc_node_noprof(PASS_BUCKET_PARAMS(_size, _b), _flags, NUMA_NO_NODE, __kmalloc_token(_size)))
+	alloc_hooks(__kmalloc_node_noprof(PASS_KMALLOC_PARAMS(_size, _b, __kmalloc_token(_size)), _flags, NUMA_NO_NODE))

 #define kmem_buckets_alloc_track_caller(_b, _size, _flags)	\
-	alloc_hooks(__kmalloc_node_track_caller_noprof(PASS_BUCKET_PARAMS(_size, _b), _flags, NUMA_NO_NODE, _RET_IP_, __kmalloc_token(_size)))
+	alloc_hooks(__kmalloc_node_track_caller_noprof(PASS_KMALLOC_PARAMS(_size, _b, __kmalloc_token(_size)), _flags, NUMA_NO_NODE, _RET_IP_))

 static __always_inline __alloc_size(1) void *_kmalloc_node_noprof(size_t size, gfp_t flags, int node, kmalloc_token_t token)
 {
@@ -1093,7 +1109,7 @@ static __always_inline __alloc_size(1) void *_kmalloc_node_noprof(size_t size, g
 				kmalloc_caches[kmalloc_type(flags, token)][index],
 				flags, node, size);
 	}
-	return __kmalloc_node_noprof(PASS_BUCKET_PARAMS(size, NULL), flags, node, token);
+	return __kmalloc_node_noprof(PASS_KMALLOC_PARAMS(size, NULL, token), flags, node);
 }
 #define kmalloc_node_noprof(...)		_kmalloc_node_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
 #define kmalloc_node(...)			alloc_hooks(kmalloc_node_noprof(__VA_ARGS__))
@@ -1154,10 +1170,10 @@ static inline __realloc_size(2, 3) void * __must_check krealloc_array_noprof(voi
  */
 #define kcalloc(n, size, flags)		kmalloc_array(n, size, (flags) | __GFP_ZERO)

-void *__kmalloc_node_track_caller_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags, int node,
-					 unsigned long caller, kmalloc_token_t token) __alloc_size(1);
+void *__kmalloc_node_track_caller_noprof(DECL_KMALLOC_PARAMS(size, b, token), gfp_t flags, int node,
+					 unsigned long caller) __alloc_size(1);
 #define kmalloc_node_track_caller_noprof(size, flags, node, caller) \
-	__kmalloc_node_track_caller_noprof(PASS_BUCKET_PARAMS(size, NULL), flags, node, caller, __kmalloc_token(size))
+	__kmalloc_node_track_caller_noprof(PASS_KMALLOC_PARAMS(size, NULL, __kmalloc_token(size)), flags, node, caller)
 #define kmalloc_node_track_caller(...)		\
 	alloc_hooks(kmalloc_node_track_caller_noprof(__VA_ARGS__, _RET_IP_))

@@ -1183,7 +1199,7 @@ static inline __alloc_size(1, 2) void *_kmalloc_array_node_noprof(size_t n, size
 		return NULL;
 	if (__builtin_constant_p(n) && __builtin_constant_p(size))
 		return _kmalloc_node_noprof(bytes, flags, node, token);
-	return __kmalloc_node_noprof(PASS_BUCKET_PARAMS(bytes, NULL), flags, node, token);
+	return __kmalloc_node_noprof(PASS_KMALLOC_PARAMS(bytes, NULL, token), flags, node);
 }
 #define kmalloc_array_node_noprof(...)		_kmalloc_array_node_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
 #define kmalloc_array_node(...)			alloc_hooks(kmalloc_array_node_noprof(__VA_ARGS__))
@@ -1209,10 +1225,10 @@ static inline __alloc_size(1) void *_kzalloc_noprof(size_t size, gfp_t flags, km
 #define kzalloc(...)				alloc_hooks(kzalloc_noprof(__VA_ARGS__))
 #define kzalloc_node(_size, _flags, _node)	kmalloc_node(_size, (_flags)|__GFP_ZERO, _node)

-void *__kvmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), unsigned long align,
-			     gfp_t flags, int node, kmalloc_token_t token) __alloc_size(1);
+void *__kvmalloc_node_noprof(DECL_KMALLOC_PARAMS(size, b, token), unsigned long align,
+			     gfp_t flags, int node) __alloc_size(1);
 #define kvmalloc_node_align_noprof(_size, _align, _flags, _node)	\
-	__kvmalloc_node_noprof(PASS_BUCKET_PARAMS(_size, NULL), _align, _flags, _node, __kmalloc_token(_size))
+	__kvmalloc_node_noprof(PASS_KMALLOC_PARAMS(_size, NULL, __kmalloc_token(_size)), _align, _flags, _node)
 #define kvmalloc_node_align(...)		\
 	alloc_hooks(kvmalloc_node_align_noprof(__VA_ARGS__))
 #define kvmalloc_node(_s, _f, _n)		kvmalloc_node_align(_s, 1, _f, _n)
@@ -1225,7 +1241,7 @@ void *__kvmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), unsigned long align,
 #define kvzalloc_node(_size, _flags, _node)	kvmalloc_node(_size, (_flags)|__GFP_ZERO, _node)

 #define kmem_buckets_valloc(_b, _size, _flags)	\
-	alloc_hooks(__kvmalloc_node_noprof(PASS_BUCKET_PARAMS(_size, _b), 1, _flags, NUMA_NO_NODE, __kmalloc_token(_size)))
+	alloc_hooks(__kvmalloc_node_noprof(PASS_KMALLOC_PARAMS(_size, _b, __kmalloc_token(_size)), 1, _flags, NUMA_NO_NODE))

 static inline __alloc_size(1, 2) void *
 _kvmalloc_array_node_noprof(size_t n, size_t size, gfp_t flags, int node, kmalloc_token_t token)
@@ -1235,7 +1251,7 @@ _kvmalloc_array_node_noprof(size_t n, size_t size, gfp_t flags, int node, kmallo
 	if (unlikely(check_mul_overflow(n, size, &bytes)))
 		return NULL;

-	return __kvmalloc_node_noprof(PASS_BUCKET_PARAMS(bytes, NULL), 1, flags, node, token);
+	return __kvmalloc_node_noprof(PASS_KMALLOC_PARAMS(bytes, NULL, token), 1, flags, node);
 }
 #define kvmalloc_array_node_noprof(...)		_kvmalloc_array_node_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
 #define kvmalloc_array_noprof(...)		kvmalloc_array_node_noprof(__VA_ARGS__, NUMA_NO_NODE)
diff --git a/mm/slub.c b/mm/slub.c
index 5630dde94df0..84f129d79c99 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -5293,15 +5293,17 @@ void *__do_kmalloc_node(size_t size, kmem_buckets *b, gfp_t flags, int node,
 	trace_kmalloc(caller, ret, size, s->size, flags, node);
 	return ret;
 }
-void *__kmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags, int node, kmalloc_token_t token)
+void *__kmalloc_node_noprof(DECL_KMALLOC_PARAMS(size, b, token), gfp_t flags, int node)
 {
-	return __do_kmalloc_node(size, PASS_BUCKET_PARAM(b), flags, node, _RET_IP_, token);
+	return __do_kmalloc_node(size, PASS_BUCKET_PARAM(b), flags, node,
+				 _RET_IP_, PASS_TOKEN_PARAM(token));
 }
 EXPORT_SYMBOL(__kmalloc_node_noprof);

-void *__kmalloc_noprof(size_t size, gfp_t flags, kmalloc_token_t token)
+void *__kmalloc_noprof(DECL_KMALLOC_PARAMS(size, b, token), gfp_t flags)
 {
-	return __do_kmalloc_node(size, NULL, flags, NUMA_NO_NODE, _RET_IP_, token);
+	return __do_kmalloc_node(size, PASS_BUCKET_PARAM(b), flags,
+				 NUMA_NO_NODE, _RET_IP_, PASS_TOKEN_PARAM(token));
 }
 EXPORT_SYMBOL(__kmalloc_noprof);

@@ -5394,10 +5396,11 @@ void *_kmalloc_nolock_noprof(size_t size, gfp_t gfp_flags, int node, kmalloc_tok
 }
 EXPORT_SYMBOL_GPL(_kmalloc_nolock_noprof);

-void *__kmalloc_node_track_caller_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags,
-					 int node, unsigned long caller, kmalloc_token_t token)
+void *__kmalloc_node_track_caller_noprof(DECL_KMALLOC_PARAMS(size, b, token), gfp_t flags,
+					 int node, unsigned long caller)
 {
-	return __do_kmalloc_node(size, PASS_BUCKET_PARAM(b), flags, node, caller, token);
+	return __do_kmalloc_node(size, PASS_BUCKET_PARAM(b), flags, node,
+				 caller, PASS_TOKEN_PARAM(token));

 }
 EXPORT_SYMBOL(__kmalloc_node_track_caller_noprof);
@@ -6812,8 +6815,8 @@ static gfp_t kmalloc_gfp_adjust(gfp_t flags, size_t size)
  *
  * Return: pointer to the allocated memory of %NULL in case of failure
  */
-void *__kvmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), unsigned long align,
-			     gfp_t flags, int node, kmalloc_token_t token)
+void *__kvmalloc_node_noprof(DECL_KMALLOC_PARAMS(size, b, token),
+			     unsigned long align, gfp_t flags, int node)
 {
 	bool allow_block;
 	void *ret;
@@ -6824,7 +6827,7 @@ void *__kvmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), unsigned long align,
 	 */
 	ret = __do_kmalloc_node(size, PASS_BUCKET_PARAM(b),
 				kmalloc_gfp_adjust(flags, size),
-				node, _RET_IP_, token);
+				node, _RET_IP_, PASS_TOKEN_PARAM(token));
 	if (ret || size <= PAGE_SIZE)
 		return ret;

--
2.43.0

