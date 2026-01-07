Return-Path: <linux-kbuild+bounces-10434-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA61CFDB9F
	for <lists+linux-kbuild@lfdr.de>; Wed, 07 Jan 2026 13:45:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 00727300818F
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Jan 2026 12:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C04F3322B75;
	Wed,  7 Jan 2026 12:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bPHmS0my"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA703320A20;
	Wed,  7 Jan 2026 12:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767789343; cv=none; b=SspAORJfJujGITBJpPPEpRqdlw+dWMZ/a3wY9rtTEHRJl0a83HMMHOqEUkRMtV6sQ8z4OoMzJIQCRHLrXcw9umyLaHU4D778TN1lGd4AsC0SaNe506dFPECBGqNk1fTOSEbjv5F4R9krwo4VsOtA5S4E782XooYbJleR5v8iBE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767789343; c=relaxed/simple;
	bh=p/YWmssrwbeecBjO5ZcaZ3Uk7qz8/VaZYyMoOdf4igc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LAQAsguenf+Gpl9OPPGiGen67SjIjdsS85Og7zNHkOXXzOBPHz1Npaq9FQalnLDKKs6bDQIhmZm2wW8Tg2Fqf47hkXXROVImlcmz0h0dXzOuXeCyHvMq06nFX0IGBkogpeHQxKS+Ji0N8Kz2e9j4dNzhcKCD5FbjIiQz7Er2AY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=bPHmS0my; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BHE+uM9pFMpvKUfJm0PMn7/MMiQJxjBUC4G6rc0+7ag=; b=bPHmS0my5zMc0KSgtrhRkA+vTW
	z8Eu7Wmq0eIbQNU2yC3YNgs0VuCTEbqJENgYB5FVcWwB5xwARLzeYZH94XMypln1xuFyKtHAZOdRz
	U4DAYDjYtqvbV6j0Sec+25E7rEGo/SUgkLRmhxcbMCyZb7AjHJlcusIr4Tk92i0yg492BC81/Tesj
	AiTOKmQi0EGinvOrsYZFIEQncVw27tFLtGb7tp0dfjEkGXjAU6UBVFcLbi0Zl0Y6qIsUU8erEvD9x
	f6nDRT3WQSJ3x2tfxW7/ueyOM5M6w23aN2hHLiS+8REmD7MykBJLvthi0BeLLp1Z7md5pKs0S/pSe
	IG6ePcKQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdSl8-0000000BKHb-0vmp;
	Wed, 07 Jan 2026 12:35:30 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1B43E30057E; Wed, 07 Jan 2026 13:35:29 +0100 (CET)
Date: Wed, 7 Jan 2026 13:35:28 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	nouveau@lists.freedesktop.org, Matthew Maurer <mmaurer@google.com>
Subject: Re: [PATCH 0/4] Inline helpers into Rust without full LTO
Message-ID: <20260107123528.GF2393663@noisy.programming.kicks-ass.net>
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <87y0m9har9.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y0m9har9.fsf@t14s.mail-host-address-is-not-set>

On Wed, Jan 07, 2026 at 01:23:38PM +0100, Andreas Hindborg wrote:
> Hi Alice,
> 
> Alice Ryhl <aliceryhl@google.com> writes:
> 
> > Currently the only way for Rust code to call a static inline function is
> > to go through a helper in rust/helpers/. This introduces performance
> > costs due to additional function calls and also clutters backtraces and
> > flame graphs with helper symbols.
> >
> > To get rid of these helper symbols, provide functionality to inline
> > helpers into Rust using llvm-link. This option complements full LTO, by
> > being much cheaper and avoiding incompatibility with BTF.
> >
> > I ran a microbenchmark showing the benefit of this. All the benchmark
> > does is call refcount_inc() in a loop. This was chosen since refcounting
> > is quite hot in Binder. The results are that Rust spends 6.35 ns per
> > call vs 5.73 ns per call in C. When enabling this option, the two
> > languages become equally fast, and disassembly confirms the exact same
> > machine code is used (in particular there is no call to
> > rust_helper_refcount_inc). Benchmarking Binder also results in an
> > improvement from this change.
> >
> > This patch is complementary to:
> > https://lore.kernel.org/all/20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com/
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> 
> I get the following modpost errors when building with this applied on top
> of v6.19-rc4:
> 
> ERROR: modpost: "__SCK__WARN_trap" [drivers/gpu/drm/nova/nova.ko] undefined!
> ERROR: modpost: "__SCK__WARN_trap" [drivers/gpu/nova-core/nova_core.ko] undefined!
> ERROR: modpost: "__SCK__WARN_trap" [drivers/block/rnull/rnull_mod.ko] undefined!
> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_minimal.ko] undefined!
> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_misc_device.ko] undefined!
> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_print.ko] undefined!
> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_dma.ko] undefined!
> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_driver_pci.ko] undefined!
> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_driver_platform.ko] undefined!
> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_driver_faux.ko] undefined!

Looks like it used the wrong static_call_mod() version, was MODULE
defined?

