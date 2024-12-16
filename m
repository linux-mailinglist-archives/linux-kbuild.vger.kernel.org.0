Return-Path: <linux-kbuild+bounces-5148-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1A39F311C
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Dec 2024 14:05:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFAC2167375
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Dec 2024 13:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F24B205AAF;
	Mon, 16 Dec 2024 13:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OmUM3MzI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556D9205AA8;
	Mon, 16 Dec 2024 13:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734354283; cv=none; b=TnIby+GaK61j40/pbUOGKEPVlWjwEmLI1k64q9b2BwYLxE1qeUm8MRGWYzzm/gPXvsO6tmK+guqo8V2/tgkQRgLJ0vALVTBompFOqXe1WYLaQTkTJzIs0m4xjXlRTYN59oBffkAUPQRQMdpms+sYibRonsdlIf4kCQDXov+FaAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734354283; c=relaxed/simple;
	bh=eylFtlt+D1nMs4Kr2AdBSKfYkzq/ytXdN+IbrCnKg6w=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=qnGGfgtQXP4CfK8TdHTtPOgVlfsSzL0d/2QNjHlSNaS5vc1i5VjifdF18w6KOAVgxcIrVGFc7ciYg+W2YFIuFO6jgBP9q+j+1embpWqC1RMhC1Y31GgSdGWXp3S5GZu8fmir1M9g11R+sQq5bsHs+vm5Bp+5O9O8LaT++skUDt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OmUM3MzI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1674AC4CED0;
	Mon, 16 Dec 2024 13:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734354282;
	bh=eylFtlt+D1nMs4Kr2AdBSKfYkzq/ytXdN+IbrCnKg6w=;
	h=From:To:Cc:Subject:In-Reply-To:Date:References:From;
	b=OmUM3MzIJa42r+F4w/AEJqDoZ/Igz5md6C0oehl4K/WT4om1VRFXMZhrzDkHQXcCJ
	 L/TcNCJcGsvY730qSBhcp1dGwpHU8Ck1MUMrLUWcfjB+GXEERp7iTRg49qD8pNuYMi
	 /C3O0Joc3GF3bcCegZ5sul5bb2+/iVmfOo9V4gL43uuu75JsZq7KkvtPyq0YfIkniy
	 R0RGwbOQ/s7/GJyY3RUXqN5vm9+Cj7HWqPdGftoy1WfDWK7VqglihEDhdfRq5q5LJ8
	 Ku9NHViUZe6hcPfD+5+gGUuKP3IEPAM5gyAPnORBcT/zzyHooQ+3Sne3pApfYnmTi4
	 DRZUf8sAOoAcg==
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
  <linux-kbuild@vger.kernel.org>,  "Jens Axboe" <axboe@kernel.dk>, Tamir
 Duberstein <tamird@gmail.com>
Subject: Re: [PATCH v3 0/4] rust: extend `module!` macro with integer
 parameter support
In-Reply-To: <2024121637-postcard-fled-f72c@gregkh> (Greg KH's message of
	"Mon, 16 Dec 2024 13:23:17 +0100")
Date: Mon, 16 Dec 2024 14:02:51 +0100
Message-ID: <8734inbx1g.fsf@kernel.org>
References: <4Dsa69UGULRGsMbRbwOJNp_puyfsSSFt1QTcYU9AL4azd8vbfEFFtc7YNSsGegc40AfCZqVqZETfxg4TggUlSw==@protonmail.internalid>
	<2024121324-overdue-giggly-bdb8@gregkh> <87frmrepo5.fsf@kernel.org>
	<I0v8YGJe3e1ex1oF3mki-7QKimYLCJHnBy6g1taHgoOFvpNmQSrSnsMGJyGS064pGJsJDsTsei-pInFRz5INWA==@protonmail.internalid>
	<2024121309-lethargic-ended-5f99@gregkh> <87ttb7d24p.fsf@kernel.org>
	<hmmCwoNftQc5Mj4BLjFC2qTABem8CvuXSx3ucXzjIfQSwLjULmZgsw7vpq3Zxy0kk5H3Zjpz-vd4d7E1sb4LHw==@protonmail.internalid>
	<2024121344-excusably-resurrect-d01a@gregkh> <87h674c5vq.fsf@kernel.org>
	<2024121646-shelve-series-5319@gregkh>
	<arHhf7EJZ2Jz30EulJJ9kZocB7g4zPMCB860dL0xoZF5arcB9XHjWC3I8xuSgptqH83JZkjF7Niin4tVfitivA==@protonmail.internalid>
	<2024121637-postcard-fled-f72c@gregkh>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Greg KH" <gregkh@linuxfoundation.org> writes:

> On Mon, Dec 16, 2024 at 01:14:16PM +0100, Greg KH wrote:
>> On Mon, Dec 16, 2024 at 10:51:53AM +0100, Andreas Hindborg wrote:
>> > The exercise I am undertaking is to produce a drop in replacement of the
>> > existing C null_blk driver. If all goes well, we are considering to swap
>> > the C implementation for the Rust implementation in X number of years.
>> > Granted - a lot of things have to fall into place for that to happen,
>> > but that is the plan. This plan does not really work well if the two
>> > modules do not have the same interface.
>>
>> Why do you have to have the same interface?  Why not do it "properly"
>> and make it use configfs that way you can have multiple devices and test
>> them all at the same time?
>
> Wait, null_blk already uses configfs, so just use that!  I'd like to see
> the rust bindings for that api as that will be needed by lots of code.

I intend to support both.


Best regards,
Andreas Hindborg




