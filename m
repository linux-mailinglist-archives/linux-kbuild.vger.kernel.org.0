Return-Path: <linux-kbuild+bounces-13166-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAP7OjAgB2rnrgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13166-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 May 2026 15:31:28 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5557B5507C2
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 May 2026 15:31:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51B943004610
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 May 2026 13:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C769390C8B;
	Fri, 15 May 2026 13:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s4kOdYLl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2D9382F15
	for <linux-kbuild@vger.kernel.org>; Fri, 15 May 2026 13:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778851497; cv=pass; b=Vr5CXMux1NbiKFmpejxCSxcCdii196HWVcZiIOAzeikaQbXmGfOJMKUJeghOLNn2XMMobfQMA5o/MQASllDRtDx6SqGXNoiztOgh+qlO655FkDWwz6B20c0NQWnpTh2/gSTss/AZxX4eNz06p0R2STKABzVfJ8ux5CNrJ8yJwY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778851497; c=relaxed/simple;
	bh=9S/wyijREW7prxTs0cpddfr7+xTXmq79rJi7zvdyiio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aqqRcjSw5kzV28590vr59mvJarkkGmcgPxMzKM7yAO8A2wg5OcfeeHkueKWsbOTJ+M0hx4j0RnRABwubu4n25bgJ/cmSKcrg5eA9IbEPFLyrnFLgy1LsvV2IH4f3JtE0T4ux7RNS3hOVheUg2O/OXpNh74IwJwVJ1qqtUPiV9Ow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s4kOdYLl; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1309f4ee97fso11552739c88.1
        for <linux-kbuild@vger.kernel.org>; Fri, 15 May 2026 06:24:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778851494; cv=none;
        d=google.com; s=arc-20240605;
        b=bBml9qvQ4Kl0Bkr+h/D27wtgDgM8n9WdnwEpChbgNBkHyeuj2m38xK3RgTYag/yPk7
         jI11wCuve/UrS/yYk9Lvx4N5Qn/MWffwqHLAMIaj2V11AMgqi0eTr/96IZ9oizXB0B5L
         hW29d3AGMJPqQdtFCRoF+JoE1IW7eAs6gN0SkEOVveH6goNlyEoUbRfQ74jIqUXy4JNQ
         zEYdmyNr1wykxyGxWnJkwccAipiAzmuSxl7x9RHRWAt0eSCLZL0C97U1fheRwVNLNG0y
         KZSxM3hgD0Ajp+GvtWFFi+DYICHBEE8VwcrV8ktn/2uR+aKwauqWR8MSWpJrORvy9j08
         X6vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kJkIJ9MSSyAx7AMR5IamH1iN68B4UTFJP9CxVTr4bw8=;
        fh=i+eh1E2p1heMa2bYJLvHM5holzepXVIGCZbml6+jCsk=;
        b=TYoMZ/3ZbhnB203tg3pjMe7rjRYxDmHEeYaBfrebor12k01LkZ3QgkVRUOhQ3yJ1fs
         P28/MjjKEN6SKgCW6QdUrIHW3JZKT4iA2IJD2VytqZBjxogWGmVt4GHQ2R98lZT+JM4z
         8BKLcSkBE0LNtasKH+FUeoUpOQmw/HbVQM+V/LZTUSM65Ice/d1XRjfJEF7lxBBv7lAq
         bvecr+hs64t/9cZ88tM4kDux0GU8FrtQn0/tTly+OR5EIn4DybHXeW/NJNfqZErZ9kP2
         CCCMv5tE6j6tDI+X/UbKFa72S0kB8dflKsfyJX2h+/+2sCCCdec8OyuF8iqnjHujWMHq
         k1rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778851494; x=1779456294; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kJkIJ9MSSyAx7AMR5IamH1iN68B4UTFJP9CxVTr4bw8=;
        b=s4kOdYLl+H/jtAnbqbvOEB+dbYZp7Repr3O/lj/BO58Ty493AoK2/dmP8jzC0OnQhA
         lknsCDwovXEvLM5NM7I28D7thoVsrpyH3YKXxh78fBybR7DQcs27zq1m/mCLT1m+tJzJ
         JKOQ2Njjrmv5n2/5l3iMLrOl3+LHxwD4n6ab/ES59MLGWdlRKpAQ4nv9HR+OzE4vGm0s
         RIWP6tJs63VCihku14pdJ5eAp1zDPxsRxO4DrARLWMQqLUSyAbgKtyrPGd5B+/xu+Eta
         FW5TyW3w0PfMLVUCb9hu3Tzja86RsBuif4pWoC7p4LDSmyvh6kMTu5+RDJxmcaaXfe/x
         xexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778851494; x=1779456294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJkIJ9MSSyAx7AMR5IamH1iN68B4UTFJP9CxVTr4bw8=;
        b=NJGgXc9ylymVm2RB5PdZ42C6hJnF4lbNHbyaswQB9JP1A1NhHJdVJtZMavCr20/mfh
         y894B2v/H2CDqvaRZG1McUzHA29KKEf7w885T3QTjeywEB4kjDtztZ6gw3Cu1+gN/61I
         McSHYc6fGIuh7CARHHr9FTNDb5mxH7IIzdDPTBAuhRqheyT+qHjm0VPXnV8sBJGxHwbd
         TOCPJEduN/g2woqz+Aov8rEdNRrg5bsGRP2HObJ0U+JPraq7Y9B08rcNsVr+qvs5fwzU
         hRaM+iPHTLUeZDI0luzHzC02az4PWGVJnMW2L3hL6uX/CXzL8LTKX+4m/dqgXDRtz4E+
         ZPbQ==
X-Forwarded-Encrypted: i=1; AFNElJ/IpA+Xf5TkNLfYX+7mrCMakfbM1hfJ6Y6DhFpJQAFLiLcV7TmUiXdZ0sf8+OJgvn/V8NpXRdcL88VlkL4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeaAMupOmNcXysnNpXhEq4miaJcQ/4epdPYmoJjKpUlLPrUuHk
	gfr7kaTaiZz7xawl7EHx9MOUAoPAwoOGY+IKyb219a4+HfPVliGGr1ic9TmuH2ahVKKUMNJRWew
	s7yGwsTqaAan0mbdk9dHe0/ap6PjS/JSi50QUiqdw
X-Gm-Gg: Acq92OFjwWZjA4DCFcVvnuamijrogkBMTtyOHOm36DYq/0gWgq1f3xS1+TbEH9EpwA8
	wNv3q/u1VZcZi8IdDZq8LONFxRdC5ILo792tGiSjt3PIMna0R5GO3tntHrTRDRW38vn5o/6BHPf
	1/tjf2a7SDT4gIcp50t24lypaJnYCp7+xUJIHkzbTq7cS8fCafrlsyvHDYnfJZW8B5p6pAow8gJ
	yJv04BuWC6t8lEzmaiViykQVWQLU1a2XgrTMOMvBCeusQgoqEeCyupU2sdOro6KrahKGxMKBZsz
	SbYzRURqc+D4ZI+44ZyMCxiAHtpZEvWP5KWKWgX4katqxfZ6
X-Received: by 2002:a05:7022:62aa:b0:12a:72af:83d2 with SMTP id
 a92af1059eb24-1350441d7ccmr1656610c88.14.1778851492906; Fri, 15 May 2026
 06:24:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511200136.3201646-1-elver@google.com> <560a84ed-7daf-4a78-a314-b867c73bce22@kernel.org>
In-Reply-To: <560a84ed-7daf-4a78-a314-b867c73bce22@kernel.org>
From: Marco Elver <elver@google.com>
Date: Fri, 15 May 2026 15:24:16 +0200
X-Gm-Features: AVHnY4IK86MdHMyPl5dB4zdZDdnYGN0oaLGQAymJ1xrwo4kBW5Idcq4vVdQ8Oeg
Message-ID: <CANpmjNNHXvv8ruFGHzvom5V0mwmaoBoBenvt=ZLnEDmEy8dYeA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] slab: support for compiler-assisted type-based
 slab cache partitioning
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Bill Wendling <morbo@google.com>, 
	David Hildenbrand <david@kernel.org>, David Rientjes <rientjes@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Jann Horn <jannh@google.com>, 
	Justin Stitt <justinstitt@google.com>, KP Singh <kpsingh@kernel.org>, Kees Cook <kees@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Matteo Rizzo <matteorizzo@google.com>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Suren Baghdasaryan <surenb@google.com>, linux-hardening@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, Harry Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>, 
	"Liam R. Howlett" <liam@infradead.org>, Alexander Potapenko <glider@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kasan-dev@googlegroups.com, llvm@lists.linux.dev, 
	GONG Ruiqi <gongruiqi1@huawei.com>, Jonathan Corbet <corbet@lwn.net>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 5557B5507C2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13166-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,oracle.com,gmail.com,google.com,suse.com,linux.dev,vger.kernel.org,gentwo.org,infradead.org,kvack.org,googlegroups.com,lists.linux.dev,huawei.com,lwn.net];
	RCPT_COUNT_TWELVE(0.00)[39];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elver@google.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,huawei.com:email,llvm.org:url,dfsec.com:url]
X-Rspamd-Action: no action

On Thu, 14 May 2026 at 11:01, Vlastimil Babka (SUSE) <vbabka@kernel.org> wrote:
>
> On 5/11/26 22:00, Marco Elver wrote:
> > Rework the general infrastructure around RANDOM_KMALLOC_CACHES into more
> > flexible KMALLOC_PARTITION_CACHES, with the former being a partitioning
> > mode of the latter.
> >
> > Introduce a new mode, KMALLOC_PARTITION_TYPED, which leverages a feature
> > available in Clang 22 and later, called "allocation tokens" via
> > __builtin_infer_alloc_token() [1]. Unlike KMALLOC_PARTITION_RANDOM
> > (formerly RANDOM_KMALLOC_CACHES), this mode deterministically assigns a
> > slab cache to an allocation of type T, regardless of allocation site.
> >
> > The builtin __builtin_infer_alloc_token(<malloc-args>, ...) instructs
> > the compiler to infer an allocation type from arguments commonly passed
> > to memory-allocating functions and returns a type-derived token ID. The
> > implementation passes kmalloc-args to the builtin: the compiler performs
> > best-effort type inference, and then recognizes common patterns such as
> > `kmalloc(sizeof(T), ...)`, `kmalloc(sizeof(T) * n, ...)`, but also
> > `(T *)kmalloc(...)`. Where the compiler fails to infer a type the
> > fallback token (default: 0) is chosen.
> >
> > Note: kmalloc_obj(..) APIs fix the pattern how size and result type are
> > expressed, and therefore ensures there's not much drift in which
> > patterns the compiler needs to recognize. Specifically, kmalloc_obj()
> > and friends expand to `(TYPE *)KMALLOC(__obj_size, GFP)`, which the
> > compiler recognizes via the cast to TYPE*.
> >
> > Clang's default token ID calculation is described as [1]:
> >
> >    typehashpointersplit: This mode assigns a token ID based on the hash
> >    of the allocated type's name, where the top half ID-space is reserved
> >    for types that contain pointers and the bottom half for types that do
> >    not contain pointers.
> >
> > Separating pointer-containing objects from pointerless objects and data
> > allocations can help mitigate certain classes of memory corruption
> > exploits [2]: attackers who gains a buffer overflow on a primitive
> > buffer cannot use it to directly corrupt pointers or other critical
> > metadata in an object residing in a different, isolated heap region.
> >
> > It is important to note that heap isolation strategies offer a
> > best-effort approach, and do not provide a 100% security guarantee,
> > albeit achievable at relatively low performance cost. Note that this
> > also does not prevent cross-cache attacks: while waiting for future
> > features like SLAB_VIRTUAL [3] to provide physical page isolation, this
> > feature should be deployed alongside SHUFFLE_PAGE_ALLOCATOR and
> > init_on_free=1 to mitigate cross-cache attacks and page-reuse attacks as
> > much as possible today.
> >
> > With all that, my kernel (x86 defconfig) shows me a histogram of slab
> > cache object distribution per /proc/slabinfo (after boot):
> >
> >   <slab cache>      <objs> <hist>
> >   kmalloc-part-15    1465  ++++++++++++++
> >   kmalloc-part-14    2988  +++++++++++++++++++++++++++++
> >   kmalloc-part-13    1656  ++++++++++++++++
> >   kmalloc-part-12    1045  ++++++++++
> >   kmalloc-part-11    1697  ++++++++++++++++
> >   kmalloc-part-10    1489  ++++++++++++++
> >   kmalloc-part-09     965  +++++++++
> >   kmalloc-part-08     710  +++++++
> >   kmalloc-part-07     100  +
> >   kmalloc-part-06     217  ++
> >   kmalloc-part-05     105  +
> >   kmalloc-part-04    4047  ++++++++++++++++++++++++++++++++++++++++
> >   kmalloc-part-03     183  +
> >   kmalloc-part-02     283  ++
> >   kmalloc-part-01     316  +++
> >   kmalloc            1422  ++++++++++++++
> >
> > The above /proc/slabinfo snapshot shows me there are 6673 allocated
> > objects (slabs 00 - 07) that the compiler claims contain no pointers or
> > it was unable to infer the type of, and 12015 objects that contain
> > pointers (slabs 08 - 15). On a whole, this looks relatively sane.
> >
> > Additionally, when I compile my kernel with -Rpass=alloc-token, which
> > provides diagnostics where (after dead-code elimination) type inference
> > failed, I see 186 allocation sites where the compiler failed to identify
> > a type (down from 966 when I sent the RFC [4]). Some initial review
> > confirms these are mostly variable sized buffers, but also include
> > structs with trailing flexible length arrays.
> >
> > Link: https://clang.llvm.org/docs/AllocToken.html [1]
> > Link: https://blog.dfsec.com/ios/2025/05/30/blasting-past-ios-18/ [2]
> > Link: https://lwn.net/Articles/944647/ [3]
> > Link: https://lore.kernel.org/all/20250825154505.1558444-1-elver@google.com/ [4]
> > Link: https://discourse.llvm.org/t/rfc-a-framework-for-allocator-partitioning-hints/87434
> > Acked-by: GONG Ruiqi <gongruiqi1@huawei.com>
> > Co-developed-by: Harry Yoo (Oracle) <harry@kernel.org>
> > Signed-off-by: Harry Yoo (Oracle) <harry@kernel.org>
> > Signed-off-by: Marco Elver <elver@google.com>
>
> Applied [1] to slab/for-next, thanks. That means including the kernel-doc
> workarounds in patch 3. I know Jon said someone might hate it, but maybe it
> will motivate them for creating a proper fix :) It seems better than leaving
> doc generation broken or not applying this series at all.

Thanks!

> https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git/log/?h=slab/for-7.2/alloc_token
>
> I did the following fixup to remove passing an unnecessary NULL argument for
> __kmalloc_nolock() with buckets enabled. Made bloat-o-meter happier a bit.

Good.

> diff --git a/include/linux/slab.h b/include/linux/slab.h
> index c232f8a10af6..795455256329 100644
> --- a/include/linux/slab.h
> +++ b/include/linux/slab.h
> @@ -894,7 +894,7 @@ unsigned int kmem_cache_sheaf_size(struct slab_sheaf *sheaf);
>   * with the exception of kunit tests
>   */
>
> -void *__kmalloc_noprof(DECL_KMALLOC_PARAMS(size, b, token), gfp_t flags)
> +void *__kmalloc_noprof(DECL_TOKEN_PARAMS(size, token), gfp_t flags)
>                                 __assume_kmalloc_alignment __alloc_size(1);
>
>  void *__kmalloc_node_noprof(DECL_KMALLOC_PARAMS(size, b, token), gfp_t flags, int node)
> @@ -981,7 +981,7 @@ static __always_inline __alloc_size(1) void *_kmalloc_noprof(size_t size, gfp_t
>                                 kmalloc_caches[kmalloc_type(flags, token)][index],
>                                 flags, size);
>         }
> -       return __kmalloc_noprof(PASS_KMALLOC_PARAMS(size, NULL, token), flags);
> +       return __kmalloc_noprof(PASS_TOKEN_PARAMS(size, token), flags);
>  }
>  #define kmalloc_noprof(...)                    _kmalloc_noprof(__VA_ARGS__, __kmalloc_token(__VA_ARGS__))
>  #define kmalloc(...)                           alloc_hooks(kmalloc_noprof(__VA_ARGS__))
> diff --git a/mm/slub.c b/mm/slub.c
> index a6e9015601d6..74652bbdd591 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -5303,10 +5303,10 @@ void *__kmalloc_node_noprof(DECL_KMALLOC_PARAMS(size, b, token), gfp_t flags, in
>  }
>  EXPORT_SYMBOL(__kmalloc_node_noprof);
>
> -void *__kmalloc_noprof(DECL_KMALLOC_PARAMS(size, b, token), gfp_t flags)
> +void *__kmalloc_noprof(DECL_TOKEN_PARAMS(size, token), gfp_t flags)
>  {
> -       return __do_kmalloc_node(size, PASS_BUCKET_PARAM(b), flags,
> -                                NUMA_NO_NODE, _RET_IP_, PASS_TOKEN_PARAM(token));
> +       return __do_kmalloc_node(size, NULL, flags,  NUMA_NO_NODE, _RET_IP_,
> +                                PASS_TOKEN_PARAM(token));
>  }
>  EXPORT_SYMBOL(__kmalloc_noprof);

Reviewed-by: Marco Elver <elver@google.com>

Thanks!

