Return-Path: <linux-kbuild+bounces-5146-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2FB9F3076
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Dec 2024 13:24:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B0E11884DF3
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Dec 2024 12:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A211D204585;
	Mon, 16 Dec 2024 12:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kgd+iiSV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759A71F708E;
	Mon, 16 Dec 2024 12:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734351836; cv=none; b=egXqrqRBNluyqgiAbidyziXJTS71XfjvF0q8yNwUTJ1sIJ2rYcsfHVws54ohqGW48e4A7NFsL4d0y6lzMEflgQxcW1dCQAU2PcAd43Oe0aHxxY4xT6TkgvH8hbakmqXEKZ0loFWk7meismkjGABYR98SqCu7SBXca8ydikqHxsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734351836; c=relaxed/simple;
	bh=NY3Pobjt7QXnMszoOCLYZSI2Skl91ks1KVx27IdkNvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DO5F2DhR7gzgf9X9miaoYXni6jvOSNMGl3sIO8/oUBt7RALRAzxFfiof3n1QLVmmusLDKMKCMxd859On329a1w/IRt1Y72tz+VufLV6A/x3JCwqFj/i6nyKM+zjYZK/Y1oEdi8xnzX7XkoFl2Mmtm/FajL8EKU1Rjqho9yqYzGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kgd+iiSV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0620C4CED0;
	Mon, 16 Dec 2024 12:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734351836;
	bh=NY3Pobjt7QXnMszoOCLYZSI2Skl91ks1KVx27IdkNvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kgd+iiSVfDzUrkVaUehFZipG/0EcN9LrfnHoHVtCfdsepTsBxwUoOCDJ7e9KsGdLL
	 Gd2P51DEqtD/2qYnoEgLgFF9iwM2KwvO6wYr5YFTClX/LEdY8jqwztQxHZPTOwSdl6
	 VqodRIQ1UWDTTL7jsUjEPg4ArHB0HgaRPYkTYfZ0=
Date: Mon, 16 Dec 2024 13:23:17 +0100
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
Message-ID: <2024121637-postcard-fled-f72c@gregkh>
References: <4Dsa69UGULRGsMbRbwOJNp_puyfsSSFt1QTcYU9AL4azd8vbfEFFtc7YNSsGegc40AfCZqVqZETfxg4TggUlSw==@protonmail.internalid>
 <2024121324-overdue-giggly-bdb8@gregkh>
 <87frmrepo5.fsf@kernel.org>
 <I0v8YGJe3e1ex1oF3mki-7QKimYLCJHnBy6g1taHgoOFvpNmQSrSnsMGJyGS064pGJsJDsTsei-pInFRz5INWA==@protonmail.internalid>
 <2024121309-lethargic-ended-5f99@gregkh>
 <87ttb7d24p.fsf@kernel.org>
 <hmmCwoNftQc5Mj4BLjFC2qTABem8CvuXSx3ucXzjIfQSwLjULmZgsw7vpq3Zxy0kk5H3Zjpz-vd4d7E1sb4LHw==@protonmail.internalid>
 <2024121344-excusably-resurrect-d01a@gregkh>
 <87h674c5vq.fsf@kernel.org>
 <2024121646-shelve-series-5319@gregkh>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024121646-shelve-series-5319@gregkh>

On Mon, Dec 16, 2024 at 01:14:16PM +0100, Greg KH wrote:
> On Mon, Dec 16, 2024 at 10:51:53AM +0100, Andreas Hindborg wrote:
> > The exercise I am undertaking is to produce a drop in replacement of the
> > existing C null_blk driver. If all goes well, we are considering to swap
> > the C implementation for the Rust implementation in X number of years.
> > Granted - a lot of things have to fall into place for that to happen,
> > but that is the plan. This plan does not really work well if the two
> > modules do not have the same interface.
> 
> Why do you have to have the same interface?  Why not do it "properly"
> and make it use configfs that way you can have multiple devices and test
> them all at the same time?

Wait, null_blk already uses configfs, so just use that!  I'd like to see
the rust bindings for that api as that will be needed by lots of code.

thanks,

greg k-h

