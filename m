Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44CF02CBDB3
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Dec 2020 14:05:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727693AbgLBNFX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Dec 2020 08:05:23 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:35073 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725973AbgLBNFW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Dec 2020 08:05:22 -0500
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 0B2D4Obq026281;
        Wed, 2 Dec 2020 22:04:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 0B2D4Obq026281
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606914265;
        bh=euDqDYPAEo8c1mUJZ8sAnipyVBozjo/dK/LH2E/ZnNg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ONsilcmNVaSafGK6T51lZ4URUIrPDczqoDdMj72CU6HGbRa0jUU/5AOsWq5QA6Q4F
         OMKWsTftrfsJLVaP7sVI3wW1ipGPO0WJNrrl36GbsXwOLnVwsZCVWOf1Vmr+HvYbdV
         3BQtTraxn6enLN6a8yFebqKfS3RHnSxp9/LYhRqE4Mfu1bd4P6g3SK0XXyAm0gUwAg
         3Y+OphIhMtZJeoLcXw+yFchOZd5l7XZHLknq2y/PmgE5l3aV1c59KJ1rcyyDrb7U8h
         L6BtFGhwO2rm60X9tAUy6Vy5+DKdAQPkimsmkIeLQDRQK20DaPAU0FNOu5dYaq4Yqd
         QSoNfTYhp7amQ==
X-Nifty-SrcIP: [209.85.215.179]
Received: by mail-pg1-f179.google.com with SMTP id t37so1038883pga.7;
        Wed, 02 Dec 2020 05:04:25 -0800 (PST)
X-Gm-Message-State: AOAM530CLrsHDxF+1Nn+5iFvEeB4R1OE68RTPrnSZguywesWQqB1yPdY
        v6+sIP6wM2/fj8Xn5DYDrDKXyVONhFFyXP1pVcc=
X-Google-Smtp-Source: ABdhPJwCzpMRH0jdC7IcItkJ8Sg/5p67zKA8cK34N4+tKICTKOQ/Sa8OrA9ktUc4eHF9ao3tm4BxcPgdiG0AjnJSVvk=
X-Received: by 2002:aa7:9606:0:b029:198:14c4:4f44 with SMTP id
 q6-20020aa796060000b029019814c44f44mr2775545pfg.80.1606914264517; Wed, 02 Dec
 2020 05:04:24 -0800 (PST)
MIME-Version: 1.0
References: <CAK7LNASn4Si3=YhAPtc06wEqajpU0uBh46-4T10f=cHy=LY2iA@mail.gmail.com>
 <CAHk-=wihYvkKOcXWPjY7wN13DXbh3k2YX_6JxK_1cQ=krbi9kg@mail.gmail.com>
 <CAHk-=wi86Eu8Whu66CVu+GVTxbuJG+QNvDuk-hXnWu+5q90Zeg@mail.gmail.com>
 <CAHk-=winw=9xh6SmFJPZgi8ngVR-ECTA-kDAAU3DEPLMoUrzVA@mail.gmail.com>
 <CAHk-=wjU4DCuwQ4pXshRbwDCUQB31ScaeuDo1tjoZ0_PjhLHzQ@mail.gmail.com>
 <CAK7LNAQtABssBH2LGThgv-F3_aSrz9Hd-ra9Yyu4-FFzY1nsUw@mail.gmail.com>
 <CAHk-=whK0aQxs6Q5ijJmYF1n2ch8cVFSUzU5yUM_HOjig=+vnw@mail.gmail.com> <CAK7LNAQGHjLYteCt+8BXSY-5CB0gaO1JtHY-SpPFrfdchoHKrQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQGHjLYteCt+8BXSY-5CB0gaO1JtHY-SpPFrfdchoHKrQ@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 2 Dec 2020 22:03:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS_18S9_OasKOaoEW6os3=bYf4wi7fPewfdHyCS2mLsyA@mail.gmail.com>
Message-ID: <CAK7LNAS_18S9_OasKOaoEW6os3=bYf4wi7fPewfdHyCS2mLsyA@mail.gmail.com>
Subject: Re: [GIT PULL 2/2] Kconfig updates for v5.10-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Emese Revfy <re.emese@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Dec 2, 2020 at 9:53 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Hi Linus,
>
> On Sun, Nov 29, 2020 at 3:28 AM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Fri, Nov 27, 2020 at 11:05 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > As for the cc1plus cost, I got a similar result.
> > >
> > > Running scripts/gcc-plugin.sh directly
> > > took me 0.5 sec, which is a fourth
> > > of the allmodconfig run-time.
> > >
> > > Actually, I did not know this shell script
> > > was so expensive to run...
> >
> > So it turns out that one reason it's so expensive to run is that it
> > does a *lot* more than it claims to do.
> >
> > It says "we need a c++ compiler that supports the designated
> > initializer GNU extension", but then it actually includes a header
> > file from hell, rather than just test designated initializers.
> >
> > This patch makes the cc1plus overhead go down a lot. That said, I'm
> > doubtful we really want gcc plugins at all, considering that the only
> > real users have all apparently migrated to clang builtin functionality
> > instead.
> >
> >         Linus
>
>
> The attached patch looks OK to me.
>
> Just a nit:
> Now that the test code does not include any header,
> you can also delete
> "-I $srctree/gcc-plugins -I $gccplugins_dir/include"
>
>
> If you apply it directly, please feel free to add
>
> Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>


BTW, gcc plugins are always compiled with g++.

Why do we need to compile the following in the first place?

class test {
public:
        int test;
} test = {
        .test = 1
};


I think any C++ compiler will succeed
in compiling such simple code.



So,

test -e "$gccplugins_dir/include/plugin-version.h"

looks enough to me.



What is the intention of this compile test?


-- 
Best Regards
Masahiro Yamada
