Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55BF336D04C
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Apr 2021 03:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232190AbhD1Bc6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 27 Apr 2021 21:32:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230425AbhD1Bc6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Apr 2021 21:32:58 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80FA7C061574
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Apr 2021 18:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=SqlHofKHbcf7zyddy4pQ8lzJWiN+AIC7N+ecIrU8yyQ=; b=VN50HrwCUXQ6XtB/L61qeQiBLF
        pYbCnotm+9lEmi1eVoioF4rQsIc9kW7gkTeM2OW43nwuypifKHqXR5aEyaUJmTXg4UIjE/ANBebBU
        Rwm1FglK7g5Gb5TpjHSySnksdg908yhwFtO2U6nmpDI/LHWKJABdf286EjewyQJ0fFFqh0bD6+bEZ
        eHU4CcoUtP1YgDTRsnjAWGhPg7XY4jjNhReqxVpTZZiRSxZAMqGA75NQIIO5mg/+Vz5Pg2NJvJb3l
        rji/OAwUKJ1dKvrv5KyT9lZrdMXX8pDcYXQ41S1lzngF/80ztM4M0a4xstefhm8FR5n3nQWJLlA61
        dvfZyLSA==;
Received: from [2601:1c0:6280:3f0::df68]
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lbZ3W-007h8P-Eb; Wed, 28 Apr 2021 01:32:06 +0000
Subject: Re: powerpc{32,64} randconfigs
From:   Randy Dunlap <rdunlap@infradead.org>
To:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>
References: <45afab41-cc5f-dffa-712a-d5fb1a9d0a23@infradead.org>
 <21339633-16cb-c2ec-1517-2f5c4897fba1@csgroup.eu>
 <c973768b-8fe5-a5a4-ccfc-ebc109b6eb80@infradead.org>
Message-ID: <fe9e2c87-60fb-0f15-f9d9-17d70930ff9a@infradead.org>
Date:   Tue, 27 Apr 2021 18:31:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <c973768b-8fe5-a5a4-ccfc-ebc109b6eb80@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 4/20/21 11:45 PM, Randy Dunlap wrote:
> On 4/20/21 11:37 PM, Christophe Leroy wrote:
>>
>>
>> Le 21/04/2021 à 01:31, Randy Dunlap a écrit :
>>> --- linux-next-20210420.orig/arch/powerpc/kernel/vdso64/Makefile
>>> +++ linux-next-20210420/arch/powerpc/kernel/vdso64/Makefile
>>> @@ -30,7 +30,7 @@ ccflags-y := -shared -fno-common -fno-bu
>>>   asflags-y := -D__VDSO64__ -s
>>>     targets += vdso64.lds
>>> -CPPFLAGS_vdso64.lds += -P -C -U$(ARCH)
>>> +CPPFLAGS_vdso64.lds += -P -C -U$(SRCARCH)
>>
>> Maybe it would be better to do -Upowerpc like in VDSO32
>>
> 
> OK, thanks for getting that done. :)
> 
>>>     # link rule for the .so file, .lds has to be first
>>>   $(obj)/vdso64.so.dbg: $(src)/vdso64.lds $(obj-vdso64) $(obj)/vgettimeofday.o FORCE
>>> --- linux-next-20210420.orig/arch/powerpc/Makefile

Just to wrap this up, I got this method working also.
Thanks for all of your help, Christophe.

-- 
~Randy

