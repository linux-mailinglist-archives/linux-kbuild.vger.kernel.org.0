Return-Path: <linux-kbuild+bounces-9987-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 190ABCA3666
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Dec 2025 12:14:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E36DB3013389
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Dec 2025 11:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1AEC2E8B7E;
	Thu,  4 Dec 2025 11:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pSckmItV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0496525D53C;
	Thu,  4 Dec 2025 11:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764846694; cv=none; b=FByKUOoJY2XEfWFVMu7SRx6rEE0drIHq9YziuuW4Lh7+Hi3zReRtJlvg+ntk7su0eLJgQD4dejHJap141e1wg7JSJT5WAxVhMvmAeVWGX7ylEIkxSjgVsBWNKC4nJ7YVnoP9A49Gf88vY9jzJYXXufx+0wK9b+78FoahFaddb20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764846694; c=relaxed/simple;
	bh=M7ISeND9A9esXIHou6CidHnURL2O/nVrJW73NSANohw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOQdJ9K1epD4yRtWB/V584+nYmd4dyDWYZ3nOXK3dOCNVd+pre8YRLkLo/Gh/pYyn1e2ROPkDXgFME6Xi+v3AdC44BY6UYpKjeFpshlS2IqpENJOt6ybl/KGueJP9lO5aoeYerhis6+VDo9gKtLYNhneGqZLBK3dcK6Xv36SIUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pSckmItV; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Vs7IhsUdSawXMOrWf5f71JxGpFUjZulrktZ1Qm8Q2v8=; b=pSckmItVUmdbVyusV0O0TfiwUY
	WLEioelO4DKGDd2BeLrPn03kKXhorOAL18yBqgatV/WrvupIb+SeLl/jVYIf7YyVn9tdpumdAf3XO
	v1L3ZKwMUYsApXPAEl7saGJq0Uc6SoSCq8tXizZ/VE3MZ9qLaeWPqwe0q8bSeaXVgeDzjgqUBnIDF
	L+w02J8EK0BsOFt+Ja1MizLg+TbFRyqe+mliXx4e2jbDE/aAi5xpFI0lsf81zE0cBkQg7y4zrKh89
	MQCsixAsQO4lW6rgp10bnayICypIt2TtsY6rNnrhfvd0ppat9BBV1D7K62OI3cP6vRmwXWjnpf74h
	RtUugM5A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR7F7-000000045pY-0kUI;
	Thu, 04 Dec 2025 11:11:25 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5415B3004B8; Thu, 04 Dec 2025 12:11:24 +0100 (CET)
Date: Thu, 4 Dec 2025 12:11:24 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Josh Triplett <josh@joshtriplett.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
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
Subject: Re: [PATCH 4/4] build: rust: provide an option to inline C helpers
 into Rust
Message-ID: <20251204111124.GJ2528459@noisy.programming.kicks-ass.net>
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <20251202-inline-helpers-v1-4-879dae33a66a@google.com>
 <20251204100725.GF2528459@noisy.programming.kicks-ass.net>
 <aTFhFXCqvy7nmDOp@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTFhFXCqvy7nmDOp@google.com>

On Thu, Dec 04, 2025 at 10:23:17AM +0000, Alice Ryhl wrote:

> > The other day [*] I proposed extending Rust such that it would be able
> > to consume a clang precompiled header directly, this would allow doing
> > away with most of all this. No more helpers and no more bindgen.
> > 
> > Would that not be a much saner approach to all this?
> > 
> > [*] https://lkml.kernel.org/r/20251124163315.GL4068168@noisy.programming.kicks-ass.net
> 
> I have actually discussed similar ideas in the past with Josh Triplett,
> so you are not the only one who thinks it is a good idea. Unfortunately,
> the road to get there is long.

Right. Earlier I also proposed using libclang to parse the C header and
inject that. This might be a little simpler, in that..

> Another option to get rid of the helpers is that bindgen is working on a
> --wrap-static-fns flag, which would generate the helpers for us.
> However, that route would still require this patch for them to be
> inlined.
> 
> One detail that makes the precompiled clang header really tricky is
> that IMO we should not require RUSTC_CLANG_LLVM_COMPATIBLE for the
> build. With bindgen, you just need bindgen and clang to match LLVMs.
> That's easy since bindgen loads a dylib from your clang install. But if
> you build this logic into rustc, then you need to be really careful to
> get rustc and clang from the same source, and that same source must use
> the same LLVM to build both.

... if you build rustc against libclang they are necessarily from the
same LLVM build.

But that might be more tricky in that you might need ways to specify C
specific build flags.

Anyway, good to know people are in fact pondering this, because IMO the
whole interoperability thing with C is quite terrible.

