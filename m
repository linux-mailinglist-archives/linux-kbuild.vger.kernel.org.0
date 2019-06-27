Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD08057A1A
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Jun 2019 05:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbfF0Dhs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Jun 2019 23:37:48 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:30194 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbfF0Dhr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Jun 2019 23:37:47 -0400
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x5R3ba8H028567;
        Thu, 27 Jun 2019 12:37:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x5R3ba8H028567
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1561606657;
        bh=cHU/2P+9AoyIrIzIGKHe8ERCeZ+lRTgiCzEUTACqf6Y=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jVMFTq54d6d2hfPxEsCFhJq0pGa1yE9ekpJ5aU6xIPvBurX0hYTIM2VOwo1MvyWDZ
         4czCSoGV/B16FwvkDfQzn7mbCcLh/bfwv6hzQTRur9ujBbn56q0ndbrV2FGAhpHByK
         yTHGNTpdny4Kj2io3mJIFaJxTjoanGRe/aHWYmUEGIg11nbMqYcsmrEcOBRr9KzcrJ
         lGgr0mwR/HWoNMIxi9fdnHybUFtsKw7SZHbT6vukxWn7UbnTPBsujOBI4CUjTSgt+a
         24MP32KJBfj2gtizZrXUGeI/Ie8YU0tunbHpdR6pOV8dfOuSB1v8XoD/gl52piRAfZ
         Q0vnuNZ3YlUAw==
X-Nifty-SrcIP: [209.85.222.45]
Received: by mail-ua1-f45.google.com with SMTP id 34so297023uar.8;
        Wed, 26 Jun 2019 20:37:37 -0700 (PDT)
X-Gm-Message-State: APjAAAWZk2OHVJ/ayli/NveT2n/9k6Avu+zc0HjZoprwcxfojfIf9KN3
        MJp0L77cuAC0tMIM7MGN6rfpCab8kPxcya6EZWg=
X-Google-Smtp-Source: APXvYqxnTaJrFrMjuBoXEoiAN+DrkrbXhQiwMUAtqVh/FSoRuIgZnVV8242KrVAiYzqrGsKWX8k8KZMQVT7KGH9LF+4=
X-Received: by 2002:ab0:234e:: with SMTP id h14mr991265uao.25.1561606656202;
 Wed, 26 Jun 2019 20:37:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190621163931.19397-1-yamada.masahiro@socionext.com>
 <20190621175134.GB16409@ravnborg.org> <CAK7LNATz1iuG0Moab60gMSbVU8PJAmrLn27K8HK_1zQ0qeh26w@mail.gmail.com>
 <20190622130635.GA24262@ravnborg.org> <20190624214027.GA14740@ravnborg.org> <20190625061120.GA7561@ravnborg.org>
In-Reply-To: <20190625061120.GA7561@ravnborg.org>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 27 Jun 2019 12:36:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNARMnsC+tm13VRV3kvRQNUWOrH1NxEwvFHwVJbFav50idg@mail.gmail.com>
Message-ID: <CAK7LNARMnsC+tm13VRV3kvRQNUWOrH1NxEwvFHwVJbFav50idg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: compile-test global headers to ensure they are self-contained
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Sam,

On Tue, Jun 25, 2019 at 3:11 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> >
> > When all header files below include/drm are self-contained it will be a
> > single line:
> >
> >     header-test-y += $(all_headers_with_subdir)
> In reality it will likely be the above, and then a list of
>
> header-test-n += foo.h
>
> For the header files that we for one or the other reason do not want to
> make self-contained.
> It would be nice to have the list of ignored files close to their home
> and not a full list in one Makefile in include/
>
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index 3e630fcaffd1..e2f765e9d1e1 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -67,6 +67,7 @@ extra-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtb,%.dt.yaml, $(dtb-))
> >  endif
> >
> >  # Test self-contained headers
> > +header-test-y := $(filter-out $(header-test-n), $(header-test-y))
> This part should include the logic to filter out duplicates too.
> I think we may do something wrong if the same header is listed twice.
>
> We could also extend this with a check that all files in header-test-n
> exits.
>
>         Sam

Thanks for your comments.

Some followups:

[1] I prefer 'header-test-' to 'header-test-n'
for excluding headers.
In some places, it will be useful to
be able to write like this:
header-test-$(CONFIG_FOO) += foo.h


[2] I proposed somewhat generalized header-test-pattern-y instead of
providing both of 'all_headers' and 'all_headers_with_subdir'

BTW, "all headers" should be added with care.
scripts/Makefile.asm-generic and scripts/Makefile.headersinst
cater to removing stale headers.
But, we do not explicitly clean other headers.
We always be careful about potential matching to stale headers.


[3] I tried both 'one big single Makefile' and
    'each Makefile in sub-directories'

I am slightly in favor of the former. Maybe I could be wrong,
and we may switch to the other approach.
But, I'd like to start with a single Makefile, and see how bad it is.


I sent v2:
https://patchwork.kernel.org/project/linux-kbuild/list/?series=138507


-- 
Best Regards
Masahiro Yamada
