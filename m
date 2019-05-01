Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD3E2107E3
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 May 2019 14:30:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725993AbfEAMay (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 May 2019 08:30:54 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:62153 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbfEAMay (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 May 2019 08:30:54 -0400
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x41CUdm4002354;
        Wed, 1 May 2019 21:30:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x41CUdm4002354
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1556713840;
        bh=ZOz4emb78+mGztbgJdzsGMxS17b8QGJQmYkG176lPJQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tTkOt0eZt6TX4n/BbI6VYt1zXYFqh3fsD2XTR2aELQk6TUTxj9kaltiMoEYN6p9UX
         s0Z+VpkfeF3Z9lR46rIzMvyj6jUF49uYGLHVxc3tcHO5j3/f36l1rizL3OIa6r/q+v
         hX78G3wP0nDzdeNIwmpRBa9vDaGPICHX7scAlPu7m7Ow6UFd5vK+syS/Q7wVh0V3Hj
         TM25wVvrVe//VM3cd7fczwyNHl95Z1qMUCtQBg938o/gjRLj2W9XIitRaG2yw0Czzl
         BcqAEObaY8l8PecLIuZQ2YeWGYGGnn/u+W9jZijNevkAckzF/ggJ63qixwTtx9Tjzx
         +6oaLOnGNoeXA==
X-Nifty-SrcIP: [209.85.221.178]
Received: by mail-vk1-f178.google.com with SMTP id x2so3772274vkx.13;
        Wed, 01 May 2019 05:30:39 -0700 (PDT)
X-Gm-Message-State: APjAAAW4zkFIzwiAtrowGouaZ+Vrz/bxXEwSf10ELIALSAornnBSP6VL
        MrVtLE0UWcBThEj2Ar9txs1RM8BX7gRHdLjanjw=
X-Google-Smtp-Source: APXvYqzUi++U/dY9Kig0p02O9OfqMKCRQi4IlXNh5LN6CXzcHdNrASiQK9qTiXO/Rwvr22mijxSRLnneU2OtXa1+3Lo=
X-Received: by 2002:a1f:9d0a:: with SMTP id g10mr10052011vke.0.1556713838634;
 Wed, 01 May 2019 05:30:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190430010037.6216-1-natechancellor@gmail.com>
 <CAK8P3a0gAnruPgGMFcAfoHpj_zDnsn-RJjYiYUXDDj-CrwoO8A@mail.gmail.com>
 <20190430093352.GA16941@archlinux-i9> <CAK8P3a20t1f6Fmjd7HcGVSXCxx9SP2q7_WpZyj16MgnJe8m8zQ@mail.gmail.com>
 <20190430205411.GA5628@archlinux-i9>
In-Reply-To: <20190430205411.GA5628@archlinux-i9>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 1 May 2019 21:30:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNAREXfnvY9PWBSHa8HApy1NohrDo9Z2eZUwyxO_P-KUrxQ@mail.gmail.com>
Message-ID: <CAK7LNAREXfnvY9PWBSHa8HApy1NohrDo9Z2eZUwyxO_P-KUrxQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Enable -Wsometimes-uninitialized
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, May 1, 2019 at 5:54 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Tue, Apr 30, 2019 at 11:46:44AM +0200, Arnd Bergmann wrote:
> > On Tue, Apr 30, 2019 at 11:33 AM Nathan Chancellor
> > <natechancellor@gmail.com> wrote:
> > > On Tue, Apr 30, 2019 at 09:16:50AM +0200, Arnd Bergmann wrote:
> > > > On Tue, Apr 30, 2019 at 3:01 AM Nathan Chancellor
> > > > <natechancellor@gmail.com> wrote:
> > > > >
> > > > > This is Clang's version of GCC's -Wmaybe-uninitialized. Up to this
> > > > > point, it has not been used because -Wuninitialized has been disabled,
> > > > > which also turns off -Wsometimes-uninitialized, meaning that we miss out
> > > > > on finding some bugs [1]. In my experience, it appears to be more
> > > > > accurate than GCC and catch some things that GCC can't.
> > > > >
> > > > > All of these warnings have now been fixed in -next across arm, arm64,
> > > > > and x86_64 defconfig/allyesconfig so this should be enabled for everyone
> > > > > to prevent more from easily creeping in.
> > > > >
> > > > > As of next-20190429:
> > > > >
> > > > > $ git log --oneline --grep="sometimes-uninitialized" | wc -l
> > > > > 45
> > > > >
> > > > > [1]: https://lore.kernel.org/lkml/86649ee4-9794-77a3-502c-f4cd10019c36@lca.pw/
> > > > >
> > > > > Link: https://github.com/ClangBuiltLinux/linux/issues/381
> > > > > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > > > > ---
> > > > >
> > > > > Masahiro, I am not sure how you want to handle merging this with regards
> > > > > to all of the patches floating around in -next but I wanted to send this
> > > > > out to let everyone know this is ready to be turned on.
> > > > >
> > > > > Arnd, are there many remaning -Wsometimes-uninitialized warnings in
> > > > > randconfigs?
> > > >
> > > > No, I don't see any with the patches that I submitted. I haven't checked
> > > > if there are any that still need to get merged into linux-next though.
> > > >
> > > > > diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> > > > > index 768306add591..f4332981ea85 100644
> > > > > --- a/scripts/Makefile.extrawarn
> > > > > +++ b/scripts/Makefile.extrawarn
> > > > > @@ -72,5 +72,6 @@ KBUILD_CFLAGS += $(call cc-disable-warning, format)
> > > > >  KBUILD_CFLAGS += $(call cc-disable-warning, sign-compare)
> > > > >  KBUILD_CFLAGS += $(call cc-disable-warning, format-zero-length)
> > > > >  KBUILD_CFLAGS += $(call cc-disable-warning, uninitialized)
> > > > > +KBUILD_CFLAGS += $(call cc-option, -Wsometimes-uninitialized)
> > > > >  endif
> > > > >  endif
> > > >
> > > > This doesn't look right. Shouldn't you remove the line that turns off
> > > > -Wuninitilized
> > > > instead of adding only -Wsometimes-uninitialized?
> > >
> > > Well, there are still some outstanding issues with -Wuninitialized
> > > right? Like with DECLARE_WAIT_QUEUE_HEAD_ONSTACK? I'd rather not
> > > add warnings to the build but if you feel strongly, we could turn it on
> > > then fix them after.
> >
> > Ah, I thought they were all fixed, as I don't see any remaining warnings
> > in my tree. It seems that I never send this workaround for
> > DECLARE_WAIT_QUEUE_HEAD_ONSTACK:
> >
> > diff --git a/include/linux/wait.h b/include/linux/wait.h
> > index 5f3efabc36f4..cbe1ea0fce84 100644
> > --- a/include/linux/wait.h
> > +++ b/include/linux/wait.h
> > @@ -68,8 +68,15 @@ extern void __init_waitqueue_head(struct
> > wait_queue_head *wq_head, const char *n
> >         } while (0)
> >
> >  #ifdef CONFIG_LOCKDEP
> > -# define __WAIT_QUEUE_HEAD_INIT_ONSTACK(name) \
> > -       ({ init_waitqueue_head(&name); name; })
> > +# define __WAIT_QUEUE_HEAD_INIT_ONSTACK(name) {
> >                  \
> > +       .lock           = __SPIN_LOCK_UNLOCKED(name.lock),
> >          \
> > +       .head           = ({
> >          \
> > +               static struct lock_class_key __key;
> >          \
> > +               lockdep_set_class_and_name(&(name).lock, &__key, #
> > name);       \
> > +               (struct list_head){ &(name).head, &(name).head };
> >          \
> > +       }),
> >          \
> > +}
> > +
> >  # define DECLARE_WAIT_QUEUE_HEAD_ONSTACK(name) \
> >         struct wait_queue_head name = __WAIT_QUEUE_HEAD_INIT_ONSTACK(name)
> >  #else
> >
> > Are there any others you see?
> >
> >       Arnd
>
> After applying that diff by hand and another patch that was accepted but
> not in -next (https://lore.kernel.org/lkml/20190325125147.1436083-1-arnd@arndb.de/),
> I see three other warnings:
>
> arm, arm64, and x86_64 allyesconfig:
>
> drivers/net/wireless/rsi/rsi_91x_sdio.c:940:43: error: variable 'data'
> is uninitialized when used here [-Werror,-Wuninitialized]
>
> https://github.com/ClangBuiltLinux/linux/issues/464
>
> x86 allyesconfig:
>
> mm/kasan/common.c:490:40: error: variable 'tag' is uninitialized when
> used here [-Werror,-Wuninitialized]
>
> https://github.com/ClangBuiltLinux/linux/issues/465
>
> drivers/misc/sgi-xp/xpc_partition.c:73:14: error: variable 'buf' is
> uninitialized when used within its own initialization
> [-Werror,-Wuninitialized]
>
> https://github.com/ClangBuiltLinux/linux/issues/466
>
> These shouldn't be difficult to fix then we can turn both uninitialized
> warnings.
>
> Please let me know if you have any input with regards to fixing them, I
> am going to try to look at them later today.
>
> Nathan


I will postpone this patch.


It looks like we agreed to fix warnings first,
then remove $(call cc-disable-warning, uninitialized).





-- 
Best Regards
Masahiro Yamada
