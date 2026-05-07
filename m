Return-Path: <linux-kbuild+bounces-13080-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aB7CNPoI/WmdWwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13080-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 07 May 2026 23:49:46 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE594EF744
	for <lists+linux-kbuild@lfdr.de>; Thu, 07 May 2026 23:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4CFB3038A73
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 May 2026 21:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E654347536;
	Thu,  7 May 2026 21:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jwqqpn26"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3B0345CAE;
	Thu,  7 May 2026 21:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778190579; cv=none; b=hi3VDuO1rtBz8DwRUO8uegxF1KUZ0Ur+BoMOFHUCEZJzBtaLkB1PqZhyAPLjBvHnknOdw9GJB7WLK/a9aXP2J00mycW57e0H2r0dEBCqt1XMKsLu4cmW9vJNCOQXquvZrIPjSWlXcltjnC75ZPRn8gBHTzAJ0m46E23KKRM03AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778190579; c=relaxed/simple;
	bh=vDhx+qTlEIGongxfTbCi7izCbN5cvEC0zYIQ5cbMuOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UCqxAJUE5/GnUbw5866BYxcOlRtzLgH/H/HjSAJqjS2yKWr3MUbI83wIuj3AeO7keGOZa1Ihxulv9905jR+ask7Sp/hq40SUVPh0aytIDljlsVbBXt1DiwjVVw1yVMKss8mLYLIly++2ocmQMp2GMZ7/ZKlzsAQOZ9D7qd7Vy3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jwqqpn26; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A16F9C2BCB2;
	Thu,  7 May 2026 21:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778190579;
	bh=vDhx+qTlEIGongxfTbCi7izCbN5cvEC0zYIQ5cbMuOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jwqqpn26rDsSqSQ6iSY7WfIk8u1SsmwHBzioFfRMvR4e9N6oP0FBidey1y2T+Lzxi
	 O6rdnRlS24/l9Q7ZH/qS9m9frAolUlZBJs+LQp2AHV42DQS5hI3PQU/zs5tC44FF4s
	 MI5GYeR+oxtqLILIScpQQjcmFsykVrvqH6P/4+AMmOssMqiHNk626tOQ1rUgJd5JnJ
	 ubNV1WnfwHzwmSPIZ+ktI1V+E6asZCmNNF4lKVnYxzX/EIAgbCNNqPdWYgqfwbU/7U
	 xyaqLgvGNw1n0oR4CiJ1jyRQpVIisSYe+NJBD03tsVHW2DsiqukQdCz2TH4yBbi07k
	 +G3+tqU2LJypw==
Date: Thu, 7 May 2026 23:49:20 +0200
From: "Harry Yoo (Oracle)" <harry@kernel.org>
To: Marco Elver <elver@google.com>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, Hao Li <hao.li@linux.dev>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-hardening@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, Andrey Konovalov <andreyknvl@gmail.com>, 
	Florent Revest <revest@google.com>, Jann Horn <jannh@google.com>, KP Singh <kpsingh@kernel.org>, 
	Matteo Rizzo <matteorizzo@google.com>, GONG Ruiqi <gongruiqi1@huawei.com>
Subject: Re: [PATCH v3 1/2] slab: support for compiler-assisted type-based
 slab cache partitioning
Message-ID: <afz7pZADZPD4mKJr@MacBook-Air.tail10959e.ts.net>
References: <20260424132427.2703076-1-elver@google.com>
 <6f2bd63a-dc02-4631-a3a5-7ec8e58a4a4e@kernel.org>
 <afkOMIPu1WNFE9MS@elver.google.com>
 <CANpmjNM261J5qefMvmUXWZGBVz-KBs7GkbpdNMfTOvNJ-=LiZQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNM261J5qefMvmUXWZGBVz-KBs7GkbpdNMfTOvNJ-=LiZQ@mail.gmail.com>
X-Rspamd-Queue-Id: 5DE594EF744
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13080-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[37];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,gentwo.org,linux.dev,google.com,oracle.com,suse.com,gmail.com,vger.kernel.org,kvack.org,googlegroups.com,lists.linux.dev,huawei.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,MacBook-Air.tail10959e.ts.net:mid]
X-Rspamd-Action: no action

On Wed, May 06, 2026 at 03:03:27PM +0100, Marco Elver wrote:
> On Mon, 4 May 2026 at 23:23, Marco Elver <elver@google.com> wrote:
> > On Thu, Apr 30, 2026 at 03:03PM +0200, Vlastimil Babka (SUSE) wrote:
> > > On 4/24/26 15:24, Marco Elver wrote:
> > > > @@ -948,14 +978,16 @@ static __always_inline __alloc_size(1) void *kmalloc_noprof(size_t size, gfp_t f
> > > >
> > > >             index = kmalloc_index(size);
> > > >             return __kmalloc_cache_noprof(
> > > > -                           kmalloc_caches[kmalloc_type(flags, _RET_IP_)][index],
> > > > +                           kmalloc_caches[kmalloc_type(flags, token)][index],
> > >
> > > While reviewing this, it occured to me we might have been using _RET_IP_
> > > here in a suboptimal way ever since this was introduced. Since this is all
> > > inlined, shouldn't have we been using _THIS_IP_ to really randomize using
> > > the kmalloc() callsite, and not its parent?
> > >
> > > And after this patch, we get the token passed to _kmalloc_noprof()...
> > >
> > > >                             flags, size);
> > > >     }
> > > > -   return __kmalloc_noprof(size, flags);
> > > > +   return __kmalloc_noprof(PASS_KMALLOC_PARAMS(size, NULL, token), flags);
> > >
> > > ... and used also here for the non-constant-size, where previously
> > > __kmalloc_noprof() (not inline function) would correctly use _RET_IP_ on its
> > > own ...
> > >
> > > >  }
> > > > +#define kmalloc_noprof(...)                        _kmalloc_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
> > >
> > > ... and the token comes from here. With random partitioning that's
> > > #define __kmalloc_token(...) ((kmalloc_token_t){ .v = _RET_IP_ })
> > >
> > > so that AFAIK makes the situation worse as now the cases without constant
> > > size also start randomizing by the parent callsite and not the kmalloc callsite.
> > >
> > > But there are many users of __kmalloc_token() and maybe some are corrent in
> > > using _RET_IP_, I haven't checked, maybe we'll need two variants, or further
> > > change things around.
> >
> > Good catch. I don't think we need multiple variants (otherwise the TYPED
> > variant would be broken) - we're moving token generation to the callers
> > (not even inlined anymore) with all this macro magic.
> >
> > I think this is all we need:
> >
> > --- a/include/linux/slab.h
> > +++ b/include/linux/slab.h
> > @@ -503,7 +503,7 @@ int kmem_cache_shrink(struct kmem_cache *s);
> >  typedef struct { unsigned long v; } kmalloc_token_t;
> >  #ifdef CONFIG_KMALLOC_PARTITION_RANDOM
> >  extern unsigned long random_kmalloc_seed;
> > -#define __kmalloc_token(...) ((kmalloc_token_t){ .v = _RET_IP_ })
> > +#define __kmalloc_token(...) ((kmalloc_token_t){ .v = _THIS_IP_ })
> >  #elif defined(CONFIG_KMALLOC_PARTITION_TYPED)
> >  #define __kmalloc_token(...) ((kmalloc_token_t){ .v = __builtin_infer_alloc_token(__VA_ARGS__) })
> >  #endif
> >
> > Plus a paragraph in the commit message.  Let me add that.

Err, I was like "yes, this is the way to go!"

and then...

> Bah, this is why it doesn't work:
> 
> >> drivers/gpu/drm/msm/msm_gpu.c:272:4: error: cannot jump from this indirect goto statement to one of its possible targets
>      272 |                         drm_exec_retry_on_contention(&exec);
>          |                         ^
>    include/drm/drm_exec.h:123:4: note: expanded from macro
> 'drm_exec_retry_on_contention'
>      123 |                         goto *__drm_exec_retry_ptr;             \
>          |                         ^
>    drivers/gpu/drm/msm/msm_gpu.c:304:16: note: possible target of
> indirect goto statement
>      304 |                 state->bos = kcalloc(submit->nr_bos,
>          |                              ^
>    include/linux/slab.h:1173:34: note: expanded from macro 'kcalloc'
>     1173 | #define kcalloc(n, size, flags)         kmalloc_array(n,
> size, (flags) | __GFP_ZERO)
>          |                                         ^
>    include/linux/slab.h:1133:42: note: expanded from macro 'kmalloc_array'
>     1133 | #define kmalloc_array(...)
> alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
>          |                                                             ^
>    include/linux/slab.h:1132:71: note: expanded from macro
> 'kmalloc_array_noprof'
>     1132 | #define kmalloc_array_noprof(...)
> _kmalloc_array_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
>          |
>                        ^
>    include/linux/slab.h:506:55: note: expanded from macro '__kmalloc_token'
>      506 | #define __kmalloc_token(...) ((kmalloc_token_t){ .v = _THIS_IP_ })
>          |                                                       ^
>    include/linux/instruction_pointer.h:10:41: note: expanded from
> macro '_THIS_IP_'
>       10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned
> long)&&__here; })
>          |                                         ^
>    drivers/gpu/drm/msm/msm_gpu.c:304:16: note: jump enters a statement
> expression
> 
> Apparently using _THIS_IP_ creates a possible indirect jump target,

Didn't even realize people use indirect gotos, heh :)

> but because it's in a statement expression, it's invalid, so the
> compiler complains. This is obviously nonsense, because the actual
> indirect jump in this gpu driver code would never jump to the
> _THIS_IP_ __here label, but that's what it is.

Yeah, I guess it's quite tricky to handle when you don't know where
it'd jump to as it's an indirect one, and there's an invalid jump
label...

> Given this pre-existing issue, we probably need to continue using
> _RET_IP_, as before.

Agreed!

-- 
Cheers,
Harry / Hyeonggon

