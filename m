Return-Path: <linux-kbuild+bounces-9-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3D07E7F3D
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Nov 2023 18:50:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93D66B22938
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Nov 2023 17:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C72673E498;
	Fri, 10 Nov 2023 17:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-kbuild@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6523D98B
	for <linux-kbuild@vger.kernel.org>; Fri, 10 Nov 2023 17:47:08 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5EE3AF80;
	Fri, 10 Nov 2023 01:04:51 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-d9c66e70ebdso1843023276.2;
        Fri, 10 Nov 2023 01:04:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699607091; x=1700211891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WHZPpTTWcN/qBtcyGF24DlgLlsqCltsVlukIwu8/1iQ=;
        b=QiYKoo/QUg++OBz4Mna7w7ILuBGUOiWQYItNKUu+AfYr2EfW8cvfmn+flNQjapSixE
         Z6mHN0nfOyVFvLbJGiqWGEEC4lyIDURfkftU26TrIw1tXdPCPSHdxYvm+R/fJrxEcXKL
         EPvFe21+Va9CDkBr2QgY5usptWnWBU7CcEphBAN/1OvREB9t/SROT23hLrbCk8fWqj3Q
         +COSxbSCZo/DlYg2cVHKw78jdn7rTpln/Wstn7WxhKWELYOtpNKZsNPOw2nak2zSN4yw
         OGR83qmhtmrOwJDjEU6iPMb1+qtjnSm0KbPjWHOyZXGG+/ib7yS73FyYib2AMd+64BG9
         1K7w==
X-Gm-Message-State: AOJu0Yw9tJfdHIJh68sVqpefpk8PF6eOdJdnMIbRN9Pd8Ut9WEIk9NRV
	KesGUyJsApzfcjHiTbk//ZPsWhbMDCEgKw==
X-Google-Smtp-Source: AGHT+IEEa4GrP5RKDm7nfjuGhV+kD81VRn41CavZ63GmDswLUYsSSe4/1yhToJgXSgvu1T206jClXQ==
X-Received: by 2002:a25:e441:0:b0:d78:f32:5849 with SMTP id b62-20020a25e441000000b00d780f325849mr6958918ybh.24.1699607090762;
        Fri, 10 Nov 2023 01:04:50 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id g10-20020a5b070a000000b00da041da21e7sm7718137ybq.65.2023.11.10.01.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 01:04:50 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5a7af52ee31so21843487b3.2;
        Fri, 10 Nov 2023 01:04:50 -0800 (PST)
X-Received: by 2002:a0d:dc85:0:b0:5a7:baae:329f with SMTP id
 f127-20020a0ddc85000000b005a7baae329fmr7246797ywe.15.1699607089817; Fri, 10
 Nov 2023 01:04:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Yzv0wXi4Uu2WND37@gondor.apana.org.au> <Y5mGGrBJaDL6mnQJ@gondor.apana.org.au>
 <Y/MDmL02XYfSz8XX@gondor.apana.org.au> <ZEYLC6QsKnqlEQzW@gondor.apana.org.au>
 <ZJ0RSuWLwzikFr9r@gondor.apana.org.au> <ZOxnTFhchkTvKpZV@gondor.apana.org.au>
 <ZUNIBcBJ0VeZRmT9@gondor.apana.org.au> <CAHk-=wj0-QNH5gMeYs3b+LU-isJyE4Eu9p8vVH9fb-vHHmUw0g@mail.gmail.com>
 <ZUSKk6Tb7+0n9X5s@gondor.apana.org.au> <CAHk-=wh=xH7TNHeaYdsrVW6p1fCQEV5PZMpaFNsZyXYqzn8Stg@mail.gmail.com>
 <ZUi5KMUaNkp0c1Ds@gondor.apana.org.au>
In-Reply-To: <ZUi5KMUaNkp0c1Ds@gondor.apana.org.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Nov 2023 10:04:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWWMABFmejXPEuKyvDC7CgUZSeWU6cR8qpBdVa9KiBdUQ@mail.gmail.com>
Message-ID: <CAMuHMdWWMABFmejXPEuKyvDC7CgUZSeWU6cR8qpBdVa9KiBdUQ@mail.gmail.com>
Subject: Re: [PATCH] crypto: jitterentropy - Hide esoteric Kconfig options
 under FIPS and EXPERT
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
	Steffen Klassert <steffen.klassert@secunet.com>, =?UTF-8?Q?Stephan_M=C3=BCller?= <smueller@chronox.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Herbert, Yamada-san,

On Mon, Nov 6, 2023 at 11:00=E2=80=AFAM Herbert Xu <herbert@gondor.apana.or=
g.au> wrote:
> On Thu, Nov 02, 2023 at 08:32:36PM -1000, Linus Torvalds wrote:
> > I think that would help the situation, but I assume the sizing for the
> > jitter buffer is at least partly due to trying to account for cache
> > sizing or similar issues?
> >
> > Which really means that I assume any static compile-time answer to
> > that question is always wrong - whether you are an expert or not.
> > Unless you are just building the thing for one particular machine.
> >
> > So I do think the problem is deeper than "this is a question only for
> > experts". I definitely don't think you should ask a regular user (or
> > even a distro kernel package manager). I suspect it's likely that the
> > question is just wrong in general - because any particular one buffer
> > size for any number of machines simply cannot be the right answer.
> >
> > I realize that the commit says "*allow* for configuration of memory
> > size", but I really question the whole approach.
>
> Yes I think these are all valid points.  I just noticed that I
> forgot to cc the author so let's see if Stephan has anything to
> add.
>
> > But yes - hiding these questions from any reasonable normal user is at
> > least a good first step.
>
> OK here's the patch:
>
> ---8<---
> As JITTERENTROPY is selected by default if you enable the CRYPTO
> API, any Kconfig options added there will show up for every single
> user.  Hide the esoteric options under EXPERT as well as FIPS so
> that only distro makers will see them.
>
> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

Thanks for your patch, which is now commit e7ed6473c2c8c4e4 ("crypto:
jitterentropy - Hide esoteric Kconfig options under FIPS and EXPERT").

> --- a/crypto/Kconfig
> +++ b/crypto/Kconfig
> @@ -1297,10 +1297,12 @@ config CRYPTO_JITTERENTROPY
>
>           See https://www.chronox.de/jent.html
>
> +if CRYPTO_JITTERENTROPY
> +if CRYPTO_FIPS && EXPERT
> +
>  choice
>         prompt "CPU Jitter RNG Memory Size"
>         default CRYPTO_JITTERENTROPY_MEMSIZE_2
> -       depends on CRYPTO_JITTERENTROPY
>         help
>           The Jitter RNG measures the execution time of memory accesses.
>           Multiple consecutive memory accesses are performed. If the memo=
ry
> @@ -1344,7 +1346,6 @@ config CRYPTO_JITTERENTROPY_OSR
>         int "CPU Jitter RNG Oversampling Rate"
>         range 1 15
>         default 1
> -       depends on CRYPTO_JITTERENTROPY
>         help
>           The Jitter RNG allows the specification of an oversampling rate=
 (OSR).
>           The Jitter RNG operation requires a fixed amount of timing
> @@ -1359,7 +1360,6 @@ config CRYPTO_JITTERENTROPY_OSR
>
>  config CRYPTO_JITTERENTROPY_TESTINTERFACE
>         bool "CPU Jitter RNG Test Interface"
> -       depends on CRYPTO_JITTERENTROPY
>         help
>           The test interface allows a privileged process to capture
>           the raw unconditioned high resolution time stamp noise that
> @@ -1377,6 +1377,28 @@ config CRYPTO_JITTERENTROPY_TESTINTERFACE
>
>           If unsure, select N.
>
> +endif  # if CRYPTO_FIPS && EXPERT
> +
> +if !(CRYPTO_FIPS && EXPERT)
> +
> +config CRYPTO_JITTERENTROPY_MEMORY_BLOCKS
> +       int
> +       default 64
> +
> +config CRYPTO_JITTERENTROPY_MEMORY_BLOCKSIZE
> +       int
> +       default 32
> +
> +config CRYPTO_JITTERENTROPY_OSR
> +       int
> +       default 1
> +
> +config CRYPTO_JITTERENTROPY_TESTINTERFACE
> +       bool

This duplicates the symbols in the CRYPTO_FIPS && EXPERT section above,
which is fragile.

For the int and bool symbols, this can be handled without duplication
using:

     config CRYPTO_JITTERENTROPY_OSR
    -       int "CPU Jitter RNG Oversampling Rate"
    +       int "CPU Jitter RNG Oversampling Rate" if CRYPTO_FIPS && EXPERT

     config CRYPTO_JITTERENTROPY_TESTINTERFACE
    -       bool "CPU Jitter RNG Test Interface"
    +       bool "CPU Jitter RNG Test Interface" if CRYPTO_FIPS && EXPERT

Unfortunately the following does not work for the choice statement,
although kconfig does not report an error:

     choice
    -       prompt "CPU Jitter RNG Memory Size"
    +       prompt "CPU Jitter RNG Memory Size" if CRYPTO_FIPS && EXPERT
             default CRYPTO_JITTERENTROPY_MEMSIZE_2

Unlike for other symbol types, which just become silent if
!(CRYPTO_FIPS && EXPERT), the choice is skipped completely if
!(CRYPTO_FIPS && EXPERT), and CRYPTO_JITTERENTROPY_MEMSIZE_2 is not set.

Yamada-san: Do you know why choice behaves differently?
Is this easy to fix?

Thanks!

> +
> +endif  # if !(CRYPTO_FIPS && EXPERT)
> +endif  # if CRYPTO_JITTERENTROPY
> +
>  config CRYPTO_KDF800108_CTR
>         tristate
>         select CRYPTO_HMAC

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

