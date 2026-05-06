Return-Path: <linux-kbuild+bounces-13048-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LPMMYE9+2nUXwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13048-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 06 May 2026 15:09:21 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E84E4DAB91
	for <lists+linux-kbuild@lfdr.de>; Wed, 06 May 2026 15:09:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60D8B300BCBC
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 May 2026 13:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B18434657DA;
	Wed,  6 May 2026 13:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u7yRKPEJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8858344D682
	for <linux-kbuild@vger.kernel.org>; Wed,  6 May 2026 13:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778072655; cv=pass; b=kyeXsSnFmr8roOmOw/X+nBqz1+DqpE3fDj23GJqOY53nKUKQphvHvQZN68Gs6Cv0LG0xVtBgxS6KGkn6xp9ig8FUxlAsAGLDWJHJiEAOD59pLnMgwvDn+MhF54kWUrFEqYxKuCvsM82HNj81CSAGFWtfLM2TLZ9FaRdsbUOdumI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778072655; c=relaxed/simple;
	bh=oQH4MCqtsx8PuDqkHCstgNaDMaf3tjzD1L/6gzNJxyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z1obMwu/J67S7XQGtT91Va/VBIhJCUCLl2gXURXzAXZMAb9WIeEpQdAHptflU8kD/GOyXXf13NUaCsAPFk130srIDjwysDd04oWkDcU7RAA54vFOFKqHffOzjpzysBnIhcDqyCBpkTm4oxuC4BF6eREPe32ZkKaWdMCq0kNb6dM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u7yRKPEJ; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-130b2295ed0so4942089c88.0
        for <linux-kbuild@vger.kernel.org>; Wed, 06 May 2026 06:04:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778072645; cv=none;
        d=google.com; s=arc-20240605;
        b=PnHPFk8H6isNrRcMx5u9T0sHvN2g9zgL/xGLuNYSiU9L2ojX/YhE0mvnniB38LDJq7
         58o+UjednJraGMV+rZtmDcRQ5BhrGxqApvOqfaRre7BubnQ39bg1FVzy2P+YzMM2sXa/
         +OqW8f5MTPlZPQ9LScBlshGvCvE63ZnlFJwFNu7lBunhcAOjvddL0CsuqTWdP7wIfQKe
         zbRSY0646gMAZ63fNrKT8Okw/kpsAs7Ese1fNKhT4UbiXPkwI/cY9vVEwCuprgPwSb/c
         TR42XHtecJGFVxAhAfRoThWl3nAWT122aXqm16n/+GhMXb8IK9pcb2sxyQv1sjGTcP/V
         +7Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VyxSzMGcG4YBihOth/kzEfCuby+TU4nCMC26Shuc0DM=;
        fh=CJeQCqj7CYn1LjDEo3N1O+kg5aQellV19QcO8dNx1qU=;
        b=MtFmlSJ0eeib3m6RdFjl4Oymz1c/KJ1Auikifgm4i4N8QytiVtag2TI27ILWLQn9Ox
         xP/CsHq0HSrcIP0d2MJVHi9kWqnAEdTyfAcL8bCnbmGAAuOpvl90PEAFDPoHyeeCwUNE
         IkwmXB3V5z2Msz9D5H1ojDmTLZd7cVLTm3dvkLMpxB4agDNUU+o08Dfxq/ybdqyOmfju
         9pNaV+r0DVTIs/K0lssYpoY3fvhQ9xB4R7/6VgAuKmLiYZLbdvs1b1J4l8JvCE9zL2ps
         0/cEGTJYh85BU/PABRFqUhACmsZcANd/STd/wrp36f59erVvkU5w+aVnBGhW0JwLPpjg
         eOTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778072645; x=1778677445; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VyxSzMGcG4YBihOth/kzEfCuby+TU4nCMC26Shuc0DM=;
        b=u7yRKPEJDlG39kmgO0zLNvpWfG/VVE272qUgmL3GNsUMZbEYXJgCJ+82bSYbe87I6/
         OTMXwqu8NIkRzbEFaGYEycblelfX8q0Ea9WIwOxNQh0RHyM3rIHYFLH+ypqX/gTM6E5t
         pI4NVtDHA+gkXFt5wMejHuvJiDQeiAIRWdVk6e9PjqFVYxl75j0yC4L0hTtP3dX77W47
         kwYYW8r3eJET8JqOErx+r7o79nfWjh/T2rhnvh6UDxuDbL3Jxm8C6Kqi5/miEWVOYyPc
         0pcI76FUdY1TaAOe16J6aK7Stg1VgY2y96t+eykxAqxgGZVqnNFL9Bgsl6tufujQJJi1
         kWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778072645; x=1778677445;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyxSzMGcG4YBihOth/kzEfCuby+TU4nCMC26Shuc0DM=;
        b=Ygj/PWnN6mJhGFr9wgIk51xDJWpfagqUJ1s2lThYFDsXIJ5wHakR1wHWkcODkOHESw
         Sbq2tHcyjwu2kfpZ/HZMzKgBuExvCePPMQvngBHQwPN5iZk2dReOR6P52sKXKYXuvCtW
         onROxzmoZdqtpAI4f0YRUGI/xyJBhkMiZEoCIcS5sLIL0K46d+mC5Xw99uXDGehvrQJG
         zs8S4GLVmKtz5iqX/MewIb8j1E89yZC9Tb3mv3BkdByrdtQyPBHC3U6x7FuvChssAMWI
         4UQWKD7hqjOxzgrXEyJg1UaM2B5cTJh7yS1UVp5KlTr0YPUmd4ViDUT2to3/7iInFcmT
         YnOg==
X-Forwarded-Encrypted: i=1; AFNElJ+QHC4pbDJ4fAZyPdc9nGBJbj8Gv0SwyL91CE0wz5VibbsWS2o0z52Y7P6B9D4a5MJ1tqZsD/Hu8GTz5h8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW2GLC7u0SJf590pr6Oq/WJ006STPjeaWXS5/VRbVnVKmqTGO0
	iexeDw41nduTeJqHSLvB4+Ip3exnzEOGbj1EQXYGvJaEXxY8ecS/gQc6sEZAgGM4D7f7RR3i966
	AZSbvA1ms1EDnUsEZl6lKXMn+7ERhWNaEq6IJO0KD
X-Gm-Gg: AeBDievX+SXEihn839J0P7p3E2B70yoBQRIj4qYPHzQlbNI35+sZXTTB+eaIPbawusx
	AfQALOKcmycK9cXnUdQAxyVHV6dOgRvV+hCwWDTTPPK4nb2n28cP3H2xdW8ldmaiLWY73/Hzk6t
	ZaEs4DGVmrCDXZYjQBZXWa82ptQl0EhvN1Ax+vDBE18QXejIajlH/VRPuzcoV5eXlaRwe9vUAC3
	xwdpAL7d0aNiozu2PYoRZMlwLXav3lLZ+HtmcE4203MsChPH+R6TDpqLV79CHtWjpZg5Dk6rks5
	KU1eH8dXUAPGMRytt33t4oVbA2JU61gxmEGQiVZZMZ7bHyiSm5WAzrJzpAXqmVK0uDryWjo=
X-Received: by 2002:a05:7022:ec0b:b0:12d:f7a6:e641 with SMTP id
 a92af1059eb24-1318e9178d9mr1882135c88.25.1778072643669; Wed, 06 May 2026
 06:04:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424132427.2703076-1-elver@google.com> <6f2bd63a-dc02-4631-a3a5-7ec8e58a4a4e@kernel.org>
 <afkOMIPu1WNFE9MS@elver.google.com>
In-Reply-To: <afkOMIPu1WNFE9MS@elver.google.com>
From: Marco Elver <elver@google.com>
Date: Wed, 6 May 2026 15:03:27 +0200
X-Gm-Features: AVHnY4I_sIIXoZtb7Dp2LdZncViXZn8dSOWAzjV1MMogggcywyvPBFhYkIJG5fI
Message-ID: <CANpmjNM261J5qefMvmUXWZGBVz-KBs7GkbpdNMfTOvNJ-=LiZQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] slab: support for compiler-assisted type-based
 slab cache partitioning
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, Harry Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, Andrey Konovalov <andreyknvl@gmail.com>, 
	Florent Revest <revest@google.com>, Jann Horn <jannh@google.com>, KP Singh <kpsingh@kernel.org>, 
	Matteo Rizzo <matteorizzo@google.com>, GONG Ruiqi <gongruiqi1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 5E84E4DAB91
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13048-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,gentwo.org,linux.dev,google.com,oracle.com,suse.com,gmail.com,vger.kernel.org,kvack.org,googlegroups.com,lists.linux.dev,huawei.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elver@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Mon, 4 May 2026 at 23:23, Marco Elver <elver@google.com> wrote:
>
> On Thu, Apr 30, 2026 at 03:03PM +0200, Vlastimil Babka (SUSE) wrote:
> > On 4/24/26 15:24, Marco Elver wrote:
> >
> > > @@ -938,7 +968,7 @@ void *__kmalloc_large_node_noprof(size_t size, gfp_t flags, int node)
> > >   * Try really hard to succeed the allocation but fail
> > >   * eventually.
> > >   */
> > > -static __always_inline __alloc_size(1) void *kmalloc_noprof(size_t size, gfp_t flags)
> > > +static __always_inline __alloc_size(1) void *_kmalloc_noprof(size_t size, gfp_t flags, kmalloc_token_t token)
> > >  {
> > >     if (__builtin_constant_p(size) && size) {
> > >             unsigned int index;
> > > @@ -948,14 +978,16 @@ static __always_inline __alloc_size(1) void *kmalloc_noprof(size_t size, gfp_t f
> > >
> > >             index = kmalloc_index(size);
> > >             return __kmalloc_cache_noprof(
> > > -                           kmalloc_caches[kmalloc_type(flags, _RET_IP_)][index],
> > > +                           kmalloc_caches[kmalloc_type(flags, token)][index],
> >
> > While reviewing this, it occured to me we might have been using _RET_IP_
> > here in a suboptimal way ever since this was introduced. Since this is all
> > inlined, shouldn't have we been using _THIS_IP_ to really randomize using
> > the kmalloc() callsite, and not its parent?
> >
> > And after this patch, we get the token passed to _kmalloc_noprof()...
> >
> > >                             flags, size);
> > >     }
> > > -   return __kmalloc_noprof(size, flags);
> > > +   return __kmalloc_noprof(PASS_KMALLOC_PARAMS(size, NULL, token), flags);
> >
> > ... and used also here for the non-constant-size, where previously
> > __kmalloc_noprof() (not inline function) would correctly use _RET_IP_ on its
> > own ...
> >
> > >  }
> > > +#define kmalloc_noprof(...)                        _kmalloc_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
> >
> > ... and the token comes from here. With random partitioning that's
> > #define __kmalloc_token(...) ((kmalloc_token_t){ .v = _RET_IP_ })
> >
> > so that AFAIK makes the situation worse as now the cases without constant
> > size also start randomizing by the parent callsite and not the kmalloc callsite.
> >
> > But there are many users of __kmalloc_token() and maybe some are corrent in
> > using _RET_IP_, I haven't checked, maybe we'll need two variants, or further
> > change things around.
>
> Good catch. I don't think we need multiple variants (otherwise the TYPED
> variant would be broken) - we're moving token generation to the callers
> (not even inlined anymore) with all this macro magic.
>
> I think this is all we need:
>
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -503,7 +503,7 @@ int kmem_cache_shrink(struct kmem_cache *s);
>  typedef struct { unsigned long v; } kmalloc_token_t;
>  #ifdef CONFIG_KMALLOC_PARTITION_RANDOM
>  extern unsigned long random_kmalloc_seed;
> -#define __kmalloc_token(...) ((kmalloc_token_t){ .v = _RET_IP_ })
> +#define __kmalloc_token(...) ((kmalloc_token_t){ .v = _THIS_IP_ })
>  #elif defined(CONFIG_KMALLOC_PARTITION_TYPED)
>  #define __kmalloc_token(...) ((kmalloc_token_t){ .v = __builtin_infer_alloc_token(__VA_ARGS__) })
>  #endif
>
> Plus a paragraph in the commit message.  Let me add that.

Bah, this is why it doesn't work:

>> drivers/gpu/drm/msm/msm_gpu.c:272:4: error: cannot jump from this indirect goto statement to one of its possible targets
     272 |                         drm_exec_retry_on_contention(&exec);
         |                         ^
   include/drm/drm_exec.h:123:4: note: expanded from macro
'drm_exec_retry_on_contention'
     123 |                         goto *__drm_exec_retry_ptr;             \
         |                         ^
   drivers/gpu/drm/msm/msm_gpu.c:304:16: note: possible target of
indirect goto statement
     304 |                 state->bos = kcalloc(submit->nr_bos,
         |                              ^
   include/linux/slab.h:1173:34: note: expanded from macro 'kcalloc'
    1173 | #define kcalloc(n, size, flags)         kmalloc_array(n,
size, (flags) | __GFP_ZERO)
         |                                         ^
   include/linux/slab.h:1133:42: note: expanded from macro 'kmalloc_array'
    1133 | #define kmalloc_array(...)
alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                             ^
   include/linux/slab.h:1132:71: note: expanded from macro
'kmalloc_array_noprof'
    1132 | #define kmalloc_array_noprof(...)
_kmalloc_array_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
         |
                       ^
   include/linux/slab.h:506:55: note: expanded from macro '__kmalloc_token'
     506 | #define __kmalloc_token(...) ((kmalloc_token_t){ .v = _THIS_IP_ })
         |                                                       ^
   include/linux/instruction_pointer.h:10:41: note: expanded from
macro '_THIS_IP_'
      10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned
long)&&__here; })
         |                                         ^
   drivers/gpu/drm/msm/msm_gpu.c:304:16: note: jump enters a statement
expression


Apparently using _THIS_IP_ creates a possible indirect jump target,
but because it's in a statement expression, it's invalid, so the
compiler complains. This is obviously nonsense, because the actual
indirect jump in this gpu driver code would never jump to the
_THIS_IP_ __here label, but that's what it is.

Given this pre-existing issue, we probably need to continue using
_RET_IP_, as before. I tried to fix _THIS_IP_, but it's incredibly
brittle (e.g. __always_inline function returning address of label
doesn't work on Clang, but would on GCC).

