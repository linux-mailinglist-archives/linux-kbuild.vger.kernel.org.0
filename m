Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C32DB37AF35
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 May 2021 21:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231917AbhEKTTW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 11 May 2021 15:19:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:55488 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231454AbhEKTTV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 May 2021 15:19:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C2272611F1;
        Tue, 11 May 2021 19:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620760694;
        bh=OEnC+hTQkqd18So/wAQnB6c5Bc/i2RbUX1zbz1arhhM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=DlAB3HoTjseavUnS2iWpqzVp7iI+FGpuo3z1Iw8dvfHiwc3qsbyzTpNcoRNuMpfyc
         NHUxSdQ9vUjtlHZwhJ74sM9NSMbXeQ9jI+2whGuHcSvGYE/cDUzNaqh5uII7qgRpOY
         kFDksDPmWamkc/cld+/dGFj5KK2HAWrIy7D+fjV8WZediM6CH72zje/QeWtwpMh18K
         ZD5t7qgYp+dSi2NlfgjFh7mUcgHWi59oP7nAn25w35U762ymMGZqxiQrTzt2HoMGG7
         6pUj629YTT7Tjsd2TY36wBoOzQjhqCThTkUrO0+IH8YdLJoceeCv8aRLYixKSODBhV
         TijhJavRzV9eA==
Subject: Re: [PATCH kernel v2] powerpc/makefile: Do not redefine $(CPP) for
 preprocessor
To:     Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Cc:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michal Marek <michal.lkml@markovi.net>,
        Nicholas Piggin <npiggin@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210511044812.267965-1-aik@ozlabs.ru>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <3579aa0d-0470-9a6b-e35b-48f997a5b48b@kernel.org>
Date:   Tue, 11 May 2021 12:18:12 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210511044812.267965-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 5/10/2021 9:48 PM, Alexey Kardashevskiy wrote:
> The $(CPP) (do only preprocessing) macro is already defined in Makefile.
> However POWERPC redefines it and adds $(KBUILD_CFLAGS) which results
> in flags duplication. Which is not a big deal by itself except for
> the flags which depend on other flags and the compiler checks them
> as it parses the command line.
> 
> Specifically, scripts/Makefile.build:304 generates ksyms for .S files.
> If clang+llvm+sanitizer are enabled, this results in
> 
> -emit-llvm-bc -fno-lto -flto -fvisibility=hidden \
>   -fsanitize=cfi-mfcall -fno-lto  ...
> 
> in the clang command line and triggers error:
> 
> clang-13: error: invalid argument '-fsanitize=cfi-mfcall' only allowed with '-flto'
> 
> This removes unnecessary CPP redefinition. Which works fine as in most
> place KBUILD_CFLAGS is passed to $CPP except
> arch/powerpc/kernel/vdso64/vdso(32|64).lds (and probably some others,
> not yet detected). To fix vdso, we do:
> 1. explicitly add -m(big|little)-endian to $CPP
> 2. (for clang) add $CLANG_FLAGS to $KBUILD_CPPFLAGS as otherwise clang
> silently ignores -m(big|little)-endian if the building platform does not
> support big endian (such as x86) so --prefix= is required.
> 
> While at this, remove some duplication from CPPFLAGS_vdso(32|64)
> as cmd_cpp_lds_S has them anyway. It still puzzles me why we need -C
> (preserve comments in the preprocessor output) flag here.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
> Changes:
> v2:
> * fix KBUILD_CPPFLAGS
> * add CLANG_FLAGS to CPPFLAGS
> ---
>   Makefile                            | 1 +
>   arch/powerpc/Makefile               | 3 ++-
>   arch/powerpc/kernel/vdso32/Makefile | 2 +-
>   arch/powerpc/kernel/vdso64/Makefile | 2 +-
>   4 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 72af8e423f11..13acd2183d55 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -591,6 +591,7 @@ CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
>   endif
>   CLANG_FLAGS	+= -Werror=unknown-warning-option
>   KBUILD_CFLAGS	+= $(CLANG_FLAGS)
> +KBUILD_CPPFLAGS	+= $(CLANG_FLAGS)

This is going to cause flag duplication, which would be nice to avoid. I 
do not know if we can get away with just adding $(CLANG_FLAGS) to 
KBUILD_CPPFLAGS instead of KBUILD_CFLAGS though. It seems like this 
assignment might be better in arch/powerpc/Makefile with the 
KBUILD_CPPFLAGS additions there.

Cheers,
Nathan

>   KBUILD_AFLAGS	+= $(CLANG_FLAGS)
>   export CLANG_FLAGS
>   endif
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index 3212d076ac6a..306bfd2797ad 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -76,6 +76,7 @@ endif
>   
>   ifdef CONFIG_CPU_LITTLE_ENDIAN
>   KBUILD_CFLAGS	+= -mlittle-endian
> +KBUILD_CPPFLAGS	+= -mlittle-endian
>   KBUILD_LDFLAGS	+= -EL
>   LDEMULATION	:= lppc
>   GNUTARGET	:= powerpcle
> @@ -83,6 +84,7 @@ MULTIPLEWORD	:= -mno-multiple
>   KBUILD_CFLAGS_MODULE += $(call cc-option,-mno-save-toc-indirect)
>   else
>   KBUILD_CFLAGS += $(call cc-option,-mbig-endian)
> +KBUILD_CPPFLAGS += $(call cc-option,-mbig-endian)
>   KBUILD_LDFLAGS	+= -EB
>   LDEMULATION	:= ppc
>   GNUTARGET	:= powerpc
> @@ -208,7 +210,6 @@ KBUILD_CPPFLAGS	+= -I $(srctree)/arch/$(ARCH) $(asinstr)
>   KBUILD_AFLAGS	+= $(AFLAGS-y)
>   KBUILD_CFLAGS	+= $(call cc-option,-msoft-float)
>   KBUILD_CFLAGS	+= -pipe $(CFLAGS-y)
> -CPP		= $(CC) -E $(KBUILD_CFLAGS)
>   
>   CHECKFLAGS	+= -m$(BITS) -D__powerpc__ -D__powerpc$(BITS)__
>   ifdef CONFIG_CPU_BIG_ENDIAN
> diff --git a/arch/powerpc/kernel/vdso32/Makefile b/arch/powerpc/kernel/vdso32/Makefile
> index 7d9a6fee0e3d..ea001c6df1fa 100644
> --- a/arch/powerpc/kernel/vdso32/Makefile
> +++ b/arch/powerpc/kernel/vdso32/Makefile
> @@ -44,7 +44,7 @@ asflags-y := -D__VDSO32__ -s
>   
>   obj-y += vdso32_wrapper.o
>   targets += vdso32.lds
> -CPPFLAGS_vdso32.lds += -P -C -Upowerpc
> +CPPFLAGS_vdso32.lds += -C
>   
>   # link rule for the .so file, .lds has to be first
>   $(obj)/vdso32.so.dbg: $(src)/vdso32.lds $(obj-vdso32) $(obj)/vgettimeofday.o FORCE
> diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vdso64/Makefile
> index 2813e3f98db6..07eadba48c7a 100644
> --- a/arch/powerpc/kernel/vdso64/Makefile
> +++ b/arch/powerpc/kernel/vdso64/Makefile
> @@ -30,7 +30,7 @@ ccflags-y := -shared -fno-common -fno-builtin -nostdlib \
>   asflags-y := -D__VDSO64__ -s
>   
>   targets += vdso64.lds
> -CPPFLAGS_vdso64.lds += -P -C -U$(ARCH)
> +CPPFLAGS_vdso64.lds += -C
>   
>   # link rule for the .so file, .lds has to be first
>   $(obj)/vdso64.so.dbg: $(src)/vdso64.lds $(obj-vdso64) $(obj)/vgettimeofday.o FORCE
> 

