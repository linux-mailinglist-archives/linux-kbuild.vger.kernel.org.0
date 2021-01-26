Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7C16304CFF
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Jan 2021 00:01:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731363AbhAZXAj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Jan 2021 18:00:39 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:28614 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394577AbhAZSSb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jan 2021 13:18:31 -0500
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 10QIHaHi032508;
        Wed, 27 Jan 2021 03:17:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 10QIHaHi032508
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611685056;
        bh=7tljXjQsNuev2v37BYuqJOM0jeTlpNcM2yL5Elu3JGE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=KQujx/bdocMevef+yC9nmNWMoTHCcY9KbDGg82TZ+hSU6KBu9S9sK6rNB8IAsc9Qg
         X/Cd5ht5NIvpC8VVCHqMJ9txgoE3xScs1ApA9yszMJqGY6zyLDXU1Aa5UOGYl1RUho
         RfmwTRug5iZV/2MFuETqrpbxaDpaVNBcYYSc5Y2Sok/rRQQCusHmPdbhUKwpcFpo3K
         COzAdRXY/to2uoJnFIr/tvFbCSNnrKUly8VrXE/zAFygi2xFPYduOXUbkQfI5pzrdS
         kFQTRaGW4L9wuxHFAEmt7YntvfH1BMNU22XuhnZSqhXRYdRKi6yXnQiTLLxmt/LGH0
         Yn0wcq6dmfbhQ==
X-Nifty-SrcIP: [209.85.216.47]
Received: by mail-pj1-f47.google.com with SMTP id p15so2477446pjv.3;
        Tue, 26 Jan 2021 10:17:36 -0800 (PST)
X-Gm-Message-State: AOAM531Z2zPUNtiFWqWUZZCAzA+ZiGBHsFJ22bNZxPIynzCG2zuMWr4s
        wlZ2S9YdUM62AwJ6tJntPfK5wRSCNexFgUxyNGk=
X-Google-Smtp-Source: ABdhPJyXIJbPd31WVVw4B7jaubRTUgL+rizWhKKm5x0X96w7h3rapE8ZF7rZIGNMp7EZ/2ysInRNGOAyi7aOT8UL9G4=
X-Received: by 2002:a17:90a:9a84:: with SMTP id e4mr1063642pjp.87.1611685055872;
 Tue, 26 Jan 2021 10:17:35 -0800 (PST)
MIME-Version: 1.0
References: <20210114100216.11787-1-info@metux.net> <CAK7LNARE2nGgRGgux9jRcv1ogfFBgBzxKygHxeHwy_GcnZO7sg@mail.gmail.com>
In-Reply-To: <CAK7LNARE2nGgRGgux9jRcv1ogfFBgBzxKygHxeHwy_GcnZO7sg@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 27 Jan 2021 03:16:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNATbnm+M4STsNFHrnNymA75G96aLQOMO22mXxsC8chEwtA@mail.gmail.com>
Message-ID: <CAK7LNATbnm+M4STsNFHrnNymA75G96aLQOMO22mXxsC8chEwtA@mail.gmail.com>
Subject: Re: [PATCH] scripts: kconfig: fix HOSTCC call
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 15, 2021 at 4:00 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Thu, Jan 14, 2021 at 7:05 PM Enrico Weigelt, metux IT consult
> <info@metux.net> wrote:
> >
>
> Thanks for catching this.
>
>
> > The change c0f975af1745391749e4306aa8081b9a4d2cced8 introduces a bug when
>
> Please use 12-digit hash ("subject") style.
>
>
> Commit c0f975af1745 ("kconfig: Support building mconf with vendor
> sysroot ncurses")
>
>
>
> > HOSTCC contains parameters: the whole command line is treated as the program
> > name (with spaces in it). Therefore, we have to remove the quotes.
> >
> > Fixes: c0f975af1745391749e4306aa8081b9a4d2cced8
>
> Ditto.
>
> Fixes: c0f975af1745 ("kconfig: Support building mconf with vendor
> sysroot ncurses")
>
>
>
> > Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
> > ---
> >  scripts/kconfig/mconf-cfg.sh | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/kconfig/mconf-cfg.sh b/scripts/kconfig/mconf-cfg.sh
> > index fcd4acd4e9cb..40fa449ed049 100755
> > --- a/scripts/kconfig/mconf-cfg.sh
> > +++ b/scripts/kconfig/mconf-cfg.sh
> > @@ -35,7 +35,7 @@ fi
> >
> >  # As a final fallback before giving up, check if $HOSTCC knows of a default
> >  # ncurses installation (e.g. from a vendor-specific sysroot).
> > -if echo '#include <ncurses.h>' | "${HOSTCC}" -E - >/dev/null 2>&1; then
> > +if echo '#include <ncurses.h>' | ${HOSTCC} -E - >/dev/null ; then
>
>
> Please keep 2>&1.
>
> This script will display the enough error message at the end.
>
>
>
> >         echo cflags=\"-D_GNU_SOURCE\"
> >         echo libs=\"-lncurses\"
> >         exit 0
> > --
> > 2.11.0
> >
>
>
> --
> Best Regards
> Masahiro Yamada


I did not get v2.

I fixed them up by myself and applied it to linux-kbuild/fixes.







-- 
Best Regards
Masahiro Yamada
