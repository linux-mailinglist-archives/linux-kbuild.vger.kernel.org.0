Return-Path: <linux-kbuild+bounces-1781-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A68E48BC191
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 May 2024 17:02:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A7E71F21457
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 May 2024 15:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DFD52C6A3;
	Sun,  5 May 2024 15:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SOm2MoZe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251CF1D555;
	Sun,  5 May 2024 15:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714921348; cv=none; b=W3QAgH7ze45Y0vc+A6m3qP9LYCmtWvRZivv5t7nG/ZpTKVKh1yk2wtbvC9GoRSYUm0OvxkViFCKs8y2fobdB7icE3Vqh9RV3Fxd9WiCmqtT2S4A42AvaCndRNeSbe5Y1l4rK1xATmgh0W8WA58C4W8iKFk6fxtNcj6ViPyVal7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714921348; c=relaxed/simple;
	bh=vo2e+dDUGQPlquOGMwije3nIq/tJ2jZLuO38KYfmmFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dnXUlwDjZjVSly452EV5EiqYUiECjY519H1Dt0H9yjM7nJh096QO6cE7PHdeMsqRoSXEFgT0zGMJwcxO3eQTTIv4emXCFQ59s0T//Ytn7G54tx6A9XDNTTCDJ3hUdSwxQ28CMbefQefJ64ZUtgJIko+LS0XBR53x4kShN3CH2y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SOm2MoZe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0087C113CC;
	Sun,  5 May 2024 15:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714921348;
	bh=vo2e+dDUGQPlquOGMwije3nIq/tJ2jZLuO38KYfmmFU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SOm2MoZeLHTFZxI4BWo7aGnnfNo6BYnPfPzyxDWhBMkvnygmbGAuR4+dEfHJs+yHk
	 ZUDhQZnibh+BO+SSiGYt1KwU2nNCc1JM0zTXfZ4XUnVuyAAr9gkwmQgzraat46awQl
	 fOg6Til2vSA62/tyIf3bVUuF4ON5wTjOqvQ83SHSHcNrv5FoKx2ih9Jiq7PUrPXKwX
	 n4vCAUHFJhfg2p6IibjIHOyPq3u03emIHhfEwT390jIKcdnoRp/X4FKaycxRXRCtfa
	 Pl+8sJni1Zw450It2kyYMJ7CKq6Pn1UFK/xc8ePu+den5UVzCeYQf8sNrCcEAgNFBj
	 87R+RLWqsxS1Q==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-51ae2e37a87so1500389e87.2;
        Sun, 05 May 2024 08:02:27 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw12PaTFfmS6jpAi+uh6q7ZQAdFqjCH6ZNcP/v8zGU3C6zkFrJx
	m1w1v1f0oajcJ0RSG6OVTNVsQtkyy3oP4w/IFt+TDd7bcuUaEJBoCnxs0CEGX0o7KGihEcV+6KN
	VHJakTUzkHC+granNBpKzGicnpu8=
X-Google-Smtp-Source: AGHT+IEBP19xZ4rEa8m9oxMRY79yhMKDB5FM9Vnx1mR80sRZjcajSvvvfADIvOsvpQXbasoA2eGxJcyMwMRrU6ySjgc=
X-Received: by 2002:a05:6512:10c7:b0:51e:e703:c878 with SMTP id
 k7-20020a05651210c700b0051ee703c878mr1780465lfg.14.1714921346575; Sun, 05 May
 2024 08:02:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240504183333.2031860-1-masahiroy@kernel.org> <20240504183333.2031860-10-masahiroy@kernel.org>
In-Reply-To: <20240504183333.2031860-10-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 6 May 2024 00:01:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNARNC0ma5FP8WJ23RP-8K2iEz3vDhoB7mhqaFyLP85zgpw@mail.gmail.com>
Message-ID: <CAK7LNARNC0ma5FP8WJ23RP-8K2iEz3vDhoB7mhqaFyLP85zgpw@mail.gmail.com>
Subject: Re: [PATCH 10/10] kconfig: turn defaults and additional prompt for
 choice members into error
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 5, 2024 at 3:34=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> menu_finalize() warns default properties for choice members and prompts
> outside the choice block. These should be hard errors.
>
> While I was here, I moved the checks to slim down menu_finalize().
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/kconfig/menu.c   | 10 ----------
>  scripts/kconfig/parser.y | 39 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 39 insertions(+), 10 deletions(-)
>
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index a9b1e451dfe7..bee96c9964fd 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -507,16 +507,6 @@ static void _menu_finalize(struct menu *parent, bool=
 inside_choice)
>                     menu->sym && !sym_is_choice_value(menu->sym)) {
>                         current_entry =3D menu;
>                         menu->sym->flags |=3D SYMBOL_CHOICEVAL;
> -                       for (prop =3D menu->sym->prop; prop; prop =3D pro=
p->next) {
> -                               if (prop->type =3D=3D P_DEFAULT)
> -                                       prop_warn(prop, "defaults for cho=
ice "
> -                                                 "values not supported")=
;
> -                               if (prop->menu =3D=3D menu)
> -                                       continue;
> -                               if (prop->type =3D=3D P_PROMPT &&
> -                                   prop->menu->parent->sym !=3D sym)
> -                                       prop_warn(prop, "choice value use=
d outside its choice group");
> -                       }
>                         /* Non-tristate choice values of tristate choices=
 must
>                          * depend on the choice being set to Y. The choic=
e
>                          * values' dependencies were propagated to their
> diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
> index ed86869e5ed0..0a9e249b5dcc 100644
> --- a/scripts/kconfig/parser.y
> +++ b/scripts/kconfig/parser.y
> @@ -476,6 +476,37 @@ assign_val:
>
>  %%
>
> +/**
> + * choice_check_sanity - check sanity of a choice member
> + *
> + * @menu: menu of the choice member
> + *
> + * Return: -1 if an error is found, 0 otherwise.
> + */
> +static int choice_check_sanity(struct menu *menu)
> +{
> +       struct property *prop;
> +       int ret =3D 0;
> +
> +       for (prop =3D menu->sym->prop; prop; prop =3D prop->next) {
> +               if (prop->type =3D=3D P_DEFAULT) {
> +                       fprintf(stderr, "%s:%d: error: %s",
> +                               prop->filename, prop->lineno,
> +                               "defaults for choice values not supported=
\n");
> +                       ret =3D -1;
> +               }
> +
> +               if (prop->menu !=3D menu && prop->type =3D=3D P_PROMPT) {
> +                       fprintf(stderr, "%s:%d: error: %s",
> +                               prop->filename, prop->lineno,
> +                               "choice value has a prompt outside its ch=
oice group\n");
> +                       ret =3D -1;
> +               }
> +       }
> +
> +       return ret;
> +}
> +



I observed an error in powerpc.

I will fix up this as follows:


diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index 0a9e249b5dcc..ff709001b1f0 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -496,7 +496,8 @@ static int choice_check_sanity(struct menu *menu)
                        ret =3D -1;
                }

-               if (prop->menu !=3D menu && prop->type =3D=3D P_PROMPT) {
+               if (prop->menu !=3D menu && prop->type =3D=3D P_PROMPT &&
+                   prop->menu->parent !=3D menu->parent) {
                        fprintf(stderr, "%s:%d: error: %s",
                                prop->filename, prop->lineno,
                                "choice value has a prompt outside its
choice group\n");






--=20
Best Regards
Masahiro Yamada

