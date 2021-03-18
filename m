Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9529340F93
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Mar 2021 22:14:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbhCRVOB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 18 Mar 2021 17:14:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:45218 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230457AbhCRVOA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Mar 2021 17:14:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 89FC664E81;
        Thu, 18 Mar 2021 21:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616102040;
        bh=ymzR/BVB05taPUJyOe+kMw5p3EuhtWE1/rYWcC3GASU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IOSIjoJm92vHIaVL45kyGqc7KqR434aQ3KU0DGSL4gkHl3x1M5zRtanzOUda1Fx3Q
         V838lJGMjGv2AC9sWXUibBub0Cc2CPtih1mYRCaJwEbtf8nR369fyppYpgG+63dCFt
         AtcFj413WXhgO7hLMR5qj3LVjGUNbsuA/OZe4w8x253fHrLRFQz4y6dulh5AxXTlwD
         ftzqRWWmUpdwLAr7EI5U8nvrY/rncEg3VH2pPwHWUGysmBbut/R7ng5c8kv7gQez2t
         KEuVq33NFY6LQHLfp3Th2gxn+tOcl3rmxKOqOlo1OEaAB3UR8HisIqjnoUGKaekD4G
         5TWqIRKQ4MOiw==
Date:   Thu, 18 Mar 2021 14:13:56 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Subject: Re: [PATCH 4/4] kbuild: include Makefile.compiler only when compiler
 is required
Message-ID: <20210318211356.nxr4wx24srjtjdqm@archlinux-ax161>
References: <20210228061028.239459-1-masahiroy@kernel.org>
 <20210228061028.239459-4-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210228061028.239459-4-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Feb 28, 2021 at 03:10:28PM +0900, Masahiro Yamada wrote:
> Since commit f2f02ebd8f38 ("kbuild: improve cc-option to clean up all
> temporary files"), running 'make kernelversion' in a read-only source
> tree emits a bunch of warnings:
> 
>   mkdir: cannot create directory '.tmp_12345': Permission denied
> 
> Non-build targets such as kernelversion, clean, help, etc. do not
> need to evaluate $(call cc-option,) and friends. Do not include
> Makefile.compiler so $(call cc-option,) becomes no-op.
> 
> This not only fix the warnings, but also runs non-build targets much
> faster.
> 
> Basically, all installation targets should also be non-build targets.
> Unfortunately, vdso_install requires the compiler because it builds
> vdso before installtion. This is a problem that must be fixed by a
> separate patch.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
> I am not adding Reported-by for now because a reporter sent me
> an email privately.
> 
> If he allows me to add Reported-by, I will add it to record
> the credit.
> 
> (Perhaps, another person might have reported a similar issue
> somewhere, but my memory is obsure. I cannot recall it.)
> 
> 
>  Makefile | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index eec7a94f5c33..20724711dc71 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -263,6 +263,10 @@ no-dot-config-targets := $(clean-targets) \
>  			 $(version_h) headers headers_% archheaders archscripts \
>  			 %asm-generic kernelversion %src-pkg dt_binding_check \
>  			 outputmakefile
> +# Installation targets should not require compiler. Unfortunately, vdso_install
> +# is an exception where build artifacts may be updated. This must be fixed.
> +no-compiler-targets := $(no-dot-config-targets) install dtbs_install \
> +			headers_install modules_install kernelrelease image_name
>  no-sync-config-targets := $(no-dot-config-targets) %install kernelrelease \
>  			  image_name
>  single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.s %.symtypes %/
> @@ -270,6 +274,7 @@ single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.s %.symtypes %/
>  config-build	:=
>  mixed-build	:=
>  need-config	:= 1
> +need-compiler	:= 1
>  may-sync-config	:= 1
>  single-build	:=
>  
> @@ -279,6 +284,12 @@ ifneq ($(filter $(no-dot-config-targets), $(MAKECMDGOALS)),)
>  	endif
>  endif
>  
> +ifneq ($(filter $(no-compiler-targets), $(MAKECMDGOALS)),)
> +	ifeq ($(filter-out $(no-compiler-targets), $(MAKECMDGOALS)),)
> +		need-compiler :=
> +	endif
> +endif
> +
>  ifneq ($(filter $(no-sync-config-targets), $(MAKECMDGOALS)),)
>  	ifeq ($(filter-out $(no-sync-config-targets), $(MAKECMDGOALS)),)
>  		may-sync-config :=
> @@ -584,7 +595,9 @@ endif
>  
>  # Include this also for config targets because some architectures need
>  # cc-cross-prefix to determine CROSS_COMPILE.
> +ifdef need-compiler
>  include $(srctree)/scripts/Makefile.compiler
> +endif
>  
>  ifdef config-build
>  # ===========================================================================
> -- 
> 2.27.0
> 

Hi Masahiro,

I see a new warning in my builds on arm64 now when running
'modules_install' or 'dtbs_install' because ld-option evaluates to
nothing, which triggers the warning in arch/arm64/Makefile:

$ make -skj"$(nproc)" \
ARCH=arm64 \
CROSS_COMPILE=aarch64-linux- \
INSTALL_DTBS_PATH=rootfs \
INSTALL_MOD_PATH=rootfs \
O=build/arm64 \
distclean defconfig all modules_install dtbs_install
...
/home/nathan/cbl/src/linux-next/arch/arm64/Makefile:25: ld does not support --fix-cortex-a53-843419; kernel may be susceptible to erratum
/home/nathan/cbl/src/linux-next/arch/arm64/Makefile:25: ld does not support --fix-cortex-a53-843419; kernel may be susceptible to erratum

$ sed -n '23,29p' arch/arm64/Makefile
ifeq ($(CONFIG_ARM64_ERRATUM_843419),y)
  ifeq ($(call ld-option, --fix-cortex-a53-843419),)
$(warning ld does not support --fix-cortex-a53-843419; kernel may be susceptible to erratum)
  else
LDFLAGS_vmlinux += --fix-cortex-a53-843419
  endif
endif

I am not sure how this should be resolved, hence just the report.

Cheers,
Nathan
