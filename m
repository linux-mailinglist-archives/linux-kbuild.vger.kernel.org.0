Return-Path: <linux-kbuild+bounces-5127-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B48DE9F1125
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 16:38:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7079D2827B8
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 15:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448281E2611;
	Fri, 13 Dec 2024 15:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+IUII5/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186924A21;
	Fri, 13 Dec 2024 15:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734104322; cv=none; b=D0QeL6hnqKwtDpR//ROr74JHfE5CCZo/aQUTZczIcDZQ9+s4hFBJpDGVJXNighJPkjuB20rz4lCs2CBnIB3cABR4BxI0xiLY7PAHyfjSUn4zl2zUVneJJOlOEUFrrFJCZ3kGZxiDaR1OJrB91I65NZC7TI6w38+6JWonwhCT2po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734104322; c=relaxed/simple;
	bh=TtiwPZnc3uU5RWhUI34AYaSZu4sDmkVKjXOgaG/22rI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VaMPw411G7TnUoR0d3Aq+efoc9+IzCVXEsVMdYFPY1auRy7gSLTCov6KmNb8aPgpGVUfQTow+gJbenASVbaQF2hqIlcnK0JXraHE54DuENnoeZwiFD5camDWsbcecvHxNfpNDnrE+Na9YxaB1SUc8Qg7yqd2TUgCQbIS/nETwnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T+IUII5/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D688BC4CED0;
	Fri, 13 Dec 2024 15:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734104321;
	bh=TtiwPZnc3uU5RWhUI34AYaSZu4sDmkVKjXOgaG/22rI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=T+IUII5/1JTeyOp7rVWdv3iLnpqyRq17m04K01cWcG6yhg+T45WsLQDziS/ux0IYY
	 QyNh4pei4I+QKRaEL3GlB1EZtAbQMGThU1TckhIHzQg586aLMl2ZvDt1j5FR4tWYeG
	 0pe57rYM+5goUdu8FaIuZKh/yxitFZ4E2H3bUdJPHsNB1kUIUdNWFMbmiM+xt6ciVm
	 15kXXTXlIvboZpNJ/D7dlfHdarmycEYDgz7PBUFHFURGQ+eqdLgsgHRErWbH6/IIHV
	 5rmE1plnscvDSWCxuKzh0RX2FWnYuQfQIkZbwmGFREKRMd3X9Lz2u2xCWqLQaQE+DE
	 Y2Ea2TfawSkgg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Greg KH" <gregkh@linuxfoundation.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Masahiro Yamada" <masahiroy@kernel.org>,  "Nathan Chancellor"
 <nathan@kernel.org>,  "Nicolas Schier" <nicolas@fjasle.eu>,  "Trevor
 Gross" <tmgross@umich.edu>,  "Adam Bratschi-Kaye" <ark.email@gmail.com>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v3 0/4] rust: extend `module!` macro with integer
 parameter support
In-Reply-To: <2024121309-lethargic-ended-5f99@gregkh> (Greg KH's message of
	"Fri, 13 Dec 2024 15:23:24 +0100")
References: <20241213-module-params-v3-v3-0-485a015ac2cf@kernel.org>
	<4Dsa69UGULRGsMbRbwOJNp_puyfsSSFt1QTcYU9AL4azd8vbfEFFtc7YNSsGegc40AfCZqVqZETfxg4TggUlSw==@protonmail.internalid>
	<2024121324-overdue-giggly-bdb8@gregkh> <87frmrepo5.fsf@kernel.org>
	<I0v8YGJe3e1ex1oF3mki-7QKimYLCJHnBy6g1taHgoOFvpNmQSrSnsMGJyGS064pGJsJDsTsei-pInFRz5INWA==@protonmail.internalid>
	<2024121309-lethargic-ended-5f99@gregkh>
Date: Fri, 13 Dec 2024 16:38:30 +0100
Message-ID: <87ttb7d24p.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Greg KH" <gregkh@linuxfoundation.org> writes:

> On Fri, Dec 13, 2024 at 01:24:42PM +0100, Andreas Hindborg wrote:
>> "Greg KH" <gregkh@linuxfoundation.org> writes:
>>
>> > On Fri, Dec 13, 2024 at 12:30:45PM +0100, Andreas Hindborg wrote:
>> >> This series extends the `module!` macro with support module parameters.
>> >
>> > Eeek, why?
>> >
>> > Module parameters are from the 1990's, back when we had no idea what we
>> > were doing and thought that a simple "one variable for a driver that
>> > controls multiple devices" was somehow a valid solution :)
>> >
>> > Please only really add module parameters if you can prove that you
>> > actually need a module parameter.
>>
>> I really need module parameters to make rust null block feature
>> compatible with C null block.
>
> Is that a requirement?  That wasn't documented here :(
>
> You should have put the user of these apis in the series as you have
> that code already in the tree, right?

Sorry, my mistake. I'm trying to build a rust implementation of C
null_blk, and one the bits I need for that is module parameters.

>
>> Let's not block interfacing parts of the kernel because we decided that
>> the way we (well not me, I was not around) did things in the 80's was
>> less than stellar. I mean, we would get nowhere.
>
> On the contrary, if we don't learn from our past mistakes, we will
> constantly keep making them and prevent others from "doing the right
> thing" by default.
>
> I would strongly prefer that any driver not have any module parameters
> at all, as drivers don't work properly that way (again, they need to
> handle multiple devices, which does not work for a module parameter.)
>
> That's why we created sysfs, configfs, and lots of other things, to
> learn from our past mistakes.

OK. I understand. It makes sense even :) I wish I knew that this was a
thing before I spent spare cycles fixing this up for v3 though.

I'm not getting a clear reading on the following, perhaps you can
clarify:

 - Is the community aligned on dropping module parameters for all new
   drivers?
   - If so, was this decided upon at some point or is this a fluid
     decision that is just manifesting now?
 - Does this ban of module parameters also cover cases where backwards
   compatibility is desirable?
 - Can we merge this so I can move forward at my current projected
   course, or should I plan on dealing with not having this available?

Best regards,
Andreas Hindborg




