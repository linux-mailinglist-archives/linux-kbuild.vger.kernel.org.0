Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A24831B176
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Feb 2021 18:11:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229827AbhBNRL1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 14 Feb 2021 12:11:27 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:53950 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229740AbhBNRL0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 14 Feb 2021 12:11:26 -0500
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 11EHAJti015742;
        Mon, 15 Feb 2021 02:10:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 11EHAJti015742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613322619;
        bh=AKibQdTfYpXAHbNU65EfzxWhQaz2P4iDR0bB+qbheXc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=abGRwKM6fVNEZcvyV1OPeoNza+R9otINiNX+zqncSp/Q35rLfSnihK9eOyCLE+OJZ
         v1eLrAdBOEWhm+zJD4JAz0fPDf1rHuk6fnqXudkzNw2O+hCsvXvMVtt3794mYkTs0n
         Roz7TkEy3UsKxVYZlodf85PKV0DHg81+PIfytdj8VZFFOjx7j/BrpGzsnWR4RKEdcz
         W+hLyiAEfOJVK1/J9jfXWiVfXKmTvYk8LOHfJgYa8QdcRUsr4fvdXRyIFNfr+o9hIM
         rrgepKepo3Yu3huzIKcK6+CXzurZ1gXIonHhaVkwZPgT9Tip9KfPgg/vMs0+KjVlMJ
         zdRxZeabqvWJA==
X-Nifty-SrcIP: [209.85.216.43]
Received: by mail-pj1-f43.google.com with SMTP id gx20so2498093pjb.1;
        Sun, 14 Feb 2021 09:10:19 -0800 (PST)
X-Gm-Message-State: AOAM531aWR05QmeY7MCPjffrde4EdhOJ/Wg3//1NTHe7LX3efFOApcC8
        /QqrNIdq7R0ZZdyWtk/y+9jjAJzUJMAAvQeCQsA=
X-Google-Smtp-Source: ABdhPJw3NIZM/5T3V3f4GQzv+BK1tZJX3dFumflRx3g80OFhg67FD2XPvxRxeA0ACgp/sC3pJlybZWD2ay17c3wk3SQ=
X-Received: by 2002:a17:902:8687:b029:e1:601e:bd29 with SMTP id
 g7-20020a1709028687b02900e1601ebd29mr11729469plo.47.1613322618753; Sun, 14
 Feb 2021 09:10:18 -0800 (PST)
MIME-Version: 1.0
References: <1612783737-3512-1-git-send-email-stephenzhangzsd@gmail.com>
 <20210208195439.GA1097868@ubuntu-m3-large-x86> <CALuz2=d-ENRbWgGYaO_ESEaw5eOVSwkQmkeYBJ-w0Vb3zZ+REg@mail.gmail.com>
 <20210209192729.GA820978@ubuntu-m3-large-x86> <CALuz2=dyA_ki98t8VNe2L1UcBXrSoJT1r6j1puEmLn7WrX87XQ@mail.gmail.com>
 <20210210182400.GA3502674@ubuntu-m3-large-x86> <CALuz2=eSv2N2Qp7GimLgdWjvWDwDh1Dj0Q7Czm4Br5a50rs4ew@mail.gmail.com>
 <CAK7LNAT+CG9zqPpYLoy9_1eA4caZWzxyQACcOrhbg9zfArEwPQ@mail.gmail.com>
 <CALuz2=ck_=M6Dd8oFgWxnRGdipWOsdL2KODZQSmodh2N7Z8T-w@mail.gmail.com>
 <CAK7LNAR06H3Ue5SG3=6u1veyjg+kXXb2isEBsHVQEtMMJ3d2Tw@mail.gmail.com> <CALuz2=fHXZ=NrVdRNzyromD88wp9pAzYC9nffPt6y5YM=sJniw@mail.gmail.com>
In-Reply-To: <CALuz2=fHXZ=NrVdRNzyromD88wp9pAzYC9nffPt6y5YM=sJniw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 15 Feb 2021 02:09:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNARoL19wQo84AZAizZBzXJKkg3KciryQU+Sm5Uc4BDd9DA@mail.gmail.com>
Message-ID: <CAK7LNARoL19wQo84AZAizZBzXJKkg3KciryQU+Sm5Uc4BDd9DA@mail.gmail.com>
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

On Sun, Feb 14, 2021 at 8:49 PM Stephen Zhang <stephenzhangzsd@gmail.com> w=
rote:
>
> Masahiro Yamada <masahiroy@kernel.org> =E4=BA=8E2021=E5=B9=B42=E6=9C=8813=
=E6=97=A5=E5=91=A8=E5=85=AD =E4=B8=8B=E5=8D=888:46=E5=86=99=E9=81=93=EF=BC=
=9A
> > This is the steps I tested.
> >
> >
> > masahiro@oscar:~/ref/linux$ make O=3Dbuild  defconfig all -j24
> >   [ snip ]
> > masahiro@oscar:~/ref/linux$
> > ./scripts/clang-tools/gen_compile_commands.py  -d build
> > masahiro@oscar:~/ref/linux$ grep '"file":' compile_commands.json |
> > grep scripts/ | head -n5
> >     "file": "/home/masahiro/ref/linux/scripts/mod/empty.c"
> >     "file": "/home/masahiro/ref/linux/scripts/mod/sumversion.c"
> >     "file": "/home/masahiro/ref/linux/scripts/mod/file2alias.c"
> >     "file": "/home/masahiro/ref/linux/scripts/mod/modpost.c"
> >     "file": "/home/masahiro/ref/linux/build/scripts/kconfig/parser.tab.=
c"
> >
> > --
> > Best Regards
> > Masahiro Yamada
>
> Thanks. Nathan had a detailed description about  this:
>
> > $ make O=3Dbuild
> >
> > will work with '-d .' because the .cmd files are in '.' and the source
> > files will be placed relative to '.', which is correct. Your command
> > does not work for two reasons:
> >
> > 1. You are using a build directory that is not a subpath of the source
> > directory. In other words, this script would not work for
> >
> > $ make O=3D/tmp/build
> >
> > because '-d /tmp/build' needs to be used to find the .cmd files but the=
n
> > the relative path of the source files is messed up, as you point out.
>
> This may help you reproduce the problem. So you shoud try:
>
> >masahiro@oscar:~/ref/linux$ make O=3D/tmp/build  defconfig all -j24
>
> where the build directory  is not a subpath of the source directory.



So, what is the problem?




--=20
Best Regards
Masahiro Yamada
