Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF4701C72FD
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 May 2020 16:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728712AbgEFOiZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 6 May 2020 10:38:25 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:59652 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726114AbgEFOiZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 May 2020 10:38:25 -0400
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 046EcBPU018798;
        Wed, 6 May 2020 23:38:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 046EcBPU018798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1588775892;
        bh=M9gmKJVt/uafeUaxvi7PQ2kln4poib28y/004sSt/vU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YkXj/MFCyg0C6kk8+Ly4sSR3TqGGFU3e6GYgkkIweQqWol7Pat2YOOCfyqi5z5wOA
         NjrGg8//GQho/m3mCSoFN+kV/zwOKUP/+TJMqj/BQ/1uk7TuJuB4YayeuzpUU/nasP
         PzqEsrbjm9oUyURT1BxMJqCcHAls73LWV3dsJ8LZUJg0YaOFoloDwg5B0/1UlrtnMs
         Lb+aLYgdrnOSIC8uiftTRH9J/nwbbemvgvyO6TBK25mhSSXEDgSl+HgkR40QHGz2QQ
         Dzf8urrenxcj/TVlNT9Gxl14eguFGeCXDvXENhFtoTkfzWcVJdzvFGczlvi2F2hPdY
         ARst8i3slL0vw==
X-Nifty-SrcIP: [209.85.222.42]
Received: by mail-ua1-f42.google.com with SMTP id c24so552231uap.13;
        Wed, 06 May 2020 07:38:11 -0700 (PDT)
X-Gm-Message-State: AGi0PuanxVmqpBV6wKBMxEEgECc4IQEMJKBHm1EHTsfxCaZjc1ECKoRr
        86AXCiaXM79P3ZntPFp8kPRju20SQc+mhnLtL88=
X-Google-Smtp-Source: APiQypIcbooEj34Ety4qTnoiCQnhOcROiB5tuPOPapjKxKifSd2tktrprfNzTaHTQNWcpQBiCr+7GraVGGRF6itFaY8=
X-Received: by 2002:ab0:7298:: with SMTP id w24mr7236315uao.95.1588775890339;
 Wed, 06 May 2020 07:38:10 -0700 (PDT)
MIME-Version: 1.0
References: <cd20b888-7f3d-e7ff-8096-2cc8305a5107@gmail.com>
In-Reply-To: <cd20b888-7f3d-e7ff-8096-2cc8305a5107@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 6 May 2020 23:37:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR5TsnUn2n2nDFHywQyqCT7si840yE2nyuxx70AYj+nDQ@mail.gmail.com>
Message-ID: <CAK7LNAR5TsnUn2n2nDFHywQyqCT7si840yE2nyuxx70AYj+nDQ@mail.gmail.com>
Subject: Re: Proper use for linking foo.o_shipped after 69ea912fda74 ("kbuild:
 remove unneeded link_multi_deps")?
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, May 6, 2020 at 1:45 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> Hi Masahiro, Michal,
>
> While updating our systems from 4.9 to 5.4, we noticed that one of the
> kernel modules that we build, which is done by linking an object that we
> pre-compile out of Kbuild stopped working.
>
> I bisected it down to:
>
> commit 69ea912fda74a673d330d23595385e5b73e3a2b9 (refs/bisect/bad)
> Author: Masahiro Yamada <yamada.masahiro@socionext.com>
> Date:   Thu Oct 4 13:25:19 2018 +0900
>
>     kbuild: remove unneeded link_multi_deps
>
>     Since commit c8589d1e9e01 ("kbuild: handle multi-objs dependency
>     appropriately"), $^ really represents all the prerequisite of the
>     composite object being built.
>
>     Hence, $(filter %.o,$^) contains all the objects to link together,
>     which is much simpler than link_multi_deps calculation.
>
>     Please note $(filter-out FORCE,$^) does not work here. When a single
>     object module is turned into a multi object module, $^ will contain
>     header files that were previously included for building the single
>     object, and recorded in the .*.cmd file. To filter out such headers,
>     $(filter %.o,$^) should be used here.
>
>     Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> and the linker now fails with the following:
>
> mkdir -p /home/florian/dev/lkm/.tmp_versions ; rm -f
> /home/florian/dev/lkm/.tmp_versions/*
>
>   WARNING: Symbol version dump ./Module.symvers
>            is missing; modules will have no dependencies and modversions.
>
> make -f ./scripts/Makefile.build obj=/home/florian/dev/lkm
> (cat /dev/null;   echo kernel//home/florian/dev/lkm/hello.ko;) >
> /home/florian/dev/lkm/modules.order
>   ld -m elf_x86_64  -z max-page-size=0x200000    -r -o
> /home/florian/dev/lkm/hello.o
> ld: no input files
> make[1]: *** [scripts/Makefile.build:492: /home/florian/dev/lkm/hello.o]
> Error 1
> make: *** [Makefile:1530: _module_/home/florian/dev/lkm] Error 2
>
> and here are some steps to reproduce this:
>
> Kbuild:
> obj-m   := hello.o
> hello-y := test.o_shipped
>
> test.c can be a simple hello world, and you can compile it using a
> standard Kbuild file first, and then move test.o as test.o_shipped.



Why don't you do like this?

obj-m   := hello.o
hello-y := test.o










> I am afraid I do not speak Kbuild fluently enough to recommend a fix for
> that.
>
> Thanks!
> --
> Florian



-- 
Best Regards
Masahiro Yamada
