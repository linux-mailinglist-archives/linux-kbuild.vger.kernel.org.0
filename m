Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D7033EE57D
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Aug 2021 06:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230395AbhHQEVH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Aug 2021 00:21:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:33782 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229754AbhHQEVH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Aug 2021 00:21:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F7AE60F35;
        Tue, 17 Aug 2021 04:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629174035;
        bh=LwXAxW/JbRYjdBCqrHlZG4O/OKef14aoTixFDdZAp1g=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=T0Wiz+2rYAqmYBvxPhY+nP2pHfXU/XE+e7umtS+vPE3zQztFvVZF9upFQaqWUK+eS
         H/TnKzuaZXXArPKTKlZ3RAASWszSIJZYWkad2pednSRfx+Qd+dIMoJnz1mfQXi7yyH
         BQIcPy2VjpXB1jYwPT271i09mFYsx81EvLClobVY68SCMn1oD8vBcRuZPTD0TG+D04
         PXvCXUWql8LlETLAg1BQo055DIyWuCflGmPpxOOHO95gu4Qc9+WuGvgpVE4mDG54aj
         plQXt/fCMqg1TBfhuXq1zf+pm5MHvy4gWNO+UY2sVHD8EMr016tIFAduudPdVj/M9j
         kLbJFEwsH6Saw==
Subject: Re: [PATCH] kbuild: Enable -Wimplicit-fallthrough for clang 14.0.0+
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
References: <20210817005624.1455428-1-nathan@kernel.org>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <80fa539a-b767-76ed-dafa-4d8d1a6b063e@kernel.org>
Date:   Mon, 16 Aug 2021 21:20:33 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210817005624.1455428-1-nathan@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


On 8/16/2021 5:56 PM, Nathan Chancellor wrote:
> Clang prior to 14.0.0 warns when a fallthrough annotation is in an
> unreachable spot, which can occur when IS_ENABLED(CONFIG_...) in a
> conditional statement prior to the fallthrough annotation such as
> 
>    if (IS_ENABLED(CONFIG_...))
>        break;
>    fallthrough;
> 
> which to clang looks like
> 
>    break;
>    fallthrough;
> 
> if CONFIG_... is enabled due to the control flow graph. Example of the
> warning in practice:
> 
> sound/core/pcm_native.c:3812:3: warning: fallthrough annotation in
> unreachable code [-Wimplicit-fallthrough]
>                  fallthrough;
>                  ^
> 
> Warning on unreachable annotations makes the warning too noisy and
> pointless for the kernel due to the nature of guarding some code on
> configuration options so it was disabled in commit d936eb238744 ("Revert
> "Makefile: Enable -Wimplicit-fallthrough for Clang"").
> 
> This has been resolved in clang 14.0.0 by moving the unreachable warning
> to its own flag under -Wunreachable-code, which the kernel will most
> likely never enable due to situations like this.
> 
> Enable -Wimplicit-fallthrough for clang 14+ so that issues such as the
> one in commit 652b44453ea9 ("habanalabs/gaudi: fix missing code in ECC
> handling") can be caught before they enter the tree.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/236
> Link: https://github.com/llvm/llvm-project/commit/9ed4a94d6451046a51ef393cd62f00710820a7e8
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>   Makefile | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index c19d1638da25..91a4a80409e1 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -797,11 +797,17 @@ KBUILD_CFLAGS += -Wno-gnu
>   # source of a reference will be _MergedGlobals and not on of the whitelisted names.
>   # See modpost pattern 2
>   KBUILD_CFLAGS += -mno-global-merge
> +
> +# Warn about unmarked fall-throughs in switch statement.
> +# Clang prior to 14.0.0 warned on unreachable fallthroughs with
> +# -Wimplicit-fallthrough, which is unacceptable due to IS_ENABLED().
> +# https://bugs.llvm.org/show_bug.cgi?id=51094
> +ifeq ($(shell test $(CONFIG_CLANG_VERSION) -ge 140000; echo $$?),0)
> +KBUILD_CFLAGS += -Wimplicit-fallthrough
> +endif
>   else
>   
>   # Warn about unmarked fall-throughs in switch statement.
> -# Disabled for clang while comment to attribute conversion happens and
> -# https://github.com/ClangBuiltLinux/linux/issues/636 is discussed.
>   KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough=5,)
>   endif
>   
> 
> base-commit: a2824f19e6065a0d3735acd9fe7155b104e7edf5
> 

Please do not apply this patch in its current form, as it does not 
properly credit Gustavo for all of the hard work he has done for 
enabling this warning.

Additionally, there should be some time for the CI systems to update 
their clang-14 builds, as the recent 0day report shows.

Cheers,
Nathan
