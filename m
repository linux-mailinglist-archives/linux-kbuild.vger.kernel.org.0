Return-Path: <linux-kbuild+bounces-6883-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BEDAA76D2
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 18:12:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CAC79A06CB
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 16:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57B525CC79;
	Fri,  2 May 2025 16:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ilrraeZl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58842580EA;
	Fri,  2 May 2025 16:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746202334; cv=none; b=nM3NZeG6dzWtIizpXbHKd5jrXV/S4L8b1nKsY6NXaGznhrMyyuv3oyQ2xfoc19ouiwPvLgGG3AIpl9r2+Ewm2jys99CVR5/lXgFhihMCAnFwUBsLWBS1DZmp2T2Odh/ewgjwlAXfBz01b8CSgGDqiK/OP2D1oGfthwz5XdgNQB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746202334; c=relaxed/simple;
	bh=oIBoHhr4ygbJf9Q+KP535Pj4mKXpGFceRyolVWXj4HA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pmMf4SVswafm8yIenlHpyWixNPrAGOle+XrHxHOMPnb9MXe/G+YzsdWXwsDAf8Lrntt4NPc/meWkVbpQrnRf37PuL+EliQ8KF2cHWzH6qbBQBou0nCaaJ46YHyJGPM45oSiz4D0+Gquv2Elk0ayXozqmuvcW8TNwJLpQoIaRb64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ilrraeZl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9ACC4CEE4;
	Fri,  2 May 2025 16:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746202334;
	bh=oIBoHhr4ygbJf9Q+KP535Pj4mKXpGFceRyolVWXj4HA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ilrraeZlcDUAQ/GSbU7RteYAGpWdWZLitu4sOfw/srjuMVxWYq5pD5dIo1mAimLnx
	 qlW8HwK0dy4y2dg4v3QnU4hKF8uZiR7jm1f3bxu3hil08qrv+wrPwRlH5MtfqQ6Xrp
	 BqOZdNIpAHowgPPpwb4toDRF75B8zLY1wD+C2GcxHaUN/1sklXb3eg2ppF/vtuZuic
	 oU5p3VWXemkQbHfwJagFnDuC0MG8FmP5dvtQNERqZ3aaDMHxUtqPVZlTRUmuT57HAg
	 ntijOf3pYY5Rk+sKjxQUfErmj+vnNgNzOlA2mwt0BL9EZQji9GhfV8s1FU8vhfp3Lf
	 kil+ZxwZ25c6A==
Date: Fri, 2 May 2025 09:12:09 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kbuild@vger.kernel.org, Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	kasan-dev@googlegroups.com
Subject: Re: [PATCH 2/3] randstruct: Force full rebuild when seed changes
Message-ID: <20250502161209.GA2850065@ax162>
References: <20250501193839.work.525-kees@kernel.org>
 <20250501194826.2947101-2-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501194826.2947101-2-kees@kernel.org>

Hi Kees,

On Thu, May 01, 2025 at 12:48:17PM -0700, Kees Cook wrote:
> While the randstruct GCC plugin was being rebuilt if the randstruct
> seed changed, Clangs build did not notice the change. Include the hash
> header directly so that it becomes a universal build dependency and full
> rebuilds will happen if it changes.
> 
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nicolas Schier <nicolas.schier@linux.dev>
> Cc: Petr Pavlu <petr.pavlu@suse.com>
> Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Cc: <linux-kbuild@vger.kernel.org>
> ---
>  include/linux/vermagic.h    |  1 -
>  scripts/Makefile.randstruct |  3 ++-
>  scripts/basic/Makefile      | 11 ++++++-----
>  3 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/include/linux/vermagic.h b/include/linux/vermagic.h
> index 939ceabcaf06..335c360d4f9b 100644
> --- a/include/linux/vermagic.h
> +++ b/include/linux/vermagic.h
> @@ -33,7 +33,6 @@
>  #define MODULE_VERMAGIC_MODVERSIONS ""
>  #endif
>  #ifdef RANDSTRUCT
> -#include <generated/randstruct_hash.h>
>  #define MODULE_RANDSTRUCT "RANDSTRUCT_" RANDSTRUCT_HASHED_SEED
>  #else
>  #define MODULE_RANDSTRUCT
> diff --git a/scripts/Makefile.randstruct b/scripts/Makefile.randstruct
> index 24e283e89893..ab87219c6149 100644
> --- a/scripts/Makefile.randstruct
> +++ b/scripts/Makefile.randstruct
> @@ -12,6 +12,7 @@ randstruct-cflags-y	\
>  	+= -frandomize-layout-seed-file=$(objtree)/scripts/basic/randstruct.seed
>  endif
>  
> -export RANDSTRUCT_CFLAGS := $(randstruct-cflags-y)
> +export RANDSTRUCT_CFLAGS := $(randstruct-cflags-y) \
> +			    -include $(objtree)/scripts/basic/randstruct_hash.h

As the kernel test robot points out (on a report that you weren't
included on for some reason...), this breaks the build in several
places on next-20250502.

https://lore.kernel.org/202505021409.yC9C70lH-lkp@intel.com/

  $ make -skj"$(nproc)" ARCH=arm LLVM=1 clean allmodconfig arch/arm/vdso/vgettimeofday.o
  clang: error: cannot specify -o when generating multiple output files

There are places in the kernel that filter out RANDSTRUCT_CFLAGS and
this appears to cause other '-include' flags to be filtered out as well,
such as the one in the efistub that includes hidden.h.

>  KBUILD_CFLAGS	+= $(RANDSTRUCT_CFLAGS)
> diff --git a/scripts/basic/Makefile b/scripts/basic/Makefile
> index dd289a6725ac..31637ce4dc5c 100644
> --- a/scripts/basic/Makefile
> +++ b/scripts/basic/Makefile
> @@ -8,9 +8,10 @@ hostprogs-always-y	+= fixdep
>  # before running a Clang kernel build.
>  gen-randstruct-seed	:= $(srctree)/scripts/gen-randstruct-seed.sh
>  quiet_cmd_create_randstruct_seed = GENSEED $@
> -cmd_create_randstruct_seed = \
> -	$(CONFIG_SHELL) $(gen-randstruct-seed) \
> -		$@ $(objtree)/include/generated/randstruct_hash.h
> -$(obj)/randstruct.seed: $(gen-randstruct-seed) FORCE
> +      cmd_create_randstruct_seed = $(CONFIG_SHELL) $(gen-randstruct-seed) \
> +		$(obj)/randstruct.seed $(obj)/randstruct_hash.h
> +
> +$(obj)/randstruct_hash.h $(obj)/randstruct.seed: $(gen-randstruct-seed) FORCE
>  	$(call if_changed,create_randstruct_seed)
> -always-$(CONFIG_RANDSTRUCT) += randstruct.seed
> +
> +always-$(CONFIG_RANDSTRUCT) += randstruct.seed randstruct_hash.h
> -- 
> 2.34.1
> 

