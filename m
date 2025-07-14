Return-Path: <linux-kbuild+bounces-8006-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E92EB03A3C
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Jul 2025 11:01:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50B3E1898880
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Jul 2025 09:02:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7EB21FC0E2;
	Mon, 14 Jul 2025 09:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="n9GhlIE3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2752510A1E;
	Mon, 14 Jul 2025 09:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752483710; cv=none; b=iHUOiK4CazvtGEH/2g38oNxxwpKzWnjNPlicO03EaahcfwrtDXsgABUznhd6McqXIXbErPQIANk8ztqb7gSMYtGFlWYuZ6NpcoVIbKckz4on7Bp0tNmJmp08pjSqNPkGVvy33nLsrmp0LaBa6WWBVi6ye2X/yOFqntMBbjuXyZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752483710; c=relaxed/simple;
	bh=E1DjprMalu3MYxieIEg3iKgcKloRslOwdnRJZhDtCas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZK25LdHVC66ACN50uPddRQv7Rzo34T8AfeNipDoP3kYFK5Vl0YJVzgmHfzl/Aro1zoLY0/xS0TxwE8NOWZfgynrBM5SPR9v1/rnIjN6MiRClLm48T8CqHzDYUWSfDGRCyPWZR95sJm6RyLGSz+aLIAjxsAyQkz5MODJeFlQ+ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=n9GhlIE3; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zdEc0Ly1I3A8OFmOCeYmPl/xXNhD1BIGPS9d7GroiT8=; b=n9GhlIE3PmAjZwDuZUzBIXKyQm
	tYGpDoU8va1CCkF87FN2PH2+QohuFBnVXctMolBQG5flpUONFumbugXptqVxMVmcFyIA2WQLAhfMA
	fQCSnqAM7Dn7NTgH+w+0YEu7B+dXICw556FjiLgZeN2bGTCiZyqyek34PyitOL5pa59HQmT3REbiQ
	fh/sXtfEY6TwSrfU5D4tANvrVa0ZxCCvj+Lj4ZcOgJLlfcD40+JUe9kqoCKOpdpw6VDote2S5yOzQ
	ZOoQq1ZkNsIS4UwKKOL7dTdUezwkVEDqr0U1E/ChYenzCB3jdY1Eb6zk5uie1thRYt2oKS7SilAvt
	i/i7IpuA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubF4D-00000006bGz-0Gna;
	Mon, 14 Jul 2025 09:01:45 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 08480300186; Mon, 14 Jul 2025 11:01:44 +0200 (CEST)
Date: Mon, 14 Jul 2025 11:01:43 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] objtool/rust: add one more `noreturn` Rust function
 for Rust 1.89.0
Message-ID: <20250714090143.GM1613200@noisy.programming.kicks-ass.net>
References: <20250712160103.1244945-1-ojeda@kernel.org>
 <20250712160103.1244945-2-ojeda@kernel.org>
 <20250714084638.GL905792@noisy.programming.kicks-ass.net>
 <CAH5fLgjtU1u=h8FY3im364AsC21GitnrjhBT=YJMmipH_ZWnQA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH5fLgjtU1u=h8FY3im364AsC21GitnrjhBT=YJMmipH_ZWnQA@mail.gmail.com>

On Mon, Jul 14, 2025 at 10:48:33AM +0200, Alice Ryhl wrote:

> > >  tools/objtool/check.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> > > index f23bdda737aa..3257eefc41ed 100644
> > > --- a/tools/objtool/check.c
> > > +++ b/tools/objtool/check.c
> > > @@ -224,6 +224,7 @@ static bool is_rust_noreturn(const struct symbol *func)
> > >              str_ends_with(func->name, "_4core9panicking14panic_explicit")                            ||
> > >              str_ends_with(func->name, "_4core9panicking14panic_nounwind")                            ||
> > >              str_ends_with(func->name, "_4core9panicking18panic_bounds_check")                        ||
> > > +            str_ends_with(func->name, "_4core9panicking18panic_nounwind_fmt")                        ||
> > >              str_ends_with(func->name, "_4core9panicking19assert_failed_inner")                       ||
> > >              str_ends_with(func->name, "_4core9panicking30panic_null_pointer_dereference")            ||
> > >              str_ends_with(func->name, "_4core9panicking36panic_misaligned_pointer_dereference")      ||
> >
> > Just having "_4core9panicking" substring is not sufficient?
> 
> That prefix just means it is defined in the panicking.rs file, which
> also has a few functions that are not noreturn.

Oh well, I figured it was too good to be true anyway. Its just that
there was a lot of that around and I had to ask :-)

