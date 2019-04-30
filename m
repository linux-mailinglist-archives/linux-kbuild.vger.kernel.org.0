Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ACEEF36E
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Apr 2019 11:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbfD3JrC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Apr 2019 05:47:02 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:34490 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbfD3JrC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Apr 2019 05:47:02 -0400
Received: by mail-qt1-f195.google.com with SMTP id j6so15380613qtq.1;
        Tue, 30 Apr 2019 02:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RIOwKd01cPz5drHzb3qIzwRQR9gVwUVBDVP954q8f1c=;
        b=JpsAhm9VI9YNepan/eWkCGDi+CirADd/71NBenjaDolpr0/fcTYGm64KXpz6EnFm8s
         pU6L1wIV+cnvagtMlS12w/VaDqaRfS+nrH0VyhwsEyTJ+deIbu0IUwoqrRJlvmUMwbhU
         bTr2+hxU0YB48c+20sMGq0MiM07U06FYaiWV1MxEfGCqe9IZA1ylWdmxfOf2etaE7Ai0
         VLmPu0CFeyiF5cLFoIA/0RueBvxXQaQKWIbYqU84Pn4qlpTPOOtpDemvVdFvwgDyFBDx
         LkpGkFCpWb8+S+SV/EFTIhJs6ns43xhZ4D1M9Ly0++Dp9uIIef/FkafRxu63xo6XDJQh
         +8HQ==
X-Gm-Message-State: APjAAAWGPI8wCPT5otRZGomVrBpNM+rIgvbBe8PFkDkA2kl7AZrjYKBm
        LaJK5A1t8BrUdpmpPH/WYFavZyAJqmvjYPmhGdw=
X-Google-Smtp-Source: APXvYqyNRzEnjys7E6qhnDv8wRoS5Eser4iyoztSmhRL/DzrM9iEcc0H3dbxiUkIRRsXATIRQziQknkBUTofH6AHz+k=
X-Received: by 2002:a05:6214:10c8:: with SMTP id r8mr3468252qvs.161.1556617620578;
 Tue, 30 Apr 2019 02:47:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190430010037.6216-1-natechancellor@gmail.com>
 <CAK8P3a0gAnruPgGMFcAfoHpj_zDnsn-RJjYiYUXDDj-CrwoO8A@mail.gmail.com> <20190430093352.GA16941@archlinux-i9>
In-Reply-To: <20190430093352.GA16941@archlinux-i9>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 30 Apr 2019 11:46:44 +0200
Message-ID: <CAK8P3a20t1f6Fmjd7HcGVSXCxx9SP2q7_WpZyj16MgnJe8m8zQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Enable -Wsometimes-uninitialized
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
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

On Tue, Apr 30, 2019 at 11:33 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
> On Tue, Apr 30, 2019 at 09:16:50AM +0200, Arnd Bergmann wrote:
> > On Tue, Apr 30, 2019 at 3:01 AM Nathan Chancellor
> > <natechancellor@gmail.com> wrote:
> > >
> > > This is Clang's version of GCC's -Wmaybe-uninitialized. Up to this
> > > point, it has not been used because -Wuninitialized has been disabled,
> > > which also turns off -Wsometimes-uninitialized, meaning that we miss out
> > > on finding some bugs [1]. In my experience, it appears to be more
> > > accurate than GCC and catch some things that GCC can't.
> > >
> > > All of these warnings have now been fixed in -next across arm, arm64,
> > > and x86_64 defconfig/allyesconfig so this should be enabled for everyone
> > > to prevent more from easily creeping in.
> > >
> > > As of next-20190429:
> > >
> > > $ git log --oneline --grep="sometimes-uninitialized" | wc -l
> > > 45
> > >
> > > [1]: https://lore.kernel.org/lkml/86649ee4-9794-77a3-502c-f4cd10019c36@lca.pw/
> > >
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/381
> > > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > > ---
> > >
> > > Masahiro, I am not sure how you want to handle merging this with regards
> > > to all of the patches floating around in -next but I wanted to send this
> > > out to let everyone know this is ready to be turned on.
> > >
> > > Arnd, are there many remaning -Wsometimes-uninitialized warnings in
> > > randconfigs?
> >
> > No, I don't see any with the patches that I submitted. I haven't checked
> > if there are any that still need to get merged into linux-next though.
> >
> > > diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> > > index 768306add591..f4332981ea85 100644
> > > --- a/scripts/Makefile.extrawarn
> > > +++ b/scripts/Makefile.extrawarn
> > > @@ -72,5 +72,6 @@ KBUILD_CFLAGS += $(call cc-disable-warning, format)
> > >  KBUILD_CFLAGS += $(call cc-disable-warning, sign-compare)
> > >  KBUILD_CFLAGS += $(call cc-disable-warning, format-zero-length)
> > >  KBUILD_CFLAGS += $(call cc-disable-warning, uninitialized)
> > > +KBUILD_CFLAGS += $(call cc-option, -Wsometimes-uninitialized)
> > >  endif
> > >  endif
> >
> > This doesn't look right. Shouldn't you remove the line that turns off
> > -Wuninitilized
> > instead of adding only -Wsometimes-uninitialized?
>
> Well, there are still some outstanding issues with -Wuninitialized
> right? Like with DECLARE_WAIT_QUEUE_HEAD_ONSTACK? I'd rather not
> add warnings to the build but if you feel strongly, we could turn it on
> then fix them after.

Ah, I thought they were all fixed, as I don't see any remaining warnings
in my tree. It seems that I never send this workaround for
DECLARE_WAIT_QUEUE_HEAD_ONSTACK:

diff --git a/include/linux/wait.h b/include/linux/wait.h
index 5f3efabc36f4..cbe1ea0fce84 100644
--- a/include/linux/wait.h
+++ b/include/linux/wait.h
@@ -68,8 +68,15 @@ extern void __init_waitqueue_head(struct
wait_queue_head *wq_head, const char *n
        } while (0)

 #ifdef CONFIG_LOCKDEP
-# define __WAIT_QUEUE_HEAD_INIT_ONSTACK(name) \
-       ({ init_waitqueue_head(&name); name; })
+# define __WAIT_QUEUE_HEAD_INIT_ONSTACK(name) {
                 \
+       .lock           = __SPIN_LOCK_UNLOCKED(name.lock),
         \
+       .head           = ({
         \
+               static struct lock_class_key __key;
         \
+               lockdep_set_class_and_name(&(name).lock, &__key, #
name);       \
+               (struct list_head){ &(name).head, &(name).head };
         \
+       }),
         \
+}
+
 # define DECLARE_WAIT_QUEUE_HEAD_ONSTACK(name) \
        struct wait_queue_head name = __WAIT_QUEUE_HEAD_INIT_ONSTACK(name)
 #else

Are there any others you see?

      Arnd
