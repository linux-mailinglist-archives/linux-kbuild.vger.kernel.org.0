Return-Path: <linux-kbuild+bounces-5145-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B8C9F3044
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Dec 2024 13:15:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFC111883139
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Dec 2024 12:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20EA220459B;
	Mon, 16 Dec 2024 12:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KIOdKTua"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64D738FA6;
	Mon, 16 Dec 2024 12:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734351296; cv=none; b=hNB9TouMUH2yAqI8BpO5UWGeGSMAe/4z1zL3+fSvxqfcZhoFMSAkpQg4HSt+hXd+7XkCM//7WR4rv9agq8DADTpibQelF87As2mLoGebwgDW17xA7l0yuT/UX4w8Jw/3b5OTjlDpuN4FDSrxyKK3TpTSQSs9DzLYfii9gHnOP3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734351296; c=relaxed/simple;
	bh=7iRF4jqIgBaSkLJGtGcB0vl37xWSezwL8iYt9zrP8lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DctMRIk4Us3/E6yGWJciCCFiJrzgeAflyYR2+Zl6TK9mzh8fWeFGvZXCsfpljC+JTrSxvglj0t4KEJxUCY5y2OmlbjhvlUpJY0Ck6TyBNyC7sdvXYm99rrl7vgrLom6AOwa676bo3ZeAj0c5pj9lJ4V4pnNUjDjBwuPoa7o++u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KIOdKTua; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D16EAC4CED0;
	Mon, 16 Dec 2024 12:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734351295;
	bh=7iRF4jqIgBaSkLJGtGcB0vl37xWSezwL8iYt9zrP8lk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KIOdKTuaakr2c0pK++nrvbPEgq2dpHrANHRjJrWtjBOlB1kxnt1qrh7qNoa7+rznY
	 FZSVC30u6yqX3BlisyXPbiGAgCYPeZgr57P5Csbn+YFPF3kIulFtPa5j8ELA6PyW5U
	 uQoANz2c0hjhJ3rWfb9WRcZcQDuI7hAwNuT0e2Gc=
Date: Mon, 16 Dec 2024 13:14:16 +0100
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
	linux-kbuild@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH v3 0/4] rust: extend `module!` macro with integer
 parameter support
Message-ID: <2024121646-shelve-series-5319@gregkh>
References: <20241213-module-params-v3-v3-0-485a015ac2cf@kernel.org>
 <4Dsa69UGULRGsMbRbwOJNp_puyfsSSFt1QTcYU9AL4azd8vbfEFFtc7YNSsGegc40AfCZqVqZETfxg4TggUlSw==@protonmail.internalid>
 <2024121324-overdue-giggly-bdb8@gregkh>
 <87frmrepo5.fsf@kernel.org>
 <I0v8YGJe3e1ex1oF3mki-7QKimYLCJHnBy6g1taHgoOFvpNmQSrSnsMGJyGS064pGJsJDsTsei-pInFRz5INWA==@protonmail.internalid>
 <2024121309-lethargic-ended-5f99@gregkh>
 <87ttb7d24p.fsf@kernel.org>
 <hmmCwoNftQc5Mj4BLjFC2qTABem8CvuXSx3ucXzjIfQSwLjULmZgsw7vpq3Zxy0kk5H3Zjpz-vd4d7E1sb4LHw==@protonmail.internalid>
 <2024121344-excusably-resurrect-d01a@gregkh>
 <87h674c5vq.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h674c5vq.fsf@kernel.org>

On Mon, Dec 16, 2024 at 10:51:53AM +0100, Andreas Hindborg wrote:
> "Greg KH" <gregkh@linuxfoundation.org> writes:
> 
> > On Fri, Dec 13, 2024 at 04:38:30PM +0100, Andreas Hindborg wrote:
> >> "Greg KH" <gregkh@linuxfoundation.org> writes:
> >> > On Fri, Dec 13, 2024 at 01:24:42PM +0100, Andreas Hindborg wrote:
> >> >> "Greg KH" <gregkh@linuxfoundation.org> writes:
> >> >> > On Fri, Dec 13, 2024 at 12:30:45PM +0100, Andreas Hindborg wrote:
> >> I'm not getting a clear reading on the following, perhaps you can
> >> clarify:
> >>
> >>  - Is the community aligned on dropping module parameters for all new
> >>    drivers?
> >>    - If so, was this decided upon at some point or is this a fluid
> >>      decision that is just manifesting now?
> >
> > It's something that I've been saying in review comments of drivers for
> > many many years now.  Again, it was one of the main reasons we created
> > configfs and sysfs all those decades ago, because module parameters just
> > do not work properly for drivers in almost all cases.
> 
> Thinking a bit about this - are you sure there are no situations where
> module parameters is actually the right choice? I could imagine deeply
> embedded deployments, potentially with all required modules linked in to
> a static kernel image. It is probably desirable to be able to pass
> configuration to the modules via the kernel command line in this
> situation. If not for configuration in the field, then for a development
> situation.

I'm not saying "no situations at all", I'm saying "almost no situations
need a module parameter, and almost NO driver needs one."  That does not
mean "none".

> Surely there are also situations in regular PC setups where it is
> desirable to pass configuration data to a module, so that it is
> available at load time. With configfs, module initialization becomes a
> two stage process of first loading and then configuring. That is not
> always what you would want.

"regular" PC setups do not want module parameters either, they should
all be dynamic busses and everything should "just work".

> Since module parameters actually do show up in sysfs as writable
> entries, when the right flags are passed, they do feel very similar to
> sysfs/configfs for simple use cases. What are the reasons they should
> not be usable for these simple use cases?

Because they are almost never a good idea for a driver because drivers
can control multiple devices and how do you show that in a single value?

For non-drivers, it's a different issue, but that's not what you are
considering here :)

> >>  - Does this ban of module parameters also cover cases where backwards
> >>    compatibility is desirable?
> >
> > No, we don't break existing kernel features, but if you are writing a
> > new driver, don't add them and then there's no compatibility issue.
> >
> > We don't normally allow "rewrites" of drivers, but if we do, yes, you
> > would have to implement the old features if needed.
> >
> > As you just seem to want to write an "example" block driver, no need to
> > add the module option there, just do it right this time in how to
> > properly configure things.
> >
> >>  - Can we merge this so I can move forward at my current projected
> >>    course, or should I plan on dealing with not having this available?
> >
> > We generally do not want to merge apis without any real users, as it's
> > hard to justify them, right?  Also, we don't even know if they work
> > properly or not.
> 
> While null_blk is just a piece of testing infrastructure that you would
> not deploy in a production environment, it is still a "real user". I am
> sure we can agree on the importance of testing.
> 
> The exercise I am undertaking is to produce a drop in replacement of the
> existing C null_blk driver. If all goes well, we are considering to swap
> the C implementation for the Rust implementation in X number of years.
> Granted - a lot of things have to fall into place for that to happen,
> but that is the plan. This plan does not really work well if the two
> modules do not have the same interface.

Why do you have to have the same interface?  Why not do it "properly"
and make it use configfs that way you can have multiple devices and test
them all at the same time?

As this is "just" a testing driver, there should not be any need to keep
the same user/kernel api for setting things up, right?

Again, don't make the mistakes we have in the past, drivers should NOT
be using module parameters.

> I understand that you would like to phase out module parameters, but I
> don't think blocking their use from Rust is the right way to go about
> that task. If you really feel that module parameters have no place in
> new drivers, I would suggest that to be part of review process for each
> individual new driver - not at the stage of enabling module parameters
> for Rust in general.

I'm saying that module parameters do NOT belong in a driver, which is
what you are wanting to do here.  And as for adding new apis, please
only do so when you have a real user, I don't see a real user for module
parameters in rust just yet.  If that changes, I'll reconsider my stance :)

thanks,

greg k-h

