Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55DCE44FBC4
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Nov 2021 22:19:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236386AbhKNVWR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 14 Nov 2021 16:22:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:35894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236359AbhKNVWG (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 14 Nov 2021 16:22:06 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA96360FD7;
        Sun, 14 Nov 2021 21:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636924726;
        bh=7CMV186gSCO8E+nCRakwqBJkxf3Tw9FjEUFL+OmYcQ4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PZiW2izJn9VHflJM/TKCR7OC6vsHFzJiIfO2x1o7OqTZ4ZWLSm7psoE7fdbWQZ7ND
         3Sjcbb8AqSCGssaf0cZctS+FP1h21SA/5kK74/2E5vPUNLX8UIbdfRF/3RGQf3ZUu3
         ACGvuAdxTcrU00MYzu/Z4/ZSbCtWn1T1LmfK8GbcYoR0DQcR6gVfJZkqxSnXMKBGJC
         mCscIb/Kjp1vU4yLUuq/SGVROQ8bfBeDreMtORsy6Tbm2w5LQ7AgXGyVnxjnJIO54q
         uJ66dY9lqYiOchfZyyXgX0WIaXmYuc4c7YRnIZaeZvaZhOUZ1iGskMHm6YeQCA5boU
         6y53muTwMwTlQ==
Date:   Sun, 14 Nov 2021 14:18:41 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        llvm@lists.linux.dev
Subject: Re: [PATCH] kconfig: Add support for -Wimplicit-fallthrough
Message-ID: <YZF9MY6rRLQwdTgM@archlinux-ax161>
References: <20211114005725.GA27075@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211114005725.GA27075@embeddedor>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Nov 13, 2021 at 06:57:25PM -0600, Gustavo A. R. Silva wrote:
> Add Kconfig support for -Wimplicit-fallthrough for both GCC and Clang.
> 
> The compiler option is under configuration CC_IMPLICIT_FALLTHROUGH,
> which is enabled by default.
> 
> Special thanks to Nathan Chancellor who fixed the Clang bug[1][2]. This
> bugfix only appears in Clang 14.0.0, so older versions still contain
> the bug and -Wimplicit-fallthrough won't be enabled for them, for now.
> 
> This concludes a long journey and now we are finally getting rid
> of the unintentional fallthrough bug-class in the kernel, entirely. :)
> 
> [1] https://github.com/llvm/llvm-project/commit/9ed4a94d6451046a51ef393cd62f00710820a7e8
> [2] https://bugs.llvm.org/show_bug.cgi?id=51094
> 
> Link: https://github.com/KSPP/linux/issues/115
> Link: https://github.com/ClangBuiltLinux/linux/issues/236
> Co-developed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Co-developed-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

This appears to do the right thing with both clang-13 and clang-14.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

It feels a little odd to have this in Kconfig but if it works and gets
the warning enabled, then so be it.

> ---
>  Makefile     | 6 +-----
>  init/Kconfig | 5 +++++
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 30c7c81d0437..f18a50daad00 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -786,7 +786,7 @@ stackp-flags-$(CONFIG_STACKPROTECTOR_STRONG)      := -fstack-protector-strong
>  KBUILD_CFLAGS += $(stackp-flags-y)
>  
>  KBUILD_CFLAGS-$(CONFIG_WERROR) += -Werror
> -KBUILD_CFLAGS += $(KBUILD_CFLAGS-y)
> +KBUILD_CFLAGS += $(KBUILD_CFLAGS-y) $(CONFIG_CC_IMPLICIT_FALLTHROUGH)
>  
>  ifdef CONFIG_CC_IS_CLANG
>  KBUILD_CPPFLAGS += -Qunused-arguments
> @@ -798,10 +798,6 @@ KBUILD_CFLAGS += -Wno-gnu
>  KBUILD_CFLAGS += -mno-global-merge
>  else
>  
> -# Warn about unmarked fall-throughs in switch statement.
> -# Disabled for clang while comment to attribute conversion happens and
> -# https://github.com/ClangBuiltLinux/linux/issues/636 is discussed.
> -KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough=5,)
>  # gcc inanely warns about local variables called 'main'
>  KBUILD_CFLAGS += -Wno-main
>  endif
> diff --git a/init/Kconfig b/init/Kconfig
> index 11f8a845f259..b0582cd3e096 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -885,6 +885,11 @@ config ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
>  config CC_HAS_INT128
>  	def_bool !$(cc-option,$(m64-flag) -D__SIZEOF_INT128__=0) && 64BIT
>  
> +config CC_IMPLICIT_FALLTHROUGH
> +	string
> +	default "-Wimplicit-fallthrough=5" if CC_IS_GCC
> +	default "-Wimplicit-fallthrough" if CC_IS_CLANG && $(cc-option,-Wunreachable-code-fallthrough)
> +
>  #
>  # For architectures that know their GCC __int128 support is sound
>  #
> -- 
> 2.27.0
> 
> 
