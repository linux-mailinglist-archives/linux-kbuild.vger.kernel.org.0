Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06978560445
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Jun 2022 17:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231501AbiF2PQS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 29 Jun 2022 11:16:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232755AbiF2PQS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Jun 2022 11:16:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5B634D53
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Jun 2022 08:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656515776;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+wuv2Q4SapFEU9YAsP/MbzK2Zmj8ccNhg61UhoKXdRY=;
        b=Rw56Y0+ZRCqoHYenVSpXslBxUxfVpZJ9w3C9J0Sfhm3XYA9GwwNA+4+X/X1JFP8/RWYDnB
        /Kx3Y2PSQVr0jMzxC7JMF4JWn+A9kte23v7ZLyIf3VjJAiQl+idvk3pKQ8lNXlGG7ipxKf
        eqQm6ZcuBGvJVdfFjEF2SIEJD0knL/Q=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-9s7IqdVCPwmkiAR8PyuMog-1; Wed, 29 Jun 2022 11:16:15 -0400
X-MC-Unique: 9s7IqdVCPwmkiAR8PyuMog-1
Received: by mail-qk1-f198.google.com with SMTP id de4-20020a05620a370400b006a9711bd9f8so16497745qkb.9
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Jun 2022 08:16:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+wuv2Q4SapFEU9YAsP/MbzK2Zmj8ccNhg61UhoKXdRY=;
        b=PGkXkeOz/Bo+NRXMYv9dKcZG7GFkfQ8tbXrVDLXOVJNUHN/57GvYj0KqDNJq0T5Bb+
         3UKWckY0iSMCn0cnlhTreycmsf+z3HSO2Wp16PqcVB0yx0/xWxfS3M9v+Ohr5wl0g/A/
         Q0rRr1GYV1rB4mm5E3LCSMzGaVSGXnyjN4ID0XlgqMty2mtRqQ5ty5Se2cNw5Nhwm6JL
         ABC67W2PtEqgZpCDyeGpiGusXnsEYkQ4sphHBUugMvgwRLL4RnnaXh+OvqMleI3hL3yc
         8Ml80IPqOOsO6npxVvgppnlDCrwJWO0EXj/VVJUa1mjLN/a+kBS6k1lpeUOOFfdlFTUe
         2vzw==
X-Gm-Message-State: AJIora8AFgNGS3XLlnJv4LbqFj/nMlEH8RQT/3euGhEyrtSjqlvEOOMn
        PvtsHsv2T0zU7vAvpq4alqH8M8WlXAzAkpVMOZ3dXVCqa8QOGQa/UH7bi7z2Q1QB5g6/eTM5K/+
        W3Qpg0vDn/6BSIid2cQ5xzvjI
X-Received: by 2002:a05:620a:448a:b0:6af:39e9:c31 with SMTP id x10-20020a05620a448a00b006af39e90c31mr2478062qkp.9.1656515774373;
        Wed, 29 Jun 2022 08:16:14 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1utDyZu7vSMk4vpgIU4ljG9sMhYDfbT33tgD05fOPGbeD7Temlasyp8Dn/Nsd0fD8qv9w7DAQ==
X-Received: by 2002:a05:620a:448a:b0:6af:39e9:c31 with SMTP id x10-20020a05620a448a00b006af39e90c31mr2478019qkp.9.1656515774074;
        Wed, 29 Jun 2022 08:16:14 -0700 (PDT)
Received: from [192.168.1.9] (pool-68-163-101-245.bstnma.fios.verizon.net. [68.163.101.245])
        by smtp.gmail.com with ESMTPSA id a20-20020a05620a16d400b0069fe1dfbeffsm13269517qkn.92.2022.06.29.08.16.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 08:16:13 -0700 (PDT)
Subject: Re: s390/nospec: add an option to use thunk-extern
To:     Vasily Gorbik <gor@linux.ibm.com>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        Sumanth Korikkar <sumanthk@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        linux-kbuild@vger.kernel.org, "C. Erastus Toe" <ctoe@redhat.com>
References: <8569429d-57f8-a0cf-8b17-1291f6973d32@redhat.com>
 <cover.thread-d13b6c.your-ad-here.call-01656331067-ext-4899@work.hours>
From:   Joe Lawrence <joe.lawrence@redhat.com>
Message-ID: <ad6a926e-eed1-a5e2-9f8b-0ea1599bbaed@redhat.com>
Date:   Wed, 29 Jun 2022 11:16:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <cover.thread-d13b6c.your-ad-here.call-01656331067-ext-4899@work.hours>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 6/27/22 8:50 AM, Vasily Gorbik wrote:
> Hi Joe,
> 
> sorry for late reply.
> 
>> I couldn't find the upstream patch post for 1d2ad084800e ("s390/nospec:
>> add an option to use thunk-extern"), so replying off-list here.  Feel
>> free to cc the appropriate list.
>>
>> Regarding this change, as I understand it, when CONFIG_EXPOLINE_EXTERN=y
>> out-of-tree kernel modules will need to link against
>> arch/s390x/lib/expoline.o, right?
>>
>> And if so, shouldn't the top level 'prepare_modules' target create
>> expoline.o for this purpose?
> 
> Thanks for bringing this up. I definitely missed out-of-tree kernel modules
> build case without a prebuilt kernel. On the other hand this post-linking
> trick is a rip off from powerpc:
> 
> KBUILD_LDFLAGS_MODULE += arch/powerpc/lib/crtsavres.o
> 
> So, now I wonder why powerpc doesn't have crtsavres.o in 'prepare_modules'.
> 
> Anyhow, below is couple of patches to consider. The first one is
> meant to be backportable, as the second one requires 4efd417f298b.
> 
> I had to move expoline.S to a separate directory to be able to call into
> its Makefile for 'prepare_modules' and avoid warnings for other targets
> defined in the same Makefile. Not sure if there are better kbuild tricks
> I could use. Another option I thought about is to keep expoline.S where
> it is and add a condition into that Makefile:
> expoline_prepare: prepare0
> 	$(Q)$(MAKE) $(build)=arch/s390/lib expoline_prepare=1 arch/s390/lib/expoline.o
> 
> arch/s390/lib/Makefile:
> # first target defined
> obj-$(CONFIG_EXPOLINE_EXTERN) += expoline.o
> ifndef expoline_prepare
> # ...other targets...
> 
> Vasily Gorbik (2):
>   s390/nospec: build expoline.o for modules_prepare target
>   s390/nospec: remove unneeded header includes
> 
>  arch/s390/Makefile                      | 8 +++++++-
>  arch/s390/include/asm/nospec-insn.h     | 2 --
>  arch/s390/lib/Makefile                  | 3 ++-
>  arch/s390/lib/expoline/Makefile         | 3 +++
>  arch/s390/lib/{ => expoline}/expoline.S | 0
>  5 files changed, 12 insertions(+), 4 deletions(-)
>  create mode 100644 arch/s390/lib/expoline/Makefile
>  rename arch/s390/lib/{ => expoline}/expoline.S (100%)
> 

Thanks, Vasily.  We'll test these with OOT and the original gitlab
pipeline where we spotted potential issue with packaging and report back.

-- 
Joe

