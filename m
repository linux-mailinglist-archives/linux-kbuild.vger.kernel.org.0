Return-Path: <linux-kbuild+bounces-133-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A367F5ABF
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Nov 2023 10:05:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0DE4281620
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Nov 2023 09:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A2E1CFB2;
	Thu, 23 Nov 2023 09:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gZxE875+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1508F5C;
	Thu, 23 Nov 2023 09:05:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C291C433C8;
	Thu, 23 Nov 2023 09:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700730355;
	bh=Lcd150vAerjkaRvtY0bS83Rte9WRMhTnKhCGePr/mKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gZxE875+pb5Kx5SdnUy+1qJggwnPSULnHJZNmnyyWU1tZnEKd6+k+CLcxMCdL2SZI
	 dNU/1oTl+LESlR5MxF2sNxJ8zA+4gVVwUx3CVe6jBu7kI5fW4yMj35sj4acE7tqxMN
	 KaG2fJSM6oZZxOlC9JU9HsL7YAfrbLxHWJYBYuJ4=
Date: Thu, 23 Nov 2023 09:05:52 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Laura Abbott <laura@labbott.name>
Subject: Re: [PATCH v2 0/5] MODVERSIONS + RUST Redux
Message-ID: <2023112314-tubby-eligibly-007a@gregkh>
References: <20231118025748.2778044-1-mmaurer@google.com>
 <CAK7LNAQt8fy5+vSwpd1aXfzjzeZ5hiyW7EW9SW7pbG2eTJZAOA@mail.gmail.com>
 <CAGSQo00hyCTVsqHtrzKBBPvuH38z5yRm_4jzdi00C0RV+8APwQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGSQo00hyCTVsqHtrzKBBPvuH38z5yRm_4jzdi00C0RV+8APwQ@mail.gmail.com>

On Wed, Nov 22, 2023 at 01:04:09PM -0800, Matthew Maurer wrote:
> > So, even if you enable CONFIG_MODVERSIONS,
> > nothing is checked for Rust.
> > Genksyms computes a CRC from "int foo", and
> > the module subsystem confirms it is a "int"
> > variable.
> >
> > We know this check always succeeds.
> >
> > Why is this useful?
> The reason this is immediately useful is that it allows us to have Rust
> in use with a kernel where C modules are able to benefit from MODVERSIONS
> checking. The check would effectively be a no-op for now, as you have correctly
> determined, but we could refine it to make it more restrictive later.
> Since the
> existing C approach errs on the side of "it could work" rather than "it will
> work", I thought being more permissive was the correct initial solution.

But it's just providing "fake" information to the CRC checker, which
means that the guarantee of a ABI check is not true at all.

So the ask for the user of "ensure that the ABI checking is correct" is
being circumvented here, and any change in the rust side can not be
detected at all.

The kernel is a "whole", either an option works for it, or it doesn't,
and you are splitting that guarantee here by saying "modversions will
only work for a portion of the kernel, not the whole thing" which is
going to cause problems for when people expect it to actually work
properly.

So, I'd strongly recommend fixing this for the rust code if you wish to
allow modversions to be enabled at all.

> With regards to future directions that likely won't work for loosening it:
> Unfortunately, the .rmeta format itself is not stable, so I wouldn't want to
> teach genksyms to open it up and split out the pieces for specific functions.
> Extending genksyms to parse Rust would also not solve the situation -
> layouts are allowed to differ across compiler versions or even (in rare
> cases) seemingly unrelated code changes.

What do you mean by "layout" here?  Yes, the crcs can be different
across compiler versions and seemingly unrelated code changes (genksyms
is VERY fragile) but that's ok, that's not what you are checking here.
You want to know if the rust function signature changes or not from the
last time you built the code, with the same compiler and options, that's
all you are verifying.

> Future directions that might work for loosening it:
> * Generating crcs from debuginfo + compiler + flags
> * Adding a feature to the rust compiler to dump this information. This
> is likely to
>   get pushback because Rust's current stance is that there is no ability to load
>   object code built against a different library.

Why not parse the function signature like we do for C?

> Would setting up Rust symbols so that they have a crc built out of .rmeta be
> sufficient for you to consider this useful? If not, can you help me understand
> what level of precision would be required?

What exactly does .rmeta have to do with the function signature?  That's
all you care about here.

thanks,

greg k-h

