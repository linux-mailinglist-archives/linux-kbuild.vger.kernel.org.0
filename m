Return-Path: <linux-kbuild+bounces-2881-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7564594A8BD
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 15:38:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27D691F22A29
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 13:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7021E4EF5;
	Wed,  7 Aug 2024 13:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GhdpiMko"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209581E7A47;
	Wed,  7 Aug 2024 13:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723037906; cv=none; b=hVO9NLF3tEHvqIK8ynDu/px1xi0Qz4Fv0llC0vgItKytySMoZEUxhiYajbYvKDiupC0PybnZaZs5nQ0LzjlyvQ2abAhRtubORnEf+U4kYq8GcZW1+Szjz0Y/2ugd9VXIwGEWDhh3DxXCRQxYQhagntKsXa17owr5clHtu6Xgqys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723037906; c=relaxed/simple;
	bh=4pyVVLxfN/8PtB80M3gqmUAWqj5LYHDPi+1QR88V/+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tFSEh80JNazMTidV8Gv6i/w+IeNLaQxyMIrG/oMQ037O/vcx4bjttqem/GEC/Mnt8TbMqrX5hRrK+WLu/JYuuBPYO7R1DyYq0aXqBRUTCUCj3on1F5cJ1bOpZX9iZW8n1exoH550GumVZrKTvpDJ1nFFrmJywZr57zjZQqFNQnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GhdpiMko; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF2E5C4AF0F;
	Wed,  7 Aug 2024 13:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723037905;
	bh=4pyVVLxfN/8PtB80M3gqmUAWqj5LYHDPi+1QR88V/+o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GhdpiMkoBi/mrlzAXDy67cAx5zTY2LzGWr4jH1DDZh/jEyraVQnPW/lAwQNAdlkeV
	 iQV6OZO+iI7Pp45QxOqtGBHK0Mn945DaAkLZeRGTHK1AcsfJVK+wpfVqqwR8NsdoYO
	 0kfvRDgyT1dO+L5MgBYXztWSQGcxcNHqTNLtDKB/okXomT0dzqVsDvyOW+U0wfDiu2
	 E780rqJQm7j+9/jq81IBVbCLDqg50S4SE5ngT9e8QRGYPKVhrlMpKvIN+/23z5z7P6
	 xWi0IwohCEb4ctppMoJkBuzhjgMeoOeAQqb/6iwn8Gu8x/PIWpGmuwv5xC7y4ila90
	 xHf2nPEz7OdSg==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f189a2a841so17991011fa.3;
        Wed, 07 Aug 2024 06:38:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXmR7RS2jn64M5EK7+oWus6i8ZZKtADyOCRyvrZZZtFUJzEIxQyyL2g4vYbV9JB9/7nrhh1tAheWumC48kniVBKm1e0gCfzcZWYSMugTjSjH5L+lUUebffDisrG+08r4DzuKGGifnmalLNs
X-Gm-Message-State: AOJu0YzwObJ8GqYOJio6t7e1hPEgDt1zJ7pi+vcanaTw7STOi4fMrx2P
	egAsnlZLWQ2eboEq8zES4lsiRTLyxyQeZUuSSTLPtxJxw7yZ0o3nvmz0qNxlY8SN9Rmic746Qiz
	FonR9m2zEn25B2MnX1AUK2nGMYHc=
X-Google-Smtp-Source: AGHT+IFfRS8iHkHEnjdTgVCLxy/62DBz547RyyKG6hV9bq+sI6QhIraGhAmZqssi8MWywW9zEWzf2phjvBB1QDLcx9E=
X-Received: by 2002:a05:6512:3b81:b0:52c:d8e9:5d8b with SMTP id
 2adb3069b0e04-530bb3b6dcfmr10401335e87.25.1723037904313; Wed, 07 Aug 2024
 06:38:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240807022718.24838-2-jose.fernandez@linux.dev>
In-Reply-To: <20240807022718.24838-2-jose.fernandez@linux.dev>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 7 Aug 2024 22:37:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS4t_naRxdxFTaj9zrdf2Hjjoaq+cBO4Gx7=PhCJk9+4w@mail.gmail.com>
Message-ID: <CAK7LNAS4t_naRxdxFTaj9zrdf2Hjjoaq+cBO4Gx7=PhCJk9+4w@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: control extra pacman packages with PACMAN_EXTRAPACKAGES
To: Jose Fernandez <jose.fernandez@linux.dev>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Christian Heusel <christian@heusel.eu>, Peter Jung <ptr1337@cachyos.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 7, 2024 at 11:28=E2=80=AFAM Jose Fernandez <jose.fernandez@linu=
x.dev> wrote:
>
> Introduce a new variable, PACMAN_EXTRAPACKAGES, in the Makefile.package
> to control the creation of additional packages by the pacman-pkg target.
>
> The headers and api-headers packages will be included by default if
> PACMAN_EXTRAPACKAGES is not set. This changes the previous behavior
> where api-headers was always included, and headers was conditionally
> included if CONFIG_MODULES=3Dy. Now, this decision is delegated to the
> user.
>
> To disable extra packages, set PACMAN_EXTRAPACKAGES to an empty value:
>
> make pacman-pkg PACMAN_EXTRAPACKAGES=3D
>
> or
>
> make pacman-pkg PACMAN_EXTRAPACKAGES=3D""
>
> Signed-off-by: Jose Fernandez <jose.fernandez@linux.dev>
> Reviewed-by: Peter Jung <ptr1337@cachyos.org>
> ---
> v1 -> v2: Build all extra packages by default. Remove unnecessary lines.


I see only the main package built by default.




>
> In a previous patch, there was concern that adding a new debug package
> would increase the package time. To address this concern and provide
> more flexibility, this change has been added to allow users to decide
> which extra packages to include before introducing an optional debug
> package [1].
>
> [1] https://lore.kernel.org/lkml/20240801192008.GA3923315@thelio-3990X/T/
>
>  scripts/Makefile.package |  2 ++
>  scripts/package/PKGBUILD | 11 +++++++----
>  2 files changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index 4a80584ec771..ccdf8ba41f0b 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -144,6 +144,8 @@ snap-pkg:
>  # pacman-pkg
>  # ----------------------------------------------------------------------=
-----
>
> +PACMAN_EXTRAPACKAGES ?=3D headers api-headers

Meaningless line.


Since 'export' is missing,
this default line is not propagated to PKGBUILD.


Nathan also mentioned 'export' would be needed if you wanted to
describe this here.

https://lore.kernel.org/linux-kbuild/20240806025853.GB1570554@thelio-3990X/




> +
>  PHONY +=3D pacman-pkg
>  pacman-pkg:
>         @ln -srf $(srctree)/scripts/package/PKGBUILD $(objtree)/PKGBUILD
> diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> index 663ce300dd06..8de869f9b1d4 100644
> --- a/scripts/package/PKGBUILD
> +++ b/scripts/package/PKGBUILD
> @@ -3,10 +3,13 @@
>  # Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
>
>  pkgbase=3D${PACMAN_PKGBASE:-linux-upstream}
> -pkgname=3D("${pkgbase}" "${pkgbase}-api-headers")
> -if grep -q CONFIG_MODULES=3Dy include/config/auto.conf; then
> -       pkgname+=3D("${pkgbase}-headers")
> -fi
> +pkgname=3D("${pkgbase}")
> +
> +_extrapackages=3D${PACMAN_EXTRAPACKAGES:-}


Instead of adding inconsistent defaults in two places,
I would write like this:

_extrapackages=3D${PACMAN_EXTRAPACKAGES-headers api-headers}




Lastly, I will never accept new error messages
with CONFIG_MODULES=3Dn.







> +for pkg in $_extrapackages; do
> +       pkgname+=3D("${pkgbase}-${pkg}")
> +done
> +
>  pkgver=3D"${KERNELRELEASE//-/_}"
>  # The PKGBUILD is evaluated multiple times.
>  # Running scripts/build-version from here would introduce inconsistencie=
s.
> --
> 2.46.0
>


--
Best Regards
Masahiro Yamada

