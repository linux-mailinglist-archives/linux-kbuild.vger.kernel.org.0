Return-Path: <linux-kbuild+bounces-2832-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F2C948BA8
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 10:51:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE3FBB21FDC
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2024 08:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FF6E64A;
	Tue,  6 Aug 2024 08:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PilFKmzR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333D813A884
	for <linux-kbuild@vger.kernel.org>; Tue,  6 Aug 2024 08:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722934279; cv=none; b=kGCxT/9AbKP37sdvVDWRAmxCClqNG7BkEIRwZ0l78zIoVQeb8yNfS1Rry9B7ominfwgFIhgP4CjjXv+Qz1x0yJOuLFkx+UyzuQ4PEwZ3feMTPbo2ZlyOhWJMGuky3BCMg/3UFaD5VG/SZA4wh2c0X/pH75PzLKZ9cbukoquyosA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722934279; c=relaxed/simple;
	bh=XHuUN5PzQzd4XF3q/UrcBlUbPFT3NxS3VZp5nhS+viM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YoDbatrqE+3/w1Z/591bSm853a0dggX5XH/7Oz172e9EOQkgJVPp0zYUEy9yVuP1tU2w3rQYCwjY9ZVAYklNrdF2GS1ic71cpy795CLPadDV3zVJH18kwjJNQqjbJpxIMeoRmpbhPuWEkeV/wfbb0wrPiWsow3qaP4HjNTDGMms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PilFKmzR; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52fc14d6689so265260e87.1
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Aug 2024 01:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722934276; x=1723539076; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vaxK/y4M9T0DiA1FFzBs5HdX6sZdgnKfdbRZb6ZhIF8=;
        b=PilFKmzRoXtgfI4B9CZoNa1YXeURn2prwAoAJrVfpEAxG30lRICPUORYtCXJllAXOx
         9tPw7BusnX8JM1RtoooL9gdqmVsyeQQQTfz5D03qlQ/hmekUBNMGa3oC1ipdejG9C9fn
         NugXD17mt0vEa9SCDXRyYuQRi5pzP9oEkMsxYmKVVFJx+7nwKXx1gkbm8nU7MwYyk7IX
         mWra76FDEwLKJbkAhUewuba7OWeYKl+m0vBNs3IHMJ7os3GgqATfJlCa35IGyj+ykv0I
         rLurmnjJKrwX925MlWXbF8ZVCs2D6ovOiyXPpRkaVJubgz9GlqtvlK96W8NvKnvdhPlZ
         sIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722934276; x=1723539076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vaxK/y4M9T0DiA1FFzBs5HdX6sZdgnKfdbRZb6ZhIF8=;
        b=Ag/ULY+6YhMxRqYRfYfwIsZOmEG3rl1vzJqpVcDGVH8kQEYg53VAlcZ4XXvuHgyNzz
         bQvwi/u0fHBCSRoc1ab6qUcZQ8cNUYbfJ7xhw8ci9OxLcomPG0F1MM9VCa5kpUGe+JYI
         lAQ9M2dKpiSKXfX+CRQDDQJAnYa20Q9a3kE40O3+iJgFNIvtbQ8Qjn3wMFrChPih5wCa
         Cl9o2dsY8Xc9P2fY+7j7/dIVKoz6ds21Ehw+uyYicNULKKPIiVBZAQ8lxJn9NH5SgWat
         MGeMiSQz4NY1wxM+1EDNcJjbXg/QgIkrJx9hTaBXdrUdsOD3xRnqBJgNvj1x6cNYUVOS
         GeOg==
X-Forwarded-Encrypted: i=1; AJvYcCWOgfHI5Mw+VA3sncwJZUwpj5GsYfdL9QxzSqX6MOAGk6kdZVSF0UiUppSVoBpybGg/9D57et7I00Ck4GLCOQydk8+z0KWpe1Jb8Qgr
X-Gm-Message-State: AOJu0YyMSY22VGkJpXGkhVawgPnxw84hCZj1Gg4lAxwaSau/cqGCCZFg
	nFi5NejuW5qSK7scUPoY1Bq0+SEeH3OxZNyf6Kkz8wVDp2mji8xiFQSefggfgnecH74DEh2QLwG
	rvm0HaBDCUQBndqRRetCBJEjCu80=
X-Google-Smtp-Source: AGHT+IHePHD2QzWt6SZNv1ItskyyMcVg+6llfx6KWGFxAMI+V5ODJIP2sy/NneIRU+DIGZ+Ii9gfGmve/ZHOuBaEA/U=
X-Received: by 2002:a05:6512:1104:b0:52c:df77:6507 with SMTP id
 2adb3069b0e04-530bb39b061mr11272177e87.37.1722934275882; Tue, 06 Aug 2024
 01:51:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240530210342.1540045-1-maximilian@mbosch.me> <CANiq72=+RiRvPBN=UW1DKT8DgLjUt8OJsOX1t2LsZAZtou2Dmw@mail.gmail.com>
In-Reply-To: <CANiq72=+RiRvPBN=UW1DKT8DgLjUt8OJsOX1t2LsZAZtou2Dmw@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Tue, 6 Aug 2024 10:50:39 +0200
Message-ID: <CA+icZUVttxq+tBsTVn90woLD6Q_QkQ2L7P0+AVBEz2TXrT9C6w@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: allow setting zstd compression level for modules
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Maximilian Bosch <maximilian@mbosch.me>, linux-kbuild@vger.kernel.org, 
	"torvic9@mailbox.org" <torvic9@mailbox.org>, Piotr Gorski <lucjan.lucjanov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 6, 2024 at 9:53=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, May 30, 2024 at 11:17=E2=80=AFPM Maximilian Bosch <maximilian@mbo=
sch.me> wrote:
> >
> > From: "torvic9@mailbox.org" <torvic9@mailbox.org>
> >
> > Zstd offers a very fine-grained control of compression ratios.
> > Add a Kconfig option that allows setting the desired compression
> > level for module compression.
> >
> > Signed-off-by: Tor Vic <torvic9@mailbox.org>
> > Tested-by: Piotr Gorski <lucjan.lucjanov@gmail.com>
> > Tested-by: Maximilian Bosch <maximilian@mbosch.me>
>
> Missing Signed-off-by?
>
> > +config MODULE_COMPRESS_ZSTD_LEVEL
> > +       int "Compression level (1-19)"
> > +       depends on MODULE_COMPRESS_ZSTD
> > +       range 1 19
> > +       default 3
>
> Zstd supports levels up to 22, as well as "negative" ones (`--fast`),
> right? I imagine there is a reason for the 1-19 range, but it would be
> nice to mention the rationale.
>
> Thanks!
>
> Cheers,
> Miguel
>

Hi,

I provided some numbers when using L19 (-19 option) ZSTD for
kernel-modules compression (see [1]).

The savings is approx. 25MiB for generated Debian linux-image package.
The same number in /lib/modules/<kernel-release> - L19 compressed VS.
L3 (default) compressed.
Details see [1].

What is also to mention:
You need a ZSTD version which supports L19 compression and a KMOD
version which supports appropriate kernel-decompression routines for
this and maybe a Linux-kernel version which has appropriate support
from kernel-side.
At least there should be a note about user-space and kernel-space
requirements - maybe in the KConfig help-text?

In the thread below Emil V. had some hints [2], especially now that I
understand the ZSTD_CLEVEL info.

Thanks Masahiroy:

#### Restricted usage of Environment Variables
Using environment variables to set compression/decompression
parameters has security implications. Therefore,
we intentionally restrict its usage. Currently, only `ZSTD_CLEVEL` is
supported for setting compression level.
If the value of `ZSTD_CLEVEL` is not a valid integer, it will be
ignored with a warning message.
Note that command line options will override corresponding environment
variable settings

As a 2nd NOTE:
Masahiroy advocated to remove the -T0 multithreading option and
offered/demonstrated alternatives (see [3]).

If you like you can add for this patch:

Tested-by: Sedat Dilek <sedat.dilek@dhl.com> # ZSTD compressed
kernel-modules with L19 on Linux v6.10.3 AMD64

Thanks.

Best regards,
-Sedat-

Link: https://lore.kernel.org/all/CA+icZUUQadYjAXiCNx7PmKDV20WctvnzkXC3R2F7=
FM4Gzcm39Q@mail.gmail.com/
[1]
Link: https://lore.kernel.org/all/CACvgo52-KbJHUde8kP5-=3DHdHoCFEcAt=3Dmmy1=
i=3DMR7Er7xZz67w@mail.gmail.com/
[2]
Link: https://lore.kernel.org/all/CAK7LNASB1qFv1GdxTHvLpcJu1NbWrze5VsfFRYbF=
MeiFv_JPhQ@mail.gmail.com/
[3]
Link: https://github.com/facebook/zstd/commit/6e9512a70cfe099ac6fdf4dda58b6=
1c2e79bbfd9
(Masahiroy)

