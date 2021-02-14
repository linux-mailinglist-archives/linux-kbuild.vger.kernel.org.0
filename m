Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F38A231B046
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Feb 2021 12:50:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbhBNLuP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 14 Feb 2021 06:50:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbhBNLuO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 14 Feb 2021 06:50:14 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1640CC061574;
        Sun, 14 Feb 2021 03:49:34 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id 133so4367333ybd.5;
        Sun, 14 Feb 2021 03:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YbYZAdSVhVuJNoAtWccCf/rL4wPcvTLqCtelTv8zP+0=;
        b=tIfW9jhPos2FN4wybEValTe3L0GwaS4QasOe7OesU6SBJKghvCL4FHbCN3D6d740Tp
         XL+GfjnmGjBQUM7haFOs6T6LA2IJQDGHba5b5DrvIMl1bwzlb7XA/TzR4JBbdKK3u78E
         nIJouAQSNb5qD7VMkhI5gMNXoYxPl7Gngp13t8Y3EnxaWwHj+0g9UHtp1/8Vlvd+vB64
         E+Mzl+SkgvNVMx26CgR3DgeUsMpGN9Zdd2qEq1kcup8k9bhw+vR2a7T5nNZkla3Vnyi8
         sEUwDnWPPinlkiGjWNStGmyGKYJMXk2rmn1mDMQ+3YC8p/pE0uNFFcNLfbSt38rjqLM/
         IMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YbYZAdSVhVuJNoAtWccCf/rL4wPcvTLqCtelTv8zP+0=;
        b=DpjSxpiVCHdnYNJGkE1af4Tt2AEii8XG+887bRBs44+2Cn9G0m/kCvqVV/pXYB0gUP
         CeWOLUwntDv81/U4VmDLD7iicMnpJEyUbUtnn+grhHKjPguVbpnX9pcyJnmDhwUGHaeP
         0E357KEy6pm4sCrwwVWD4cA+jsLIIFN4n82cLXJpk9GJQ8Svn2BI8pa9gx5Lpr6TIR+t
         GGmqXe2fyfur6J+btJM7ePp+1Y15L1XHxuNVtrfe3cswRaSC8rDlCur/PD16nH/CK7CF
         M5LkpxuRWPxeghL02LkVo85SK4Uu6LNBnhpB+t1NPsQjhRb/goPzEdhAKv9/EhhZk138
         GjLw==
X-Gm-Message-State: AOAM531XSGIdmDAatZDjudxCKSWbQflHnvD60JshB7MLXXUCl86WosJa
        +7KUrHEzlr7B6bXJQkhkvr3QXsO2x/EYE8IqPO0=
X-Google-Smtp-Source: ABdhPJxBXprXfO+zHFZQa26UWH9ERnKFBq5or7C0kRpR48smN3Yt6/llKsTVLFlxS0b5Sv1xBBoD58Rt2xfUegBkY24=
X-Received: by 2002:a25:7312:: with SMTP id o18mr16101845ybc.352.1613303373113;
 Sun, 14 Feb 2021 03:49:33 -0800 (PST)
MIME-Version: 1.0
References: <1612783737-3512-1-git-send-email-stephenzhangzsd@gmail.com>
 <20210208195439.GA1097868@ubuntu-m3-large-x86> <CALuz2=d-ENRbWgGYaO_ESEaw5eOVSwkQmkeYBJ-w0Vb3zZ+REg@mail.gmail.com>
 <20210209192729.GA820978@ubuntu-m3-large-x86> <CALuz2=dyA_ki98t8VNe2L1UcBXrSoJT1r6j1puEmLn7WrX87XQ@mail.gmail.com>
 <20210210182400.GA3502674@ubuntu-m3-large-x86> <CALuz2=eSv2N2Qp7GimLgdWjvWDwDh1Dj0Q7Czm4Br5a50rs4ew@mail.gmail.com>
 <CAK7LNAT+CG9zqPpYLoy9_1eA4caZWzxyQACcOrhbg9zfArEwPQ@mail.gmail.com>
 <CALuz2=ck_=M6Dd8oFgWxnRGdipWOsdL2KODZQSmodh2N7Z8T-w@mail.gmail.com> <CAK7LNAR06H3Ue5SG3=6u1veyjg+kXXb2isEBsHVQEtMMJ3d2Tw@mail.gmail.com>
In-Reply-To: <CAK7LNAR06H3Ue5SG3=6u1veyjg+kXXb2isEBsHVQEtMMJ3d2Tw@mail.gmail.com>
From:   Stephen Zhang <stephenzhangzsd@gmail.com>
Date:   Sun, 14 Feb 2021 19:49:22 +0800
Message-ID: <CALuz2=fHXZ=NrVdRNzyromD88wp9pAzYC9nffPt6y5YM=sJniw@mail.gmail.com>
Subject: Re: [PATCH v1] clang_tools:gen_compile_commands: Change the default
 source directory
To:     Masahiro Yamada <masahiroy@kernel.org>
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

Masahiro Yamada <masahiroy@kernel.org> =E4=BA=8E2021=E5=B9=B42=E6=9C=8813=
=E6=97=A5=E5=91=A8=E5=85=AD =E4=B8=8B=E5=8D=888:46=E5=86=99=E9=81=93=EF=BC=
=9A
> This is the steps I tested.
>
>
> masahiro@oscar:~/ref/linux$ make O=3Dbuild  defconfig all -j24
>   [ snip ]
> masahiro@oscar:~/ref/linux$
> ./scripts/clang-tools/gen_compile_commands.py  -d build
> masahiro@oscar:~/ref/linux$ grep '"file":' compile_commands.json |
> grep scripts/ | head -n5
>     "file": "/home/masahiro/ref/linux/scripts/mod/empty.c"
>     "file": "/home/masahiro/ref/linux/scripts/mod/sumversion.c"
>     "file": "/home/masahiro/ref/linux/scripts/mod/file2alias.c"
>     "file": "/home/masahiro/ref/linux/scripts/mod/modpost.c"
>     "file": "/home/masahiro/ref/linux/build/scripts/kconfig/parser.tab.c"
>
> --
> Best Regards
> Masahiro Yamada

Thanks. Nathan had a detailed description about  this:

> $ make O=3Dbuild
>
> will work with '-d .' because the .cmd files are in '.' and the source
> files will be placed relative to '.', which is correct. Your command
> does not work for two reasons:
>
> 1. You are using a build directory that is not a subpath of the source
> directory. In other words, this script would not work for
>
> $ make O=3D/tmp/build
>
> because '-d /tmp/build' needs to be used to find the .cmd files but then
> the relative path of the source files is messed up, as you point out.

This may help you reproduce the problem. So you shoud try:

>masahiro@oscar:~/ref/linux$ make O=3D/tmp/build  defconfig all -j24

where the build directory  is not a subpath of the source directory.

--
Best Regards
Stephen Zhang
