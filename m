Return-Path: <linux-kbuild+bounces-3079-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE50955C6C
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Aug 2024 14:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CC3C1F21368
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Aug 2024 12:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2601BC20;
	Sun, 18 Aug 2024 12:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C8Ehl/1c"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8691FDA;
	Sun, 18 Aug 2024 12:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723984585; cv=none; b=FA6x/qnZmrEPArFHP/QQ9mzkAfqFpTXyzakv8aOYEzdFoQAEtvNvhgiafb1AVoR+Pz8pfABWCSURfoV98vjHg52Wivj8mlbbtvA/bN8dRHYxu663sp9gAyc4bACBOVJuJ/oCdmld0pvG6zQEKMKvin7vBgk/V1ApHXmsmRAR02M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723984585; c=relaxed/simple;
	bh=z5VreKbZVFWDY1lWwUvhKJuhphwh2NNqI33HgO8xtTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hXGtMlmrd6Ah7g4yTLtPGM1Ef1VjkMp8X9ykzEuaArYMHXH/KKf1KXQiKqVf3UdAcW+yGAq48houepdQqVV1LRj0LnAaSHVb1rUqcr1MhrjD6T4l/2dguxELhp0MZxDaIZ0Ix8aHR8pO8toUOJc0oT3dnE4p8rMuVA+j/srPpV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C8Ehl/1c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A76E5C4AF0F;
	Sun, 18 Aug 2024 12:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723984584;
	bh=z5VreKbZVFWDY1lWwUvhKJuhphwh2NNqI33HgO8xtTw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=C8Ehl/1cua8AG6gPVL5bbtiXM6gRTV0GDHTUlZOzLeTQuWM6n6LhyUY7BfbVOJ9PY
	 gulhZJg5aamMRtBKBXx6Mo1yREXGoa/c1MUxzc+1ix4WKlULf2Ev1Ywj59ZpuyBYzh
	 1PqNpHbn9sHLYz6ULN89HOW3aznk6D/e38jbsIUdO8x+04YmRgYEd9M13VYRqncL2B
	 kK3C5HeXofbtYgMXzvDdTTV7oLpKcAV4PXgOKYUvCHjtDBzDs5q2LM/A4NF2vcdHT3
	 yFJgNv1O+WS5w9XWacVPjsC56Bb7f9FHKpesSzccgDfjriUDGWkBeAJQN+0W0a9O+c
	 tv4K14B0+gIcg==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ef2cce8be8so37933981fa.1;
        Sun, 18 Aug 2024 05:36:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXqMtRAQc1IYKS2UK4RBZbdnjouCksjK/JRVeU//Pm6qtWfiuzsJ1S6WHhw3H8u8nP/yM6pEcw2SNNw9nwjXvja+6gb9MTjZ29j675v50OJYAbCqihucAScdlMI/fa7MRJeaffMMj5JeNgK
X-Gm-Message-State: AOJu0Yyr0kzBTkFRwk93DsbR1N1AOsLM2topxecxYyzjKaSyHfu53Nvp
	o/sMjy3Flkb1BMJ4Zyj1jIiF6E03xQSHLeMYU1v7jWGsECQYgP0X1TbgO5zs8lHfKwjz8tBPoQK
	lALhgGLLLshZN1QQqObTKbOBK/pQ=
X-Google-Smtp-Source: AGHT+IGExuwdoLG2rFjDOYTJEkMwJ4nx7vH5mGIfSqP2PgDJzu9gmetlp9q4heDfwE1dVWWyDrk0qskevmPKBcJZsrY=
X-Received: by 2002:a05:6512:3ca0:b0:52e:9481:eaa1 with SMTP id
 2adb3069b0e04-5331c6b0156mr5518221e87.23.1723984583333; Sun, 18 Aug 2024
 05:36:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240817151147.156479-1-jose.fernandez@linux.dev>
In-Reply-To: <20240817151147.156479-1-jose.fernandez@linux.dev>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 18 Aug 2024 21:35:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQMMTRX94dJVWiaB5iVFQcVwCUXGQFEHQN_S0ZWjQTZKw@mail.gmail.com>
Message-ID: <CAK7LNAQMMTRX94dJVWiaB5iVFQcVwCUXGQFEHQN_S0ZWjQTZKw@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: add debug package to pacman PKGBUILD
To: Jose Fernandez <jose.fernandez@linux.dev>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Christian Heusel <christian@heusel.eu>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Peter Jung <ptr1337@cachyos.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 12:12=E2=80=AFAM Jose Fernandez
<jose.fernandez@linux.dev> wrote:
>
> Add a new debug package to the PKGBUILD for the pacman-pkg target. The
> debug package includes the non-stripped vmlinux file, providing access
> to debug symbols needed for kernel debugging and profiling. The vmlinux
> file will be installed to /usr/src/debug/${pkgbase}. The debug package
> will be built by default and can be excluded by overriding PACMAN_EXTRAPA=
CKAGES.
>
> Signed-off-by: Jose Fernandez <jose.fernandez@linux.dev>
> Reviewed-by: Peter Jung <ptr1337@cachyos.org>
> ---
> v1->v2:
> - Use the new PACMAN_EXTRAPACKAGES [1] variable to allow users to disable=
 the
> debug package if desired, instead of always including it.
>
> [1] https://lore.kernel.org/lkml/20240813185900.GA140556@thelio-3990X/T/
>
>  scripts/package/PKGBUILD | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> index fbd7eb10a52c..d40d282353de 100644
> --- a/scripts/package/PKGBUILD
> +++ b/scripts/package/PKGBUILD
> @@ -5,7 +5,7 @@
>  pkgbase=3D${PACMAN_PKGBASE:-linux-upstream}
>  pkgname=3D("${pkgbase}")
>
> -_extrapackages=3D${PACMAN_EXTRAPACKAGES-headers api-headers}
> +_extrapackages=3D${PACMAN_EXTRAPACKAGES-headers api-headers debug}
>  for pkg in $_extrapackages; do
>         pkgname+=3D("${pkgbase}-${pkg}")
>  done
> @@ -106,6 +106,15 @@ _package-api-headers() {
>         ${MAKE} headers_install INSTALL_HDR_PATH=3D"${pkgdir}/usr"
>  }
>
> +_package-debug(){
> +       pkgdesc=3D"Non-stripped vmlinux file for the ${pkgdesc} kernel"
> +       depends=3D(${pkgbase}-headers)


Why is this dependency necessary?





> +
> +       cd "${objtree}"
> +       mkdir -p "$pkgdir/usr/src/debug/${pkgbase}"
> +       install -Dt "$pkgdir/usr/src/debug/${pkgbase}" -m644 vmlinux
> +}
> +
>  for _p in "${pkgname[@]}"; do
>         eval "package_$_p() {
>                 $(declare -f "_package${_p#$pkgbase}")
>
> base-commit: 869679673d3bbaaf1c2a43dba53930f5241e1d30
> --
> 2.46.0
>
>


--=20
Best Regards
Masahiro Yamada

