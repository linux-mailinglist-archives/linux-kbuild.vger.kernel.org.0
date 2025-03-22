Return-Path: <linux-kbuild+bounces-6297-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB31A6CBCB
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Mar 2025 19:26:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53163189DF7F
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Mar 2025 18:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E5491B6CE0;
	Sat, 22 Mar 2025 18:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gUAcD0ka"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4989443;
	Sat, 22 Mar 2025 18:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742667910; cv=none; b=mBgl+TjCf1UgKs4U0x6ROsEwyoF7tKnuqidoXfs3imyNYdk8d2TLLakZUpmTblhKKrL+LyQ1dXDPhONa0YLQL/6xJZAl5+l5bOoU6FspYooz3icRJXYp7fOHY68FhRB3UESKx1he56aP+TWI0TSD4BLm2NCtTDr3jv4Oj8VaWJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742667910; c=relaxed/simple;
	bh=sqwPs4TUCqi74GTS9yLChoE5rp3ZANM17jlum7yt8bY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=et+hqfCuJNslwuZDnxK90EeghimlOcDJmfr8T/SYJ8Pd0b7keSX8BddXWcGe8X/VwkLDj6QXS6SIzieN6at1osCH+pfMTiNzdUTGtOH7Bh9mptvMRRXTit+2XkMuyVvMwQ5xCGBr7SpHUjvhzyB1nWIKNleg0RasPiZxmf4OShc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gUAcD0ka; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30bf8f5dde5so28979721fa.2;
        Sat, 22 Mar 2025 11:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742667906; x=1743272706; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxEol1WRj8Ro+73zfFO/S9VSYOmTOWDoGmUM3zsjeI8=;
        b=gUAcD0kaJW2ZQje5BnWSclwSRs8hgdkmaPblkaANZruslzRGR5/1tggQ7cJjxZLQ7X
         am3i41+/IHiAC22VeTxE4dcS52Xdng1QK09ZtBu6Z+2TqT2ecG4sgLwwNmm7sIdhWbA0
         NygnQEeuA4PyTWjHiuvqrUwt01rQMyx+Gu9hckAwjHyn2BpY5dsvQc89WwzM5/Cu7d/X
         PzH1pgCshl1LPMNB/BWi5pdx8DECnarDj+jLaCrQlSa93dbKomDtV6HYAKXcSZxY+QeE
         /qquFhYIsR6VHtuc7W/incGMuVRxmSWJ0rTU9pV6ipQIJMQB/G/CpEsgQxXfAZJSyA2q
         EiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742667906; x=1743272706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qxEol1WRj8Ro+73zfFO/S9VSYOmTOWDoGmUM3zsjeI8=;
        b=Ce7bq/4ww/tuY2iOt3NJNvOUqZ3y1qEU3AiIax/M7GqmG0YdWPv7Pn24ddOUvtDkHS
         0g2dPCvO17zcbwa7aT8/llXYLKQiZv5kZyeIzZSo15tSp+lVC5vqW1J5vpnjEWvBc1tv
         psG7u9IDhgxjgl5Wx7KYfrwuUe108l4CQH8jEi/23nIQ6RTP3oM8AGXuNcR1mtpex6xq
         Grc52KROALf4Ou3ypLNsdpp+75baOU2AbzVKb5zLZMJwsPFayuXnL2wetxPD5SYG/OgI
         FlPqdBeo2HBaME8/Cka9Iw9KQOhZsvrVQ/CEu4G9KsKQB2u/QbEXz8XGNf+OZwwdW/Ou
         +Myg==
X-Forwarded-Encrypted: i=1; AJvYcCW79o6rtb+a/Qlv+ednNq7TlZ3BvMtNpmBFQIxPflJ6fMGBco6sbEQYK+HckBe/5hHReGKTXqLANXJ84sOr@vger.kernel.org, AJvYcCWS6uL/Jm3n430tPdeftoEhL5u8Wk1Z+LOjTThU54JzHCJbGnI7M4xYOq2RPM/EG9OmddPIZY86Zj093Vg=@vger.kernel.org, AJvYcCWdFZQ1arUkbVW/jFS2nDq0tJdIyycL3HPQF0GZwQVFNH0NQrtnQEOJEDZpV2ZSVUDAI489nI8mjKn63PX6iXU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmANTxflOQKu3vokeuzxah5x3WxmnDVmMJQTE/eWstI66AAYqX
	s/zki7Gp51mEesf89NZ5QFHSkd2SBrWI3yczciK/AbCJGs5ocN6EqHtLDAUci8L4EzwhWRXOYw8
	F7B/6gepe+pUHPNOn2ec0tyGXMac=
X-Gm-Gg: ASbGnctXZb/yD5lrOYv2E3Q6ArnSqVPK4NU/7q8992XTWL+Gscu5rkCHd8mxY6UMhk9
	hAwkbxow22lc1nV8GIezDgbPTsr4NhuId7mDojUQz5x2Hc5ZKch+boc2tELzdb6J/0z4OX3QSfZ
	/odBCNJMQf4Sct2rvg7x2x9nY1lJAjlHay9pgitPNYX/JLeLgoK8rTb/55bcA=
X-Google-Smtp-Source: AGHT+IHBMMOTh5PcvxuHFy8Zof2H0Is8JsStyn3DiC9wZXxLT//XQKyGjen33k6PzAu4nqsYvemykkTaQyPh2in0/80=
X-Received: by 2002:a2e:6a05:0:b0:308:ec25:9004 with SMTP id
 38308e7fff4ca-30d7e2bb98dmr28144611fa.35.1742667906015; Sat, 22 Mar 2025
 11:25:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <D8MPT9V5JAEN.JZ5APEZ4TYPA@proton.me> <20250322150235.1851241-1-contact@antoniohickey.com>
In-Reply-To: <20250322150235.1851241-1-contact@antoniohickey.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 22 Mar 2025 14:24:30 -0400
X-Gm-Features: AQ5f1JrSG0Q712HRrrfHsCQZG3sVktkbzIrHFVwgJtWOJX3VxI-tCQfYhe-_FpA
Message-ID: <CAJ-ks9=GHVfd=iRT73DviOD=6dio3U7wQWLaXAhKr3UG5-ivvw@mail.gmail.com>
Subject: Re: [PATCH v5 01/17] rust: enable `raw_ref_op` feature
To: Antonio Hickey <contact@antoniohickey.com>
Cc: benno.lossin@proton.me, a.hindborg@kernel.org, alex.gaynor@gmail.com, 
	aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	dakr@kernel.org, gary@garyguo.net, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, masahiroy@kernel.org, nathan@kernel.org, 
	nicolas@fjasle.eu, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 22, 2025 at 11:08=E2=80=AFAM Antonio Hickey
<contact@antoniohickey.com> wrote:
>
> On Sat, Mar 22, 2025 at 10:16:01AM +0000, Benno Lossin wrote:
> > On Thu Mar 20, 2025 at 3:07 AM CET, Antonio Hickey wrote:
> > > Since Rust 1.82.0 the `raw_ref_op` feature is stable.
> > >
> > > By enabling this feature we can use `&raw const place` and
> > > `&raw mut place` instead of using `addr_of!(place)` and
> > > `addr_of_mut!(place)` macros.
> > >
> > > Allowing us to reduce macro complexity, and improve consistency
> > > with existing reference syntax as `&raw const`, `&raw mut` are
> > > similar to `&`, `&mut` making it fit more naturally with other
> > > existing code.
> > >
> > > Suggested-by: Benno Lossin <benno.lossin@proton.me>
> > > Link: https://github.com/Rust-for-Linux/linux/issues/1148
> > > Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
> >
> > Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> >
> > > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > > index 993708d11874..a73aaa028e34 100644
> > > --- a/scripts/Makefile.build
> > > +++ b/scripts/Makefile.build
> > > @@ -224,9 +224,9 @@ $(obj)/%.lst: $(obj)/%.c FORCE
> > >     $(call if_changed_dep,cc_lst_c)
> > >
> > >  # Compile Rust sources (.rs)
> > > -# ------------------------------------------------------------------=
---------
> > > +# ------------------------------------------------------------------=
--------------------
> >
> > Not sure about this change.
>
> This change is so I could enable the `raw_ref_op` feature for doctests
> since the minimum Rust version 1.78 still has `raw_ref_op` as an
> expiramental feature, and will throw errors at compile if a doctest uses
> it. Is there a better way to do this?

I think Benno is just asking about the extension of the dashed line.

> > >
> > > -rust_allowed_features :=3D asm_const,asm_goto,arbitrary_self_types,l=
int_reasons
> > > +rust_allowed_features :=3D asm_const,asm_goto,arbitrary_self_types,l=
int_reasons,raw_ref_op

This looks correct to me.

> > >
> > >  # `--out-dir` is required to avoid temporaries being created by `rus=
tc` in the
> > >  # current working directory, which may be not accessible in the out-=
of-tree
> >
> >

Reviewed-by: Tamir Duberstein <tamird@gmail.com>

