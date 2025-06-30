Return-Path: <linux-kbuild+bounces-7767-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DDBAED2F3
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 05:37:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 065533B2087
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 03:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE5D22F01;
	Mon, 30 Jun 2025 03:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RWlEoxIu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872C53D6F;
	Mon, 30 Jun 2025 03:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751254634; cv=none; b=gS87/6k1NZh27Unwgwho2YeXDGuAzrxpMGDu8D+IYkzVBvtembniVxQSmOxZc7t5Mnipg5Q8ZNf/pGA+pPrBFjwNt+wkGp3U4xkqCfzigx/YMLz4Broun8OldngWBQEnmGbBBGNfUJe5iwywmDCgLeM80JWXTj1uUCPvpa2eApI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751254634; c=relaxed/simple;
	bh=tBBO/xetKW3+8xdOXZEHVQmU70bwKwSu2UKBd7Fxjm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tzHqq13r2vu4i1hoqYdZgJidwgjkNO3lmbI18egUoRUYUAhpITkbgnyqpt7RPKyBBX5Ap1rHvlAOZ+Tjx13bHvwt9GK+B/hVyDOSjyuNytfN1IJymCw7XHZeqVQr+UiqDSmABKRNZ949eGz18nLasvo0s6i4AObabg43v3NKb4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RWlEoxIu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18BFFC4CEE3;
	Mon, 30 Jun 2025 03:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751254634;
	bh=tBBO/xetKW3+8xdOXZEHVQmU70bwKwSu2UKBd7Fxjm0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RWlEoxIulUkJQcCLFCQFOBENG9ri2l8jriXC2ope8+7he1ZsycDyeK13oP/D6TmGm
	 qC0TvQPffXkAdv8f3DCHM8XZpjTn42OmcjFW90WTUTRuuxpApWeI1VjLmazXUn1aox
	 ncaX6CtfX1CS4NtjNpFPWJX1/uZorwU9boZmOjNsIIhYpE5AXIf7J5WKlFnPK4tK/q
	 FCF5Pc2BRNdwBT2d1nyFWkeYA/p1Byq8/doORdo6Vky0+aDisbzudUEAF8s5DgYA32
	 dfMJxmCCO2pKbl8llUAxQlpjeEbYO6S50GX9zx17TUYu0dy+8/DGYtY8FCIreMq1HT
	 xQXOI8Euje0/g==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553be4d2fbfso1850670e87.0;
        Sun, 29 Jun 2025 20:37:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWPfo6FHmLK5X2OFZpuSSRIISPpVkejfuLllqFD98L2ZEyjsSLauYreQXOefxDLwIl6w2wyJZGbf9IHp94=@vger.kernel.org
X-Gm-Message-State: AOJu0YwriX29eHRcTzqyfupabtMSQdSX70uGq56N5lOdBU24V8EkTGhQ
	j8ZEgGBqFt+83etIdUww12nPI0ejJ1LuyW+KQkCJ99tGU/IzPihmSlZZuhrP+ObQIp/x51b8bvI
	ifB4GRHkpkVS0TJk5LSdudD/PmrdhQEo=
X-Google-Smtp-Source: AGHT+IGAIwtzmHNa7XNzytGab0LyD1KTbFoV0ASGIxgboBguZf4k0T5z7vCGX4VvY00rLDP+knL/2+4nT1AXCFI9FCc=
X-Received: by 2002:a05:6512:4021:b0:553:aed7:9807 with SMTP id
 2adb3069b0e04-5550b81135cmr3311832e87.9.1751254632730; Sun, 29 Jun 2025
 20:37:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624150645.1107002-1-masahiroy@kernel.org>
 <20250624150645.1107002-3-masahiroy@kernel.org> <85eadc3b-391a-4fd1-a4b7-2e99de1ee6da@infradead.org>
In-Reply-To: <85eadc3b-391a-4fd1-a4b7-2e99de1ee6da@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 30 Jun 2025 12:36:36 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQo5DKLdrn53yW3A0WnKxfyxJxyrxt8bDTVJvTM8kMyRw@mail.gmail.com>
X-Gm-Features: Ac12FXwgsAv7vq418VjJjyocyqI2rEvOR9x782fQBvcsd_ST-4eji0qWgz9lW_Y
Message-ID: <CAK7LNAQo5DKLdrn53yW3A0WnKxfyxJxyrxt8bDTVJvTM8kMyRw@mail.gmail.com>
Subject: Re: [PATCH 02/66] kconfig: qconf: do not show checkbox icon for choice
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 5:15=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
>
>
> On 6/24/25 8:04 AM, Masahiro Yamada wrote:
> > When you select "Show All Options" or "Show Prompt Options", choice
> > entries display a check box icon, but this has no point because
> > choice is always y since commit
>
>                      since commit _____________________.


since commit fde192511bdb ("kconfig: remove tristate choice support").


I will fix it.
Thanks.



> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  scripts/kconfig/qconf.cc | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> >
> > diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> > index eaa465b0ccf9..546738a5c3b1 100644
> > --- a/scripts/kconfig/qconf.cc
> > +++ b/scripts/kconfig/qconf.cc
> > @@ -92,7 +92,6 @@ void ConfigItem::updateMenu(void)
> >  {
> >       ConfigList* list;
> >       struct symbol* sym;
> > -     struct property *prop;
> >       QString prompt;
> >       int type;
> >       tristate expr;
> > @@ -105,11 +104,10 @@ void ConfigItem::updateMenu(void)
> >       }
> >
> >       sym =3D menu->sym;
> > -     prop =3D menu->prompt;
> >       prompt =3D menu_get_prompt(menu);
> >
> > -     if (prop) switch (prop->type) {
> > -     case P_MENU:
> > +     switch (menu->type) {
> > +     case M_MENU:
> >               if (list->mode =3D=3D singleMode) {
> >                       /* a menuconfig entry is displayed differently
> >                        * depending whether it's at the view root or a c=
hild.
> > @@ -123,10 +121,13 @@ void ConfigItem::updateMenu(void)
> >                       setIcon(promptColIdx, QIcon());
> >               }
> >               goto set_prompt;
> > -     case P_COMMENT:
> > +     case M_COMMENT:
> >               setIcon(promptColIdx, QIcon());
> >               prompt =3D "*** " + prompt + " ***";
> >               goto set_prompt;
> > +     case M_CHOICE:
> > +             setIcon(promptColIdx, QIcon());
> > +             goto set_prompt;
> >       default:
> >               ;
> >       }
>
> --
> ~Randy
>


--=20
Best Regards
Masahiro Yamada

