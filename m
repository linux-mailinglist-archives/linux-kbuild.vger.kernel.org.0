Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3727537FDAF
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 May 2021 20:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231921AbhEMTA0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 13 May 2021 15:00:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:46444 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230352AbhEMTA0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 13 May 2021 15:00:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9ED4061264;
        Thu, 13 May 2021 18:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620932356;
        bh=CNlWPuDlH4KO4XDrkInCB6C/vySWY4yRCKjQVEyQquI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=jbm4kRsmye3VePuEY0uiOXpxuAR45Yth9vGMIuLZA/281w7viNipT9Pkj3hSuhNTn
         MROnDhqdIMGP1KxFI7cRE15VJR7+3Eyn9jV6EythV+BQZDuC8abju9f7vBEEmCxQOe
         e2ZWWrYSP7vodJweDjUZtwu5NYx0o6skn/u4qy1SdvhyIJzjMNdEVcybKv6cQ/Ckyo
         QkZXXiGDcBrmK9nDJ1i3SFQdmBOgaWtfMzZUWJU0NTL2e3QSfuGTucKEPA1bhpNx+7
         eyWaWJq8HO+8+iHN3d1RoVR66e8oTcxfKqlB3E94hEyffhJ89wsxwaj61l4MIQFXu+
         mjBK0ZitZL/SA==
Subject: Re: [PATCH kernel v3] powerpc/makefile: Do not redefine $(CPP) for
 preprocessor
To:     Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Segher Boessenkool <segher@kernel.crashing.org>
References: <20210513115904.519912-1-aik@ozlabs.ru>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <dedc7262-2956-37b2-ebfd-ae8eb9b56716@kernel.org>
Date:   Thu, 13 May 2021 11:59:14 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210513115904.519912-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 5/13/2021 4:59 AM, Alexey Kardashevskiy wrote:
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
> arch/powerpc/kernel/vdso64/vdso(32|64).lds. To fix vdso, this does:
> 1. add -m(big|little)-endian to $CPP
> 2. add target to $KBUILD_CPPFLAGS as otherwise clang ignores -m(big|little)-endian if
> the building platform does not support big endian (such as x86).
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
> Changes:
> v3:
> * moved vdso cleanup in a separate patch
> * only add target to KBUILD_CPPFLAGS for CLANG
> 
> v2:
> * fix KBUILD_CPPFLAGS
> * add CLANG_FLAGS to CPPFLAGS
> ---
>   Makefile              | 1 +
>   arch/powerpc/Makefile | 3 ++-
>   2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 15b6476d0f89..5b545bef7653 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -576,6 +576,7 @@ CC_VERSION_TEXT = $(subst $(pound),,$(shell $(CC) --version 2>/dev/null | head -
>   ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
>   ifneq ($(CROSS_COMPILE),)
>   CLANG_FLAGS	+= --target=$(notdir $(CROSS_COMPILE:%-=%))
> +KBUILD_CPPFLAGS	+= --target=$(notdir $(CROSS_COMPILE:%-=%))

You can avoid the duplication here by just doing:

KBUILD_CPPFLAGS	+= $(CLANG_FLAGS)

I am still not super happy about the flag duplication but I am not sure 
I can think of a better solution. If KBUILD_CPPFLAGS are always included 
when building .o files, maybe we should just add $(CLANG_FLAGS) to 
KBUILD_CPPFLAGS instead of KBUILD_CFLAGS?

>   endif
>   ifeq ($(LLVM_IAS),1)
>   CLANG_FLAGS	+= -integrated-as
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
> 

