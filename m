Return-Path: <linux-kbuild+bounces-13255-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gG5QG2AfC2q8DgUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13255-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 16:17:04 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C895F56E8B8
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 16:17:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B42C43010163
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 14:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77EF230DEBE;
	Mon, 18 May 2026 14:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RCULnOto"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC43037A493
	for <linux-kbuild@vger.kernel.org>; Mon, 18 May 2026 14:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779113378; cv=pass; b=UxnaNCsFyfsHdWTa9uDtLmMV2c1aT2iRzhdjdefiA/AMzFrn6nd5bhmNR6GMF5ILalGS4kw6Yiwq+YWHkWvf5MkQkkqoNBM5kYlG1FlCwtdFoQ5S+vTjz/uLSU7XIeo9Yhr1f4bgGcCbd4TFX3/Yp0Lar3SYFqK8dxrVjbo32tk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779113378; c=relaxed/simple;
	bh=HhOB63VsXgJe0fuiBA7xxTI2UH22ig0EY/B2rVrPImo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CUoEKVw5rv67ak2uLVDYyGrDNNoCrvh3A4MfpyO3blRu3uWFCX567bTroT8fNwQxo7XEZCHTY82p9HJsNNHoRWTAB7Ji55siOj6Cwc7UuUWUSzA3Z+SQ1N+CcpQD8JenNOC5bwHfOquogkUb4Py+Qpk2n3WyOqzeLStDEe0Rr3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RCULnOto; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1357c851a48so1641509c88.1
        for <linux-kbuild@vger.kernel.org>; Mon, 18 May 2026 07:09:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779113376; cv=none;
        d=google.com; s=arc-20240605;
        b=lf8TUqMFDpVQCogRRF5j8bst0spyuEhLl+veWRjweJcV+nZWcHNHgHkMQ3LorXgUp1
         A3FfwSn7LKH+QXTLFaNXkBuVnRQ8hgSHfMt8m6HG8kJ9tu0XKvDY4dPgDzh8yJPMFyXg
         aWwXN66vJ3WoEHsbtQFRjfJZ6NGE4yqZDJL5lX1lL/ZYAvFEf9lVAjjAqHyXwpYkOs1h
         8hx1N0pZF2OI6DOdLpnSGqA4zMA8V2dolfM0BJ1hgDjmyTT5EagVkZGIPfHuF6qIIWx7
         AM653re2S/dX/BtZxN9znSiE9kbq0I/blaIA+Bx7oRZ+ZpJ2cW/+pufO0kDFkpZoFYGa
         1eng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nVNeIyEFEYH1knjNU1H5DLQ8NJ8o0Em1AHL69lK30IY=;
        fh=oXMtUxQ2boQtcOqghLr7OE4+zUZAdPZGfAAePXEmy7g=;
        b=Ce/O//Kmpn9UOgZo2Yenr063yE/E/S441mRbrgoPQHQR2odM7APBFg+DbHkVa6VGiS
         YKqsxSP9dss0YA4NtnHbCKvQisl4vEVJy1bN9Zqw5VvmtSVJRv9odhF/w2j2IvcTSJjT
         xnLmcblChdPGZQOhDMKbK9lvMHyfl3EPEqaF5EYxIy3AtaDT8OA9ybZAaBl4bCVk792f
         gx9y21+041UgAwDYP9+NcCUpOFgLLP3QYj+vnHpp0b8EE5T/dh7Xpin+mptQf/hz3ey7
         obHzUMO7Ys61/htXPuyhYJuNO8aF4IZmv4fJZX6uvALB6sPrEfMRGAfk3RFP1XE+5SC3
         FvHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779113376; x=1779718176; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nVNeIyEFEYH1knjNU1H5DLQ8NJ8o0Em1AHL69lK30IY=;
        b=RCULnOtonAvTCYXoQLLujM+Kvosd1pCia5gSlri9vpzjvSega8YbdkJR0axp2yeyOk
         zZKf0ttiYW+0VkrR6Qeetbh2HaJePOj2WzEQXpit7wuHVuGti1ki6yf02SdBeQ9l+sOO
         KNl0SD2gP5d3eqhLX9qyyzz2sMCC3A/hYY46064MRRIwPPmBeoO61GMtydZUMxw5+rqa
         evYrM3DZLDdSLKNdE1fNMUPA9x1h7DPIIJSJBlzAZ/q0+DLQ3jG6fbN1uj4QKEFyCYAq
         I3wmO1RKVgqhvXMIvK1V+uLbhVlxw+L/c1OJPBFtKVLhZGxBn+8KyjpQWoWSk4x04gqj
         zd/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779113376; x=1779718176;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVNeIyEFEYH1knjNU1H5DLQ8NJ8o0Em1AHL69lK30IY=;
        b=Y8ycwSv3+2rmnz9V2fCnq63DXdUzUsb0BLT28p2ns3tCOacdMuB42PVbQjHXqPlmyg
         ZuglSbJmltzBVa9f0eX8fWbYJaaFDP+TQGmry7D2UCK6iMOHrukWwU+N4LGGqqRwTIvm
         oifipVrT3NZtNd8uhuQrTezIo33ssISCLvsHcOHCq/zLGw9MPGNzglu5W7c/IGXyxJAv
         BUwoR4ITVrX4d64ns8o/rqOC/AbRgRoiRRAtJN5K7Swpwb+8UzScop9Zd26L9OHIkDRw
         yZV1PqZo1ljItWEC+ZTxLUE/uL/HByARpLljbu7QG/ogiXcnikPr4xqbHaQniJLrTLJb
         wGoQ==
X-Forwarded-Encrypted: i=1; AFNElJ/GLVBRwqzS12EEJmJwj8SD1ocaGlHtAb3aOL41K/fM1qqdppuigCrJVX1nt2L7rN80xqbRSuxQJ/r9Kf4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj6OeY87GBguPP8rsUidOKlcpkTB8oAX0mAnA6689vU4dGE78c
	rV/I/hyd23XiPh+lXA9wO0tuKTRW+pBMfJwOPLl3R9J+EHymqkPNnViwfXzZjWWXNQiVhgSg0DF
	aqIZEWmKNPmctwxX+Y/oEHiu6xlSHQbkRCs5FDaKN
X-Gm-Gg: Acq92OHb3aCu0HG1je/zSeTXFioE6m8FoPtT08GUCEiPk0hQGR6RN84eYG/Nu553CBj
	yfxA0Ze2ortr3d0C0421lc4F3pPLvK3kMy+Y61pdKY7WDZZd9aoFqscDlNrWxq/ZGNVRUSe8V9C
	XjVx2pyWdBbPHmu6aPaM5CrHjuSN6PUenVr57Qk1FRqbGcEaC2iDspYbIyTi49+40NxXertccBi
	pBoobeXMO29AU3I85PGFpkI8KvYsFCvFpVtZh/PzhASWe5C7qAzx0pA88bGGODyrRuVgyv+2lSS
	KSRN99P3dCD3ZBv25k8IewbJqUd/7f27KsjiTeKhQtiumTDA
X-Received: by 2002:a05:7022:660e:b0:130:6c8f:5aa3 with SMTP id
 a92af1059eb24-13504418706mr7462281c88.12.1779113375348; Mon, 18 May 2026
 07:09:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511200136.3201646-1-elver@google.com> <agcsMgfKjGTasJ5n@pedro-suse>
In-Reply-To: <agcsMgfKjGTasJ5n@pedro-suse>
From: Marco Elver <elver@google.com>
Date: Mon, 18 May 2026 16:08:58 +0200
X-Gm-Features: AVHnY4KwxhkHo10jEIBm11GIDEKZZU-LpYTl6pFHzoIdWDT8Gwo4IdHMoFpgtk4
Message-ID: <CANpmjNOYd9RnJARZ7qUDifsftwWOhhakaWSu926PKA6-SepTwQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] slab: support for compiler-assisted type-based
 slab cache partitioning
To: Pedro Falcato <pfalcato@suse.de>
Cc: Vlastimil Babka <vbabka@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
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
	GONG Ruiqi <gongruiqi1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
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
	TAGGED_FROM(0.00)[bounces-13255-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[38];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elver@google.com,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,oracle.com,gmail.com,google.com,suse.com,linux.dev,vger.kernel.org,gentwo.org,infradead.org,kvack.org,googlegroups.com,lists.linux.dev,huawei.com];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,llvm.org:url]
X-Rspamd-Queue-Id: C895F56E8B8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 15 May 2026 at 16:28, Pedro Falcato <pfalcato@suse.de> wrote:
>
> On Mon, May 11, 2026 at 10:00:48PM +0200, Marco Elver wrote:
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
>
> Hi,
>
> A couple of questions (I apologise if this was asked before, I wasn't involved
> in this thread):
>
> 1) What's the object behind kmalloc-part-04? I imagine it's a single type
> getting allocated a lot?

That's from __kmemdup_nul().

> 2) The bucketing looks quite skewed. Do you have plans to implement something
> more similar to what's in the original Apple blog post (with the smaller
> granularity and all)? I'm asking because most of our types have pointers in
> some way.

Having a scheme more tailored towards kernel data structures would be nice.

But we first need to build experience with this, and get more data. I
think I agree with you that a smaller granularty scheme that tries to
bucket similarly-shaped objects (e.g. with a pointer bitmap) will work
better for the kernel, but I have no evidence of that yet. We need an
analysis of "this scheme would have stopped X out of Y exploit
chains". There are plans to look into that. But if an improvement
comes out of it, it's just a compiler-flag flip away for the kernel,
once the compiler supports it.

There's also what Kees had proposed:
https://lore.kernel.org/lkml/20240809072532.work.266-kees@kernel.org/
.. but that trades memory and performance for stronger partitioning.
Probably should become another KMALLOC_PARTITION variant.

But if performance and memory usage are a concern (which is the case
for environments where I'd like to enable this), we need a smarter
token calculation scheme (if the current one is not good enough after
some analysis).

> 3) Obligatory "how about GCC?" :) I quite like the idea behind this feature,
> and it would be awesome if it could be more broadly deployed!

+cc linux-toolchains

We'd need __builtin_infer_alloc_token + -falloc-token-max= for kernel
support (-fsanitize=alloc-token is not needed if kernel support is all
you'd care about):
https://clang.llvm.org/docs/AllocToken.html#querying-token-ids-with-builtin-infer-alloc-token

Thanks,
-- Marco

