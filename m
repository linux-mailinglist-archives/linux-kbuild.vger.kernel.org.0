Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C60563B8758
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Jun 2021 19:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbhF3RFS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 30 Jun 2021 13:05:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:53438 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229510AbhF3RFR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 Jun 2021 13:05:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 394086146E;
        Wed, 30 Jun 2021 17:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625072568;
        bh=/WzDn6Kj1sxzJvCvDJAMzxk39jLd33V2v6W2c7ytPiM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=XehvqsVKaBZI153B9pF0tVydNffPznB+rmoCQsGRtI3DpoLAk/FeryV1bNAE8TMOz
         8NPRJWBw2LkckJ6lFvB3d+jQQh+dZVL/kNEE6iawB3861XfY8E1FMyE1Hmyv79F4TQ
         zyvNTPWMVJGOGDIO6cjpaQpahgr6LFpXxv53dIaEeDk8OB/gI2aY+UuIeXUB7Ona+g
         PKG2bKDKPIG4MnHQlGx40HtDzrM9zSXXWjcMIVHR6jq3WZlkOeu7r+MMXna+IIqpw0
         Vp2mAAZAblnfS5751HrpXaIuvCRf4PfTgLnMX4WCw5KGfaJwqR+opL8imrla0U03Va
         grLeAV5N2L19A==
Subject: Re: [PATCH 1/2] Kbuild: lto: add make-version macros
To:     Lecopzer Chen <lecopzer.chen@mediatek.com>, keescook@chromium.org,
        samitolvanen@google.com, linux-kbuild@vger.kernel.org
Cc:     clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org,
        yj.chiang@mediatek.com, masahiroy@kernel.org,
        michal.lkml@markovi.net
References: <20210630121436.19581-1-lecopzer.chen@mediatek.com>
 <20210630121436.19581-2-lecopzer.chen@mediatek.com>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <fdcb8b80-00dd-dd59-1283-836736d4a773@kernel.org>
Date:   Wed, 30 Jun 2021 10:02:47 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210630121436.19581-2-lecopzer.chen@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Lecopzer,

On 6/30/2021 5:14 AM, Lecopzer Chen wrote:
> To check the GNU make version. Used by the LTO Kconfig.
> 
> LTO with MODVERSION will fail in generating correct CRC because
> the makefile rule doesn't work for make with version 3.8X.[1]
> 
> Thus we need to check make version during selecting on LTO Kconfig.
> The MAKE_VERSION_INT means MAKE_VERSION in canonical digits integer and
> implemnted by imitating CLANG_VERSION.

implemented

> 
> [1] https://lore.kernel.org/lkml/20210616080252.32046-1-lecopzer.chen@mediatek.com/
> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
> ---
>   Makefile                |  2 +-
>   init/Kconfig            |  4 ++++
>   scripts/Kconfig.include |  3 +++
>   scripts/make-version.sh | 13 +++++++++++++
>   4 files changed, 21 insertions(+), 1 deletion(-)
>   create mode 100755 scripts/make-version.sh
> 
> diff --git a/Makefile b/Makefile
> index 88888fff4c62..2402745b2ba9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -516,7 +516,7 @@ CLANG_FLAGS :=
>   
>   export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC
>   export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
> -export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
> +export PERL PYTHON3 CHECK CHECKFLAGS MAKE MAKE_VERSION UTS_MACHINE HOSTCXX
>   export KGZIP KBZIP2 KLZOP LZMA LZ4 XZ ZSTD
>   export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
>   
> diff --git a/init/Kconfig b/init/Kconfig
> index a61c92066c2e..9f2b71fdf23e 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -83,6 +83,10 @@ config TOOLS_SUPPORT_RELR
>   config CC_HAS_ASM_INLINE
>   	def_bool $(success,echo 'void foo(void) { asm inline (""); }' | $(CC) -x c - -c -o /dev/null)
>   
> +config MAKE_VERSION_INT

It might be cleaner to make this "config MAKE_VERSION". It will not 
conflict with the builtin MAKE_VERSION because this is really 
CONFIG_MAKE_VERSION, which is how MAKE_VERSION will be handled in Kconfig.

> +	int
> +	default $(make-version)
> +
>   config CONSTRUCTORS
>   	bool
>   
> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> index 0496efd6e117..f956953d0236 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -63,3 +63,6 @@ ld-version := $(shell,set -- $(ld-info) && echo $2)
>   cc-option-bit = $(if-success,$(CC) -Werror $(1) -E -x c /dev/null -o /dev/null,$(1))
>   m32-flag := $(cc-option-bit,-m32)
>   m64-flag := $(cc-option-bit,-m64)
> +
> +# Get the GNU make version with a canonical digit.
> +make-version := $(shell,$(srctree)/scripts/make-version.sh $(MAKE_VERSION))

It might be better for this to just be used directly by "config 
MAKE_VERSION":

config MAKE_VERSION
	int
	default $(shell,$(srctree)/scripts/make-version.sh $(MAKE_VERSION))

> diff --git a/scripts/make-version.sh b/scripts/make-version.sh
> new file mode 100755
> index 000000000000..ce5af96696cc
> --- /dev/null
> +++ b/scripts/make-version.sh
> @@ -0,0 +1,13 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Print the linker name and its version in a 5 or 6-digit form.
> +
> +set -e
> +
> +# Convert the version string x.y.z to a canonical 5 or 6-digit form.
> +IFS=.
> +set -- $1
> +
> +# If the 2nd or 3rd field is missing, fill it with a zero.
> +echo $((10000 * $1 + 100 * ${2:-0} + ${3:-0}))
> 
