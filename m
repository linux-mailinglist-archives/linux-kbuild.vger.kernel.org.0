Return-Path: <linux-kbuild+bounces-2896-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F002F94AE9A
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 19:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F2851C20B1B
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 17:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B0E13A87A;
	Wed,  7 Aug 2024 17:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ql03aaoV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8313307B;
	Wed,  7 Aug 2024 17:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723050218; cv=none; b=tGRPtlHaPSsxOriDGpJM8ukDg059DsrTlQaK8GdQq+y2yNtgMRiLf8jH6FMtwiCaPzjpINomj7PPL9c8lxyU6NEdPltQa4GZzuCaK8uS5bQKbbEOQ2+j1+wSc9NVmEhCiz/vAcsTbMZuHw+dGfx3HR9amlt/J/Ft8l4fh+7bU4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723050218; c=relaxed/simple;
	bh=29Op1y/ig47K7J8uJlH2X4F5/WmxoJFIXx0QeTBHGNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P465Anw181qvlyJb7sd1ONuKcAXC8/S3dAVCVl5+azyNAT05wzHMr3Ps6K0IXyyP4ntiKB2qvu00uRvUsPCmhuCs1YsK0o0ZfTllPY3c1RPC+CyNpnPL0WWS6lK+c8kD2WUAbBIEG2ZLWbUyJqRMaMdIFP+ebrvTaVUrO6LonLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ql03aaoV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1440FC4AF10;
	Wed,  7 Aug 2024 17:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723050218;
	bh=29Op1y/ig47K7J8uJlH2X4F5/WmxoJFIXx0QeTBHGNo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ql03aaoVMLZFyQnodYf+hE5WZBevQSf7uSCG5iWFM4N58KNOk5kcQ1BIAjGfCac/s
	 lnCslhE5gUHDgY8HGsqFDL1J2qQP1YwONfvYAbuPbku/ybfbBT8xmEIKYSJpA5Lx4Z
	 xwkU+z+TtEFBBqh2HOCRDSZEejhmDIQ1aR3anaHveNCelwPild6hTsiLQR77TMhwnl
	 izBYKayDkT/PpGBziH/+N4N0xupOT2cbQRF6s1Xk+ol2dDmRmBnh6QOf6ABgjh/37K
	 MLzbb7TlPFR+cHwD9BEH3bQlJFQ+nxdz68cQoaOllEaZtMCP+OcY7kUMhRsvht1qZ0
	 8epnBQhh+6Y8Q==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52efa16aad9so52344e87.0;
        Wed, 07 Aug 2024 10:03:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUCD/1HCgipY5Za8dKqEaKz1t6TS1kGXeLrQxa1I6sD0ouIjohGjkfI0/JaL8+J55KWJeQAucPtgZ8b4kHJHQAWLpAaeQ7AI8pC4WU3NHJDtddaHN7kP6Dnu3YTK45tdX0vKSUeTCN92m5C
X-Gm-Message-State: AOJu0Ywd8zra1/HJ3y3JFRSIRh2m53Y2g3IdSIbQ6A3+GXvX9p8aPxE4
	PNUowu7ypn3tfVKYVH+9n8oXvqjy7g1e5DGZgPRohDBetiAZiF7WX6/T8xdFqF4iYxfGe1ZHUlk
	jTrwJRmCcPZ28OOVZAngSwC3wupM=
X-Google-Smtp-Source: AGHT+IEJpQw1eQ5bPZfJqwbCAtS80FtybHbn39Xj+8LaRJEv3/5vxGQ+uvrQrBov4rxwwHmSAnNhHBrDxNyGCfv4uhM=
X-Received: by 2002:a05:6512:b21:b0:52c:d76a:867f with SMTP id
 2adb3069b0e04-530bb3041acmr12138586e87.0.1723050216641; Wed, 07 Aug 2024
 10:03:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240807022718.24838-2-jose.fernandez@linux.dev>
 <CAK7LNAS4t_naRxdxFTaj9zrdf2Hjjoaq+cBO4Gx7=PhCJk9+4w@mail.gmail.com> <f65f1d49-8c6f-45e9-a4b2-30d4cfff10b1@t-8ch.de>
In-Reply-To: <f65f1d49-8c6f-45e9-a4b2-30d4cfff10b1@t-8ch.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 8 Aug 2024 02:02:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNATuA4O3xVLcp5Lywr4njaUneKOJwPHZa11YQe63KXQpMA@mail.gmail.com>
Message-ID: <CAK7LNATuA4O3xVLcp5Lywr4njaUneKOJwPHZa11YQe63KXQpMA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: control extra pacman packages with PACMAN_EXTRAPACKAGES
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Jose Fernandez <jose.fernandez@linux.dev>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Christian Heusel <christian@heusel.eu>, 
	Peter Jung <ptr1337@cachyos.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 8, 2024 at 1:41=E2=80=AFAM Thomas Wei=C3=9Fschuh <linux@weisssc=
huh.net> wrote:
>
> On 2024-08-07 22:37:47+0000, Masahiro Yamada wrote:
> > On Wed, Aug 7, 2024 at 11:28=E2=80=AFAM Jose Fernandez <jose.fernandez@=
linux.dev> wrote:
> > >
> > > Introduce a new variable, PACMAN_EXTRAPACKAGES, in the Makefile.packa=
ge
> > > to control the creation of additional packages by the pacman-pkg targ=
et.
> > >
> > > The headers and api-headers packages will be included by default if
> > > PACMAN_EXTRAPACKAGES is not set. This changes the previous behavior
> > > where api-headers was always included, and headers was conditionally
> > > included if CONFIG_MODULES=3Dy. Now, this decision is delegated to th=
e
> > > user.
> > >
> > > To disable extra packages, set PACMAN_EXTRAPACKAGES to an empty value=
:
> > >
> > > make pacman-pkg PACMAN_EXTRAPACKAGES=3D
> > >
> > > or
> > >
> > > make pacman-pkg PACMAN_EXTRAPACKAGES=3D""
> > >
> > > Signed-off-by: Jose Fernandez <jose.fernandez@linux.dev>
> > > Reviewed-by: Peter Jung <ptr1337@cachyos.org>
> > > ---
> > > v1 -> v2: Build all extra packages by default. Remove unnecessary lin=
es.
> >
> >
> > I see only the main package built by default.
>
> Same.
>
> Do we even need PACMAN_EXTRAPACKAGES in the Makefile?
> IMO having it in the PKGBUILD would be enough.
> It can still be overriden from the commandline.
>
> > >
> > > In a previous patch, there was concern that adding a new debug packag=
e
> > > would increase the package time. To address this concern and provide
> > > more flexibility, this change has been added to allow users to decide
> > > which extra packages to include before introducing an optional debug
> > > package [1].
> > >
> > > [1] https://lore.kernel.org/lkml/20240801192008.GA3923315@thelio-3990=
X/T/
> > >
> > >  scripts/Makefile.package |  2 ++
> > >  scripts/package/PKGBUILD | 11 +++++++----
> > >  2 files changed, 9 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> > > index 4a80584ec771..ccdf8ba41f0b 100644
> > > --- a/scripts/Makefile.package
> > > +++ b/scripts/Makefile.package
> > > @@ -144,6 +144,8 @@ snap-pkg:
> > >  # pacman-pkg
> > >  # ------------------------------------------------------------------=
---------
> > >
> > > +PACMAN_EXTRAPACKAGES ?=3D headers api-headers
> >
> > Meaningless line.
> >
> >
> > Since 'export' is missing,
> > this default line is not propagated to PKGBUILD.
> >
> >
> > Nathan also mentioned 'export' would be needed if you wanted to
> > describe this here.
> >
> > https://lore.kernel.org/linux-kbuild/20240806025853.GB1570554@thelio-39=
90X/
>
> Same as above.
>
> > > +
> > >  PHONY +=3D pacman-pkg
> > >  pacman-pkg:
> > >         @ln -srf $(srctree)/scripts/package/PKGBUILD $(objtree)/PKGBU=
ILD
> > > diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> > > index 663ce300dd06..8de869f9b1d4 100644
> > > --- a/scripts/package/PKGBUILD
> > > +++ b/scripts/package/PKGBUILD
> > > @@ -3,10 +3,13 @@
> > >  # Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org=
>
> > >
> > >  pkgbase=3D${PACMAN_PKGBASE:-linux-upstream}
> > > -pkgname=3D("${pkgbase}" "${pkgbase}-api-headers")
> > > -if grep -q CONFIG_MODULES=3Dy include/config/auto.conf; then
> > > -       pkgname+=3D("${pkgbase}-headers")
> > > -fi
> > > +pkgname=3D("${pkgbase}")
> > > +
> > > +_extrapackages=3D${PACMAN_EXTRAPACKAGES:-}
> >
> >
> > Instead of adding inconsistent defaults in two places,
> > I would write like this:
> >
> > _extrapackages=3D${PACMAN_EXTRAPACKAGES-headers api-headers}
>
> Agreed.
>
> > Lastly, I will never accept new error messages
> > with CONFIG_MODULES=3Dn.
>
> Could you elaborate?
> For me this works fine with CONFIG_MODULES=3Dn.
> (After having fixed the above issues so all subpackages are built)



$ make  allnoconfig pacman-pkg


Check the linux-headers log closely.




--=20
Best Regards
Masahiro Yamada

