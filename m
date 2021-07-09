Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BDA13C2A30
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Jul 2021 22:12:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbhGIUOx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Jul 2021 16:14:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:38170 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229459AbhGIUOx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Jul 2021 16:14:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AFA69613AB;
        Fri,  9 Jul 2021 20:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625861529;
        bh=DL2873M8Z+eG0pLPihjVaDqpeBObpt8oA1y2q95ITLg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=n23WiiqxLb5bprTf7rnrdb6W1hHHRFQZjIsHw47lrgvJY3KEMAnnhorH9NJ3GAbtd
         0zu/fwB/sFo4pQlZulDLf8lWlIs0cUsKvzJS9onTnQz1pnjA4JPb42b9wIxamxle4O
         XxlNpuW3xRyge/Xuyb82lZ4Xoor+TqrsGeWFB1SdGvM0+OVByyAR6NUOcsUoH8awbR
         0L5EmkYFquz19cbF6JVRUNvAPezaSkqYQtI0e/0Atmh2p/mhFVoGQv9cttqHISeS8U
         SixGmggusxPBxdOjm9vnAQf6sqn/K6A0OUPeRq1MUZHMHRK4EgKijaU/BwxiMdo5TU
         3UZx/uOKtvjfg==
Subject: Re: [PATCH v2 1/2] Makefile: move initial clang flag handling into
 scripts/Makefile.clang
To:     Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>, Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <20210708232522.3118208-1-ndesaulniers@google.com>
 <20210708232522.3118208-2-ndesaulniers@google.com>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <9f66019d-6207-1d4b-0a80-30f09b819ff4@kernel.org>
Date:   Fri, 9 Jul 2021 13:12:08 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708232522.3118208-2-ndesaulniers@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 7/8/2021 4:25 PM, 'Nick Desaulniers' via Clang Built Linux wrote:
> With some of the changes we'd like to make to CROSS_COMPILE, the initial
> block of clang flag handling which controls things like the target triple,
> whether or not to use the integrated assembler and how to find GAS,
> and erroring on unknown warnings is becoming unwieldy. Move it into its
> own file under scripts/.
> 
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>   MAINTAINERS            |  1 +
>   Makefile               | 15 +--------------
>   scripts/Makefile.clang | 14 ++++++++++++++
>   3 files changed, 16 insertions(+), 14 deletions(-)
>   create mode 100644 scripts/Makefile.clang
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 81e1edeceae4..9c1205c258c7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4433,6 +4433,7 @@ B:	https://github.com/ClangBuiltLinux/linux/issues
>   C:	irc://chat.freenode.net/clangbuiltlinux
>   F:	Documentation/kbuild/llvm.rst
>   F:	include/linux/compiler-clang.h
> +F:	scripts/Makefile.clang
>   F:	scripts/clang-tools/
>   K:	\b(?i:clang|llvm)\b
>   
> diff --git a/Makefile b/Makefile
> index cbab0dc53065..010e3a4e770b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -586,20 +586,7 @@ endif
>   CC_VERSION_TEXT = $(subst $(pound),,$(shell $(CC) --version 2>/dev/null | head -n 1))
>   
>   ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
> -ifneq ($(CROSS_COMPILE),)
> -CLANG_FLAGS	+= --target=$(notdir $(CROSS_COMPILE:%-=%))
> -endif
> -ifeq ($(LLVM_IAS),1)
> -CLANG_FLAGS	+= -integrated-as
> -else
> -CLANG_FLAGS	+= -no-integrated-as
> -GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
> -CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
> -endif
> -CLANG_FLAGS	+= -Werror=unknown-warning-option
> -KBUILD_CFLAGS	+= $(CLANG_FLAGS)
> -KBUILD_AFLAGS	+= $(CLANG_FLAGS)
> -export CLANG_FLAGS
> +include $(srctree)/scripts/Makefile.clang
>   endif
>   
>   # Include this also for config targets because some architectures need
> diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
> new file mode 100644
> index 000000000000..297932e973d4
> --- /dev/null
> +++ b/scripts/Makefile.clang
> @@ -0,0 +1,14 @@
> +ifneq ($(CROSS_COMPILE),)
> +CLANG_FLAGS	+= --target=$(notdir $(CROSS_COMPILE:%-=%))
> +endif
> +ifeq ($(LLVM_IAS),1)
> +CLANG_FLAGS	+= -integrated-as
> +else
> +CLANG_FLAGS	+= -no-integrated-as
> +GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
> +CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
> +endif
> +CLANG_FLAGS	+= -Werror=unknown-warning-option
> +KBUILD_CFLAGS	+= $(CLANG_FLAGS)
> +KBUILD_AFLAGS	+= $(CLANG_FLAGS)
> +export CLANG_FLAGS
> 
