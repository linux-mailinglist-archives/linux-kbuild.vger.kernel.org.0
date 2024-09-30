Return-Path: <linux-kbuild+bounces-3837-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC17798A870
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Sep 2024 17:30:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5660A1F215F4
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Sep 2024 15:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9159E194091;
	Mon, 30 Sep 2024 15:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ME/RCJp/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC401922FA
	for <linux-kbuild@vger.kernel.org>; Mon, 30 Sep 2024 15:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727710012; cv=none; b=Ho/aiTCqRLZLbbz5Ltb9AywQYC9r+HmBP8tCz0gwoxDGCpQ9wPxbJZzsZYl6gpfEEiwORTKhB6wcWuvBVJq/WctsQkm/nxRj5dB9b3QOVLIh30MMq4QbrekspXpkmh/KEgywtB407lSGlM6uBTprqmPXNjoH4PQhV2D+JnJK8bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727710012; c=relaxed/simple;
	bh=E464STp9DLS2lWJoal3WN4CJa3O0/5932kN2qc+FeGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=obq1f93Vzpm4sJpBqqCNlxUxmEHBK9PjcJ7w9wNZeIq8o/NLiNx6gVG5tkHzA1WP30M2cHmwPr3FTPGqLxTGSc8qctZQOduusmL/tAfG0TbSntLmShSq5Wv7fxufN0PS9dhJ/V2w6lfONSI7bCd6Og0zkwGqsL+HyYIVt0lKS1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ME/RCJp/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02334C4CED0
	for <linux-kbuild@vger.kernel.org>; Mon, 30 Sep 2024 15:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727710012;
	bh=E464STp9DLS2lWJoal3WN4CJa3O0/5932kN2qc+FeGo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ME/RCJp/AZWYH8wqnosZiP04COZSI4nCQy9ugZOfqggBZVWwsXHgUM7XqJ/ogUAqQ
	 w+VLczoWujg2f0DHimc1yNwwEHqSi2ApzovEJgBuYN04vADJdJHQmZMIClagpTe+aF
	 E5eKQXUMG89s+ZasBzWZxhkatbIvWEqM2b/7vFW54rgHiR1t+FALzNfBgP5UJqYrd5
	 dimPSMbhFjpxitLU6uHBsdhyALRE1O4ZKVclVv36Hyr4HnPcAfPCbwnIG3vPZNBrrM
	 OV9I//VcB2kgv8Su+np7jqvP1b+v7d281X9LaQ3NNlvsOAQPlPipxeEbQhoftlhBoB
	 cxUtzfCstXbQA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fac9eaeafcso15153021fa.3
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Sep 2024 08:26:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW2YJ2qdXNICAOCHOJJ+MZ5UBl7NzsOw+S5WsSuMMvv7JGAcvOpLGlUP4f/3ed+KxKQhVZ9p7aDxBC5qag=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUzII03sChcojVLR3V7eo0cqfuLhGt6KefftLiCGjc32OmsIMG
	GIhavRFeapqOOAiAXv01kbJRPFE/lyowCqvfnP6pm36aTscmzAULOW5NbGVG1HVvbi6yUrecWtP
	Azt4h+jDhA39Ypq4aHSvtw8tOroQ=
X-Google-Smtp-Source: AGHT+IEIm2PT/LBdZT2at9t4PX755NscKS9GfM+KVMYPv68E47ZEaxLX5WsdkoKzM/sgDCsjc6yQ6zJ/F4bTXoJqveY=
X-Received: by 2002:a2e:a54b:0:b0:2fa:c6b3:bf1c with SMTP id
 38308e7fff4ca-2fac6b3c289mr22099671fa.8.1727710010643; Mon, 30 Sep 2024
 08:26:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <rxsikukdh39.fsf@localhost.mail-host-address-is-not-set>
 <CANiq72nwcAAC8eGCzHZ_sOwccCqbg3KD6CraXj2r+hDwhYqqig@mail.gmail.com>
 <CAK7LNASX-BDHeTeuEnQwJct5wcqmMGbBQo1EeughfKe83pYZ7w@mail.gmail.com> <F2FD0DED-84DD-4E30-809A-7BFE5FE1A769@m3y3r.de>
In-Reply-To: <F2FD0DED-84DD-4E30-809A-7BFE5FE1A769@m3y3r.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 1 Oct 2024 00:26:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNASFmf5OS+iPSjmu-UMXU1A0Vwia=FPAGnnuuyCTivXfMA@mail.gmail.com>
Message-ID: <CAK7LNASFmf5OS+iPSjmu-UMXU1A0Vwia=FPAGnnuuyCTivXfMA@mail.gmail.com>
Subject: Re: [PATCH] kconfig: use memcmp instead of deprecated bcmp
To: Thomas Meyer <thomas@m3y3r.de>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 28, 2024 at 3:53=E2=80=AFAM Thomas Meyer <thomas@m3y3r.de> wrot=
e:
>
>
>
> Am 26. September 2024 17:33:20 MESZ schrieb Masahiro Yamada <masahiroy@ke=
rnel.org>:
> >On Wed, Sep 25, 2024 at 5:50=E2=80=AFAM Miguel Ojeda
> ><miguel.ojeda.sandonis@gmail.com> wrote:
> >>
> >> On Tue, Sep 24, 2024 at 9:26=E2=80=AFPM Thomas Meyer <thomas@m3y3r.de>=
 wrote:
> >> >
> >> > Make build succeed on systems whose c library doesn't provided the d=
eprecated bcmp function.
> >>
> >> It would be good to mention which systems are those. Other than that,
> >> it looks good to me:
> >>
> >> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
> >>
> >> Cheers,
> >> Miguel
> >
> >
> >Agree.
> >
> >If there is a known system that does not provide bcmp,
> >that information is appreciated.
>
> This fix is needed when I try to build Linux kernel on my Android phone u=
nder Termux with bionic libc, which only seems to implement memcmp.



OK, thanks.

Please add a little more description in v2.

For example,



bcmp() was removed in POSIX.1-2008.

This commit replaces bcmp() with memcmp(). This allows Kconfig to link
with C libraries that do not provide bcmp(), such as Android bionic
libc.








> >
> >It might be useful to add a link that mentions that this function is LEG=
ACY.
> >
> >https://pubs.opengroup.org/onlinepubs/007904875/functions/bcmp.html
> >
> >
>
> --
> Diese Nachricht wurde von meinem Android-Ger=C3=A4t mit K-9 Mail gesendet=
.
>

--
Best Regards
Masahiro Yamada

