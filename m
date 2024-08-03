Return-Path: <linux-kbuild+bounces-2797-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 680BC946A23
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Aug 2024 16:41:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2CEF1C20A96
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Aug 2024 14:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BED914E2FC;
	Sat,  3 Aug 2024 14:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G6L7REeE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE30C8F3;
	Sat,  3 Aug 2024 14:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722696079; cv=none; b=oTIbBOcRSp8LrmQ6siu/ok+ZvTsPOc89qCRf60eFIli3eTl66r5K2GkfORbq0I8REtcYY6e+2QumGXprIL1ORkpwUsuVu64J2O6Sco81SZCL15p+Kwbktlb+YqG6D5Jbq5ePdzVtpM4kr+0fLaq3GhB7vG/oa5OKR+kvwvnyhg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722696079; c=relaxed/simple;
	bh=Xk9VTGTVyzJpiEfkE95/RV6Fe8mxjpPpLCfJXj0+b4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lozra9iJbkDjdja7pngGEr3l8dS8O+CNcNc994s5cy3CGRZ5Q8HVHuT0LnzA+SzOEdmZVVbrZ64gCIurGMPGTguneQcg6NvRdvq1KGsZRWLiOelUSHSEPexeMbTmjVCqnodu7u3gXtLGCnQrp6u5JE/bOKdjf57BJ8ElwN1HnGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G6L7REeE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B74B5C4AF09;
	Sat,  3 Aug 2024 14:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722696078;
	bh=Xk9VTGTVyzJpiEfkE95/RV6Fe8mxjpPpLCfJXj0+b4Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=G6L7REeEnFn106RTX6qUIwq4GTDosIn52ypaxQWcpwmIIc0r+dI4xQqFKizF36yjq
	 S/eFY3kjiI4nnnluHj8i8ahklUvFGYeKFY4ZVaLZQrSobUjpw9AFUEtAn77oJQ8GLt
	 Li+zrRJWXUhcc28ypXssHQYA9Z3yIzDeqw17K4w17g9+4P7slkdCjT8o26ioIt0GVM
	 zdcI0dSw7xToAYfD+KaeS8DPhUhI6FgYHtkE7t3lWAD8Oqd+CyWiVbVj/GeO6E76r2
	 1npWZdRVUr09yuvwNYq54VpZhFLQsHpl3Jno9BPqyfwPrwE6QodAlH7S3G5rvkZtRU
	 04BPdkJcRGI4A==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52f00ad303aso13677895e87.2;
        Sat, 03 Aug 2024 07:41:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV/bibQnR/FQh4p/i/9+1H0J4fbihsOhHjn46K6V9TK6xu+/PDt/UA8fV+Q254W4AjalAl6VFJQLe1lxYcD+hPHQysa3LnoHsFKc8oabnWwYyXF9t3kkelUyJ4tDLLVGh86bsScZaBS5Und
X-Gm-Message-State: AOJu0Yy85IzqlJvoQT39bX+6mQiQ0/R32RPT8Ff4s7tP/M1d0rxsxcqQ
	Jm98MrsN8NF3I0y0pFN2DZAQfAgYNcnQUiSf65uBIxZsoW25ZYGtr9jNNqMj0+B6Rsw/BilXSLX
	8uUiWKnhRwLGMEpItTpgOq/WD2Io=
X-Google-Smtp-Source: AGHT+IH5Mh6XJneJSv/BGO3meQ0LVM1wz5bBcA2aJ4fB/5tQgvkpfJEGp2pzq8XYGydAX0ex5IfiOLueNIYlSHqi7ug=
X-Received: by 2002:a05:6512:31d6:b0:52e:9619:e26a with SMTP id
 2adb3069b0e04-530bb3a1d03mr4812541e87.26.1722696077336; Sat, 03 Aug 2024
 07:41:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240801132945.47963-1-jose.fernandez@linux.dev>
 <20240801183637.GB122261@thelio-3990X> <ab9f18b2-a27c-4ac8-bffa-390a8960387b@t-8ch.de>
In-Reply-To: <ab9f18b2-a27c-4ac8-bffa-390a8960387b@t-8ch.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 3 Aug 2024 23:40:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNARAHBS9OR5R2EzwKQQonWmF=H1a-C6xG9K2GAWJ8dk43w@mail.gmail.com>
Message-ID: <CAK7LNARAHBS9OR5R2EzwKQQonWmF=H1a-C6xG9K2GAWJ8dk43w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add debug package to pacman PKGBUILD
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Jose Fernandez <jose.fernandez@linux.dev>, 
	Christian Heusel <christian@heusel.eu>, Nicolas Schier <nicolas@fjasle.eu>, 
	Peter Jung <ptr1337@cachyos.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 2, 2024 at 3:54=E2=80=AFAM Thomas Wei=C3=9Fschuh <linux@weisssc=
huh.net> wrote:
>
> On 2024-08-01 11:36:37+0000, Nathan Chancellor wrote:
> > Hi Jose,
> >
> > On Thu, Aug 01, 2024 at 07:29:40AM -0600, Jose Fernandez wrote:
> > > Add a new -debug package to the pacman PKGBUILD that will contain the
> > > vmlinux image for debugging purposes. This package depends on the
> > > -headers package and will be installed in /usr/src/debug/${pkgbase}.
> > >
> > > The vmlinux image is needed to debug core dumps with tools like crash=
.
> > >
> > > Signed-off-by: Jose Fernandez <jose.fernandez@linux.dev>
> > > Reviewed-by: Peter Jung <ptr1337@cachyos.org>
> >
> > This appears to add a non-trivial amount of time to the build when benc=
hmarking
> > with Arch Linux's configuration (I measure 9% with hyperfine):
>
> As nothing more is compiled, I guess this is just the additional
> packaging.
>
> > Benchmark 1: pacman-pkg @ 21b136cc63d2 ("minmax: fix up min3() and max3=
() too")
> >   Time (mean =C2=B1 =CF=83):     579.541 s =C2=B1  0.585 s    [User: 22=
156.731 s, System: 3681.698 s]
> >   Range (min =E2=80=A6 max):   578.894 s =E2=80=A6 580.033 s    3 runs
> >
> > Benchmark 2: pacman-pkg @ c5af4db0563b ("kbuild: add debug package to p=
acman PKGBUILD")
> >   Time (mean =C2=B1 =CF=83):     633.419 s =C2=B1  0.972 s    [User: 22=
247.886 s, System: 3673.879 s]
> >   Range (min =E2=80=A6 max):   632.302 s =E2=80=A6 634.070 s    3 runs
> >
> > Summary
> >   pacman-pkg @ 21b136cc63d2 ("minmax: fix up min3() and max3() too") ra=
n
> >     1.09 =C2=B1 0.00 times faster than pacman-pkg @ c5af4db0563b ("kbui=
ld: add debug package to pacman PKGBUILD")
> >
> > It would be nice to add some option to avoid building this package for
> > developers who may not want it (I know I personally would not want it
> > with that penalty because I do a lot of bisects) or maybe adding a
> > target to build this package with the rest like 'pacman-pkg-with-dbg' o=
r
> > something? Also, couldn't vmlinux be obtained from vmlinuz that already
> > exists in the main package via scripts/extract-vmlinux?
>
> Jose:
>
> In the vanilla PKGBUILD vmlinux is part of the linux-headers package:
> linux-headers /usr/lib/modules/6.10.2-arch1-1/build/vmlinux
>
> Given that you already gate the new -debug package on CONFIG_MODULES,
> why not add the file to that package?


I do not know why CONFIG_MODULES controls the debug package.

If this is really for debugging purposes, CONFIG_DEBUG_INFO is more suitabl=
e.
Without CONFIG_DEBUG_INFO, vmlinux contains only limited amount of
information.


scripts/package/mkdebian use CONFIG_DEBUG_INFO to enable
the debug package.






--=20
Best Regards
Masahiro Yamada

