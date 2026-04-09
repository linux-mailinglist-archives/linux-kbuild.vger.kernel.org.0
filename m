Return-Path: <linux-kbuild+bounces-12737-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAO1KvwJ2GlOWggAu9opvQ
	(envelope-from <linux-kbuild+bounces-12737-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Apr 2026 22:20:12 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D1E3CF655
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Apr 2026 22:20:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 083663020EA5
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Apr 2026 20:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A21133260D;
	Thu,  9 Apr 2026 20:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SbYoHP38"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E51332EAC
	for <linux-kbuild@vger.kernel.org>; Thu,  9 Apr 2026 20:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765989; cv=pass; b=jbl4vHicqaRltBwoVNejG1guqLgqLoFZ2vN1jfRtXArSvyjoYemUKvneNzogw0Kr6yDzQeOaXax3/elQsyuyCC7jXjx3HzUjrhL6xwgu/eP2r8y69ISPSvSY1VDxKR+2KWz+jwJTiXSaPAKIxR8WAGsNbs05eNFZpYUpx50glv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765989; c=relaxed/simple;
	bh=RDN1p6W4IQhH95WIO0SfwAGjMDMJiLF3yAuqpAlJwVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zil9AXoW8ZXziuQQ8rUjYHTwdO3aN8e9VXBi8FhPnyOwVNcHj80tIHCQkMhlqiMfqdFJFWElTle/aQKC0cw/6KQojRzGYN7zIOAtUPGUQDJ2l7Hjv5q+fd/N7dVVRoXZgMqDrQL8FcWsYXPMpFW2eGsQnpI73ADdzgxCxdbZ88c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SbYoHP38; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1273349c56bso1791979c88.0
        for <linux-kbuild@vger.kernel.org>; Thu, 09 Apr 2026 13:19:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775765986; cv=none;
        d=google.com; s=arc-20240605;
        b=OSkqYatR02mmPw1mUWehz5A+Jv5Xu4yMnJA1Nq9VdjhckHSEMrtyM9KY7rWDjhCRUh
         NGmQ/7xGNcw85qTjtQniaNai71xDmioHFHp7GiF7Wp6w+dSZ3kreY+i05liXmGCfH6zl
         7Cv3t2jdfPg+uBKj1ttR20/wAouZf23zFrmc/U0dBMV/CCkayOaf6REgH5Wjx8cppwh8
         vWzw0JhjHMAeNgIqGlvLzkQU/Km7dZheD/0cW3zb+gSeedqnPfisMTegFXrRTyReaBM6
         3PFxk9KG/VEAQRk3xfQFcD0hU4z94WIRlwBD/9r4+l7+rgIDSxet7CThKtKDv/S5wlUr
         ODBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=G8yxp814R8LsOCbjv5Tx3ImzbZaJM5uPFtadcPgr4Gc=;
        fh=HhFwtjzLt1W/+fKYgcWn8wVHnINsP2ADLmfnjKVTlPA=;
        b=K7DllcUtaKHSc6facqfRRAEcA/gNao/l876KyEWFW9twXCBPsXK/NBDFMXO2D5948V
         ORFZrvsgwcdfaPLmKQCafYI5G1M/kIta8rLFPlVxvUjoijZVIoB++YmgSFhzKnUVuTkZ
         r05vfy434tC64qPIC1To1qep70F3IeuP1U2vFCvU3wJYGlVjAVPA99tL8IZD7HoQAFW6
         ax7TUsaIN1sH9JGwl+1vqejkL+ZyE1WlRBDTl74u3RmxTat0aiAvvFfgWMrP34pUX1jZ
         KhtI0gs7qkp3YzymCNJ6669Cfwm/itkcPJ8SY8OePTuvn5JG5a+YJnn4v8yerjPBeYUp
         ayvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775765986; x=1776370786; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G8yxp814R8LsOCbjv5Tx3ImzbZaJM5uPFtadcPgr4Gc=;
        b=SbYoHP38SaD2Pnl2GmuwycnO74rqVSMo+9Fh6GLNiGwlB145JtUVbPEmGqfD3DTi/w
         ZCmtV4u/I0PtEHZweUJOY0cUCfJRhBNmY/RN0sOonv7Zd6z9dlvc4AU2dbh7eEcD4P0d
         LmlIydZG0NOP6rUhk5uLYNwMuVbHkiZWltU1r/vSkSbSPfSg2y3X/eTFl1SpOj4eB8C7
         qkmF8Dles7T7oNhQZF4r6ZaRCsCvb4RGasHQtqlBZPyF//Zj3euBL2HYKaNSs2/nAgRJ
         PNgOS5svOBzdfSWPDk44inOG0XJUB9HRVTL9yJOVf+vf4oqhQBpDzL2EIPlEm47DQHh7
         0Yaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775765986; x=1776370786;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8yxp814R8LsOCbjv5Tx3ImzbZaJM5uPFtadcPgr4Gc=;
        b=Ve7jxur/2/IpbC3n3jXiDsC5aWM+GfJOLr8QYxIxvjecstHLVmbmoSzDFuCSAOQZcO
         kSzTCU1eZQTCycylZ0JkEA1RAJgFQb2EZyWCMvbK8w5pA8KSakq09KFuGEjKX/RrOjXD
         TRl294uYVxZzQZwULval0Or3bAm2NDCGrER1/3hCkKPDjSKXHUQXFu4tlh3z5DQwPmXG
         g8jBYslsI6NF3qBgyvB8AEfsW3Y4EChWjnYLrI5jJLRbqboSN+DeNeTq6DYZpUlqt62p
         ypwE8gtmot0YkGN65acL+bKKCVMTHWZDrX6NpFwzBirgq2jSPhZmnuQvmCuQD2Qde0+r
         bzdw==
X-Forwarded-Encrypted: i=1; AJvYcCVr/HGUJofHKMRfVn8GSjyZ8Zms+9le4SRq6IL794tvCGWo5Iu+X46eVmsmFmbf5BtTW48impRMatjOuMs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzShbDnbW+hb1uUtY57rIpBCRDzGIE5WhpRFX2gMYgnOj32QAkl
	9YPNzbbrj4KMAMiDOTlbUGErv8ufTuezK/JkfjsE9kn871/EQvDLJozU/QP0mkl1+y0XEjrZK7H
	VOtLnoToF1qf2TS+WiROS1i7M3jUpPFAOZT6yZWkS
X-Gm-Gg: AeBDieu7Hhj7aedsiVAwqa+eXNcz0RN0vtAK1ipIas2tsC0mVEz9Y1JW2bQnhvmZ9YP
	KKPGvicosUZKAaza/z1n/yde3a8A8BHIhTaQZQ3vKeBdMATLpAg3KCdXQEc83L1FFxltrgEXjxp
	Yx7Lvl8NKxrK4R1M3Iplz8Y5a/DGIc+BajK5j7WgRQtvkjZR3FOkanZeU46xaLpm2yLF4TFpRmn
	KdOqP89TYavVnhqrx8fuSQA/AXTAAsBOByPRIJhAdmLFWlAqsh4GE4DehG/55oRqC7uszwPlDkY
	PfV7ctVJfgg75QCn8CXExr/tVh2BBOXxye9thAF7p50q4weW
X-Received: by 2002:a05:7022:ff43:b0:128:d1c9:3633 with SMTP id
 a92af1059eb24-12c34ea93bamr326968c88.13.1775765985689; Thu, 09 Apr 2026
 13:19:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331111240.153913-1-elver@google.com> <ac9d5O5XehnXRc5A@hyeyoo>
 <d0fe363c-2e8f-44a4-9b64-3fa3ba9a5773@kernel.org> <adM2XVZf1DekahlY@hyeyoo>
 <CANpmjNMeaWWuDMAj_n38U9XRqgZQz30ca82Vy10Bg=NoDfZ5ng@mail.gmail.com> <adT-gkVmVDDXR1h_@hyeyoo>
In-Reply-To: <adT-gkVmVDDXR1h_@hyeyoo>
From: Marco Elver <elver@google.com>
Date: Thu, 9 Apr 2026 22:19:09 +0200
X-Gm-Features: AQROBzARAi5e7VBJC9ZT2jVCPDAMFQKWBBwNXJCnP3Ii1ddqjsxmVTwsC-HQUUI
Message-ID: <CANpmjNO1aNm3mKphDGWasK_NUfVY8q4K9GCjyREZFqrOu9WLcw@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12737-lists,linux-kbuild=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,googlegroups.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 63D1E3CF655
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 7 Apr 2026 at 14:54, 'Harry Yoo (Oracle)' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> On Tue, Apr 07, 2026 at 01:17:14PM +0200, Marco Elver wrote:
> > On Mon, 6 Apr 2026 at 06:28, 'Harry Yoo (Oracle)' via kasan-dev
> > <kasan-dev@googlegroups.com> wrote:
> > > On Fri, Apr 03, 2026 at 08:29:22PM +0200, Vlastimil Babka (SUSE) wrote:
> > > > On 4/3/26 08:27, Harry Yoo (Oracle) wrote:
> > > > >> diff --git a/include/linux/slab.h b/include/linux/slab.h
> > > > >> index 15a60b501b95..c0bf00ee6025 100644
> > > > >> --- a/include/linux/slab.h
> > > > >> +++ b/include/linux/slab.h
> > > > >> @@ -864,10 +877,10 @@ unsigned int kmem_cache_sheaf_size(struct slab_sheaf *sheaf);
> > > > >>   * with the exception of kunit tests
> > > > >>   */
> > > > >>
> > > > >> -void *__kmalloc_noprof(size_t size, gfp_t flags)
> > > > >> +void *__kmalloc_noprof(size_t size, gfp_t flags, kmalloc_token_t token)
> > > > >>                            __assume_kmalloc_alignment __alloc_size(1);
> > > > >>
> > > > >> -void *__kmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags, int node)
> > > > >> +void *__kmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags, int node, kmalloc_token_t token)
> > > > >>                            __assume_kmalloc_alignment __alloc_size(1);
> > > > >
> > > > > So the @token parameter is unused when CONFIG_PARTITION_KMALLOC_CACHES is
> > > > > disabled but still increases the kernel size by a few kilobytes...
> > > > > but yeah I'm not sure if we can get avoid it without hurting readability.
> > > > >
> > > > > Just saying. (does anybody care?)
> > > >
> > > > Well we did care enough with CONFIG_SLAB_BUCKETS to hide the unused param
> > > > using DECL_BUCKET_PARAMS(),
> > >
> > > Hmm yeah.
> > >
> > > I wasn't sure if we could do this without hurting readability,
> > > but perhaps we could...
> > >
> > > > so maybe extend that idea?
> > > > I think it's not just kernel size, but increased register pressure etc.
> >
> > I'll take a closer look at generated code.
>
> > In some cases the compiler ought to omit zero-sized arguments,
>
> Oh, didn't know that was a thing.

So I checked with Clang and GCC. Looks like Clang does omit the
zero-sized struct argument, i.e. generated code is identical to
before. Whereas GCC wastes a few bytes of stack space at callsites.

Which is sad, because that means we need the macro workaround.

Do you want to be credited with Co-authored-by - in which case I need
your Signed-off-by.

> Not sure if it's safe to do that for exported functions though (since
> modules can be built w/ a different compiler).

Kernel modules built with a different config (implicit if different
compiler) are not supported, and never have been. If it works, it's
just luck (I know people do this, but it's just a disaster waiting to
happen).

Thanks,
-- Marco

