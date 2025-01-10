Return-Path: <linux-kbuild+bounces-5430-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD71A0989E
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jan 2025 18:35:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3585F188F043
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jan 2025 17:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1849212B17;
	Fri, 10 Jan 2025 17:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gIfDwkzg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DAC2F3E;
	Fri, 10 Jan 2025 17:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736530516; cv=none; b=sNnuc6zxVZpETdT2DTIxBqiyZNosS5mEBB5BVXZuy/cfPqirYiO+NXemeRpdNtNgHZ9tnzwVqsj73/OcRpimLJRbvBPREz3eDa94YBGhxJUccTUdd2sF6LCmiTa98Renji53d9eIY1dkQVPGZoO6a9uh/0rUPB1VG1NjtqvPx50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736530516; c=relaxed/simple;
	bh=240vOD2TVesGq2MUWi8XcQQrenE4M2nvqpS6EIswG5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R3tm5YTKSSnQPyVqgnNgvTkbefgcmIjiOhP0fxRalbVBjQVwG6thlYaVPN41/fhmamv9p0s64TG+OZG1pC1zvVB8tRLJtMgALNBdydBY1SzvsY3BZ/eXh6vyWlmYnCu/zZ0gwM7Z5c6znaO044Ih5XJ1jjeLwSvDdPjLVAldkxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gIfDwkzg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61863C4CEE1;
	Fri, 10 Jan 2025 17:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736530515;
	bh=240vOD2TVesGq2MUWi8XcQQrenE4M2nvqpS6EIswG5s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gIfDwkzgOYTS61YXTHCS67u9DI9khv5oqholaqKaav8Re9pw2LcVEoMq79TooyboU
	 UDzwe3wA58fZwNCtnI6k0TLQflE18V5wjIil4Kt1KUBbC53I7cZgaBVKsKEQRFSaKK
	 aX6E2FeLSzpICsS3je5mgUFIO43vwFrpJXyOcFgSFng9EhyLnlNBIDu2HPRNpV7xVH
	 vTzBUfQlI94DXw8poR5W2YyNFx1Pf4ObrYOzem9sYckxWrw+iOqMzEDMwsXWW04Zre
	 XMaLHhwAq68+3lpGI2+zQ876M2hvR0CAi7qRd0FLVUoz1RpZrquWowweWoRjJYdpiI
	 cWj9rRo88uhPw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54287a3ba3cso2720624e87.0;
        Fri, 10 Jan 2025 09:35:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWm06KcLtvsYUg0Xe1jw63etTtg5xSjspz3tKr+vCkW6EhHVp34HtF8LRj+jRAA0ikQ5MurGXybO7b9yC8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOWhTKJ/qEDF5Fs3y9FbTftgY76yASxsQnJx/1d6W3/wSP8ByJ
	2qIIdzA/9y7cY+5s8Eb8+u1+utF+VfHwtbAzq2P+6nsD2m7g/IEpmSgV++0PtBFeSuXzBV1aJXD
	ZfTyKm78V6LBcPNb87H2rK5CYq8c=
X-Google-Smtp-Source: AGHT+IFXN346P2vhlSJQDJjuHvXeop42QaL94Q+wRmwWw1QAMuhJJA2TNBRbPzEARAtqoX22P6qsj8yeHVbMKLZHoUA=
X-Received: by 2002:a05:6512:3e20:b0:542:8bf0:2fa3 with SMTP id
 2adb3069b0e04-5428bf030ecmr2027458e87.5.1736530514067; Fri, 10 Jan 2025
 09:35:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103073046.2609911-1-masahiroy@kernel.org>
 <20250103073046.2609911-6-masahiroy@kernel.org> <20250103083435.1785f86e@pumpkin>
In-Reply-To: <20250103083435.1785f86e@pumpkin>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 11 Jan 2025 02:34:36 +0900
X-Gmail-Original-Message-ID: <CAK7LNASBgpThWFN0dbPL5TfhoZTky2SXrGbJyMo_iUXzC2Ha4A@mail.gmail.com>
X-Gm-Features: AbW1kvZf6x9aEeTZFHgpMomm0vsJxC2yDLLnX9WjYXEJ48KT-5CzNsXqnkr_ugw
Message-ID: <CAK7LNASBgpThWFN0dbPL5TfhoZTky2SXrGbJyMo_iUXzC2Ha4A@mail.gmail.com>
Subject: Re: [PATCH 6/6] genksyms: use uint32_t instead of unsigned long for
 calculating CRC
To: David Laight <david.laight.linux@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 3, 2025 at 5:34=E2=80=AFPM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Fri,  3 Jan 2025 16:30:43 +0900
> Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> > Currently, 'unsigned long' is used for intermediate variables when
> > calculating CRCs.
> >
> > The size of 'long' differs depending on the architecture: it is 32 bits
> > on 32-bit architectures and 64 bits on 64-bit architectures.
> >
> > The CRC values generated by genksyms represent the compatibility of
> > exported symbols. Therefore, reproducibility is important. In other
> > words, we need to ensure that the output is the same when the kernel
> > source is identical, regardless of whether genksyms is running on a
> > 32-bit or 64-bit build machine.
> >
> > Fortunately, the output from genksyms is not affected by the build
> > machine's architecture because only the lower 32 bits of the
> > 'unsigned long' variables are used.
> >
> > To make it even clearer that the CRC calculation is independent of
> > the build machine's architecture, this commit explicitly uses the
> > fixed-width type, uint32_t.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  scripts/genksyms/genksyms.c | 15 ++++++++-------
> >  1 file changed, 8 insertions(+), 7 deletions(-)
> >
> > diff --git a/scripts/genksyms/genksyms.c b/scripts/genksyms/genksyms.c
> > index e2cd3dcb469f..8b0d7ac73dbb 100644
> > --- a/scripts/genksyms/genksyms.c
> > +++ b/scripts/genksyms/genksyms.c
> >...
> > -     printf("#SYMVER %s 0x%08lx\n", name, crc);
> > +     printf("#SYMVER %s 0x%08lx\n", name, (unsigned long)crc);
>
> That should use PRIu32, but the whole patch could just use 'unsigned int'=
.
> No one is going to try to build this where 'int' is 16bit.
> All the hex constants assume that int is 32bits as well.


The point is, uint32_t is the clearest way to ensure
the variables are fixed width.

Casting to (unsigned long) vs PRIu32 is
just a matter of preference.




--=20
Best Regards
Masahiro Yamada

