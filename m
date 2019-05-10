Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 287F819910
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 May 2019 09:42:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbfEJHmE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 10 May 2019 03:42:04 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:19786 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727010AbfEJHmE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 May 2019 03:42:04 -0400
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x4A7fxCC015622;
        Fri, 10 May 2019 16:42:00 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x4A7fxCC015622
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557474120;
        bh=YlQFpWyCF4koFxUrKwNjn9H1imLHQlb49VlUA4xXZYA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=oFRNmm+TGe1qy/v7ZQw+y6pRKAh6pVDPwP//JL/BaDHT2vhWR/TzwA5xDb/hHwkb5
         gztwZV3FFOqDLuF1mKUAlK+/C+M6lf63xPplpUSW1/3rGRzETVPcWBhdeEGfmIk2Yc
         VNdg3hBwozenPzDfu+54czxfhT5bGcBVsHmeM6hvmnlNwEC7+aWFXk2rDWHOi/tas7
         uvQFbI7l5Yz+IqGzXK9kLelaWezffJvTwh3FBpRTPVZCvbbkRNkDDsH34DV24k9puo
         tpVEU+5b6P5d1gcRTpSAqcXXRcp2VrjVi3kn8M05boKkFFcBgvz7JFOsNSQEg0+85P
         yh5JhVgka6Axw==
X-Nifty-SrcIP: [209.85.217.41]
Received: by mail-vs1-f41.google.com with SMTP id g127so3075453vsd.6;
        Fri, 10 May 2019 00:42:00 -0700 (PDT)
X-Gm-Message-State: APjAAAVLiR7jSksHdoQPGA4+aZB4z6ckvz50hUPRTmwm2K6+sXNxqarM
        EbQ201Lg4B1qhg1033gNzFKY07sWsg9cAVsYjTo=
X-Google-Smtp-Source: APXvYqyb54JevkNf9JGs+zEb+MQYiroUyACgsvaXHMXV6/bGlgqBtrjellKiAZxjNFSuKKJ/q25aW+wrj3Zj17pa8/E=
X-Received: by 2002:a67:f443:: with SMTP id r3mr5034549vsn.179.1557474119142;
 Fri, 10 May 2019 00:41:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190510061205.28753-1-yamada.masahiro@socionext.com>
 <20190510061205.28753-2-yamada.masahiro@socionext.com> <CAMuHMdVmgZjyGxz0F=Akz+3egFtGMppGg6TRAnRhd=KZv5ADdg@mail.gmail.com>
 <20190510070354.GA2193@ravnborg.org>
In-Reply-To: <20190510070354.GA2193@ravnborg.org>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri, 10 May 2019 16:41:23 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS56NOTdmAmHdi9Kk23HjbQXDmEJEySSU0c=+eTQF5nEw@mail.gmail.com>
Message-ID: <CAK7LNAS56NOTdmAmHdi9Kk23HjbQXDmEJEySSU0c=+eTQF5nEw@mail.gmail.com>
Subject: Re: [PATCH 2/2] kconfig: do not write .config if the content is the same
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Ulf Magnusson <ulfalizer@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Sam, Geert,

On Fri, May 10, 2019 at 4:04 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Geert/Masahiro.
>
> On Fri, May 10, 2019 at 08:46:35AM +0200, Geert Uytterhoeven wrote:
> > Hi Yamada-san,
> >
> > On Fri, May 10, 2019 at 8:14 AM Masahiro Yamada
> > <yamada.masahiro@socionext.com> wrote:
> > > Kconfig updates the .config when it exits even if its content is
> > > exactly the same as before. Since its timestamp becomes newer than
> > > that of other build artifacts, additional processing is invoked,
> > > which is annoying.
> > >
> > > - syncconfig is invoked to update include/config/auto.conf, etc.
> > >
> > > - kernel/config.o is recompiled if CONFIG_IKCONFIG is enabled,
> > >   then vmlinux is relinked as well.
> > >
> > > If the .config is not changed at all, we do not have to even
> > > touch it. Just bail out showing "No change to .config".
> It would be preferable that if nothing changed no output is generated.
> Like we do not tell that we did not build a .o file because the .c file
> had not changed.
> Less noise for a kernel build where nothings happens.
>
> > This causes a semantic change for the meaning of ".config.old", which is
> > no longer updated if .config has not changed.
> > Hence its contents may no longer correspond to the previous config, but to
> > an arbitrary older version.
> This semantic change is good.
> So we now have a .config.old that correspond to the state before
> the last change. Also after several kernel builds.


I agree.

When there is no change in the configuration,
Kconfig will not even attempt to output anything.

Updating only .config.old is strange.

Thanks.



--
Best Regards
Masahiro Yamada
