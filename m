Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACAC826E499
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Sep 2020 20:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728354AbgIQQW4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 17 Sep 2020 12:22:56 -0400
Received: from condef-01.nifty.com ([202.248.20.66]:38177 "EHLO
        condef-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728365AbgIQQWm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Sep 2020 12:22:42 -0400
X-Greylist: delayed 400 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 12:22:41 EDT
Received: from conssluserg-03.nifty.com ([10.126.8.82])by condef-01.nifty.com with ESMTP id 08HGBjSp013101;
        Fri, 18 Sep 2020 01:11:45 +0900
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 08HG96BI023460;
        Fri, 18 Sep 2020 01:09:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 08HG96BI023460
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1600358947;
        bh=yULUqiWt2SWgw5mTiS7zYO2hzW0Ie61k0FqxlWmWeH4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LElvIdS9XHoSA00xhrPQymc7YKtyp5JVFGDJu54Udb+uE+/GqPj8sV/2vsS5DuATo
         S1LzrbX8tkVWzTZemJiiWQc50jsuiQVb9ecrVUCXejhWLbNHf9Vm1up6trEU20SIfm
         90xLCwxca3/BWzZHxPvSTh7E7kV95RY45sw4uxBO01Z1SAgkB8CHLSAFEWBEg2BnBG
         Kq28yZkdp6YaKvAp3vfdTcKuCr/zic54q4sd2ruGm4H9gR1Dfx+QHnHuyYK/cBXCZC
         SZMLhTyARc9Mu8QFzQ29qErYXTl19aw++7TUPYpJmRZTASHkeXmsECY/1BC3wLqFZw
         K+mtEGa7r1sLQ==
X-Nifty-SrcIP: [209.85.216.42]
Received: by mail-pj1-f42.google.com with SMTP id gf14so1452998pjb.5;
        Thu, 17 Sep 2020 09:09:06 -0700 (PDT)
X-Gm-Message-State: AOAM530GxbNcPybOP1NWCSTBtvaik3q0HZYq2mDmZ5zZaK0iQrXKqVV6
        pSo4ADSo02Epz51aNQ2qSQ22gTMrxEgw3QdAiL8=
X-Google-Smtp-Source: ABdhPJxssgarhgzM7MqOY61Xtmz9VYnoIYinKy6ZG1jOP7WdiUzDiYTfNkWC8PDvBunlBOClw2h2K/YvUZa15pElPuU=
X-Received: by 2002:a17:902:34f:b029:d1:e5e7:bdcf with SMTP id
 73-20020a170902034fb02900d1e5e7bdcfmr11915446pld.47.1600358946099; Thu, 17
 Sep 2020 09:09:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200908221638.2782778-1-masahiroy@kernel.org> <CAKwvOdnP7UmpRPL8XjzoMPjgQb9Di8OXk9UEX8NWaa35A01Q3Q@mail.gmail.com>
In-Reply-To: <CAKwvOdnP7UmpRPL8XjzoMPjgQb9Di8OXk9UEX8NWaa35A01Q3Q@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 18 Sep 2020 01:08:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT75mW-1npr-2Rfe2OaJH7yKS1TeizPsKxbbunKW-c_sA@mail.gmail.com>
Message-ID: <CAK7LNAT75mW-1npr-2Rfe2OaJH7yKS1TeizPsKxbbunKW-c_sA@mail.gmail.com>
Subject: Re: [PATCH 1/2] kconfig: qconf: use delete[] instead of delete to
 free array (again)
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Sep 11, 2020 at 2:24 AM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> On Tue, Sep 8, 2020 at 3:17 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Commit c9b09a9249e6 ("kconfig: qconf: use delete[] instead of delete
> > to free array") fixed two lines, but there is one more.
> > (cppcheck does not report it for some reason...)
> >
> > This was detected by Clang.
> >
> > "make HOSTCXX=clang++ xconfig" reports the following:
> >
> > scripts/kconfig/qconf.cc:1279:2: warning: 'delete' applied to a pointer that was allocated with 'new[]'; did you mean 'delete[]'? [-Wmismatched-new-delete]
> >         delete data;
> >         ^
> >               []
> > scripts/kconfig/qconf.cc:1239:15: note: allocated with 'new[]' here
> >         char *data = new char[count + 1];
> >                      ^
> >
> > Fixes: c4f7398bee9c ("kconfig: qconf: make debug links work again")
> > Fixes: c9b09a9249e6 ("kconfig: qconf: use delete[] instead of delete to free array")
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> > ---
> >
> >  scripts/kconfig/qconf.cc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> > index 8638785328a7..c7216b9110fc 100644
> > --- a/scripts/kconfig/qconf.cc
> > +++ b/scripts/kconfig/qconf.cc
> > @@ -1276,7 +1276,7 @@ void ConfigInfoView::clicked(const QUrl &url)
> >         }
> >
> >         free(result);
> > -       delete data;
> > +       delete[] data;
> >  }
> >
> >  void ConfigInfoView::contextMenuEvent(QContextMenuEvent *event)
> > --
> > 2.25.1
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CAKwvOdnP7UmpRPL8XjzoMPjgQb9Di8OXk9UEX8NWaa35A01Q3Q%40mail.gmail.com.



Applied to linux-kbuild/fixes.


-- 
Best Regards
Masahiro Yamada
