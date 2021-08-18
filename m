Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80E1E3F0AC2
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Aug 2021 20:04:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbhHRSFL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 14:05:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:42866 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229448AbhHRSFK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 14:05:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 77A2D610FD;
        Wed, 18 Aug 2021 18:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629309876;
        bh=zAsKII9Xw6GYOOOsq3YfHs/AsTlpRw1b13TULJztS6A=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=lNP3DJKa5s1GOi8xZGgH3QylkDj13TZZoGfE2p1FATYHc9wh0L0UpyXSJ4F6qXIEy
         O2T6E/T7gyWR7jUlJvy9yNX2teka2qy11C87N+4CjfXmzzwL6E/aPrWzLJ7V6Mqmcx
         bRkAmregkSOVd4T4OCF9LBG0MQC5wAeUfSpB7pQfbJenM5RqoojLmQuqJdNi4QVhEL
         6xq+SM/gnRbxr0ZQs/zdAF9W3E7YSJKmHqxHe/p0s9PCWfEQl5FwiUa29gga6wtMf0
         LitGExq/rbx3ptvIjiZc6TA77YsM9mJKpMCDyOhl9l/56fWV07Qj2rNJoS6MQWn3wS
         LBI26kXHJlgEg==
Subject: Re: [PATCH 1/5] Compiler Attributes: Add __alloc_size() for better
 bounds checking
To:     Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        Andrew Morton <akpm@linux-foundation.org>,
        Daniel Micay <danielmicay@gmail.com>,
        Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>, linux-mm@kvack.org,
        linux-kbuild@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20210818050841.2226600-1-keescook@chromium.org>
 <20210818050841.2226600-2-keescook@chromium.org>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <d326fbfc-dc96-b6e9-6fd8-31df3eb9f1cb@kernel.org>
Date:   Wed, 18 Aug 2021 11:04:32 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210818050841.2226600-2-keescook@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 8/17/2021 10:08 PM, Kees Cook wrote:
> GCC and Clang can use the alloc_size attribute to better inform the
> results of __builtin_object_size() (for compile-time constant values).
> Clang can additionally use alloc_size to informt the results of
> __builtin_dynamic_object_size() (for run-time values).
> 
> Additionally disables -Wno-alloc-size-larger-than since the allocators
> already reject SIZE_MAX, and the compile-time warnings aren't helpful.

In addition to what Miguel said, it might be helpful to mention that 
this warning is GCC specific, I was a little confused at first as to why 
it was just being added in the GCC only block :)

Otherwise, the attribute addition looks good to me. I will add my tag on v2.

> Cc: Miguel Ojeda <ojeda@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: clang-built-linux@googlegroups.com
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>   Makefile                            | 6 +++++-
>   include/linux/compiler_attributes.h | 6 ++++++
>   2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 1b238ce86ed4..3b6fb740584e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1076,9 +1076,13 @@ KBUILD_CFLAGS += $(call cc-disable-warning, stringop-overflow)
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
