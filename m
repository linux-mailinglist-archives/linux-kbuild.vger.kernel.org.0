Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16AA61C670D
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 May 2020 06:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725892AbgEFEpM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 6 May 2020 00:45:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbgEFEpL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 May 2020 00:45:11 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79B64C061A0F;
        Tue,  5 May 2020 21:45:11 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id p25so386095pfn.11;
        Tue, 05 May 2020 21:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=nLsJXrAuqBX1mbe5XSwwfXidNjjtm9wgbXukORhebQU=;
        b=r9hXDDE4T7bGFCOFM1dnN/Dwl8t6eXqEkOZlA4BDKRqS8/giU1Xn7tYlRqhxZzNMff
         wt41E7VSwL++TEkU4mmMXaC5DVHNJ6uW0uM5wEoRJwdutU0WhRRlw03CioQEyxdHX8lV
         F12ifMvOD36BZKAdVMPRFZ8zLG7pq+hMCnzvMqc6JKHtm1ogY4rDJ1wfR7S3vD0Lbvkz
         LRktAvvFEhrKhF8el8L9SHMbG3e32PjCbAvxD04/VLxxYUfri5kOVc7m12NcE2xCf4lJ
         R2NGM0aqgXvAA+5HTtIi46iVtlC0OheLy0XclmzyoU24vBCEyqhIl52rpaEM3al3Ks41
         DPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=nLsJXrAuqBX1mbe5XSwwfXidNjjtm9wgbXukORhebQU=;
        b=Tgp75Mj0BHBNDG6fGYNuaSbePQw/cdcTU6nm2qT7dl1Hpd2wNFBD4KLqeup3H2wBVR
         nH5BmGvUzHY+rtHj9YPeiROy7qaafdDaeCL2xMDTgD7Ux5cIjxC9AaUIXQHw7drIX6HX
         Dr/7LfzwrQ4/nGrRQcPpSA7JFQ7ACA+6XIiVeO4W0Vh33en2SPJyYbm16Ug1pXxaY7NQ
         xLtNntb4pYqPbHlyuk0D/PK88eXlasYj/D47kimrQQNw+yEo3G4Y2wHn+jII6zbQCYiQ
         jmrOjULb7Ta8y+a5W/dKIw2ubKcd6tKxCIzQXZYM6rJBNSOU5+isUKER9c6sP2WWan65
         KGpg==
X-Gm-Message-State: AGi0PubZGm7NBfDk8Nne3vkvzLt61Z04JAjp3/fNIeytHSsk+jlLoi0q
        c510AbQHvZEL7iqynXNOxCD4mYRl
X-Google-Smtp-Source: APiQypJHyJ7BjHlFl/OTwlOF88+C9kf/F/gwwhlsf/M00v8f1Ac5yeF0HtrNpv5PT1LmocqD4rqV5A==
X-Received: by 2002:a63:e04e:: with SMTP id n14mr5477625pgj.147.1588740310754;
        Tue, 05 May 2020 21:45:10 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id gn20sm3500466pjb.24.2020.05.05.21.45.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2020 21:45:09 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
Subject: Proper use for linking foo.o_shipped after 69ea912fda74 ("kbuild:
 remove unneeded link_multi_deps")?
To:     masahiroy@kernel.org, LKML <linux-kernel@vger.kernel.org>,
        linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Message-ID: <cd20b888-7f3d-e7ff-8096-2cc8305a5107@gmail.com>
Date:   Tue, 5 May 2020 21:45:08 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro, Michal,

While updating our systems from 4.9 to 5.4, we noticed that one of the
kernel modules that we build, which is done by linking an object that we
pre-compile out of Kbuild stopped working.

I bisected it down to:

commit 69ea912fda74a673d330d23595385e5b73e3a2b9 (refs/bisect/bad)
Author: Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu Oct 4 13:25:19 2018 +0900

    kbuild: remove unneeded link_multi_deps

    Since commit c8589d1e9e01 ("kbuild: handle multi-objs dependency
    appropriately"), $^ really represents all the prerequisite of the
    composite object being built.

    Hence, $(filter %.o,$^) contains all the objects to link together,
    which is much simpler than link_multi_deps calculation.

    Please note $(filter-out FORCE,$^) does not work here. When a single
    object module is turned into a multi object module, $^ will contain
    header files that were previously included for building the single
    object, and recorded in the .*.cmd file. To filter out such headers,
    $(filter %.o,$^) should be used here.

    Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

and the linker now fails with the following:

mkdir -p /home/florian/dev/lkm/.tmp_versions ; rm -f
/home/florian/dev/lkm/.tmp_versions/*

  WARNING: Symbol version dump ./Module.symvers
           is missing; modules will have no dependencies and modversions.

make -f ./scripts/Makefile.build obj=/home/florian/dev/lkm
(cat /dev/null;   echo kernel//home/florian/dev/lkm/hello.ko;) >
/home/florian/dev/lkm/modules.order
  ld -m elf_x86_64  -z max-page-size=0x200000    -r -o
/home/florian/dev/lkm/hello.o
ld: no input files
make[1]: *** [scripts/Makefile.build:492: /home/florian/dev/lkm/hello.o]
Error 1
make: *** [Makefile:1530: _module_/home/florian/dev/lkm] Error 2

and here are some steps to reproduce this:

Kbuild:
obj-m   := hello.o
hello-y := test.o_shipped

test.c can be a simple hello world, and you can compile it using a
standard Kbuild file first, and then move test.o as test.o_shipped.

I am afraid I do not speak Kbuild fluently enough to recommend a fix for
that.

Thanks!
-- 
Florian
