Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BB3D3EF1D1
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Aug 2021 20:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232301AbhHQS0M (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Aug 2021 14:26:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:47200 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231149AbhHQS0M (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Aug 2021 14:26:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD4F461042;
        Tue, 17 Aug 2021 18:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629224738;
        bh=nWbbMoPYSmgWbb9ggWGwm0E2EwA2A5FEXfoy+4Gdimw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ZToh53CS+k4whLQV1F3538RG4BEuDg3v5Clog2vY7FUUUhCXpnxDJSU2hblfP9UzG
         ql7draPX+GJLCdfL533uAvHXroLbocssLDFufvuhfhXUl2VcrbXSqUfkvEXRSwjF1l
         dA9JawlgiWXnNhjNcUgSieAodpgO7vfC/urS0kzablCR6IdRJJqyXKYa0pntt4yjz5
         deNi/Goj1H3nlnVVfR1c4LEO/qWRTvYRrNeqcqMA/irH7ABePp5Tcj03WCBz1RmY5R
         JP4RebhR9L2DO7bAIFG0qFOeRBtPGb7p0mLt7scXhbCRZHPwABgN+lzau/XhtyZMQj
         PHmSXScRnS1Uw==
Subject: Re: [PATCH] kbuild: Enable -Wimplicit-fallthrough for clang 14.0.0+
To:     Kees Cook <keescook@chromium.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-hardening@vger.kernel.org
References: <20210817005624.1455428-1-nathan@kernel.org>
 <80fa539a-b767-76ed-dafa-4d8d1a6b063e@kernel.org>
 <CAHk-=wgFXOf9OUh3+vmWjhp1PC47RVsUkL0NszBxSWhbGzx4tw@mail.gmail.com>
 <5c856f36-69a7-e274-f72a-c3aef195adeb@kernel.org>
 <202108171056.EDCE562@keescook>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <3f28b45e-e725-8b75-042a-d34d90c56361@kernel.org>
Date:   Tue, 17 Aug 2021 11:25:36 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <202108171056.EDCE562@keescook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 8/17/2021 11:03 AM, Kees Cook wrote:
> On Mon, Aug 16, 2021 at 09:55:28PM -0700, Nathan Chancellor wrote:
>> If you/Gustavo would prefer, I can upgrade that check to
>>
>> ifneq ($(call cc-option, -Wunreachable-code-fallthrough),)
>>
>> I was just trying to save a call to the compiler, as that is more expensive
>> than a shell test call.
> 
> I prefer the option test -- this means no changes are needed on the
> kernel build side if it ever finds itself backported to earlier versions
> (and it handles the current case of "14" not meaning "absolute latest").
> 
> More specifically, I think you want this (untested):

That should work but since -Wunreachable-code-fallthrough is off by 
default, I did not really see a reason to include it in KBUILD_CFLAGS. I 
do not have a strong opinion though, your version is smaller than mine 
is so we can just go with that. I'll defer to Gustavo on it since he has 
put in all of the work cleaning up the warnings.

Cheers,
Nathan

> diff --git a/Makefile b/Makefile
> index b5fd51e68ae9..9845ea50a368 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -859,11 +859,11 @@ KBUILD_CFLAGS += -Wno-gnu
>   # source of a reference will be _MergedGlobals and not on of the whitelisted names.
>   # See modpost pattern 2
>   KBUILD_CFLAGS += -mno-global-merge
> +# Warn about unmarked fall-throughs in switch statement only if we can also
> +# disable the bogus unreachable code warnings.
> +KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough -Wno-unreachable-code-fallthrough,)
>   else
> -
>   # Warn about unmarked fall-throughs in switch statement.
> -# Disabled for clang while comment to attribute conversion happens and
> -# https://github.com/ClangBuiltLinux/linux/issues/636 is discussed.
>   KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough=5,)
>   endif
>   
> 
