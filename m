Return-Path: <linux-kbuild+bounces-2014-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D1D8FDF38
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Jun 2024 08:58:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE7FC1C21647
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Jun 2024 06:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D58513A3EC;
	Thu,  6 Jun 2024 06:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u+8HJfCW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E231513A3E2;
	Thu,  6 Jun 2024 06:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717657112; cv=none; b=Wei/Bp+hpzUp+3eQf2twIzUngc/He3HtgWM3ozcPFZr6M+/rVWcXJBbOXApvZ5+wgUaT88njjK0Mbv7k4PmETShMtwa/F4KSeOF6D5WLp1aM7Mvy8IhBssZUdfYmSVeByUKX4+QRQ6OFkiypR2Yh6D3mIJa67JJRBjwZ2O66OFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717657112; c=relaxed/simple;
	bh=SOJoCNmYjMp2sd9tajLrhObVAMG8hZ817lMHcW9drbA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XJnWAtpycxB4cYgZmf5vN1Bo7mG1fLWqyy8jb3RSNMCvKV8S1YgkdRndRp6UiQWBBxCDzHMXwUieVz8mCEuaCqQKigFK5sTrVUGfwXSCdh8M8nvLoS11Wk3X8yKDgbElsgeHqgJx2NN1zErE2dwtMNXWMSyeaOTN6BW6+mNLycQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u+8HJfCW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78EB1C4AF09;
	Thu,  6 Jun 2024 06:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717657111;
	bh=SOJoCNmYjMp2sd9tajLrhObVAMG8hZ817lMHcW9drbA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=u+8HJfCWnwpS9As1djoVl2cskbTf43cGyQ+FR3IhfNp9MNDL9jkZHM6HMxjBOWN6D
	 gIOzmbxOGgOM6QSxN5l/lU6mqOTpJoCg2Lqq7jbZ8+iInMylxkdLLQLbFB7WGKOukY
	 FO/O+5I2Wg+c2Kae+hQRJABhCIANdK2/x63xksVIdEqSi5Zy35oOxWPgYjUDLK8eQG
	 O6U9RZRlIH27D80bpt2Js5tRrlK7kCR6IjwXesZJDRJc/1EJghRJQKogCIRRuSPhTU
	 MbsHRGwbJGd9tIyUzI1Jlkfx47tQLxSWd0DMDec/Im2dcqXiZB4UD4BQMem/BiwB23
	 2KFwB10Orm+iQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2eabd22d404so6434621fa.2;
        Wed, 05 Jun 2024 23:58:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3AYhEUs9AKzEAfNgABH9BLwU/WB8SPpMuQWC4CWSL2opcTuXKK3gMltdZRGywr7nnS9ugcVQHorsNzV+2J3M7Cw/GnDA83qGq
X-Gm-Message-State: AOJu0YzsglZYrtqN29Sg3OZ6MMbim53c+svO/T4vLrlSEIjNt1gShi07
	F4R71+o9baWvzs2R8LnnLyZ94oVoys6zaDQzeQFtAKiUmG/rLyrzv7dTnkCU9i3d4YLxkhl1BX/
	6jfZ2/kZrJ5R4h+oKopWrW09kmHc=
X-Google-Smtp-Source: AGHT+IEYXt9x3kSfaB0uu/PNNOteVOLW1PlTcOpuUwyIrOMOW8URNfAeXhZE6sBkO0+owhNd1vEjf4TdSvBaNCd4BZ0=
X-Received: by 2002:a2e:804b:0:b0:2e5:685a:cd24 with SMTP id
 38308e7fff4ca-2eac798a96dmr26289171fa.6.1717657110169; Wed, 05 Jun 2024
 23:58:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240602125416.976336-1-masahiroy@kernel.org>
In-Reply-To: <20240602125416.976336-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 6 Jun 2024 15:57:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT_rH1ZcL2uhwRgVRLM58rvNMYuEMikdBr2ize-XLTHuw@mail.gmail.com>
Message-ID: <CAK7LNAT_rH1ZcL2uhwRgVRLM58rvNMYuEMikdBr2ize-XLTHuw@mail.gmail.com>
Subject: Re: [PATCH 1/3] kconfig: remove tristate choice support
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 2, 2024 at 9:54=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> I previously submitted a fix for a bug in the choice feature [1], where
> I mentioned, "Another (much cleaner) approach would be to remove the
> tristate choice support entirely".
>
> There are more issues in the tristate choice feature. For example, you
> can observe a couple of bugs in the following test code.
>
> [Test Code]
>
>     config MODULES
>             def_bool y
>             modules
>
>     choice
>             prompt "tristate choice"
>             default A
>
>     config A
>             tristate "A"
>
>     config B
>             tristate "B"
>
>     endchoice
>
> [Bug 1] the 'default' property is not correctly processed
>
> 'make alldefconfig' produces:
>
>     CONFIG_MODULES=3Dy
>     # CONFIG_A is not set
>     # CONFIG_B is not set
>
> However, the correct output should be:
>
>     CONFIG_MODULES=3Dy
>     CONFIG_A=3Dy
>     # CONFIG_B is not set
>
> The unit test file, scripts/kconfig/tests/choice/alldef_expected_config,
> is wrong as well.
>
> [Bug 2] choice members never get 'y' with randconfig
>
> For the test code above, the following combinations are possible:
>
>                A    B
>         (1)    y    n
>         (2)    n    y
>         (3)    m    m
>         (4)    m    n
>         (5)    n    m
>         (6)    n    n
>
> 'make randconfig' never produces (1) or (2).
>
> These bugs are fixable, but a more critical problem is the lack of a
> sensible syntax to specify the default for the tristate choice.
> The default for the choice must be one of the choice members, which
> cannot specify any of the patterns (3) through (6) above.
>
> In addition, I have never seen it being used in a useful way.
>
> The following commits removed unnecessary use of tristate choices:
>
>  - df8df5e4bc37 ("usb: get rid of 'choice' for legacy gadget drivers")
>  - bfb57ef0544a ("rapidio: remove choice for enumeration")
>
> This commit removes the tristate choice support entirely, which allows
> me to delete a lot of code, making further refactoring easier.
>
> This includes the revert of commit fa64e5f6a35e ("kconfig/symbol.c:
> handle choice_values that depend on 'm' symbols"). It was suspicious
> because it did not address the root cause but introduced inconsistency
> in visibility between choice members and other symbols.
>
> [1]: https://lore.kernel.org/linux-kbuild/20240427104231.2728905-1-masahi=
roy@kernel.org/T/#m0a1bb6992581462ceca861b409bb33cb8fd7dbae
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---


I will fix a couple of mistakes.



> diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
> index baa1c512de3c..217f85ea0910 100644
> --- a/scripts/kconfig/gconf.c
> +++ b/scripts/kconfig/gconf.c
> @@ -1067,10 +1067,7 @@ static gchar **fill_row(struct menu *menu)
>                         row[COL_VALUE] =3D
>                             g_strdup(menu_get_prompt(def_menu));
>
> -               if (sym_get_type(sym) =3D=3D S_BOOLEAN) {
> -                       row[COL_BTNVIS] =3D GINT_TO_POINTER(FALSE);
> -                       return row;
> -               }
> +               return row;



I accidentally dropped

  row[COL_BTNVIS] =3D GINT_TO_POINTER(FALSE);


I will restore it.

The intention is to drop the if-condition that
is always met.









> @@ -479,7 +461,7 @@ void sym_calc_value(struct symbol *sym)
>         }
>
>         sym->curr =3D newval;
> -       if (sym_is_choice(sym) && newval.tri =3D=3D yes)
> +       if (sym_is_choice(sym))
>                 sym->curr.val =3D sym_calc_choice(sym);
>         sym_validate_range(sym);
>


I will keep "&& newval.tri =3D=3D yes" here.


When a choice block is hidden by 'depends on',
there is no need to call sym_calc_choice().





--=20
Best Regards
Masahiro Yamada

