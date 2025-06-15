Return-Path: <linux-kbuild+bounces-7506-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2902ADA286
	for <lists+linux-kbuild@lfdr.de>; Sun, 15 Jun 2025 18:09:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBBD83ADBD2
	for <lists+linux-kbuild@lfdr.de>; Sun, 15 Jun 2025 16:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1403E2063F0;
	Sun, 15 Jun 2025 16:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fR1GoI0p"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FA513AA20
	for <linux-kbuild@vger.kernel.org>; Sun, 15 Jun 2025 16:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750003766; cv=none; b=ReVXTRrBpusB1Vapn1sJkvxkb+4wzOAh0YC7H4z43mh1b6dZfhsTNj7qCLtm6ITuiITBRtLVn9P3HghWNI6haw4AEyxZQJ7w9Rcvpqvq3MCU/Nkafc2uZVjFF3hWj5HGfXMBfmj18pKHnaMo9TcNT6V31xtXgvbLv/QgnqRsrMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750003766; c=relaxed/simple;
	bh=WoFcb9KIFAadkHes0vGVnfEnSA97dcCdup/+gvOXFKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gCImp2k093bQo4c6Ijuq/8HRjdN87uYKaDcGGv6pfJHH/RVm7bWEoeBlBn624mo7FvOxkhxBiFzZWURDcECICveac+ZW+7X8OdKdE1NHaZuqSNz2Agm6luF1qGGJBs1/Q7k/RRaTzWl4FIx8RUZHuMVtVkotKFBbS5QvGg0jLtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fR1GoI0p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A933C4CEF2
	for <linux-kbuild@vger.kernel.org>; Sun, 15 Jun 2025 16:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750003765;
	bh=WoFcb9KIFAadkHes0vGVnfEnSA97dcCdup/+gvOXFKA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fR1GoI0p+2FOnoDs8pBTvtRWXOxZVt+hYChREVFO5lqLoRdrz5IW84ITvoZFL2jED
	 tIiSyVRa8slln5eePl/Gwf5i6EOuVvwg8RuqY2EF5fy5VGOlqgLfMt12n/bixG6k+c
	 76yqizRtk8c+v7lSHoR/C9t84ImbI9ley7nuhI6cT6lGK4xR9mu4bWB1AZllN2HBsh
	 B8DeAWS9hRGh+iBn64uh69omcjP2kDOVFQ5qbrNEkv19Jk1XOBcXc8CdY04FNWarQx
	 8voHGKhN3Dx/1C8dcQT+oyxngliA7mdpxgRlLY/uGI4aEFyQeWqvJTJiQFiMLve1yj
	 Sz7QNmE/1ySRw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so4191867e87.1
        for <linux-kbuild@vger.kernel.org>; Sun, 15 Jun 2025 09:09:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVK6npagLCGerpP2wBz2QaW1bNrshmnYRGhl4WsoW/eOlY6c6MmBleCIkWR1fjA0VEArQZB+U83Lh4Lisw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx65MjIqkk8Frj2J0nDT4iGefQzaXqAr0HsYQS8w4DZunQeryDl
	UlBEsj75sem2U+XJiO/VyVlLoI4rsvrZqagYYoIemxwIx5/IoK89hA5P+0+AgqSdrqkAgfzcsTQ
	ve/e3BZFCQApksLdHs0wFVQaeklQwgZo=
X-Google-Smtp-Source: AGHT+IFIn6esfkgRlXexMVKmQU6OoNrOSFkD7VqX/QD0hF+WEg9w6kyg9tARg7b/nCWTeWmmklLI8hOMLjkCsD8ICEI=
X-Received: by 2002:a05:6512:6ca:b0:54a:cc04:ea24 with SMTP id
 2adb3069b0e04-553b6f43b4cmr1322383e87.46.1750003764073; Sun, 15 Jun 2025
 09:09:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <rxsikukdh39.fsf@localhost.mail-host-address-is-not-set>
 <CANiq72nwcAAC8eGCzHZ_sOwccCqbg3KD6CraXj2r+hDwhYqqig@mail.gmail.com>
 <CAK7LNASX-BDHeTeuEnQwJct5wcqmMGbBQo1EeughfKe83pYZ7w@mail.gmail.com>
 <F2FD0DED-84DD-4E30-809A-7BFE5FE1A769@m3y3r.de> <CAK7LNASFmf5OS+iPSjmu-UMXU1A0Vwia=FPAGnnuuyCTivXfMA@mail.gmail.com>
In-Reply-To: <CAK7LNASFmf5OS+iPSjmu-UMXU1A0Vwia=FPAGnnuuyCTivXfMA@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 16 Jun 2025 01:08:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNATvCD-fv+tp9P_H82xKd8fWRhin2ppKWt1nphzg8HR17A@mail.gmail.com>
X-Gm-Features: AX0GCFvbUpC-9466l3VpDvQ7SooSKjTIJ6Pi_ESTcRPm7TLPkEpAvSN5HJVo2jo
Message-ID: <CAK7LNATvCD-fv+tp9P_H82xKd8fWRhin2ppKWt1nphzg8HR17A@mail.gmail.com>
Subject: Re: [PATCH] kconfig: use memcmp instead of deprecated bcmp
To: Thomas Meyer <thomas@m3y3r.de>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 12:26=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Sat, Sep 28, 2024 at 3:53=E2=80=AFAM Thomas Meyer <thomas@m3y3r.de> wr=
ote:
> >
> >
> >
> > Am 26. September 2024 17:33:20 MESZ schrieb Masahiro Yamada <masahiroy@=
kernel.org>:
> > >On Wed, Sep 25, 2024 at 5:50=E2=80=AFAM Miguel Ojeda
> > ><miguel.ojeda.sandonis@gmail.com> wrote:
> > >>
> > >> On Tue, Sep 24, 2024 at 9:26=E2=80=AFPM Thomas Meyer <thomas@m3y3r.d=
e> wrote:
> > >> >
> > >> > Make build succeed on systems whose c library doesn't provided the=
 deprecated bcmp function.
> > >>
> > >> It would be good to mention which systems are those. Other than that=
,
> > >> it looks good to me:
> > >>
> > >> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
> > >>
> > >> Cheers,
> > >> Miguel
> > >
> > >
> > >Agree.
> > >
> > >If there is a known system that does not provide bcmp,
> > >that information is appreciated.
> >
> > This fix is needed when I try to build Linux kernel on my Android phone=
 under Termux with bionic libc, which only seems to implement memcmp.
>
>
>
> OK, thanks.
>
> Please add a little more description in v2.
>
> For example,
>
>
>
> bcmp() was removed in POSIX.1-2008.
>
> This commit replaces bcmp() with memcmp(). This allows Kconfig to link
> with C libraries that do not provide bcmp(), such as Android bionic
> libc.


Applied with updated commit description.




--=20
Best Regards
Masahiro Yamada

