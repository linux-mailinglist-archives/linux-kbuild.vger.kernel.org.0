Return-Path: <linux-kbuild+bounces-5128-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3F49F11BC
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 17:05:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59C5D164FA3
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 16:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C061E00AC;
	Fri, 13 Dec 2024 16:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yGWClciV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93892F24;
	Fri, 13 Dec 2024 16:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734105950; cv=none; b=fLuUvnZmzl1tvA8uvl00pdogbn88B3fpxbvXOo35DktpVfYfPf3ksljFX5hnihKk7iExgx3ALzjQByTvjt0EhW2GKpvbFJkC1XI0m3ks1gd/8/DP/5VTBCX269QpNnat3DSXmysu/xrfdPgX65Q8TUrHk9bhiOmKQB+0fj+b0e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734105950; c=relaxed/simple;
	bh=3rLYhkJv0wVJDWqO6nVaBxFOTIIEYFwOow4rYd0GBLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xv4OQIaH6pMA/tLHscW8AsjYZnKzV79EJleopdF7oJUzmd/QZHhsXTNVv9JZsuC2D12h4d2//pjkIXxCAZiVByGaoSued5AFB9wdhNMRR+dSh1bnlf9r2m9XhF8H+FaHiN5FUTBafGVlpYB2GbX3t2evJrTM6EpE/dn77JwiIL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=yGWClciV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD807C4CED0;
	Fri, 13 Dec 2024 16:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734105949;
	bh=3rLYhkJv0wVJDWqO6nVaBxFOTIIEYFwOow4rYd0GBLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yGWClciVgeYIl2KzDKW70FLfuIP1W6yrjsJbm9mocK4RlUs+SZdrgFuYesG+CG2Ve
	 bWudWvdTbhC1A7XTWIGDsA3yQnSFWKABNwYd1KvqsmWiBEN0dmMI4F0/ZdFXeZiJrk
	 BX8oyMUlnIOsch9MlwdyKQMHv+x/lLRZDNDPzn6M=
Date: Fri, 13 Dec 2024 17:05:46 +0100
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
Message-ID: <2024121344-excusably-resurrect-d01a@gregkh>
References: <20241213-module-params-v3-v3-0-485a015ac2cf@kernel.org>
 <4Dsa69UGULRGsMbRbwOJNp_puyfsSSFt1QTcYU9AL4azd8vbfEFFtc7YNSsGegc40AfCZqVqZETfxg4TggUlSw==@protonmail.internalid>
 <2024121324-overdue-giggly-bdb8@gregkh>
 <87frmrepo5.fsf@kernel.org>
 <I0v8YGJe3e1ex1oF3mki-7QKimYLCJHnBy6g1taHgoOFvpNmQSrSnsMGJyGS064pGJsJDsTsei-pInFRz5INWA==@protonmail.internalid>
 <2024121309-lethargic-ended-5f99@gregkh>
 <87ttb7d24p.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ttb7d24p.fsf@kernel.org>

On Fri, Dec 13, 2024 at 04:38:30PM +0100, Andreas Hindborg wrote:
> "Greg KH" <gregkh@linuxfoundation.org> writes:
> > On Fri, Dec 13, 2024 at 01:24:42PM +0100, Andreas Hindborg wrote:
> >> "Greg KH" <gregkh@linuxfoundation.org> writes:
> >> > On Fri, Dec 13, 2024 at 12:30:45PM +0100, Andreas Hindborg wrote:
> I'm not getting a clear reading on the following, perhaps you can
> clarify:
> 
>  - Is the community aligned on dropping module parameters for all new
>    drivers?
>    - If so, was this decided upon at some point or is this a fluid
>      decision that is just manifesting now?

It's something that I've been saying in review comments of drivers for
many many years now.  Again, it was one of the main reasons we created
configfs and sysfs all those decades ago, because module parameters just
do not work properly for drivers in almost all cases.

>  - Does this ban of module parameters also cover cases where backwards
>    compatibility is desirable?

No, we don't break existing kernel features, but if you are writing a
new driver, don't add them and then there's no compatibility issue.

We don't normally allow "rewrites" of drivers, but if we do, yes, you
would have to implement the old features if needed.

As you just seem to want to write an "example" block driver, no need to
add the module option there, just do it right this time in how to
properly configure things.

>  - Can we merge this so I can move forward at my current projected
>    course, or should I plan on dealing with not having this available?

We generally do not want to merge apis without any real users, as it's
hard to justify them, right?  Also, we don't even know if they work
properly or not.

thanks,

greg k-h

