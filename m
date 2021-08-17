Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 021A53EE42E
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Aug 2021 04:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236098AbhHQCKK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 22:10:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:43668 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235967AbhHQCKK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 22:10:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 14AB2603E7;
        Tue, 17 Aug 2021 02:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629166177;
        bh=8WZGD65pwXlKb7uHAT1xCUURXbmhlWVkpYyGj7jvRCk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=gb5Ffs4gIBoOPh9ozCUWezRN5E2wuJXesKAVVDj5/A0KHKHB/UiDHJF/3+wi1IKIL
         FJHdS3aYQLNmEK2CGrLcAL9yWwqu83Og0sKCvnTJzfo9n6JX4ObljAunUw5GSSlAG/
         ZhaJeiGR6GgBtaEJr4RZ/5BT5esLptb1JMgXZDNrb/xmkJZ+ejIlNkKBkEKhfamEGY
         fViF+CnzEVSbIAuFafrkHj15xJnsjxgaXLU4Z+fhylNEVS08Ni6raoc1kYtex2rWdr
         4hjD/CxlX82IVvSHVZOMlMFZ9rKl15QNGTfQXDqF6V0OGyFxHHmMUlblePsRNcidSx
         lx3i24oobyztw==
Subject: Re: [PATCH 6/7] Makefile: replace cc-option-yn uses with cc-option
To:     Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com
References: <20210817002109.2736222-1-ndesaulniers@google.com>
 <20210817002109.2736222-7-ndesaulniers@google.com>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <49f8780d-3174-e196-8ba4-d6d1de36aeb1@kernel.org>
Date:   Mon, 16 Aug 2021 19:09:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210817002109.2736222-7-ndesaulniers@google.com>
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
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>   Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 72f9e2b0202c..f76be5f62d79 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -967,7 +967,7 @@ ifdef CONFIG_FUNCTION_TRACER
>   ifdef CONFIG_FTRACE_MCOUNT_USE_CC
>     CC_FLAGS_FTRACE	+= -mrecord-mcount
>     ifdef CONFIG_HAVE_NOP_MCOUNT
> -    ifeq ($(call cc-option-yn, -mnop-mcount),y)
> +    ifneq ($(call cc-option, -mnop-mcount),)
>         CC_FLAGS_FTRACE	+= -mnop-mcount
>         CC_FLAGS_USING	+= -DCC_USING_NOP_MCOUNT
>       endif
> 
