Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A038332ECE5
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Mar 2021 15:16:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbhCEOPq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Mar 2021 09:15:46 -0500
Received: from foss.arm.com ([217.140.110.172]:54728 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231145AbhCEOPk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Mar 2021 09:15:40 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A077101E;
        Fri,  5 Mar 2021 06:15:40 -0800 (PST)
Received: from [10.57.13.166] (unknown [10.57.13.166])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F168D3F73B;
        Fri,  5 Mar 2021 06:15:38 -0800 (PST)
Subject: Re: Possible regression due to 269a535ca931 "modpost: generate
 vmlinux.symvers and reuse it for the second modpost"
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@arndb.de>
References: <42e0adf2-dbf5-9c1b-a18d-05bf5f1960a1@arm.com>
 <CAK7LNASX-Rx_fxcuqQ_vFHQwQ+RJq9XCW9_dL=jFCuoEJ0vF3Q@mail.gmail.com>
From:   Vladimir Murzin <vladimir.murzin@arm.com>
Message-ID: <985bf10d-336c-61f6-8b9d-d8c6fb48634a@arm.com>
Date:   Fri, 5 Mar 2021 14:15:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNASX-Rx_fxcuqQ_vFHQwQ+RJq9XCW9_dL=jFCuoEJ0vF3Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 3/4/21 5:24 PM, Masahiro Yamada wrote:
> On Fri, Mar 5, 2021 at 1:21 AM Vladimir Murzin <vladimir.murzin@arm.com> wrote:
> [  snip long description ]
> 
>>
>> Does that make sense? What I'm missing?
>>
>> P.S.
>> I've also checked v5.12-rc1 and see the same symptoms
> 
> Since you ran "make allnoconfig",
> the module feature was disabled.
> (CONFIG_MODULES=n)
> 
> That is why you cannot build external modules.

That's a good point, yet was not reason for my issue :) It forced me to try with ARCH=arm
(and update toolchain)

$ CROSS_COMPILE=arm-none-linux-gnueabihf- make ARCH=arm mrproper
$ CROSS_COMPILE=arm-none-linux-gnueabihf- make ARCH=arm vexpress_defconfig
$ grep -w CONFIG_MODULES .config
CONFIG_MODULES=y
$ grep "=m" .config
$ echo $?
1
$ CROSS_COMPILE=arm-none-linux-gnueabihf- make ARCH=arm Image -j5 > /dev/null 
$ ls *.symvers
vmlinux.symvers
$ CROSS_COMPILE=arm-none-linux-gnueabihf- make ARCH=arm Image -j5 modules > /dev/null 
$ ls *.symvers
Module.symvers  vmlinux.symvers

So, `make modules` seems to become be mandatory. I'll go and update my scripts...

Cheers
Vladimir


> 
> 
> 
>> Cheers
>> Vladimir
> 
> 
> 
> 
> --
> Best Regards
> Masahiro Yamada
> 

