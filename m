Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97D67279708
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Sep 2020 06:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730001AbgIZE4G (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 26 Sep 2020 00:56:06 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:50777 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729998AbgIZE4G (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 26 Sep 2020 00:56:06 -0400
X-Greylist: delayed 127927 seconds by postgrey-1.27 at vger.kernel.org; Sat, 26 Sep 2020 00:56:04 EDT
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 08Q4teD1015981;
        Sat, 26 Sep 2020 13:55:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 08Q4teD1015981
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1601096140;
        bh=mNWazOotyps6++jrgsO3aX7y+I3OWZIx6nhtMCACIpA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qRK49o3YrPFXj5dI7YLq39sFzNnwCTwxK1rvCBqr4pukSBnRE3wn/lhGuwLWERDCc
         woNUa7phyKldnbZ7GR01tpRhF+4xS+b/3C5HWyPKrPRVYHRKzS1sIqGH5pi17Oxa6y
         VSK7V2EjBhVURXsEVOXNf8iXAXYHEyaSI6pGb8caMYlZzWTIW/VrfJTDJ3UPfcmO1Z
         JUJqPJl5bR0C1uYckfc7gQNC2dZFvJqrzG5Oqc8qqvERjgLUycZozVngAxKRX9CQt7
         LCYw4yRSwe6dNDfrkght0OIUa7pCBZVzbudYew17zKom5N07YzFRFt5kNnbwYm0Hq2
         WiOHQCQL35BDA==
X-Nifty-SrcIP: [209.85.215.170]
Received: by mail-pg1-f170.google.com with SMTP id k133so4171113pgc.7;
        Fri, 25 Sep 2020 21:55:40 -0700 (PDT)
X-Gm-Message-State: AOAM530GxpqmUzroxTKIQS9+R5rUEPob7h9OFSQtYYceNlRIIPRK4m+i
        5xIdtE4vlBMLltHeNz+fnmvz9Ihs5QVWel76+JQ=
X-Google-Smtp-Source: ABdhPJytgXxH9tbwqEoVM6+YXNGTdBlfjv2we44BX41uXtcxuE+kjeq9YCZpqej5OWroCNmGqGyLn4efqPOHGqFFQDs=
X-Received: by 2002:a63:1b44:: with SMTP id b4mr1631730pgm.175.1601096139727;
 Fri, 25 Sep 2020 21:55:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200925152121.20527-1-f.fainelli@gmail.com> <CAKwvOdmxkwA7NPSj-bSarurjWc7Vs2vzuT3PnaCJhA00pRWyYA@mail.gmail.com>
In-Reply-To: <CAKwvOdmxkwA7NPSj-bSarurjWc7Vs2vzuT3PnaCJhA00pRWyYA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 26 Sep 2020 13:55:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNATcTZuPaw62jyPyomG675yzifZdogE-HVRPepQW9_fVjw@mail.gmail.com>
Message-ID: <CAK7LNATcTZuPaw62jyPyomG675yzifZdogE-HVRPepQW9_fVjw@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: Fix clang target examples
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        "open list:CLANG/LLVM BUILD SUPPORT" 
        <clang-built-linux@googlegroups.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Sep 26, 2020 at 3:52 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Sep 25, 2020 at 8:21 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
> >
> > clang --target=<triple> is how we can specify a particular toolchain
> > triple to be use, fix the two occurences in the documentation.
>
> Ah right, my mistake.  It's either double dash+equals, or single
> dash+space.  Thanks for the patch.  Masahiro, would you mind picking
> this up?


Sure.
Applied to linux-kbuild/fixes. Thanks.


> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> >
> > Fixes: fcf1b6a35c16 ("Documentation/llvm: add documentation on building w/ Clang/LLVM")
> > Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> > ---
> >  Documentation/kbuild/llvm.rst | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> > index 334df758dce3..dae90c21aed3 100644
> > --- a/Documentation/kbuild/llvm.rst
> > +++ b/Documentation/kbuild/llvm.rst
> > @@ -39,10 +39,10 @@ which can help simplify cross compiling. ::
> >         ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make CC=clang
> >
> >  ``CROSS_COMPILE`` is not used to prefix the Clang compiler binary, instead
> > -``CROSS_COMPILE`` is used to set a command line flag: ``--target <triple>``. For
> > +``CROSS_COMPILE`` is used to set a command line flag: ``--target=<triple>``. For
> >  example: ::
> >
> > -       clang --target aarch64-linux-gnu foo.c
> > +       clang --target=aarch64-linux-gnu foo.c
> >
> >  LLVM Utilities
> >  --------------
> > --
> > 2.25.1
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



-- 
Best Regards
Masahiro Yamada
