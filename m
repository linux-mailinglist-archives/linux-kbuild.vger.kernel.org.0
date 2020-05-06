Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 831A31C75A7
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 May 2020 18:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729668AbgEFQDu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 6 May 2020 12:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729251AbgEFQDu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 May 2020 12:03:50 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F033C061A0F;
        Wed,  6 May 2020 09:03:50 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id hi11so1110989pjb.3;
        Wed, 06 May 2020 09:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qqZARmorsOpHN8PyQTGoLphEM6VEagTedq+q3mXm4L4=;
        b=u7KTht4BCugNHNEQqsoZwodHvEWwMCnq6AmjKfLy2ZFe6OoJ+nXM6DW3cDUW9c7vCs
         sROz4FQEifWtTxJhtjGlxsc5Hk4QOI4KlekNLpcDIVWgIe0Ns9ZR5ofhuoWKr+liTva8
         WZoPKJ4J1tLLCHEPpOXXAifH4I3ClzX8twQ20YYTtm02GNUuRP9gJIjP2rmE73WiZXcn
         fnV7W5ezKV7Is6X3bSD407OtGpqO9CyYIWaQLE/yxh2xeGsfhIDvzPrnFG99ijQvw/IM
         JfthfznM/7OKDQcjkGgeBLy9GgMDVh2YAkvf6N1dbuhNLviT4/EwgejawdeNrw15drn6
         SlyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qqZARmorsOpHN8PyQTGoLphEM6VEagTedq+q3mXm4L4=;
        b=WlJzrdtWuw2RQexx6fps0gxldwnmV9bRzlxPRJ5/B/vYbu3rcrqNMcabnKOo6ywN2O
         HPUAbQADrhboLLwPvQ2KBccF88rIt/IodDHYX44p5D6Dx2l/oODZDYjnRxy4oz99ON7w
         zXE8f0QrMq5JzTQ0GYvJy39leFyz728kvCSLJT259EiIfmuYDWSh23T9MujTAdTzr/m+
         KN85Q6TMmU41x7FrvSRVl6RGi14fXJkoX+AclIi4vgWo0ANEfkfkoLDQ/xilLRThOWcd
         gwL3kQ4SGU4EH5cbFxkt/uJS8M3ybuQr0qbxLkieu3fjjyWiisE7LuUjHrvwxyq7yDxu
         HPkQ==
X-Gm-Message-State: AGi0PubzE8LRZoMtvicmuxgDLGrOxciENqJaiCXxXY8fkoFAjtjuweiF
        g6doq65XzVM0krDec6Hg8Js=
X-Google-Smtp-Source: APiQypKvHvnlaVwZPPc/kSGyX9lTJu1CUdeBbhpUG+DAaK5TIRplfxbep3SiwO6eEiLxUVWnH6W00Q==
X-Received: by 2002:a17:90b:f13:: with SMTP id br19mr10132418pjb.153.1588781029555;
        Wed, 06 May 2020 09:03:49 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id o1sm5265320pjs.35.2020.05.06.09.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2020 09:03:48 -0700 (PDT)
Subject: Re: Proper use for linking foo.o_shipped after 69ea912fda74 ("kbuild:
 remove unneeded link_multi_deps")?
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
References: <cd20b888-7f3d-e7ff-8096-2cc8305a5107@gmail.com>
 <CAK7LNAR5TsnUn2n2nDFHywQyqCT7si840yE2nyuxx70AYj+nDQ@mail.gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <01279bfe-95a3-dbdb-3785-bd2d92dc4f95@gmail.com>
Date:   Wed, 6 May 2020 09:03:46 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNAR5TsnUn2n2nDFHywQyqCT7si840yE2nyuxx70AYj+nDQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 5/6/2020 7:37 AM, Masahiro Yamada wrote:
> On Wed, May 6, 2020 at 1:45 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>>
>> Hi Masahiro, Michal,
>>
>> While updating our systems from 4.9 to 5.4, we noticed that one of the
>> kernel modules that we build, which is done by linking an object that we
>> pre-compile out of Kbuild stopped working.
>>
>> I bisected it down to:
>>
>> commit 69ea912fda74a673d330d23595385e5b73e3a2b9 (refs/bisect/bad)
>> Author: Masahiro Yamada <yamada.masahiro@socionext.com>
>> Date:   Thu Oct 4 13:25:19 2018 +0900
>>
>>     kbuild: remove unneeded link_multi_deps
>>
>>     Since commit c8589d1e9e01 ("kbuild: handle multi-objs dependency
>>     appropriately"), $^ really represents all the prerequisite of the
>>     composite object being built.
>>
>>     Hence, $(filter %.o,$^) contains all the objects to link together,
>>     which is much simpler than link_multi_deps calculation.
>>
>>     Please note $(filter-out FORCE,$^) does not work here. When a single
>>     object module is turned into a multi object module, $^ will contain
>>     header files that were previously included for building the single
>>     object, and recorded in the .*.cmd file. To filter out such headers,
>>     $(filter %.o,$^) should be used here.
>>
>>     Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>>
>> and the linker now fails with the following:
>>
>> mkdir -p /home/florian/dev/lkm/.tmp_versions ; rm -f
>> /home/florian/dev/lkm/.tmp_versions/*
>>
>>   WARNING: Symbol version dump ./Module.symvers
>>            is missing; modules will have no dependencies and modversions.
>>
>> make -f ./scripts/Makefile.build obj=/home/florian/dev/lkm
>> (cat /dev/null;   echo kernel//home/florian/dev/lkm/hello.ko;) >
>> /home/florian/dev/lkm/modules.order
>>   ld -m elf_x86_64  -z max-page-size=0x200000    -r -o
>> /home/florian/dev/lkm/hello.o
>> ld: no input files
>> make[1]: *** [scripts/Makefile.build:492: /home/florian/dev/lkm/hello.o]
>> Error 1
>> make: *** [Makefile:1530: _module_/home/florian/dev/lkm] Error 2
>>
>> and here are some steps to reproduce this:
>>
>> Kbuild:
>> obj-m   := hello.o
>> hello-y := test.o_shipped
>>
>> test.c can be a simple hello world, and you can compile it using a
>> standard Kbuild file first, and then move test.o as test.o_shipped.
> 
> 
> 
> Why don't you do like this?
> 
> obj-m   := hello.o
> hello-y := test.o

I tried it in the original environment where it failed, not my contrived
test case, and this did not work, as we really need test.o and
test.o_shipped to be separate objects, doing what you suggest results in
a circular dependency.

To me this is a regression, as it used to work and now it does not, thus
we should be fixing it, any idea about how we go about it without doing
a plain revert?

Thank you!
-- 
Florian
