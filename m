Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C33618023D
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2020 16:46:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbgCJPqj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 10 Mar 2020 11:46:39 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41021 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726504AbgCJPqj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Mar 2020 11:46:39 -0400
Received: by mail-ot1-f67.google.com with SMTP id s15so5357307otq.8;
        Tue, 10 Mar 2020 08:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oAoaOcfKFLCJ0nOY8c3/piOO/zUeoRHQO/N6WrhcgWU=;
        b=etnEvI74yEK5vkZRP14Lb1HLwlj0y6enD0GjUQc/PYmFYYpeNHdCLwMh1sAP4bgaVk
         T6TGxwW19BpreGXZy4V2mGzXYWIiCJu6X41TfpL3iJBxK0KjkhLg1mn2sR6w0qKz8/Nc
         IClt1AiO1XDPJCwbzNRui+PzCYEiOJYjgdvIqW2GVnXm7n9OTs0fdsmX2K4HmakfLz4a
         Bezhh2WQDHkuo7EUbvtjXrFmLjLMrGrRVcwJ/8doEJRY/KXlaOvdWeQL6+orOABbeu3K
         TA8N3/8sOofCXnyJrhoJIGt5xCAqdOQlsWj0AbrHxbwwkF0YHp7ibPRpgh4amSXeTYrS
         OvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oAoaOcfKFLCJ0nOY8c3/piOO/zUeoRHQO/N6WrhcgWU=;
        b=fp0VNjx34Ro33GkTD4BG7QpAw93m/uCstmxeJdEmh+q1w7xjEfAjkZXg5QrsOAtdOs
         OzUW7XDPLa9UZK4CfOXvsHYdPE9LCrrFnz3caAU9Ysg1xCSOI0whgECp2/OmYMxQIw5A
         OUAqVv29DV8XDFMYkonYjcmndt/xsR8egcHlgXlY8aAnwVxtJeV2myORDg4yVP5H17yi
         0zObIEItCCaawM2iTMBccA9HE2vtZ2/B0hPr/i/CZByTJYZZJRgh3HzutgoJdkPs2wA7
         8LwsKcBWJzEGR1/TaLh5ttc4qnei1yhFrEBAVbjOdBb9tajIDRkjEhKckSFBeg5w6BHb
         ufCg==
X-Gm-Message-State: ANhLgQ3/Pl1+t7MdLN4xA65pGXMsmRyLHHxpCXWwm/MyEBzK8O4X3XQr
        HxGX8chAXD/r5lPTijBEDEMp3u2NFHE=
X-Google-Smtp-Source: ADFU+vv9nOlKV1/TZjUbSqBUA3fOw2xujdKfOY8jbNz+gMBBvwN9774g/GhGVMGWg1Nu4YwvKYcDJA==
X-Received: by 2002:a05:6830:2009:: with SMTP id e9mr18014608otp.296.1583855197829;
        Tue, 10 Mar 2020 08:46:37 -0700 (PDT)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id c12sm4411577oic.27.2020.03.10.08.46.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Mar 2020 08:46:37 -0700 (PDT)
Date:   Tue, 10 Mar 2020 08:46:36 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
        George Spelvin <lkml@sdf.org>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] kconfig: introduce m32-flag and m64-flag
Message-ID: <20200310154636.GA24694@ubuntu-m2-xlarge-x86>
References: <20200310101250.22374-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310101250.22374-1-masahiroy@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 10, 2020 at 07:12:49PM +0900, Masahiro Yamada wrote:
> When a compiler supports multiple architectures, some compiler features
> can be dependent on the target architecture.
> 
> This is typical for Clang, which supports multiple LLVM backends.
> Even for GCC, we need to take care of biarch compiler cases.
> 
> It is not a problem when we evaluate cc-option in Makefiles because
> cc-option is tested against the flag in question + $(KBUILD_CFLAGS).
> 
> The cc-option in Kconfig, on the other hand, does not accumulate
> tested flags. Due to this simplification, it could potentially test
> cc-option against a different target.
> 
> At first, Kconfig always evaluated cc-option against the host
> architecture.
> 
> Since commit e8de12fb7cde ("kbuild: Check for unknown options with
> cc-option usage in Kconfig and clang"), in case of cross-compiling
> with Clang, the target triple is correctly passed to Kconfig.
> 
> The case with biarch GCC (and native build with Clang) is still not
> handled properly. We need to pass some flags to specify the target
> machine bit.
> 
> Due to the design, all the macros in Kconfig are expanded in the
> parse stage, where we do not know the target bit size yet.
> 
> For example, arch/x86/Kconfig allows a user to toggle CONFIG_64BIT.
> If a compiler flag -foo depends on the machine bit, it must be tested
> twice, one with -m32 and the other with -m64.
> 
> However, -m32/-m64 are not always recognized. So, this commits adds
> m64-flag and m32-flag macros. They expand to -m32, -m64, respectively
> if supported. Or, they expand to an empty string if unsupported.
> 
> The typical usage is like this:
> 
>   config FOO
>           bool
>           default $(cc-option,$(m64-flag) -foo) if 64BIT
>           default $(cc-option,$(m32-flag) -foo)
> 
> This is clumsy, but there is no elegant way to handle this in the
> current static macro expansion.
> 
> There was discussion for static functions vs dynamic functions.
> The consensus was to go as far as possible with the static functions.
> (https://lkml.org/lkml/2018/3/2/22)
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/Kconfig.include | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> index 85334dc8c997..496d11c92c97 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -44,3 +44,10 @@ $(error-if,$(success, $(LD) -v | grep -q gold), gold linker '$(LD)' not supporte
>  
>  # gcc version including patch level
>  gcc-version := $(shell,$(srctree)/scripts/gcc-version.sh $(CC))
> +
> +# machine bit flags
> +#  $(m32-flag): -m32 if the compiler supports it, or an empty string otherwise.
> +#  $(m64-flag): -m64 if the compiler supports it, or an empty string otherwise.
> +cc-option-bit = $(if-success,$(CC) -Werror $(1) -E -x c /dev/null -o /dev/null,$(1))
> +m32-flag := $(cc-option-bit,-m32)
> +m64-flag := $(cc-option-bit,-m64)
> -- 
> 2.17.1

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
