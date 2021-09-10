Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79A60407380
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Sep 2021 00:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231225AbhIJWrK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 10 Sep 2021 18:47:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230210AbhIJWrK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 Sep 2021 18:47:10 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A146CC061574
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Sep 2021 15:45:58 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id r21so2927389qtw.11
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Sep 2021 15:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9f7YCxsODZn1lAYw0wtWG47p45SP2ib8crRZQ5ppilk=;
        b=A9HU5PsaDywHPHOS9+Q1UaWtkU8kNWU4UDctNQFAgGqFlJ5srUlEtpeKvw13Vr3Z3s
         r1r+N9D8bf5WEcQOVyQ4jJQ0CbYH28cIaXtqHZschq3lqxGR9f4TpUwr2KFURzuyXPVw
         4p/IPYy6AwLFoaZfX+Bk3J7MGaAGRZWuNgigU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9f7YCxsODZn1lAYw0wtWG47p45SP2ib8crRZQ5ppilk=;
        b=HvTrhIvoiRBs61rFepi855Nu4x84Er3ZmHAgkDX19RFBGAh19xgoRhPtqIUzKiQ9Wv
         vAz5wEVCwRiL++14x0nyhO7E87AmH1IR73hW2Gh65edcoJA3Y2ZDYG3eA5/cYGpjH03k
         47htiZqrx9B15/eqyG2uWXJWMPwS33jiaTa/BszDjXeTChMD8JrE3RWRh19mwUIOjssn
         w9fQtlgcvbXJQMZ18RqW1cHujDarjN4fveZS+HByz0SuBdboiAPoD0Nl27aOL32/QYbw
         ctKSX9DHySvNWy7QS29IGPmmmSfUslGhvRTayXQSEcdlbjhBepe9G7ai1jRmz4M+PbBP
         8qZg==
X-Gm-Message-State: AOAM533/wUGBAqmqBXarnZyFGDV8YqrHdNm+4azXju5mJBo2bqztyPcJ
        B8lJ+v3fE58CxjnNw1oeNPnZGv4bPFP+p+Lwn9WuGvzBcKuzefPH
X-Google-Smtp-Source: ABdhPJxWi3RPpFRoj1/o7IWteh804uz4F3KY3ySwr6kWRvP9K5qE1r3elwcglSTftEd3nHBFW8wGiwf0QZ+HoGm/RJI=
X-Received: by 2002:ac8:4253:: with SMTP id r19mr10304252qtm.317.1631313957527;
 Fri, 10 Sep 2021 15:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAGt4E5tzxtCLaasW_Es4oqx+H2iH=Qmid8YG-gtZrCcK7n_B2g@mail.gmail.com>
 <CAK7LNASbE5=rMGCf6=Jr597okmZChy4t5sNt0O8Z9PACb=DsKg@mail.gmail.com>
In-Reply-To: <CAK7LNASbE5=rMGCf6=Jr597okmZChy4t5sNt0O8Z9PACb=DsKg@mail.gmail.com>
From:   Markus Mayer <mmayer@broadcom.com>
Date:   Fri, 10 Sep 2021 15:45:47 -0700
Message-ID: <CAGt4E5u3YAM16HgoRAbW3Zs3LVJWKosCzp0rDqvQfmzZeXz2nA@mail.gmail.com>
Subject: Re: Module build problems with gmake 3.x
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Kbuild Mailing List <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 9 Sept 2021 at 05:20, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> I sometimes test GNU make 3.81 for kernel builds, but I have not tested
> the -e option.
>
> Now I tested the -e option, and it worked for me.
> Both $(M) and $(KBUILD_EXTMOD) were correctly set.
>
> So, I did not observe anything you claim.

Thanks for trying it out. See below for a summary of my test comparing
GNUmake 3.81 and 4.1. All the tests have been performed on Ubuntu
14.04. (Yes, I know that's old.)

> I ran this Makefile with GNU Make 3.81
>
> masahiro@oscar:~/workspace/hello$ cat Makefile
> obj-m += hello.o
>
> KERNEL_DIR := $(HOME)/ref/linux
>
> all:
>         ${MAKE} -C $(KERNEL_DIR) -e M=$(PWD) modules
>
> clean:
>         make -C $(KERNEL_DIR) M=$(PWD) clean
> masahiro@oscar:~/workspace/hello$ make-3.81 --version
> GNU Make 3.81
> Copyright (C) 2006  Free Software Foundation, Inc.
> This is free software; see the source for copying conditions.
> There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
> PARTICULAR PURPOSE.
>
> This program built for x86_64-unknown-linux-gnu
> masahiro@oscar:~/workspace/hello$ make-3.81
> make-3.81 -C /home/masahiro/ref/linux -e
> M=/home/masahiro/workspace/hello modules
> make-3.81[1]: Entering directory `/home/masahiro/ref/linux'
> make-3.81[2]: Entering directory `/home/masahiro/ref/linux'
>   CC [M]  /home/masahiro/workspace/hello/hello.o
>   MODPOST /home/masahiro/workspace/hello/Module.symvers
>   CC [M]  /home/masahiro/workspace/hello/hello.mod.o
>   LD [M]  /home/masahiro/workspace/hello/hello.ko
> make-3.81[2]: Leaving directory `/home/masahiro/ref/linux'
> make-3.81[1]: Leaving directory `/home/masahiro/ref/linux'
> masahiro@oscar:~/workspace/hello$ ls hello*
> hello.c  hello.ko  hello.mod  hello.mod.c  hello.mod.o  hello.o
>
> hello.ko was successfully built.
>
> Entering/Leaving directory is eye-sores,
> but presumably it is because MAKEFLAGS is overridden
> by the environment since you gave -e.

Here is what I have.

$ cat Makefile

export KERNEL_DIR = /local/users/mmayer/linux-5.4
export CFLAGS_MODULE = -DGREETING_NAME='"Linux"'

obj-m += hello-1.o

all:
    ${MAKE} -C $(KERNEL_DIR) -e -r M=$(PWD) modules

clean:
    make -C $(KERNEL_DIR) M=$(PWD) clean

$ cat hello-1.c
/*
 *  hello-1.c - The simplest kernel module.
 */
#include <linux/module.h> /* Needed by all modules */
#include <linux/kernel.h> /* Needed for KERN_INFO */

int init_module(void)
{
    printk(KERN_INFO "Hello " GREETING_NAME ".\n");
    return 0;
}

void cleanup_module(void)
{
    printk(KERN_INFO "Goodbye " GREETING_NAME ".\n");
}

MODULE_LICENSE("GPL");

Now, if I run make 3.81, this happens. Please note that I added some
extra output to the top-level Linux Makefile, which is where some of
the extra output is coming from.

$ make --version
GNU Make 3.81
Copyright (C) 2006  Free Software Foundation, Inc.
This is free software; see the source for copying conditions.
There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.

This program built for x86_64-pc-linux-gnu

$ make
hello: CFLAGS_MODULE=-DGREETING_NAME='"Linux"'
hello: KBUILD_EXTMOD=
make -C /local/users/mmayer/linux-5.4 -e -r M=/local/users/mmayer/hello modules
need-sub-make
make[1]: Entering directory `/local/users/mmayer/linux-5.4'
1) CFLAGS_MODULE=-DGREETING_NAME='Linux'
KBUILD_CFLAGS_MODULE=
CFLAGS_MODULE[make]=-DGREETING_NAME='Linux'
CFLAGS_MODULE[env]=-DGREETING_NAME='"Linux"'
Invoking sub-make...
abs_srctree=/local/users/mmayer/linux-5.4
MAKECMDGOALS=modules
make -C /local/users/mmayer/linux-5.4 -f
/local/users/mmayer/linux-5.4/Makefile modules
make[2]: Entering directory `/local/users/mmayer/linux-5.4'
KBUILD_CFLAGS_MODULE=-DMODULE
CFLAGS_MODULE=
KBUILD_CFLAGS_MODULE=-DMODULE
CFLAGS_MODULE=
KBUILD_CFLAGS_MODULE=-DMODULE
CFLAGS_MODULE=
  CALL    scripts/checksyscalls.sh
  CALL    scripts/atomic/check-atomics.sh
warning: Cannot use CONFIG_STACK_VALIDATION=y, please install
libelf-dev, libelf-devel or elfutils-libelf-devel
2) KBUILD_CFLAGS_MODULE=-DMODULE
2) CFLAGS_MODULE=
build=-f ./scripts/Makefile.build obj, @=init
2) KBUILD_CFLAGS_MODULE=-DMODULE
2) CFLAGS_MODULE=
build=-f ./scripts/Makefile.build obj, @=usr
2) KBUILD_CFLAGS_MODULE=-DMODULE
2) CFLAGS_MODULE=
build=-f ./scripts/Makefile.build obj, @=arch/x86
[...]

As you can see, it doesn't pass the value of $(M). Instead, it is
running "make modules" because it sees $(M) as empty.

If I use make 4.1, it works, even though nothing has changed except
for "make" itself.

$ ../make-4.2.1/make --version
GNU Make 4.2.1
Built for x86_64-pc-linux-gnu
Copyright (C) 1988-2016 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

$ ../make-4.2.1/make
hello: CFLAGS_MODULE=-DGREETING_NAME='"Linux"'
hello: KBUILD_EXTMOD=
M=/local/users/mmayer/hello modules
/local/users/mmayer/hello/../make-4.2.1/make -C
/local/users/mmayer/linux-5.4 -e -r M=/local/users/mmayer/hello
modules
make[1]: Entering directory '/local/users/mmayer/linux-5.4'
KBUILD_CFLAGS_MODULE=-DMODULE
CFLAGS_MODULE[make]=-DGREETING_NAME='Linux'
CFLAGS_MODULE[env]=-DGREETING_NAME='"Linux"'
2) KBUILD_CFLAGS_MODULE=-DMODULE
2) CFLAGS_MODULE=-DGREETING_NAME='Linux'
build=-f ./scripts/Makefile.build obj, @=/local/users/mmayer/hello
make[2]: Entering directory '/local/users/mmayer/linux-5.4'
hello: CFLAGS_MODULE=-DGREETING_NAME='"Linux"'
hello: KBUILD_EXTMOD=/local/users/mmayer/hello
  CC [M]  /local/users/mmayer/hello/hello-1.o
make[2]: Leaving directory '/local/users/mmayer/linux-5.4'
make[2]: Entering directory '/local/users/mmayer/linux-5.4'
hello: CFLAGS_MODULE=-DGREETING_NAME='"Linux"'
hello: KBUILD_EXTMOD=/local/users/mmayer/hello
  Building modules, stage 2.
  MODPOST 1 modules
make[3]: Entering directory '/local/users/mmayer/linux-5.4'
  CC [M]  /local/users/mmayer/hello/hello-1.mod.o
  LD [M]  /local/users/mmayer/hello/hello-1.ko
make[3]: Leaving directory '/local/users/mmayer/linux-5.4'
make[2]: Leaving directory '/local/users/mmayer/linux-5.4'
make[1]: Leaving directory '/local/users/mmayer/linux-5.4'

$ lsb_release -d
Description: Ubuntu 14.04.5 LTS

> I do not understand your motivation for using -e, though.

I am not entirely clear on that either, but I have been told it is
needed in that particular build environment.

Regards,
-Markus
