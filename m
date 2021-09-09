Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30FF4405182
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Sep 2021 14:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245055AbhIIMgw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 Sep 2021 08:36:52 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:37308 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245505AbhIIMVW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Sep 2021 08:21:22 -0400
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 189CJdS2020498
        for <linux-kbuild@vger.kernel.org>; Thu, 9 Sep 2021 21:19:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 189CJdS2020498
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1631189979;
        bh=CQQRyHB1KNx3qRzbikLQLOX+N/k41wFdP4y3OXQBr4g=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=X7m8WDe6Iy52qTHSZ7R3sAD9CfFfZjWDmPsYqmv1fZUUAmKrH+h0aIfd0rh4mv1u+
         N3oLR6qGE8NiMGQhTQi8NQTVj94l48MQ8L03KADS1E6AOC4++XKNRFjZRxI4WhUXWy
         Lt1v8Phuf49ItJvBWHmil6XMvx7biA5cIrdcoXb+4BMmpgyMI0LvOWnsFk8QZyY97f
         Z3av6WWzWhJo69T67/ag8vgJmvKFwnRjF6D77+iDzqYX41ElUVTAs/eaxuJNrslP5M
         +wzN6ihYGl2KNl7mX9h8aS+4zv86NwI8bVuuKD0k/ZOGqt4qdnBtil0d7N3vdSzvXW
         qOFWBmTt0d/7A==
X-Nifty-SrcIP: [209.85.214.182]
Received: by mail-pl1-f182.google.com with SMTP id e7so941120plh.8
        for <linux-kbuild@vger.kernel.org>; Thu, 09 Sep 2021 05:19:39 -0700 (PDT)
X-Gm-Message-State: AOAM5303bl3FXFE5/HO2xvsJLAWSX5FVJqpzpWpP+5XWe+/YvoM8H2CW
        OiLRRT5hdLLiPPfmnyXRp7NJ9MVoMUABkk0Qdik=
X-Google-Smtp-Source: ABdhPJwRKRWQFbAIFBcFudkvcRFEbLhDaiNtLIUyrjJlY6G++tS58bRI1kHzS/1k8EALhAsRr2WnS0uZ0ZBojhFrEVM=
X-Received: by 2002:a17:90a:d307:: with SMTP id p7mr2357690pju.144.1631189978688;
 Thu, 09 Sep 2021 05:19:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAGt4E5tzxtCLaasW_Es4oqx+H2iH=Qmid8YG-gtZrCcK7n_B2g@mail.gmail.com>
In-Reply-To: <CAGt4E5tzxtCLaasW_Es4oqx+H2iH=Qmid8YG-gtZrCcK7n_B2g@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 9 Sep 2021 21:19:01 +0900
X-Gmail-Original-Message-ID: <CAK7LNASbE5=rMGCf6=Jr597okmZChy4t5sNt0O8Z9PACb=DsKg@mail.gmail.com>
Message-ID: <CAK7LNASbE5=rMGCf6=Jr597okmZChy4t5sNt0O8Z9PACb=DsKg@mail.gmail.com>
Subject: Re: Module build problems with gmake 3.x
To:     Markus Mayer <mmayer@broadcom.com>
Cc:     Kbuild Mailing List <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Sep 4, 2021 at 7:06 AM Markus Mayer <mmayer@broadcom.com> wrote:
>
> Hi,
>
> We are running into build issues with some external kernel modules if
> the GNUmake version is 3.x and the kernel is recent(-ish). The culprit
> seems to be the sub-make invocation when GNUmake < 4 is detected:
>     https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=688931a5ad4e
>
> The module build works fine for older kernels (those not containing
> this patch) even with GNUmake 3.81. And it works fine with GNUmake >=
> 4 with any kernel, even those with the above patch. In other words, if
> the sub-make invocation doesn't take place (either because make is new
> enough or because the kernel doesn't have the version check yet), our
> module build does work as intended.
>
> Due to how the build is integrated with other components, we need to
> be calling "make -e" to have environment variables take precedence,
> which seems to be another piece of the puzzle. The problem doesn't
> seem to be happening without "-e".
>
> The ingredients for our problem, therefore, seem to be:
>     * old GNUmake (<4)
>     * newish kernel  (>=5.1)
>     * run make -e
>
> I should also mention that the kernel module is being cross-compiled
> for ARM and ARM64, although that does not seem to be playing a role
> here. In my example below, I was using the native compiler.
>
> The problem we are observing is that the contents of $(M) and
> $(CFLAGS_MODULE) are lost during the extra sub-make invocation that is
> conditional upon GNUmake < 4. There might be other lost variables,
> too, but we haven't noticed any effects if there are.
>
> Losing $(M) causes the build to go off the rails completely. This is
> easily detected and can be worked around by setting $(KBUILD_EXTMOD)
> directly and foregoing $(M) on the command line altogether. The loss
> of $(CFLAGS_MODULE) is a little more insidious, since the build does
> succeed even when it's empty. However, required defines remain unset
> despite being set in the top-level makefile. The resulting kernel
> module doesn't work (which can lead to a lot of head scratching). I
> also don't know of a way of working around losing CFLAGS_MODULE's
> contents.


I sometimes test GNU make 3.81 for kernel builds, but I have not tested
the -e option.

Now I tested the -e option, and it worked for me.
Both $(M) and $(KBUILD_EXTMOD) were correctly set.

So, I did not observe anything you claim.



> I was able to reproduce the loss of $(M) quite easily doing something like this:
>
> obj-m += hello.o
>
> all:
>         ${MAKE} -C $(KERNEL_DIR) -e M=$(PWD) modules
>
> clean:
>         make -C $(KERNEL_DIR) M=$(PWD) clean





I ran this Makefile with GNU Make 3.81


masahiro@oscar:~/workspace/hello$ cat Makefile
obj-m += hello.o

KERNEL_DIR := $(HOME)/ref/linux

all:
        ${MAKE} -C $(KERNEL_DIR) -e M=$(PWD) modules

clean:
        make -C $(KERNEL_DIR) M=$(PWD) clean
masahiro@oscar:~/workspace/hello$ make-3.81 --version
GNU Make 3.81
Copyright (C) 2006  Free Software Foundation, Inc.
This is free software; see the source for copying conditions.
There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.

This program built for x86_64-unknown-linux-gnu
masahiro@oscar:~/workspace/hello$ make-3.81
make-3.81 -C /home/masahiro/ref/linux -e
M=/home/masahiro/workspace/hello modules
make-3.81[1]: Entering directory `/home/masahiro/ref/linux'
make-3.81[2]: Entering directory `/home/masahiro/ref/linux'
  CC [M]  /home/masahiro/workspace/hello/hello.o
  MODPOST /home/masahiro/workspace/hello/Module.symvers
  CC [M]  /home/masahiro/workspace/hello/hello.mod.o
  LD [M]  /home/masahiro/workspace/hello/hello.ko
make-3.81[2]: Leaving directory `/home/masahiro/ref/linux'
make-3.81[1]: Leaving directory `/home/masahiro/ref/linux'
masahiro@oscar:~/workspace/hello$ ls hello*
hello.c  hello.ko  hello.mod  hello.mod.c  hello.mod.o  hello.o





hello.ko was successfully built.


Entering/Leaving directory is eye-sores,
but presumably it is because MAKEFLAGS is overridden
by the environment since you gave -e.

I do not understand your motivation for using -e, though.






> Instead of building the out-of-tree hello.ko, which we are asking it
> to do, it'll go off and build all the in-kernel modules instead. Since
> it sees $(M) as empty, it just executes "make modules".
>
> Unfortunately, I have NOT been successful reproducing losing the
> contents of $(CFLAGS_MODULE) in a simple test environment. In my
> tests, it was always retained. Nonetheless, in the actual build
> environment, it does get lost. And only in the combination of new-ish
> kernel and old-ish make, i.e. whenever the sub-make invocation happens
> due to the make version.
>
> BTW, commenting out the make version test does make our module build
> work. So, it is definitely related to that code snippet. (Of course,
> building on a reasonably recent Linux distro also makes everything
> work, but that isn't possible for us in all circumstances.)
>
> Do you have any thoughts on this or any pointers? Is there a way this
> issue could be resolved? It does seem like the version check has some
> unintended side-effects, even if the scenario in which one would come
> across them is fairly uncommon and most developers will never
> experience them.
>
> I am willing to try out any suggestions or provide further information
> if needed.
>
> Regards,
> -Markus



-- 
Best Regards
Masahiro Yamada
