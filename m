Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2CC2409748
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Sep 2021 17:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344766AbhIMPaM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 13 Sep 2021 11:30:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344279AbhIMPaJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Sep 2021 11:30:09 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41BCFC08ED6E;
        Mon, 13 Sep 2021 07:33:36 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id v20-20020a4a2554000000b0028f8cc17378so3466087ooe.0;
        Mon, 13 Sep 2021 07:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XUePaOFAdB0VXNdn0M/EZEaFLP4il2XD0ts+H5PH8PQ=;
        b=jvxav826u7+YbApk1RbeOlY7+A0oJEMn0vmZN7A6Ve1CJNpxHWRPTLQlGD/PDPkPL8
         zB2xBAnWvgv/ZTqY5ZrLdR1RkHQgcjy5c6hTyEPzCzlXDcXHTDbaJHrCAqZoQWPn9+uO
         /Ic/fvpf8qRg9yRjP8i6wnqMHSI5YK+9WlvDJ7UINjYwUeXCR3KXask393vrk2fgqYdK
         E33bmtr0tmfRMo8xN3bszBq99uma3sSgVpZofVLy4306y5jkc//ghaZNMKa5416qeUXb
         aju2zufOoJIIN5KBdTcxFwLJ25yqpIWPSppBGsTU8YkJ+uxGgZ2j7xlwjEE2+1ON/rcd
         WduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XUePaOFAdB0VXNdn0M/EZEaFLP4il2XD0ts+H5PH8PQ=;
        b=Jo7nfuRzjkdsvIiip0Vyuul9t+sn4XRS4JOEp3DcWB5AaDnZGu2Ia/deTyhqpRvM2o
         cqH7L458F5VjzLS+5pAGKb+MU3tSeF6wj3XblatHVMJA8sgN776a+r+vKZrvQvhwnGsO
         etCD8qhh1lm9OmP3Fkbm+vo9j60K/H9ezoYjeUAGlRqCukRr8pNTK3Da/NpJU7kX68zt
         R4vAAJiyJCkkIGOWXEBG0x9hX0T+tGcEnRhArPFT/chqIdGK/hkkzN+g7J2XhFP2XzUo
         yksgxDrYPUQIlb1uL0yMR/Xv5e5M/Ct21rQ/dpwDPwbi6NrpwBwbcojkX+VyoI5hc1yL
         GPDg==
X-Gm-Message-State: AOAM533dOFB96gv9fbS2020DBLYow3NlY++QRYGwFsiCjlpVITvm7/Ng
        o5qm5FqgC0ZmYkwXTAp+HrlCzDlSDSE=
X-Google-Smtp-Source: ABdhPJyF+2Z9z/XFqRvANUemzJMbtHjkk9GypcMxmGa0E4m13O0vPoiaDgLsezFcw91jm4YhvuQpBQ==
X-Received: by 2002:a4a:4b42:: with SMTP id q63mr9739186ooa.78.1631543615431;
        Mon, 13 Sep 2021 07:33:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v10sm1900359otp.25.2021.09.13.07.33.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 07:33:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] Revert "Enable '-Werror' by default for all kernel
 builds"
To:     Pavel Machek <pavel@ucw.cz>, Randy Dunlap <rdunlap@infradead.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Marco Elver <elver@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        llvm@lists.linux.dev,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-toolchains@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
 <c8fb537f-26e5-b305-6bc5-06f0d27a4029@infradead.org>
 <20210913093256.GA12225@amd>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <62c6b091-12ad-a1f0-637c-f696c7dae325@roeck-us.net>
Date:   Mon, 13 Sep 2021 07:33:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210913093256.GA12225@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 9/13/21 2:32 AM, Pavel Machek wrote:
> Hi!
> 
>>>>   config WERROR
>>>>          bool "Compile the kernel with warnings as errors"
>>>> -       default y
>>>> +       default COMPILE_TEST
>>>
>>> That seems reasonable. It very much is about build-testing.
>>
>> That and 2 more things IMO:
>>
>> a. having developers be responsible for build warnings, not just
>>     build errors
>>
>> b. having maintainers merge them more like they are build errors
>>     and not just some warnings that can be overlooked.
>>
>> I don't see enough of a. or b.  :(
> 
> Do we really want developers treat warnings as errors? When the code
> is okay but some random version of gcc dislikes it...
> 
> Plus, there's question of stable. We already get ton of churn there
> ("this fixes random warning"). WERROR will only encourage that...
> 

All Chrome OS builds are already done with -Werror enabled. Having it
enabled in the incoming stable releases will reduce our workload when
backporting stable releases. I am actually working on making at
least chromeos-5.10 "clean" for allmodconfig builds on arm, arm64,
and x86 (everything else is hopeless, and even arm may be futile,
but arm64 and x86 seem to be doable).

I'd rather have warnings fixed in incoming stable releases than having
to pull additional patches into our kernels.

Guenter
