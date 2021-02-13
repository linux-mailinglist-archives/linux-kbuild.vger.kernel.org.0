Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA8C31AB68
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Feb 2021 13:47:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbhBMMq6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 13 Feb 2021 07:46:58 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:22838 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbhBMMq5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 Feb 2021 07:46:57 -0500
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 11DCk1gw020296;
        Sat, 13 Feb 2021 21:46:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 11DCk1gw020296
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613220362;
        bh=KdXBt186v51HmgRvEE2352D3Kz6v3BiRQbc1mVmCOVk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=O+cAFE31DZpGZ3jMpIA2p+4QZ4TO/TEyVpBEGczKjTykbC8GWur5rgzeQADU3XGBB
         jRqJKm96BXdp+wb6W9o44fKBILeRzrqaPduwVQYXN+migUw1TuRnPyledBqQ1q9olN
         eK9sVqLGW+Vwj9oEq/yd2bjfYKfB9dgJRL4gOvYd36dUAgPyHn1Ebun6R4zaPa75Ur
         Cb15t107+2FbxAtefOQqQGF1KtNXFkt9pHyxtSqHR05+8hUT6xDkIPQ2ypzmz/sL9K
         3RMNC4hJgTsY408i5MDwvKH2yYIpqQSLGDWR21ubccmKARAIi3EN7Cn1zHO+qg4QZ2
         C8TBEFHKpCGuw==
X-Nifty-SrcIP: [209.85.210.171]
Received: by mail-pf1-f171.google.com with SMTP id z6so1320258pfq.0;
        Sat, 13 Feb 2021 04:46:02 -0800 (PST)
X-Gm-Message-State: AOAM532cVOntleqTCaMcquJagDjWiDuMU32SYbd6xogN9XnTlBkMRup2
        8Tx9dLoxQuQBmUoYw6T4GQyn6kbs7x+zukKPtY0=
X-Google-Smtp-Source: ABdhPJz99A7le2TYhlGfirnnIHVPF7lDpuc4jAZSS8YwXwPFfO++WtvKcSd9gLtFM9uQRJjFmqeM2ig+6UQKCPc4h+o=
X-Received: by 2002:a62:e804:0:b029:1dd:cf18:bdee with SMTP id
 c4-20020a62e8040000b02901ddcf18bdeemr7492308pfi.63.1613220361343; Sat, 13 Feb
 2021 04:46:01 -0800 (PST)
MIME-Version: 1.0
References: <1612783737-3512-1-git-send-email-stephenzhangzsd@gmail.com>
 <20210208195439.GA1097868@ubuntu-m3-large-x86> <CALuz2=d-ENRbWgGYaO_ESEaw5eOVSwkQmkeYBJ-w0Vb3zZ+REg@mail.gmail.com>
 <20210209192729.GA820978@ubuntu-m3-large-x86> <CALuz2=dyA_ki98t8VNe2L1UcBXrSoJT1r6j1puEmLn7WrX87XQ@mail.gmail.com>
 <20210210182400.GA3502674@ubuntu-m3-large-x86> <CALuz2=eSv2N2Qp7GimLgdWjvWDwDh1Dj0Q7Czm4Br5a50rs4ew@mail.gmail.com>
 <CAK7LNAT+CG9zqPpYLoy9_1eA4caZWzxyQACcOrhbg9zfArEwPQ@mail.gmail.com> <CALuz2=ck_=M6Dd8oFgWxnRGdipWOsdL2KODZQSmodh2N7Z8T-w@mail.gmail.com>
In-Reply-To: <CALuz2=ck_=M6Dd8oFgWxnRGdipWOsdL2KODZQSmodh2N7Z8T-w@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 13 Feb 2021 21:45:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR06H3Ue5SG3=6u1veyjg+kXXb2isEBsHVQEtMMJ3d2Tw@mail.gmail.com>
Message-ID: <CAK7LNAR06H3Ue5SG3=6u1veyjg+kXXb2isEBsHVQEtMMJ3d2Tw@mail.gmail.com>
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

On Fri, Feb 12, 2021 at 8:20 PM Stephen Zhang <stephenzhangzsd@gmail.com> w=
rote:
>
> Masahiro Yamada <masahiroy@kernel.org> =E4=BA=8E2021=E5=B9=B42=E6=9C=8811=
=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=8810:16=E5=86=99=E9=81=93=EF=BC=
=9A
> > Please stop.
> >
> >
> > Commit 6ca4c6d25949117dc5b4845612e290b6d89e70a8
> > removed the tools/ support.
> >
> >
> > There exist two build systems in the Linux source tree.
> > Kbuild covers the entire tree except tools/.
> > The tools/ directory adopts a different build system.
> >
> > It is a pity that the tools/ directory
> > went in a wrong direction, and people
> > try to fix problems in a wrong layer.
> >
> >
> > You are not the first person to send to
> > tweak obj/source trees of this script.
> >
> > You can not do this correctly
> > without terribly messing up the code.
> >
> > Please do not try to support tools/.
> >
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada
>
> Thanks for the suggestion.But what we try to support is scripts/
> instead of tools/. 'tools/' here is to help explaining the problem.
> Or am I just misunderstanding your words?



You took 'tools/perf' as an example,
so I just thought you were trying to fix the tools/.



I can get scripts/ entries without any problem.

If you do O=3D build, you can pass that directory
to the -d option of gen_compile_commands.py

  -d DIRECTORY, --directory DIRECTORY
                        specify the output directory used for the
kernel build (defaults to the working
                        directory)


This is the steps I tested.


masahiro@oscar:~/ref/linux$ make O=3Dbuild  defconfig all -j24
  [ snip ]
masahiro@oscar:~/ref/linux$
./scripts/clang-tools/gen_compile_commands.py  -d build
masahiro@oscar:~/ref/linux$ grep '"file":' compile_commands.json |
grep scripts/ | head -n5
    "file": "/home/masahiro/ref/linux/scripts/mod/empty.c"
    "file": "/home/masahiro/ref/linux/scripts/mod/sumversion.c"
    "file": "/home/masahiro/ref/linux/scripts/mod/file2alias.c"
    "file": "/home/masahiro/ref/linux/scripts/mod/modpost.c"
    "file": "/home/masahiro/ref/linux/build/scripts/kconfig/parser.tab.c"








--=20
Best Regards
Masahiro Yamada
