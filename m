Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3C810136
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Apr 2019 22:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbfD3UyR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Apr 2019 16:54:17 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:35650 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726015AbfD3UyR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Apr 2019 16:54:17 -0400
Received: by mail-ed1-f68.google.com with SMTP id y67so13529176ede.2;
        Tue, 30 Apr 2019 13:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mrrcH0wpIA3AryJf9NOtPAeF4YldmZdmuNLGq+LqXpo=;
        b=WF3VHj4ANkBllLpEaJMY1umz8TOfltG1fpY2ohdaTZvuYIDiLmGeL112SXNoQC+2Q6
         WCjpIALKxPNxwi/69AgQdVFACYueqyD/7wvbNzBnEuZP2AyCoMtXF1Yy5pPnPpT8saVI
         5/mejqZgREZFaesnC0g/lMxFB7CMnR+H0o6WrH+XlRdO1MJkA/4gSugo0xJacipIBeTO
         kUbanebwiZsOI/1Hz1huf2nSIwHY004MtNlaVLEv7UjDji9VW0ZsjJfBbqdyqbhWQPul
         mjNQnVNcDkB0KAgCGsnlVxReoCPcX4B8sWcQPmrrsSf/sjUcIHuQiUSJMmWb0pFEPYQc
         KQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mrrcH0wpIA3AryJf9NOtPAeF4YldmZdmuNLGq+LqXpo=;
        b=Q3I1QH7nlic+Nomd3X4JbWs6RYVZbqN3uJnKkC0u04zzl93Q85Kr0epuNNS4rh5CgX
         NYJiQjG4iHd/5QggcZ5Dfe/p+ulFLe6TxhZHoYoC4PzGRfA1Ii7zIIWgNVzzRIMpzQEC
         aTbuYyfStFv867H5GC0PZRlBYlESYBsRnwHdQktk0OH1XZ3BCDY3DcW4oWz5phyTYH3r
         pwG/6vOi08R8FB0rE3cX/rZC63MbIWiypPirpMKOv2qQQefFXjXnnMxz09n7kRQY2SMb
         rhPpx5XbJFNDfTZa65uREuK1WUNrtEeBdE0mB0h19rQOg6HMC/LjqkDCjvp4NYhQ4/rH
         1Vaw==
X-Gm-Message-State: APjAAAUJ6l511L+VspoiQz7O3je5ltRPSL59mZGsbrKntQTCFlkfEA5k
        Vc0Dp8Irt1NiMUJo8MHeZ0k=
X-Google-Smtp-Source: APXvYqxz0gHI1/9wqXsmUHKr9dMzjFOo+0Peh4Dmux12dMGKFXUZKW3qgouHNLgawnOnIOug2XBlfQ==
X-Received: by 2002:a17:906:e10e:: with SMTP id gj14mr12867406ejb.285.1556657654583;
        Tue, 30 Apr 2019 13:54:14 -0700 (PDT)
Received: from archlinux-i9 ([2a01:4f9:2b:2b84::2])
        by smtp.gmail.com with ESMTPSA id 10sm3593003edu.61.2019.04.30.13.54.12
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 30 Apr 2019 13:54:13 -0700 (PDT)
Date:   Tue, 30 Apr 2019 13:54:11 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] kbuild: Enable -Wsometimes-uninitialized
Message-ID: <20190430205411.GA5628@archlinux-i9>
References: <20190430010037.6216-1-natechancellor@gmail.com>
 <CAK8P3a0gAnruPgGMFcAfoHpj_zDnsn-RJjYiYUXDDj-CrwoO8A@mail.gmail.com>
 <20190430093352.GA16941@archlinux-i9>
 <CAK8P3a20t1f6Fmjd7HcGVSXCxx9SP2q7_WpZyj16MgnJe8m8zQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a20t1f6Fmjd7HcGVSXCxx9SP2q7_WpZyj16MgnJe8m8zQ@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Apr 30, 2019 at 11:46:44AM +0200, Arnd Bergmann wrote:
> On Tue, Apr 30, 2019 at 11:33 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> > On Tue, Apr 30, 2019 at 09:16:50AM +0200, Arnd Bergmann wrote:
> > > On Tue, Apr 30, 2019 at 3:01 AM Nathan Chancellor
> > > <natechancellor@gmail.com> wrote:
> > > >
> > > > This is Clang's version of GCC's -Wmaybe-uninitialized. Up to this
> > > > point, it has not been used because -Wuninitialized has been disabled,
> > > > which also turns off -Wsometimes-uninitialized, meaning that we miss out
> > > > on finding some bugs [1]. In my experience, it appears to be more
> > > > accurate than GCC and catch some things that GCC can't.
> > > >
> > > > All of these warnings have now been fixed in -next across arm, arm64,
> > > > and x86_64 defconfig/allyesconfig so this should be enabled for everyone
> > > > to prevent more from easily creeping in.
> > > >
> > > > As of next-20190429:
> > > >
> > > > $ git log --oneline --grep="sometimes-uninitialized" | wc -l
> > > > 45
> > > >
> > > > [1]: https://lore.kernel.org/lkml/86649ee4-9794-77a3-502c-f4cd10019c36@lca.pw/
> > > >
> > > > Link: https://github.com/ClangBuiltLinux/linux/issues/381
> > > > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > > > ---
> > > >
> > > > Masahiro, I am not sure how you want to handle merging this with regards
> > > > to all of the patches floating around in -next but I wanted to send this
> > > > out to let everyone know this is ready to be turned on.
> > > >
> > > > Arnd, are there many remaning -Wsometimes-uninitialized warnings in
> > > > randconfigs?
> > >
> > > No, I don't see any with the patches that I submitted. I haven't checked
> > > if there are any that still need to get merged into linux-next though.
> > >
> > > > diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> > > > index 768306add591..f4332981ea85 100644
> > > > --- a/scripts/Makefile.extrawarn
> > > > +++ b/scripts/Makefile.extrawarn
> > > > @@ -72,5 +72,6 @@ KBUILD_CFLAGS += $(call cc-disable-warning, format)
> > > >  KBUILD_CFLAGS += $(call cc-disable-warning, sign-compare)
> > > >  KBUILD_CFLAGS += $(call cc-disable-warning, format-zero-length)
> > > >  KBUILD_CFLAGS += $(call cc-disable-warning, uninitialized)
> > > > +KBUILD_CFLAGS += $(call cc-option, -Wsometimes-uninitialized)
> > > >  endif
> > > >  endif
> > >
> > > This doesn't look right. Shouldn't you remove the line that turns off
> > > -Wuninitilized
> > > instead of adding only -Wsometimes-uninitialized?
> >
> > Well, there are still some outstanding issues with -Wuninitialized
> > right? Like with DECLARE_WAIT_QUEUE_HEAD_ONSTACK? I'd rather not
> > add warnings to the build but if you feel strongly, we could turn it on
> > then fix them after.
> 
> Ah, I thought they were all fixed, as I don't see any remaining warnings
> in my tree. It seems that I never send this workaround for
> DECLARE_WAIT_QUEUE_HEAD_ONSTACK:
> 
> diff --git a/include/linux/wait.h b/include/linux/wait.h
> index 5f3efabc36f4..cbe1ea0fce84 100644
> --- a/include/linux/wait.h
> +++ b/include/linux/wait.h
> @@ -68,8 +68,15 @@ extern void __init_waitqueue_head(struct
> wait_queue_head *wq_head, const char *n
>         } while (0)
> 
>  #ifdef CONFIG_LOCKDEP
> -# define __WAIT_QUEUE_HEAD_INIT_ONSTACK(name) \
> -       ({ init_waitqueue_head(&name); name; })
> +# define __WAIT_QUEUE_HEAD_INIT_ONSTACK(name) {
>                  \
> +       .lock           = __SPIN_LOCK_UNLOCKED(name.lock),
>          \
> +       .head           = ({
>          \
> +               static struct lock_class_key __key;
>          \
> +               lockdep_set_class_and_name(&(name).lock, &__key, #
> name);       \
> +               (struct list_head){ &(name).head, &(name).head };
>          \
> +       }),
>          \
> +}
> +
>  # define DECLARE_WAIT_QUEUE_HEAD_ONSTACK(name) \
>         struct wait_queue_head name = __WAIT_QUEUE_HEAD_INIT_ONSTACK(name)
>  #else
> 
> Are there any others you see?
> 
>       Arnd

After applying that diff by hand and another patch that was accepted but
not in -next (https://lore.kernel.org/lkml/20190325125147.1436083-1-arnd@arndb.de/),
I see three other warnings:

arm, arm64, and x86_64 allyesconfig:

drivers/net/wireless/rsi/rsi_91x_sdio.c:940:43: error: variable 'data'
is uninitialized when used here [-Werror,-Wuninitialized]

https://github.com/ClangBuiltLinux/linux/issues/464

x86 allyesconfig:

mm/kasan/common.c:490:40: error: variable 'tag' is uninitialized when
used here [-Werror,-Wuninitialized]

https://github.com/ClangBuiltLinux/linux/issues/465

drivers/misc/sgi-xp/xpc_partition.c:73:14: error: variable 'buf' is
uninitialized when used within its own initialization
[-Werror,-Wuninitialized]

https://github.com/ClangBuiltLinux/linux/issues/466

These shouldn't be difficult to fix then we can turn both uninitialized
warnings.

Please let me know if you have any input with regards to fixing them, I
am going to try to look at them later today.

Nathan
