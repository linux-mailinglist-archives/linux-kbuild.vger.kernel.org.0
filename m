Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C88E63EE427
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Aug 2021 04:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234047AbhHQCGG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 22:06:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:42626 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233470AbhHQCGE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 22:06:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9FA6960F55;
        Tue, 17 Aug 2021 02:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629165932;
        bh=do4gAw28sO3tGDlWSjexb3s3oGika8l30YwihCaYLzg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=PFytUkkd8JPOtJNn2ChtVI4nLYAg7oQQAvg2SVi/hvNPRJ2ZFrpQOX445C4BM/XC4
         FfKf/J5+n7PlrbyQTVaUIIBHvfSZQwGgRfI86MSp7wn6WoG0cdBSGIwPBP2D1MukGL
         SR/WrbO/9A1A/+zrqR+gSoIu7rjepa1DofJlI8jTESH8o2cjM6/LjaMgW1NGFR8lGO
         Cy2FQcQleUuBGj/lNJt3wTp4sb6A39/dg5elXr1y1BA9O2Q1F62RKOYPvLVtI6mxjU
         p9i9r2O0v4Dy5qkd7nfgs21HVDkqkaHCyZcY8ajS/Dyy3hktU4xDFXGh9sx68PA+Yz
         pgL2byqE5kcNg==
Subject: Re: [PATCH 4/7] arc: replace cc-option-yn uses with cc-option
To:     Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Vineet Gupta <vgupta@kernel.org>,
        linux-snps-arc@lists.infradead.org
References: <20210817002109.2736222-1-ndesaulniers@google.com>
 <20210817002109.2736222-5-ndesaulniers@google.com>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <bc8cf0be-9e51-e769-0685-2594802eead0@kernel.org>
Date:   Mon, 16 Aug 2021 19:05:30 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210817002109.2736222-5-ndesaulniers@google.com>
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
> Cc: Vineet Gupta <vgupta@kernel.org>
> Cc: linux-snps-arc@lists.infradead.org
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>   arch/arc/Makefile | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arc/Makefile b/arch/arc/Makefile
> index c0d87ac2e221..8782a03f24a8 100644
> --- a/arch/arc/Makefile
> +++ b/arch/arc/Makefile
> @@ -18,8 +18,7 @@ ifeq ($(CONFIG_ARC_TUNE_MCPU),"")
>   cflags-y				+= $(tune-mcpu-def-y)
>   else
>   tune-mcpu				:= $(shell echo $(CONFIG_ARC_TUNE_MCPU))
> -tune-mcpu-ok 				:= $(call cc-option-yn, $(tune-mcpu))
> -ifeq ($(tune-mcpu-ok),y)
> +ifneq ($(call cc-option,$(tune-mcpu)),)
>   cflags-y				+= $(tune-mcpu)

Any reason not to just turn this into

cflags-y += $(call cc-option,$(tune-mcpu))

?

If $(tune-mcpu) is empty or invalid, nothing will be added to cflags-y.

>   else
>   # The flag provided by 'CONFIG_ARC_TUNE_MCPU' option isn't known by this compiler
> 
