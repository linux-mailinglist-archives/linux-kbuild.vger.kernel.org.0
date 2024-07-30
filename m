Return-Path: <linux-kbuild+bounces-2748-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3696794119E
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 14:13:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4666283BCE
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 12:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB9B19DFAC;
	Tue, 30 Jul 2024 12:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jCS60ClH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC22386AEE;
	Tue, 30 Jul 2024 12:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722341628; cv=none; b=SYi2D/Q98why6ddWUAv3P2mQPNdSc2UfoE1FU0lROaP+TeIooz+1gfqqWpA/8e5A4I9sLYU4P7uTwvUlaLjI4AOgs5kgRDuTy4r2/jAHH2c4f/rsmk7Qvc202RFkWRyAIcsA8bw4btWxHo6c4KqcQoasYbzYwyw56R4x3Ou5CXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722341628; c=relaxed/simple;
	bh=DGtauJHCr0FZld4Ft5Qk/tU7dgtHaE+AsK0ORYRV2oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tLyXIWSJOR9ICxhBH0zhIKIDuPoI+bwUZbiy5yjK7yaFwcyIm4/tTyNEU39zP3MId3Oyl1PQJ4UJjHOUaYopp63rsJ9swJ/UOwlEe2h6crpjZ2GdHN4ylWcyRSkm+X5kMWQFtelAo7KGnUbUQDe7Pn3a9+7+kXywe1mTXBf1Kyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jCS60ClH; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UXeY05NSq152fyD8Tat83B75Y3dwXggOdGcXPcJNsJk=; b=jCS60ClHbhABG+HN4d++Hwfxor
	b7aUF1hYwl0LcXDpNa+ChaXU+ri659VAXu2KfY+ikXnpJfpdf1pZ5lm/GuniD1liOngs6wGOH2C34
	IeMRaFxd7LixnvBsLb02b2K8BVzo1ulrY7IIgd3ckUJmWdB8MIPeJvUKXwqwPt56U0vesJjwuVgvF
	HYO3uTatKjzKEBerEtiu3NFIBQqevvuSgn9oEn5ZcaBebCnPgLQAPGwYhTlwq+3JacsL8sefEnosI
	dixn/GXVH5pap+dvZO072jQYfZXi1+uSg0PlvRxpZdKNiRWPb/u9op2Rq8aQsEypC2XumAcQxlpbO
	qdT0nHgg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYljV-0000000Eep2-0V7D;
	Tue, 30 Jul 2024 12:13:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 28DAC3003EA; Tue, 30 Jul 2024 14:13:36 +0200 (CEST)
Date: Tue, 30 Jul 2024 14:13:36 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Matthew Maurer <mmaurer@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] cfi: add CONFIG_CFI_ICALL_NORMALIZE_INTEGERS
Message-ID: <20240730121336.GL33588@noisy.programming.kicks-ass.net>
References: <20240730-kcfi-v1-0-bbb948752a30@google.com>
 <20240730-kcfi-v1-1-bbb948752a30@google.com>
 <CANiq72nxq0gnCXbQfFiZ4jErLptR8juyNzv1mKL_MEyWyDQdWA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nxq0gnCXbQfFiZ4jErLptR8juyNzv1mKL_MEyWyDQdWA@mail.gmail.com>

On Tue, Jul 30, 2024 at 01:38:33PM +0200, Miguel Ojeda wrote:
> On Tue, Jul 30, 2024 at 11:40 AM Alice Ryhl <aliceryhl@google.com> wrote:
> >
> > Introduce a Kconfig option for enabling the experimental option to
> > normalize integer types. This ensures that integer types of the same
> > size and signedness are considered compatible by the Control Flow
> > Integrity sanitizer.
> >
> > This option exists for compatibility with Rust, as C and Rust do not
> > have the same set of integer types. There are cases where C has two
> > different integer types of the same size and alignment, but Rust only
> > has one integer type of that size and alignment. When Rust calls into
> > C functions using such types in their signature, this results in CFI
> > failures.
> >
> > This patch introduces a dedicated option for this because it is
> > undesirable to have CONFIG_RUST affect CC_FLAGS in this way.
> 
> Is there any case where we would want CFI_ICALL_NORMALIZE_INTEGERS
> when Rust is not enabled, then? If not, is the idea here to make this
> an explicit extra question in the config before enabling Rust? Or why
> wouldn't it be done automatically?

I suspect CFI_ICALL_NORMALIZE_INTEGERS breaks ABI, then again, Linux
doesn't promise or preserve ABI except for the SYSCALL layer. So yeah,
meh.

