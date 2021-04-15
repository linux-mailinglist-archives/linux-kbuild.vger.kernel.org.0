Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B7A1360FB5
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 18:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233835AbhDOQEl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Apr 2021 12:04:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233734AbhDOQEk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Apr 2021 12:04:40 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DC08C061574;
        Thu, 15 Apr 2021 09:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=l8YXxHl5FfuimubfvcxmzJgMq+3HqkH1Xf70Zd6yln4=; b=LDlcmZCLGC7nLxW5erwgytybMS
        3dX62eN/PzqtcA8eyW7pF4fkM4zzoaSuXKDJSLc1fxNMAOr2YPjMI/EH5rcrNdG1ckzjf3trNEKHj
        ZgB7oSHcU+WghUSiCwin45Fw45tH9fOPjBSQAb4RaISDmdmtd1twU1asPJ3uNNsj9ogbmBmgSNXR4
        mMT2udkp4tKmlMljnG97MD5fF5KCuOZ57e9+U4k9qQFzBy2mhJ6yx2YFUqIN8Y+ZSdmEyjKesgHLI
        FIr+fXdQ+5O+5VrIi8t+FaIRKWF/xOFkAXiKoIqTLZZtkJOjs6EsZEFBrI58JV7GgFAgzrvvVqwLC
        lEO38PEw==;
Received: from [2601:1c0:6280:3f0::df68]
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lX4T3-008mxN-3R; Thu, 15 Apr 2021 16:03:49 +0000
Subject: Re: [PATCH] uml: fix W=1 missing-include-dirs warnings
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        linux-um@lists.infradead.org
References: <20210414192657.17764-1-rdunlap@infradead.org>
 <CAK7LNARSK2YspYvKkUKTp-aG2nqKnvdMr7B_6Am-u1-mt2XBNg@mail.gmail.com>
 <c3d41808-111c-c4dd-43fb-459ae56fc9ab@infradead.org>
 <CAK7LNAS2C1drA+v9q-mYHAbO3+4zjEdF_SJkBDtCXRExLX9u6w@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <dd054f33-beb8-317c-87f0-81badf087aa2@infradead.org>
Date:   Thu, 15 Apr 2021 09:03:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNAS2C1drA+v9q-mYHAbO3+4zjEdF_SJkBDtCXRExLX9u6w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 4/15/21 12:04 AM, Masahiro Yamada wrote:
> On Thu, Apr 15, 2021 at 4:02 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> On 4/14/21 11:52 PM, Masahiro Yamada wrote:
>>> On Thu, Apr 15, 2021 at 4:27 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>>>>
>>>> Currently when using "W=1" with UML builds, there are over 700 warnings
>>>> like so:
>>>>
>>>>   CC      arch/um/drivers/stderr_console.o
>>>> cc1: warning: ./arch/um/include/uapi: No such file or directory [-Wmissing-include-dirs]
>>>>
>>>> but arch/um/ does not have include/uapi/ at all, so don't
>>>> include arch/um/include/uapi/ in USERINCLUDE for UML.
>>
>>
>>>> Option 4: simply mkdir arch/um/include/uapi
>>>>         That's what I did first, just as a test, and it works.
>>>
>>>
>>> I like Option 4.
>>>
>>> But, you cannot do "mkdir -p arch/um/include/uapi" at build-time
>>> because the build system should not touch the source tree(, which
>>> might be read-only)
>>> for O= building.
>>>
>>> How about adding
>>>
>>>   arch/um/include/uapi/asm/Kbuild,
>>>
>>> which is just having a SPDX one-liner?
>>
>> Wow!  :)
>> That's what Al Viro suggested also.
>> I'll submit that patch later today (Thursday my time).
>>
>> thanks.
>> --
>> ~Randy
>>
> 
> 
> BTW, after fixing this UML problem,
> can we move -Wmissing-include-dirs to the top Makefile?

I don't see why not. And eventually remove this one:

fs/btrfs/Makefile:subdir-ccflags-y += -Wmissing-include-dirs

> Is there any other source of -Wmissing-include-dirs
> warnings?

I can't give a full answer on that; only that I haven't
seen any others and also that all other arch/*/include/
do have a uapi/ subdir.

-- 
~Randy

