Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3BAF9497F
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2019 18:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727766AbfHSQKt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Aug 2019 12:10:49 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33795 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbfHSQKt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Aug 2019 12:10:49 -0400
Received: by mail-pf1-f194.google.com with SMTP id b24so1435189pfp.1
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Aug 2019 09:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=E6039ciGvAkJtk2bP5W5DDCHWOJVGQXphFuaFI9KXQY=;
        b=JquxouCNihVsOnsP06NJAZ2bclz9qC6IYT9ISYCsoWof5UR8JssFPEeYOdcYMd5Cne
         ueq5xTc+MUmhq0l7FMg+ThpwDSpcq2durhU0/xddsoU+9v3SyHyEfinBoc4duhzBVoh3
         pwsJ3zOlj11+tVw6B4Y09ryeAimvgwh1ahjSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=E6039ciGvAkJtk2bP5W5DDCHWOJVGQXphFuaFI9KXQY=;
        b=ZuT82dkv45Xu31cyT+GjQemTkXJwAp0DyEFUONemc2D3w3+logKiWAaZErXEQTEN8B
         g5vAZ1OpiprxJs5GXnjo+mY+Ner4kkiHKryrwWg7GhKvtN9NMCZj7tNS0kzmES40RwBm
         j9I1Fxe7umOCQ9nKZZeyKuEPRA7v910I2KPhn+SA1FnT2Z4ECcx40u7HiQmtdifj6ksJ
         yUmY4ITUBw7G8nXakJ4txWaUGGuU3HEKzFjmMGlp6lK6IeAYO/cBIxoAXY8wRDjBMJWj
         Xl8+65/stXCPeTolPwePsIXMfQgWV1a/h1P8MjQAEaY4ycw4t9DwmSYSmjG6RYiMQeVr
         rKOQ==
X-Gm-Message-State: APjAAAWSd6B7fylMsN/U17DHpTOu1CiHHue9CGlMkpQ0NJDH21/Ry3vs
        E6zf0mBkUAarA/6Mspbq4Y/AJg==
X-Google-Smtp-Source: APXvYqyImcrwRtODv2CA2ck8Rh3Njq3u5xkUWh8oArL8+4rQjOwoiJ3Hc81/hOzAvkR8QlPieiyV6w==
X-Received: by 2002:a17:90a:5884:: with SMTP id j4mr22410147pji.142.1566231048482;
        Mon, 19 Aug 2019 09:10:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i14sm18896938pfq.77.2019.08.19.09.10.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 09:10:47 -0700 (PDT)
Date:   Mon, 19 Aug 2019 09:10:45 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Borislav Petkov <bp@suse.de>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Paul Burton <paul.burton@mips.com>,
        Xiaozhou Liu <liuxiaozhou@bytedance.com>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: enable unused-function warnings for W= build
 with Clang
Message-ID: <201908190910.2E6A18A647@keescook>
References: <20190819105138.5053-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190819105138.5053-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 19, 2019 at 07:51:38PM +0900, Masahiro Yamada wrote:
> GCC and Clang have different policy for -Wunused-function; GCC does
> not report unused-function warnings at all for the functions marked
> as 'static inline'. Clang does report unused-function warnings if they
> are defined in source files instead of headers.
> 
> We could use Clang for detecting unused functions, but it has been
> suppressed since commit abb2ea7dfd82 ("compiler, clang: suppress
> warning for unused static inline functions").
> 
> So, we never notice left-over code if functions in .c files are
> marked as inline.
> 
> Let's remove __maybe_unused from the inline macro. As always, it is
> not a good idea to sprinkle warnings for the normal build. So, these
> warnings will be shown for the W= build.
> 
> If you contribute to code clean-up, please run "make CC=clang W=1"
> and check -Wunused-function warnings. You will find lots of unused
> functions.
> 
> Some of them are false-positives because the call-sites are disabled
> by #ifdef. I do not like to abuse the inline keyword for suppressing
> unused-function warnings because it might affect the compiler's
> optimization. When I need to fix unused-functions warnings, I prefer
> adding #ifdef or __maybe_unused to function definitions.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
> 
>  include/linux/compiler_types.h | 10 ++--------
>  scripts/Makefile.extrawarn     |  1 +
>  2 files changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
> index 599c27b56c29..14de8d0162fb 100644
> --- a/include/linux/compiler_types.h
> +++ b/include/linux/compiler_types.h
> @@ -130,10 +130,6 @@ struct ftrace_likely_data {
>  
>  /*
>   * Force always-inline if the user requests it so via the .config.
> - * GCC does not warn about unused static inline functions for
> - * -Wunused-function.  This turns out to avoid the need for complex #ifdef
> - * directives.  Suppress the warning in clang as well by using "unused"
> - * function attribute, which is redundant but not harmful for gcc.
>   * Prefer gnu_inline, so that extern inline functions do not emit an
>   * externally visible function. This makes extern inline behave as per gnu89
>   * semantics rather than c99. This prevents multiple symbol definition errors
> @@ -143,11 +139,9 @@ struct ftrace_likely_data {
>   * (which would break users of __always_inline).
>   */
>  #if !defined(CONFIG_OPTIMIZE_INLINING)
> -#define inline inline __attribute__((__always_inline__)) __gnu_inline \
> -	__maybe_unused notrace
> +#define inline inline __attribute__((__always_inline__)) __gnu_inline notrace
>  #else
> -#define inline inline                                    __gnu_inline \
> -	__maybe_unused notrace
> +#define inline inline                                    __gnu_inline notrace
>  #endif
>  
>  #define __inline__ inline
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index a74ce2e3c33e..92f542797e03 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -70,5 +70,6 @@ KBUILD_CFLAGS += -Wno-initializer-overrides
>  KBUILD_CFLAGS += -Wno-format
>  KBUILD_CFLAGS += -Wno-sign-compare
>  KBUILD_CFLAGS += -Wno-format-zero-length
> +KBUILD_CFLAGS += -Wno-unused-function
>  endif
>  endif
> -- 
> 2.17.1
> 

-- 
Kees Cook
