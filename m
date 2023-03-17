Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8095D6BE813
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Mar 2023 12:32:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229541AbjCQLcM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 Mar 2023 07:32:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjCQLcM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Mar 2023 07:32:12 -0400
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEADD39CE9;
        Fri, 17 Mar 2023 04:32:09 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id i9so4120530wrp.3;
        Fri, 17 Mar 2023 04:32:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679052728;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pokBorB33YnYWBtMSchGyHYZy6+UIAXs0bkjjq7SoP4=;
        b=ELSYU5aqHgXiH/Ra8htlX5AOwU61cVa6+JdwlL3Ux3XqGZTZGE0n9RUstIjnf6G8By
         zzi37KJZ+GvhcZksV9NsDSgahzdLsF8QKURGTqgCj9kBWbnIy0ou7bbghxcgUdlmD4JB
         jFgUkEbvzKWZJSCHXN3kbZRIYtKNpSXoTGD91rNic0NDrxBCpR52RdoB/sAH8ub521hQ
         SD+QNVAuu2fyJyxXfDf4mr87EqFlIS2+LDgQmNl3fLRGrumXnMqsk6exK5JCwzeSrTlz
         qa+6U7ZZDGRxUFf9ND/khspL8qRDki8WQVGiieaEkhBQ/6TR7/CIR9cyTz6wMhuXgpgK
         yIlQ==
X-Gm-Message-State: AO0yUKUHh9/qxkj40vfyTcTbOY1ViXtnp0rs+iVF74GYD7CQiOEQRZX9
        XTlqPR7m5lpTYs4Pd14k1fUJvVvRCQyPAA==
X-Google-Smtp-Source: AK7set+38hNek1SWZ5K27z7yb9JStMWOwMUmWROBuMGTf1E7CbKhvZ3VboMhKOT7Vv24lgNgaAFkuw==
X-Received: by 2002:adf:fd89:0:b0:2c5:c4c9:515a with SMTP id d9-20020adffd89000000b002c5c4c9515amr6121589wrr.51.1679052728164;
        Fri, 17 Mar 2023 04:32:08 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:49? ([2a0b:e7c0:0:107::aaaa:49])
        by smtp.gmail.com with ESMTPSA id q7-20020adff947000000b002d419f661d6sm213887wrr.82.2023.03.17.04.32.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 04:32:07 -0700 (PDT)
Message-ID: <cbacf815-eed9-8822-8b54-b7a7cf2169bf@kernel.org>
Date:   Fri, 17 Mar 2023 12:32:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Vasily Gorbik <gor@linux.ibm.com>
Cc:     Joe Lawrence <joe.lawrence@redhat.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sumanth Korikkar <sumanthk@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        linux-kbuild@vger.kernel.org
References: <8569429d-57f8-a0cf-8b17-1291f6973d32@redhat.com>
 <cover.thread-d13b6c.your-ad-here.call-01656331067-ext-4899@work.hours>
 <patch-2.thread-d13b6c.git-d13b6c96fb5f.your-ad-here.call-01656331067-ext-4899@work.hours>
 <705ce64c-5f73-2ec8-e4bc-dd48c85f0498@kernel.org>
 <your-ad-here.call-01679051845-ext-2019@work.hours>
From:   Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH 2/2] s390/nospec: remove unneeded header includes
In-Reply-To: <your-ad-here.call-01679051845-ext-2019@work.hours>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 17. 03. 23, 12:17, Vasily Gorbik wrote:
> On Thu, Mar 16, 2023 at 12:14:27PM +0100, Jiri Slaby wrote:
>> On 27. 06. 22, 14:50, Vasily Gorbik wrote:
>>> With that, expoline.S doesn't require asm-offsets.h and
>>> expoline_prepare target dependency could be removed.
>>>
>>> +++ b/arch/s390/Makefile
>>> @@ -166,7 +166,7 @@ vdso_prepare: prepare0
>>>    ifdef CONFIG_EXPOLINE_EXTERN
>>>    modules_prepare: expoline_prepare
>>> -expoline_prepare: prepare0
>>> +expoline_prepare:
>>
>> this likely broke s390 build as expolines still depend on
>> scripts/basic/fixdep. And build of expolines can now race with fixdep build:
>>       make[1]: *** Deleting file 'arch/s390/lib/expoline/expoline.o'
>>       /bin/sh: line 1: scripts/basic/fixdep: Permission denied
>>       make[1]: *** [../scripts/Makefile.build:385:
>> arch/s390/lib/expoline/expoline.o] Error 126
>>       make: *** [../arch/s390/Makefile:166: expoline_prepare] Error 2
>>
>> I returned there:
>>    expoline_prepare: prepare0
>> and it looks good so far. Maybe even:
>>    expoline_prepare: scripts
>> would be enough.
> 
> Hi Jiri, thanks for looking into this!
> 
> Probably even scripts_basic would be enough to add explicit dependency
> to fixdep. But I just couldn't reproduce missing scripts/basic/fixdep
> neither with modules_prepare nor expoline_prepare targets.

Hi,

yes, I could not reproduce locally too. It likely needs a "slow" and 
sort of specific machine to happen. This happened randomly only on SUSE 
build systems. And only on the internal ones. There are no failures on 
public ones:
https://build.opensuse.org/packages/kernel-default/job_history/Kernel:stable/S390/s390x

The kernel is built as:
make prepare # builds scripts/basic and other stuff we use
make clean # remove all but scripts and config
make all # scripts/basic/fixdep is rebuilt

fixdep is rebuilt due to clean-ed .fixdep.o.cmd -- that one is 
regenerated and fixdep built anew.

The whole process (make log) is dumped at:
https://build.opensuse.org/package/live_build_log/Kernel:stable/kernel-default/S390/s390x

> With which specific build command were you able to get those error
> messages? I wonder where
>          make[1]: *** Deleting file 'arch/s390/lib/expoline/expoline.o'
> is coming from. Could it be smth like?

It's from make after the build (fixdep invocation) failure. So that 
stale files do not exist.

Note that fixdep likely exist, but it is a stub -- linking phase still runs.

> make ARCH=s390 CROSS_COMPILE=s390x-12.2.0- -j64 arch/s390/lib/expoline/expoline.o
> 
> Playing around with this build target I found it is broken:
> 
>    AS      arch/s390/lib/expoline/expoline.o
>    AS      arch/s390/lib/expoline/expoline.o
> fixdep: error opening file: arch/s390/lib/expoline/.expoline.o.d: No such file or directory
> make[3]: *** [scripts/Makefile.build:374: arch/s390/lib/expoline/expoline.o] Error 2
> make[3]: *** Deleting file 'arch/s390/lib/expoline/expoline.o'
> make[2]: *** [scripts/Makefile.build:494: arch/s390/lib/expoline] Error 2
> make[1]: *** [scripts/Makefile.build:494: arch/s390/lib] Error 2
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:2028: .] Error 2
> 
> Notice dup AS call, which is probably causing this:
> make[3]: *** Deleting file 'arch/s390/lib/expoline/expoline.o'
> 
> But that would be a different issue from the one you are trying to fix.

Likely.

thanks,
-- 
js

