Return-Path: <linux-kbuild+bounces-2751-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B909416BD
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 18:03:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55F191F22B13
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 16:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD09187FF9;
	Tue, 30 Jul 2024 16:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="iu3FEMSS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4893D188000;
	Tue, 30 Jul 2024 16:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722355410; cv=none; b=acDK1cg+g+vjIiLZu5VKojsYwNEFmECGhzsA2t42MGY3XgcB0CFmJmG9SjpgkT7t+R43lWdx0vhoHZRnmJYDrmDZTSJhiIc+FMI5iw7Jr8T6T92CS2MECxBh5+DrAQsCHfqvBrHm5RBpx1F0nVXEZZ6wiJuSvcuBfl/1UmQzVAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722355410; c=relaxed/simple;
	bh=uZoFF8Ov6/EBQDDdLguut3LJNAwS/6G5gVgfa4iA+wE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HJz9DN4LUxtIdIS9zRGbrtp207jAyfMTv/6Y5/534grR9eOSzwwHoQ8AdGfjRSbd5UVXJOc5DjHcTsGDjPachivHGzhbzYQn4aRU3fdOBRt4klqbF8qdWebVo1UdmB0fIaT5lgVkKjXFuHI7VFlOHndrUhQUyH8hlUmnwNMvmbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=iu3FEMSS; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0zpf2bL87ay4+ySAHsgB+7KzaVacNp04EBJi3/RRapo=; b=iu3FEMSSXfUN+byB63191+HYj1
	+0dV1haacraidFulGRh1yU2AiAaO5iPyFy5uTtGtueBcgpSBcRtcldfxk7+qcIkswzLbylUOM7+Wl
	DXWJDXO1QQ9wV6JOXM8de7QEzvqtKU0ClA7sxQ4xuIaA9gnGNjozjTDpFX2jXkBV+Y/ghDk3FaUGj
	xpROcto3Gy7DISkp1Uy6zdRWNAMql7puQ3VIRC6PbAehdecTQb6l/heSO6SjHrecvbO4tk9ozC0WX
	WhquCm5nYLIx4mp9g772yRCi2F6L7RurikdSUCg3tAlBPGl9MClXh+M/8YJzTa+V32/FNAdy8jsvn
	nstf1SgQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYpJj-000000052IX-2hnv;
	Tue, 30 Jul 2024 16:03:16 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 786613003EA; Tue, 30 Jul 2024 18:03:14 +0200 (CEST)
Date: Tue, 30 Jul 2024 18:03:14 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>,
	Kees Cook <kees@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Matthew Maurer <mmaurer@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/2] rust: cfi: add support for CFI_CLANG with Rust
Message-ID: <20240730160314.GP33588@noisy.programming.kicks-ass.net>
References: <20240730-kcfi-v1-0-bbb948752a30@google.com>
 <20240730-kcfi-v1-2-bbb948752a30@google.com>
 <20240730103236.GK33588@noisy.programming.kicks-ass.net>
 <CABCJKuf+=bxrZphtFZ+N_t2whCS0gx2GVHybTzcNmY6TX6c7cw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABCJKuf+=bxrZphtFZ+N_t2whCS0gx2GVHybTzcNmY6TX6c7cw@mail.gmail.com>

On Tue, Jul 30, 2024 at 08:24:15AM -0700, Sami Tolvanen wrote:
> On Tue, Jul 30, 2024 at 3:32 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Tue, Jul 30, 2024 at 09:40:12AM +0000, Alice Ryhl wrote:
> > > From: Matthew Maurer <mmaurer@google.com>
> > >
> > > Make it possible to use the Control Flow Integrity (CFI) sanitizer when
> > > Rust is enabled. Enabling CFI with Rust requires that CFI is configured
> > > to normalize integer types so that all integer types of the same size
> > > and signedness are compatible under CFI.
> >
> > I am assuming -- because I have to, because you're not actually saying
> > anyting -- that this is fully compatible with the C version and all the
> > fun and games we play with rewriting the function prologue for FineIBT
> > and the like also work?
> 
> Rust uses the same LLVM backend for the actual code generation, so it
> should be fully compatible.

Yes, but we also combine that with -fpatchable-function-entry= for a
very specific effect, and I don't think I see the Rust thingy do that.

