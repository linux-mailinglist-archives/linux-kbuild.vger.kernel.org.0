Return-Path: <linux-kbuild+bounces-12850-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDuYHXTM52nNAwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12850-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Apr 2026 21:13:56 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C610C43EE23
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Apr 2026 21:13:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA2F8301F9B2
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Apr 2026 19:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05CFB3AB281;
	Tue, 21 Apr 2026 19:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gJb8Yplz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D9E284693
	for <linux-kbuild@vger.kernel.org>; Tue, 21 Apr 2026 19:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776798829; cv=pass; b=mRrVD9/qucWhOOmt1TPctvwEFNqUPDvaGmFRc3F2HPoFmUcc6FscuFx5moys7LtyFkLsBm2Q6pIdQjsApzG2ohD0EL5q1VXfP2QN32hgFKRaDX4PD/3tbdyDI5WukqRQf4ctg4tHRNBdg4jhERremyxmRkJC9dm8dCdfj1lXTx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776798829; c=relaxed/simple;
	bh=X4Wq2yf0iLQmaCYexwPzuD8C38X8+peC49jk0V+3V8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SoYIRxnlDmrqTGIG3uWGVXcr+P2/u4QP9UxLDUHnpRZ1WbeTLUvbMc/QhhD7dobxZg1uB733f9zW32J1BirqHOnesCJA+drs0LTxIUm18pMtINwE7kGjSZuKrnhqSmyysc9R6J21QX1G203AZcv+9Lzx0pDIOMgNVBfiH1YIEcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gJb8Yplz; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12c45281a06so6206040c88.1
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Apr 2026 12:13:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776798828; cv=none;
        d=google.com; s=arc-20240605;
        b=hRty7DoO6VTzoJu+tCo9e/txn2I8sanJpvxsobBq2XyGk5+BPUgTFEOTcGZG1+kyWq
         jzHFLEQigYQRcY4kjY5l18+VfeiYs/SKeVLzq73Q0IYjWZF7AsHB9waTm6w6k/J6bmdH
         C+I6HGxFw+VddDc/wMz8ddm9Lc6o7R7WkOs4UEcOy7OnYiwmhVd5R0JsToSHFybhY0ax
         odnAjtpAFD92Q9FkjPD/ALUDvgBII6q4pxWLSjf4N1RiFOLae0Wy4oCGwBva2YGHeFnC
         bjTtKv5CxFCo+ig31g6cYuro22CjXvbqlxqsT2yYCyTn15kPfRGLwZMHP+D8zYSlh4Fm
         jClw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J+nBi8NMCSPfGIscPWxKFWQOBdlvlCfORQNm2QzRooQ=;
        fh=fyJINfrqQIxGs12vtQEmX/VxB/ytkSaZbsBS5GIYpKM=;
        b=QlyEr5nFdzhgNbBj8tc+OgflIA/1XUxKYNfXI2hLekntBP4y0fwJqlciRTUaghFVwB
         +m3F6xOKsf6I80zcRGWNZPBFiJsffB4diwpLjJrno1rBbu6sbIRwr2dUOAzKkMj4fL/q
         yDYtvMbHp7tR5vGJ6zA1rG7jq+nnvZR/7L0/i8hTwBFrk1XTDMgrZ30Y5PGySXbaBUKy
         3byGlbk4LCMtaz1pmlDTOwzq3ELmUir79alRpJGutR1Lc1UjVY+7JNJOJiGlaabsKlt0
         j+wcvfy+rEO0PNyuZaDLY4eZbkUdcW9qYhINYTsr+g8FCkSzxiU1x4sPZZOaRlva3rnx
         e44A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776798828; x=1777403628; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J+nBi8NMCSPfGIscPWxKFWQOBdlvlCfORQNm2QzRooQ=;
        b=gJb8Yplz3OHDlZrxo8835UYgB7N/2/Sumn/MImSDNYEubTQrst5w8OUomPU4ZLfXyP
         NZrXeEyKz6f+/62Olb0PBZ7rDxPVFLSSu9coBUZxMgnSkwmCQE79vmCcLBKON2h1G2gJ
         xsO8GK9cHSR/9nBxjBpsvarVIzlFxXpNfvk/XvSXiuGYBTXw1Nl9/k9KtWEXf3EsEx2P
         nQin5HyalvdcYpIFGClypw1dx5vKzSOJ/3NrPmtaoamM7rI1oMPB7iDGPGRR/lK+rZE/
         KoXKyZNRVc6qGo8WCxRjDqnVPVlt9ZmjkQ54+lMpxNmxwgED0wmpXrQ8RTjA/4UaXt3/
         8qZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776798828; x=1777403628;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+nBi8NMCSPfGIscPWxKFWQOBdlvlCfORQNm2QzRooQ=;
        b=U9TwFhLKJh7Fb7HkVwL7ZvppumUjfp3z5P3gb4F4mnVKHI37RKgsT6m1JUGhk36xV2
         JcB2fKNohtyShB5u6qamjfuPPVRypecL114nyxSY5z3g+Esl1/URGmC0h63C140OC077
         iPyiMd7XhDyPUB+c0knm5AnCoE19j5e4OrQPS89p2m1bseyIVWCECCtmId8/8GeS9DJw
         EoB9IQczU5vgJn04TnSTyYY+oNqiA4q1oYi/TBDD5PqzhGBgyNSv9Y+GPstcG+aNYYGr
         hZpwQ0QgEfU7PPQvlWqhH1IPrwoN1kwEleYx+n3IQFeFayrvUzM+QKfKMA6e9vrW9aTN
         tT/A==
X-Forwarded-Encrypted: i=1; AFNElJ/2UZoJq+us5Dm/ryfSWEhDPNzuSPePoyrIdqgjiDJMTWKj8jE0vUU2z5LJbfj7ORfnVjh7rvdyTWtiKcM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR0eMazMMY0SuIAzUcT7I9b/cLuaJdx5K+FSlnFmWiNJXCw+oW
	IwNwJbHZH2FsbeCc1VWh75CyTtO9GFY/yrKTVALn2eZ1XnToZw44kL7HLmZXazDxZ8hmTHFmK7t
	bTMHMOMU6RcDUONbjy7463rdtEg+LG3rEULeO7Z1v
X-Gm-Gg: AeBDiesHCUO7W8E8TSPVx+pfp+stZAHtO+/USNOHexfFTF7d6YAhQZa50vITxpnMM0V
	ULrD9+lhDg5qgp0HZPF21vi7grmyem5A+BehprcqCva6s2BoWYciXkR2lvF/AblNL+0xKW/IiDw
	i7YTapj80bnpYI6gvEJBio0iHihHoAn+ko3Zn5z9qfq7Gh9J9r09bx5rNhVSukM4pmJvqgSUniq
	GTMuGoZAAqsoNykENnFWxcZUtnB6vwhVUuh+clCOJz8ZSc/Tr946q0Plet4CYJImYfPToLe3odX
	woH8bbDM7UNcwDdT3HuKMelW2a7IusoTdJuZcyL0+X7HeLj3/DiU1TJxb9CdzHG3xjKHN/E=
X-Received: by 2002:a05:7022:4199:b0:12c:2cf8:2f30 with SMTP id
 a92af1059eb24-12c73f83616mr10488523c88.15.1776798827054; Tue, 21 Apr 2026
 12:13:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415143735.2974230-1-elver@google.com> <202604210954.84C57E5E0@keescook>
In-Reply-To: <202604210954.84C57E5E0@keescook>
From: Marco Elver <elver@google.com>
Date: Tue, 21 Apr 2026 21:13:10 +0200
X-Gm-Features: AQROBzBMsDbE7_dyhVt5xWTROldThQNRDRm_VJxxVveH1z3BL1b5nLG0UUHDDRE
Message-ID: <CANpmjNO8CcR56LXAQf4GQhGcbU4MQkRCa7gVvwuAfvVrzEUhQg@mail.gmail.com>
Subject: Re: [PATCH v2] slab: support for compiler-assisted type-based slab
 cache partitioning
To: Kees Cook <kees@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, Harry Yoo <harry@kernel.org>, 
	Hao Li <hao.li@linux.dev>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, Andrey Konovalov <andreyknvl@gmail.com>, 
	Florent Revest <revest@google.com>, Jann Horn <jannh@google.com>, KP Singh <kpsingh@kernel.org>, 
	Matteo Rizzo <matteorizzo@google.com>, GONG Ruiqi <gongruiqi1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12850-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,gentwo.org,linux.dev,google.com,oracle.com,suse.com,gmail.com,vger.kernel.org,kvack.org,googlegroups.com,lists.linux.dev,huawei.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elver@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,googlegroups.com:email]
X-Rspamd-Queue-Id: C610C43EE23
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 21 Apr 2026 at 19:22, 'Kees Cook' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> On Wed, Apr 15, 2026 at 04:37:05PM +0200, Marco Elver wrote:
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
>
> Great! I'm glad this gets deterministically handled for the kmalloc_obj*
> cases.
>
> > Additionally, when I compile my kernel with -Rpass=alloc-token, which
> > provides diagnostics where (after dead-code elimination) type inference
> > failed, I see 186 allocation sites where the compiler failed to identify
> > a type (down from 966 when I sent the RFC [4]). Some initial review
> > confirms these are mostly variable sized buffers, but also include
> > structs with trailing flexible length arrays.
>
> For the call-site-partitioning series[1] I sent before, I had
> per-site caches for fixed-sized allocations and size bucket caches for
> variably-sized allocations. I'd like to see something similar for this
> series. Specifically, I replaced "kmalloc_slab" with "choose_slab" that
> did O(1) to find the dedicated cache/bucket for the allocation[2].
>
> In this case, we now have a build-time-constant value that it should be
> possible to use to look up a _single_ dedicated cache/bucket for the
> given unique type: there is no need to do hashing.

That should be a separate series; I know what you're getting at, but
it's a significant rework and a different design with different
properties. This simpler patch is likely ready for the next merge
window (once I send v3), and in light of recent developments, I'd like
this to land sooner than later.

> > [...]
> > -config RANDOM_KMALLOC_CACHES
> > -     default n
> > +config PARTITION_KMALLOC_CACHES
> >       depends on !SLUB_TINY
> > -     bool "Randomize slab caches for normal kmalloc"
> > +     bool "Partitioned slab caches for normal kmalloc"
> >       help
> > -       A hardening feature that creates multiple copies of slab caches for
> > -       normal kmalloc allocation and makes kmalloc randomly pick one based
> > -       on code address, which makes the attackers more difficult to spray
> > -       vulnerable memory objects on the heap for the purpose of exploiting
> > -       memory vulnerabilities.
> > +       A hardening feature that creates multiple isolated copies of slab
> > +       caches for normal kmalloc allocations. This makes it more difficult
> > +       to exploit memory-safety vulnerabilities by attacking vulnerable
> > +       co-located memory objects. Several modes are provided.
> >
> >         Currently the number of copies is set to 16, a reasonably large value
>
> The "16" buckets seems to hold for TYPED_KMALLOC_CACHES too? My goal
> with the earlier type-partitioning was to get _total_ isolation, not
> simply bucketed: 1 cache (or sizes-bucket) for each type. The "16"
> limitation from RANDOM_KMALLOC_CACHES was kind of arbitrary due to the
> hashing.

The token ID is also a hash, although it can be configured to be
unbounded to effectively give unique hash per type. As-is, limiting to
16 keeps it comparable to the RANDOM mode, albeit IMHO with better
isolation properties with the same overheads. As-is, performance
properties of RANDOM and TYPED are comparable, and the friction to
switch between them is minimal.

Unlike a completely new design, which will have comletely different
performance and memory usage properties - and wouldn't be comparable.

> >         that effectively diverges the memory objects allocated for different
> >         subsystems or modules into different caches, at the expense of a
> > -       limited degree of memory and CPU overhead that relates to hardware and
> > -       system workload.
> > +       limited degree of memory and CPU overhead that relates to hardware
> > +       and system workload.
> > +
> > +choice
> > +     prompt "Partitioned slab cache mode"
> > +     depends on PARTITION_KMALLOC_CACHES
> > +     default RANDOM_KMALLOC_CACHES
>
> I think this should be adjusted a bit:
>
> config CC_HAS_ALLOC_TOKEN
>         def_bool $(cc-option,-falloc-token-max=123)
>
> ...
> choice
>         prompt "Partitioned slab cache mode"
>         depends on PARTITION_KMALLOC_CACHES
>         default TYPED_KMALLOC_CACHES if CC_HAS_ALLOC_TOKEN
>         default RANDOM_KMALLOC_CACHES

Sure.

> And actually, perhaps a global rename of the options so the selection
> naming is at the end of the CONFIG phrase, and bundle the on/off into
> the choice:
>
>
> choice
>         prompt "Partitioned slab cache mode"
>         depends on PARTITION_KMALLOC_CACHES
>         default KMALLOC_PARTITION_TYPED if !SLUB_TINY && CC_HAS_ALLOC_TOKEN
>         default KMALLOC_PARTITION_RANDOM if !SLUB_TINY
>         default KMALLOC_PARTITION_NONE
>
> config KMALLOC_PARTITION_NONE
> ...
> config KMALLOC_PARTITION_RANDOM
>         depends on !SLUB_TINY
> ...
> config KMALLOC_PARTITION_TYPED
>         depends on !SLUB_TINY && CC_HAS_ALLOC_TOKEN

There was a comment somewhere else that even introducing
PARTITION_KMALLOC_CACHES might confuse users of RANDOM_KMALLOC_CACHES.
I think completely getting rid of and renaming RANDOM_KMALLOC_CACHES
has marginal benefit, and will cause friction for existing users (even
moreso than already). I see little benefit here, and would prefer not
to break user configs more than needed: configs that already set
RANDOM_KMALLOC_CACHES, upon rebuild will be prompted to enable
PARTITION_KMALLOC_CACHES; if user says Y, then their previous
selection (RANDOM) would already be picked and they don't have to
rediscover that it exists under a new name.

I can make this change, but only if you're sure the benefit outweighs
the downsides here.

Thanks,
-- Marco

