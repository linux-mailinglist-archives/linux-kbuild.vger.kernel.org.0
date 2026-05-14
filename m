Return-Path: <linux-kbuild+bounces-13153-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HYfCXmPBWppYgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13153-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 11:01:45 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BFB53F8CF
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 11:01:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1C18D3014289
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 May 2026 09:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 467B83BED59;
	Thu, 14 May 2026 09:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G2BkCcFN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F689379C32;
	Thu, 14 May 2026 09:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778749296; cv=none; b=NtOq++rmNtj/SqQ3D/nhoVPBm+B/Sn5bH4QWzBKBfyHgkITvXBGGdUFy6KqlOxJbWC9Azbryq7f59fvFRLFgoBd4uWkiT1KX85Qd5qXOcofD4A/9c0GS/8IsEaFZm77Xxz6wpGTshKzS/NA9dynj1wqGqVg0srIORTHNGliPgZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778749296; c=relaxed/simple;
	bh=9qrd7DZRswnShjHayhkqvrhofgKn4ZIB2zVBnchimsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BE0IZb4I/eVeR2YrpGvZvLsRhcA4OVz1/3s635hbvGVocxNfa6jZezXRXhNq/KAwOHgy+HFTCIBhwMqlwGXCXv0p4UcC6eqBffz7nWQTYtrVi9CdPjpbuzWLXGc/HhPE8inFYF6QJ3qL0GRPjIPnerNze6Afzx3YWm9yujJDvJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G2BkCcFN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B715C2BCC6;
	Thu, 14 May 2026 09:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778749295;
	bh=9qrd7DZRswnShjHayhkqvrhofgKn4ZIB2zVBnchimsI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G2BkCcFNIRRps5PTJarrPld2ITBu3MEnYEXg11mhnE12D+VJRwwayBQfS5aUku6Jb
	 GXY+k0+bMYEQte2Ba2sZBCfpZ2pE29oY3Sw4HJsnFUxwH7lke/wvijUh3uCpXurIuK
	 DlnckljG5ZQxBM+omlZP1Vjg7PIs641+rCM4lh8uuv0PKiiJ3ktkbxJZPoKcTdoKFy
	 2XJfB1OFdJl9GaXOCKD6hBOWKZlrz490Wtmw9lnKJmbQ2Nn+4aDO2Uh8XBNd/n6D40
	 l+2nIpCyOVcnw6ERQlbyTVQxJWZ7gtGqzcNekaxoeepcMWR2F6R0Wc++MSOvjaq3xU
	 MiY/qECmkhCFA==
Message-ID: <560a84ed-7daf-4a78-a314-b867c73bce22@kernel.org>
Date: Thu, 14 May 2026 11:01:26 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] slab: support for compiler-assisted type-based
 slab cache partitioning
Content-Language: en-US
To: Marco Elver <elver@google.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Bill Wendling <morbo@google.com>,
 David Hildenbrand <david@kernel.org>, David Rientjes <rientjes@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, Jann Horn <jannh@google.com>,
 Justin Stitt <justinstitt@google.com>, KP Singh <kpsingh@kernel.org>,
 Kees Cook <kees@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Matteo Rizzo <matteorizzo@google.com>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Suren Baghdasaryan <surenb@google.com>, linux-hardening@vger.kernel.org,
 Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
 Harry Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>,
 "Liam R. Howlett" <liam@infradead.org>,
 Alexander Potapenko <glider@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, kasan-dev@googlegroups.com, llvm@lists.linux.dev,
 GONG Ruiqi <gongruiqi1@huawei.com>, Jonathan Corbet <corbet@lwn.net>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <20260511200136.3201646-1-elver@google.com>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <20260511200136.3201646-1-elver@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 06BFB53F8CF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13153-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oracle.com,gmail.com,google.com,suse.com,linux.dev,vger.kernel.org,gentwo.org,infradead.org,kvack.org,googlegroups.com,lists.linux.dev,huawei.com,lwn.net];
	RCPT_COUNT_TWELVE(0.00)[39];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vbabka@kernel.org,linux-kbuild@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,huawei.com:email,llvm.org:url,dfsec.com:url,lwn.net:url]
X-Rspamd-Action: no action

On 5/11/26 22:00, Marco Elver wrote:
> Rework the general infrastructure around RANDOM_KMALLOC_CACHES into more
> flexible KMALLOC_PARTITION_CACHES, with the former being a partitioning
> mode of the latter.
> 
> Introduce a new mode, KMALLOC_PARTITION_TYPED, which leverages a feature
> available in Clang 22 and later, called "allocation tokens" via
> __builtin_infer_alloc_token() [1]. Unlike KMALLOC_PARTITION_RANDOM
> (formerly RANDOM_KMALLOC_CACHES), this mode deterministically assigns a
> slab cache to an allocation of type T, regardless of allocation site.
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

Applied [1] to slab/for-next, thanks. That means including the kernel-doc
workarounds in patch 3. I know Jon said someone might hate it, but maybe it
will motivate them for creating a proper fix :) It seems better than leaving
doc generation broken or not applying this series at all.

https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git/log/?h=slab/for-7.2/alloc_token

I did the following fixup to remove passing an unnecessary NULL argument for
__kmalloc_nolock() with buckets enabled. Made bloat-o-meter happier a bit.

diff --git a/include/linux/slab.h b/include/linux/slab.h
index c232f8a10af6..795455256329 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -894,7 +894,7 @@ unsigned int kmem_cache_sheaf_size(struct slab_sheaf *sheaf);
  * with the exception of kunit tests
  */
 
-void *__kmalloc_noprof(DECL_KMALLOC_PARAMS(size, b, token), gfp_t flags)
+void *__kmalloc_noprof(DECL_TOKEN_PARAMS(size, token), gfp_t flags)
 				__assume_kmalloc_alignment __alloc_size(1);
 
 void *__kmalloc_node_noprof(DECL_KMALLOC_PARAMS(size, b, token), gfp_t flags, int node)
@@ -981,7 +981,7 @@ static __always_inline __alloc_size(1) void *_kmalloc_noprof(size_t size, gfp_t
 				kmalloc_caches[kmalloc_type(flags, token)][index],
 				flags, size);
 	}
-	return __kmalloc_noprof(PASS_KMALLOC_PARAMS(size, NULL, token), flags);
+	return __kmalloc_noprof(PASS_TOKEN_PARAMS(size, token), flags);
 }
 #define kmalloc_noprof(...)			_kmalloc_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
 #define kmalloc(...)				alloc_hooks(kmalloc_noprof(__VA_ARGS__))
diff --git a/mm/slub.c b/mm/slub.c
index a6e9015601d6..74652bbdd591 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -5303,10 +5303,10 @@ void *__kmalloc_node_noprof(DECL_KMALLOC_PARAMS(size, b, token), gfp_t flags, in
 }
 EXPORT_SYMBOL(__kmalloc_node_noprof);
 
-void *__kmalloc_noprof(DECL_KMALLOC_PARAMS(size, b, token), gfp_t flags)
+void *__kmalloc_noprof(DECL_TOKEN_PARAMS(size, token), gfp_t flags)
 {
-	return __do_kmalloc_node(size, PASS_BUCKET_PARAM(b), flags,
-				 NUMA_NO_NODE, _RET_IP_, PASS_TOKEN_PARAM(token));
+	return __do_kmalloc_node(size, NULL, flags,  NUMA_NO_NODE, _RET_IP_,
+				 PASS_TOKEN_PARAM(token));
 }
 EXPORT_SYMBOL(__kmalloc_noprof);
 


