Return-Path: <linux-kbuild+bounces-12708-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDNoKlP/1GnOzQcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12708-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Apr 2026 14:57:55 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FD73AEBCE
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Apr 2026 14:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7C15302BDF8
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Apr 2026 12:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4347C3B5820;
	Tue,  7 Apr 2026 12:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fnI3bSt3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB883B4EAD;
	Tue,  7 Apr 2026 12:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775566469; cv=none; b=g3HvL2mBDftUL65abd7nVk0I5PN+yU2nesNGDedJjeA4T/aE/nFL9eUl4TCS2hl+SCTXODcSB+KtLiXiG8IQFyqy8Pj+emA51fNOH3Jqw7r6DzzLf37jRagenDjNiAikGtGGAZSKYKWeYaHGUPDz+GasErx+uB8BJafnaKcDQcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775566469; c=relaxed/simple;
	bh=8Ji12lgxQFeQ0eoD/lANGRdEYLLrVV374G+C+Ni88gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aRo0XjnJsBdd384ZhJWoSJn1yVePHxMh82ZLI6sLd2WDsU1wsnhxOmXg745K//E3WUp+P5KKC+5BgFjAo0aaI4jM0NJ6qcNsYSXF7wQOnmIFsdrqgTKNFVhLIRcsO8VkzLvnd4n4uj3aJaxg/8AUQnINijzASFNLZfw5oaEl1p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fnI3bSt3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 590FEC116C6;
	Tue,  7 Apr 2026 12:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775566468;
	bh=8Ji12lgxQFeQ0eoD/lANGRdEYLLrVV374G+C+Ni88gs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fnI3bSt3HjVWVA4CO18XQVLGmXmaHI/PKaj09L7MapKBTgBF4+vYcp9Jpow9HVjs2
	 DG92KMxitrIZCZARQetbo8EnLBE8T2X2FbWU3JaKcFRK1K+r0XZYT74/NJ5ANEVIFg
	 Cfngzxlk4UBRGAtHCHgM4ThECBTQUK0GyDMnh1ey7StBxjuCP9RRuqr8n/Km2uGIgW
	 Awb9Nc0AulMbQvJX+oqeIbriKr28hBesaYc99msxR90dQKzhvjDluT8Z8v1qg1aKq9
	 0lsRYCmM+tu+6LJJQm1s/c+MCVcn38JhjgrtMndZoni8FzQZHzjdWPlixpx30YRqHJ
	 8mwjy8KvYS6Tw==
Date: Tue, 7 Apr 2026 21:54:26 +0900
From: "Harry Yoo (Oracle)" <harry@kernel.org>
To: Marco Elver <elver@google.com>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
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
Message-ID: <adT-gkVmVDDXR1h_@hyeyoo>
References: <20260331111240.153913-1-elver@google.com>
 <ac9d5O5XehnXRc5A@hyeyoo>
 <d0fe363c-2e8f-44a4-9b64-3fa3ba9a5773@kernel.org>
 <adM2XVZf1DekahlY@hyeyoo>
 <CANpmjNMeaWWuDMAj_n38U9XRqgZQz30ca82Vy10Bg=NoDfZ5ng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNMeaWWuDMAj_n38U9XRqgZQz30ca82Vy10Bg=NoDfZ5ng@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-12708-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,gentwo.org,linux.dev,google.com,oracle.com,suse.com,gmail.com,vger.kernel.org,kvack.org,googlegroups.com,lists.linux.dev,huaweicloud.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harry@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,googlegroups.com:email]
X-Rspamd-Queue-Id: 06FD73AEBCE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 01:17:14PM +0200, Marco Elver wrote:
> On Mon, 6 Apr 2026 at 06:28, 'Harry Yoo (Oracle)' via kasan-dev
> <kasan-dev@googlegroups.com> wrote:
> > On Fri, Apr 03, 2026 at 08:29:22PM +0200, Vlastimil Babka (SUSE) wrote:
> > > On 4/3/26 08:27, Harry Yoo (Oracle) wrote:
> > > >> diff --git a/include/linux/slab.h b/include/linux/slab.h
> > > >> index 15a60b501b95..c0bf00ee6025 100644
> > > >> --- a/include/linux/slab.h
> > > >> +++ b/include/linux/slab.h
> > > >> @@ -864,10 +877,10 @@ unsigned int kmem_cache_sheaf_size(struct slab_sheaf *sheaf);
> > > >>   * with the exception of kunit tests
> > > >>   */
> > > >>
> > > >> -void *__kmalloc_noprof(size_t size, gfp_t flags)
> > > >> +void *__kmalloc_noprof(size_t size, gfp_t flags, kmalloc_token_t token)
> > > >>                            __assume_kmalloc_alignment __alloc_size(1);
> > > >>
> > > >> -void *__kmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags, int node)
> > > >> +void *__kmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags, int node, kmalloc_token_t token)
> > > >>                            __assume_kmalloc_alignment __alloc_size(1);
> > > >
> > > > So the @token parameter is unused when CONFIG_PARTITION_KMALLOC_CACHES is
> > > > disabled but still increases the kernel size by a few kilobytes...
> > > > but yeah I'm not sure if we can get avoid it without hurting readability.
> > > >
> > > > Just saying. (does anybody care?)
> > >
> > > Well we did care enough with CONFIG_SLAB_BUCKETS to hide the unused param
> > > using DECL_BUCKET_PARAMS(),
> >
> > Hmm yeah.
> >
> > I wasn't sure if we could do this without hurting readability,
> > but perhaps we could...
> >
> > > so maybe extend that idea?
> > > I think it's not just kernel size, but increased register pressure etc.
> 
> I'll take a closer look at generated code.

> In some cases the compiler ought to omit zero-sized arguments,

Oh, didn't know that was a thing.

Not sure if it's safe to do that for exported functions though (since
modules can be built w/ a different compiler).

> so I want to be sure we're not
> prematurely optimizing and the size increase is not some other effect.

Great, thanks for looking into it.

> > Something like this should work? (diff on top of this patch)
> 
> Thanks, I'll consider it.

Thanks.

> Re your other comments:
> 
> > Assuming not all people building the kernel are security experts...
> > (including myself) could you please add some insights/guidance on how to
> > decide between RANDOM_KMALLOC_CACHES and TYPED_KMALLOC_CACHES?
> 
> You can find different arguments for either, and in the original RFC
> that was part of the discussion.

Yeah, I had fun time following the discussions :)

> However, my biased view is that type-based partitioning in general
> is the stronger security boundary.
> Because it creates a deterministic separation; specifically isolating
> pointer-containing objects from pointerless ones: it effectively kills
> certain classes of exploit techniques that probabilistic defenses
> (like randomization) only delay, especially in environments where
> attackers can retry or use side-channels.

That's a fair argument.

Could we possibly put some of those arguments (in a neutral/technical
sense) in help text to make people's lives easier?

Err, trying to provide unbiased (tm) help text...
Something like:

config RANDOM_KMALLOC_CACHES
	bool "Randomize slab caches for normal kmalloc"
	help
	  Randomly pick a slab cache based on code address and a per-boot
	  random seed.

	  This makes it harder for attackers to predict object co-location.
	  The placement is random: while attackers don't know which kmalloc
	  cache an object will be allocated from, they might circumvent
	  the randomization by retrying attacks across multiple machines until
	  the target objects are co-located.

config TYPED_KMALLOC_CACHES
	bool "Type based slab cache selection for normal kmalloc"
	depends on $(cc-option,-falloc-token-max=123)
	help
	  Rely on Clang's allocation tokens to choose a slab cache, where token
	  IDs are derived from the allocated type.

	  Unlike RANDOM_KMALLOC_CACHES, the cache assignment is deterministic
	  and based on type, which guarantees that objects of certain types
	  are not placed in the same cache. This effectively mitigates
	  certain classes of exploits that probabilistic defenses like
	  RANDOM_KMALLOC_CACHES only make harder but not impossible.
	  However, this also means the cache assignment is predictable.

	  For example, a token ID scheme might separate pointer-containing
	  objects and pointerless objects to prevent buffer overflows on
	  primitive buffers from directly corrupting pointer-containing objects.

	  The current effectiveness of Clang's type inference can be judged by
	  -Rpass=alloc-token, which provides diagnostics where (after dead-code
	  elimination) type inference failed.

	  Requires Clang 22 or later.

endchoice

> The current pointer/non-pointer scheme is relatively intuitive with
> well-understood properties, and a good start.
>
> However, an open research question is if better alloc-token ID schemes exist:
> one that is tailored to kernel data structures that would meaningfully
> increase exploitation difficulty further without increasing the number of
> partitions.

Haha, that's too adventurous research question for me :P

> Since an improved scheme could simply be activated with a
> compiler flag, having the baseline infrastructure available and
> maintained is the first step.

Agreed.

> > Now somewhat out-of-scope (or at least pre-existing) review comments
> > from Sashiko that I think are still worth mentioning...
> 
> Indeed, these are pre-existing issues with RANDOM_KMALLOC_CACHES.
> Worth follow-up patches, but this patch here wants to just get the
> TYPED_KMALLOC_CACHES infrastructure in place so we can build on top of
> it.

Yeah, that's totally fine!

-- 
Cheers,
Harry / Hyeonggon

