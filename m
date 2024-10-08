Return-Path: <linux-kbuild+bounces-3975-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 731F7995745
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 20:56:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 064CBB233D8
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 18:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F966212EE0;
	Tue,  8 Oct 2024 18:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ryhl.io header.i=@ryhl.io header.b="gYuKPtzH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JXexH/kh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F51212D34;
	Tue,  8 Oct 2024 18:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728413795; cv=none; b=DedT6msjP8B9m232qx446fi2IjuZcx9hqzCWSo5pwxs/0uVa/+uEAgvFgOL/4wdHZrh5oYDjBsxE34wHgLCzRf/pn9yaNDDAeMDxIDhy9jVsYxGbqbreOMNS3AvIh/89nN2eg7GxYM6fx80EWnWo3ewPz1vSNmrNz1kCC/swCRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728413795; c=relaxed/simple;
	bh=pDEam0rUV3QvFqgyfrWjZyzPAe1YMYhawRJ502QgZ8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JpMnW6slyp+K4fREGvea0sIOvAhYLF5tQg4E6UaXlI3NKfbWZN7yy2XM+R/psED34YbVb0ahh8X14P4tqAMYT60+2YQlzG0uJXlh1S7hrsRW/AD1ZEkZ5ZZUScH7cZcGkUVIFphswMaWd80L5G/mFVyW/mLO62juBDiTLpqc46E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ryhl.io; spf=pass smtp.mailfrom=ryhl.io; dkim=pass (2048-bit key) header.d=ryhl.io header.i=@ryhl.io header.b=gYuKPtzH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JXexH/kh; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ryhl.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ryhl.io
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id EFDB71140180;
	Tue,  8 Oct 2024 14:56:31 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Tue, 08 Oct 2024 14:56:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ryhl.io; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1728413791;
	 x=1728500191; bh=Mp9sSOkhA60bEzaKqc8EqPv2u+ZvFtulZIcI7m23+T8=; b=
	gYuKPtzH5gKz9cApyRUZrQBHBmVpOe0vZ2uuL9BL7Nx5Xwi2BJ1nXoGKF8v7Aw+p
	PZjG2rVtV6cFekNVk0qlOmH7nyRsYw+HE1l8l0x/Zp7PggkBWFnzz2Q38YVHbSR9
	2B1DbXeaYG96p1jMJ2Y62trM6Q2fRo/lJhA0F9XM60AmJObLPnut4zNzu9amyP0I
	lozA7zE9ICs2EdjKxd4tMBKo9MuAqXCM5QZB8131+jN6K4ujzpg+HQ4vR8vKM+Zd
	l+wmqMl/TF23m8vfwhNNCsk5USHGpYX0PgsHCHoHbqu24OV8WP9Ic0OyFLOOFlBi
	cGyJNadMmwpuyq2P3aFXxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728413791; x=
	1728500191; bh=Mp9sSOkhA60bEzaKqc8EqPv2u+ZvFtulZIcI7m23+T8=; b=J
	XexH/kh0BryxkDONpaAomGs/Irs5QO+mftStUNkMdxf5IAwBXXzA3MkJapp+y/uv
	ZecCl2i1NcaIiRq8P/CYMaJd4Cv0xI2nHKWOQYoL4BRhPbmSrUXXCFwcYcfqEX9Q
	k1++Rc4emum5cH3BqP8o9LZYPTRmBbpl8pjsun55GgmyxL7+Ct7wyIoQY49wwpOW
	lvUvMRiOGN31T43yDVZeUMPEYmxeCr8MAVUPQ3+6R5ZBygE4t7xuGzUUa/Yk5CQX
	i9CJxy8j1ELxkNc+bcDcDOh8DATyCC6qgghYGR69pGjMpO+eRW/TjaY/mKkRiGAj
	t+ZiRvn4l2jzHILSh37qQ==
X-ME-Sender: <xms:X4AFZ32VXTGE5pWl2Up2hxfZ4PoICkXfeu06BTrUrmaZQrPTysDOQA>
    <xme:X4AFZ2EQWZYvunihKUUfZ7JNH_VYcUxrewixv1d7P616fvPM3ZIUYwoB4USY0EL_i
    Tb8OpHKsrJ0X5XUUQ>
X-ME-Received: <xmr:X4AFZ353bzec2n2SWazGHyPdOiqABZi7Fy15bqdNU-aW43ydKCFqgRGKyzdS9ADyqaRQ63rdNcq4hzP248PSn32A-7Fx3yaGbisb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdefuddgudefvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddv
    jeenucfhrhhomheptehlihgtvgcutfihhhhluceorghlihgtvgesrhihhhhlrdhioheqne
    cuggftrfgrthhtvghrnhepgfduleegleehieelhefgjeegleeffeeliefgtdfgteeflefg
    fedvgefgvdetjeetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhitggvsehrhihhlhdr
    ihhopdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
    eprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepmhgrshgrhhhi
    rhhohieskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehnihgtohhlrghssehfjhgrshhlvgdrvghupdhrtghpthht
    ohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnh
    horhesghhmrghilhdrtghomhdprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghi
    lhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtth
    hopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomh
X-ME-Proxy: <xmx:X4AFZ82A3HDiuNRku0aRWRQYysbcZGWpIoMh4h9h1DXlTNeVvIIUGg>
    <xmx:X4AFZ6HJ2uhhU-nqSmzxC5Tv1ABxsC01M_ewl00TP1X1thBmPdxWIQ>
    <xmx:X4AFZ98bobVd-73hd_O32Dn_A0FBp4ruRjvx20dRORAigd0ZWit8EA>
    <xmx:X4AFZ3nJ1Jo7sa4qTs2ae9TmTT9Xth2XBMvoeQqv7yO-ONuYfk0OUQ>
    <xmx:X4AFZ4Ff7nz2BnlfPFqAbbvo59AKsI5q_qkNR4lVFmRNnXHB4nLrKG_W>
Feedback-ID: i56684263:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Oct 2024 14:56:28 -0400 (EDT)
Message-ID: <e4a8e9c5-8c74-4fa3-87de-db25356e450b@ryhl.io>
Date: Tue, 8 Oct 2024 20:59:31 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Kbuild: add RUSTC_BOOTSTRAP to rustc-option
To: Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20241008-rustc-option-bootstrap-v1-1-9eb06261d4f7@google.com>
 <CAH5fLgieyO79OnLbFik5awASQub0VDErZmbrcQECDr-e41_ohg@mail.gmail.com>
Content-Language: en-US, da
From: Alice Ryhl <alice@ryhl.io>
In-Reply-To: <CAH5fLgieyO79OnLbFik5awASQub0VDErZmbrcQECDr-e41_ohg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/8/24 4:24 PM, Alice Ryhl wrote:
> On Tue, Oct 8, 2024 at 3:49 PM Alice Ryhl <aliceryhl@google.com> wrote:
>>
>> When using unstable features with the Rust compiler, you must either use
>> a nightly compiler release or set the RUSTC_BOOTSTRAP environment
>> variable. Otherwise, the compiler will emit a compiler error. This
>> environment variable is missing when rustc-option is executed, so add
>> the environment variable.
>>
>> This change is necessary to avoid two kinds of problems:
>>
>> 1. When using rustc-option to test whether a -Z flag is available, the
>>     check will always fail, even if the flag is available.
>> 2. If KBUILD_RUSTFLAGS happens to contain any -Z flags from the
>>     environment, even if unrelated to the flag being tested, then all
>>     invocations of rustc-option everywhere will fail.
>>
>> I was not actually able to trigger the second kind of problem with the
>> makefiles that exist today, but it seems like it could easily start
>> being a problem due to complicated interactions between changes. It is
>> better to fix this now so it doesn't surprise us later.
>>
>> I added the flag under try-run as this seemed like the easiest way to
>> make sure that the fix applies to all variations of rustc-option,
>> including new ones added in the future.
>>
>> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> 
> It should be "export". Also, this doesn't seem to be sufficient at
> all. Now I'm running into this error:
> 
> make[1]: Entering directory '/home/aliceryhl/lout'
> warning: ignoring --out-dir flag due to -o flag
> 
> error[E0463]: can't find crate for `std`
>    |
>    = note: the `aarch64-unknown-none` target may not be installed
>    = help: consider downloading the target with `rustup target add
> aarch64-unknown-none`
>    = help: consider building the standard library from source with
> `cargo build -Zbuild-std`
> 
> error: aborting due to 1 previous error; 1 warning emitted
> 
> For more information about this error, try `rustc --explain E0463`.
> 
> I think this patch is going to need more work. Sorry for sending it prematurely.
v2 is here:
https://lore.kernel.org/all/20241008-rustc-option-bootstrap-v2-1-e6e155b8f9f3@google.com/

