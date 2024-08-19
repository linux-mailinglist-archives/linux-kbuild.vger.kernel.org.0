Return-Path: <linux-kbuild+bounces-3104-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3F8957750
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Aug 2024 00:17:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7BD75B22BA9
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 22:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DEBE1DD382;
	Mon, 19 Aug 2024 22:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="fSpaVk9H"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB8D1DC48F;
	Mon, 19 Aug 2024 22:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724105827; cv=none; b=YoAnx+EyGq5oj0djmowLQNlc9D45Y9/Pu7cYFNPfsS2fFwE2SQCby0V7AWo6tQs741IeynjMOgUsUshkVt3AAbSCFL+2DZRlh4jfol/8wfwnQa3lxh3eJFqyUMMXZPA3NCAcjcDzzIOLYwI5UXzA63N6l+lR2gav4PHlzqsckA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724105827; c=relaxed/simple;
	bh=R7+8ejfm5LfwZRlzV24x9z+7Bhp5JEOgxQj3MwJpXfY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HKflnJa3q75A54BYbPRKZtweUnTL7/DKdxEGDfUOulsiJ57A8BN47FVB9Sb6stgRNLQwAss/nxVrHq4UB6V8Hi7+g2MUfuuW6ucxVLCrxUyu3QtrWpjs7I0pQoqSwmLWqlZHuzTswP0TijlU9fPJMitHT79Dh7Qe1uOo0HDxcgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=fSpaVk9H; arc=none smtp.client-ip=185.70.40.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1724105817; x=1724365017;
	bh=e89MVHldFWcJh7oiV5+C6cy/kXf0bXpmNDeqvqwSpoI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=fSpaVk9HrII6K0E0c4wEwzkNsIpaS2sTNBW3fsPLOGV2qpW50VjvoyY1WIopc4Eq4
	 Q1s/JCBiWaSXCpn+jv43MHh9SXp9DXaPbdnoPOq0rLLe86DVgX6GouBrpGabxyqaAQ
	 1D5u9lAVRscjCqjAWkuCEnzJPwBM3d63OYxpdHkRfJ8ws5OhcoR8ZfrRwANJu83Fg+
	 7VTVlhvlebzRnRpVLItK3sLYNCKeo+aKWs0VSNfQTkmFSbEsLsJWZFjaqZe9y95DCl
	 /i7xQqOEYU2i1/kte/cwPBaz4EhzXBq62NqJdFWdpSwPjO2gsDWrZ00UrjNV/4uG6t
	 TAwKwvMJ/WFeA==
Date: Mon, 19 Aug 2024 22:16:53 +0000
To: Sami Tolvanen <samitolvanen@google.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 16/19] gendwarfksyms: Add support for reserved structure fields
Message-ID: <a76f9422-4001-416a-a31b-37ab7dcb17f4@proton.me>
In-Reply-To: <20240819193851.GA4809@google.com>
References: <20240815173903.4172139-21-samitolvanen@google.com> <20240815173903.4172139-37-samitolvanen@google.com> <2024081600-grub-deskwork-4bae@gregkh> <CABCJKuedc3aCO2Or+_YBSzK_zp9zB8nFwjr-tK95EBM3La1AmA@mail.gmail.com> <2024081705-overarch-deceptive-6689@gregkh> <ef6f7294-0afe-46af-8714-ed4a4aaee558@proton.me> <20240819193851.GA4809@google.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 7749e72b3fa03857e22ab659ccfdbfd44623f1cc
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 19.08.24 21:38, Sami Tolvanen wrote:
> Hi Benno,
>=20
> On Sat, Aug 17, 2024 at 01:19:55PM +0000, Benno Lossin wrote:
>>
>> For this use-case (the one in the patch), I don't really know if we want
>> to copy the approach from C. Do we even support exporting kABI from
>> Rust? If yes, then we I would recommend we tag it in the source code
>> instead of using a union. Here the example from the patch adapted:
>>
>>     #[repr(C)] // needed for layout stability
>>     pub struct Struct1 {
>>         a: u64,
>>         #[kabi_reserved(u64)] // this marker is new
>>         _reserved: u64,
>>     }
>>
>> And then to use the reserved field, you would do this:
>>
>>     #[repr(C)]
>>     pub struct Struct1 {
>>         a: u64,
>>         #[kabi_reserved(u64)]
>>         b: Struct2,
>>     }
>>
>>     #[repr(C)]
>>     pub struct Struct2 {
>>         b: i32,
>>         v: i32,
>>     }
>>
>> The attribute would check that the size of the two types match and
>> gendwarfksyms would use the type given in "()" instead of the actual
>> type.
>=20
> This definitely looks cleaner than unions in Rust, but how would this
> scheme be visible in DWARF? You might also need to expand the annotation
> to allow replacing one reserved field with multiple smaller ones without
> using structs.

Hmm that's a good question, I have no idea how DWARF works. The way you
do it in this patch is just by the name of the field, right?

If Rust's DWARF output contains exact types names (I just checked this,
I *think* that this is the case, but I have never used/seen DWARF
before), we might be able to just create a `KAbiReserved<T, R>` type
that you search for instead of the attribute. The usage would then be
like this:

    #[repr(C)]
    pub struct Struct1 {
        a: u64,
        _reserved: KAbiReserved<(), u64>,
    }

And then when adding a new field, you would do this:

    #[repr(C)]
    pub struct Struct1 {
        a: u64,
        b: KAbiReserved<Struct2, u64>,
    }

    /* Struct2 as above */

The way `KAbiReserved` is implemented is via a `union` (maybe a bit
ironic, considering what I said in my other replies, but in this case,
we would provide a safe abstraction over this `union`, thus avoiding
exposing users of this type to `unsafe`):

    #[repr(C)]
    pub union KAbiReserved<T, R> {
        value: T,
        _reserved: R,
    }

    impl<T, R> Drop for KAbiReserved<T, R> {
        fn drop(&mut self) {
            let val =3D &mut **self;
            unsafe { ptr::drop_in_place(val) };
        }
    }

    impl<T, R> Deref for KAbiReserved<T, R> {
        type Target =3D T;

        fn deref(&self) -> &Self::Target {
            unsafe { &self.value }
        }
    }

    impl<T, R> DerefMut for KAbiReserved<T, R> {
        fn deref_mut(&mut self) -> &mut Self::Target {
            unsafe { &mut self.value }
        }
    }

    impl<T, R> KAbiReserved<T, R> {
        pub fn new(value: T) -> Self {
            // we want to ensure that people don't accidentally use a bigge=
r type.
            build_assert!(size_of::<R>() >=3D size_of::<T>());
            Self { value }
        }

        pub fn into_value(self) -> T {
            unsafe { self.value }
        }
    }

This needs some more work, but is a lot cleaner than having the users
use raw unions + unsafe (essentially they would re-implement the code
above).

If you want me to turn the above into a patch let me know (also if you
or someone else wants to give it a try, then please go ahead! If you
need help, just send me a mail or a message on zulip).

---
Cheers,
Benno


