Return-Path: <linux-kbuild+bounces-3999-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EA6996B1B
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 14:59:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A5F11C22F58
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Oct 2024 12:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5784194C96;
	Wed,  9 Oct 2024 12:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PuLkX+C0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528AB194AC7;
	Wed,  9 Oct 2024 12:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728478411; cv=none; b=q8Wr/R831zrZ+PjLv7pa49SB0V/JATkUnXn2CF3uRYyEBT1iug7mHnpzur7Id1OLoTDFxNjtFxkGu6wg9uZC5TjbsGG4npf0qhoWuFwkQY4LqehcuqY5CCmyimYuQDT268mj4NQn3cxUajO2mjDG6p3Bw4c9MW+zDC7b2klGjZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728478411; c=relaxed/simple;
	bh=/bqm0Lmk+QfNkrDzIAWds0mix6xDWsEit6HjzOi4o2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oD9cwZg/98jYx6mazIs6LHF5MvCQ8t9XGLutNffDI3WnjVkbJAyE2834xuiBI95gL9O1dvBwenBVkmg4XwoXUG6Iia9Ro7dFTy0WoJs+rFOSCNMaenC9l4yrurGI/mkNo2JIoie1YQhQvi1v1JyubuVwdX+nsC8Lpo+jPwd1p5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PuLkX+C0; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71dfce7a36eso332968b3a.3;
        Wed, 09 Oct 2024 05:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728478409; x=1729083209; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/gm6r3zquk+S3rDiKoR0XqiGA3Ad6LI2JJbXcca8tg=;
        b=PuLkX+C04kVlf5kNBkkmlOtUaXadEmBNR3uXifv9r1S8/lG0JEvDvrVooqnSQhjhBu
         vNfdqbnjzx0YXZLv3Ve5gsCXoOMM3rYP2ydgW+USu2mp6CZtQZGSXcA89qEdyUtXuuNZ
         7xuqQevXpwaxILgHroNdvEktylsV5b7NTe4GfJVdV5nZlYh27QwIWWXCtp4v+ji4dp4V
         Y+pPsGpbxeQD+OiVPOfhi7E/PMSBFCdabbbB8mbcVOxUqEfwr7A5Y3whElpMgTsSi6Mg
         8qdJz+O6OtpDBSdsyuipVJqQJdZW2vTs3hWT1GKhi3qjVOrfnHN7Fpe8/dCLt9U+G+cU
         NlNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728478409; x=1729083209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/gm6r3zquk+S3rDiKoR0XqiGA3Ad6LI2JJbXcca8tg=;
        b=jCMbmYXnEA1IbOVEo5Pf5U+PGxEYWuaVWE8Fnd/NwbxDVMzD2Vrxyo4jqjz6yFPMjF
         qQN6cSzsPUmVc13ozUamI9Sw8g4/V2sa5Lyfqf/zx/VnA9xAzAE7Rsm3E+V/zF7AgDDq
         Guwwu5WbFO0Jt8eDkzUi7vR2eE/kS82RwtreuAJU/KQZt0QbfbqpNJOGr9rc31iaUb3G
         XYHLBkuEHQWsG211JBr1BWs+yU8mb3k5qkbzDdrfmKZlKuaQXTvA0bnIjKza6NkisBto
         bV3GGoEuZPWH8M6fBpVpgFYxL55Bxle3JlQx43Of5xx1aqVNEFvEUAMqRPMbKq78/+4J
         IzWg==
X-Forwarded-Encrypted: i=1; AJvYcCW0hhR4rrIPGWOvYgAQoPHvshmDgN5wg/7F4B7atRv4gi5V3dBvR+ADbEm5oH993W22Mlpu+J3hSvS5GZA=@vger.kernel.org, AJvYcCWc2WZzVZslw1GPKeECX+iVbK0tvdOQ6PjYEr37CynXOnW7AcvvMGpuMouzrYrt9/UhgfTnOL/PGMe0HE9coKM=@vger.kernel.org, AJvYcCXtozRAvAy0t32m2L6iBGX0FH2xnmxdAr7/Ch0bRxf5CIs/CqCfeNTK58907ZMVlO5nvPTgL0Zy9RTUzNWM@vger.kernel.org
X-Gm-Message-State: AOJu0YxBlEANUynjWk/z5Au+04AmZfMYPOyK0a5vEy7nvZJj+014NNnK
	29zZLXw+eLOaUh3rIRtqPGG+vKLyVTE6DubExeePT8GWe52jtQM6d6Y3qriH5J+daqe43G0WuWC
	uBhquF28rKEJEbTVfS/t6PZRr1S3vEginuD8=
X-Google-Smtp-Source: AGHT+IHvSDqWoDIRDdkFmudAcc0ShoBiv38Zr7fOtGpnAba5zL+QT53kc3YcDh34RCsC2uerqctUalP4OwAWK1rRnWc=
X-Received: by 2002:a05:6a00:2d0f:b0:710:51e4:51f0 with SMTP id
 d2e1a72fcca58-71e1dbb59f1mr1559161b3a.4.1728478409516; Wed, 09 Oct 2024
 05:53:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009-rustc-option-bootstrap-v3-1-5fa0d520efba@google.com>
In-Reply-To: <20241009-rustc-option-bootstrap-v3-1-5fa0d520efba@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Oct 2024 14:53:17 +0200
Message-ID: <CANiq72nr_X4JY=LUcj14jZfcPV5=Cn3QTucYGmBTz2QdA5=RdA@mail.gmail.com>
Subject: Re: [PATCH v3] Kbuild: fix issues with rustc-option
To: Alice Ryhl <aliceryhl@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 1:42=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> Note that RUSTC_BOOTSTRAP is also defined in the top-level Makefile, but
> its value is unfortunately *not* inherited from the environment. That

I would perhaps say ", but Make-exported variables are not inherited"
or similar to be a bit more precise (because the external environment,
as in the `make` environment, is exported unlike those variables).

> not look for the standard library. It's not possible to instead supply a
> standard library to rustc, as we need `rustc-option` before the Rust
> standard library is compiled.

The error message mentions `std`, so to clarify I would perhaps add
".... standard library (i.e. `core`)" or similar, i.e. one could think
`no_std` is enough otherwise (which would be better if we could, since
it is stable unlike `no_core`, but we don't want it here either).

> The -o and --out-dir parameters are altered to fix this warning:
>
>         warning: ignoring --out-dir flag due to -o flag
>
> The --sysroot flag is provided as we would otherwise require it to be
> present in KBUILD_RUSTFLAGS. The --emit=3Dobj flag is used to write the
> resulting rlib to /dev/null instead of writing it to a file in
> $(TMPOUT).

"the resulting object file" (i.e. the rlib is not written even if we
wrote to a file).

> I verified that the Kconfig version of rustc-option doesn't have the
> same issues.

Thanks for checking this. We may want to make it closer to what we do
her, but that can be done later.

Cheers,
Miguel

