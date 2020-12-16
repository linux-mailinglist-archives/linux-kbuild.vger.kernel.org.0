Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B99742DC963
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Dec 2020 00:06:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727496AbgLPXGY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 16 Dec 2020 18:06:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47941 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726736AbgLPXGY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Dec 2020 18:06:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1608159897;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=M8zxnr7i+jdGAjTWJZWwGdbyVDDkRpBRiYVJz3+O7Nw=;
        b=BVtNOO8hO1HqO7CIjVB0TmvnE2zZtaGmBPnPT4AgMv5M38RTr5qd42xv5C0nX0nppbQWfO
        DtjQNl96akBr4EvV6PLM/roOx3d8F3H/6amkWxvZXIeicP3TGOso5xjhmnMulPI1Rvc9Aq
        aar4dHdxfS3yaPWW0m9fuGf3grhvWBo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-oiWHXeL9Mmeeo5neLVXCUw-1; Wed, 16 Dec 2020 18:04:47 -0500
X-MC-Unique: oiWHXeL9Mmeeo5neLVXCUw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F08D6800D53;
        Wed, 16 Dec 2020 23:04:45 +0000 (UTC)
Received: from [10.10.115.31] (ovpn-115-31.rdu2.redhat.com [10.10.115.31])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id D5E7E1971D;
        Wed, 16 Dec 2020 23:04:44 +0000 (UTC)
Subject: Re: [PATCH] kbuild: add extra-y to targets-for-modules
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Artem Savkov <artem.savkov@gmail.com>
Cc:     WANG Chao <chao.wang@ucloud.cn>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <20201103054425.59251-1-chao.wang@ucloud.cn>
 <CAK7LNARnmJRy1NPBDkgNsoe_TqpD=HJhmri4YHjXjscGZ-neWw@mail.gmail.com>
 <20201123150452.GA68187@MacBook-Pro-2>
 <CAK7LNASH7Pj9eUdxF-sp1_Ap+uA9jEtsXa--pUDDw_pNVLtviA@mail.gmail.com>
 <20201208092035.GA96434@MacBook-Pro-2.local>
 <20201208143117.GA3333762@wtfbox.lan>
 <CAK7LNAS=wdCObfX3x8CQmXf8HsrKAjz+v+XVUCxVg63pxy8MXg@mail.gmail.com>
From:   Joe Lawrence <joe.lawrence@redhat.com>
Message-ID: <f2d1888b-5b8e-a513-61c7-f41fc3f3f7a3@redhat.com>
Date:   Wed, 16 Dec 2020 18:04:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNAS=wdCObfX3x8CQmXf8HsrKAjz+v+XVUCxVg63pxy8MXg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 12/16/20 1:14 AM, Masahiro Yamada wrote:
> On Tue, Dec 8, 2020 at 11:31 PM Artem Savkov <artem.savkov@gmail.com> wrote:
>>
>> On Tue, Dec 08, 2020 at 05:20:35PM +0800, WANG Chao wrote:
>>> Sorry for the late reply.
>>>
>>> On 11/25/20 at 10:42P, Masahiro Yamada wrote:
>>>> On Tue, Nov 24, 2020 at 12:05 AM WANG Chao <chao.wang@ucloud.cn> wrote:
>>>>>
>>>>> On 11/23/20 at 02:23P, Masahiro Yamada wrote:
>>>>>> On Tue, Nov 3, 2020 at 3:23 PM WANG Chao <chao.wang@ucloud.cn> wrote:
>>>>>>>
>>>>>>> extra-y target doesn't build for 'make M=...' since commit 6212804f2d78
>>>>>>> ("kbuild: do not create built-in objects for external module builds").
>>>>>>>
>>>>>>> This especially breaks kpatch, which is using 'extra-y := kpatch.lds'
>>>>>>> and 'make M=...' to build livepatch patch module.
>>>>>>>
>>>>>>> Add extra-y to targets-for-modules so that such kind of build works
>>>>>>> properly.
>>>>>>>
>>>>>>> Signed-off-by: WANG Chao <chao.wang@ucloud.cn>
>>>>>>> ---
>>>>>>>   scripts/Makefile.build | 2 +-
>>>>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
>>>>>>> index ae647379b579..0113a042d643 100644
>>>>>>> --- a/scripts/Makefile.build
>>>>>>> +++ b/scripts/Makefile.build
>>>>>>> @@ -86,7 +86,7 @@ ifdef need-builtin
>>>>>>>   targets-for-builtin += $(obj)/built-in.a
>>>>>>>   endif
>>>>>>>
>>>>>>> -targets-for-modules := $(patsubst %.o, %.mod, $(filter %.o, $(obj-m)))
>>>>>>> +targets-for-modules := $(extra-y) $(patsubst %.o, %.mod, $(filter %.o, $(obj-m)))
>>>>>>>
>>>>>>>   ifdef need-modorder
>>>>>>>   targets-for-modules += $(obj)/modules.order
>>>>>>> --
>>>>>>> 2.29.1
>>>>>>>
>>>>>>
>>>>>> NACK.
>>>>>>
>>>>>> Please fix your Makefile.
>>>>>>
>>>>>> Hint:
>>>>>> https://patchwork.kernel.org/project/linux-kbuild/patch/20201123045403.63402-6-masahiroy@kernel.org/
>>>>>>
>>>>>>
>>>>>> Probably what you should use is 'targets'.
>>>>>
>>>>> I tried with 'targets' and 'always-y'. Both doesn't work for me.
>>>>>
>>>>> I narraw it down to the following example:
>>>>>
>>>>> cat > Makefile << _EOF_
>>>>> obj-m += foo.o
>>>>>
>>>>> ldflags-y += -T $(src)/kpatch.lds
>>>>> always-y += kpatch.lds
>>>>>
>>>>> foo-objs += bar.o
>>>>>
>>>>> all:
>>>>>          make -C /lib/modules/$(shell uname -r)/build M=$(PWD)
>>>>> clean:
>>>>>          make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
>>>>> _EOF_
>>>>>
>>>>> Take a look into scripts/Makefile.build:488:
>>>>>
>>>>> __build: $(if $(KBUILD_BUILTIN), $(targets-for-builtin)) \
>>>>>           $(if $(KBUILD_MODULES), $(targets-for-modules)) \
>>>>>           $(subdir-ym) $(always-y)
>>>>>          @:
>>>>>
>>>>> 'always-y' is built after 'targets-for-modules'. This makes
>>>>> 'targets-for-modules' fails because kpatch.lds isn't there.
>>>>
>>>>
>>>> Heh, you rely on the targets built from left to right,
>>>> and you have never thought Make supports the parallel option -j.
>>>
>>> You're right. I missed that.
>>>
>>>>
>>>>
>>>> You need to specify the dependency if you expect objects
>>>> are built in the particular order.
>>>>
>>>> However, in this case, using ldflags-y looks wrong
>>>> in the first place.
>>>>
>>>> The linker script is used when combining the object
>>>> as well as the final link of *.ko
>>
>> We want linker script to be used on both those steps, otherwise modpost
>> fails.
> 
> 
> In that case, does the following work?
> (untested)
> 
> 
> 
> diff --git a/kmod/patch/Makefile b/kmod/patch/Makefile
> index e017b17..02d4c66 100644
> --- a/kmod/patch/Makefile
> +++ b/kmod/patch/Makefile
> @@ -12,7 +12,9 @@ endif
> 
>   obj-m += $(KPATCH_NAME).o
>   ldflags-y += -T $(src)/kpatch.lds
> -extra-y := kpatch.lds
> +targets += kpatch.lds
> +
> +$(obj)/$(KPATCH_NAME).o: $(obj)/kpatch.lds
> 
>   $(KPATCH_NAME)-objs += patch-hook.o output.o
> 

Hi Masahiro,

Yeah this is more or less what Artem came up with:
https://github.com/dynup/kpatch/pull/1149

though we hadn't added kpatch.lds to targets.  Is there documentation 
somewhere on what effect "targets" has for out-of-tree builds?

Thanks,

-- Joe

