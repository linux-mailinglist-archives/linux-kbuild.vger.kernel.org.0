Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DCED40311A
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Sep 2021 00:35:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233817AbhIGWgP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Sep 2021 18:36:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347634AbhIGWe3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Sep 2021 18:34:29 -0400
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D104EC061575;
        Tue,  7 Sep 2021 15:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=bxPWNII6t/NMGO1fgxjyatCVjEuxKu/pncqEFjLY/38=; b=Ui1wNMHr1qisfggLyZY6EljOSh
        DaWVRD0Q5qi69FfBZ0WLKQakWxLm4gU4vxPk6Vji1flAFMLNy3B8/CFNn8a6c+s1RGYuxcksZ7smS
        P2L/f8NMosaY0ld2cM0fVt88682m9DlkZLwEHw2a6TRCaiGTmdQJ/gG7I0BNthhEkSM5jFJQs2aC5
        wFPYstbOO8DYLPxymIfy2C+443vPwmfXCwFZneCHFvwBvTP5J8E2S3DB15J1DSGYw2mH/iu0RdJ+K
        Gxs92jqjmNaQis/aeSs9pi+smE0kEve5rEiVsJvgfGc8QUaPRjEkCaVf/Xk04tgsm80VcTlluS4TP
        2LnK2jdw==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mNjea-004xPm-64; Tue, 07 Sep 2021 22:33:20 +0000
Subject: Re: [PATCH] Revert "Enable '-Werror' by default for all kernel
 builds"
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Marco Elver <elver@google.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-toolchains@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Kees Cook <keescook@chromium.org>,
        Mark Brown <broonie@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vipin Sharma <vipinsh@google.com>,
        Chris Down <chris@chrisdown.name>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Vlastimil Babka <vbabka@suse.cz>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210907183843.33028-1-ndesaulniers@google.com>
 <CAHk-=whJOxDefgSA1_ojGbweRJGonWX9_nihA-=fbXFV1DhuxQ@mail.gmail.com>
 <CAKwvOdkuYoke=Sa8Qziveo9aSA2zaNWEcKW8LZLg+d3TPwHkoA@mail.gmail.com>
 <YTfkO2PdnBXQXvsm@elver.google.com>
 <CAHk-=wgPaQsEr+En=cqCqAC_sWmVP6x5rD2rmZRomH9EnTQL7Q@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c8fb537f-26e5-b305-6bc5-06f0d27a4029@infradead.org>
Date:   Tue, 7 Sep 2021 15:33:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wgPaQsEr+En=cqCqAC_sWmVP6x5rD2rmZRomH9EnTQL7Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 9/7/21 3:18 PM, Linus Torvalds wrote:
> On Tue, Sep 7, 2021 at 3:14 PM Marco Elver <elver@google.com> wrote:
>>
>>
>>   config WERROR
>>          bool "Compile the kernel with warnings as errors"
>> -       default y
>> +       default COMPILE_TEST
> 
> That seems reasonable. It very much is about build-testing.

That and 2 more things IMO:

a. having developers be responsible for build warnings, not just
    build errors

b. having maintainers merge them more like they are build errors
    and not just some warnings that can be overlooked.

I don't see enough of a. or b.  :(

-- 
~Randy

