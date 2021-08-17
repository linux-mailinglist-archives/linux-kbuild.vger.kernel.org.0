Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 767663EE430
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Aug 2021 04:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236098AbhHQCLW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 22:11:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:43732 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236003AbhHQCLV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 22:11:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id ECE2960F55;
        Tue, 17 Aug 2021 02:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629166249;
        bh=inwPr5OrBcrxdcYeUcfGHTux/xSUmSX3256AeE/FOng=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=b/pXkgSBDy8Qse7k8aKVg1NBofE7e/RkBt+pcXp1Sb7VJZEoHOH0XYsDs5r5tOYxb
         UZLsy862zKiNZ0mVwpYlTQVDQpsrik05/X1KWAJ0kVlkzVm3847hki7ewKLd/RYPpo
         8c9vdghZNcOBgyqguzHVH8hZwelGjsEsE0JFpglGLZ5LGMaCex/uy9hsxYCfY6GQ6N
         +9KWTcev2YUhUMyWLjxizi4Pnl7e2Jz+sKlgoXi5s8sgiHiroQTW0KPY5GPVwlF3p+
         wuLOdxBWkxzkx/pdDKOtgHvMwEVZd5LERyq2ij8/xd+O+IlwstmV93Kkq6vCPTpXLL
         qe0nMU00zyBTA==
Subject: Re: [PATCH 7/7] kbuild: remove cc-option-yn, update Docs
To:     Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com
References: <20210817002109.2736222-1-ndesaulniers@google.com>
 <20210817002109.2736222-8-ndesaulniers@google.com>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <7994255a-c411-049d-fc09-8b132eb3511c@kernel.org>
Date:   Mon, 16 Aug 2021 19:10:48 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210817002109.2736222-8-ndesaulniers@google.com>
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
> This allows us to remove cc-option-yn. Do so and update the docs with
> examples.
> 
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>   Documentation/kbuild/makefiles.rst | 22 +++++++++-------------
>   scripts/Makefile.compiler          |  5 -----
>   2 files changed, 9 insertions(+), 18 deletions(-)
> 
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index db3af0b45baf..4538c36d8df0 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -650,24 +650,20 @@ more details, with real examples.
>   	-march=pentium-mmx if supported by $(CC), otherwise -march=i586.
>   	The second argument to cc-option is optional, and if omitted,
>   	cflags-y will be assigned no value if first option is not supported.
> -	Note: cc-option uses KBUILD_CFLAGS for $(CC) options
> +	Note: cc-option uses KBUILD_CFLAGS for $(CC) options.
>   
> -   cc-option-yn
> -	cc-option-yn is used to check if gcc supports a given option
> -	and return 'y' if supported, otherwise 'n'.
> +	cc-option can be combined with conditionals to perform actions based on tool
> +	support.
>   
>   	Example::
>   
> -		#arch/ppc/Makefile
> -		biarch := $(call cc-option-yn, -m32)
> -		aflags-$(biarch) += -a32
> -		cflags-$(biarch) += -m32
> +		ifneq ($(call cc-option,$(FLAG)),)
> +		# $(FLAG) is supported
>   
> -	In the above example, $(biarch) is set to y if $(CC) supports the -m32
> -	option. When $(biarch) equals 'y', the expanded variables $(aflags-y)
> -	and $(cflags-y) will be assigned the values -a32 and -m32,
> -	respectively.
> -	Note: cc-option-yn uses KBUILD_CFLAGS for $(CC) options
> +	Or::
> +
> +		ifeq ($(call cc-option,$(FLAG)),)
> +		# $(FLAG) is not supported
>   
>       cc-disable-warning
>   	cc-disable-warning checks if gcc supports a given warning and returns
> diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
> index 86ecd2ac874c..c19c0b544c0f 100644
> --- a/scripts/Makefile.compiler
> +++ b/scripts/Makefile.compiler
> @@ -51,11 +51,6 @@ __cc-option = $(call try-run,\
>   cc-option = $(call __cc-option, $(CC),\
>   	$(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS),$(1),$(2))
>   
> -# cc-option-yn
> -# Usage: flag := $(call cc-option-yn,-march=winchip-c6)
> -cc-option-yn = $(call try-run,\
> -	$(CC) -Werror $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) $(1) -c -x c /dev/null -o "$$TMP",y,n)
> -
>   # cc-disable-warning
>   # Usage: cflags-y += $(call cc-disable-warning,unused-but-set-variable)
>   cc-disable-warning = $(call try-run,\
> 
