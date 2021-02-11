Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D269318D2B
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Feb 2021 15:20:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231643AbhBKOSp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Feb 2021 09:18:45 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:20837 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231604AbhBKOQw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Feb 2021 09:16:52 -0500
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 11BEFoO9025222;
        Thu, 11 Feb 2021 23:15:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 11BEFoO9025222
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613052951;
        bh=5fMtClGpoOrpoSoRrTR5BZN+eGFqxHSGcW74p7s3slQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=SAhz02vXs3HY3GenWTbdjLwoW/yrbaOKzaHQUoB9J1p31QBZAV/KtclQQoVIAKf9H
         4MLwlxa3ldYyeTpnKg5aVfeYEU10dbw/j2tRZU/CyD4j22XEl+06g3aLWq+xPw77fF
         yFSsGP4pn5ZmJOnJjw013mmuPctvSKVtlMMqotO9A5EPZ6NsjkTRhWUrrESxX8TLSJ
         vdZkIhiyHZUN3/GUOOsPUn1lA42F375yzqhDQm9dqF7Lk2Pmx8G9vuCeGPng9DU9IW
         WYENVvmREQcVN4WehpalSD2tyQAuocdect4inCjbPaX8tUFYr8nO6uxB0sx2K4G+oS
         Iy+MgESuIVbAA==
X-Nifty-SrcIP: [209.85.210.175]
Received: by mail-pf1-f175.google.com with SMTP id k13so3743000pfh.13;
        Thu, 11 Feb 2021 06:15:51 -0800 (PST)
X-Gm-Message-State: AOAM531SVuxw+LScslYlhF/sPljCY3nqUA4MXU9lOohwcLW48QkLEr4m
        jWGP/6J84kDqQpPlyiQxUN6kB3R0lhpyr2DgHsw=
X-Google-Smtp-Source: ABdhPJzeXpxWnXbG4wYnw82AkDZ8f5UzbU5XglDNt7EcHb7u5OgQ4d6hgfmNs+nW+gaxrnJbEjXgrHSvuET/GatC9BU=
X-Received: by 2002:a62:b416:0:b029:1e4:fb5a:55bb with SMTP id
 h22-20020a62b4160000b02901e4fb5a55bbmr8068091pfn.80.1613052950036; Thu, 11
 Feb 2021 06:15:50 -0800 (PST)
MIME-Version: 1.0
References: <1612783737-3512-1-git-send-email-stephenzhangzsd@gmail.com>
 <20210208195439.GA1097868@ubuntu-m3-large-x86> <CALuz2=d-ENRbWgGYaO_ESEaw5eOVSwkQmkeYBJ-w0Vb3zZ+REg@mail.gmail.com>
 <20210209192729.GA820978@ubuntu-m3-large-x86> <CALuz2=dyA_ki98t8VNe2L1UcBXrSoJT1r6j1puEmLn7WrX87XQ@mail.gmail.com>
 <20210210182400.GA3502674@ubuntu-m3-large-x86> <CALuz2=eSv2N2Qp7GimLgdWjvWDwDh1Dj0Q7Czm4Br5a50rs4ew@mail.gmail.com>
In-Reply-To: <CALuz2=eSv2N2Qp7GimLgdWjvWDwDh1Dj0Q7Czm4Br5a50rs4ew@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 11 Feb 2021 23:15:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT+CG9zqPpYLoy9_1eA4caZWzxyQACcOrhbg9zfArEwPQ@mail.gmail.com>
Message-ID: <CAK7LNAT+CG9zqPpYLoy9_1eA4caZWzxyQACcOrhbg9zfArEwPQ@mail.gmail.com>
Subject: Re: [PATCH v1] clang_tools:gen_compile_commands: Change the default
 source directory
To:     Stephen Zhang <stephenzhangzsd@gmail.com>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Tom Roeder <tmroeder@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Feb 11, 2021 at 10:48 PM Stephen Zhang
<stephenzhangzsd@gmail.com> wrote:
>
> Nathan Chancellor <nathan@kernel.org> =E4=BA=8E2021=E5=B9=B42=E6=9C=8811=
=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=882:24=E5=86=99=E9=81=93=EF=BC=
=9A
> >
> > On Wed, Feb 10, 2021 at 08:15:27PM +0800, Stephen Zhang wrote:
> > > Nathan Chancellor <nathan@kernel.org> =E4=BA=8E2021=E5=B9=B42=E6=9C=
=8810=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=883:27=E5=86=99=E9=81=93=
=EF=BC=9A
> > >
> > > > Just as an FYI, your email was HTML, which means it won't hit LKML.
> > >
> > >
> > > Thanks for pointing that out. The existence of a GFW makes it difficu=
lt for
> > > me to connect
> > > to the mail server.  so I use git client to send patches only and rep=
ly to
> > > emails with
> > > gmail  web client.
> >
> > You can configure your Gmail web client to send text responses by
> > default by clicking on the three dot menu in the compose window then
> > chose the "plain text mode" option.
> >
>
> Thanks, this has always been a problem for me.
>
> > The build directory needs to be involved because that is where the .cmd
> > files will be but the source directory needs to be known because the
> > source files in the .cmd files are relative to the source directory, no=
t
> > the build directory. This happens to work in most situations like I
> > point out above but not always.
> >
> > I think that my patch is most likely the way to go unless others feel
> > differently. It would be nice if you could give it a go.
> >
> > Cheers,
> > Nathan
>
> Do you mean  my patch's failure  in some cases  is because the build
> directoty isn't involved after using "-d" to specify the source directory=
?
>
> Actually, the build directory has already been involved by the "path"
> argument. See:
>
> def main():
>     for path in paths:
>          ....
>         if os.path.isdir(path):
>             cmdfiles =3D cmdfiles_in_dir(path)
>         .....
>
> where the value of paths  is passed by  the "path" argument. Do I miss
> something?
>
> Cheers,
> Stephen
>
> --
> You received this message because you are subscribed to the Google Groups=
 "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/clang-built-linux/CALuz2%3DeSv2N2Qp7GimLgdWjvWDwDh1Dj0Q7Czm4Br5a50rs4ew%4=
0mail.gmail.com.



Please stop.


Commit 6ca4c6d25949117dc5b4845612e290b6d89e70a8
removed the tools/ support.


There exist two build systems in the Linux source tree.
Kbuild covers the entire tree except tools/.
The tools/ directory adopts a different build system.

It is a pity that the tools/ directory
went in a wrong direction, and people
try to fix problems in a wrong layer.


You are not the first person to send to
tweak obj/source trees of this script.

You can not do this correctly
without terribly messing up the code.

Please do not try to support tools/.



--=20
Best Regards
Masahiro Yamada
