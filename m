Return-Path: <linux-kbuild+bounces-9014-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DADBBF123
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Oct 2025 21:13:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DC5D18976F7
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Oct 2025 19:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C27FF27E1C5;
	Mon,  6 Oct 2025 19:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i4b5l3+E"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B761D61A3;
	Mon,  6 Oct 2025 19:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759777998; cv=none; b=k1V8uKP7zU+HpHwvwEEJ5S85QNw1X2yL+l09WEcEPSJraF8YV1kRjOYfRiNroapjbxuxdVlrxH8VAcmcEa0Xg6BxFwlli4tEh0lzT2ZZQ657wPgZNKb+HqN9bvgi5dfrLo98O5fBsi03AoLLZjUynDWJ+nTUFAdKq5CRQ1f/PX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759777998; c=relaxed/simple;
	bh=WX4I856SyQQgA+v48ohOBFgoGksSXdNvKixB12S5V3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hSQeBVy3Esag0Vfa/VIshMMYhwryb2N7HsbYpdAkCLjx2eH6y/ZHDmGadKJ+9TGmEfKfMqRKKmt5rq7uQWAqSQYsoeuGPFg+KMb6130BQ8hxBi8jW6jTi9SbcKX5Mi7lx5C3IoJGwRnBYP1kNypIdTN/coD5JOSRnkqpUL9q/Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i4b5l3+E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D44F3C4CEF5;
	Mon,  6 Oct 2025 19:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759777998;
	bh=WX4I856SyQQgA+v48ohOBFgoGksSXdNvKixB12S5V3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i4b5l3+EKs7M7NFHwB80xbPQeLfhlkOUr2K4X7cZRxECq8r2UA6KEnIsQ3V5eZbdv
	 gKi6Enz9TZ/xwx5rzcTUc2Zvx0JyCWPDHao+a9FmOidBZbRY8zXBsFkyDB9qlX+FMc
	 sghnYlJobdqWb2xJQ/AU3ZFMSNFcmCLPvdXfOrU7s/RLfdK6VSHdc/KKgIsYlynvQZ
	 hjvMHeZHBUDBWHWJAOEX+3fTU+j36puNFYV1OyetnQ2y1YoumqniRtx6lXKNOoXP01
	 MfHHNWJx9/T+4iXev+F6G1Kt7jhUg7RTHbk3yPAcGScJYCHVglAToFXmaQOadB6yFL
	 3HgFX7VicL8YA==
Date: Mon, 6 Oct 2025 12:13:14 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nicolas Schier <nicolas.schier@linux.dev>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 2/2] kbuild: userprogs: also inherit byte order and ABI
 from kernel
Message-ID: <20251006191314.GA2706650@ax162>
References: <20250813-kbuild-userprogs-bits-v1-0-2d9f7f411083@linutronix.de>
 <20250813-kbuild-userprogs-bits-v1-2-2d9f7f411083@linutronix.de>
 <20250827075334-3332c08d-66f3-427d-b0b2-4460e779f261@linutronix.de>
 <20250827224935.GB414199@ax162>
 <20250828083747-e819430a-986f-4f71-bbc8-e402e339c9a2@linutronix.de>
 <20250903223131.GA2264021@ax162>
 <20251002144850-4a498f99-418d-4888-80f9-0f24c6896318@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251002144850-4a498f99-418d-4888-80f9-0f24c6896318@linutronix.de>

Hi Thomas,

On Thu, Oct 02, 2025 at 03:23:08PM +0200, Thomas Weißschuh wrote:
> I investigated this some more and didn't really like the end result. The
> problem is that $(m32-flag) and $(m64-flag) will expand to nothing if the
> compiler does not support -m32/-m64. So for architectures which use
> different flags the current logic will just ignore the bitness. One way
> around this would be a mapping from -m32/-m64 to architecture-specific
> flags inside cc-can-link.sh, similar to what I already did before for
> the mapping of -mlittle-endian to -EL on MIPS. But we'll end up with a
> bunch of architecture-specific details hidden away in a non-generic
> shellscript. And the interactions are very non-obvious and brittle.
> Then I'd rather have the architecture-specific bits openly in proper
> architecture code.
> 
> See my current proposal, using x86 as example below. It will require
> code for each architecture, but there are not that many of them.
> And the configuration matrix for each architecture only contains a
> relative small set of actually supported configurations.
> Unfortunately I don't see a generic way to deduplicate the flag values
> between ARCH_CC_CAN_LINK ARCH_USERPROGS_CFLAGS. Each architecture can
> use a macro if they so prefer.
> 
> When the "interesting" architectures are done we can also slim down the
> generic implementation to not use any special arguments and that would
> be enough for the simple architectures.
> 
> For the future I would like to introduce CC_CAN_LINK_STATIC again.
> With the scheme from below this would mean to duplicate all the kconfig
> symbols for each architecture again. One way around would be to change
> ARCH_CC_CAN_LINK from bool to string. And then let cc-can-link.sh test
> for both static and dynamic linking in one go and return either
> "dynamic,static", "dynamic" or "static" which then can be mapped to
> CC_CAN_LINK and CC_CAN_LINK_STATIC by generic logic.
> 
> What do you think?

Yeah this seems like a reasonable direction to start heading. I would
much prefer a little more verbosity for the sake of robustness and
maintainability going forward, especially since these are static flags
per architecture (i.e., once they are initially set, they should not
change).

> diff --git a/Makefile b/Makefile
> index d37dca7850b3..17123948a4fa 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1135,7 +1135,15 @@ LDFLAGS_vmlinux	+= --emit-relocs --discard-none
>  endif
>  
>  # Align the bit size of userspace programs with the kernel
> -USERFLAGS_FROM_KERNEL := -m32 -m64 --target=%
> +USERFLAGS_FROM_KERNEL := --target=%
> +
> +ifdef CONFIG_ARCH_USERPROGS_CFLAGS
> +KBUILD_USERCFLAGS += $(CONFIG_ARCH_USERPROGS_CFLAGS)
> +KBUILD_USERLDFLAGS += $(CONFIG_ARCH_USERPROGS_CFLAGS)
> +else
> +USERFLAGS_FROM_KERNEL += -m32 -m64
> +endif
> +
>  KBUILD_USERCFLAGS  += $(filter $(USERFLAGS_FROM_KERNEL), $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
>  KBUILD_USERLDFLAGS += $(filter $(USERFLAGS_FROM_KERNEL), $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
>  
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 75f3de70df51..162c71c117bc 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -332,6 +332,17 @@ config X86
>  	select SCHED_SMT			if SMP
>  	select ARCH_SUPPORTS_SCHED_CLUSTER	if SMP
>  	select ARCH_SUPPORTS_SCHED_MC		if SMP
> +	select ARCH_HAS_CC_CAN_LINK
> +
> +config ARCH_CC_CAN_LINK
> +	bool
> +	default $(cc_can_link_user,-m64) if 64BIT
> +	default $(cc_can_link_user,-m32) if !64BIT
> +
> +config ARCH_USERPROGS_CFLAGS
> +	string
> +	default "-m64" if 64BIT
> +	default "-m32" if !64BIT
>  
>  config INSTRUCTION_DECODER
>  	def_bool y
> diff --git a/init/Kconfig b/init/Kconfig
> index f3b13463ec26..5ca2f3289020 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -82,8 +82,13 @@ config RUSTC_LLVM_VERSION
>  	int
>  	default $(rustc-llvm-version)
>  
> +# Might be removed when all architectures are migrated
> +config ARCH_HAS_CC_CAN_LINK
> +	bool
> +
>  config CC_CAN_LINK
>  	bool
> +	default ARCH_CC_CAN_LINK if ARCH_HAS_CC_CAN_LINK
>  	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m64-flag)) if 64BIT
>  	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m32-flag))
>  
> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> index 33193ca6e803..0c8dbfbce415 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -75,3 +75,6 @@ rustc-llvm-version := $(shell,$(srctree)/scripts/rustc-llvm-version.sh $(RUSTC))
>  # If you are testing for unstable features, consider testing RUSTC_VERSION
>  # instead, as features may have different completeness while available.
>  rustc-option = $(success,trap "rm -rf .tmp_$$" EXIT; mkdir .tmp_$$; $(RUSTC) $(1) --crate-type=rlib /dev/null --out-dir=.tmp_$$ -o .tmp_$$/tmp.rlib)
> +
> +# Test whether the compiler can link userspace applications
> +cc_can_link_user = $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(1))

