Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0558140310B
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Sep 2021 00:28:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241594AbhIGW3k (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Sep 2021 18:29:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235945AbhIGW3j (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Sep 2021 18:29:39 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE7DEC061575;
        Tue,  7 Sep 2021 15:28:32 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id c42-20020a05683034aa00b0051f4b99c40cso361451otu.0;
        Tue, 07 Sep 2021 15:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xFav5yETJ9K/9gFqD/ijYgX8103pj31aLaLvEUcyaqI=;
        b=UUk+7aIudoNWpKLQcV+/OIHzmx91LOXITjFvwY3cPpOWc5p6HZNs2vIFEzVTZbBeMg
         kT6H4zq7/8NfYYebeuz4YjJNUQm9w4qHBPTaHN8OrwX3pBRMOMFOBOJgXQ91XGBn/L2o
         hdaq9v03Lm+m7LAhMJ9wrg5kud8yvZbGHJnYtDe5PXtG2wV0yiXmkhsz+ej0w0i+5+0/
         K9VzauFmM4IwJoUwWw93Jqs6YN/aEvRL6XZPrke108vi4nx0R6kTJ1XEfT726vTNZ9nA
         eEM5z4xVv0bWnRlqeOE+PYIzJ2aAehNilG8ozvonpWSYsY4NS9WdMOey5FjHCK4VH/6S
         o01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xFav5yETJ9K/9gFqD/ijYgX8103pj31aLaLvEUcyaqI=;
        b=YYBfcE8VrOFxIEBrPcPE+A4ymzBwksLcx0qpuH0OqHMPyIKpzEXI5k6MizVtxoLDS9
         bPXIWMOTc6fUYZsVfI5oEM8kfNSibbgUjnb8OefmWjusvbtVMesMU2YpwsQ0rqokcGiN
         dIY4+UYRaaJjhn7EZKgaXE105zbPWe8/xZbCevQ97ylaNQngSGrwXV/9JjY6Y1APuwjA
         EdxLv0FHKANdT/CCvOF2K2QrgFPpLyfz7ogBVRhiPW4rC4w2QhNHmIzT7W01qtBLLiQV
         5q/Nf67Gv+bGJHq+7piHGL8e0WrXpR8GGOqCwAduriszAwZs/QifZP+u1mXGBQ+KtOCO
         BTCw==
X-Gm-Message-State: AOAM5332qdEjwEJlyLjAK/rGRCWbZbTIDB7EYxXYutBXnuiq/PV/sDIC
        iIAiXQK3bhhBbYpcZgavFMW7UEjYIeI=
X-Google-Smtp-Source: ABdhPJwb9yJ9q2Q8nm67HNml4PLnJRRt1Wg0BZ0j9YzfHjGwApNTFR8ciJkmMCjO074oQBD0Kdpohg==
X-Received: by 2002:a05:6830:1443:: with SMTP id w3mr564450otp.49.1631053711952;
        Tue, 07 Sep 2021 15:28:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p81sm78494oia.48.2021.09.07.15.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 15:28:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] Revert "Enable '-Werror' by default for all kernel
 builds"
To:     Marco Elver <elver@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     llvm@lists.linux.dev,
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
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <a2e82a59-39b6-2987-1b2b-64b5bbd384a1@roeck-us.net>
Date:   Tue, 7 Sep 2021 15:28:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YTfkO2PdnBXQXvsm@elver.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 9/7/21 3:14 PM, Marco Elver wrote:
> On Tue, Sep 07, 2021 at 01:30PM -0700, Nick Desaulniers wrote:
>> On Tue, Sep 7, 2021 at 12:16 PM Linus Torvalds <torvalds@linux-foundation.org> wrote:
> [...]
>>> I'm not going to revert that change. I probably will have to limit it
>>> (by making that WERROR option depend on certain expectations), but
>>> basically any maintainer who has code that causes warnings should
>>> expect that they will have to fix those warnings.
>>
>> I'm not 100% against it; I think it could land in a more useful
>> variation. But it would be good to discuss that on-list, and give it
>> time to soak. This is a conversation we should be having with CI
>> maintainers IMO, and folks that maintain the build infra, at least.
>> I'm happy to kick off that discussion with this RFC.
> 
> Here's a datapoint: I had to disable CONFIG_WERROR on a bunch of syzbot
> instances which started failing because of -Werror [1], because syzbot's
> time is better spent on fuzzing, and having the odd warning in some
> subsystem penalize fuzzing of the entire kernel is not appropriate.
> 
> [1] https://github.com/google/syzkaller/commit/e096c0a2a414e487412c9669426780ce5acdde9d
> 
> Getting the kernel built is a hard requirement for any sort of runtime
> testing. Once the kernel is built, runtime testing of various subsystems
> can proceed in parallel. A single warning in some odd subsystem
> penalizing the _entire_ kernel's testing progress is inappropriate. The
> severity of a use-after-free bug found by runtime testing is orders of
> magnitude more severe than some "unused variable" warning. Now such a
> warning would delay finding bugs at runtime on many CI systems that
> haven't yet disabled the warning.
> 
> I'm predicting most distributions and runtime-focused CIs will disable
> the warning.
> 
> I have formulated this in the form of a patch below, that might move
> this new Kconfig option towards its appropriate usecases by default.
> 
> The intent is not to dispute the usefulness of -Werror, but select the
> appropriate usecases by default, limiting friction for all those who can
> do little more than say CONFIG_WERROR=n.
> 
> Thanks,
> -- Marco
> 
> ------ >8 ------
> 
> From: Marco Elver <elver@google.com>
> Date: Tue, 7 Sep 2021 23:12:08 +0200
> Subject: [PATCH] kbuild: Only default to -Werror if COMPILE_TEST
> 
> The cross-product of the kernel's supported toolchains, architectures,
> and configuration options is large. So large, that it's generally
> accepted to be infeasible to enumerate and build+test them all
> (many compile-testers rely on randomly generated configs).
> 
> Without the possibility to enumerate all possible combinations of
> toolchains, architectures, and configuration options, it is inevitable
> that compiler warnings in this space exist.
> 
> With -Werror, this means that an innumerable set of kernels are now
> broken, yet had been perfectly usable before (confused compilers, code
> with warnings unused, or luck).
> 
> Distributors will necessarily pick a point in the toolchain X arch X
> config space, and if unlucky, will have a broken build. Granted, those
> will likely disable CONFIG_WERROR and move on.
> 
> The kernel's default configuration is unlikely to be suitable for all
> users, but it's inappropriate to force many users to set CONFIG_WERROR=n.
> 
> This also holds for CI systems which are focused on runtime testing,
> where the odd warning in some subsystem will disrupt testing of the rest
> of the kernel. Many of those runtime-focused CI systems run tests or
> fuzz the kernel using runtime debugging tools. Runtime testing of
> different subsystems can proceed in parallel, and potentially uncover
> serious bugs; halting runtime testing of the entire kernel because of
> the odd warning (now error) in a subsystem or driver is simply
> inappropriate.
> 
> Therefore, runtime-focused CI systems will likely choose CONFIG_WERROR=n
> as well.
> 
> The appropriate usecase for -Werror is therefore compile-test focused
> builds (often done by developers or CI systems).
> 
> Reflect this in the Kconfig option by making the default value of WERROR
> match COMPILE_TEST.
> 
> Signed-off-by: Marco Elver <elver@google.com>

I like it.

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   init/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/init/Kconfig b/init/Kconfig
> index 8cb97f141b70..11f8a845f259 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -139,7 +139,7 @@ config COMPILE_TEST
>   
>   config WERROR
>   	bool "Compile the kernel with warnings as errors"
> -	default y
> +	default COMPILE_TEST
>   	help
>   	  A kernel build should not cause any compiler warnings, and this
>   	  enables the '-Werror' flag to enforce that rule by default.
> 

