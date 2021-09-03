Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18CA440080A
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Sep 2021 01:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234663AbhICXFx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 3 Sep 2021 19:05:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:58950 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230456AbhICXFw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Sep 2021 19:05:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A00A6101A;
        Fri,  3 Sep 2021 23:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630710292;
        bh=kwXSNoztsapfek/7tY4BJ7A92I7Ax8v7jMAhfQGx4P8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=VBpNgYVxlYcqc92N5qpBQjPqicLgFFNDzKeL8/V8pFfLJKu8s83FKiWXT6LclHlco
         VCSESOcdDqVwXfx4n3b2T6HAcn9VvuCMtSJLcwKcdot8Q4H+3oiAzOq33XWNvwkWDe
         qMtKxj5PeCAifOrrzcELYmxY00v9D4vIMtPrImjxOD0IdmwZsx3MxUZdX24Pk3GFhU
         gy11fK9vf2a3Stq5mbbYaXsLb1ZYbxUGKCMl2/7inye+n729JPtX2ebNR5TJYS2P9V
         EJOdZD/0f850MQstl+wcK4qM0shthcyIXyhV6sEV6G9TuxhMi+YFWItjp1Gj/AFRDb
         JgUnCwIlj0y9A==
Subject: Re: [GIT PULL v2] Kbuild updates for v5.15-rc1
To:     Linus Torvalds <torvalds@linuxfoundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        llvm@lists.linux.dev, linux-toolchains@vger.kernel.org
References: <CAK7LNAQ0Q6CdXaD-dVGj_e3O3JYs_crpejWKpXHYQJYxyk-1VQ@mail.gmail.com>
 <CAHk-=wgoX0pVqNMMOcrhq=nuOfoZB_3qihyHB3y1S8qo=MDs6w@mail.gmail.com>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <3b461878-a4a0-2f84-e177-9daf8fe285e7@kernel.org>
Date:   Fri, 3 Sep 2021 16:04:50 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wgoX0pVqNMMOcrhq=nuOfoZB_3qihyHB3y1S8qo=MDs6w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 9/3/2021 3:53 PM, Linus Torvalds wrote:> On Thu, Sep 2, 2021 at 4:31 
PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>>
>> I fixed the warnings observed in the previous PR.
> 
> Ok, let's try it again.
> 
>>   - Add <linux/stdarg.h> to the kernel source instead of borrowing
>>     <stdarg.h> from the compiler.
> 
> So I certainly agree with the reasoning, but this worries me a bit.
> 
> stdarg is truly intimately an internal compiler file, in ways that
> stddef (to pick another example) isn't.
> 
> Yeah, yeah, offsetof() is "kind of compiler internal", and we end up
> using __compiler_offsetof(), but in the absence of that we *can* just
> do it by hand. So offsetof() really is one of those things where we
> can just do our own version if some compiler is being difficult.
> 
> But va_start and friends absolutely *must* match the exact compiler version.
> 
> It does look like both gcc and clang have just standardized on using
> __builtin_xyz for all the different stdarg things, and so I approve of
> what that <linux/stdarg.h> ended up looking like.
> 
> But at the same time, it does make me go "ok, this is a big new
> assumption that we've consciously avoided for a long time".
> 
> Nick is already on the cc here for other reasons, but let's add the
> clang-built list and Nathan explicitly. Because this basically
> codifies that
> 
>      typedef __builtin_va_list va_list;
>      #define va_start(v, l)  __builtin_va_start(v, l)
>      #define va_end(v)       __builtin_va_end(v)
>      #define va_arg(v, T)    __builtin_va_arg(v, T)
>      #define va_copy(d, s)   __builtin_va_copy(d, s)
> 
> being the way all the supported compilers work.
> 
> Did people talk to any gcc maintainers too? We don't have the same
> kind of "gcc kernel people" list or contacts. The above builtins have
> been the case for a long long time for gcc, so I don't think it's
> wrong or likely to change, but I think it would be a good thing to
> just make compiler people aware of how we're now relying on that
> explicitly.

We set up the linux-toolchains mailing list after Plumbers 2020 to have 
a common place that kernel developers can bring issues and discussion to 
both clang and GCC folks. I am not sure who exactly from the GCC world 
is subscribed but I have added it now to see.

> (Side note: Linux using the compiler <stdarg.h> goes so far back that
> it very much predates all those nice builtins. I still have memories
> of <stdarg.h> being a collection of nasty per-architecture messes back
> in the bad old days. So I'm actually happy we can do this now, but
> there most definitely was a time when we really really had to use the
> compiler-provided stdarg.h).

Cheers,
Nathan
