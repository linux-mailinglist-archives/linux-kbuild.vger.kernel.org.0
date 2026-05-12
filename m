Return-Path: <linux-kbuild+bounces-13126-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MzNNkL4AmoTzQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13126-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 May 2026 11:52:02 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DC63051E134
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 May 2026 11:52:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5E6FD300B291
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 May 2026 09:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADD054BCADE;
	Tue, 12 May 2026 09:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l4Domj8i"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A652F4BC023
	for <linux-kbuild@vger.kernel.org>; Tue, 12 May 2026 09:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778579517; cv=pass; b=N4Ag0iW4ImBPzkDNDcUc4q+kCG42HQ5kDl4Sr8+nsvNTHgaETnAiFbN2WK5ZSCARe/qR8nJVCqBZhFHeH4C2NM6iMH2UWVPaTj9KK6pO0B1aSUbGWm/4N8BtIahdD5HotlvWlIoPaDbNxNyXI8/iFyHNOX2PjKQhXdXlXilXzYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778579517; c=relaxed/simple;
	bh=EIsIINGplKZJmp6KyNBZmIyWQAlnRy4EfCcfLd8VLHs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ln+ZYJkSiWibCEs9x0xj0IXCAhb5ujZ78rIv2RfnLt4FJ69KeLrmzxo/mslXeerihgR2q50makmIrWOFYs40ah9er8pSJfgNY/3QvBarI5nTNJCjnfGJatAf6XsMspTveYu234NTaesYvZKmRCFTyrM3R9UoHwhXd/d7XdlKTTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l4Domj8i; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1332772f6b3so2252683c88.1
        for <linux-kbuild@vger.kernel.org>; Tue, 12 May 2026 02:51:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778579514; cv=none;
        d=google.com; s=arc-20240605;
        b=Ak1T05gbQ04lsa5OE+wrgBzEBCODOByDvkBEuBMZoYux3kfDKLudiBiFHznPQ2gbuk
         E6ACOcEf000eGX3k/scfXKfLXomj4LRUSrpiXKSsbob36qR8JmG15OwdtWhBFDKmoyCM
         2HvRpjuWD3R/YRwM4WH2hTwiKJex9Qp6Xda4JrcNvg14WqO4X4WOdffCDOdl7V58b/hw
         inj5mpBxrpCWra1IzndaUTwAS3qL9A/JPGbkhcBRjVj1hv/xbPv0EEwRdSn2tDuq71Ex
         NnaGtUVQYgaGSviDvtUuo2YO9KILJsaYw3L41jcHDb7ak3iAj3NiBydq5KL3Qn1uFAvQ
         TESw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+ec8Gp9KIgloqxfI4Ah9RgcAxU70GC5qHU2EuM04KDM=;
        fh=89ME1Qwmfzo2/Qh9Hp2ixwh33ZSQhEI6vxn/iXoWNZ8=;
        b=abNY0+3Q0ckkUSxrGJe8qxdskivW/wmWNKKDkKqM50iJNv2ZkInouX+skItBIkrFB8
         SnBK6iOhwPsxJs3aKb3VFFwYRkoDa9YyToW5MOCDukWPi1M6O+w4qKQQYoP1zrkdrgo3
         gQ3gdTMsImYDUU0lTdJp0hTTtDwO24pxUA0FOU3JgTUTGMmjCdoI6sxApXnV9nFtc3PG
         HqtmfDjQ84/Yg+16pfVFH1e1HU79d6u12090q494gy3SircawBfAHROIwIZx4rp6tZ+d
         2hg2actcTtvqxCBnD2ziJkX+7jMlRoFI07lRkrKJAm08go0pNyhnTbC/r+wEpdGzsm+r
         zVnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778579514; x=1779184314; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+ec8Gp9KIgloqxfI4Ah9RgcAxU70GC5qHU2EuM04KDM=;
        b=l4Domj8inxGVm5Bp7+5ucV8jYDuDKDIDjlyjS1jwCBey1DhmQq2KHip6/hbkWQ/TvO
         Q1MA5cX3zO77Ija8uWGiArMgJoYCjjso89pSTD1kwhwltdenAYfyAZij0e8LK8NqqsQ0
         2qFwADsdr3UR705KNj9wCq8ibpmjlhHADEtKJpjG7IOSdwVWCQSEPRZGxpwSFnix3dlk
         R5YozBg0f83Y54jpd2V5ey20pufnemPji+tSdtu4jwNAd0+ZHp+bd/pxvODVhI6uVFNR
         nKsrTns1tBYe8ONcSZPXNIdPfDIyDZrJwmuoMu1rDMVlvyhok+43Fv7262BYxbQgD4tS
         t2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778579514; x=1779184314;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ec8Gp9KIgloqxfI4Ah9RgcAxU70GC5qHU2EuM04KDM=;
        b=p7VAFx+siPGbW8Z3wawE3R8S/7St8LbAT+kGUcG9IsUa2h/rgQUedDUsrnxl4c1OXU
         ZFiVdM//+v0UoWO3ei2raBkb/gmp8WxzyBhZmUk/IlAFvuTmYPR+lqvaXe9z7qfgvpQU
         PE8zwBVi7WVm6irKUKeAJ8EtJyIalbormj3XqVasGoEMah9kkFCY0S0x5pGGAADlDMUY
         j6eLS06jFVwutS5BL5ePUbzq9avsmF9JfmenyQp3a6bEGwJVgJ3YnMJKrtuwGcphowWB
         LscqnzLF68u4u7/N7F+DNVGNTOrkO+8JXBFFrnscRrW57pwu1gcNtJ03I/3hzfohigsH
         EhLQ==
X-Forwarded-Encrypted: i=1; AFNElJ+crqLjpaBKY1e7scXWcDmXNmp0vLsQiMaYU2NJUr2QVL7N2xZ4UGRH6qYAvTx9uY6FkwjsmAno86E8HXI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFIh9evZh5JuUKThP0BtDbuY1EyHeflXmaKwTm1UEn7U/9j9dl
	v90Mc9qMRtoOh6IS7+6b9cUxuoZe9OJWGy6W0FMrJXBrCEGjDNKIsy6KRnYJQ3F1fp/aWWThfQK
	DSIsiyCnATdp1sbXn5LFBR8LtmgZNpngVQ5bv8ycT
X-Gm-Gg: Acq92OEo5dGohRwsUS3AVeD3TIr0G+YYg1zGju6Ew0lAYT8J3WNBseiIrpaY2kcx8nt
	LVanScxWKKzEBoOD4XtvvIqesNOcoGZaK9KCGbSk4I6JesAeOR7C91ryD8WidikU+fuoQrQ3QCD
	ztd0BAV2x7LU6l05gUzCGPIl71Z+tLTKEj9+jRWsFn0l//SeRh7epbW/TjqSgkiuwco79/iOG3j
	Bo/JOHtAJELufPcGYcjHUVu6ZWNa9DavEGa4V8qMEgd+gmc62m70PAqEJbkL5Ce4iWDVH5hg4bc
	CYg19iqjITfJMLBzd1Hej4RlJcDlyowWg9i80rP7/YhqeJbI
X-Received: by 2002:a05:7022:38c:b0:128:d20a:2f40 with SMTP id
 a92af1059eb24-13344c4307bmr1461470c88.8.1778579513098; Tue, 12 May 2026
 02:51:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511200136.3201646-1-elver@google.com> <20260511200136.3201646-2-elver@google.com>
 <3z5unwqxty4qq2siingxdijbk642te7kf26ba4ff2xsmyptgq5@i6bxrvkfbve4>
In-Reply-To: <3z5unwqxty4qq2siingxdijbk642te7kf26ba4ff2xsmyptgq5@i6bxrvkfbve4>
From: Marco Elver <elver@google.com>
Date: Tue, 12 May 2026 11:51:15 +0200
X-Gm-Features: AVHnY4J9rWhb6ZrnXllLEE_U0YQh3r6D8w8ra1G0CJOzHs8wrDs9DHipy-uAw-w
Message-ID: <CANpmjNN-rPHMOGxyfcAGiJKDdDixiB70uYOa0UVCs92QgMNGYQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] slab: improve KMALLOC_PARTITION_RANDOM randomness
To: "Harry Yoo (Oracle)" <harry@kernel.org>
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
	Christoph Lameter <cl@gentwo.org>, Hao Li <hao.li@linux.dev>, "Liam R. Howlett" <liam@infradead.org>, 
	Alexander Potapenko <glider@google.com>, Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: DC63051E134
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13126-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,oracle.com,gmail.com,google.com,suse.com,linux.dev,vger.kernel.org,gentwo.org,infradead.org,kvack.org,googlegroups.com,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elver@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,googlegroups.com:email,mail.gmail.com:mid,gnu.org:url]
X-Rspamd-Action: no action

On Tue, 12 May 2026 at 07:13, 'Harry Yoo (Oracle)' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> On Mon, May 11, 2026 at 10:00:49PM +0200, Marco Elver wrote:
> > When using CONFIG_KMALLOC_PARTITION_RANDOM, _RET_IP_ was previously used
> > to identify the allocation site. _RET_IP_, however, evaluates to the
> > caller's parent's instruction pointer rather than the actual allocation
> > site; this would lead to collisions where a function performs multiple
> > allocations.
> >
> > With the generalization to kmalloc_token_t, we now generate the token at
> > the outermost macro, and using _THIS_IP_ would fix this for all cases.
> >
> > Unfortunately, the generic implementation of _THIS_IP_ relies on taking
> > the address of a local label, which is considered broken by both GCC [1]
> > and Clang [2] because label addresses are only expected to be used with
> > computed gotos. While the generic version more or less works today, it
> > is known to be brittle. For example, Clang -O2 always returns 1 when
> > this function is inlined:
> >
> >         static inline unsigned long get_ip(void)
> >         { return ({ __label__ __here; __here: (unsigned long)&&__here; }); }
> >
> > To provide a reliable unique identifier without breaking architectures
> > relying on the generic _THIS_IP_, introduce _CODE_LOCATION_: it resolves
> > to _THIS_IP_ where architectures provide a safe implementation, and
> > falls back to a zero-cost static marker where _THIS_IP_ is broken.
> >
> > Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120071 [1]
> > Link: https://github.com/llvm/llvm-project/issues/138272 [2]
> > Signed-off-by: Marco Elver <elver@google.com>
> > ---
>
> Looks good to me,
> Reviewed-by: Harry Yoo (Oracle) <harry@kernel.org>

Thanks!

> with one suggestion below.
>
> > ---
> >  include/linux/instruction_pointer.h | 24 ++++++++++++++++++++++++
> >  include/linux/slab.h                |  2 +-
> >  2 files changed, 25 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/instruction_pointer.h b/include/linux/instruction_pointer.h
> > index aa0b3ffea935..ea5bc756bd99 100644
> > --- a/include/linux/instruction_pointer.h
> > +++ b/include/linux/instruction_pointer.h
> > @@ -8,6 +8,30 @@
> >
> >  #ifndef _THIS_IP_
> >  #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
> > +/*
> > + * The current generic definition of _THIS_IP_ is considered broken by GCC [1]
> > + * and Clang [2]. In particular, the address of a label is only expected to be
> > + * used with a computed goto.
> > + *
> > + *   [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120071
> > + *   [2] https://github.com/llvm/llvm-project/issues/138272
> > + *
> > + * Mark it as broken, so that appropriate fallback options can be implemented
> > + * for architectures that do not define their own _THIS_IP_.
> > + */
> > +#define HAS_BROKEN_THIS_IP
> > +#endif
> > +
> > +/*
> > + * _CODE_LOCATION_ provides a unique identifier for the current code location.
> > + * When _THIS_IP_ is broken (generic version), we fall back to a static marker
> > + * which guarantees uniqueness and resolves to a constant address at link time,
> > + * avoiding runtime overhead and compiler optimizations breaking it.
> > + */
> > +#ifdef HAS_BROKEN_THIS_IP
> > +#define _CODE_LOCATION_ ({ static const char __here; (unsigned long)&__here; })
>
> nit: perhaps it can be __initdata to free these after boot?
> ... if we want to save actual memory allocated rather than the
> vmlinux size.
>
> apparently ".init.bss" is a not thing :(

Not sure - it might cause CONFIG_DEBUG_SECTION_MISMATCH warnings.
Also, if this memory is reclaimed, it may be reused for kernel
modules, at which point there's a chance for collisions.

