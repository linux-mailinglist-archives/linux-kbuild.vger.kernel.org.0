Return-Path: <linux-kbuild+bounces-5147-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D76859F3116
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Dec 2024 14:04:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 424797A155F
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Dec 2024 13:04:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E86F92046B3;
	Mon, 16 Dec 2024 13:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DUDqiH2d"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97B11FF7B0;
	Mon, 16 Dec 2024 13:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734354278; cv=none; b=D8pQYobpt2vtkNJK856OSn19451i7Gy0P3WSKJJQEjYBha3fypBtSFyx66ux5l5Ox66wHXSNm78nfIgiOY/TiXsGew2rgNBE61a37Tw+blIh2Tg2CCuHNO6vXyTKxdK/S+JnQ+nhPbdq/s58UoeNlomVg3XSyx6490Wzz++Mb/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734354278; c=relaxed/simple;
	bh=UfjTc9LIrPJm2Rs7X6W6aYw8jkgCCZczPYg5hDR7u04=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=XifEPAbL6LouD9jQf32Tr2KJSVuCsvuZHwW2r3ik2C20/bvvn316ktVBr5IEKGlYZ3YWg6WrBFadxPmO+cQqFPVntn4agJAXZ7iE6zaoPULcu7Wj1pFMI/KTyMrk5TPItoN4ERDlcNqkW69XQuNHWFUhR0+BZbpa3cJWQHbps9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DUDqiH2d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8858C4CED0;
	Mon, 16 Dec 2024 13:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734354278;
	bh=UfjTc9LIrPJm2Rs7X6W6aYw8jkgCCZczPYg5hDR7u04=;
	h=From:To:Cc:Subject:In-Reply-To:Date:References:From;
	b=DUDqiH2dsVwKpuBWmUr8kf0LAzrKb9EiizjTmbgie1aryVBmm8W3JiCFruLy/RSa5
	 VSvvidiWaVRa3ZkCpiv3yOWIsCS4W6XxaxTbkDLGsGuLSrcgl7ms+qH5N5gXeGsPsS
	 iLeX7NkHKtJfOnP5QblVl8RholHS/PFwS62/JOkQ23HtNjX8aAL5cWbRHXBlmq02dX
	 B3OzVnzA2OOVOPuUsYGchJrlJUbqKH6rIQ3EXDDOfUOCewNPpr7HXjhWfAPx1Pug1F
	 FTAkplXdiB/kGhf0WHB9C/Rq6tfHSrNeKruu+tIDpviqwjWNU6SJneRDOIKjX00kdv
	 eccV2iPIGKyHQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Greg KH" <gregkh@linuxfoundation.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?us-ascii?Q?=3D=3Futf-8=3FQ=3FBj=3DC3=3DB6rn=3F=3D?=
 Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,
  "Masahiro Yamada" <masahiroy@kernel.org>,  "Nathan Chancellor"
 <nathan@kernel.org>,  "Nicolas Schier" <nicolas@fjasle.eu>,  "Trevor
 Gross" <tmgross@umich.edu>,  "Adam Bratschi-Kaye" <ark.email@gmail.com>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-kbuild@vger.kernel.org>,  "Jens Axboe" <axboe@kernel.dk>
Subject: Re: [PATCH v3 0/4] rust: extend `module!` macro with integer
 parameter support
In-Reply-To: <2024121646-shelve-series-5319@gregkh> (Greg KH's message of
	"Mon, 16 Dec 2024 13:14:16 +0100")
Date: Mon, 16 Dec 2024 14:02:01 +0100
Message-ID: <877c7zbx2u.fsf@kernel.org>
References: <20241213-module-params-v3-v3-0-485a015ac2cf@kernel.org>
	<4Dsa69UGULRGsMbRbwOJNp_puyfsSSFt1QTcYU9AL4azd8vbfEFFtc7YNSsGegc40AfCZqVqZETfxg4TggUlSw==@protonmail.internalid>
	<2024121324-overdue-giggly-bdb8@gregkh> <87frmrepo5.fsf@kernel.org>
	<I0v8YGJe3e1ex1oF3mki-7QKimYLCJHnBy6g1taHgoOFvpNmQSrSnsMGJyGS064pGJsJDsTsei-pInFRz5INWA==@protonmail.internalid>
	<2024121309-lethargic-ended-5f99@gregkh> <87ttb7d24p.fsf@kernel.org>
	<hmmCwoNftQc5Mj4BLjFC2qTABem8CvuXSx3ucXzjIfQSwLjULmZgsw7vpq3Zxy0kk5H3Zjpz-vd4d7E1sb4LHw==@protonmail.internalid>
	<2024121344-excusably-resurrect-d01a@gregkh> <87h674c5vq.fsf@kernel.org>
	<UW-ATumT4L-13ZXX-lO1inQGeZK7VgQWNAHE3688ulGj-rvzxWkUdrmnAUlufI1W5-9d6vzH3TXZ4VOmYh9wxA==@protonmail.internalid>
	<2024121646-shelve-series-5319@gregkh>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Greg KH" <gregkh@linuxfoundation.org> writes:

> On Mon, Dec 16, 2024 at 10:51:53AM +0100, Andreas Hindborg wrote:
>> "Greg KH" <gregkh@linuxfoundation.org> writes:
>>
>> > On Fri, Dec 13, 2024 at 04:38:30PM +0100, Andreas Hindborg wrote:

[cut]

>> >
>> >>  - Can we merge this so I can move forward at my current projected
>> >>    course, or should I plan on dealing with not having this available?
>> >
>> > We generally do not want to merge apis without any real users, as it's
>> > hard to justify them, right?  Also, we don't even know if they work
>> > properly or not.
>>
>> While null_blk is just a piece of testing infrastructure that you would
>> not deploy in a production environment, it is still a "real user". I am
>> sure we can agree on the importance of testing.
>>
>> The exercise I am undertaking is to produce a drop in replacement of the
>> existing C null_blk driver. If all goes well, we are considering to swap
>> the C implementation for the Rust implementation in X number of years.
>> Granted - a lot of things have to fall into place for that to happen,
>> but that is the plan. This plan does not really work well if the two
>> modules do not have the same interface.
>
> Why do you have to have the same interface?  Why not do it "properly"
> and make it use configfs that way you can have multiple devices and test
> them all at the same time?
>
> As this is "just" a testing driver, there should not be any need to keep
> the same user/kernel api for setting things up, right?

Because that would break all the users that use the old interface.

>
> Again, don't make the mistakes we have in the past, drivers should NOT
> be using module parameters.
>
>> I understand that you would like to phase out module parameters, but I
>> don't think blocking their use from Rust is the right way to go about
>> that task. If you really feel that module parameters have no place in
>> new drivers, I would suggest that to be part of review process for each
>> individual new driver - not at the stage of enabling module parameters
>> for Rust in general.
>
> I'm saying that module parameters do NOT belong in a driver, which is
> what you are wanting to do here.  And as for adding new apis, please
> only do so when you have a real user, I don't see a real user for module
> parameters in rust just yet.  If that changes, I'll reconsider my stance :)

I guess we disagree about what is "real" and what is not.

In my view, null_blk is real, it is used by real people to do real work.
They get real annoyed when the interface for their real tools change -
thus making it more difficult to do this experiment.


Best regards,
Andreas Hindborg



