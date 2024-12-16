Return-Path: <linux-kbuild+bounces-5142-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC8E9F2D5F
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Dec 2024 10:52:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D410F1648DE
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Dec 2024 09:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095F21FFC60;
	Mon, 16 Dec 2024 09:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b00WoHXW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3E4BA49;
	Mon, 16 Dec 2024 09:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734342724; cv=none; b=qgsRe6na9mwHxiLRo5yq3fBg/P/t+e9HJVxIA84HePthBxnvamwvoFnLnJx4MpmYmvAAFXdq0Ko8IEnz97gVsFkgBjqNvGqU91mR/fKalM1DP4jqr5NRlndKXb+KD/pVcZt52A3TiwrOaedQfK4Ugc5q/3VNKKRIDWhnMcaSncc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734342724; c=relaxed/simple;
	bh=ZImkITQq9aZIEvUzKyzvuMqnIX250ElPakbMtndY+64=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ob9zH4c0QH7p7dDz0rWl+HshfAIMLId/aMyx5uK1ItI8gj95eDAn9PYk5JSpAgueIr8R+N7rn500guX0GvmMjN1oUGoQrdKP6953/G6CtBF0kh3kox1bZvN/iphf3gPJlCflDgH0y4oUjjRSSHph1SmFtgNzoVELc5FiP+m/DGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b00WoHXW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CFE6C4CED0;
	Mon, 16 Dec 2024 09:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734342724;
	bh=ZImkITQq9aZIEvUzKyzvuMqnIX250ElPakbMtndY+64=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=b00WoHXWt28DE5XFiBqSH/4oFk+zD4PYduAd3jKeNCqDzJLgSPsJ/hNvasDg3Cv8a
	 XQLVQqEV3OHkFHyKb6bYHpU2g3BeY5g4kgVrMvb92VDU1u7zl+/szQajO3JL0eYuXG
	 gzFOWFr/1i0d3vfoICFBr3AXfraL+AwL/42h4ARoGlOdP1sKP5a2NNZ/EiDwqpotYN
	 RAfnOSZa7J5Y4IAweWsLaINsBSkVSAwmgLuBkGS+plyV0XwBNKXGnuqQs4MUlC+82Y
	 Tet57HInF0eO3amDF8A0HMKmRagCOMRI3dxQTXuMmw50NMsSldFuVX5XWLa2/X9b5V
	 hS52qwKdlUujg==
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
  <linux-kbuild@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH v3 0/4] rust: extend `module!` macro with integer
 parameter support
In-Reply-To: <2024121344-excusably-resurrect-d01a@gregkh> (Greg KH's message
	of "Fri, 13 Dec 2024 17:05:46 +0100")
References: <20241213-module-params-v3-v3-0-485a015ac2cf@kernel.org>
	<4Dsa69UGULRGsMbRbwOJNp_puyfsSSFt1QTcYU9AL4azd8vbfEFFtc7YNSsGegc40AfCZqVqZETfxg4TggUlSw==@protonmail.internalid>
	<2024121324-overdue-giggly-bdb8@gregkh> <87frmrepo5.fsf@kernel.org>
	<I0v8YGJe3e1ex1oF3mki-7QKimYLCJHnBy6g1taHgoOFvpNmQSrSnsMGJyGS064pGJsJDsTsei-pInFRz5INWA==@protonmail.internalid>
	<2024121309-lethargic-ended-5f99@gregkh> <87ttb7d24p.fsf@kernel.org>
	<hmmCwoNftQc5Mj4BLjFC2qTABem8CvuXSx3ucXzjIfQSwLjULmZgsw7vpq3Zxy0kk5H3Zjpz-vd4d7E1sb4LHw==@protonmail.internalid>
	<2024121344-excusably-resurrect-d01a@gregkh>
Date: Mon, 16 Dec 2024 10:51:53 +0100
Message-ID: <87h674c5vq.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Greg KH" <gregkh@linuxfoundation.org> writes:

> On Fri, Dec 13, 2024 at 04:38:30PM +0100, Andreas Hindborg wrote:
>> "Greg KH" <gregkh@linuxfoundation.org> writes:
>> > On Fri, Dec 13, 2024 at 01:24:42PM +0100, Andreas Hindborg wrote:
>> >> "Greg KH" <gregkh@linuxfoundation.org> writes:
>> >> > On Fri, Dec 13, 2024 at 12:30:45PM +0100, Andreas Hindborg wrote:
>> I'm not getting a clear reading on the following, perhaps you can
>> clarify:
>>
>>  - Is the community aligned on dropping module parameters for all new
>>    drivers?
>>    - If so, was this decided upon at some point or is this a fluid
>>      decision that is just manifesting now?
>
> It's something that I've been saying in review comments of drivers for
> many many years now.  Again, it was one of the main reasons we created
> configfs and sysfs all those decades ago, because module parameters just
> do not work properly for drivers in almost all cases.

Thinking a bit about this - are you sure there are no situations where
module parameters is actually the right choice? I could imagine deeply
embedded deployments, potentially with all required modules linked in to
a static kernel image. It is probably desirable to be able to pass
configuration to the modules via the kernel command line in this
situation. If not for configuration in the field, then for a development
situation.

Surely there are also situations in regular PC setups where it is
desirable to pass configuration data to a module, so that it is
available at load time. With configfs, module initialization becomes a
two stage process of first loading and then configuring. That is not
always what you would want.

Since module parameters actually do show up in sysfs as writable
entries, when the right flags are passed, they do feel very similar to
sysfs/configfs for simple use cases. What are the reasons they should
not be usable for these simple use cases?

>
>>  - Does this ban of module parameters also cover cases where backwards
>>    compatibility is desirable?
>
> No, we don't break existing kernel features, but if you are writing a
> new driver, don't add them and then there's no compatibility issue.
>
> We don't normally allow "rewrites" of drivers, but if we do, yes, you
> would have to implement the old features if needed.
>
> As you just seem to want to write an "example" block driver, no need to
> add the module option there, just do it right this time in how to
> properly configure things.
>
>>  - Can we merge this so I can move forward at my current projected
>>    course, or should I plan on dealing with not having this available?
>
> We generally do not want to merge apis without any real users, as it's
> hard to justify them, right?  Also, we don't even know if they work
> properly or not.

While null_blk is just a piece of testing infrastructure that you would
not deploy in a production environment, it is still a "real user". I am
sure we can agree on the importance of testing.

The exercise I am undertaking is to produce a drop in replacement of the
existing C null_blk driver. If all goes well, we are considering to swap
the C implementation for the Rust implementation in X number of years.
Granted - a lot of things have to fall into place for that to happen,
but that is the plan. This plan does not really work well if the two
modules do not have the same interface.

I understand that you would like to phase out module parameters, but I
don't think blocking their use from Rust is the right way to go about
that task. If you really feel that module parameters have no place in
new drivers, I would suggest that to be part of review process for each
individual new driver - not at the stage of enabling module parameters
for Rust in general.


Best regards,
Andreas Hindborg




