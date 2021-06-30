Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE1C3B876C
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Jun 2021 19:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230191AbhF3RLT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 30 Jun 2021 13:11:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:54026 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229963AbhF3RLT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 Jun 2021 13:11:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B9C1C6146E;
        Wed, 30 Jun 2021 17:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625072930;
        bh=YFJP55cmbAqgs8sSAVdSjr3f86joqS6BnmO4BVogJ5Y=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=sNy8kmkX6Vs3LhFd8+zjza11NGG94rgVndCLRTynbJerkkZy7bCdV4qg/ds1P7GVe
         1jpAWf52DYmwqHmivSN6y0bW/mKNtm6R7ftO6C7vs4Vhek4oApzo1lx5o6N1Sr0n/g
         KfuNn7V8qOAnf59zg/frIsjZZMpNAWku82K+ts61dwAIMa1+9qv3kJUgXHZ+aClLvW
         eymjuqZ/RhhggLfAK0LHVkkVRi/JU28dRIS6xUJH4cAVumbXwTqHFsilUpOcFJpIC/
         oqEL/yZPC0Gx4Rl5VQ9OLCqRLiFdEkAb9LGTtj6Fph78UhQbT+ujN843SgMIJrFrkc
         Q0Six4eeahalg==
Subject: Re: [PATCH 2/2] Kbuild: lto: add make version checking
To:     Lecopzer Chen <lecopzer.chen@mediatek.com>, keescook@chromium.org,
        samitolvanen@google.com, linux-kbuild@vger.kernel.org
Cc:     clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org,
        yj.chiang@mediatek.com, masahiroy@kernel.org,
        michal.lkml@markovi.net
References: <20210630121436.19581-1-lecopzer.chen@mediatek.com>
 <20210630121436.19581-3-lecopzer.chen@mediatek.com>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <6d687b9a-c295-ce8b-9472-d2859977be2d@kernel.org>
Date:   Wed, 30 Jun 2021 10:08:48 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210630121436.19581-3-lecopzer.chen@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 6/30/2021 5:14 AM, Lecopzer Chen wrote:
> LTO with MODVERSION will fail in generating correct CRC because
> the makefile rule doesn't work for make with version 3.8X.[1]
> 
> Thus we need to check make version during selecting on LTO Kconfig.
> and the suitable version should be 4.2(40200) which release in 2016[2].
> 
> [1] https://lore.kernel.org/lkml/20210616080252.32046-1-lecopzer.chen@mediatek.com/
> [2] https://ftp.gnu.org/gnu/make/
> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> ---
>   arch/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index c45b770d3579..1571957bade5 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -632,6 +632,7 @@ config HAS_LTO_CLANG
>   	def_bool y
>   	# Clang >= 11: https://github.com/ClangBuiltLinux/linux/issues/510
>   	depends on CC_IS_CLANG && CLANG_VERSION >= 110000 && LD_IS_LLD && AS_IS_LLVM
> +	depends on MAKE_VERSION_INT >= 40200

If the bug depends on CONFIG_MODVERSIONS, should this be

depends on !MODVERSIONS || MAKE_VERSION >= 40200

? Especially since the problematic block in your original report is 
gated on CONFIG_LTO_CLANG + CONFIG_MODVERSIONS.

>   	depends on $(success,$(NM) --help | head -n 1 | grep -qi llvm)
>   	depends on $(success,$(AR) --help | head -n 1 | grep -qi llvm)
>   	depends on ARCH_SUPPORTS_LTO_CLANG
> 
