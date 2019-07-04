Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F33F55F84C
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2019 14:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727632AbfGDMjR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Jul 2019 08:39:17 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:48295 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727682AbfGDMjR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Jul 2019 08:39:17 -0400
Received: from nat-ies.mentorg.com ([192.94.31.2] helo=svr-ies-mbx-02.mgc.mentorg.com)
        by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
        id 1hj116-0005xc-CT from Cedric_Hombourger@mentor.com ; Thu, 04 Jul 2019 05:39:12 -0700
Received: from [172.30.65.44] (137.202.0.90) by svr-ies-mbx-02.mgc.mentorg.com
 (139.181.222.2) with Microsoft SMTP Server (TLS) id 15.0.1320.4; Thu, 4 Jul
 2019 13:39:05 +0100
Subject: Re: [PATCH] builddeb: generate multi-arch friendly linux-libc-dev
 package
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
CC:     <isar-users@googlegroups.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ben Hutchings <ben@decadent.org.uk>,
        Riku Voipio <riku.voipio@linaro.org>
References: <1560752096-1323-1-git-send-email-Cedric_Hombourger@mentor.com>
 <CAK7LNASCmZyS11WkUWXLXVWgk-WU5JV=MMw=S6pXAzMhkVJ40Q@mail.gmail.com>
From:   Cedric Hombourger <cedric_hombourger@mentor.com>
Message-ID: <df3c389f-25a7-b5b8-b8c2-1732638ef3ed@mentor.com>
Date:   Thu, 4 Jul 2019 14:39:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAK7LNASCmZyS11WkUWXLXVWgk-WU5JV=MMw=S6pXAzMhkVJ40Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-04.mgc.mentorg.com (139.181.222.4) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello Yamada-san

Thanks for your review of this patch. Answers below

On 7/4/2019 2:43 AM, Masahiro Yamada wrote:
> CCed a couple of people.
>
> On Mon, Jun 17, 2019 at 3:15 PM Cedric Hombourger
> <Cedric_Hombourger@mentor.com> wrote:
>> Debian-based distributions place libc header files in a machine
>> specific directory (/usr/include/<libc-machine>) instead of
>> /usr/include/asm to support installation of the linux-libc-dev
>> package from multiple architectures. Move headers installed by
>> "make headers_install" accordingly.
>>
>> Signed-off-by: Cedric Hombourger <Cedric_Hombourger@mentor.com>
>> Reviewed-by: Henning Schild <henning.schild@siemens.com>
>> ---
>>   scripts/package/builddeb | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
>> index b03dd56a4782..8f7afb3a84e9 100755
>> --- a/scripts/package/builddeb
>> +++ b/scripts/package/builddeb
>> @@ -132,6 +132,11 @@ fi
>>   if [ "$ARCH" != "um" ]; then
>>          $MAKE -f $srctree/Makefile headers_check
>>          $MAKE -f $srctree/Makefile headers_install INSTALL_HDR_PATH="$libc_headers_dir/usr"
>> +       # move asm headers to /usr/include/<libc-machine>/asm to match the structure
>> +       # used by Debian-based distros (to support multi-arch)
>> +       libc_mach=$($CC -dumpmachine)
>> +       mkdir $libc_headers_dir/usr/include/$libc_mach
>> +       mv $libc_headers_dir/usr/include/asm $libc_headers_dir/usr/include/$libc_mach/
>>   fi
>>
>>   # Install the maintainer scripts
>
> I am not sure but,
> I just worried about the backward compatibility...

this patch is actually addressing a compatibility problem with 
multi-arch capable distros (all the major Debian-based distros that I 
know of are) where the currently generated libc headers packages is 
placing arch specific headers where all arch compilers installed on the 
system would find them

> Was this previously broken?

yes (as noted above) but would only be seen on systems with multi-arch 
packages / development tools installed

> I guess debian is using own control file
> instead of the one in upstream kernel.
> So, this is almost a matter for developers, I think.

Correct. Debian and some others use their own.

We (Mentor and Siemens) as well as other folks from the embedded 
community build embedded platforms using Debian as a base and recent 
kernels (so we can run Debian on e.g. recent Arm64 hardware designs). 
This is achieved by using Isar (https://github.com/ilbers/isar). The 
custom kernel recipe it provides uses builddeb since that feature is 
mainline. It also allows us to use custom kernels regardless of the 
Debian-based distro we use (Raspbian, Ubuntu, Debian, etc.)

> How did debian-base distros managed this before,
> and will this introduce no breakage?

We would expect desktop distros to continue using their own 
debian/{control,rules} files but would recommend to have the .deb 
produce by the kernel be better aligned with Debian so we can swap their 
"old" kernels with recent LTS or recent HEAD kernels.

Hope I was able to shed some light on our use-case / motivation.

> Ben,
> Could you comment on this?
>
>
