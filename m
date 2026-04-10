Return-Path: <linux-kbuild+bounces-12742-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOZVHnjK2GktiQgAu9opvQ
	(envelope-from <linux-kbuild+bounces-12742-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 12:01:28 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 493AB3D558A
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 12:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A5063034559
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Apr 2026 09:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0918633ADAC;
	Fri, 10 Apr 2026 09:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="EaWRdwuk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DD534EF0E;
	Fri, 10 Apr 2026 09:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775814678; cv=none; b=JYIkre6NI8Nw0MpJZ1jQLL8sEk5enqy1qwamNnHmjIeyIMymf5QsxcDbjtnAgv1mpWIwrpULZ4etdxm7JN6vKpkITKoX93y45GONqJ6kgOMHjU8ldyH0CLlSZZIbAWuVKFkAZ6gtfz1hmUW4XQHNQZLWnwDiKkNf2CQ9zRBT+Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775814678; c=relaxed/simple;
	bh=2SwEKP0JRIcUT9VZfJQVDXhGVxwFzyl3yI/jYziHn3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Pqjm44frwdBrlnyupix/n4Sq0S/K63lT3GT7++bEn0+5Z2OecB3YJRlCi3AQ2kJYq/hnUTHsvXMxh7oflFvLWLeYmQa2LsNYmX2w2g6eoYIuYXeCtB5I90e8di+ARKtNt96ZaqPl/LMEM0hHIdhPJOqPcu1At+gCK1ABLml50Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=EaWRdwuk; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=9YC5+Ls1swOHaWJ8ErNBeIulZ4tAA8sac7Dx5bn0SAs=;
	b=EaWRdwukgWLF/ovt/GfYhXVnX9klWxHa038NdZau8kzA8ZAxqerDxQ/8SzCc4u9aMJzey1Qda
	2QXPpIswZbgspzkY/KgFpFHgDMv6EjcsNxAlP7CrMxlJJ1/+LSZc44wpRWJiouLTv9OUnyRr2Hi
	NNMJD569jlD1cmiZFSW0wiw=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4fsX2q2BcwzLlVQ;
	Fri, 10 Apr 2026 17:44:51 +0800 (CST)
Received: from kwepemk100018.china.huawei.com (unknown [7.202.194.66])
	by mail.maildlp.com (Postfix) with ESMTPS id C8C3C40565;
	Fri, 10 Apr 2026 17:51:05 +0800 (CST)
Received: from [10.67.108.67] (10.67.108.67) by kwepemk100018.china.huawei.com
 (7.202.194.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Fri, 10 Apr
 2026 17:51:04 +0800
Message-ID: <69a902f1-3793-4c71-ac3c-27f8cd5eeef8@huawei.com>
Date: Fri, 10 Apr 2026 17:50:59 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] slab: support for compiler-assisted type-based slab
 cache partitioning
To: Marco Elver <elver@google.com>, Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
CC: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter
	<cl@gentwo.org>, Harry Yoo <harry.yoo@oracle.com>, Hao Li <hao.li@linux.dev>,
	David Rientjes <rientjes@google.com>, Roman Gushchin
	<roman.gushchin@linux.dev>, Kees Cook <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo
 Stoakes <ljs@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, Mike
 Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal
 Hocko <mhocko@suse.com>, Alexander Potapenko <glider@google.com>, Dmitry
 Vyukov <dvyukov@google.com>, Nick Desaulniers
	<nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin
 Stitt <justinstitt@google.com>, <linux-kbuild@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
	<linux-hardening@vger.kernel.org>, <kasan-dev@googlegroups.com>,
	<llvm@lists.linux.dev>, Andrey Konovalov <andreyknvl@gmail.com>, Florent
 Revest <revest@google.com>, Jann Horn <jannh@google.com>, KP Singh
	<kpsingh@kernel.org>, Matteo Rizzo <matteorizzo@google.com>
References: <20260331111240.153913-1-elver@google.com>
Content-Language: en-US
From: GONG Ruiqi <gongruiqi1@huawei.com>
In-Reply-To: <20260331111240.153913-1-elver@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk100018.china.huawei.com (7.202.194.66)
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[36];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12742-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gentwo.org,oracle.com,linux.dev,google.com,suse.com,gmail.com,vger.kernel.org,kvack.org,googlegroups.com,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gongruiqi1@huawei.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[huawei.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,huawei.com:dkim,huawei.com:email,huawei.com:mid]
X-Rspamd-Queue-Id: 493AB3D558A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/31/2026 7:12 PM, Marco Elver wrote:
> ...
> @@ -662,9 +662,20 @@ extern kmem_buckets kmalloc_caches[NR_KMALLOC_TYPES];
>  	(IS_ENABLED(CONFIG_ZONE_DMA)   ? __GFP_DMA : 0) |	\
>  	(IS_ENABLED(CONFIG_MEMCG) ? __GFP_ACCOUNT : 0))
>  
> +#ifdef CONFIG_RANDOM_KMALLOC_CACHES
>  extern unsigned long random_kmalloc_seed;
> +typedef struct { unsigned long ip; } kmalloc_token_t;
> +#define __kmalloc_token(...) ((kmalloc_token_t) { .ip = _RET_IP_ })
> +#elif defined(CONFIG_TYPED_KMALLOC_CACHES)
> +typedef struct { unsigned long v; } kmalloc_token_t;
> +#define __kmalloc_token(...) ((kmalloc_token_t){ .v = __builtin_infer_alloc_token(__VA_ARGS__) })

One tiny suggestion: we could use the same name for kmalloc_token_t's
member in both cases, which would make the code a bit more concise.

Acked-by: GONG Ruiqi <gongruiqi1@huawei.com>

> +#else
> +/* no-op */
> +typedef struct {} kmalloc_token_t;
> +#define __kmalloc_token(...) ((kmalloc_token_t){})
> +#endif
>  
> -static __always_inline enum kmalloc_cache_type kmalloc_type(gfp_t flags, unsigned long caller)
> +static __always_inline enum kmalloc_cache_type kmalloc_type(gfp_t flags, kmalloc_token_t token)
>  {
>  	/*
>  	 * The most common case is KMALLOC_NORMAL, so test for it
> @@ -672,9 +683,11 @@ static __always_inline enum kmalloc_cache_type kmalloc_type(gfp_t flags, unsigne
>  	 */
>  	if (likely((flags & KMALLOC_NOT_NORMAL_BITS) == 0))
>  #ifdef CONFIG_RANDOM_KMALLOC_CACHES
> -		/* RANDOM_KMALLOC_CACHES_NR (=15) copies + the KMALLOC_NORMAL */
> -		return KMALLOC_RANDOM_START + hash_64(caller ^ random_kmalloc_seed,
> -						      ilog2(RANDOM_KMALLOC_CACHES_NR + 1));
> +		/* PARTITION_KMALLOC_CACHES_NR (=15) copies + the KMALLOC_NORMAL */
> +		return KMALLOC_PARTITION_START + hash_64(token.ip ^ random_kmalloc_seed,
> +							 ilog2(PARTITION_KMALLOC_CACHES_NR + 1));
> +#elif defined(CONFIG_TYPED_KMALLOC_CACHES)
> +		return KMALLOC_PARTITION_START + token.v;
>  #else
>  		return KMALLOC_NORMAL;
>  #endif
> ...

