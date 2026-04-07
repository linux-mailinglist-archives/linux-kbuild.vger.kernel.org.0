Return-Path: <linux-kbuild+bounces-12706-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKhiK17o1GmeygcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12706-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Apr 2026 13:19:58 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDD93AD9AA
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Apr 2026 13:19:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE102300E3BF
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Apr 2026 11:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08EC43ACA40;
	Tue,  7 Apr 2026 11:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YrBQxaki"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B866D3563DD
	for <linux-kbuild@vger.kernel.org>; Tue,  7 Apr 2026 11:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775560673; cv=pass; b=uBiYRkrBot6DqWbLBZXm2fcxsPnHQQtuqr1M06GFUlDdBn73tXdg9NHHw2eYaW087o8fnTfsed0VL79iyB+NSPFyQ+s2eJLVsAJZIdv9ajP/+M1jJYWR38f+D9ibLYYnpx0w6MPxWyMVPil/Qz1GeaDr5MYam2+vdQEUlOEgrcM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775560673; c=relaxed/simple;
	bh=ZqkWlF3HcKw9IeQbnlO7Z8vKgfQ7zuIoMkMXPESU5qE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EIj8A9uJXtYzQ4tick587U6Sl4g6qc9ABWHv2IqHp0i+Ha3taWxAcQtFXjx3jkqzzRjjVvAt7HWx5UH7jadHbSvWqXJxA1iDoR5nMc3qH+iHlfuZg/KyKACkUy4N/rVk/V7sTgurwZxIdl+jXArkOfKEW9EBdEUuWuo6F5VeTUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YrBQxaki; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1271195d2a7so211725c88.0
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Apr 2026 04:17:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775560671; cv=none;
        d=google.com; s=arc-20240605;
        b=L1yM+MZD0FobIVHvpn9nEn7HuDI8p2DelCnnhLtTYcrnaeQjAlBtbYiQQEe/BdgawO
         txq0R+r3QobTWDi02zz+QcfPVWg7Ohgh8pAW7UYsciGzltuV4zyEHrrt7FABxIxK+okR
         RiV7kMuZX4OeKxe4FmiyntADTTxuov4JeUBbk9z9FR/FdaaGKP6g51wdSY6XKe64aHSh
         x5wh7/uF0ZOvuKkcIRiryz3n2TnjTkY1/ekk8rd1ohsx+0vC93yW1W3EwE+KLAgJopFK
         2tTI1PVVvGwlO7IVsTkfrN7fbKLzwZwavovGwnPkFKR9hAkovVm34lBiuYIsu8IuVc/8
         9LBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7Ot/6cmUyAYlu4w3F36LFgW3QWHoYVPnUsR/JCweN/I=;
        fh=WtTnf4czaU/u0oFFky1vfi8o/ljMDx2gH4AlCenhXjM=;
        b=koOHDxvmzd0y7z6L0QoRoXxJNZYEwEM9cJb8WaaOnxBg+NJv8cLBwUgXxDUHqwp8E2
         H0nPfTA7hjVpjnlP1kMhcytcDLFBU7iu15DDsf5wLeMz4hbMGRbDj7fisCF3gC10kY56
         Ezie4onsqOasGHdWJHB/MUsoIyr1iGz/kH/6c00+pR4DzvUd9OsdO525Dx8ojIlurc23
         FMa7yJeJOt9VNgfcoEmkdLqgj9UMv7qq2SPqpxTk5FrvgLbKJPCAii/c0nNfLewE3n7R
         fadPrcvoEGhiPmo6tCbJzat+W1sCgCVXEyaZVScOmEy8DeVV3HOTI0BXEtpetuNkCrEH
         bgig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775560671; x=1776165471; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7Ot/6cmUyAYlu4w3F36LFgW3QWHoYVPnUsR/JCweN/I=;
        b=YrBQxakidi3vabOXFxkgxHz2kX35SIlIHgxGb/JhZsN4qDbU63Vt0JkXSDGiQwZASw
         FJU6cermHMj9rzzq0CiARK3umd27UjwEt84d2uKobn+07To8R5u/ViLK6k+9vA/Vpj40
         dIc025r8aqIFbxpX+jqQhKF49FRyic3w/V3WPcRBv3EpdzE9DL5Lf2v++tX/cN+4wY4E
         iSu6GqmcigtZuYW5vsY+r0in+sSlRM1fplKk/2sR4eGRLriAH98exu3+3GoI3eklx31T
         Bb9r9TCv065HYMvO8SJ7WS1IBaXT+rCaH5fZLf9FfHY+S4KgIDrpRrdEKEJT8JATPO1p
         heXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775560671; x=1776165471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Ot/6cmUyAYlu4w3F36LFgW3QWHoYVPnUsR/JCweN/I=;
        b=M0xlxXMBbqT8/GOpis0XJPfBy/Y3INf6JN65kpdHS07iuGyUJSzpkOl+9qEcfGZ3e1
         LklDjWQDo0OAYsEpHEaylHUYP3Sl268fhvrw4O5NeMN7jzERAG+dZkCMeDt3p3BY7z3j
         LXBzfQ/1gFqkkvvconKr7mvMYF3q2IPudpiOG8PHgiKSUy2P+iyOxQMfbTELWz4U5Scc
         i/DkIrjhJas4FJmhZXOBr2ibtoW4SY9gv5gMNQv6pWeqzKCjaLqRh3ZOLyvZL5gSd4GI
         yYliUj2y1pjXFka8xjQl4ybF5+DbS+tv2SNDLnV/ydzas724vzIKUH17XmOxGbBV9Jy3
         41Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWNBVyWB2zhPK1QrPjm7Hh9DLGVdf04WtJ4ySSyw9TmR+gXQuYdK9XLJ2HGKvXp8s2h0544AUPYdebl56s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKzfNTxWLFTe8E5Y60H4Q4GUs1SoPkFH2xhGIEtue0fG0nS/gJ
	MrNGcg43ew1pIUuTtP48XZPnX1eM8RI7LJccxgUlq57dXDLPkT22+Yh3fXCFU3vrmrqtxzrDaN6
	vEjpbTOvDics7vGqTFJnGvyRzGFQQpfn1ej13vyyZ
X-Gm-Gg: AeBDietFJ7BURIgxf+Z8JCY69FE71AzCCFSmb5XYJLy+RMN1LjpNGFRAKkr4bJlaOlk
	+K8NTl+7cuOkdZyhxXJbMLG33gNLemdiMy3oCzE4ZLvadtMAMN4k2IM1RbWukheLjjBoWVG7852
	58S034PYDhROnKIruF5PHXuy4t621NzlQlJax6xAof67ar+wFuy8/Vzn7ZZcmUINQdNjcb0jswb
	/22+YIhRDX7FxjYgxsLfSwgLCrfp8FM9oQ0tVKC8gcz5sLkIbKIq3h53zJrrA3ygDvbH83D7vpq
	ov6GDSv1CPD4WhYK6VCge/1oYO7pncuCqVMPW+s=
X-Received: by 2002:a05:701b:270e:b0:12b:fc21:874d with SMTP id
 a92af1059eb24-12bfc218ac5mr4490405c88.19.1775560670230; Tue, 07 Apr 2026
 04:17:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331111240.153913-1-elver@google.com> <ac9d5O5XehnXRc5A@hyeyoo>
 <d0fe363c-2e8f-44a4-9b64-3fa3ba9a5773@kernel.org> <adM2XVZf1DekahlY@hyeyoo>
In-Reply-To: <adM2XVZf1DekahlY@hyeyoo>
From: Marco Elver <elver@google.com>
Date: Tue, 7 Apr 2026 13:17:14 +0200
X-Gm-Features: AQROBzAgGN0NN5VZKje-TIGicheiDUli6J3RmxbH29tvqb2R9oxdlLQMmt6dDl8
Message-ID: <CANpmjNMeaWWuDMAj_n38U9XRqgZQz30ca82Vy10Bg=NoDfZ5ng@mail.gmail.com>
Subject: Re: [PATCH v1] slab: support for compiler-assisted type-based slab
 cache partitioning
To: "Harry Yoo (Oracle)" <harry@kernel.org>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, Hao Li <hao.li@linux.dev>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, Andrey Konovalov <andreyknvl@gmail.com>, 
	Florent Revest <revest@google.com>, GONG Ruiqi <gongruiqi@huaweicloud.com>, 
	Jann Horn <jannh@google.com>, KP Singh <kpsingh@kernel.org>, 
	Matteo Rizzo <matteorizzo@google.com>
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
	TAGGED_FROM(0.00)[bounces-12706-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,gentwo.org,linux.dev,google.com,oracle.com,suse.com,gmail.com,vger.kernel.org,kvack.org,googlegroups.com,lists.linux.dev,huaweicloud.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elver@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,googlegroups.com:email]
X-Rspamd-Queue-Id: 3EDD93AD9AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 6 Apr 2026 at 06:28, 'Harry Yoo (Oracle)' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
> On Fri, Apr 03, 2026 at 08:29:22PM +0200, Vlastimil Babka (SUSE) wrote:
> > On 4/3/26 08:27, Harry Yoo (Oracle) wrote:
> > >> diff --git a/include/linux/slab.h b/include/linux/slab.h
> > >> index 15a60b501b95..c0bf00ee6025 100644
> > >> --- a/include/linux/slab.h
> > >> +++ b/include/linux/slab.h
> > >> @@ -864,10 +877,10 @@ unsigned int kmem_cache_sheaf_size(struct slab_sheaf *sheaf);
> > >>   * with the exception of kunit tests
> > >>   */
> > >>
> > >> -void *__kmalloc_noprof(size_t size, gfp_t flags)
> > >> +void *__kmalloc_noprof(size_t size, gfp_t flags, kmalloc_token_t token)
> > >>                            __assume_kmalloc_alignment __alloc_size(1);
> > >>
> > >> -void *__kmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags, int node)
> > >> +void *__kmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags, int node, kmalloc_token_t token)
> > >>                            __assume_kmalloc_alignment __alloc_size(1);
> > >
> > > So the @token parameter is unused when CONFIG_PARTITION_KMALLOC_CACHES is
> > > disabled but still increases the kernel size by a few kilobytes...
> > > but yeah I'm not sure if we can get avoid it without hurting readability.
> > >
> > > Just saying. (does anybody care?)
> >
> > Well we did care enough with CONFIG_SLAB_BUCKETS to hide the unused param
> > using DECL_BUCKET_PARAMS(),
>
> Hmm yeah.
>
> I wasn't sure if we could do this without hurting readability,
> but perhaps we could...
>
> > so maybe extend that idea?
> > I think it's not just kernel size, but increased register pressure etc.

I'll take a closer look at generated code. In some cases the compiler
ought to omit zero-sized arguments, so I want to be sure we're not
prematurely optimizing and the size increase is not some other effect.

> Something like this should work? (diff on top of this patch)

Thanks, I'll consider it.

Re your other comments:

> Assuming not all people building the kernel are security experts...
> (including myself) could you please add some insights/guidance on how to
> decide between RANDOM_KMALLOC_CACHES and TYPED_KMALLOC_CACHES?

You can find different arguments for either, and in the original RFC
that was part of the discussion. However, my biased view is that
type-based partitioning in general is the stronger security boundary.
Because it creates a deterministic separation; specifically isolating
pointer-containing objects from pointerless ones: it effectively kills
certain classes of exploit techniques that probabilistic defenses
(like randomization) only delay, especially in environments where
attackers can retry or use side-channels.

The current pointer/non-pointer scheme is relatively intuitive with
well-understood properties, and a good start. However, an open
research question is if better alloc-token ID schemes exist: one that
is tailored to kernel data structures that would meaningfully increase
exploitation difficulty further without increasing the number of
partitions. Since an improved scheme could simply be activated with a
compiler flag, having the baseline infrastructure available and
maintained is the first step.

> Now somewhat out-of-scope (or at least pre-existing) review comments
> from Sashiko that I think are still worth mentioning...

Indeed, these are pre-existing issues with RANDOM_KMALLOC_CACHES.
Worth follow-up patches, but this patch here wants to just get the
TYPED_KMALLOC_CACHES infrastructure in place so we can build on top of
it.

Thanks,
-- Marco

