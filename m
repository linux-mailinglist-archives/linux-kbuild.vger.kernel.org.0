Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC43A3F0DBA
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Aug 2021 23:51:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234426AbhHRVvw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 17:51:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:44856 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234422AbhHRVvw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 17:51:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id ED6F1600D4;
        Wed, 18 Aug 2021 21:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629323475;
        bh=VJvodRz2zx/X85MkngkOTb8/Lf3wBVCvk02sPd1R1SY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=JINAHL7yfDUBJP7yKVw6AsvrGRAOFK3v6IE5GMvApip5EKO730SKJXSdpc/JHKY9A
         d+ZI45WVb2lIJMssuCjnRN+d7bPzCSugXB9jMTMPOgYWcKmsjTtiru2SMlobPmmOlX
         yfXIdeb4xjMDKG39s5JlvUyCfPs8QcLJdTDy/4shHIGsKWBOd1L5y3pSRLrRSW5l8o
         Y4wG9xtXpPJU8Uib9oVh9JYdfreOlu9iF9O16tJiGn166n1/u0sYmsbYhGYhNotXT1
         S33kXTkLcUNEOxPU89O7E2Gq7iGrF5Qn7FRPiWv0xTw/cw1P0WA0nZ07xsunPwF9IN
         3QFRzEUuvymxQ==
Subject: Re: [PATCH v2 1/7] Compiler Attributes: Add __alloc_size() for better
 bounds checking
To:     Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com, Joe Perches <joe@perches.com>,
        Andy Whitcroft <apw@canonical.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Daniel Micay <danielmicay@gmail.com>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>, linux-mm@kvack.org,
        linux-kbuild@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20210818214021.2476230-1-keescook@chromium.org>
 <20210818214021.2476230-2-keescook@chromium.org>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <fd4e3b0b-a052-58a7-c816-f055e8404165@kernel.org>
Date:   Wed, 18 Aug 2021 14:51:13 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210818214021.2476230-2-keescook@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 8/18/2021 2:40 PM, Kees Cook wrote:
> GCC and Clang can use the "alloc_size" attribute to better inform the
> results of __builtin_object_size() (for compile-time constant values).
> Clang can additionally use alloc_size to inform the results of
> __builtin_dynamic_object_size() (for run-time values).
> 
> Because GCC sees the frequent use of struct_size() as an allocator size
> argument, and notices it can return SIZE_MAX (the overflow indication),
> it complains about these call sites may overflow (since SIZE_MAX is
> greater than the default -Walloc-size-larger-than=PTRDIFF_MAX). This
> isn't helpful since we already know a SIZE_MAX will be caught at run-time
> (this was an intentional design). Instead, just disable this check as
> it is both a false positive and redundant. (Clang does not have this
> warning option.)
> 
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: clang-built-linux@googlegroups.com
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>   Makefile                            | 6 +++++-
>   include/linux/compiler_attributes.h | 6 ++++++
>   2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 72f9e2b0202c..34cffcdfd5dc 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1078,9 +1078,13 @@ KBUILD_CFLAGS += $(call cc-disable-warning, stringop-overflow)
>   # Another good warning that we'll want to enable eventually
>   KBUILD_CFLAGS += $(call cc-disable-warning, restrict)
>   
> -# Enabled with W=2, disabled by default as noisy
>   ifdef CONFIG_CC_IS_GCC
> +# Enabled with W=2, disabled by default as noisy
>   KBUILD_CFLAGS += -Wno-maybe-uninitialized
> +
> +# The allocators already balk at large sizes, so silence the compiler
> +# warnings for bounds checks involving those possible values.
> +KBUILD_CFLAGS += -Wno-alloc-size-larger-than
>   endif
>   
>   # disable invalid "can't wrap" optimizations for signed / pointers
> diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
> index 67c5667f8042..203b0ac62d15 100644
> --- a/include/linux/compiler_attributes.h
> +++ b/include/linux/compiler_attributes.h
> @@ -54,6 +54,12 @@
>   #define __aligned(x)                    __attribute__((__aligned__(x)))
>   #define __aligned_largest               __attribute__((__aligned__))
>   
> +/*
> + *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-alloc_005fsize-function-attribute
> + * clang: https://clang.llvm.org/docs/AttributeReference.html#alloc-size
> + */
> +#define __alloc_size(x, ...)		__attribute__((__alloc_size__(x, ## __VA_ARGS__)))
> +
>   /*
>    * Note: users of __always_inline currently do not write "inline" themselves,
>    * which seems to be required by gcc to apply the attribute according
> 
