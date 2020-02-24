Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D590716B382
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2020 23:02:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726980AbgBXWCk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 24 Feb 2020 17:02:40 -0500
Received: from mail-ed1-f48.google.com ([209.85.208.48]:41539 "EHLO
        mail-ed1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728211AbgBXWCk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Feb 2020 17:02:40 -0500
Received: by mail-ed1-f48.google.com with SMTP id c26so13783814eds.8
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Feb 2020 14:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=71QzONkTzAIu3jk8HKgpRhb4UeZkAmLq5Zuczc00fxs=;
        b=kRhXuXf5X2dpaS1lDPQfDoHy1ZD5EGojTDrIjzmoQfCRijd/Kf07vCVR6+xQDYlrsU
         pbdi7Cr5tAzjXuYCo6akIX3jht7oo4k8yvorQ1tq41HEVeRmeOo1IJuNvcVqqPeRvyvv
         Dip3npLt+c5xT4+iFwP0m9DV1AhxofzTBlWGEDp6c+UjELSaS3rXRbBeIGrILCjfLVgo
         I1j7m97blSO4JXSjFGWdGpTxFxH4sL2FwcMPEmSBmDyXXRcUGQ47BdZQpA2FgktNC6Ue
         ULDdTupiLE92ebL7YgpxrnnRaz7bxrcjE6ngz5kjtkxMKoj2osXOUt0WTYEzoGtOMjIA
         tpyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=71QzONkTzAIu3jk8HKgpRhb4UeZkAmLq5Zuczc00fxs=;
        b=W+xjM3zvDFbyJfnX6irLPiMw3K2MVH6m9nzk74u8rshAfoD2KB1e7Ll40hSzCovQuP
         TxZrNc5cx/zgixhLtn1bR8CI/5YsGm8HIWOTgspD06BTQG7HV7NtbKkWYOmoWV/iwEIh
         z5sneBx/r5agcSoM8Or6QW6DpYhAtRdZVpawbS/RzP7oVpYFx9GYsDkX6U0jT+fq81NU
         8inJVOw6S168gbYfOFYdf03lWZnEmXh9xdCuWc4JnlTm3P6nrbrTLj9FiteO7yw3o1bb
         Rkdd95FiFL4ntV29gv1wvuUq7l7G2Z/ZVCxAPcaN3gUZAfs9aSRyP01rQ/TRRO7ISgV/
         VFyg==
X-Gm-Message-State: APjAAAXJE6nUBqz9WMji5HkApgr8TdNKo7WdJHCSzLPvhbkyRH9QSDxB
        aEydPgJg5DoAzEDTkiaeNdUwsngHyLVekv2HzcdrrcNw
X-Google-Smtp-Source: APXvYqyY0bUsYUBDPxOIX+FcDy84nfIEUdL1S11+Kkms1er7q1x8aOW/N9U9/RfSo822O3rLDNLl2x9mvSITz6cRFiA=
X-Received: by 2002:a17:906:535d:: with SMTP id j29mr48806653ejo.230.1582581757290;
 Mon, 24 Feb 2020 14:02:37 -0800 (PST)
MIME-Version: 1.0
From:   "David F." <df7729@gmail.com>
Date:   Mon, 24 Feb 2020 14:02:26 -0800
Message-ID: <CAGRSmLshZwKYEj=Mv3WfDh4=ihJf4r0naG_iKBtgR7CEqBCeEw@mail.gmail.com>
Subject: Moving from 4.x to 5.4.22 breaks custom module build.
To:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

I have a private custom module I build via various scripts since I
setup since I knew I'd have no clue how to do it in the future.  It's
been working great for years, but now it's broken with the move from
4.19.xx to 5.4.22 so the future is here and don't remember much about
how I set it all up.  But it does look to me that the failure has to
do with a support library I have it build.  Can the kbuild experts
tell me what changed with V5 from V4.19 that breaks building my custom
module.

Thanks!!

Here's the information (I'm writing this in Windows so my dir output
will be from windows):

The input/source files:

01/25/2016  06:52 PM             1,501 linuxdriverc.c
01/24/2016  06:59 PM               284 linuxdrivercpp.cpp
01/22/2016  07:20 PM             1,124 linuxdriverdumpbuf.c
09/22/2019  12:17 AM             4,985 linuxdriverfile.c
01/22/2016  07:20 PM             2,142 linuxdriverprintk.c

When the 4.x version (this was 4.19.97) finishes the dir contains:

01/22/2020  12:43 AM               338 .junk.ko.cmd
01/22/2020  12:43 AM            29,743 .junk.mod.o.cmd
01/22/2020  12:43 AM               220 .junk.o.cmd
01/22/2020  12:43 AM               581 .lib.a.cmd
01/22/2020  12:43 AM            29,795 .linuxdriverc.o.cmd
01/22/2020  12:43 AM            30,248 .linuxdriverdumpbuf.o.cmd
01/22/2020  12:43 AM            36,098 .linuxdriverfile.o.cmd
01/22/2020  12:43 AM            30,235 .linuxdriverprintk.o.cmd
01/22/2020  12:43 AM             1,908 junk.ko
01/22/2020  12:43 AM               650 junk.mod.c
01/22/2020  12:43 AM             1,792 junk.mod.o
01/22/2020  12:43 AM               260 junk.o
01/22/2020  12:43 AM             1,084 lib.a
01/22/2020  12:43 AM                29 linuxdriverc.c
01/22/2020  12:43 AM             1,040 linuxdriverc.o
01/22/2020  12:43 AM                33 linuxdrivercpp.cpp
01/22/2020  12:43 AM               976 linuxdrivercpp.o
01/22/2020  12:43 AM                35 linuxdriverdumpbuf.c
01/22/2020  12:43 AM             1,320 linuxdriverdumpbuf.o
01/22/2020  12:43 AM                32 linuxdriverfile.c
01/22/2020  12:43 AM             1,448 linuxdriverfile.o
01/22/2020  12:43 AM                34 linuxdriverprintk.c
01/22/2020  12:43 AM             1,564 linuxdriverprintk.o
01/22/2020  12:43 AM             1,084 linuxdriversup.a
01/26/2016  05:16 PM             2,188 Makefile
01/22/2020  12:43 AM                 0 Module.symvers
01/22/2020  12:43 AM                71 modules.order

For the 5.4.22 the files are:

02/24/2020  12:04 PM               573 .lib.a.cmd
02/24/2020  12:04 PM            30,740 .linuxdriverc.o.cmd
02/24/2020  12:04 PM            31,278 .linuxdriverdumpbuf.o.cmd
02/24/2020  12:04 PM            37,708 .linuxdriverfile.o.cmd
02/24/2020  12:04 PM            31,265 .linuxdriverprintk.o.cmd
02/24/2020  12:04 PM             1,080 lib.a
01/25/2016  06:52 PM                29 linuxdriverc.c
02/24/2020  12:04 PM             1,040 linuxdriverc.o
01/24/2016  06:59 PM                33 linuxdrivercpp.cpp
02/24/2020  12:04 PM               976 linuxdrivercpp.o
01/22/2016  07:20 PM                35 linuxdriverdumpbuf.c
02/24/2020  12:04 PM             1,320 linuxdriverdumpbuf.o
09/22/2019  12:17 AM                32 linuxdriverfile.c
02/24/2020  12:04 PM             1,448 linuxdriverfile.o
01/22/2016  07:20 PM                34 linuxdriverprintk.c
02/24/2020  12:04 PM             1,564 linuxdriverprintk.o
01/26/2016  05:16 PM             2,188 Makefile

There are no error messages other than it can't find junk.o for LD:

Starting KBuild make...
make[3]: Entering directory '/usr/src/linux-headers-5.4.22-686-iflnet'
  LD [M]  /media/sf_SRC_DRIVE/libs/linux_drivers/5.4.22-686-iflnet/junk.o
ld: no input files
scripts/Makefile.build:446: recipe for target
'/media/sf_SRC_DRIVE/libs/linux_drivers/5.4.22-686-iflnet/junk.o'
failed
make[4]: *** [/media/sf_SRC_DRIVE/libs/linux_drivers/5.4.22-686-iflnet/junk.o]
Error 1
Makefile:1652: recipe for target
'/media/sf_SRC_DRIVE/libs/linux_drivers/5.4.22-686-iflnet' failed
make[3]: *** [/media/sf_SRC_DRIVE/libs/linux_drivers/5.4.22-686-iflnet] Error 2
make[3]: Leaving directory '/usr/src/linux-headers-5.4.22-686-iflnet'


The makefile used is:

# You should only need to change the items marked ** fill in **
# everything else should be automatic.

# the version of the kernel the module is being compiled for
KVER?=$(shell uname -r)
# the directory of the kernel build system
KDIR:=/lib/modules/$(KVER)/build
# fill in the verbose level you want
V:=0

#################################
# fill in the name of the module    ** fill in **
#################################
mymodlib_name:=linuxdriversup

#################################
# unique cpp build flags            ** fill in **
#################################
# CC_FLAGS+=-I.

# flags file for building CPP versions
FLAGS:=/media/sf_SRC_DRIVE/libs/linux_drivers/buildopts/$(KVER)/buildopts.cfg

#################################
# extra C flags to use                ** fill in **
#################################
EXTRA_CFLAGS+=-I.
#EXTRA_CFLAGS+=-Werror
#EXTRA_CFLAGS += -std=gnu99
#EXTRA_CFLAGS += -Wno-declaration-after-statement

##############
# code start #
##############
ifeq ($(V),1)
Q=
else
Q=@
endif

# this was the only way I figured out how to get the
# kbuild envrionment to build the library for me.  the
# cpp item doesn't really need to be built in this
# envrionment but we do it since it works.

# Setup module name for kbuild
obj-m:=junk.o
junk-objs:=lib.a

# build sources in the target directory
SOURCES_ALL:=$(filter-out %.mod.c,$(shell find $(M) -maxdepth 1 -name
"*.cpp" -or -name "*.c"))

# add the sources and to the kbuild
lib-y+=$(addsuffix .o,$(notdir $(basename $(SOURCES_ALL))))


# pattern for compiling the c++ parts
%.o: %.cpp $(FLAGS)
    $(info doing [$@])
    $(Q)g++ `cat $(FLAGS)` $(CC_FLAGS) -fno-exceptions -fno-rtti -Wall
-c -o $@ $<

.PHONY: all
all:
    $(Q)echo Run make from main directory

.PHONY: renamelib
renamelib:
#    the -p is not working to preserve timestamps but touch works
    @cp -p lib.a $(mymodlib_name).a ; \
    touch -r lib.a $(mymodlib_name).a; \
    rm -fr .tmp_versions
#    rm -f junk.* .*.cmd ; removing either of these trigger full build


.PHONY: clean
clean:
    # note this deletes .a .o etc files in subdirs too!
    $(Q)$(MAKE) -C $(KDIR) M=$(CURDIR) V=$(V) clean
