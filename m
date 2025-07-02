Return-Path: <linux-kbuild+bounces-7846-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0995EAF5D38
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 17:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7D0B7B606C
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 15:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8665B315539;
	Wed,  2 Jul 2025 15:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fSRIFJpu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042E531550A
	for <linux-kbuild@vger.kernel.org>; Wed,  2 Jul 2025 15:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470078; cv=none; b=cm4nAuWh7EeRzwjhSv/nBt33HmflBdJrEFcVvUnoWf5tqBRUf+jjnN4hOl8WNwbwU7UgFFbXVquIypdYWI8xNeAxvewWmbOzW9R9u2WlOYC0rcpNbYoLtg+LbIMgWCYNR+9n2Ez55DIdecus6nWEWH3EUT1bDP66I2DSFCF5EVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470078; c=relaxed/simple;
	bh=R3w2XCZ+9hC/UQRD0VOIOyl0Fwy/AYwdVSqZytDRbyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QdmCASlenfHc6EH8ot50UB/N7+0Zu+maaqNkMXUo3f7RJ/q+TMLGsUAMh0AJmcTlY+P8GTeZXV1wBeMwa5sEPLVq9s0dajYvXkZsw8uzUj0niRrUy1Zjl5XOBNtSJeHtRIkpf2fis9dgx4uBbJQjc5fbMOcZb/7PhPkzZPobtXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fSRIFJpu; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-453749af004so39074705e9.1
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Jul 2025 08:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751470073; x=1752074873; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugfvMw37FYCbNgp16hJSt7OdezX3ZWc2zEhd8WWY3I4=;
        b=fSRIFJpuj7EbDCIioeymFx4JpGmeIBGUU8TNs2Sms+ZzpNxPexJaygwc5h8jJjC2kh
         h3GjtjDlVwuNtZAizzbxzdybHmIO5zRDx3J9V9c+jX8C+h648/XqhIWcA1jfPfeZR9O0
         keB+6i+zgTBlWaET3Y3/oPjvY9QcU1WUObl0VHr2uLw2rcSxNCKhF4w909PmbLbf8ysC
         66TrsnLYfhmQBMsy9rErWxotOedb5jOOI/j5kH0a+bOayASKLHwWyC5Dpf+E3gchb51M
         BHdprCwvo3QGnXASC1fryotJTfXSeMS4GadXHyyLduDGbkBw+7t2Td1WtIIsYIxaPDw2
         4KaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470073; x=1752074873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugfvMw37FYCbNgp16hJSt7OdezX3ZWc2zEhd8WWY3I4=;
        b=Ot56gpFV+8J9QiV+dT/oodvUMZOujc4hRwr9Xvoa5l+xDVpFCWzQcljunjunqvgAkr
         nYWX3Jv8NR/cFO7T7Xc+XHBj40eWM2epn3A0Q4SAV76Q21s4qkxBbpx3b6y1FJrd6Jb1
         iZ0QOgSGzI0rx3wVYJimuOGbikNkkXe8hELMBHK5fhuqTfGR+Y3X6Wd/DwHt0xN/zmPi
         W+yym/Wy/yVpprZA5IjUmoFbh2YyB4QkNeuOlpp2jKwQthLlhqb6r9haggsbE4WK33Ms
         qGF3NvjCTDvNyitV9Z77CrzRA5kJyuURPmTURZGXM/aMn5OKTV6jfw0CS7OFajYhzHB6
         eHEA==
X-Forwarded-Encrypted: i=1; AJvYcCXb4nmFO+wmWHJrG8pqBmZd/pJDwSPNPHOa0AjoVA3F9jEOWdbrnnQy19NZ5Rc0fa+lqv6j9/ZOseH5/ZA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4XsRRkzRRp9ewkOjgOgLB0n9QpuZG5AkHrTC7ZZveg01eZM2U
	VCYu3FJbWmh45AOKqlU8ahoXsAUy4KIY/OeiCiP6d3IY7n7zCWgYrMeznzMlXDWmHNo0JPlKW0B
	0o4sB3JzY/4BYfTuChSEscsJYxh7kAs3Y9CZiXP0a
X-Gm-Gg: ASbGnctk+s2KPvpxhkiSqWy6htslEFnTuF0bqoTaWZs9TQTJFa/VNT5/SwEGfzx5BGC
	DU9w1jK2hElhKRZatalnBNj6fE1dklBoxrC79xCp/4pWUDrGxlcbE3j49O9ybYF4sDD4BtJAwGq
	bMllJ/nFR15eU3Iq2t1+scNtqPhhLyp+XsrtSutvFMM66K
X-Google-Smtp-Source: AGHT+IEXxgvMAbbclIedX4dgfJFsqC/LVdMO+VKlBTNEwybEIPdTuBzGSh5PvnP88V7tuXnmlGMxd5H2vPZ17Yd18gg=
X-Received: by 2002:a05:6000:2891:b0:3a5:527b:64c6 with SMTP id
 ffacd0b85a97d-3b1fd74c9bbmr3330783f8f.1.1751470073141; Wed, 02 Jul 2025
 08:27:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
 <20250702-module-params-v3-v14-1-5b1cc32311af@kernel.org> <DB1NVTWHU7BN.2WGPMAY9LQYNW@kernel.org>
In-Reply-To: <DB1NVTWHU7BN.2WGPMAY9LQYNW@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 2 Jul 2025 17:27:41 +0200
X-Gm-Features: Ac12FXw61cMF6EsKoC5KmH0MvT9whf775volIzyT9NHNJ14IR5rW7yw5x1K4H9c
Message-ID: <CAH5fLgiOK-zA0qT1dis-BsrEAk96R+E8e_F_361w7kCq_uxn7g@mail.gmail.com>
Subject: Re: [PATCH v14 1/7] rust: sync: add `OnceLock`
To: Benno Lossin <lossin@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Trevor Gross <tmgross@umich.edu>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 5:07=E2=80=AFPM Benno Lossin <lossin@kernel.org> wro=
te:
>
> On Wed Jul 2, 2025 at 3:18 PM CEST, Andreas Hindborg wrote:
> > +impl<T: Copy> OnceLock<T> {
> > +    /// Get a copy of the contained object.
> > +    ///
> > +    /// Returns [`None`] if the [`OnceLock`] is empty.
> > +    pub fn copy(&self) -> Option<T> {
> > +        if self.init.load(Acquire) =3D=3D 2 {
> > +            // SAFETY: As determined by the load above, the object is =
ready for shared access.
> > +            Some(unsafe { *self.value.get() })
> > +        } else {
> > +            None
> > +        }
>
> The impl can just be:
>
>     self.as_ref().copied()
>
> Would it make sense for this function to take `self` instead & we make
> the `OnceLock` also `Copy` if `T: Copy`? Maybe not...

Atomics are not Copy.

Alice

