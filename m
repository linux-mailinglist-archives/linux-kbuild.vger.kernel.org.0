Return-Path: <linux-kbuild+bounces-9984-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 76367CA3136
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Dec 2025 10:48:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E5D93049D3A
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Dec 2025 09:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 839212BE62D;
	Thu,  4 Dec 2025 09:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dit5ZXxb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2B6331226
	for <linux-kbuild@vger.kernel.org>; Thu,  4 Dec 2025 09:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764841567; cv=none; b=Nft0npUY5kNz/wApLHLzGUejlAokwjp/cFNOYs95MglOXjFSvl1CSp8HwAzwabok1589a7Cp6Da4Ou9dMZ72AEFu7VdnZUBqhA0AuyBjJjl4T3LHVNX2bTpNpo1Ra6B4+/MquTTiLmpkYXtqkmFoAFSevA3pY0fS0gLnjAMjHdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764841567; c=relaxed/simple;
	bh=EzgpGjg1QwWDfYIOOESLFG/yLw37B0pgIc7/2w/E3vA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YeX9y2QExde7aS0pPHmeLXgpK1mzF/v4x6EuJJiqeuAJcxqZXQLxR3Pvee+bsDo+ERUucIcsdRc4CddGpY5zFMM+i6PWwAJHRsxAqCP85zBasDK/wH64OY5mdHcfqiQpH2+fp0/GD1DTYdx0YEqMEJNCTqmDidEbAZdgVOu4JEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dit5ZXxb; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-6408222225eso729054a12.3
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Dec 2025 01:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764841564; x=1765446364; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Y+LEByl2j3nWQKuuz9R99dq4dapViIO+66bH6orc1c=;
        b=dit5ZXxbz5w0YkpsHITRZEssjnXeUZvv6VpjX5s9AMdPLOhvrMSimGt76WUlCDM7Ta
         NN8nTbr3n2Nf95XDArtK/A/ry8vKcYEpgN9nzimn4wg3yrzDouV77/IWG/Zr6D4RfdjR
         t9aJwi4/xlI2g+AvYjZrlmkEI9HVkYU6r+zvHm8QKCvoMClHTjdVaoZ+F/GJxLYXIIzb
         7Y7aTw1qNgd+Y4izoTaMLbUNTJvmyDc6EaMb+wo/69cwKW4Y0Qg//nwSwaev9b/CPwdR
         roG7C3uSHVt8rGUnj74TvCQQQHWpTcODLoBMsZL4aZCjuE3w1S7T9Yv+gCy3z0NLhp/F
         Eh7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764841564; x=1765446364;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Y+LEByl2j3nWQKuuz9R99dq4dapViIO+66bH6orc1c=;
        b=fXBB+i649UvSjmPLZjHdvQOOB+ZBp078OexJBWNwJuGnjl9+l4A30WDwluK+0REQBt
         QXs8e+Bs3JlQquKdBJLpsMqceqDmbTr94kvP73xvtD2CSccOgfMYMP3L5aVljk9ObH5c
         uxroPRF+JskkVPmzecg9aM10hXnDA71WodfcCzcFlqq/gewUROBb2Axsq5K4mV3szQJh
         dvzCGpBsp8iMT8ir95EBpnk7PARzN0aIJQvCJ84xqlalsPmzPRhcV6duZ43BXbMXORQB
         Kv9S25GP8SSDSdzfkw6WmZi7ZGBajaM7AUZQoIlHuyNTe6yMG9nmIfwCuAOxhk9cxVui
         PnMA==
X-Forwarded-Encrypted: i=1; AJvYcCWyrNuiV9ggyK3AP72QNkgb+TI8+5tk7kOIA/p7GuFOJsluc58heO9803r2ZffwJRty+/Zz7uYOBv+rRGs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRPyRnAFY/n1CvQGDqDmJeCTdR5/ZOABeK7Rw8yDrVBMKZktvB
	QJt6HVPSk+nDX/0J/vuIZm9AM7yd8sISPxj7fThBnCvNkhIx0lINlMIrvbJ0uskkaUZqXgAkHgb
	ttJe2jyt3HXAQdfIawg==
X-Google-Smtp-Source: AGHT+IH+B9WzKRmSWzOuHrGLt1JUxDjhE9BQol+oE79eSw4Io68p4o5P8fUOkglayWG/HVrXi6i/Vno1TKnYch4=
X-Received: from edbig1.prod.google.com ([2002:a05:6402:4581:b0:62f:24aa:896a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:1e94:b0:640:c640:98c5 with SMTP id 4fb4d7f45d1cf-6479c4c441bmr5333397a12.34.1764841564163;
 Thu, 04 Dec 2025 01:46:04 -0800 (PST)
Date: Thu, 4 Dec 2025 09:46:03 +0000
In-Reply-To: <20251203212558.GB3060476@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <20251202-inline-helpers-v1-4-879dae33a66a@google.com> <20251203212558.GB3060476@ax162>
Message-ID: <aTFYWyUE-ln5KrsX@google.com>
Subject: Re: [PATCH 4/4] build: rust: provide an option to inline C helpers
 into Rust
From: Alice Ryhl <aliceryhl@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki <urezki@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	nouveau@lists.freedesktop.org, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

On Wed, Dec 03, 2025 at 02:25:58PM -0700, Nathan Chancellor wrote:
> Hi Alice,
> 
> On Tue, Dec 02, 2025 at 08:27:59PM +0000, Alice Ryhl wrote:
> ...
> > diff --git a/Makefile b/Makefile
> > index 96ddbaae7e12de71bcfabef4639de3a13a6e4815..5834bfd568548d1bee34b328dccce5d60f85526f 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -517,6 +517,8 @@ OBJCOPY		= $(LLVM_PREFIX)llvm-objcopy$(LLVM_SUFFIX)
> >  OBJDUMP		= $(LLVM_PREFIX)llvm-objdump$(LLVM_SUFFIX)
> >  READELF		= $(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX)
> >  STRIP		= $(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX)
> > +LLVM_LINK	= $(LLVM_PREFIX)llvm-link$(LLVM_SUFFIX)
> > +LLVM_AS		= $(LLVM_PREFIX)llvm-as$(LLVM_SUFFIX)
> 
> Please keep the binutils alphabetized (i.e, put LLVM_LINK between AR and
> NM).
> 
> Other than that, this seems fine from a Kbuild perspective (but I did
> not look too hard).

Sure will reorder.

> >  else
> >  CC		= $(CROSS_COMPILE)gcc
> >  LD		= $(CROSS_COMPILE)ld
> > @@ -625,7 +627,7 @@ export RUSTC_BOOTSTRAP := 1
> >  export CLIPPY_CONF_DIR := $(srctree)
> >  
> >  export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC HOSTPKG_CONFIG
> > -export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDGEN
> > +export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDGEN LLVM_LINK LLVM_AS
> >  export HOSTRUSTC KBUILD_HOSTRUSTFLAGS
> >  export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
> >  export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index 3034e294d50df55c4003c5fa5df442f59e711bd8..e63c5eb57b049aff988419ccd12dfd99d59f5080 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -3427,6 +3427,21 @@ config RUST_KERNEL_DOCTESTS
> >  
> >  	  If unsure, say N.
> >  
> > +config RUST_INLINE_HELPERS
> > +    bool "Inline C helpers into Rust crates (EXPERIMENTAL)"
> > +    depends on RUST && RUSTC_CLANG_LLVM_COMPATIBLE
> > +    depends on EXPERT
> > +    help
> > +        Links C helpers into Rust crates through LLVM IR.
> > +
> > +        If this option is enabled, instead of generating object files directly,
> > +        rustc is asked to produce LLVM IR, which is then linked together with
> > +        the LLVM IR of C helpers, before object file is generated.
> > +
> > +        This requires a matching LLVM version for Clang and rustc.
> > +
> > +        If unsure, say N.
> > +
> 
> I am just curious, why would someone want (or not) to do this? This help
> text does not really indicate the point of the option, just what it
> does. Is it just the standard tradeoffs with inlining (potential
> improvements in performance due to better optimization opportunities
> versus text size increase and icache pressure) or something else?

Basically you probably want this on if you can enable it, but
RUSTC_CLANG_LLVM_COMPATIBLE is actually a pretty harsh requirement. If
you just install rustc and clang, it's likely they wont be sufficiently
compatible for LTO to take place.

I'll expand on this in the help text.

Alice

