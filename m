Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06D6F3AF9A5
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Jun 2021 01:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231823AbhFUXnz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Jun 2021 19:43:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:39542 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231486AbhFUXnz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Jun 2021 19:43:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D72A611BD;
        Mon, 21 Jun 2021 23:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624318900;
        bh=Hjg6nyt/cyl6h5T5XaGtOqKiPNLoKh3rJA7tP4MqZ9w=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=aCin44TsfCj0ZM9GJ2p+p2ho7J4cgUB0AXPwdCaviFwUaAxksUgWB9nLo1t2+AUSv
         s+xZ8QzmPSlpYD8pe/640JZ0jAQx2v6SfM4ODzadsH+/oIkYBMteNr7srMAcA5G9qx
         +HwegxokVeKexqN4SdgAuvnFaof/gD8yIpMq2Y2Jm9mujDNzlVSWDSG2bukB2B1g+W
         N2TQtpLFKyPOwCS/RuLZ0h4wYho9edV77tNgAo+4GmJjz4uLcDdM3yppRb1ciqequ7
         ezchoDrHbj3+xF/XET3SO5Q10ZrsBZsKv64CZbMH5xuWqzTlNNjxWv2ANprsI/p35m
         eHtD02xOLM7yg==
Subject: Re: [PATCH v2 1/3] compiler_attributes.h: define __no_profile, add to
 noinstr
To:     Nick Desaulniers <ndesaulniers@google.com>,
        Kees Cook <keescook@chromium.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Bill Wendling <wcw@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        x86@kernel.org, Borislav Petkov <bp@alien8.de>,
        Martin Liska <mliska@suse.cz>, Marco Elver <elver@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Fangrui Song <maskray@google.com>, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>,
        johannes.berg@intel.com, linux-toolchains@vger.kernel.org,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Miguel Ojeda <ojeda@kernel.org>
References: <20210621231822.2848305-1-ndesaulniers@google.com>
 <20210621231822.2848305-2-ndesaulniers@google.com>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <6ca2bf5a-f0c3-b972-2313-f09c39b67e3b@kernel.org>
Date:   Mon, 21 Jun 2021 16:41:37 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210621231822.2848305-2-ndesaulniers@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 6/21/2021 4:18 PM, 'Nick Desaulniers' via Clang Built Linux wrote:
> noinstr implies that we would like the compiler to avoid instrumenting a
> function.  Add support for the compiler attribute
> no_profile_instrument_function to compiler_attributes.h, then add
> __no_profile to the definition of noinstr.
> 
> Link: https://lore.kernel.org/lkml/20210614162018.GD68749@worktop.programming.kicks-ass.net/
> Link: https://reviews.llvm.org/D104257
> Link: https://reviews.llvm.org/D104475
> Link: https://reviews.llvm.org/D104658
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=80223
> Reviewed-by: Fangrui Song <maskray@google.com>
> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> Changes V1 -> V2:
> * s/no_profile/no_profile_instrument_function/
> * fix trailing double underscore on GCC 4 define, as per Fangrui+Miguel.
> * Pick up Fangrui + Miguel's reviewed-by tag.
> * Add link to GCC's doc.
> * Fix clang's doc format; will appear once clang-13 is released.
> 
>   include/linux/compiler_attributes.h | 13 +++++++++++++
>   include/linux/compiler_types.h      |  2 +-
>   2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
> index c043b8d2b17b..225511b17223 100644
> --- a/include/linux/compiler_attributes.h
> +++ b/include/linux/compiler_attributes.h
> @@ -33,6 +33,7 @@
>   # define __GCC4_has_attribute___externally_visible__  1
>   # define __GCC4_has_attribute___no_caller_saved_registers__ 0
>   # define __GCC4_has_attribute___noclone__             1
> +# define __GCC4_has_attribute___no_profile_instrument_function__ 0
>   # define __GCC4_has_attribute___nonstring__           0
>   # define __GCC4_has_attribute___no_sanitize_address__ (__GNUC_MINOR__ >= 8)
>   # define __GCC4_has_attribute___no_sanitize_undefined__ (__GNUC_MINOR__ >= 9)
> @@ -237,6 +238,18 @@
>   # define __nonstring
>   #endif
>   
> +/*
> + * Optional: only supported since GCC >= 7.1, clang >= 13.0.
> + *
> + *      gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-no_005fprofile_005finstrument_005ffunction-function-attribute
> + *    clang: https://clang.llvm.org/docs/AttributeReference.html#no-profile-instrument-function
> + */
> +#if __has_attribute(__no_profile_instrument_function__)
> +# define __no_profile                  __attribute__((__no_profile_instrument_function__))
> +#else
> +# define __no_profile
> +#endif
> +
>   /*
>    *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-noreturn-function-attribute
>    * clang: https://clang.llvm.org/docs/AttributeReference.html#noreturn
> diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
> index d29bda7f6ebd..d509169860f1 100644
> --- a/include/linux/compiler_types.h
> +++ b/include/linux/compiler_types.h
> @@ -210,7 +210,7 @@ struct ftrace_likely_data {
>   /* Section for code which can't be instrumented at all */
>   #define noinstr								\
>   	noinline notrace __attribute((__section__(".noinstr.text")))	\
> -	__no_kcsan __no_sanitize_address
> +	__no_kcsan __no_sanitize_address __no_profile
>   
>   #endif /* __KERNEL__ */
>   
> 
