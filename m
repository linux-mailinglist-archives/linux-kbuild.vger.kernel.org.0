Return-Path: <linux-kbuild+bounces-5151-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EED39F33F4
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Dec 2024 16:04:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F3981883F8F
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Dec 2024 15:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E7CB13D89D;
	Mon, 16 Dec 2024 15:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="A6fpaikz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89A213AA2B;
	Mon, 16 Dec 2024 15:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734361429; cv=none; b=YSWcsAHbpM0J5157EL2kQE/JqOysPDM3hX6PSLivbgza6/q2QXej7ukB3bRRFq68i3coedBrIHTp54Qc8o6QRtAMSq2wNU9W+Q3SXOEybmW/8K62aCfc95pdGSOcfDk6zG8dyv3/79RVobMKZTPVW0r3cztJ3e06eoiMQgI9n6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734361429; c=relaxed/simple;
	bh=Ao21RlVy+Dkdya5UZarNG+/GZUOCqYMKVM6kRW374Jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8KA7KxRjcr139LCDfS3QuYs0+qj3pB2QrfDNi2YU8fpZq1vK3xdEuckGokKaJLOVV/7tELi4fMmLDEGD12iOgCgbPRofS/OboCyiMvtvMYQrbk4eve8f2hxGqzb3piQQa6bAcdH9sb1Jop1GwuCeeJHR9rwTjXMNVzt4Fxf5wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=A6fpaikz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1C11C4CED0;
	Mon, 16 Dec 2024 15:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734361428;
	bh=Ao21RlVy+Dkdya5UZarNG+/GZUOCqYMKVM6kRW374Jc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A6fpaikzVw1u6ZBr91MwRumQrVZl9oIoleo85mCDTE4o5kyhQKTM4aTqbDUBMajzf
	 TClbvNEge/vUc0ObBFmUYzTfua5YF2Z4c8dfDLKZrZWoZA/YTFA2QVopNNqsllnjMa
	 blq4QflBo9uEYwHk5DGferYZwPLnUx86hrOER6Pw=
Date: Mon, 16 Dec 2024 16:03:07 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
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
Message-ID: <2024121630-steed-grating-6352@gregkh>
References: <I0v8YGJe3e1ex1oF3mki-7QKimYLCJHnBy6g1taHgoOFvpNmQSrSnsMGJyGS064pGJsJDsTsei-pInFRz5INWA==@protonmail.internalid>
 <2024121309-lethargic-ended-5f99@gregkh>
 <87ttb7d24p.fsf@kernel.org>
 <hmmCwoNftQc5Mj4BLjFC2qTABem8CvuXSx3ucXzjIfQSwLjULmZgsw7vpq3Zxy0kk5H3Zjpz-vd4d7E1sb4LHw==@protonmail.internalid>
 <2024121344-excusably-resurrect-d01a@gregkh>
 <87h674c5vq.fsf@kernel.org>
 <UW-ATumT4L-13ZXX-lO1inQGeZK7VgQWNAHE3688ulGj-rvzxWkUdrmnAUlufI1W5-9d6vzH3TXZ4VOmYh9wxA==@protonmail.internalid>
 <2024121646-shelve-series-5319@gregkh>
 <877c7zbx2u.fsf@kernel.org>
 <8e1b5c5e-52ae-4332-a49c-990add7611f6@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e1b5c5e-52ae-4332-a49c-990add7611f6@kernel.dk>

On Mon, Dec 16, 2024 at 07:43:12AM -0700, Jens Axboe wrote:
> On 12/16/24 6:02 AM, Andreas Hindborg wrote:
> >>> I understand that you would like to phase out module parameters, but I
> >>> don't think blocking their use from Rust is the right way to go about
> >>> that task. If you really feel that module parameters have no place in
> >>> new drivers, I would suggest that to be part of review process for each
> >>> individual new driver - not at the stage of enabling module parameters
> >>> for Rust in general.
> >>
> >> I'm saying that module parameters do NOT belong in a driver, which is
> >> what you are wanting to do here.  And as for adding new apis, please
> >> only do so when you have a real user, I don't see a real user for module
> >> parameters in rust just yet.  If that changes, I'll reconsider my stance :)
> > 
> > I guess we disagree about what is "real" and what is not.
> > 
> > In my view, null_blk is real, it is used by real people to do real work.
> > They get real annoyed when the interface for their real tools change -
> > thus making it more difficult to do this experiment.
> 
> I'd have to agree with that - yes, null_blk doesn't host any real
> applications, but it is the backbone of a lot of testing that blktests
> and others do. Hence it's very real in that sense, and the rust version
> of null_blk should provide and mimic how the C version works for ease of
> testing.
> 
> If this was a new driver where no prior art exists in terms of users and
> API, then I'd certainly agree with Greg. But that's not the case here.

Ok, so are you going to drop the C version and go with the rust version
if it shows up?  Surely you don't want duplicate drivers for the same
thing in the tree, right?

thanks,

greg k-h

