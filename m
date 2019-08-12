Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1BEE8A37A
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Aug 2019 18:38:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbfHLQiI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Aug 2019 12:38:08 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:60473 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbfHLQiI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Aug 2019 12:38:08 -0400
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x7CGbpM8017530
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Aug 2019 01:37:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x7CGbpM8017530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565627872;
        bh=fvuSQiMynEpBQ90fBHSj66RxevxrJhKC/yPpDYDYd38=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=0qnP1zTMn32oU1UzgTCMsXUafdOmb29y2MqPzkkeqfP9LPiZZk4Ep9TXCtGPR0ZWz
         MQenFnbStyDzQ77Xq3F81fXbZZEQ630cnVaD3qpMhTtACSVMGCgSEVvX2fjM7JGjJM
         d79WZtu4YaCyrZpXGsB8U49O4t86lrZghYKFJYQ8QfjO/748uJhYkV5heT/07PxeWv
         TzsDxhzh3pG1mZrVsSWAhweyTjP30MkXGkNUNUO0RxnpSzFIbvFa11QL4UWIAT+PRP
         3N6EbT955s7TKkxUN+n0efzQOS94DsX2CuN13R+sLiZxB9J74+xW8t+RfCluR1ojwq
         E14JtOeadYEAw==
X-Nifty-SrcIP: [209.85.217.44]
Received: by mail-vs1-f44.google.com with SMTP id 2so70186446vso.8
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Aug 2019 09:37:52 -0700 (PDT)
X-Gm-Message-State: APjAAAXloVEAHfkTQdxsjog1+11UXrXj3YN937qAygPWq0pSowQQ0hMP
        FB8Mh7TlIM5EJ0lH9iKb6GS+0df2tQARr1yexoA=
X-Google-Smtp-Source: APXvYqz0Uw/arqzD80Nkqgs8fMuGr5JR0ZhGsWMSlh8YQpeY9wqs8UMhvHULuWlU9vvh7M9VYBdcljF+eKmPmrYA7Bw=
X-Received: by 2002:a67:f495:: with SMTP id o21mr1335161vsn.54.1565627870861;
 Mon, 12 Aug 2019 09:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1565297255.git.guillaume.tucker@collabora.com>
 <3885ccdcbdbe83eb367e8344584df944adc76e34.1565297255.git.guillaume.tucker@collabora.com>
 <CAKwvOdmOdJspcO8jqUhqR63-MOWkV3ZrVcCO6u=HG6peov8Htw@mail.gmail.com> <20190809051552.GA44466@archlinux-threadripper>
In-Reply-To: <20190809051552.GA44466@archlinux-threadripper>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 13 Aug 2019 01:37:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT6Yp3oemUxSst+htnmM-St8WmSv+UZ2x2XF23cw-kU-Q@mail.gmail.com>
Message-ID: <CAK7LNAT6Yp3oemUxSst+htnmM-St8WmSv+UZ2x2XF23cw-kU-Q@mail.gmail.com>
Subject: Re: [PATCH RFC 1/1] kbuild: enable overriding the compiler using the environment
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Guillaume Tucker <guillaume.tucker@collabora.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Mark Brown <broonie@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Aug 9, 2019 at 2:15 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Thu, Aug 08, 2019 at 03:42:32PM -0700, 'Nick Desaulniers' via Clang Built Linux wrote:
> > On Thu, Aug 8, 2019 at 2:07 PM Guillaume Tucker
> > <guillaume.tucker@collabora.com> wrote:
> > >
> > > Only use gcc/g++ for HOSTCC, HOSTCXX and CC by default if they are not
> > > already defined in the environment.  This fixes cases such as building
> > > host tools with clang without having gcc installed.
> > >
> > > The issue was initially hit when running merge_config.sh with clang
> > > only as it failed to build "HOSTCC scripts/basic/fixdep".
> >
> > Thanks for the patch.  I don't quite follow the exact error.
> >
> > When building with Clang, I usually do:
> >
> > $ make CC=clang HOSTCC=clang ...
> >
> > are you trying to fix the case where you do:
> >
> > $ make CC=clang ...
> > <no HOSTCC set>
> > when GCC is not installed?  Because if so, I think it would be easier
> > to just specify HOSTCC=clang, but maybe I'm misunderstanding the
> > issue?
>
> As I understand it,
>
> $ make CC=clang HOSTCC=clang
>
> works fine. What doesn't currently work is:
>
> $ export CC=clang
> $ export HOSTCC=clang
> $ make
>
> This is problematic because there is no way for CC, HOSTCC, and HOSTCXX
> to be passed to make within scripts/kconfig/merge_config.sh.

Is it so problematic?

If you start from make, CC=clang and HOSTCC=clang are propagated to sub-make
even via shell scripts such as merge_config.sh

Only the problem I see is the situation where
a user directly runs scripts/kconfig/merge_config.sh
without using make as a start-point.

A user can wrap merge_config.sh with a simple Makefile
if they want to override CC, HOSTCC, etc.


"You can easily pass environment variables" means
"the build system may accidentally pick up them
when it is not desirable."




> A quick test before and after the patch:
>
> $ ( export HOSTCC=clang; make -j$(nproc) O=out defconfig V=1 )
> ...
>   gcc -Wp,-MD,scripts/kconfig/.conf.o.d -Wall -Wmissing-prototypes...
>   gcc -Wp,-MD,scripts/kconfig/.confdata.o.d -Wall -Wmissing-prototypes...
> ...
> $ ( export HOSTCC=clang; make -j$(nproc) O=out defconfig V=1 )
> ...
>   clang -Wp,-MD,scripts/kconfig/.conf.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes...
>   clang -Wp,-MD,scripts/kconfig/.confdata.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes...
> ...
>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> Tested-by: Nathan Chancellor <natechancellor@gmail.com>
>
> I wonder if all variable should be converted to that scheme or just the
> ones that are needed in this instance. I also wonder if this will cause
> any issues with people who define these variables in their environment
> already; if so, maybe merge_config.sh should be updated to support
> passing CC, HOSTCC, and HOSTCXX to make.

This is not a problem for upstream code, at least.



-- 
Best Regards
Masahiro Yamada
