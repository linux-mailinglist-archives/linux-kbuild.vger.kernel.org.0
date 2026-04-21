Return-Path: <linux-kbuild+bounces-12848-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IG5GK8ey52no/gEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12848-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Apr 2026 19:24:23 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B15743DE87
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Apr 2026 19:24:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEBEE300FC46
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Apr 2026 17:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EFFD2FE066;
	Tue, 21 Apr 2026 17:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="APakOZVU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6142E6CCD;
	Tue, 21 Apr 2026 17:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776792163; cv=none; b=a5OccQyLKzv617W90gioHWgx6LxNO8iqZawVuQcNCHYFXHog1DhKbZxmshpRVztwoalnMZ5tu3x3JbPZGf3EdD9Dwn4drAqUo/7M+D9awMYjiQGixAxWx2VbMGonR6FqhdG9V8vpLVqxo290/0RsDyArHNnUA1nM0zYtfrHSSGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776792163; c=relaxed/simple;
	bh=nNMDSilb+/zXGXVw/f0Wvgf6NfzWoClrWzQe893lPEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LoVrQXbpbNKmD6UPBoTE+bo5mXBmbGvImraPMQ1lqLs3JceOsnzZnWqTSrdJKtfbIdJ3qRNOM8CIxzS7KtiRaFhjtdj0wNQen/xqRPrmiwmorGFtZrbW+kfT12CthHgavfubmG4Bt8atF3ZEJ2KpSrw6KkjWVe3xEvoq47lcWbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=APakOZVU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31EBAC2BCB0;
	Tue, 21 Apr 2026 17:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776792163;
	bh=nNMDSilb+/zXGXVw/f0Wvgf6NfzWoClrWzQe893lPEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=APakOZVU5qkL6vWUVTFAYa7wyo8CQ/+TvO3KSSP5ZRkDiG7GeNDpX9/D3iHleKfe1
	 MLfTi0udDG+jOpm+5Xn4s1LPuyDV1GjPm5WyWeylmQcPRpTdUr4wN6Wphw9pRBWjvp
	 AFg73IKKfpBPJxMEn0orz74mE/laLUKi9r0tIzNilLIjUUoRRx6ZmVFNLcpHJ2jhqO
	 9u6201KZx3sh5Vh5HklBamSzUt8geRNlHbsS29kwq6LjTPzkRABmYgpIHbRj1EegtK
	 3rpG+i7AR/Kg7ZinHcHxHHk8cKqG2KeeONe/KAX35msVFasIfncY2lD0aiM3rVQyVg
	 VyqNHsIu0GGSQ==
Date: Tue, 21 Apr 2026 10:22:42 -0700
From: Kees Cook <kees@kernel.org>
To: Marco Elver <elver@google.com>
Cc: Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
	Harry Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
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
	GONG Ruiqi <gongruiqi1@huawei.com>
Subject: Re: [PATCH v2] slab: support for compiler-assisted type-based slab
 cache partitioning
Message-ID: <202604210954.84C57E5E0@keescook>
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
	TAGGED_FROM(0.00)[bounces-12848-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,gentwo.org,linux.dev,google.com,oracle.com,suse.com,gmail.com,vger.kernel.org,kvack.org,googlegroups.com,lists.linux.dev,huawei.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4B15743DE87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 04:37:05PM +0200, Marco Elver wrote:
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

Great! I'm glad this gets deterministically handled for the kmalloc_obj*
cases.

> Additionally, when I compile my kernel with -Rpass=alloc-token, which
> provides diagnostics where (after dead-code elimination) type inference
> failed, I see 186 allocation sites where the compiler failed to identify
> a type (down from 966 when I sent the RFC [4]). Some initial review
> confirms these are mostly variable sized buffers, but also include
> structs with trailing flexible length arrays.

For the call-site-partitioning series[1] I sent before, I had
per-site caches for fixed-sized allocations and size bucket caches for
variably-sized allocations. I'd like to see something similar for this
series. Specifically, I replaced "kmalloc_slab" with "choose_slab" that
did O(1) to find the dedicated cache/bucket for the allocation[2].

In this case, we now have a build-time-constant value that it should be
possible to use to look up a _single_ dedicated cache/bucket for the
given unique type: there is no need to do hashing.

> [...]
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

The "16" buckets seems to hold for TYPED_KMALLOC_CACHES too? My goal
with the earlier type-partitioning was to get _total_ isolation, not
simply bucketed: 1 cache (or sizes-bucket) for each type. The "16"
limitation from RANDOM_KMALLOC_CACHES was kind of arbitrary due to the
hashing.

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

I think this should be adjusted a bit:

config CC_HAS_ALLOC_TOKEN
	def_bool $(cc-option,-falloc-token-max=123)

...
choice
	prompt "Partitioned slab cache mode"
	depends on PARTITION_KMALLOC_CACHES
	default TYPED_KMALLOC_CACHES if CC_HAS_ALLOC_TOKEN
	default RANDOM_KMALLOC_CACHES

And actually, perhaps a global rename of the options so the selection
naming is at the end of the CONFIG phrase, and bundle the on/off into
the choice:


choice
	prompt "Partitioned slab cache mode"
	depends on PARTITION_KMALLOC_CACHES
	default KMALLOC_PARTITION_TYPED if !SLUB_TINY && CC_HAS_ALLOC_TOKEN
	default KMALLOC_PARTITION_RANDOM if !SLUB_TINY
	default KMALLOC_PARTITION_NONE

config KMALLOC_PARTITION_NONE
...
config KMALLOC_PARTITION_RANDOM
	depends on !SLUB_TINY
...
config KMALLOC_PARTITION_TYPED
	depends on !SLUB_TINY && CC_HAS_ALLOC_TOKEN

-Kees

[1] https://lore.kernel.org/lkml/20240809072532.work.266-kees@kernel.org/
[2] https://lore.kernel.org/lkml/20240809073309.2134488-5-kees@kernel.org/

-- 
Kees Cook

