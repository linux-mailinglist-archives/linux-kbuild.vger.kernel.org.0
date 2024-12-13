Return-Path: <linux-kbuild+bounces-5126-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A549F0F0B
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 15:23:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4AE21881C12
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 14:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B659D1E0DE3;
	Fri, 13 Dec 2024 14:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="F0LO00IQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB331E04B6;
	Fri, 13 Dec 2024 14:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734099809; cv=none; b=aG8ltZGd+FJWuOWkAIiwd11rC3aGA1JM5tKMafmj9vgs4pjm11iL4TsWj86D1QuRrEoXZGrIETMB3ecu5XiH/u3hPahId27NFwKvfIn+n78IsZVUKuir+S17XKrggcg09AVDAfDXgqPBPBX09en6M47STXJy8tsqHqOD404+/W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734099809; c=relaxed/simple;
	bh=8Fu+2xNetoe5kq0Vd5HTWdZxa6W/2sXw3vvL/j7EZeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rA6ObvCBPF8Dj6NGh5metscqSAqoeJ/OhfIU+DryyuHPKsrPnu3Sc8U84vxmC/cDBk1ecPc2NM/VdSup447Zk3RuXI+jjxXISrzOrVvxEbAKGflNwAQn02VfnO+vJEfU1szuX+PGo05nsWRQAY8fB0M1t8cQr0BuAYU1Hg46zNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=F0LO00IQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC1EC4CED0;
	Fri, 13 Dec 2024 14:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734099809;
	bh=8Fu+2xNetoe5kq0Vd5HTWdZxa6W/2sXw3vvL/j7EZeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F0LO00IQ92nt2/SayGrbigp//QGiEbsj6v58OLj3oBeHWYWinaf1KN+XPsogLfvdZ
	 LHHzioO/adpphmO+vK/ENgTNK6XZtMTH4uMNrFOHvS/yad/UknOKvHf2MrAEFoD7uL
	 9C3bJ+3EGDJkW7l6zoy8NDBbOHZqWzxDVDejv9Ew=
Date: Fri, 13 Dec 2024 15:23:24 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Alice Ryhl <aliceryhl@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Trevor Gross <tmgross@umich.edu>,
	Adam Bratschi-Kaye <ark.email@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3 0/4] rust: extend `module!` macro with integer
 parameter support
Message-ID: <2024121309-lethargic-ended-5f99@gregkh>
References: <20241213-module-params-v3-v3-0-485a015ac2cf@kernel.org>
 <4Dsa69UGULRGsMbRbwOJNp_puyfsSSFt1QTcYU9AL4azd8vbfEFFtc7YNSsGegc40AfCZqVqZETfxg4TggUlSw==@protonmail.internalid>
 <2024121324-overdue-giggly-bdb8@gregkh>
 <87frmrepo5.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87frmrepo5.fsf@kernel.org>

On Fri, Dec 13, 2024 at 01:24:42PM +0100, Andreas Hindborg wrote:
> "Greg KH" <gregkh@linuxfoundation.org> writes:
> 
> > On Fri, Dec 13, 2024 at 12:30:45PM +0100, Andreas Hindborg wrote:
> >> This series extends the `module!` macro with support module parameters.
> >
> > Eeek, why?
> >
> > Module parameters are from the 1990's, back when we had no idea what we
> > were doing and thought that a simple "one variable for a driver that
> > controls multiple devices" was somehow a valid solution :)
> >
> > Please only really add module parameters if you can prove that you
> > actually need a module parameter.
> 
> I really need module parameters to make rust null block feature
> compatible with C null block.

Is that a requirement?  That wasn't documented here :(

You should have put the user of these apis in the series as you have
that code already in the tree, right?

> Let's not block interfacing parts of the kernel because we decided that
> the way we (well not me, I was not around) did things in the 80's was
> less than stellar. I mean, we would get nowhere.

On the contrary, if we don't learn from our past mistakes, we will
constantly keep making them and prevent others from "doing the right
thing" by default.

I would strongly prefer that any driver not have any module parameters
at all, as drivers don't work properly that way (again, they need to
handle multiple devices, which does not work for a module parameter.)

That's why we created sysfs, configfs, and lots of other things, to
learn from our past mistakes.

thanks,

greg k-h

