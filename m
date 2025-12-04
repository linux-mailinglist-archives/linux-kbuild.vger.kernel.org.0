Return-Path: <linux-kbuild+bounces-9990-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C8ECA3A21
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Dec 2025 13:39:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3A589300E3F2
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Dec 2025 12:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99E233FE08;
	Thu,  4 Dec 2025 12:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GplumZ8R"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B81333F39C;
	Thu,  4 Dec 2025 12:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764851961; cv=none; b=md7igJmD9QdF4skX3yBVohWArVNtQJBnXGpi8ArVwm7yI5t0iPdJ7SE2Mocps21IpfvXyyLH3fGA17qlxxmZgFnRd/4EZpA0xWzs1s1o5/ppsKONkkmMKFusFn5/kOBkoco4E0mkOaWG/E3CfYTSiRyFinPycBQHQHk6CPR7W7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764851961; c=relaxed/simple;
	bh=T/Z/KiPxQewZXZY5z0blh9avwE3+TBceinDrbSRFXIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mgIUPeww6KgftV3chkZP5s/BBiP1cs9E/e9Tk9LEeFRzy+87OUDL3Koy3oNTZVnyuMPHeVV0+OhGWJ+uRNxhfg2+eebpQdHabo5W1vK0sH7ey0zTGk83r8A8j5Uji+UzzCZafKmWrjrvx0fYI36vVdRuwJLuexYaRdczKhvUhzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GplumZ8R; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=89lu85i9iy0uktaUJpKiLn2xYKgVihXHfm6nPHuJVes=; b=GplumZ8RG+7r6/RPRCpIzWalST
	NTK1VlmdgSv0o+Os8U5TzCte9QhrImE8ky577kp1+pdEzf2iGrChGjDqxoyy/0vpTHDXW6R358Y9v
	4s9he+SA95cAcvXPvfP0YBsWkdxh0OLAIa4ikICD1C0FM1/6YmeS3FnRMnDkvQ903kDIFoZLEjGcp
	critL25nfa75jdtZxsYk6dpxMjznn1ANNnAC9Ogdkx8FUpBItwRRjQD0bFgXGIIjXqqlNXTcUgBjk
	Ky9P+0Q88jUy3RAcc358iN4ZHT3zQHEAuAbNqWod1N2S9oE+SwhJGOJtsxAOvpKdBk3IC30t+MUo2
	ndsqrLVA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR8bz-00000004BHZ-3Shg;
	Thu, 04 Dec 2025 12:39:08 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C5A3D3004F8; Thu, 04 Dec 2025 13:39:06 +0100 (CET)
Date: Thu, 4 Dec 2025 13:39:06 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Antoni Boucher <bouanto@zoho.com>,
	Emilio Cobos =?iso-8859-1?Q?=C1lvarez?= <emilio@crisal.io>,
	Arthur Cohen <arthur.cohen@embecosm.com>,
	Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
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
Message-ID: <20251204123906.GL2528459@noisy.programming.kicks-ass.net>
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <20251202-inline-helpers-v1-4-879dae33a66a@google.com>
 <20251204100725.GF2528459@noisy.programming.kicks-ass.net>
 <aTFhFXCqvy7nmDOp@google.com>
 <20251204111124.GJ2528459@noisy.programming.kicks-ass.net>
 <CANiq72=r+Fmu0uuNF=6x36GWWQZGZk9gApnMZxakJavviwG+ug@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=r+Fmu0uuNF=6x36GWWQZGZk9gApnMZxakJavviwG+ug@mail.gmail.com>

On Thu, Dec 04, 2025 at 12:57:31PM +0100, Miguel Ojeda wrote:
> On Thu, Dec 4, 2025 at 12:11 PM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > Right. Earlier I also proposed using libclang to parse the C header and
> > inject that. This might be a little simpler, in that..
> 
> Yeah, that would be closer to the `bindgen` route in that `libclang`
> gets already involved.
> 
> > ... if you build rustc against libclang they are necessarily from the
> > same LLVM build.
> 
> So currently there are 3 "LLVMs" that get involved:
> 
>   - The one Clang uses (in LLVM=1 builds).

Well, being on Debian, I'm more likely to be using LLVM=-22 (or whatever
actual version is required, 22 just being the latest shipped by Debian
at this point in time).

>   - The one `rustc` uses (the LLVM backend).
>   - The one `bindgen` uses (via libclang).

These are not necessarily the same? That is, is not bindgen part of the
rustc project and so would be built against the same LLVM?

> If that is all done within `rustc` (so no `bindgen`), then there may
> still be `rustc` vs. Clang mismatches, which are harder to resolve in
> the Rust side at least (it is easier to pick another Clang version to
> match).
> 
> For those using builds from distros, that shouldn't be a problem.
> Others using external `rustc` builds, e.g. from `rustup` (e.g. for
> testing different Rust versions) it would be harder.

Make rust part of LLVM and get them all built and distributed
together... such that LLVM=-23 will get me a coherent set of tools.

/me runs like crazeh ;-)

> There is also the question about GCC. A deeper integration into
> `rustc` would ideally need to have a way (perhaps depending on the
> backend picked?) to support GCC builds properly (to read the header
> and flags as expected, as you mention).

Right, so the backend that spits out C could obviously just pass through
any C headers. But otherwise, inlining C headers (and inline functions)
would be something that is independent of the C files. At the end of the
day all that really matters is the architecture C ABI.

That is, if rustc inlines a C function from a header, it doesn't matter
it used libclang to do so, even if the C files are then compiled with
GCC.

> And finally there is the question of what GCC Rust would do in such a
> case. Things have substantially changed on the GCC Rust in the last
> years, and they are now closer to build the kernel, thus I think their
> side of things is getting important to consider too.
> 
> Cc'ing Emilio (`bindgen`), Antoni (GCC backend) and Arthur (GCC Rust)
> so that they are in the loop -- context at:

Right, so clearly GCC has the capability to parse C headers :-) So I
would imagine their Rust front-end would be able to hand off C headers
and get back IR much like LLVM based projects can using libclang.



