Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C691332FA3
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Mar 2021 21:11:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231358AbhCIULV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Mar 2021 15:11:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbhCIULJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Mar 2021 15:11:09 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3EB7C06174A
        for <linux-kbuild@vger.kernel.org>; Tue,  9 Mar 2021 12:11:06 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id b13so22924667edx.1
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Mar 2021 12:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=B8/32gF659TPX/5eYINA0NMCAB5fgPljLbGnRiQdnYg=;
        b=HEUDvkWM2OFBGBu29IvnFBmfS+Gt2wCcZJ/ayUsAC2S6N/N3L0CEVfF8qcDiEZ0AXP
         yPaPwm2PuvzIkmjPIxP+8C2RzdkJafbpT21pQRp8egSQoDuXR9U+3h1eKNGpCPFNxyJL
         mLYAONdRQZayyLUWco/a6BRNXKafSz4PWZQoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B8/32gF659TPX/5eYINA0NMCAB5fgPljLbGnRiQdnYg=;
        b=CkaLOduB4BTRfUX/LR8ANyDFYKMPlLQHoIk/tQSeELVVBGDcbYeZrRtLm53E9anhGF
         L29rnzaVKPVR5HellJQZauV/O/uqZEHz744M6b5zdC5RSKWSFMsDPZy1/mMx+8hphURw
         LY470Ad9NEZdtfR7St6xR5x1Z/buvHNdwGxk0CG7G1ESviAldElb5THJ2mFNRqnEoIBV
         QtC7zrhBqtwOzZCxqEmbiYwOqgxiwExugcw60sjLsppOO0SEu88U5paDgzDyNIWRl2BB
         qZ91LDH+G8D5X3hGVfu5iY5bT+eMyynwSn3gN0Z+JIdMl9TSJbo0zuw+ezbkMGNbwHPG
         AhFA==
X-Gm-Message-State: AOAM531AJT0JbuFSqbbOElCmlv81ppSHN6wo93wsa0RTPsdw9vcV04NG
        tNYOa8ocGWxFbNotF/yeRjHekg==
X-Google-Smtp-Source: ABdhPJxaL4O3pJaCdNKg0mD1df/BfGKBvhhC7MuO0ig6LMNEdhKG/JlMLI/ZYh2CLH9LXjPM30SYAw==
X-Received: by 2002:a05:6402:350f:: with SMTP id b15mr6186693edd.6.1615320665265;
        Tue, 09 Mar 2021 12:11:05 -0800 (PST)
Received: from [192.168.1.149] ([80.208.71.248])
        by smtp.gmail.com with ESMTPSA id t6sm9275838edq.48.2021.03.09.12.11.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Mar 2021 12:11:04 -0800 (PST)
Subject: Re: [PATCH v2 3/4] kbuild: re-implement CONFIG_TRIM_UNUSED_KSYMS to
 make it work in one-pass
To:     Nicolas Pitre <nico@fluxnic.net>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Jessica Yu <jeyu@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>
References: <20210309151737.345722-1-masahiroy@kernel.org>
 <20210309151737.345722-4-masahiroy@kernel.org>
 <354sr3np-67o8-oss9-813s-p2qoro06p4o@syhkavp.arg>
 <CAK7LNAS97kTsOW_RSy1ZL2P5Q+5Hh05qvE4KwSVkvrhkzb3Shg@mail.gmail.com>
 <2o2rpn97-79nq-p7s2-nq5-8p83391473r@syhkavp.arg>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <fb8af488-8137-d628-b1c4-983b9ab153a3@rasmusvillemoes.dk>
Date:   Tue, 9 Mar 2021 21:11:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <2o2rpn97-79nq-p7s2-nq5-8p83391473r@syhkavp.arg>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 09/03/2021 20.54, Nicolas Pitre wrote:
> On Wed, 10 Mar 2021, Masahiro Yamada wrote:
> 

>>> I'm not sure I do understand every detail here, especially since it is
>>> so far away from the version that I originally contributed. But the
>>> concept looks good.
>>>
>>> I still think that there is no way around a recursive approach to get
>>> the maximum effect with LTO, but given that true LTO still isn't applied
>>> to mainline after all those years, the recursive approach brings
>>> nothing. Maybe that could be revisited if true LTO ever makes it into
>>> mainline, and the desire to reduce the binary size is still relevant
>>> enough to justify it.
>>
>> Hmm, I am confused.
>>
>> Does this patch change the behavior in the
>> combination with the "true LTO"?
>>
>> Please let me borrow this sentence from your article:
>> "But what LTO does is more like getting rid of branches that simply
>> float in the air without being connected to anything or which have
>> become loose due to optimization."
>> (https://lwn.net/Articles/746780/)
>>
>> This patch throws unneeded EXPORT_SYMBOL metadata
>> into the /DISCARD/ section of the linker script.
>>
>> The approach is different (preprocessor vs linker), but
>> we will still get the same result; the unneeded
>> EXPORT_SYMBOLs are disconnected from the main trunk.
>>
>> Then, the true LTO will remove branches floating in the air,
>> right?
>>
>> So, what will be lost by this patch?
> 
> Let's say you have this in module_foo:
> 
> int foo(int x)
> {
> 	return 2 + bar(x);
> }
> EXPORT_SYMBOL(foo);
> 
> And module_bar:
> 
> int bar(int y)
> {
> 	return 3 * baz(y);
> }
> EXPORT_SYMBOL(bar);
> 
> And this in the main kernel image:
> 
> int baz(int z)
> {
> 	return plonk(z);
> }
> EXPORT_SYMBOLbaz);
> 
> Now we build the kernel and modules. Then we realize that nothing 
> references symbol "foo". We can trim the "foo" export. But it would be 
> necessary to recompile module_foo with LTO (especially if there is 
> some other code in that module) to realize that nothing 
> references foo() any longer and optimize away the reference to bar(). 

But, does LTO even do that to modules? Sure, the export metadata for foo
vanishes, so there's no function pointer reference to foo, but given
that modules are just -r links, the compiler/linker can't really assume
that the generated object won't later be linked with something that does
require foo? At least for the simpler case of --gc-sections, ld docs say:

'--gc-sections'
...

    This option can be set when doing a partial link (enabled with
     option '-r').  In this case the root of symbols kept must be
     explicitly specified either by one of the options '--entry',
     '--undefined', or '--gc-keep-exported' or by a 'ENTRY' command in
     the linker script.

and I would assume that for LTO, --gc-keep-exported would be the only
sane semantics (keep any external symbol with default visibility).

Can you point me at a tree/set of LTO patches and a toolchain where the
previous implementation would actually eventually eliminate bar() from
module_bar?

Rasmus
