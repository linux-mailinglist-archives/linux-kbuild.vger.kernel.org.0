Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA61932ED32
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Mar 2021 15:34:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231327AbhCEOeL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Mar 2021 09:34:11 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:26470 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231328AbhCEOeE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Mar 2021 09:34:04 -0500
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 125EXlCV018347;
        Fri, 5 Mar 2021 23:33:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 125EXlCV018347
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614954828;
        bh=RFmjUML7FhVfVBa7SBbs7fEdK0GaApuuRCBX6mEMwb4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=iG5J0s3JAcHXGYYkHAiHEa/RLxm2GyERHfYfw89hwwxYhUQ90DtYoNF662snv7R32
         s4bacYiAhqskBk8WvUyJbsWXczc+Tpoob+8/+vbVhwLcbHC6v/HeGoFIrEqjgTeFLc
         3dAmKiD74MrJ4dOBblQRYAaut4gOMkdOLKgfNgXgV0Ix6gKU25KTkGXL/W+82UcZ3R
         O0RAif5VKE6zrDgHkLz45MqrFWh/ePbacVD5asI4d/KIT6uH1rZqn6VwqE5Mdk2Zp5
         T/LMurHo5iuSuekIUJ8e1R/6na8kGKUT4VnRs1LFeQ7G5y3R7gAWgB+rxcluewYeY0
         j2G4u5nrHD46w==
X-Nifty-SrcIP: [209.85.216.51]
Received: by mail-pj1-f51.google.com with SMTP id bj7so2140347pjb.2;
        Fri, 05 Mar 2021 06:33:48 -0800 (PST)
X-Gm-Message-State: AOAM533StzvQ+TTDrGYZMVZBZCrmjkmfGdlHiawg2EDuPFAajim6fGLn
        uQ+d+7yt+nZlbW7GqNhWXPVTNAYwIyttQ/F3JYg=
X-Google-Smtp-Source: ABdhPJzA9UvVKhzZSmXe/Lx9YIJ5LU6aW+lpQNPxSPY6GI5mmbSUqG6XzqQOGkXLzfDRj91GzVIz3GmLgG+WPPSStpQ=
X-Received: by 2002:a17:902:c48c:b029:e4:c093:593a with SMTP id
 n12-20020a170902c48cb02900e4c093593amr8845734plx.1.1614954827358; Fri, 05 Mar
 2021 06:33:47 -0800 (PST)
MIME-Version: 1.0
References: <42e0adf2-dbf5-9c1b-a18d-05bf5f1960a1@arm.com> <CAK7LNASX-Rx_fxcuqQ_vFHQwQ+RJq9XCW9_dL=jFCuoEJ0vF3Q@mail.gmail.com>
 <985bf10d-336c-61f6-8b9d-d8c6fb48634a@arm.com>
In-Reply-To: <985bf10d-336c-61f6-8b9d-d8c6fb48634a@arm.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 5 Mar 2021 23:33:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQoOo_BEw1hKVX-NDHHTGQtiuKadDG7gMMq5MKK+ZNq6g@mail.gmail.com>
Message-ID: <CAK7LNAQoOo_BEw1hKVX-NDHHTGQtiuKadDG7gMMq5MKK+ZNq6g@mail.gmail.com>
Subject: Re: Possible regression due to 269a535ca931 "modpost: generate
 vmlinux.symvers and reuse it for the second modpost"
To:     Vladimir Murzin <vladimir.murzin@arm.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Mar 5, 2021 at 11:15 PM Vladimir Murzin <vladimir.murzin@arm.com> wrote:
>
> On 3/4/21 5:24 PM, Masahiro Yamada wrote:
> > On Fri, Mar 5, 2021 at 1:21 AM Vladimir Murzin <vladimir.murzin@arm.com> wrote:
> > [  snip long description ]
> >
> >>
> >> Does that make sense? What I'm missing?
> >>
> >> P.S.
> >> I've also checked v5.12-rc1 and see the same symptoms
> >
> > Since you ran "make allnoconfig",
> > the module feature was disabled.
> > (CONFIG_MODULES=n)
> >
> > That is why you cannot build external modules.
>
> That's a good point, yet was not reason for my issue :) It forced me to try with ARCH=arm
> (and update toolchain)
>
> $ CROSS_COMPILE=arm-none-linux-gnueabihf- make ARCH=arm mrproper
> $ CROSS_COMPILE=arm-none-linux-gnueabihf- make ARCH=arm vexpress_defconfig
> $ grep -w CONFIG_MODULES .config
> CONFIG_MODULES=y
> $ grep "=m" .config
> $ echo $?
> 1
> $ CROSS_COMPILE=arm-none-linux-gnueabihf- make ARCH=arm Image -j5 > /dev/null
> $ ls *.symvers
> vmlinux.symvers
> $ CROSS_COMPILE=arm-none-linux-gnueabihf- make ARCH=arm Image -j5 modules > /dev/null
> $ ls *.symvers
> Module.symvers  vmlinux.symvers
>
> So, `make modules` seems to become be mandatory. I'll go and update my scripts...
>

Without 'make modules', still you can build
external modules, but you will see a warning.

WARNING: Symbol version dump Module.symver is missing.
         Modules may not have dependencies or modversions.


Before 269a535ca931, if you did not run 'make modules',
Module.symvers contained symbols only from vmlinux, but
not from modules.
It was working for you just because your external modules
did not use symbols of in-tree modules.
But, it is fragile, and it may break suddenly if the
upstream code moves some config options from y to m.
So, building both vmlinux and modules
is the right thing.


-- 
Best Regards
Masahiro Yamada
