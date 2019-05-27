Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2862BBE9
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 May 2019 00:12:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbfE0WMM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 May 2019 18:12:12 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:60620 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726905AbfE0WMM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 May 2019 18:12:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=PfsPPJX+22qktBAm2zdVwX0G/gToQNUHtQUKJKuMtpI=; b=CRHbxWe1nKn7QObflpDNNOe/1
        O4ZnIp7maU9czCg7421iBA4xpE/ZsgG086AM69hUvATUwrjZ+IsX1EP34z6+Q1zSyzEkOmdHKS3N6
        eQjyv0Rc1TSgg+7hEVceR9LdcNOb7e2mftHB5VUt7hlnmN7/cOkMDX50SHheo7SpNriXGw14otFdk
        sfhRepYnItS0TV+S86sOfXO8kjTVPOmAkISCbcWoQVu37VmC1B7FoZuScq7qQ/Xi4pynMfbEr6WFR
        YXT4roT75TuhiM9jx3R8iVWPcGVFu64xhwU+w4HfJq/Fq/qJKZmCf3qn3CCqh7FzELsW60rNaTgAF
        V4TDkjxgw==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hVNqi-0004SY-TX; Mon, 27 May 2019 22:12:09 +0000
Subject: Re: uapi headers userspace build results
To:     Jayant Chowdhary <jchowdhary@google.com>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        kernel-team@android.com
References: <8b90457a-5b1d-818c-d2d6-ba3d16ad3eaf@infradead.org>
 <1ef3a7b9-5172-9f7a-01fa-4866e765fbbe@google.com>
 <b5a73c3f-b70d-110f-896d-82fd81982cf8@infradead.org>
 <8a36d3ba-977b-49ca-c431-90ef53071f88@google.com>
 <9b76d1b6-08a4-36cf-4fc8-661b216ca433@infradead.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <becd3d01-509b-d470-df48-e5ef0e21ae2a@infradead.org>
Date:   Mon, 27 May 2019 15:12:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <9b76d1b6-08a4-36cf-4fc8-661b216ca433@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Jayant,

What ever happened to this script and subsequent patches?

thanks.

On 6/19/18 11:17 AM, Randy Dunlap wrote:
> On 06/18/2018 06:47 PM, Jayant Chowdhary wrote:
>> Hi Randy,
>>
>> On 06/12/2018 05:07 PM, Randy Dunlap wrote:
>>> On 06/12/2018 01:39 PM, Jayant Chowdhary wrote:
>>>> Hi Randy,
>>>>
>>>> On 06/11/2018 10:49 PM, Randy Dunlap wrote:
>>>>> Hi,
>>>>>
>>>>> Here is what I have so far.  It begins with a makefile and some
>>>>> template files that are added to.  There's a good bit of Perl also.
>>>>>
>>>>> I put all of these files in tools/uapi/ and run them from there.
>>>>>
>>>>> There is one .c file generated for each .h file in builddir/usr/include
>>>>> (O=builddir).
>>>>>
>>>>
>>>> Thanks for this! I wrote a small Makefile (uapi-compile.mk) which I'd put in
>>>> tools/build (I can change this to tools/uapi, if that is more apt).
>>>
>>> Your makefile foo is much better than mine is.
>>> Yes, I think that it deserves to be in its own sub-directory.
>>>
>>>> uapi-compile.mk straight-away compiles the uapi headers, without pulling them
>>>> into any generated c source files. It may also be invoked with an environment
>>>
>>> Hm, I didn't even know that is possible.
>>>
>>>> variable 'UAPI_DIR' specifying the directory, for which the user would like to
>>>> compile headers. This way we can test a directory at a time as well. In your
>>>
>>> Yes, good, I was planning to make a way to restrict the build to certain sub-dirs.
>>>
>>>> opinion, would this be simpler to have rather than having to auto-generate c
>>>> source files including each uapi header and also autog-enerating the make
>>>> targets? I feel like this approach would make maintaining these makefiles/
>>>> scripts easier as well.
>>>
>>> Sure, this is much better than my scripts.
>>>
>>>>> Out of 889 header files, I see 45 errors.  That is better than I expected.
>>>>>
>>>>> The makefiles and scripts are attached (tar), as well as the output (I used
>>>>> 'make -ik' so that make would keep going after errors and attempt to build
>>>>> all target files).
>>>>>
>>>>> have fun!
>>>>>
>>>>
>>>> I did a 'make ARCH=arm64 headers_install' from the kernel source's root, and
>>>> then a 'make -kf uapi-compile.mk all > build.log 2>&1' to compile all the
>>>> headers. Out of 864 headers, I see 20 compilation failures.
>>>>
>>>> I'm attaching uapi-compile.mk and the build.log file along.
>>>
>>> I have some usage comments.
>>>
>>> Since I ran 'make ARCH=x86_64 O=xx64 headers_install', I had to modify
>>> uapi-compile.mk to use that SRC_DIR:
>>>
>>> SRC_DIR :=../../xx64
>>>
>>> Also, I first tried to make BDIR as a sub-directory of tools/uapi/ and
>>> uapi-compile.mk did not work (when using BDIR=BDIR).
>>> Then I did 'mkdir ../../xx64/BDIR' and specified BDIR=../../xx64/BDIR and
>>> that worked.  But:  that sub-dir is not used:
>>>
>>> gcc -I../../xx64/usr/include/ --include=../../xx64/usr/include/linux/posix_types.h --include=../../xx64/usr/include/asm-generic/ipcbuf.h --include=stdarg.h --include=stdint.h --include=stddef.h -c ../../xx64/usr/include//linux/caif/caif_socket.h -o ../../xx64/BDIR/../../xx64/usr/include//linux/caif/caif_socket.o
>>> [see the next comment]
>>>
>>> Oh, this makefile builds the .o files in the same sub-dirs as their
>>> respective .h files.  I don't especially like that, but as long as
>>> make clean works, it will do.  [and make clean does work]
>>>
>>
>> Thanks for these comments. I'll take care of them in my patch-set. I've got a
>> couple of questions for you. Since most of the errors were found in the
>> include/uapi/linux directory, I tried investigating why.
> 
> Please also repost your latest patch-set.
> 
>> 1) I found that multiple headers depend on the definition of types such as
>> pid_t, which have no definition in the set of uapi headers. There is a
>> definition (of pid_t) in include/linux/types.h, and I thought we could try
>> exposing that in the set of uapi headers. One problem I can see with that is
>> that the header has some definitions which depend on kernel configs: eg:
>> CONFIG_ARCH_DMA_ADDR_T_64BIT. Since user-land programs shouldn't really assume
>> kernel configs, I was thinking we should re-factor this header so that
>> appropriate parts can be exposed to user-land.
> 
> Sure, that's worth a try.  Mostly on a case-by-case basis.
> 
> I see that (at least in the distro that I am using)
> /usr/include/asm-generic/posix_types.h has a typedef for __kernel_pid_t.
> I wonder if that could be co-opted, but I expect that this would have
> type/size issues.
> 
> OTOH, 'man getpid' uses pid_t and refers to <sys/types.h> and <unistd.h>,
> so there should already be a pid_t for userspace.  Just #include more
> headers files.  :)
> 
>> 2) Some headers try to expose information which should probably not be exposed
>> to user-land. eg: wait_queue_head in linux/coda_psdev.h (this header should
>> probably be removed altogether ?)
> 
> I suppose that header file describes a kernel-to-userspace ("Venus") interface,
> so maybe not removed altogether.  But the wait_queue_head_t part of it should
> just be some padding/reserved field (of what size/type?).
> 
> 
>> Do you have better ideas ?
> 
> slow and steady.
> 


-- 
~Randy
