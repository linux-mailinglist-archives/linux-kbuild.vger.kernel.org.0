Return-Path: <linux-kbuild+bounces-2649-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0527293BE10
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2024 10:38:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DF09284211
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2024 08:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F2C17838C;
	Thu, 25 Jul 2024 08:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IvlXZcdI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C0F17B4F0;
	Thu, 25 Jul 2024 08:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721896726; cv=none; b=aADri/fOOPZENqjR1Y5TUSUh9Dr4BSXr5MmxZQK3s/ou6gdu4iB8bTS9h9rn9j1XCTA4QHa5fxUiZlRe0rNzQWHtZPolEMO32dVoJOB0uC84U3JirlXPREKEYu3bDuGH8jzFNJ0ddzZdVA/3ATtd2/kyGjI9S8mFS+jNlo3oZOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721896726; c=relaxed/simple;
	bh=8Ql2WPYqGw2woru+l+DcqmpSpJJNcsxNbO3T5q147a0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l45A+/JJ2cfh7/l+l4qhUZ+WKEC3OLrQpjGfTIhdgquXHfvc793rcbQp84UfsIBqxqTBZTMWHMILTtrVLVAmfglRGglO01pVvHJqO65Ov7LhRaut27rLLXVSkH3xkpsXJIqtcP2YbJNt8l40gGZmvTNu95lKGIek91+6Hi6HteE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=IvlXZcdI; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fIEVY7vhZ9EuI1OjKEcT09yuWOGpEQU1LkOBZg6HYK4=; b=IvlXZcdIO1J4iXGRRQgHRrUvTs
	fAAyKCgtyO6LQ8wnWL2N65BZWlL7MfsRvHMfea29YIcFvduK9sTR3ey3EWyySgFXOusECMXUfj63M
	c/DNal9+37UveJt57m3wSSZ5M9wYlTULlfyh1KLeya/b+doupfxGQ/3+FHms4R/NpSiHWGryHs/fR
	5TuyycUO3dL1V4YYU8xaNl3zR1IJWU8BRHKBEcz9l8PqRYtuhu2s6+o+C02Qec5ty4dSXj22Q94GU
	1U+I0BV9NZXvhKiSoPuvnR7sB1PO2cWzTAAmLdX1WD0iPwhfbP7y+gtxJf4O4hfQl1EcJYZwckWt0
	CICWLCvA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWtzg-00000003yJu-32zY;
	Thu, 25 Jul 2024 08:38:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 544FC300310; Thu, 25 Jul 2024 10:38:36 +0200 (CEST)
Date: Thu, 25 Jul 2024 10:38:36 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Rust: support `CPU_MITIGATIONS` and enable
 `objtool`
Message-ID: <20240725083836.GE13387@noisy.programming.kicks-ass.net>
References: <20240724161501.1319115-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240724161501.1319115-1-ojeda@kernel.org>

On Wed, Jul 24, 2024 at 06:14:53PM +0200, Miguel Ojeda wrote:
> Hi,
> 
> This is an updated series to the CPU mitigations support for Rust. It
> also has the patch to enable `objtool`, so that we can start running it
> for Rust.
> 
> It would be nice to get this applied soon, so that we start being
> warning-free (since we already get warnings under IBT builds via
> `vmlinux.o`). I am happy to take it through the Rust tree if the x86 and
> objtool maintainers give an Acked-by, or through any of the other trees,
> as you prefer. Otherwise, I think at this point we would need to make
> Rust exclusive to the mitigations, which isn't great.
> 
> With this series, again, x86_64 is warning-free with `objtool` enabled. I
> tested `-O2`/`-Os` and the Rust versions we support under `-O2` (mainly
> for the `noreturn` patch, which uses heuristics), as well as IBT vs. no
> IBT (i.e.  running on individual object files vs. in `vmlinux`). I also
> did an arm64 build.

W00t :-)

Aside from a small niggle about maybe doing a helper function for those
Rust runtime things, I don't see anything objectionable here.

Thanks!

