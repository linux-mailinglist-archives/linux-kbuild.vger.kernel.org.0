Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F32A4032D5
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Sep 2021 05:10:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233940AbhIHDLv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Sep 2021 23:11:51 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:52765 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231769AbhIHDLv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Sep 2021 23:11:51 -0400
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 1883AKEl025531;
        Wed, 8 Sep 2021 12:10:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 1883AKEl025531
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1631070621;
        bh=nHWYZJE2Do/yJRZXFrukxP+/SHM6+ZtDfSm5MRfpZO4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Lbp32YViCmvOJqwiYR/v96S+uAW8fkpfsms3RQtBT0/Jy3+mgijOy/tUXS+FmYj6o
         qC81K531eJXgYOKCtuG+FEJaE5SsDgLVcjQ1DHsTk0wWNcictufE5ycUCsCX6nPrlz
         ++qXKyLs74D3H20CWpt2yh4htJphY3F5lo6t6iQkPEQgNv2kFJhDmhCcCBmq7EIEr4
         GHKqvkxGG09yZq0NmG8DQWDWH4mvCBIYuchyiichp+iyWKlNlHjr0M3pxOVR6sVAgL
         jikqnOI0Rf/xtip44TcLcNbRsYR15fvZN3QP/5XZDsE/b0C5DLzXnisZCoT8l8y9it
         LgTRIrL8g8YBw==
X-Nifty-SrcIP: [209.85.216.48]
Received: by mail-pj1-f48.google.com with SMTP id k23-20020a17090a591700b001976d2db364so485690pji.2;
        Tue, 07 Sep 2021 20:10:20 -0700 (PDT)
X-Gm-Message-State: AOAM533lB2InUcngb+60ry2twGpPdO5eFz/EZignjUeO8eRY1yccL8Xm
        BH6ohvbyqFFwcteEB/CbuFbswGVT9aw0I/Go+W8=
X-Google-Smtp-Source: ABdhPJztCKogR5LYXJPaBemEsCRe3LzDBSbSck7WaqY/rhUuichBRvcDZUBYUCCvb61zC26n/7Q6agQC1m4I8Ez3jeo=
X-Received: by 2002:a17:902:f703:b029:12c:982:c9ae with SMTP id
 h3-20020a170902f703b029012c0982c9aemr1137855plo.20.1631070619984; Tue, 07 Sep
 2021 20:10:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7LNAQ0Q6CdXaD-dVGj_e3O3JYs_crpejWKpXHYQJYxyk-1VQ@mail.gmail.com>
 <CAHk-=wgoX0pVqNMMOcrhq=nuOfoZB_3qihyHB3y1S8qo=MDs6w@mail.gmail.com>
 <3b461878-a4a0-2f84-e177-9daf8fe285e7@kernel.org> <878s0c4vng.fsf@oldenburg.str.redhat.com>
 <20210904131911.GP1583@gate.crashing.org> <871r644bd2.fsf@oldenburg.str.redhat.com>
 <CAHk-=wi+XKYN+3u=_fm=ExqpEaHdER0XuKxVauHYVCPKpKR97Q@mail.gmail.com>
 <87a6kq2nze.fsf@oldenburg.str.redhat.com> <YTY7oYPJPYstU1+f@localhost.localdomain>
In-Reply-To: <YTY7oYPJPYstU1+f@localhost.localdomain>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 8 Sep 2021 12:09:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNATRN15cBU6gSZLHBqegj6F-x8+B8GNYp12wRUx_5u-FbQ@mail.gmail.com>
Message-ID: <CAK7LNATRN15cBU6gSZLHBqegj6F-x8+B8GNYp12wRUx_5u-FbQ@mail.gmail.com>
Subject: Re: [GIT PULL v2] Kbuild updates for v5.15-rc1
To:     Alexey Dobriyan <adobriyan@gmail.com>
Cc:     Florian Weimer <fweimer@redhat.com>,
        Linus Torvalds <torvalds@linuxfoundation.org>,
        Segher Boessenkool <segher@kernel.crashing.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        llvm@lists.linux.dev, linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Sep 7, 2021 at 1:02 AM Alexey Dobriyan <adobriyan@gmail.com> wrote:
>
> On Mon, Sep 06, 2021 at 08:54:13AM +0200, Florian Weimer wrote:
> > * Linus Torvalds:
> >
> > > On Sat, Sep 4, 2021 at 8:19 AM Florian Weimer <fweimer@redhat.com> wrote:
> > >>
> > >> In any case, it would be nice to know what the real motivation is.
> > >
> > > I don't know about the original motivation, but the reason I like that
> > > patch after-the-fact is that I've actually been in situations where I
> > > test out self-built compilers without installing them.
> >
> > Does this really simplify matters?  Why wouldn't the gcc compiler driver
> > find cc1, but not be able to pass the right path options, so that the
> > include/ subdirectory can be located as well?
> >
> > > Then it's convenient to have a completely standalone kernel tree.
> >
> > The final patch in the series is here:
> >
> >   isystem: delete global -isystem compile option
> >   <https://lore.kernel.org/linux-kernel/YQhY40teUJcTc5H4@localhost.localdomain/>
> >
> > It's still not self-contained.
>
> What do you mean?
>
> Mainline has 1/3 and 2/3 now:
>
>         c0891ac15f0428ffa81b2e818d416bdf3cb74ab6 isystem: ship and use stdarg.h
>         39f75da7bcc829ddc4d40bb60d0e95520de7898b isystem: trim/fixup stdarg.h and other headers
>
> 3/3 is stuck in -next:
>
>         https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/log/?h=for-next
>
> I'm not sure why. If the patch is bad it should be dropped from -next
> as well. If it is good, it should be in mainline, otherwise more
> compile time failures will happen.



See

https://lore.kernel.org/all/20210906084947.4f65761d@canb.auug.org.au/

Your 3/3 correctly detected a new use of <stddef.h>
in the drm tree.

Stephen Rothwell pointed it out a long time ago,
and fixed it in linux-next.

But, the drm maintainers did not fix it in time.
I could not fix it either since the bad commit,
b97060a99b01b4, was not in my tree.

Now it is mainlined, so my plan is to
do  s/<stddef.h>/<linux/stddef.h>/
in my tree, then include your 3/3
in my second pull request in this MW.







--
Best Regards
Masahiro Yamada
