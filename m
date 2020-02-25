Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFA616B7DB
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Feb 2020 03:57:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727696AbgBYC5t (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 24 Feb 2020 21:57:49 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:33586 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726962AbgBYC5t (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Feb 2020 21:57:49 -0500
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 01P2vaLV008301
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Feb 2020 11:57:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 01P2vaLV008301
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582599457;
        bh=D6/axy6RrhrnA4ZAO2a1CgZDsXxfvWu4ivko8VlMXwo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=U1mI7T8fekii7pu2BoxpyYokCHzJhw/mIkKR9JcuFpmTexN1Pb+NeRFDUTi89NdW6
         GxkLWcYS/X+TO9Caqepjvj48JoxZpOJD7tx2S49cDk9lhKlm5I3XJ3I3hMkzSqIrYK
         rpiJIdXD4ps/0JuA2el4SOT+sBJ8u7rO4NJxpXFvVNkqbRPtXKwBUH4wUk6TMJ7tde
         YBOcO7FkHxifhKiEGguOoCdpgVU1dJLoLEPGwbpJ58R7ACYXNk5UwqFOtncS2jJOJf
         YNW0Ny8FXi8MDAPkROUfRk5fL8sIcuQ8ajEOsx/NSIAKEdqU74KDzyFBNkKXsPMKv1
         +m26xueTZ4xow==
X-Nifty-SrcIP: [209.85.217.49]
Received: by mail-vs1-f49.google.com with SMTP id 7so7085831vsr.10
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Feb 2020 18:57:36 -0800 (PST)
X-Gm-Message-State: APjAAAX8pmpLw8avdRnMy7tofSKUYpAS+U59CUkD32nPg4YO88OO9tv+
        toy69BHzD8yIUbYnPUr8hnIAIGsPunM9i93RNlI=
X-Google-Smtp-Source: APXvYqwiFd4bBsQXSCuIVQt15CcX5OtAQMWmizp/tmA6BHGIOOEzE/wDv+/KNBQSZ5KiT5ejnr1gY8nNVG79mQiAzak=
X-Received: by 2002:a67:fa4b:: with SMTP id j11mr28787614vsq.155.1582599455578;
 Mon, 24 Feb 2020 18:57:35 -0800 (PST)
MIME-Version: 1.0
References: <CAGRSmLshZwKYEj=Mv3WfDh4=ihJf4r0naG_iKBtgR7CEqBCeEw@mail.gmail.com>
In-Reply-To: <CAGRSmLshZwKYEj=Mv3WfDh4=ihJf4r0naG_iKBtgR7CEqBCeEw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 25 Feb 2020 11:56:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNATyfWCso7XGjYpdc+h6rqoAZ399csr2ftK8-1+kQfJMkg@mail.gmail.com>
Message-ID: <CAK7LNATyfWCso7XGjYpdc+h6rqoAZ399csr2ftK8-1+kQfJMkg@mail.gmail.com>
Subject: Re: Moving from 4.x to 5.4.22 breaks custom module build.
To:     "David F." <df7729@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Feb 25, 2020 at 7:02 AM David F. <df7729@gmail.com> wrote:
>
> Hi,
>
> I have a private custom module I build via various scripts since I
> setup since I knew I'd have no clue how to do it in the future.  It's
> been working great for years, but now it's broken with the move from
> 4.19.xx to 5.4.22 so the future is here and don't remember much about
> how I set it all up.  But it does look to me that the failure has to
> do with a support library I have it build.  Can the kbuild experts
> tell me what changed with V5 from V4.19 that breaks building my custom
> module.
>
> Thanks!!
>
> Here's the information (I'm writing this in Windows so my dir output
> will be from windows):
>
> The input/source files:
>
> 01/25/2016  06:52 PM             1,501 linuxdriverc.c
> 01/24/2016  06:59 PM               284 linuxdrivercpp.cpp
> 01/22/2016  07:20 PM             1,124 linuxdriverdumpbuf.c
> 09/22/2019  12:17 AM             4,985 linuxdriverfile.c
> 01/22/2016  07:20 PM             2,142 linuxdriverprintk.c
>
> When the 4.x version (this was 4.19.97) finishes the dir contains:
>
> 01/22/2020  12:43 AM               338 .junk.ko.cmd
> 01/22/2020  12:43 AM            29,743 .junk.mod.o.cmd
> 01/22/2020  12:43 AM               220 .junk.o.cmd
> 01/22/2020  12:43 AM               581 .lib.a.cmd
> 01/22/2020  12:43 AM            29,795 .linuxdriverc.o.cmd
> 01/22/2020  12:43 AM            30,248 .linuxdriverdumpbuf.o.cmd
> 01/22/2020  12:43 AM            36,098 .linuxdriverfile.o.cmd
> 01/22/2020  12:43 AM            30,235 .linuxdriverprintk.o.cmd
> 01/22/2020  12:43 AM             1,908 junk.ko
> 01/22/2020  12:43 AM               650 junk.mod.c
> 01/22/2020  12:43 AM             1,792 junk.mod.o
> 01/22/2020  12:43 AM               260 junk.o
> 01/22/2020  12:43 AM             1,084 lib.a
> 01/22/2020  12:43 AM                29 linuxdriverc.c
> 01/22/2020  12:43 AM             1,040 linuxdriverc.o
> 01/22/2020  12:43 AM                33 linuxdrivercpp.cpp
> 01/22/2020  12:43 AM               976 linuxdrivercpp.o
> 01/22/2020  12:43 AM                35 linuxdriverdumpbuf.c
> 01/22/2020  12:43 AM             1,320 linuxdriverdumpbuf.o
> 01/22/2020  12:43 AM                32 linuxdriverfile.c
> 01/22/2020  12:43 AM             1,448 linuxdriverfile.o
> 01/22/2020  12:43 AM                34 linuxdriverprintk.c
> 01/22/2020  12:43 AM             1,564 linuxdriverprintk.o
> 01/22/2020  12:43 AM             1,084 linuxdriversup.a
> 01/26/2016  05:16 PM             2,188 Makefile
> 01/22/2020  12:43 AM                 0 Module.symvers
> 01/22/2020  12:43 AM                71 modules.order
>
> For the 5.4.22 the files are:
>
> 02/24/2020  12:04 PM               573 .lib.a.cmd
> 02/24/2020  12:04 PM            30,740 .linuxdriverc.o.cmd
> 02/24/2020  12:04 PM            31,278 .linuxdriverdumpbuf.o.cmd
> 02/24/2020  12:04 PM            37,708 .linuxdriverfile.o.cmd
> 02/24/2020  12:04 PM            31,265 .linuxdriverprintk.o.cmd
> 02/24/2020  12:04 PM             1,080 lib.a
> 01/25/2016  06:52 PM                29 linuxdriverc.c
> 02/24/2020  12:04 PM             1,040 linuxdriverc.o
> 01/24/2016  06:59 PM                33 linuxdrivercpp.cpp
> 02/24/2020  12:04 PM               976 linuxdrivercpp.o
> 01/22/2016  07:20 PM                35 linuxdriverdumpbuf.c
> 02/24/2020  12:04 PM             1,320 linuxdriverdumpbuf.o
> 09/22/2019  12:17 AM                32 linuxdriverfile.c
> 02/24/2020  12:04 PM             1,448 linuxdriverfile.o
> 01/22/2016  07:20 PM                34 linuxdriverprintk.c
> 02/24/2020  12:04 PM             1,564 linuxdriverprintk.o
> 01/26/2016  05:16 PM             2,188 Makefile
>
> There are no error messages other than it can't find junk.o for LD:
>
> Starting KBuild make...
> make[3]: Entering directory '/usr/src/linux-headers-5.4.22-686-iflnet'
>   LD [M]  /media/sf_SRC_DRIVE/libs/linux_drivers/5.4.22-686-iflnet/junk.o
> ld: no input files
> scripts/Makefile.build:446: recipe for target
> '/media/sf_SRC_DRIVE/libs/linux_drivers/5.4.22-686-iflnet/junk.o'
> failed
> make[4]: *** [/media/sf_SRC_DRIVE/libs/linux_drivers/5.4.22-686-iflnet/junk.o]
> Error 1
> Makefile:1652: recipe for target
> '/media/sf_SRC_DRIVE/libs/linux_drivers/5.4.22-686-iflnet' failed
> make[3]: *** [/media/sf_SRC_DRIVE/libs/linux_drivers/5.4.22-686-iflnet] Error 2
> make[3]: Leaving directory '/usr/src/linux-headers-5.4.22-686-iflnet'
>
>
> The makefile used is:
>
> # You should only need to change the items marked ** fill in **
> # everything else should be automatic.
>
> # the version of the kernel the module is being compiled for
> KVER?=$(shell uname -r)
> # the directory of the kernel build system
> KDIR:=/lib/modules/$(KVER)/build
> # fill in the verbose level you want
> V:=0
>
> #################################
> # fill in the name of the module    ** fill in **
> #################################
> mymodlib_name:=linuxdriversup
>
> #################################
> # unique cpp build flags            ** fill in **
> #################################
> # CC_FLAGS+=-I.
>
> # flags file for building CPP versions
> FLAGS:=/media/sf_SRC_DRIVE/libs/linux_drivers/buildopts/$(KVER)/buildopts.cfg
>
> #################################
> # extra C flags to use                ** fill in **
> #################################
> EXTRA_CFLAGS+=-I.
> #EXTRA_CFLAGS+=-Werror
> #EXTRA_CFLAGS += -std=gnu99
> #EXTRA_CFLAGS += -Wno-declaration-after-statement
>
> ##############
> # code start #
> ##############
> ifeq ($(V),1)
> Q=
> else
> Q=@
> endif
>
> # this was the only way I figured out how to get the
> # kbuild envrionment to build the library for me.  the
> # cpp item doesn't really need to be built in this
> # envrionment but we do it since it works.
>
> # Setup module name for kbuild
> obj-m:=junk.o
> junk-objs:=lib.a


Perhaps, this line is the cause of the failure.

Kbuild does not support linking *.a to a module.

There exists a workaround patch, but it was rejected.
https://patchwork.kernel.org/patch/11318691/#23088533



Masahiro Yamada


>
> # build sources in the target directory
> SOURCES_ALL:=$(filter-out %.mod.c,$(shell find $(M) -maxdepth 1 -name
> "*.cpp" -or -name "*.c"))
>
> # add the sources and to the kbuild
> lib-y+=$(addsuffix .o,$(notdir $(basename $(SOURCES_ALL))))
>
>
> # pattern for compiling the c++ parts
> %.o: %.cpp $(FLAGS)
>     $(info doing [$@])
>     $(Q)g++ `cat $(FLAGS)` $(CC_FLAGS) -fno-exceptions -fno-rtti -Wall
> -c -o $@ $<
>
> .PHONY: all
> all:
>     $(Q)echo Run make from main directory
>
> .PHONY: renamelib
> renamelib:
> #    the -p is not working to preserve timestamps but touch works
>     @cp -p lib.a $(mymodlib_name).a ; \
>     touch -r lib.a $(mymodlib_name).a; \
>     rm -fr .tmp_versions
> #    rm -f junk.* .*.cmd ; removing either of these trigger full build
>
>
> .PHONY: clean
> clean:
>     # note this deletes .a .o etc files in subdirs too!
>     $(Q)$(MAKE) -C $(KDIR) M=$(CURDIR) V=$(V) clean



-- 
Best Regards
Masahiro Yamada
