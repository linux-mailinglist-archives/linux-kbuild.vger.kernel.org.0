Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3339216BA7B
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Feb 2020 08:18:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbgBYHRr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 25 Feb 2020 02:17:47 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:41288 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbgBYHRr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Feb 2020 02:17:47 -0500
Received: by mail-ed1-f66.google.com with SMTP id c26so15056346eds.8
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Feb 2020 23:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c5nEnDVDR6pYCapociPclkbOTjM+Ed7I155p9otDygE=;
        b=ee5OgUwocNH8xlS4bRWGYv6pe25BS25vRDrAMfBvO5zyOw326huMhhX6UpiGc2ia3H
         sOttVRnRn7HeQYGT1pkJvxOyiTyEjwfs8DTpRItQZ4w86aweA2jWsEvV80MdRpM/5/12
         0eb33OTceRuHUFXzgFSDaV8au7EQo8PcEZiqVwICkLRNHEiz/05M9Wkz327YreHf6KUe
         CP/Z5DhTS/hiWgSITtkBQA99C8yMZEPGM6sXVIjVnEBbaLtjta1Avmxjs4lgQftcW+2T
         RN4rTxTe3cU+EBnHNri6c5zqbfzcrFu4wtj4OpYhcc7tFNXfDbdmG89ZQFs5sYacfhq/
         88UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c5nEnDVDR6pYCapociPclkbOTjM+Ed7I155p9otDygE=;
        b=NBqNO7JIiYWQb3fZOJWG4l9lzt07MgF63DW+oA4kIzrxcv/TBlfKH43F+kxPHn2V2i
         7lGgKSTIUcUCAZ58bfqdv8DqMlgkBRopV6oWV8wD08y6eWp5X5/PFvfjC5CRcPIFvJVF
         kGJb2IkiGzCcdyh872c1Vc2lTT1nm22na064IuvRR9k6soPKfBCV7S1oqG2uU2NLEnbX
         uEQ+vRGCAB0sXOJTtjkJc2ocGlo9DYIDC/1EE8a/pqtnjC3/WAswMQybZTLWU9ZEKlgx
         JSpkQadC0wuU49mSowQfKXh4ahg28/abo6OVVtLOQ2WWsSG1lxxopyabUnDJ5vvgQap9
         p7Tw==
X-Gm-Message-State: APjAAAU8bdM6j2iQb9KkEq3IAl/VK+zypmUA7QkNGlu3qt7vt3CmHSUn
        JzltyseIyFSkZKRtyH+EavVoYqx4qSZhXg1kiXk=
X-Google-Smtp-Source: APXvYqyjU6dgFeWw1AgI7dnFDGxb7GDIiU46l1dMR3xG2FgJ5swOUeBGkdfbYxMJ7OR9xWWsUPL2aki7nd9/k2PG3oU=
X-Received: by 2002:a17:906:648d:: with SMTP id e13mr51578523ejm.73.1582615064807;
 Mon, 24 Feb 2020 23:17:44 -0800 (PST)
MIME-Version: 1.0
References: <CAGRSmLshZwKYEj=Mv3WfDh4=ihJf4r0naG_iKBtgR7CEqBCeEw@mail.gmail.com>
 <CAK7LNATyfWCso7XGjYpdc+h6rqoAZ399csr2ftK8-1+kQfJMkg@mail.gmail.com>
In-Reply-To: <CAK7LNATyfWCso7XGjYpdc+h6rqoAZ399csr2ftK8-1+kQfJMkg@mail.gmail.com>
From:   "David F." <df7729@gmail.com>
Date:   Mon, 24 Feb 2020 23:17:33 -0800
Message-ID: <CAGRSmLvEuUD0p9o3kCHfimFkEoaN3druk4HGy6Wr7LVXwtjFNA@mail.gmail.com>
Subject: Re: Moving from 4.x to 5.4.22 breaks custom module build.
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Unreal, you mean someone broke it?  On that particular build, if I
take out the obj-m reference it seems to work, but I was back here
because now my driver itself has link failures.  The driver has about
12 libraries amounting to 100's modules and 10's if not 100's of
thousands of lines of code.  Some are specific to driver support (that
build in the start of this thread), others are just built for several
environments, from Windows Drivers, Linux Drivers, BIOS, UEFI, etc..
From encryption, compression, complex data handling, etc.. The driver
requires all that, no way I could just try to include the source
somehow.  I'll look at the patch and if I want to move to this broken
V5 version or just stick with 4.x forever (I already tried moving a
block driver over to blk-mq, one I'm trying to build now to test, that
was a surprise too, broken because old method taken out, not sure if I
should still queue requests to my worker thread or now that is done
for me?).

Thanks for feedback.

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
