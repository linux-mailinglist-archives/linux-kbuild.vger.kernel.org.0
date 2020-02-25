Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36B1C16BC00
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Feb 2020 09:41:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729832AbgBYIlY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 25 Feb 2020 03:41:24 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:43628 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729493AbgBYIlY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Feb 2020 03:41:24 -0500
Received: by mail-ed1-f66.google.com with SMTP id dc19so15276267edb.10
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Feb 2020 00:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1mfyfYOxmHrk+OYgrhb9g87jdeP8stWF7POxUJoC6i8=;
        b=ZZgaMXbTA8QScsJvz3/7TKVtHpKLKB5SFREOOU7Atbs9aZt7AFW+ws71Mw5x5q8vW8
         T3i0Q0tsQszD9IftpDVvOoO7hj4fTRDw19yKIEmAQfmxlWrNU68NJKafb6amo54oEVWD
         CHvz3Lz/Emh3w2vtDhNwUMxR3oA0x34PzK2BAZh75nStVL/NsCX6hQll9MGNoXRS7tCX
         navInTiZFuUEWV+H+Sch50KY3dPVdKDe5Ro43jRM6TsETCTGsZnVK5e5w3y6mIVoiK2l
         QxU8qD5auC7a5qPFaHBs2O2/UlmTZpZkV6b55lJ7p3EI70YFnRnmfbKNt5g5JcFOmta3
         KcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1mfyfYOxmHrk+OYgrhb9g87jdeP8stWF7POxUJoC6i8=;
        b=GoYZJYZIAK/WGBx0gdNA7ypyF46Eg1QlgQfmXmMI9mQ+RktF4rxmeqnl6J2WsVZloe
         W12Y1xRT8+CG2ERe5Pc6oXcYHHKwVWg44lMqa2EkVqDjsWUjCrnLkJ6mHg02RcfbAKHj
         DQwPEhJJiAQ0ljfaJynShGrvpD4hXob64VWdFt674I5mZM8ihU/+t9CS3BYJP2jt7OYP
         AG8hchjgxxrDF5RsbowqjmxhVZnfUTUVVqNYoQY362miyEKRpTvCWpTTWDzVyNAcmPFh
         JQ870/NRQdF2n+UBLbg6awKKZP2/963NsY0EvL0Oww4ebXK2gBC6ZfRx6PSqMKqdDp7r
         kmzg==
X-Gm-Message-State: APjAAAUVOgnaMiJaFKIUSt3ueoyvRcyfipQgSzQUSKZAWGBkyKPLm4nT
        djwVmNEoXafyl2x2BPRgUJCh6bbNTIWcXVUY2CM=
X-Google-Smtp-Source: APXvYqyQuX1rDObfgshPtOEet+E0uyG/z2q/iovy8vUc6bmE1cDQ/Fs4Sp1f4B+MPVamNC6tIiQO8An9IvZpp8MYATs=
X-Received: by 2002:a05:6402:13c6:: with SMTP id a6mr49021476edx.67.1582620081215;
 Tue, 25 Feb 2020 00:41:21 -0800 (PST)
MIME-Version: 1.0
References: <CAGRSmLshZwKYEj=Mv3WfDh4=ihJf4r0naG_iKBtgR7CEqBCeEw@mail.gmail.com>
 <CAK7LNATyfWCso7XGjYpdc+h6rqoAZ399csr2ftK8-1+kQfJMkg@mail.gmail.com>
In-Reply-To: <CAK7LNATyfWCso7XGjYpdc+h6rqoAZ399csr2ftK8-1+kQfJMkg@mail.gmail.com>
From:   "David F." <df7729@gmail.com>
Date:   Tue, 25 Feb 2020 00:41:10 -0800
Message-ID: <CAGRSmLv+7T8D1dSKO0r7vjzXrwwa+rnb3MZTSsysayKMHuGtgg@mail.gmail.com>
Subject: Re: Moving from 4.x to 5.4.22 breaks custom module build.
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I applied your patch and everything worked.  Completed my project in
30 seconds after I already wasted hours earlier today.  Thanks!!!!

On Mon, Feb 24, 2020 at 6:57 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Tue, Feb 25, 2020 at 7:02 AM David F. <df7729@gmail.com> wrote:
> >
> > Hi,
> >
> > I have a private custom module I build via various scripts since I
> > setup since I knew I'd have no clue how to do it in the future.  It's
> > been working great for years, but now it's broken with the move from
> > 4.19.xx to 5.4.22 so the future is here and don't remember much about
> > how I set it all up.  But it does look to me that the failure has to
> > do with a support library I have it build.  Can the kbuild experts
> > tell me what changed with V5 from V4.19 that breaks building my custom
> > module.
> >
> > Thanks!!
> >
> > Here's the information (I'm writing this in Windows so my dir output
> > will be from windows):
> >
> > The input/source files:
> >
> > 01/25/2016  06:52 PM             1,501 linuxdriverc.c
> > 01/24/2016  06:59 PM               284 linuxdrivercpp.cpp
> > 01/22/2016  07:20 PM             1,124 linuxdriverdumpbuf.c
> > 09/22/2019  12:17 AM             4,985 linuxdriverfile.c
> > 01/22/2016  07:20 PM             2,142 linuxdriverprintk.c
> >
> > When the 4.x version (this was 4.19.97) finishes the dir contains:
> >
> > 01/22/2020  12:43 AM               338 .junk.ko.cmd
> > 01/22/2020  12:43 AM            29,743 .junk.mod.o.cmd
> > 01/22/2020  12:43 AM               220 .junk.o.cmd
> > 01/22/2020  12:43 AM               581 .lib.a.cmd
> > 01/22/2020  12:43 AM            29,795 .linuxdriverc.o.cmd
> > 01/22/2020  12:43 AM            30,248 .linuxdriverdumpbuf.o.cmd
> > 01/22/2020  12:43 AM            36,098 .linuxdriverfile.o.cmd
> > 01/22/2020  12:43 AM            30,235 .linuxdriverprintk.o.cmd
> > 01/22/2020  12:43 AM             1,908 junk.ko
> > 01/22/2020  12:43 AM               650 junk.mod.c
> > 01/22/2020  12:43 AM             1,792 junk.mod.o
> > 01/22/2020  12:43 AM               260 junk.o
> > 01/22/2020  12:43 AM             1,084 lib.a
> > 01/22/2020  12:43 AM                29 linuxdriverc.c
> > 01/22/2020  12:43 AM             1,040 linuxdriverc.o
> > 01/22/2020  12:43 AM                33 linuxdrivercpp.cpp
> > 01/22/2020  12:43 AM               976 linuxdrivercpp.o
> > 01/22/2020  12:43 AM                35 linuxdriverdumpbuf.c
> > 01/22/2020  12:43 AM             1,320 linuxdriverdumpbuf.o
> > 01/22/2020  12:43 AM                32 linuxdriverfile.c
> > 01/22/2020  12:43 AM             1,448 linuxdriverfile.o
> > 01/22/2020  12:43 AM                34 linuxdriverprintk.c
> > 01/22/2020  12:43 AM             1,564 linuxdriverprintk.o
> > 01/22/2020  12:43 AM             1,084 linuxdriversup.a
> > 01/26/2016  05:16 PM             2,188 Makefile
> > 01/22/2020  12:43 AM                 0 Module.symvers
> > 01/22/2020  12:43 AM                71 modules.order
> >
> > For the 5.4.22 the files are:
> >
> > 02/24/2020  12:04 PM               573 .lib.a.cmd
> > 02/24/2020  12:04 PM            30,740 .linuxdriverc.o.cmd
> > 02/24/2020  12:04 PM            31,278 .linuxdriverdumpbuf.o.cmd
> > 02/24/2020  12:04 PM            37,708 .linuxdriverfile.o.cmd
> > 02/24/2020  12:04 PM            31,265 .linuxdriverprintk.o.cmd
> > 02/24/2020  12:04 PM             1,080 lib.a
> > 01/25/2016  06:52 PM                29 linuxdriverc.c
> > 02/24/2020  12:04 PM             1,040 linuxdriverc.o
> > 01/24/2016  06:59 PM                33 linuxdrivercpp.cpp
> > 02/24/2020  12:04 PM               976 linuxdrivercpp.o
> > 01/22/2016  07:20 PM                35 linuxdriverdumpbuf.c
> > 02/24/2020  12:04 PM             1,320 linuxdriverdumpbuf.o
> > 09/22/2019  12:17 AM                32 linuxdriverfile.c
> > 02/24/2020  12:04 PM             1,448 linuxdriverfile.o
> > 01/22/2016  07:20 PM                34 linuxdriverprintk.c
> > 02/24/2020  12:04 PM             1,564 linuxdriverprintk.o
> > 01/26/2016  05:16 PM             2,188 Makefile
> >
> > There are no error messages other than it can't find junk.o for LD:
> >
> > Starting KBuild make...
> > make[3]: Entering directory '/usr/src/linux-headers-5.4.22-686-iflnet'
> >   LD [M]  /media/sf_SRC_DRIVE/libs/linux_drivers/5.4.22-686-iflnet/junk.o
> > ld: no input files
> > scripts/Makefile.build:446: recipe for target
> > '/media/sf_SRC_DRIVE/libs/linux_drivers/5.4.22-686-iflnet/junk.o'
> > failed
> > make[4]: *** [/media/sf_SRC_DRIVE/libs/linux_drivers/5.4.22-686-iflnet/junk.o]
> > Error 1
> > Makefile:1652: recipe for target
> > '/media/sf_SRC_DRIVE/libs/linux_drivers/5.4.22-686-iflnet' failed
> > make[3]: *** [/media/sf_SRC_DRIVE/libs/linux_drivers/5.4.22-686-iflnet] Error 2
> > make[3]: Leaving directory '/usr/src/linux-headers-5.4.22-686-iflnet'
> >
> >
> > The makefile used is:
> >
> > # You should only need to change the items marked ** fill in **
> > # everything else should be automatic.
> >
> > # the version of the kernel the module is being compiled for
> > KVER?=$(shell uname -r)
> > # the directory of the kernel build system
> > KDIR:=/lib/modules/$(KVER)/build
> > # fill in the verbose level you want
> > V:=0
> >
> > #################################
> > # fill in the name of the module    ** fill in **
> > #################################
> > mymodlib_name:=linuxdriversup
> >
> > #################################
> > # unique cpp build flags            ** fill in **
> > #################################
> > # CC_FLAGS+=-I.
> >
> > # flags file for building CPP versions
> > FLAGS:=/media/sf_SRC_DRIVE/libs/linux_drivers/buildopts/$(KVER)/buildopts.cfg
> >
> > #################################
> > # extra C flags to use                ** fill in **
> > #################################
> > EXTRA_CFLAGS+=-I.
> > #EXTRA_CFLAGS+=-Werror
> > #EXTRA_CFLAGS += -std=gnu99
> > #EXTRA_CFLAGS += -Wno-declaration-after-statement
> >
> > ##############
> > # code start #
> > ##############
> > ifeq ($(V),1)
> > Q=
> > else
> > Q=@
> > endif
> >
> > # this was the only way I figured out how to get the
> > # kbuild envrionment to build the library for me.  the
> > # cpp item doesn't really need to be built in this
> > # envrionment but we do it since it works.
> >
> > # Setup module name for kbuild
> > obj-m:=junk.o
> > junk-objs:=lib.a
>
>
> Perhaps, this line is the cause of the failure.
>
> Kbuild does not support linking *.a to a module.
>
> There exists a workaround patch, but it was rejected.
> https://patchwork.kernel.org/patch/11318691/#23088533
>
>
>
> Masahiro Yamada
>
>
> >
> > # build sources in the target directory
> > SOURCES_ALL:=$(filter-out %.mod.c,$(shell find $(M) -maxdepth 1 -name
> > "*.cpp" -or -name "*.c"))
> >
> > # add the sources and to the kbuild
> > lib-y+=$(addsuffix .o,$(notdir $(basename $(SOURCES_ALL))))
> >
> >
> > # pattern for compiling the c++ parts
> > %.o: %.cpp $(FLAGS)
> >     $(info doing [$@])
> >     $(Q)g++ `cat $(FLAGS)` $(CC_FLAGS) -fno-exceptions -fno-rtti -Wall
> > -c -o $@ $<
> >
> > .PHONY: all
> > all:
> >     $(Q)echo Run make from main directory
> >
> > .PHONY: renamelib
> > renamelib:
> > #    the -p is not working to preserve timestamps but touch works
> >     @cp -p lib.a $(mymodlib_name).a ; \
> >     touch -r lib.a $(mymodlib_name).a; \
> >     rm -fr .tmp_versions
> > #    rm -f junk.* .*.cmd ; removing either of these trigger full build
> >
> >
> > .PHONY: clean
> > clean:
> >     # note this deletes .a .o etc files in subdirs too!
> >     $(Q)$(MAKE) -C $(KDIR) M=$(CURDIR) V=$(V) clean
>
>
>
> --
> Best Regards
> Masahiro Yamada
