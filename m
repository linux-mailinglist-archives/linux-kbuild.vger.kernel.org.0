Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13CF725617E
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Aug 2020 21:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbgH1Tpr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 28 Aug 2020 15:45:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725969AbgH1Tpr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Aug 2020 15:45:47 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2086EC061264
        for <linux-kbuild@vger.kernel.org>; Fri, 28 Aug 2020 12:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=8PD1/BpWIslNswVVkVaTPc5yN2SEZqOXPj0yWOEuEfg=; b=1II6VGylHmYMayF8THV7nintSS
        SXR08N9dXuR7D7meL9PZjVs7PFOuh1SSrwtcgYZVG419aVEd/icMipnklfiCO8zQ/q6QWJl6GT4vZ
        P6SuxuUGAE7CERIQN/L6SkLn01sa8mU+XYpIQb4tnVe4upqkNlfE2Y9AWVpBlM8919wWvMUP+eGjG
        icoq3gkn6l8JqNz5RwW/C446BSjCqVQl5FH+y6SFrMhF5yQFZ1puvEDttT16K1U2ll62EM+MAWEkv
        r+FRWm65el5/MB9bBuPeeeAlJn3JwtcUCXErYEEeNXoIdkLYz8YKnPjkuTZZ9uLd0TXzGZEl3nw0l
        ZP4ONiag==;
Received: from [2601:1c0:6280:3f0::19c2]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kBkJk-0001a1-BQ; Fri, 28 Aug 2020 19:45:45 +0000
Subject: Re: ia64 kbuild warning message
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>
References: <9c333a75-a851-a055-e879-0967c32e2300@infradead.org>
 <CAK7LNAQ25mHHZJaShczfiS=YiZ77EqhjX5QaYubpyPE2Axw4vw@mail.gmail.com>
 <CAK7LNAQidMqfmECAGu-2aVNCcLkV0iuV-ZHkCZG++t5v2KRyGQ@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <1eb5107c-83ea-4d7e-08e1-8f19f1218542@infradead.org>
Date:   Fri, 28 Aug 2020 12:45:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQidMqfmECAGu-2aVNCcLkV0iuV-ZHkCZG++t5v2KRyGQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 8/28/20 12:34 PM, Masahiro Yamada wrote:
> On Sat, Aug 29, 2020 at 2:41 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>>
>> On Sat, Aug 29, 2020 at 1:34 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>>>
>>> Hi Yamada-san,
>>>
>>> I am seeing this on ia64 builds:
>>>
>>> ../scripts/Makefile.build:68: 'arch/ia64/kernel/palinfo.ko' will not be built even though obj-m is specified.
>>> ../scripts/Makefile.build:69: You cannot use subdir-y/m to visit a module Makefile. Use obj-y/m instead.
>>>
>>> with CONFIG_IA64_PALINFO=y
>>>
>>> Can you explain, please?
>>>
>>
>>
>> This warning is emitted in the archprepare stage.
>>
>>
>> The following code in arch/ia64/Makefile:
>>
>> make_nr_irqs_h:
>>         $(Q)$(MAKE) $(build)=arch/ia64/kernel include/generated/nr-irqs.h
>>
>>
>>
>> I am wondering if we could merge
>> arch/ia64/kernel/nr-irqs.c into
>> arch/ia64/kernel/asm-offsets.c
> 
> 
> 
> OK, I figured out how to clean this up.
> 
> I will send a patch set tomorrow.
> For now, I need some sleep.

Sounds good.

thanks.

-- 
~Randy

