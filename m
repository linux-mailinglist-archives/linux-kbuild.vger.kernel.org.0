Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B096B3EE41E
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Aug 2021 04:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233470AbhHQCDf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 22:03:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:42304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233394AbhHQCDf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 22:03:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id ACF6060F4B;
        Tue, 17 Aug 2021 02:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629165783;
        bh=e+rS+LR9NfgDjAiXHol5GUKfbYmEF4q70/AUOd5kcb8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=beFEPt13SOo0/YQjwHI9+GREGEuU2T91NSyKvJKSLLQhra97u4uLFsBHUY/4UcKzd
         5C/t4KmYx3FLYHuoBGOb1SmhVpyaLCQg+kzUo6yCiIuUOb4LRF6H8Y5/BD8nQ2XnFe
         GyyKLcVmCsWKFMQUn+/LVtQTNyuaq1AjOEgROpWQDjA5IoSpoyz705s2asutNxXARf
         MJqIgDx4YFSj841+QWHYc5toBVnTNuASHy+0Pmo+lzInFLi6/JqxSeka1NvVl6Yml1
         bdoPmK6bWZWSOGbZhzyF0ONYv8RTzAX46OAzSXd8lDGj021QINA+2T8fXDaZUtwg3u
         P4V8y197suqqA==
Subject: Re: [PATCH 2/7] s390: replace cc-option-yn uses with cc-option
To:     Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        linux-s390@vger.kernel.org
References: <20210817002109.2736222-1-ndesaulniers@google.com>
 <20210817002109.2736222-3-ndesaulniers@google.com>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <5cb6d40b-1c45-415e-47fb-a844265e7f34@kernel.org>
Date:   Mon, 16 Aug 2021 19:03:01 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210817002109.2736222-3-ndesaulniers@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 8/16/2021 5:21 PM, 'Nick Desaulniers' via Clang Built Linux wrote:
> cc-option-yn can be replaced with cc-option. ie.
> Checking for support:
> ifeq ($(call cc-option-yn,$(FLAG)),y)
> becomes:
> ifneq ($(call cc-option,$(FLAG)),)
> 
> Checking for lack of support:
> ifeq ($(call cc-option-yn,$(FLAG)),n)
> becomes:
> ifeq ($(call cc-option,$(FLAG)),)
> 
> This allows us to pursue removing cc-option-yn.
> 
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: linux-s390@vger.kernel.org
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>   arch/s390/Makefile | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/s390/Makefile b/arch/s390/Makefile
> index 17dc4f1ac4fa..a3cf33ad009f 100644
> --- a/arch/s390/Makefile
> +++ b/arch/s390/Makefile
> @@ -70,7 +70,7 @@ cflags-y += -Wa,-I$(srctree)/arch/$(ARCH)/include
>   #
>   cflags-$(CONFIG_FRAME_POINTER) += -fno-optimize-sibling-calls
>   
> -ifeq ($(call cc-option-yn,-mpacked-stack -mbackchain -msoft-float),y)
> +ifneq ($(call cc-option,-mpacked-stack -mbackchain -msoft-float),)
>   cflags-$(CONFIG_PACK_STACK)  += -mpacked-stack -D__PACK_STACK
>   aflags-$(CONFIG_PACK_STACK)  += -D__PACK_STACK
>   endif
> @@ -78,22 +78,22 @@ endif
>   KBUILD_AFLAGS_DECOMPRESSOR += $(aflags-y)
>   KBUILD_CFLAGS_DECOMPRESSOR += $(cflags-y)
>   
> -ifeq ($(call cc-option-yn,-mstack-size=8192 -mstack-guard=128),y)
> +ifneq ($(call cc-option,-mstack-size=8192 -mstack-guard=128),)
>   cflags-$(CONFIG_CHECK_STACK) += -mstack-size=$(STACK_SIZE)
> -ifneq ($(call cc-option-yn,-mstack-size=8192),y)
> +ifeq ($(call cc-option,-mstack-size=8192),)
>   cflags-$(CONFIG_CHECK_STACK) += -mstack-guard=$(CONFIG_STACK_GUARD)
>   endif
>   endif
>   
>   ifdef CONFIG_WARN_DYNAMIC_STACK
> -  ifeq ($(call cc-option-yn,-mwarn-dynamicstack),y)
> +  ifneq ($(call cc-option,-mwarn-dynamicstack),)
>       KBUILD_CFLAGS += -mwarn-dynamicstack
>       KBUILD_CFLAGS_DECOMPRESSOR += -mwarn-dynamicstack
>     endif
>   endif
>   
>   ifdef CONFIG_EXPOLINE
> -  ifeq ($(call cc-option-yn,$(CC_FLAGS_MARCH) -mindirect-branch=thunk),y)
> +  ifneq ($(call cc-option,$(CC_FLAGS_MARCH) -mindirect-branch=thunk),)
>       CC_FLAGS_EXPOLINE := -mindirect-branch=thunk
>       CC_FLAGS_EXPOLINE += -mfunction-return=thunk
>       CC_FLAGS_EXPOLINE += -mindirect-branch-table
> @@ -104,10 +104,10 @@ ifdef CONFIG_EXPOLINE
>   endif
>   
>   ifdef CONFIG_FUNCTION_TRACER
> -  ifeq ($(call cc-option-yn,-mfentry -mnop-mcount),n)
> +  ifeq ($(call cc-option,-mfentry -mnop-mcount),)
>       # make use of hotpatch feature if the compiler supports it
>       cc_hotpatch	:= -mhotpatch=0,3
> -    ifeq ($(call cc-option-yn,$(cc_hotpatch)),y)
> +    ifneq ($(call cc-option,$(cc_hotpatch)),)
>         CC_FLAGS_FTRACE := $(cc_hotpatch)
>         KBUILD_AFLAGS	+= -DCC_USING_HOTPATCH
>         KBUILD_CFLAGS	+= -DCC_USING_HOTPATCH
> 
