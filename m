Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E9C8AE23D
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Sep 2019 04:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388708AbfIJCLB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Sep 2019 22:11:01 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:52635 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388705AbfIJCLB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Sep 2019 22:11:01 -0400
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x8A2ArGG023752;
        Tue, 10 Sep 2019 11:10:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x8A2ArGG023752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1568081454;
        bh=a157QSKkFHFQDXKrnSwhaYkEU7C+AFGKYmKxUEaX5bo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JZZSPS+AC3StfV68me3abXJZiev8jTHnNFd4zr/HIVlSxk0sA5TLIa28Ulqdj/RhI
         lDEwI6QFQ4TwskOFmjIcI16sgtGpunt9xsVAQk0I54VUuHb9x43C/lq6+mZsByYdkw
         5xf5Va1PC8NY7jtvDvHSnhSkjfVZZIQL7n5/La+dgHFR63kPuR+OBYWeXTzRPTio6G
         FfKtnTss8C4zwVN3pSZtCVY+L/HV7umiS8GaQrI9lWG3GBOfeBw+ofc6Hm53dAZuvm
         zhQVgEf5ZRyc9fNttLvfd3qw4d/D1Zcy1R3ghhNf04FBPRJWfA1B4oupFsCQ7eoo2q
         bqP+ZDGLLCfMQ==
X-Nifty-SrcIP: [209.85.217.47]
Received: by mail-vs1-f47.google.com with SMTP id u21so10178495vsl.10;
        Mon, 09 Sep 2019 19:10:53 -0700 (PDT)
X-Gm-Message-State: APjAAAUHTYx1JWw2/mFiP11ECzUVfFdYa00oK+PLT9pClwM6LwEuM1un
        6cqoXp3Wsg76MX/gx+z2Yj/wkVn5ovVDGa6l70U=
X-Google-Smtp-Source: APXvYqy/6SZUE4ZItHpdV+NV1DywvKICh6bR6SRDVgEDOqaSL4CcjHYn2/6IT8T5biDHj7Qw2ZX6sMnn5d9yFX1u80Q=
X-Received: by 2002:a67:f496:: with SMTP id o22mr14372435vsn.179.1568081452893;
 Mon, 09 Sep 2019 19:10:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190909105317.20473-1-yamada.masahiro@socionext.com>
 <nycvar.YSQ.7.76.1909090942420.3091@knanqh.ubzr> <CAK7LNATC1pZ_2BQ-Uh2+qfUjJtL0mRpsm78N-sUQXhF0tDf6Hw@mail.gmail.com>
 <nycvar.YSQ.7.76.1909091158200.3091@knanqh.ubzr>
In-Reply-To: <nycvar.YSQ.7.76.1909091158200.3091@knanqh.ubzr>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 10 Sep 2019 11:10:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNASiavMOYDGs0sRm2xAzznd8_Q0vT9T+PFT-bN=mhYezWA@mail.gmail.com>
Message-ID: <CAK7LNASiavMOYDGs0sRm2xAzznd8_Q0vT9T+PFT-bN=mhYezWA@mail.gmail.com>
Subject: Re: [PATCH 1/2] export.h: remove defined(__KERNEL__)
To:     Nicolas Pitre <nico@fluxnic.net>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Denis Efremov <efremov@linux.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Sep 10, 2019 at 1:06 AM Nicolas Pitre <nico@fluxnic.net> wrote:
>
> On Mon, 9 Sep 2019, Masahiro Yamada wrote:
>
> > Hi Nicolas,
> >
> > On Mon, Sep 9, 2019 at 10:48 PM Nicolas Pitre <nico@fluxnic.net> wrote:
> > >
> > > On Mon, 9 Sep 2019, Masahiro Yamada wrote:
> > >
> > > > This line was touched by commit f235541699bc ("export.h: allow for
> > > > per-symbol configurable EXPORT_SYMBOL()"), but the commit log did
> > > > not explain why.
> > > >
> > > > CONFIG_TRIM_UNUSED_KSYMS works for me without defined(__KERNEL__).
> > >
> > > I'm pretty sure it was needed back then so not to interfere with users
> > > of this file. My fault for not documenting it.
> >
> > Hmm, I did not see a problem in my quick build test.
> >
> > Do you remember which file was causing the problem?
>
> If you build commit 7ec925701f5f with CONFIG_TRIM_UNUSED_KSYMS=y and the
> defined(__KERNEL__) test removed then you'll get:
>
>   HOSTCC  scripts/mod/modpost.o
> In file included from scripts/mod/modpost.c:24:
> scripts/mod/../../include/linux/export.h:81:10: fatal error: linux/kconfig.h: No such file or directory
>
>
> Nicolas


Thanks for explaining this.

It is not the case any more.


I will reword the commit message as follows:

------------------------>8---------------------------------------
export.h: remove defined(__KERNEL__), which is no longer needed

The conditional define(__KERNEL__) was added by commit f235541699bc
("export.h: allow for per-symbol configurable EXPORT_SYMBOL()").

It was needed at that time to avoid the build error of modpost
with CONFIG_TRIM_UNUSED_KSYMS=y.

Since commit b2c5cdcfd4bc ("modpost: remove symbol prefix support"),
modpost no longer includes linux/export.h, thus the define(__KERNEL__)
is unneeded.
------------------------>8---------------------------------------



--
Best Regards
Masahiro Yamada
