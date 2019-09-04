Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AB66A8863
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Sep 2019 21:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730812AbfIDOGS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 4 Sep 2019 10:06:18 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:60220 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730462AbfIDOGS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Sep 2019 10:06:18 -0400
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x84E65FQ012074;
        Wed, 4 Sep 2019 23:06:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x84E65FQ012074
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1567605966;
        bh=EIcW7nuR2BwIgm+8fvmv+3/OtKATqWDtbykL5X1yVEI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Ctf67tOBMnzuIGRVtw7qPYg87jOjmZTf9vdUjarlrSrcrPC2pYi/twYuqrhQBYtgP
         pt0NB0gigDE2jQbTGoQHX4/5V3ELKocKEC+gvE/K2fbUTsmj35x02tpHmTCVTKAePi
         8Zc+S9nQtNbWlsfRq/huhIh/9ScT4+96hDLOuAYbv8h/jh/0UXUbfhTweA5uTA0EFj
         pPYOEQIM8aF6MaV8EdYmfT9Xs5hXT3n1M+LO/cJ958Ga2INt0bxig9/uwJhQVRVcI2
         knVovMKLNQL7J21XGPRIMwV/BN6WufKxGQelj3/blPczhZMs7jxcYDmDtJRTi4ouhZ
         Zhn0s5/R3subg==
X-Nifty-SrcIP: [209.85.222.48]
Received: by mail-ua1-f48.google.com with SMTP id h23so2703851uao.10;
        Wed, 04 Sep 2019 07:06:06 -0700 (PDT)
X-Gm-Message-State: APjAAAWphMMClKxjHmWFpQ+IBr5I4tc04w0F4qWaOsKyjEyr90knVDQI
        qeonlTO9FZRjNz92EQmAz5yvhk/oXVwrn8s1GbU=
X-Google-Smtp-Source: APXvYqyDmWQLlXmtoyVyouREoqmPaMLGw1tPpcxgighXpcAcoFK3ScNooPQI4LTe/+po0y7FdOnWYKnxlyKUaYtiwFY=
X-Received: by 2002:ab0:32d8:: with SMTP id f24mr19579922uao.121.1567605964838;
 Wed, 04 Sep 2019 07:06:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190831162555.31887-1-yamada.masahiro@socionext.com>
 <20190831162555.31887-2-yamada.masahiro@socionext.com> <CAKwvOdm0zcyaBLdSVc7PmjUa-wyVuCaN=6qZoPLvnoJC1ammog@mail.gmail.com>
 <CA+icZUWzSsFXLmrO2G7ochE62e=kByEV6UKregcJqZrJN1WJxQ@mail.gmail.com>
 <CA+icZUXboR-0TzpSHf7a8MSjxPWxdC13Oudu8D+b+umtvWCCkg@mail.gmail.com> <CA+icZUVN1zRi5P8PPWMjXoXwtSCkbzTFNreYXi+0HtTjPnfkTQ@mail.gmail.com>
In-Reply-To: <CA+icZUVN1zRi5P8PPWMjXoXwtSCkbzTFNreYXi+0HtTjPnfkTQ@mail.gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 4 Sep 2019 23:05:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ28VedOdiHX-tKatT1ebzDNXM8b5CxcxKek3b271PgzA@mail.gmail.com>
Message-ID: <CAK7LNAQ28VedOdiHX-tKatT1ebzDNXM8b5CxcxKek3b271PgzA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] kbuild: rename KBUILD_ENABLE_EXTRA_GCC_CHECKS to KBUILD_EXTRA_WARN
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Sep 4, 2019 at 6:58 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Wed, Sep 4, 2019 at 10:07 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > On Wed, Sep 4, 2019 at 8:58 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > >
> > > On Tue, Sep 3, 2019 at 11:50 PM Nick Desaulniers
> > > <ndesaulniers@google.com> wrote:
> > > >
> > > > On Sat, Aug 31, 2019 at 9:26 AM Masahiro Yamada
> > > > <yamada.masahiro@socionext.com> wrote:
> > > > >
> > > > > KBUILD_ENABLE_EXTRA_GCC_CHECKS started as a switch to add extra warning
> > > > > options for GCC, but now it is a historical misnomer since we use it
> > > > > also for Clang, DTC, and even kernel-doc.
> > > >
> > > > Thanks for the patch!
> > > > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> > > >
> > >
> > > Thanks for the patch.
> > > I like the backward compatibility and am OK with pointing to 'make
> > > --help' for the documentation part (KISS - Keep It Simple and
> > > Short/Stupid).
> > >
> > > Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>
> >
> > If you will do a next version...
> >
> > - @echo  '  make W=n   [targets] Enable extra gcc checks, n=1,2,3 where'
> > + @echo  '  make W=n   [targets] Enable extra checks, n=1,2,3 where'
> >
> > ...clarify on extra checks for compiler...
> >
> > + @echo  '  make W=n   [targets] Enable extra *compiler* checks, n=1,2,3 where'
> >
>
> +KBUILD_EXTRA_WARN
> +-----------------
> +Specify the extra build checks. The same value can be assigned by passing
> +W=... from the command line.
>
> For consistency reasons might be better:
>
> - @echo  '  make W=n   [targets] Enable extra gcc checks, n=1,2,3 where'
> + @echo  '  make W=n   [targets] Enable extra build checks, n=1,2,3 where'
>

OK, I will squash this. Thanks.


-- 
Best Regards
Masahiro Yamada
