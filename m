Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C99ED407E65
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 Sep 2021 18:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231528AbhILQFn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 12 Sep 2021 12:05:43 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:63460 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230483AbhILQFn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 12 Sep 2021 12:05:43 -0400
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 18CG48JP017551
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Sep 2021 01:04:09 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 18CG48JP017551
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1631462649;
        bh=7lTNfESTwV9T8+jquENYoRsKxMDFmZbJz23YsayjXJ4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Y3fz2bFSE++XgjBeP28lTWcMflQJ2BAzGda3pPF7AaWDw7EKLQR42U8g8e6CIBBnk
         4PFRFxnVk84Ot5uy1/aZTZKElsY+frLSE8MxiH94C7K/3zWXAV9reaSZGoJHrFtE5U
         5ZrdkOLQX0bxlcn89hXjmmnJeOcuV7cDmY2CHBJ5DYVFVuUvnXKmjKEu47/Ji9IC1Y
         oHVwtZX84f0IbVJL4Gqg54GWSsTrd688RZ699DZ+n+hoDJeaG8Sm7Wh8J1dU7D6Db9
         PduCWzSixcP/Tx5bJFnf2O4zq2Qe8+NSfn4ILo+Tzz0vMOJhZVJzgoTOYQcmfW1pig
         YK1bwkF5HOVmA==
X-Nifty-SrcIP: [209.85.210.172]
Received: by mail-pf1-f172.google.com with SMTP id f65so6550098pfb.10
        for <linux-kbuild@vger.kernel.org>; Sun, 12 Sep 2021 09:04:09 -0700 (PDT)
X-Gm-Message-State: AOAM531HgK7g+AyfIPZxxorI3OZmgOSab/Ix0K9RD2ebck+ErQuI2V6G
        yFQmLmLZYVlZlwKcP1UtdP8EjqFoDeoxwk06U+o=
X-Google-Smtp-Source: ABdhPJw7Hwm42sf4OswAFIsSYVArniOO3yjpcHZ8heUiT2NbM4o/D9TedDmhN2RSUaZ2u89NCcs/Q+WALZpAr94picc=
X-Received: by 2002:a63:9313:: with SMTP id b19mr7222394pge.128.1631462648318;
 Sun, 12 Sep 2021 09:04:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAGt4E5tzxtCLaasW_Es4oqx+H2iH=Qmid8YG-gtZrCcK7n_B2g@mail.gmail.com>
 <CAK7LNASbE5=rMGCf6=Jr597okmZChy4t5sNt0O8Z9PACb=DsKg@mail.gmail.com> <CAGt4E5u3YAM16HgoRAbW3Zs3LVJWKosCzp0rDqvQfmzZeXz2nA@mail.gmail.com>
In-Reply-To: <CAGt4E5u3YAM16HgoRAbW3Zs3LVJWKosCzp0rDqvQfmzZeXz2nA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 13 Sep 2021 01:03:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNATTwCuR=4a0MWzW4j1O1DMwayePKCL9KDe+UBUz1Aqmag@mail.gmail.com>
Message-ID: <CAK7LNATTwCuR=4a0MWzW4j1O1DMwayePKCL9KDe+UBUz1Aqmag@mail.gmail.com>
Subject: Re: Module build problems with gmake 3.x
To:     Markus Mayer <mmayer@broadcom.com>
Cc:     Kbuild Mailing List <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Sep 11, 2021 at 7:45 AM Markus Mayer <mmayer@broadcom.com> wrote:
>
> On Thu, 9 Sept 2021 at 05:20, Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > I sometimes test GNU make 3.81 for kernel builds, but I have not tested
> > the -e option.
> >
> > Now I tested the -e option, and it worked for me.
> > Both $(M) and $(KBUILD_EXTMOD) were correctly set.
> >
> > So, I did not observe anything you claim.
>
> Thanks for trying it out. See below for a summary of my test comparing
> GNUmake 3.81 and 4.1. All the tests have been performed on Ubuntu
> 14.04. (Yes, I know that's old.)
>
> > I ran this Makefile with GNU Make 3.81
> >
> > masahiro@oscar:~/workspace/hello$ cat Makefile
> > obj-m += hello.o
> >
> > KERNEL_DIR := $(HOME)/ref/linux
> >
> > all:
> >         ${MAKE} -C $(KERNEL_DIR) -e M=$(PWD) modules
> >
> > clean:
> >         make -C $(KERNEL_DIR) M=$(PWD) clean
> > masahiro@oscar:~/workspace/hello$ make-3.81 --version
> > GNU Make 3.81
> > Copyright (C) 2006  Free Software Foundation, Inc.
> > This is free software; see the source for copying conditions.
> > There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
> > PARTICULAR PURPOSE.
> >
> > This program built for x86_64-unknown-linux-gnu
> > masahiro@oscar:~/workspace/hello$ make-3.81
> > make-3.81 -C /home/masahiro/ref/linux -e
> > M=/home/masahiro/workspace/hello modules
> > make-3.81[1]: Entering directory `/home/masahiro/ref/linux'
> > make-3.81[2]: Entering directory `/home/masahiro/ref/linux'
> >   CC [M]  /home/masahiro/workspace/hello/hello.o
> >   MODPOST /home/masahiro/workspace/hello/Module.symvers
> >   CC [M]  /home/masahiro/workspace/hello/hello.mod.o
> >   LD [M]  /home/masahiro/workspace/hello/hello.ko
> > make-3.81[2]: Leaving directory `/home/masahiro/ref/linux'
> > make-3.81[1]: Leaving directory `/home/masahiro/ref/linux'
> > masahiro@oscar:~/workspace/hello$ ls hello*
> > hello.c  hello.ko  hello.mod  hello.mod.c  hello.mod.o  hello.o
> >
> > hello.ko was successfully built.
> >
> > Entering/Leaving directory is eye-sores,
> > but presumably it is because MAKEFLAGS is overridden
> > by the environment since you gave -e.
>
> Here is what I have.
>
> $ cat Makefile
>
> export KERNEL_DIR = /local/users/mmayer/linux-5.4


From this line, I understand how to reproduce the case.

The key is 'linux-5.4'

In your initial email, you mentioned that this happened on

  * newish kernel  (>=5.1)


So, I used the latest kernel for testing,
but this does not happen after
bcf637f54f6d2515d4c9c81808faf01848916152
because the M= parameter is parsed before the sub-make.


By running your test code on linux 5.4, yes,
I can observe the same symptom.




The root case seams, GNU Make changes
the origin of variables to 'environment'.
I do not know if it is an intended behavior.
(maybe, better to ask the GNU Make maintainer)



I narrowed it down to the following test code.
To me, the behavior is weird.



masahiro@oscar:~/workspace/foo$ cat Makefile
$(warning the origin of FOO is: $(origin FOO))

all:
        $(MAKE) -e -f Makefile.sub1 FOO=1
masahiro@oscar:~/workspace/foo$ cat Makefile.sub1
$(warning the origin of FOO is: $(origin FOO))

all:
        $(MAKE) -f Makefile.sub2
masahiro@oscar:~/workspace/foo$ cat Makefile.sub2
$(warning the origin of FOO is: $(origin FOO))

all:
        @:
masahiro@oscar:~/workspace/foo$ make
Makefile:1: the origin of FOO is: undefined
make -e -f Makefile.sub1 FOO=1
make[1]: Entering directory '/home/masahiro/workspace/foo'
Makefile.sub1:1: the origin of FOO is: command line
make -f Makefile.sub2
make[2]: Entering directory '/home/masahiro/workspace/foo'
Makefile.sub2:1: the origin of FOO is: environment
make[2]: Leaving directory '/home/masahiro/workspace/foo'
make[1]: Leaving directory '/home/masahiro/workspace/foo'






So, this is what your can tell:

- The behavior of the -e option seems to have a weird
    side-effect.
    Later, I will ask this to the GNU Make maintainer
    to see whether it is a bug or not.

- I do not want to support the -e option.  I do not think
  it is a commonly-used option because you are the
  first person who asked this since Linux 5.4.
  (notice Linux 5.4 is almost two years old)

 - If you use the latest kernel
    (after bcf637f54f6d251), you will be able to build
    external modules with the -e option.
    But, I recommend you to not use -e.

 - If you still insist on the -e option on Linux 5.4,
    you can cherry-pick bcf637f54f6d251
    (but it is out of scope of the support of the community)




>
> > I do not understand your motivation for using -e, though.
>
> I am not entirely clear on that either, but I have been told it is
> needed in that particular build environment.


Maybe, better to consider removing the -e option.






-- 
Best Regards
Masahiro Yamada
