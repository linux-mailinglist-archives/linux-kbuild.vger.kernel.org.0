Return-Path: <linux-kbuild+bounces-3174-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5D595CDAB
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Aug 2024 15:21:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FC091C214E2
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Aug 2024 13:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4928F186607;
	Fri, 23 Aug 2024 13:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p+U/ybQ3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0BC18562A;
	Fri, 23 Aug 2024 13:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724419303; cv=none; b=fLgSRmF92QtnQxSKKgJyElq0iA2OA112ee5SJjyDMuhsiJF1g0ErawUs3T/xDLfHmXHXIjpirLDcwWW4Lq1QJ5QV46KTSJHap1kU8C5X8XrmbLXi+avswHvGuiLtHKx0/IgPxHByY0Fe0rX4rWOwXsl5FHHfT9eE5PQ6XrMvTco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724419303; c=relaxed/simple;
	bh=raWe8OEdcYkXh26uvYEiz8FdGz1HJ2MMltZJKs0Gaww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NhHb8Rq8uD1yo4JIbZDhGaCYzrNx7yeeDO7J5T+qYocxzs9ii0nPCXvUivZIKchi07Cr4VvhixTqySDxvCxW9EtkjPLuJRcKijvIy5Mcntlsaebjz9dDe93WQv9z5KutpMlnTlvXmqID28xwzY3SlxoZB4X7dGx5rXtlQSGDvLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p+U/ybQ3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAD3AC4AF09;
	Fri, 23 Aug 2024 13:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724419302;
	bh=raWe8OEdcYkXh26uvYEiz8FdGz1HJ2MMltZJKs0Gaww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p+U/ybQ3ztl5F8my+cKpaMq9Y+qRNgf/cLka6IAj2rJJSIayX/8tep7azsrb8Sje3
	 /ztHADGvfdGrGTh2eVgIyhuJK+7yY3tN6dJNseP4NWoap3xWdmOjLmVYPWH8Sir387
	 c9Pi2NskdVfWihBAta/4gODNKf19bA29PdYmrfYGLc/SUmg95XzzK0HZb+r//MPskh
	 h8c/3Ft3qDK5j6AJZxyTDji9Yv3FYaIhrbVDYQxZhPgP3zXYC2TWWO3SSaCDZbQmEp
	 tkYiQBN1gyhai6h9M6AA3HyP2Bl5yLbKJ0BG7KWVxXFQ1qBa9sLnaqKTuZPa6WM5hc
	 urpLD4esjJgDw==
Date: Fri, 23 Aug 2024 14:21:34 +0100
From: Will Deacon <will@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Valentin Obst <kernel@valentinobst.de>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v5] rust: support for shadow call stack sanitizer
Message-ID: <20240823132133.GC32156@willie-the-truck>
References: <20240806-shadow-call-stack-v5-1-26dccb829154@google.com>
 <20240820143503.GD28338@willie-the-truck>
 <CAH5fLggN+A2RawC-cpmSUHxYm=xz=1EDpMUv5C803hj37re1qA@mail.gmail.com>
 <20240823122423.GB32110@willie-the-truck>
 <CAH5fLgh6ywHeFSwbnaOu-QYrt_Jytv_y3zb1QbJzK-w4kQ617w@mail.gmail.com>
 <20240823125739.GA32156@willie-the-truck>
 <CAH5fLgiCr3hOEX1yaqy66OMsbPTtEhA4FCmRiw20zY64vYKHPw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgiCr3hOEX1yaqy66OMsbPTtEhA4FCmRiw20zY64vYKHPw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Aug 23, 2024 at 03:09:40PM +0200, Alice Ryhl wrote:
> On Fri, Aug 23, 2024 at 2:57 PM Will Deacon <will@kernel.org> wrote:
> >
> > On Fri, Aug 23, 2024 at 02:38:20PM +0200, Alice Ryhl wrote:
> > > On Fri, Aug 23, 2024 at 2:24 PM Will Deacon <will@kernel.org> wrote:
> > > >
> > > > On Tue, Aug 20, 2024 at 05:13:58PM +0200, Alice Ryhl wrote:
> > > > > On Tue, Aug 20, 2024 at 4:35 PM Will Deacon <will@kernel.org> wrote:
> > > > > > On Tue, Aug 06, 2024 at 10:01:44AM +0000, Alice Ryhl wrote:
> > > > > > > diff --git a/init/Kconfig b/init/Kconfig
> > > > > > > index fe76c5d0a72e..d857f6f90885 100644
> > > > > > > --- a/init/Kconfig
> > > > > > > +++ b/init/Kconfig
> > > > > > > @@ -1909,7 +1909,7 @@ config RUST
> > > > > > >       depends on !MODVERSIONS
> > > > > > >       depends on !GCC_PLUGINS
> > > > > > >       depends on !RANDSTRUCT
> > > > > > > -     depends on !SHADOW_CALL_STACK
> > > > > > > +     depends on !SHADOW_CALL_STACK || RUSTC_VERSION >= 108000 && UNWIND_PATCH_PAC_INTO_SCS
> > > > > >
> > > > > > Sorry, I didn't spot this in v4, but since UNWIND_PATCH_PAC_INTO_SCS is
> > > > > > specific to arm64 and the only other architecture selecting
> > > > > > ARCH_SUPPORTS_SHADOW_CALL_STACK is riscv, I can't help but feel it would
> > > > > > be cleaner to move this logic into the arch code selecting HAVE_RUST.
> > > > > >
> > > > > > That is, it's up to the architecture to make sure that it has whatever
> > > > > > it needs for SCS to work with Rust if it claims to support Rust.
> > > > > >
> > > > > > What do you think?
> > > > >
> > > > > The `select RUST if ...` is going to get really complicated if we
> > > > > apply that rule in general. Having options here allows us to split
> > > > > them across several `depends on` clauses. I'm not sure it will even
> > > > > work, I had issues with cyclic Kconfig errors previously. I also don't
> > > > > think it's unreasonable for the architecture to say it supports both
> > > > > options when it really does support both; they are just mutually
> > > > > exclusive. I also think there is value in having all of the options
> > > > > that Rust doesn't work with in one place.
> > > >
> > > > I'm not sure I follow why this will get really complicated. Isn't it as
> > > > straightforward as the diff below, or did I miss something?
> > >
> > > Hmm. I tried this but I wasn't able to enable Rust with this setup.
> > > Even though the deps of RUSTC_SUPPORTS_ARM64 are ok, it doesn't seem
> > > to be enabled and I can't find it in menuconfig. I think we need to
> > > have a `select RUSTC_SUPPORTS_ARM64` somewhere.
> >
> > Sorry, yes, my diff was a little half-arsed:
> >
> > > > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > > > index a2f8ff354ca6..2f5702cb9dac 100644
> > > > --- a/arch/arm64/Kconfig
> > > > +++ b/arch/arm64/Kconfig
> > > > @@ -231,7 +231,7 @@ config ARM64
> > > >         select HAVE_FUNCTION_ARG_ACCESS_API
> > > >         select MMU_GATHER_RCU_TABLE_FREE
> > > >         select HAVE_RSEQ
> > > > -       select HAVE_RUST if CPU_LITTLE_ENDIAN
> > > > +       select HAVE_RUST if RUSTC_SUPPORTS_ARM64
> > > >         select HAVE_STACKPROTECTOR
> > > >         select HAVE_SYSCALL_TRACEPOINTS
> > > >         select HAVE_KPROBES
> > > > @@ -265,6 +265,11 @@ config ARM64
> > > >         help
> > > >           ARM 64-bit (AArch64) Linux support.
> > > >
> > > > +config RUSTC_SUPPORTS_ARM64
> > > > +       bool
> >
> > This line ^^^ should be 'def_bool y'.
> 
> Ah, I see, I guess I learned something today. It also seems to work if
> I add `default y`.
> 
> I can change it if you think this is better. I still think there's
> some value in having everything in one place, but it's not a big deal.
> Either way, it should be temporary for a few kernel releases as we'll
> eventually only support compiler versions where this works.

I do like moving the reference to UNWIND_PATCH_PAC_INTO_SCS into the
arch code, so if you could respin along these lines then that would be
great.

Thanks,

Will

