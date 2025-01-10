Return-Path: <linux-kbuild+bounces-5428-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7096A09885
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jan 2025 18:28:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 894637A02AF
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Jan 2025 17:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58FC32139D4;
	Fri, 10 Jan 2025 17:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BytBd/ac"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFE02135A5;
	Fri, 10 Jan 2025 17:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736530111; cv=none; b=af8zpguSd0W7y2DpLacsZAQqpuUl4gwRnMZbgEoPBLepEt1ncQV4tM9ezd8Hd4i1pfzkwN47AgxUzTGz2zrjI3fxmTb6kGNhcIYhno2RmsGtRLybcrHy20eSQ8eWeI9izDZVSqWioGA81c9GMU8SMLvoxQwMw3kdVcEEpejKQYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736530111; c=relaxed/simple;
	bh=6MfV+c1ZaQe/1twK5uro1+nBNoplq+ekqJ3i0aYzG60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qKC6f3RGYAg2EuOPePIcn9c8m9PoAecNdcCuoAxvQY41d+zUIAeffPX0rs6VbEt+oDg4GmRRBiAZNPZt5GMXTrx7tu+3ewJ1GR3bVponq9MV9+D3oz+X++QDCuvxAyFosI6XlgA2KmWah5IJU81kFE7vE4TPGSMN3Rp4n3oZnH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BytBd/ac; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E8D8C4CED6;
	Fri, 10 Jan 2025 17:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736530110;
	bh=6MfV+c1ZaQe/1twK5uro1+nBNoplq+ekqJ3i0aYzG60=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BytBd/acyQj0ALxeg1vUDH7bqxR4LYYk5VQSRCJ1kNfaPWABQW/hET3f3KlEKI0us
	 f02+dQLC3l7grXcN/kTFNvlo1XTpe+uXEyMa2pUvvaFZ30jSPCRYGsAWJ/Tngsx6yb
	 y555iIUYJ+WNJ1W0y8cYA3ocuAL7NFn3fXid1amIeIPJv0fxvzyGzJm8z/ePHr9Nhi
	 FLaBIIk0C3CI36cLqsXYL/Z0B8Nj+Qogyr2b1fZ0KvvnPcCa8lIQ1U43EtOyYPE2Mw
	 aEKSyTW/xr0E5DIrCELxc9xqJ1UMjqh5yQwiGwU5u5+ueDvmIBRgNlO6MENVSHKt0W
	 fjizU1ba0NE/w==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30219437e63so31936671fa.1;
        Fri, 10 Jan 2025 09:28:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUeo9zBDl3D3U5Mo9WpzNuIwTT0Zu5l7enW3ROOeYgaLHPXsVuxGEI00QQszQ0kXLlw0qlHiBRoolqQs6M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3V19T4AoZhVkT9dDAPcbZCUzVKsyJOjhXbH/Mh/tsQa+2KOB9
	QUMTmJcCxuvaRpPaCIKrIk3vUixkTJbjUkQFJKFBcAHT665Iy9sIksemU1aZr5ZUugvu/noBVUr
	LXoJJLNTlPL5FDPdlCzoPUDUm0IA=
X-Google-Smtp-Source: AGHT+IEfnQmjVm+6oSOXqudtWBQHUVH969AkS2u0VdBURG3fADp5IhZrjgQt22xWopFKkHXwaGLVArq7yN5WxEuQpIc=
X-Received: by 2002:a05:6512:10c7:b0:542:8696:b12c with SMTP id
 2adb3069b0e04-5428c2d8dd5mr2543610e87.18.1736530109315; Fri, 10 Jan 2025
 09:28:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5843611.DvuYhMxLoT@devpool47.emlix.com> <4945092.GXAFRqVoOG@devpool47.emlix.com>
In-Reply-To: <4945092.GXAFRqVoOG@devpool47.emlix.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 11 Jan 2025 02:27:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNASB=1jHSJfTBmHj4uYvKGBKoqo7xYx-KZCZNLFm-6uTkQ@mail.gmail.com>
X-Gm-Features: AbW1kvb1ssmG0bgb8_seaMt5xc6mcJ4KwAsfENz5QkibOgRWSEkLpuYFl4gpHOw
Message-ID: <CAK7LNASB=1jHSJfTBmHj4uYvKGBKoqo7xYx-KZCZNLFm-6uTkQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] kconfig: qconf: use QCommandLineParser
To: Rolf Eike Beer <eb@emlix.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 4:23=E2=80=AFPM Rolf Eike Beer <eb@emlix.com> wrote=
:
>
> This has a much nicer output without manual processing. It also adds wind=
ow
> management options from Qt for free.
>
> Signed-off-by: Rolf Eike Beer <eb@emlix.com>
> ---

This did not reflect my previous comment.
https://lore.kernel.org/linux-kbuild/CAK7LNASdLT-KQA7+Vn+Y2ZJeropcR-sjmv8p2=
=3DDCgzCyQdJAEw@mail.gmail.com/



>  scripts/kconfig/qconf.cc | 44 ++++++++++++++++------------------------
>  1 file changed, 17 insertions(+), 27 deletions(-)
>
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index eaa465b0ccf9..4d500cc9ba9d 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -8,6 +8,7 @@
>  #include <QActionGroup>
>  #include <QApplication>
>  #include <QCloseEvent>
> +#include <QCommandLineParser>
>  #include <QDebug>
>  #include <QFileDialog>
>  #include <QLabel>
> @@ -1785,41 +1786,30 @@ void fixup_rootmenu(struct menu *menu)
>         }
>  }
>
> -static const char *progname;
> -
> -static void usage(void)
> -{
> -       printf("%s [-s] <config>\n", progname);
> -       exit(0);
> -}
> -
>  int main(int ac, char** av)
>  {
>         ConfigMainWindow* v;
> -       const char *name;
> +       configApp =3D new QApplication(ac, av);
> +       QCommandLineParser cmdline;
> +       QCommandLineOption silent("s", "silent");
>
> -       progname =3D av[0];
> -       if (ac > 1 && av[1][0] =3D=3D '-') {
> -               switch (av[1][1]) {
> -               case 's':
> -                       conf_set_message_callback(NULL);
> -                       break;
> -               case 'h':
> -               case '?':
> -                       usage();
> -               }
> -               name =3D av[2];
> -       } else
> -               name =3D av[1];
> -       if (!name)
> -               usage();
> +       cmdline.addOption(silent);
> +       cmdline.addHelpOption();
> +       cmdline.addPositionalArgument("Kconfig", "Top-level Kconfig file"=
, "Kconfig");
> +
> +       cmdline.process(*configApp);
> +
> +       if (cmdline.isSet(silent))
> +               conf_set_message_callback(NULL);
>
> -       conf_parse(name);
> +       QStringList args =3D cmdline.positionalArguments();
> +       if (args.isEmpty())
> +               cmdline.showHelp(1);
> +
> +       conf_parse(args.first().toLocal8Bit().constData());
>         fixup_rootmenu(&rootmenu);
>         //zconfdump(stdout);
>
> -       configApp =3D new QApplication(ac, av);
> -
>         configSettings =3D new ConfigSettings();
>         configSettings->beginGroup("/kconfig/qconf");
>         v =3D new ConfigMainWindow();
> --
> 2.47.1
>
>
> --
> Rolf Eike Beer
>
> emlix GmbH
> Headquarters: Berliner Str. 12, 37073 G=C3=B6ttingen, Germany
> Phone +49 (0)551 30664-0, e-mail info@emlix.com
> District Court of G=C3=B6ttingen, Registry Number HR B 3160
> Managing Directors: Heike Jordan, Dr. Uwe Kracke
> VAT ID No. DE 205 198 055
> Office Berlin: Panoramastr. 1, 10178 Berlin, Germany
> Office Bonn: Bachstr. 6, 53115 Bonn, Germany
> http://www.emlix.com
>
> emlix - your embedded Linux partner
>
>


--=20
Best Regards
Masahiro Yamada

