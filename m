Return-Path: <linux-kbuild+bounces-2140-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5EF909EA2
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Jun 2024 18:53:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB96D1C20970
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Jun 2024 16:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F36761773A;
	Sun, 16 Jun 2024 16:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ASneUhlo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA08B11CAB;
	Sun, 16 Jun 2024 16:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718556781; cv=none; b=ElM9Vt/eYrMyMUcefOzJH/CteeEWK6kzensW7UeCHn//M95zGZjUmzAxSLkikZAXnsJEU9axI7RI4HjK5G1qvO++XwkauilcdFVulBohBiiaHeqmBVDFi6WH/SSLAUwgb4DziNzxMrfobLMggJLruifm+ruAodEJVplnf7z0hnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718556781; c=relaxed/simple;
	bh=TYIRnGgy2E4bvlh1tTiwU8FbCAdnoxYRiDIauA4okG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oh1w4BV84cx6udiINqg/LyLCOo7J5YEKKmdPQj/Cj/PdGG7RWBIdA2XVE4yZCsnhBbJE/1Cy8TtcnROIlzvEZm6ygPiFqor9eCNkvA6ewvmEv2n+uEpjsBREnMRlr+MagXDJjfpRR4dBz80MvGCrP2dafQARpRUIwA/0aBs8Osw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ASneUhlo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F936C32786;
	Sun, 16 Jun 2024 16:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718556781;
	bh=TYIRnGgy2E4bvlh1tTiwU8FbCAdnoxYRiDIauA4okG8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ASneUhlolCpoLLFJsWeyOAFNxjSYuuHDoLl3fBXnsVvyoOZ5RugOHjwbWuPJ67kXX
	 RCkYjXO9Pf3ojUo9rC+q+LItw3YyZc2Dbok5zPlYZ4Zbz1NIHISgM5kW+KF9E/GsJK
	 K8RqQ2V/0yHfiZbaKnwvOCxg4P3hX21oHrtponfqkOcp24NCsbETHhSsNu4p6cIxDG
	 Ksh0VVOGydZ2pfdURmaPBI4fuIBcTrzEWFC+R9YhCRonrzDwIebyTlMgjEHKVgzP+E
	 NqYMZiz+q3pCv3wrgw3+6zYLlGOO5/i5s1+Jj1WlAtn4kY/gBSiLs/zd4LLSwMqVOY
	 w5ZI/im6UU/3Q==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52c819f6146so5081971e87.1;
        Sun, 16 Jun 2024 09:53:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXF/ogM+9FNKFQjhlEwXw8WvO+aI2Jj9VKazzuJ147DLRGOXj984ustuijNyHZZigP73H7Td1uugU+6+LAWb3YHxx2MM2fjI5uoDB6I
X-Gm-Message-State: AOJu0YxBf688gRPsexr7FtXWyBE9H1hHSPDUbuEDmcf6hUjrRobATrVp
	2YgwyfUvNJQmCLg3W10ohVxbO14qW8IxNQCzmy+7d2ZTvpmx2BDok9cUzqjoVT79OkCeXd56vvi
	xZf62C4oeNmM5D4o9KelEBE0BDy8=
X-Google-Smtp-Source: AGHT+IFmUm7AaYH99UZNL0CstSQF8PP/i7E9NjQO202kcCAVR/Hctps3V0pGrx4Nd3+61AhCrfOv1Y6du/6cWGFQ7gA=
X-Received: by 2002:ac2:528c:0:b0:52c:836c:9ce8 with SMTP id
 2adb3069b0e04-52ca6e5506amr5343760e87.4.1718556779870; Sun, 16 Jun 2024
 09:52:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240611160938.3511096-1-masahiroy@kernel.org>
 <20240611160938.3511096-2-masahiroy@kernel.org> <CAK7LNAQyPRKes7=wNtYXre+nU=5-1oZ-g1uzbjFMFd2e10jFjA@mail.gmail.com>
 <20240616-dandelion-lynx-of-philosophy-6be45f@lindesnes>
In-Reply-To: <20240616-dandelion-lynx-of-philosophy-6be45f@lindesnes>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 17 Jun 2024 01:52:23 +0900
X-Gmail-Original-Message-ID: <CAK7LNARPP_OsaOhUHT+5-vi5XJ36hDs0bNsiM7pwuAmj4S+MNg@mail.gmail.com>
Message-ID: <CAK7LNARPP_OsaOhUHT+5-vi5XJ36hDs0bNsiM7pwuAmj4S+MNg@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: package: add -e and -u options to shell scripts
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 12:56=E2=80=AFAM Nicolas Schier <nicolas@fjasle.eu>=
 wrote:
>
> On Mon, Jun 17, 2024 at 12:21:15AM +0900, Masahiro Yamada wrote:
> > On Wed, Jun 12, 2024 at 1:09=E2=80=AFAM Masahiro Yamada <masahiroy@kern=
el.org> wrote:
> > >
> > > Set -e to make these scripts fail on the first error.
> > >
> > > Set -u because these scripts are invoked by Makefile, and do not work
> > > properly without necessary variables defined.
> > >
> > > Remove the explicit "test -n ..." from scripts/package/install-extmod=
-build.
> > >
> > > Both options are described in POSIX. [1]
> > >
> > > [1]: https://pubs.opengroup.org/onlinepubs/009604499/utilities/set.ht=
ml
> > >
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > ---
> >
> >
> >
> > Setting -u needs more careful review and test.
> >
> >
> > This patch will break 'make deb-pkg'.
> >
> >
> > ./scripts/package/mkdebian: 150: KDEB_PKGVERSION: parameter not set
> >
> >
> >
> >
> > To set -u, scripts/package/mkdebian needs code refactoring.
> >
> >
> >
> > I will keep scripts/package/mkdebian untouched.
>
> uh, I missed that during the review.  Do you want to refactor mkdebian
> in large scale, or is an explicit fallback definition possibly
> acceptable for you?
>
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index ecfeb34b99aa..7e3878197041 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -7,5 +7,17 @@
>  set -eu
>
> +# Optional user-specified environment variables
> +
> +# Set target Debian architecture (skip auto-detection)
> +: "${KBUILD_DEBARCH:=3D}"
> +
> +# Set target Debian distribution (skipping auto-detection)
> +: "${KDEB_CHANGELOG_DIST:=3D}"
> +
> +# Overwrite the automatically determined package version.
> +: ${KDEB_PKGVERSION:=3D}
> +
> +
>  is_enabled() {
>         grep -q "^$1=3Dy" include/config/auto.conf
>  }
>




It depends on the code.




I would fix


   if [ -n "$KDEB_PKGVERSION" ]; then


to

   if [ "${KDEB_PKGVERSION:+set}" =3D set ]; then

or
   if [ "${KDEB_PKGVERSION:+set}" ]; then





--
Best Regards
Masahiro Yamada

