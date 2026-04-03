Return-Path: <linux-kbuild+bounces-12629-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UlqaMYZez2m/vgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12629-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Apr 2026 08:30:30 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0473916B2
	for <lists+linux-kbuild@lfdr.de>; Fri, 03 Apr 2026 08:30:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B767C300FC67
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Apr 2026 06:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C1EE369224;
	Fri,  3 Apr 2026 06:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DanqkANJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168CC317165;
	Fri,  3 Apr 2026 06:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775197709; cv=none; b=NIlRMqNd2MN8UhslVq5VpcIX/ifAPqpY9h4WVEoQ4OsfP4zQHxY0MA+ih5UQrSuBNi6vYsuBkLyvWzBgSU2Y0d00sWXo+hxNTvyoD+pI41s/vRA/STDY4zKaYWQhTswTLaagROTDYBJ/f6g3ZudafRoJdzr2j7goqlQXXcfkaeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775197709; c=relaxed/simple;
	bh=EDKbDUM1va14MDdISCCEcbu9DRzxd+M/3/KumOtFn0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=azGM6qT7XfCQ3oPwi7wqBjqAQdZH3a49whqrSkgkXRst4DOxoZka6WDIQ48CCaWSLitvLVSJ3CSa7A60S2uKZr3pK+iq3IZ7ngLk0WhS5slFqZ1gVms65Acsgtos1bhLPPa1w/Usj2QnLlKfIdKTBcMRFycoPzSqsasi1K4qp8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DanqkANJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14DEDC4CEF7;
	Fri,  3 Apr 2026 06:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775197708;
	bh=EDKbDUM1va14MDdISCCEcbu9DRzxd+M/3/KumOtFn0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DanqkANJAv/p4747ceEo4NiyHCyXTNuIVxqmrdP6rant/XCjDo2CzwtmbOD9Zz2cZ
	 Eh1/q+uCKk6qJjlC650pXBD5+/r3fIQOOU/ntFVFe/OAlsMpHEJIxpWF4aLmcw0y0z
	 4MDr+Q9Tew7x3K5tDWu7XmZZO4lbXdFzKEAtJ7rswVZ1K09URrAy7DnSYuODP8TfqC
	 dzwCh32bZvHNIwUQ6aelmzqJoGessmqA2Q8PmT9LVnw6egPO4nxruQZdo2DPAQvbNo
	 dEZa2pdtLShjcbl3JNj99YxmX6Qt6UZXG1X59wDLE6qTlZtozzPMAHeEa1SUiJNV7l
	 oO8uymPhkojww==
Date: Fri, 3 Apr 2026 15:28:26 +0900
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
	Florent Revest <revest@google.com>,
	GONG Ruiqi <gongruiqi@huaweicloud.com>,
	Jann Horn <jannh@google.com>, KP Singh <kpsingh@kernel.org>,
	Matteo Rizzo <matteorizzo@google.com>
Subject: Re: [PATCH v1] slab: support for compiler-assisted type-based slab
 cache partitioning
Message-ID: <ac9eCi0b33CYENpX@hyeyoo>
References: <20260331111240.153913-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331111240.153913-1-elver@google.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12629-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,gentwo.org,linux.dev,google.com,oracle.com,suse.com,gmail.com,vger.kernel.org,kvack.org,googlegroups.com,lists.linux.dev,huaweicloud.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harry@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1A0473916B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Now somewhat out-of-scope (or at least pre-existing) review comments
from Sashiko that I think are still worth mentioning...

> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -662,9 +662,20 @@ extern kmem_buckets kmalloc_caches[NR_KMALLOC_TYPES];
> -static __always_inline enum kmalloc_cache_type kmalloc_type(gfp_t flags, unsigned long caller)
> +static __always_inline enum kmalloc_cache_type kmalloc_type(gfp_t flags, kmalloc_token_t token)
>  {
>  	/*
>  	 * The most common case is KMALLOC_NORMAL, so test for it
> @@ -672,9 +683,11 @@ static __always_inline enum kmalloc_cache_type kmalloc_type(gfp_t flags, unsigne
>  	 */
>  	if (likely((flags & KMALLOC_NOT_NORMAL_BITS) == 0))

Sashiko pointed out KMALLOC_CGROUP caches are not partitioned [1]:
| Do allocations with the __GFP_ACCOUNT flag completely bypass typed
| and random partitioning? KMALLOC_NOT_NORMAL_BITS includes __GFP_ACCOUNT.

Right.

| If this bit is set, the code bypasses the partitioning logic and routes
| the allocation to the KMALLOC_CGROUP cache.

Right.

| Since user-controllable objects
| like msg_msg, file descriptors, and pipes are allocated with __GFP_ACCOUNT,

Right.

| they will all be clustered in the exact same unpartitioned cache.

Right.

From security perspective do you think it'd be worthwhile to partition
KMALLOC_CGROUP caches? (I see at least few hundreds of users, unlike
KMALLOC_RECLAIM where there are only few users).

Another valid concern from Sashiko [1]:
| Does this leave reallocation functions like krealloc() and kvrealloc()
| without allocation token propagation?
|
| When an object is reallocated and requires memory expansion, the underlying
| generic SLUB code allocates a new buffer. Because the token macro is not
| applied to these realloc paths, __builtin_infer_alloc_token() evaluates
| locally on a generic size_t variable rather than the original type.

I think this is a valid point and worth addressing.

| This causes it to return the fallback token (0), which silently migrates the
| object from its isolated typed cache to the shared fallback cache
| (kmalloc-part-00) when resized.

[1] https://sashiko.dev/#/patchset/20260331111240.153913-1-elver%40google.com

-- 
Cheers,
Harry / Hyeonggon

