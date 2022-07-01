Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC00D563BD5
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Jul 2022 23:39:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231381AbiGAVjJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 Jul 2022 17:39:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230438AbiGAVjI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Jul 2022 17:39:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 37E5C326EA
        for <linux-kbuild@vger.kernel.org>; Fri,  1 Jul 2022 14:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656711546;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RWY3kWxfZygCbZ8DtFwvJsuIX94AnJvjrbxbBhzFyp4=;
        b=WgD6eiNiteMIsOTMVC6QjCUApRKASb4W05zDLhWs141PqKBixrTPXnl4Pg0xhidvSq3M7H
        eXsBX2iR/QPub8zDpHjrNZ9xpZVykDaGVIr0QQc6Wd3WGesltOaUlAsvya/J95s7r+6f3M
        r2B5XCJ6972s+dm+FqakmGZ3zcLz/Gs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-HvQC4i-aPKGMc9mJH5zbTg-1; Fri, 01 Jul 2022 17:39:05 -0400
X-MC-Unique: HvQC4i-aPKGMc9mJH5zbTg-1
Received: by mail-qk1-f197.google.com with SMTP id g194-20020a379dcb000000b006aef700d954so2903466qke.1
        for <linux-kbuild@vger.kernel.org>; Fri, 01 Jul 2022 14:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RWY3kWxfZygCbZ8DtFwvJsuIX94AnJvjrbxbBhzFyp4=;
        b=ZdE2NYLVCsDUG2J6DK+irGPoYVWGVqq1fikWygrYA/3+y93AxPVR9feULMcexLnBcp
         SiHnsHiC9thSXnwPnH4xgCMFHCks5R/mwIxmuy4r5Sl1tA6AfNJLPVvjZE86gIvmX6jf
         h25/Kxc5GbiXLcHstqO6TGS1NMgWsgGdzkpYLOzn9Ay+X0E4XPeJUtXwlmpkofk4ZzJf
         pF62S2hWL9s/8XrzCw4AP0+pX8wCaeZsI5xRqGrExtHSTSUqxHIaTRuZ9aRDa96n7iMv
         gM+gZcDIgJSDOrhoCqX0oySavnm10jH+4ApPidY9gMACWxSdma/OPLyYDLHcVEmXLAXi
         H1mg==
X-Gm-Message-State: AJIora/7TE4lvoCNHZr+CWH9kWHX+6s/9bRVXR+463749FFtAMapyoQ5
        CccbTsfNvW7dyog2Atl11UpOil48Yr9SmF+KFEUuw/ln9xZK7LTdqFWGU4Uy5UA44YScdhqHcFz
        nZNQR5OgOmUPvYTXPZnThmSe/
X-Received: by 2002:ac8:57d1:0:b0:31d:3e00:dfdc with SMTP id w17-20020ac857d1000000b0031d3e00dfdcmr433305qta.333.1656711544775;
        Fri, 01 Jul 2022 14:39:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1swwmfVne4y/EzBvAQUyOuDYKIvABxh4t28wun3l/7w/cFJFvRpsGUKAMgz1On+sBS7lX82sg==
X-Received: by 2002:ac8:57d1:0:b0:31d:3e00:dfdc with SMTP id w17-20020ac857d1000000b0031d3e00dfdcmr433279qta.333.1656711544426;
        Fri, 01 Jul 2022 14:39:04 -0700 (PDT)
Received: from [192.168.1.9] (pool-68-163-101-245.bstnma.fios.verizon.net. [68.163.101.245])
        by smtp.gmail.com with ESMTPSA id q23-20020a37f717000000b006b249cc505fsm3503936qkj.82.2022.07.01.14.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 14:39:03 -0700 (PDT)
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
 <ad6a926e-eed1-a5e2-9f8b-0ea1599bbaed@redhat.com>
 <CAPQ7N1RFyZRCJZc84UxjSQj44ksa6f6ib5B=dVwoqMU9_=s8QA@mail.gmail.com>
From:   Joe Lawrence <joe.lawrence@redhat.com>
Message-ID: <e853268a-3e0a-3a88-331b-53c74e8796d6@redhat.com>
Date:   Fri, 1 Jul 2022 17:39:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAPQ7N1RFyZRCJZc84UxjSQj44ksa6f6ib5B=dVwoqMU9_=s8QA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 7/1/22 5:18 PM, C. Erastus Toe wrote:
> On Wed, Jun 29, 2022 at 11:16 AM Joe Lawrence <joe.lawrence@redhat.com
> <mailto:joe.lawrence@redhat.com>> wrote:
> 
>     On 6/27/22 8:50 AM, Vasily Gorbik wrote:
>     > Hi Joe,
>     >
>     > sorry for late reply.
>     >
>     >> I couldn't find the upstream patch post for 1d2ad084800e
>     ("s390/nospec:
>     >> add an option to use thunk-extern"), so replying off-list here.  Feel
>     >> free to cc the appropriate list.
>     >>
>     >> Regarding this change, as I understand it, when
>     CONFIG_EXPOLINE_EXTERN=y
>     >> out-of-tree kernel modules will need to link against
>     >> arch/s390x/lib/expoline.o, right?
>     >>
>     >> And if so, shouldn't the top level 'prepare_modules' target create
>     >> expoline.o for this purpose?
>     >
>     > Thanks for bringing this up. I definitely missed out-of-tree
>     kernel modules
>     > build case without a prebuilt kernel. On the other hand this
>     post-linking
>     > trick is a rip off from powerpc:
>     >
>     > KBUILD_LDFLAGS_MODULE += arch/powerpc/lib/crtsavres.o
>     >
>     > So, now I wonder why powerpc doesn't have crtsavres.o in
>     'prepare_modules'.
>     >
>     > Anyhow, below is couple of patches to consider. The first one is
>     > meant to be backportable, as the second one requires 4efd417f298b.
>     >
>     > I had to move expoline.S to a separate directory to be able to
>     call into
>     > its Makefile for 'prepare_modules' and avoid warnings for other
>     targets
>     > defined in the same Makefile. Not sure if there are better kbuild
>     tricks
>     > I could use. Another option I thought about is to keep expoline.S
>     where
>     > it is and add a condition into that Makefile:
>     > expoline_prepare: prepare0
>     >       $(Q)$(MAKE) $(build)=arch/s390/lib expoline_prepare=1
>     arch/s390/lib/expoline.o
>     >
>     > arch/s390/lib/Makefile:
>     > # first target defined
>     > obj-$(CONFIG_EXPOLINE_EXTERN) += expoline.o
>     > ifndef expoline_prepare
>     > # ...other targets...
>     >
>     > Vasily Gorbik (2):
>     >   s390/nospec: build expoline.o for modules_prepare target
>     >   s390/nospec: remove unneeded header includes
>     >
>     >  arch/s390/Makefile                      | 8 +++++++-
>     >  arch/s390/include/asm/nospec-insn.h     | 2 --
>     >  arch/s390/lib/Makefile                  | 3 ++-
>     >  arch/s390/lib/expoline/Makefile         | 3 +++
>     >  arch/s390/lib/{ => expoline}/expoline.S | 0
>     >  5 files changed, 12 insertions(+), 4 deletions(-)
>     >  create mode 100644 arch/s390/lib/expoline/Makefile
>     >  rename arch/s390/lib/{ => expoline}/expoline.S (100%)
>     >
> 
>     Thanks, Vasily.  We'll test these with OOT and the original gitlab
>     pipeline where we spotted potential issue with packaging and report
>     back.
> 
> Hi, 
> 
> Successfully tested the first patch in a rhel-9 backport. (had to skip
> the second as it has dependencies on other patches like [1] that
> deprecated symbols like __LC_BR_R1. Without those, the build resulted in
> a flood of: depmod: WARNING: <module>.ko needs unknown symbol __LC_BR_R1.)
> 
> For ("s390/nospec: build expoline.o for modules_prepare target"), 
> Tested-by: C. Erastus Toe <ctoe@redhat.com <mailto:ctoe@redhat.com>> 
> 
> [1] 4efd417f298b ("s390: raise minimum supported machine generation to z10")
> 

And then for the entire series (tested on top of v5.19-rc4),
Tested-by: Joe Lawrence <joe.lawrence@redhat.com>

-- 
Joe

