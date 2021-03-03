Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16AB932C1F1
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 01:03:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387582AbhCCTb2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Mar 2021 14:31:28 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:41877 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232069AbhCCLka (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Mar 2021 06:40:30 -0500
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 123BchjN031150;
        Wed, 3 Mar 2021 20:38:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 123BchjN031150
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614771524;
        bh=h3LNR7fqXEjV5dRyMGMzxh6NqG+1wU6ysQj2qblhhvc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=X6j6L+ct5IWSkS2hhP3wHjeSWa5tyg7rGb74AZI6AluWiL2bsMg81AYEYsM/F/w0X
         2qCmOgcTj9OTGTSo0jjpXuAKKTrRSFWzfvwk15RJDAVtJ+onIDMBE/IBWUEn0wb3vM
         3erMIMrbWk6/lmR2xpYOkG3Ih5FxULZd1tO7orqp24N8B5HAtFRS6Tbsa/j42b/59W
         gMdHFgAt9hNYORM1GD6Pcgk8V5stFtWEgmyuYwWscQ02Tc6ApPl+Vvf9PwamkKYasF
         5y2nYOz4NEmlaz/9PEWm9l/gSXsE+jWjwQxDW25OrCftuteKn8rNm8yLH8lgkSKP97
         oOaRhN2d/z+hA==
X-Nifty-SrcIP: [209.85.214.181]
Received: by mail-pl1-f181.google.com with SMTP id z7so13880922plk.7;
        Wed, 03 Mar 2021 03:38:43 -0800 (PST)
X-Gm-Message-State: AOAM530OoM4NFo+M3DOdZz2BeTnv2lLI0k8rqBeMHjL0Or37gVODrxRo
        5M0trloUdvDlrqYN/lWVfkuOwDa6furpXST8UMU=
X-Google-Smtp-Source: ABdhPJy5m7NZ7nI9yF1ughkJ515hruqzvRdlR0Sd4JiWa+uQR2PIqqhi79S9tmr2uACjr/aW1PWqPFGf89wbUOjkpSU=
X-Received: by 2002:a17:90a:5510:: with SMTP id b16mr9232214pji.87.1614771523191;
 Wed, 03 Mar 2021 03:38:43 -0800 (PST)
MIME-Version: 1.0
References: <20210302221211.1620858-1-bero@lindev.ch> <20210303040237.tvwo34j322tzqnwz@archlinux-ax161>
In-Reply-To: <20210303040237.tvwo34j322tzqnwz@archlinux-ax161>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 3 Mar 2021 20:38:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ8zvEv50HgD4HOzjMBYB7UAHggTsQ7OwoGgktXSDjzYQ@mail.gmail.com>
Message-ID: <CAK7LNAQ8zvEv50HgD4HOzjMBYB7UAHggTsQ7OwoGgktXSDjzYQ@mail.gmail.com>
Subject: Re: [PATCH] Fix ld-version.sh script if LLD was built with LLD_VENDOR
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@lindev.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 3, 2021 at 1:02 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Bernhard,
>
> I have added the ClangBuiltLinux mailing list, kbuild mailing list, and
> Masahiro and Nick to CC. Maybe ld-version.sh and cc-version.sh should be
> added to a MAINTAINERS entry to make sure we get CC'd (I can send one
> along tomorrow).
>
> On Tue, Mar 02, 2021 at 11:12:11PM +0100, Bernhard Rosenkr=C3=A4nzer wrot=
e:
> > If LLD was built with -DLLD_VENDOR=3D"xyz", ld.lld --version output
> > will prefix LLD_VENDOR. Since LLD_VENDOR can contain spaces, the
> > LLD identifier isn't guaranteed to be $2 either.
>
> TIL about LLD_VENDOR...
>
> > Adjust the version checker to handle such versions of lld.
> >
> > Signed-off-by: Bernhard Rosenkr=C3=A4nzer <bero@lindev.ch>
> > ---
> >  scripts/ld-version.sh | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
> > index a463273509b5..4c042a306e22 100755
> > --- a/scripts/ld-version.sh
> > +++ b/scripts/ld-version.sh
> > @@ -49,6 +49,18 @@ elif [ "$1" =3D LLD ]; then
> >       min_version=3D$lld_min_version
> >       name=3DLLD
> >       disp_name=3DLLD
> > +elif echo "$@" |grep -q ' LLD '; then
> > +     # if LLD was built with -DLLD_VENDOR=3D"xyz", it ld.lld --version
> > +     # says "xyz LLD [...]". Since LLD_VENDOR may contain spaces, we
> > +     # don't know the exact position of "LLD" and the version info
> > +     # at this point
> > +     while [ "$1" !=3D "LLD" ]; do
> > +             shift
> > +     done
> > +     version=3D$2
> > +     min_version=3D$lld_min_version
> > +     name=3DLLD
> > +     disp_name=3DLLD
> >  else
> >       echo "$orig_args: unknown linker" >&2
> >       exit 1
> > --
> > 2.30.1
> >
>
> I am not sure what a better fix would be of the top of my head but
> wouldn't it be better to avoid the duplication? This diff below works
> for me with or without LLD_VENDOR defined.
>
> diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
> index a463273509b5..84f9fc741f09 100755
> --- a/scripts/ld-version.sh
> +++ b/scripts/ld-version.sh
> @@ -44,7 +44,10 @@ if [ "$1" =3D GNU -a "$2" =3D ld ]; then
>  elif [ "$1" =3D GNU -a "$2" =3D gold ]; then
>         echo "gold linker is not supported as it is not capable of linkin=
g the kernel proper." >&2
>         exit 1
> -elif [ "$1" =3D LLD ]; then
> +elif echo "$*" | grep -q LLD; then
> +       while [ "$1" !=3D "LLD" ]; do
> +               shift
> +       done
>         version=3D$2
>         min_version=3D$lld_min_version
>         name=3DLLD



You do not need to use grep.
How about this?




        ...
else
        while [ $# -gt 1 -a "$1" !=3D "LLD" ]; do
               shift
        done

        if [ "$1" =3D LLD ]; then
                version=3D$2
                min_version=3D$lld_min_version
                name=3DLLD
                disp_name=3DLLD
        else
                echo "$orig_args: unknown linker" >&2
                exit 1
        fi
fi




--=20
Best Regards
Masahiro Yamada
