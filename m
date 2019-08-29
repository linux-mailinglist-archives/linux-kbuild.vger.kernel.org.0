Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0B0A2208
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Aug 2019 19:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727270AbfH2RTK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Aug 2019 13:19:10 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:57736 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726973AbfH2RTK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Aug 2019 13:19:10 -0400
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x7THIqQF009484;
        Fri, 30 Aug 2019 02:18:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x7THIqQF009484
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1567099133;
        bh=jCxDkVSWG7Y4WLqCHMtqonuIZYm6GUxztAGzGCbt8DY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=f9g1cyoMRFyH7y6LclyK92Jot+xdceeqdnWJA/zNPgEqKYQHK273xwL5Eu3jT7TD0
         CUiEM4/R4i6CuUF2ZkSQQb0cmpRQ8aia0wBUUqn05KTGZVy/kSYxWOJAhKu8sXNM4L
         j1KElIuyrl5UAA046of0aisi/AQ2YP5JDV5N7oRps+vOyTntcjg0KUQqjkDjQNLJQj
         kYp2SxvVhhI5JwYCZ0gUj8/6p9+UGr7BHV2Q0Ffg5jEanT81v0EgMljhCQ8yMlxLkx
         OxozUmYi7YIviYEZkokcbPSKo/lRUs1OmQerQsZE21vQguLDrb1N6wcqP+0eSGSxHt
         vDuySaTEUeDxg==
X-Nifty-SrcIP: [209.85.222.45]
Received: by mail-ua1-f45.google.com with SMTP id k7so1415473uao.6;
        Thu, 29 Aug 2019 10:18:53 -0700 (PDT)
X-Gm-Message-State: APjAAAVGHSQnSdIOw//fbpFC374BgD3pJEBzCi4o9ueSqgZx6TzMrPal
        eDL7iRQvHzdtoUyclkjgqq94pKoWWobYnZfIsaw=
X-Google-Smtp-Source: APXvYqwqbA8BuFK3YrsS7eH1p7h+IH41cas29tGOrEnUdsWayN0EGgWlTZploEmptPKdma0vz50ED3g+GXZnPjCwY3M=
X-Received: by 2002:ab0:4261:: with SMTP id i88mr5511251uai.95.1567099131876;
 Thu, 29 Aug 2019 10:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190815225844.145726-1-nhuck@google.com> <20190827004155.11366-1-natechancellor@gmail.com>
 <CAK7LNATHj5KrnFa0fvHjuC-=5mV8VBT14vrpPMfuNKWw7wabag@mail.gmail.com>
 <CANiq72ndWZWD-KBT1s-mUxQNa1jaD7oDaCB2+NPiT1chf14Z_g@mail.gmail.com>
 <CAKwvOdkuDPfOusJRneeTzg7tZ4VKxaRCNg2SgmjVas58cDwe8w@mail.gmail.com> <CAKwvOdnOo3RXm3cx5YDtPyM=9Ry7kss-i4HzjxQkK4pjE-n9Lw@mail.gmail.com>
In-Reply-To: <CAKwvOdnOo3RXm3cx5YDtPyM=9Ry7kss-i4HzjxQkK4pjE-n9Lw@mail.gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri, 30 Aug 2019 02:18:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNATZSLYMW3NaEgm=r7EiHwLnxjtaogm_CRHZYgcBLVRb-w@mail.gmail.com>
Message-ID: <CAK7LNATZSLYMW3NaEgm=r7EiHwLnxjtaogm_CRHZYgcBLVRb-w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Do not enable -Wimplicit-fallthrough for clang
 for now
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Huckleberry <nhuck@google.com>,
        Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 29, 2019 at 2:44 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Aug 28, 2019 at 10:39 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Wed, Aug 28, 2019 at 9:45 AM Miguel Ojeda
> > <miguel.ojeda.sandonis@gmail.com> wrote:
> > >
> > > On Wed, Aug 28, 2019 at 6:21 PM Masahiro Yamada
> > > <yamada.masahiro@socionext.com> wrote:
> > > >
> > > > Applied to linux-kbuild. Thanks.
> > > >
> > > > (If other clang folks give tags, I will add them later.)
> > >
> > > Acked-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> >
> > I verified that GCC didn't get support for -Wimplicit-fallthrough
> > until GCC ~7.1 release, so the cc-option guard is still required.
> > Acked-by: Nick Desaulniers <ndesaulniers@google.com>
> > Thanks for the patch Nathan.
>
> Also, there's an inconsistency between Makefile vs
> scripts/Makefile.extrawarn that's been bugging me: it seems we enable
> GCC only flags in Makefile, then disable certain Clang flags in
> scripts/Makefile.extrawarn.


All the flags listed in scripts/Makefile.extrawarn depend on W= option.
The options in Makefile are passed irrespective of W=.

There is no inconsistency.


> Not necessary to fix here and now, but I
> hope one day to have one file that has all of the compiler specific
> flags in one place (maybe its own file), so I only have to look in one
> place.  I know, I know, "patches welcome." ;)
>
> --
> Thanks,
> ~Nick Desaulniers



-- 
Best Regards
Masahiro Yamada
