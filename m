Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7CD021B87
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2019 18:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729005AbfEQQXB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 May 2019 12:23:01 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:34752 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728551AbfEQQXA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 May 2019 12:23:00 -0400
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x4HGMVaK003905;
        Sat, 18 May 2019 01:22:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x4HGMVaK003905
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1558110152;
        bh=Wwt187hQsF2JXTD8bZx5RKT61k3s1eN3rBaXjTcGpy4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=xiRIElESXDtWVq7AzlQ0N/pqNJjh0Xz/OKLBeufz+nXY6ec+hHLBNjdxpUUJGGpfk
         fhJXOST+ZCI9Z0HQ0SNVNc9S43NTZy/yWhUH7KItRI6Qv7Q7QVP+tt5aYiQiSLvNSd
         yq6pzu5OEVh54tEUmndnoHyZpbm5lw6q/GXWuaw0PLhj0pZKESqr2x07hAPNmwNrkd
         nhPXrOLoOi4mtx/M9wUDXw+nJit+AEi73O8/3OdEhM0vBgiIIfPryYfunLnTXSLkyS
         WX1C8Qh4vVvHT37SY8TIvPnTIgeCD2TYbUvc7fCATAgKzzd8hGV2VjqDnhJhwLfgwU
         k9B95XHAi5mWQ==
X-Nifty-SrcIP: [209.85.222.48]
Received: by mail-ua1-f48.google.com with SMTP id u4so2891470uau.10;
        Fri, 17 May 2019 09:22:31 -0700 (PDT)
X-Gm-Message-State: APjAAAU3IjALMz5T/YHE96TFI2IRnGoJF2coBdmMEJgEZw5fIKnHGlqr
        qG7a3hLG12EUikLXXJYR9kvRB+n3lHynACJvOMo=
X-Google-Smtp-Source: APXvYqyjITd1Ww1lIcjrL8ajTzkUzVfPQbq4KKQUi44h3KSwDulbc7/zQXEVmRx/WskHcgP8qOIPs8s9+iL/OGaB/XA=
X-Received: by 2002:a9f:366b:: with SMTP id s40mr2324205uad.121.1558110150398;
 Fri, 17 May 2019 09:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190517042753.25857-1-yamada.masahiro@socionext.com>
 <CAK7LNARvQUPPBzdq7ac67h-xhB6tHZ4WPzBHZy+c3iHE_bi_Fg@mail.gmail.com>
 <20190517053658.GA3464@kroah.com> <CAKi4VAJQtPvPUKUpYgJdr1o3KHF47QyHw8jSxkO+1qz1Em57JQ@mail.gmail.com>
In-Reply-To: <CAKi4VAJQtPvPUKUpYgJdr1o3KHF47QyHw8jSxkO+1qz1Em57JQ@mail.gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 18 May 2019 01:21:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ7Q4jbLXCs-8xtDAF_YPBtcy6g6ABZ19pZ08RN6j52hw@mail.gmail.com>
Message-ID: <CAK7LNAQ7Q4jbLXCs-8xtDAF_YPBtcy6g6ABZ19pZ08RN6j52hw@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: check uniqueness of module names
To:     Lucas De Marchi <lucas.de.marchi@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>, Arnd Bergmann <arnd@arndb.de>,
        Jessica Yu <jeyu@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rusty Russell <rusty@rustcorp.com.au>,
        Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 17, 2019 at 2:46 PM Lucas De Marchi
<lucas.de.marchi@gmail.com> wrote:
>
> On Thu, May 16, 2019 at 10:37 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, May 17, 2019 at 01:45:11PM +0900, Masahiro Yamada wrote:
> > > On Fri, May 17, 2019 at 1:29 PM Masahiro Yamada
> > > <yamada.masahiro@socionext.com> wrote:
> > > >
> > > > In the recent build test of linux-next, Stephen saw a build error
> > > > caused by a broken .tmp_versions/*.mod file:
> > > >
> > > >   https://lkml.org/lkml/2019/5/13/991
> > > >
> > > > drivers/net/phy/asix.ko and drivers/net/usb/asix.ko have the same
> > > > basename, and there is a race in generating .tmp_versions/asix.mod
> > > >
> > > > Kbuild has not checked this before, and it suddenly shows up with
> > > > obscure error message when this kind of race occurs.
> > > >
> > > > Non-unique module names cause various sort of problems, but it is
> > > > not trivial to catch them by eyes.
> > > >
> > > > Hence, this script.
> > > >
> > > > It checks not only real modules, but also built-in modules (i.e.
> > > > controlled by tristate CONFIG option, but currently compiled with =y).
> > > > Non-unique names for built-in modules also cause problems because
> > > > /sys/modules/ would fall over.
> > > >
> > > > I tested allmodconfig on the latest kernel, and it detected the
> > > > following:
> > > >
> > > > warning: same basename if the following are built as modules:
> > > >   drivers/regulator/88pm800.ko
> > > >   drivers/mfd/88pm800.ko
> > > > warning: same basename if the following are built as modules:
> > > >   drivers/gpu/drm/bridge/adv7511/adv7511.ko
> > > >   drivers/media/i2c/adv7511.ko
> > > > warning: same basename if the following are built as modules:
> > > >   drivers/net/phy/asix.ko
> > > >   drivers/net/usb/asix.ko
> > > > warning: same basename if the following are built as modules:
> > > >   fs/coda/coda.ko
> > > >   drivers/media/platform/coda/coda.ko
> > > > warning: same basename if the following are built as modules:
> > > >   drivers/net/phy/realtek.ko
> > > >   drivers/net/dsa/realtek.ko
> > > >
> > > > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > > > Reviewed-by: Kees Cook <keescook@chromium.org>
> > > > ---
> > >
> > >
> > > One more question popped up.
> > >
> > > External modules are out of scope of the community,
> > > but it is possible that people create an external module
> > > that happens to have the same name as an upstream driver.
> >
> > That is their bug, nothing we can do about that :)
>
> It's actually not a bug. For external modules it works pretty much as
> intended. See DEPMOD.D(5): the search directive tells what's the
> preference among the directories for modules with the same name.
> depmod respects that order and put the right one into your
> modules.dep.
>
> This allows to put external modules in a different dir and also to
> make backports of modules from recent to ancient kernels.  These
> modules with the same name are usually the same module, with a
> different version. Of course what we have here and you are fixing is a
> different story.

OK, so external modules should not be checked.

Thanks for the explanation!


> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>
> Lucas De Marchi



-- 
Best Regards
Masahiro Yamada
