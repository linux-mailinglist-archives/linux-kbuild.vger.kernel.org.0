Return-Path: <linux-kbuild+bounces-6299-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 364C9A6CC05
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Mar 2025 20:40:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 38A777A7F26
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Mar 2025 19:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D67222A7E5;
	Sat, 22 Mar 2025 19:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Tdc+X3Ns"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81F4191484;
	Sat, 22 Mar 2025 19:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742672396; cv=none; b=N6EUXj8rf2c8WkF06eAQRcrfmD/Qhaz5iWUBJAA6qeO6aOmuuHgBzncDYN0cVnmVs5uhznhujP2nNJ9OrUVaqx0Zq2OpMp4zE6zxicA08Hg8zu6WkBRUGtR8E37thNnXpjhpbmQYf9bg2LK+VIn9QZv2r/nVGOmc2lWg8+C0/Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742672396; c=relaxed/simple;
	bh=8OIq+Wo2/zDD1QwxwJjjI9ONHTCHeAVVjhcHDxNT/AU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E0Kj3uHufeNIxLigE/WbsN3wPvxvFGDPCaUCTi8FDTJkuK1UoSPtxKVBevOka2Ub+CpYfjpiRPoQbI9xZ17nQTI5KqbXCoCXYU/Ti5ZtF2Q+ez3mOkrhyRx6+CmAJ/KkeWhFcw6fJ59VKcxhWnD8Q78pu8pvuiLHNNf+90WIVCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Tdc+X3Ns; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742672383; x=1742931583;
	bh=hAdqcXvwa0PQGT2crMzS062EBahsO4Cp53FtPgBMQZI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Tdc+X3NsaC/WuIS59HZy6te+B+06GuQWHBQXdUcndBy/u6joaYcjAoVjieJ2A4XIg
	 6AvJn4swmcuLe4WCHlp8qhllPqfo+sRRbAbGiWV9j4x+FJazFazOOBIAU1j5gOKzbX
	 IfBfYsSWEfL6bq5XNPyCd2Zy+V4E56AqVm6UrK5f2QKtlVpIAj1W2jsREz6NdtdgjU
	 I60IQMTXviGPREE4et/bp4EWPMKHrKFgztX+avQpXM+17YMstpRkQNQVNY/W+l8UPZ
	 UdV0z4vCH6BflMoFJPv1+keHVbMCrDv8IjKiYWa4IPbt94z6Gkibrigrm0Up8lqe/F
	 rNltqkVlfZ9HQ==
Date: Sat, 22 Mar 2025 19:39:35 +0000
To: Antonio Hickey <contact@antoniohickey.com>, tamird@gmail.com
From: Benno Lossin <benno.lossin@proton.me>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, gary@garyguo.net, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu, ojeda@kernel.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v5 01/17] rust: enable `raw_ref_op` feature
Message-ID: <D8N1SQ8V7WAQ.21T9FK0YDMKLK@proton.me>
In-Reply-To: <20250322191210.1926380-1-contact@antoniohickey.com>
References: <CAJ-ks9=GHVfd=iRT73DviOD=6dio3U7wQWLaXAhKr3UG5-ivvw@mail.gmail.com> <20250322191210.1926380-1-contact@antoniohickey.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 185d5a219f79634731a58c4f9b2a4c4e5134d453
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat Mar 22, 2025 at 8:12 PM CET, Antonio Hickey wrote:
> On Sat, Mar 22, 2025 at 02:24:30PM -0400, Tamir Duberstein wrote:
>> On Sat, Mar 22, 2025 at 11:08=E2=80=AFAM Antonio Hickey
>> <contact@antoniohickey.com> wrote:
>> > On Sat, Mar 22, 2025 at 10:16:01AM +0000, Benno Lossin wrote:
>> > > On Thu Mar 20, 2025 at 3:07 AM CET, Antonio Hickey wrote:
>> > > > Since Rust 1.82.0 the `raw_ref_op` feature is stable.
>> > > >
>> > > > By enabling this feature we can use `&raw const place` and
>> > > > `&raw mut place` instead of using `addr_of!(place)` and
>> > > > `addr_of_mut!(place)` macros.
>> > > >
>> > > > Allowing us to reduce macro complexity, and improve consistency
>> > > > with existing reference syntax as `&raw const`, `&raw mut` are
>> > > > similar to `&`, `&mut` making it fit more naturally with other
>> > > > existing code.
>> > > >
>> > > > Suggested-by: Benno Lossin <benno.lossin@proton.me>
>> > > > Link: https://github.com/Rust-for-Linux/linux/issues/1148
>> > > > Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
>> > >
>> > > Reviewed-by: Benno Lossin <benno.lossin@proton.me>
>> > >
>> > > > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
>> > > > index 993708d11874..a73aaa028e34 100644
>> > > > --- a/scripts/Makefile.build
>> > > > +++ b/scripts/Makefile.build
>> > > > @@ -224,9 +224,9 @@ $(obj)/%.lst: $(obj)/%.c FORCE
>> > > >     $(call if_changed_dep,cc_lst_c)
>> > > >
>> > > >  # Compile Rust sources (.rs)
>> > > > -# ---------------------------------------------------------------=
------------
>> > > > +# ---------------------------------------------------------------=
-----------------------
>> > >
>> > > Not sure about this change.
>> >
>> > This change is so I could enable the `raw_ref_op` feature for doctests
>> > since the minimum Rust version 1.78 still has `raw_ref_op` as an
>> > expiramental feature, and will throw errors at compile if a doctest us=
es
>> > it. Is there a better way to do this?
>>=20
>> I think Benno is just asking about the extension of the dashed line.
>
> Ahh ok yea that makes sense, thanks Tamir, sorry Benno I misunderstood.

No worries, it is exactly as Tamir said.

> So the reason I extended the dashed line was because before my change=20
> the dashed line perfectly aligned with number of characters in the line
> I changed. I figured it was supposed to match the amount of characters
> of the line.
>
> Giving this a deeper look it looks like the all the other dashed lines
> are maxed at 77 characters.=20

Yeah that's also what I thought, so I wouldn't change it.

> I will update this.

If you send another version, you can update this, but Miguel might pick
the patch early, he can then remove the change above when taking the
patch (so I wouldn't send a new version just to change this single
line).

---
Cheers,
Benno


