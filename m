Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 897D33BAAAE
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Jul 2021 02:15:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbhGDASK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 3 Jul 2021 20:18:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:53452 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229529AbhGDASK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 3 Jul 2021 20:18:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F28A61443;
        Sun,  4 Jul 2021 00:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625357735;
        bh=x2jKVCFz8OC1byDPotq5PtP0DlRfL7r11dS1pexib5s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TwTr8CiItovYH7ur3qw3So2fE4vD6t7Qm7DF76MuCamZ1MM3ZGrJXuKdbkRmuXdgb
         oXFYZXDW3xWQ5cEXKcPoxFddpDynJTLQlIXYpGFpi7uMqt1zkTmfquYrj1v4RLA/VQ
         g7XI+OY8MbySgrGqX4BTSGG6scbAuOBq8NHHN3mLlMb7COIMlst6qVj5Ni5VLrc0Af
         0r8Zacru+TsaxgbLIGhoK2bpgPMbT4bX1AWLb/HdEz2uOMkv0Epoa3Wbc/zkVbDTYv
         LXoeI8b82ORVA7baGniFwuwzNM2N3UkK96fIrWUfixt4O0CGTdVp9NIjyjmfrDoq8k
         AQU69Fa5jZWDg==
Date:   Sat, 3 Jul 2021 17:15:32 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Lecopzer Chen <lecopzer.chen@mediatek.com>
Cc:     ndesaulniers@google.com, keescook@chromium.org,
        samitolvanen@google.com, linux-kbuild@vger.kernel.org,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org,
        yj.chiang@mediatek.com, masahiroy@kernel.org,
        michal.lkml@markovi.net
Subject: Re: [PATCH v3 1/2] Kbuild: lto: add CONFIG_MAKE_VERSION
Message-ID: <YOD9pHmdaU48V4AZ@Ryzen-9-3900X.localdomain>
References: <20210702032943.7865-1-lecopzer.chen@mediatek.com>
 <20210702032943.7865-2-lecopzer.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210702032943.7865-2-lecopzer.chen@mediatek.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jul 02, 2021 at 11:29:42AM +0800, Lecopzer Chen wrote:
> To check the GNU make version. Used by the LTO Kconfig.
> 
> LTO with MODVERSIONS will fail in generating correct CRC because
> the makefile rule doesn't work for make with version 3.8X.[1]
> 
> Thus we need to check make version during selecting on LTO Kconfig.
> Add CONFIG_MAKE_VERSION which means MAKE_VERSION in canonical digits
> for arithmetic comparisons.
> 
> [1] https://lore.kernel.org/lkml/20210616080252.32046-1-lecopzer.chen@mediatek.com/
> Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  Makefile                |  2 +-
>  init/Kconfig            |  4 ++++
>  scripts/make-version.sh | 13 +++++++++++++
>  3 files changed, 18 insertions(+), 1 deletion(-)
>  create mode 100755 scripts/make-version.sh
> 
> diff --git a/Makefile b/Makefile
> index 88888fff4c62..2402745b2ba9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -516,7 +516,7 @@ CLANG_FLAGS :=
>  
>  export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC
>  export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
> -export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
> +export PERL PYTHON3 CHECK CHECKFLAGS MAKE MAKE_VERSION UTS_MACHINE HOSTCXX
>  export KGZIP KBZIP2 KLZOP LZMA LZ4 XZ ZSTD
>  export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
>  
> diff --git a/init/Kconfig b/init/Kconfig
> index 55f9f7738ebb..ecc110504f87 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -86,6 +86,10 @@ config CC_HAS_ASM_INLINE
>  config CC_HAS_NO_PROFILE_FN_ATTR
>  	def_bool $(success,echo '__attribute__((no_profile_instrument_function)) int x();' | $(CC) -x c - -c -o /dev/null -Werror)
>  
> +config MAKE_VERSION
> +	int
> +	default $(shell,$(srctree)/scripts/make-version.sh $(MAKE_VERSION))
> +
>  config CONSTRUCTORS
>  	bool
>  
> diff --git a/scripts/make-version.sh b/scripts/make-version.sh
> new file mode 100755
> index 000000000000..3a451db3c067
> --- /dev/null
> +++ b/scripts/make-version.sh
> @@ -0,0 +1,13 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Print the GNU make version in a 5 or 6-digit form.
> +
> +set -e
> +
> +# Convert the version string x.y.z to a canonical 5 or 6-digit form.
> +IFS=.
> +set -- $1
> +
> +# If the 2nd or 3rd field is missing, fill it with a zero.
> +echo $((10000 * $1 + 100 * ${2:-0} + ${3:-0}))
> -- 
> 2.18.0
