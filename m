Return-Path: <linux-kbuild+bounces-6517-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A56A80D84
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 16:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 323931BC482B
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Apr 2025 14:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96FA61C863C;
	Tue,  8 Apr 2025 14:05:15 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A1C1B4243;
	Tue,  8 Apr 2025 14:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744121115; cv=none; b=cNpMilyoMIdMp9ich3RsMzBnR4BUnpPlFM4xqpQjpZoxm6RvEaE6CpkS8nuInzx9XQMtquFISBhBfrDKKrPy4la09OAfFP+Qgx2nc+zCg4hQJPdp4f+y0LnGOy4e2ANZnIPrBNSYrOxSmtiTvJajka5aMPmyDe7JkLzI/MZBF4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744121115; c=relaxed/simple;
	bh=qG2mRoz2R0ZPisxRTq+9Q2pjdJVvmDJVjpVyGjddaqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fUBfdLK1eehJNFUx10bhAVuer2jACqf+m6dPaL+LHwFYC7c/k3mfysVcEXIjPtCwbqKt6k/CbLLRold3sWFR/7Gd6cf+fzoDu2xiticfyqJi8cl6bm99F3bfYIrKVcKNkUXOIr/OP3m/JmvMMiOD0WwalX5w3qM3xCbkX3mXZlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 758511688;
	Tue,  8 Apr 2025 07:05:12 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A4AEF3F6A8;
	Tue,  8 Apr 2025 07:05:07 -0700 (PDT)
Date: Tue, 8 Apr 2025 15:05:05 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Arnd Bergmann <arnd@kernel.org>, Will Deacon <will@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Brian Gerst <brgerst@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ingo Molnar <mingo@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Takashi Iwai <tiwai@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uros Bizjak <ubizjak@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-raid@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 4/4] arm64: drop binutils version checks
Message-ID: <Z_UtEbZK9kmXtkb2@J2N7QTR9R3.cambridge.arm.com>
References: <20250407094116.1339199-1-arnd@kernel.org>
 <20250407094116.1339199-5-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407094116.1339199-5-arnd@kernel.org>

Hi Arnd,

On Mon, Apr 07, 2025 at 11:41:16AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Now that gcc-8 and binutils-2.30 are the minimum versions, a lot of
> the individual feature checks can go away for simplification.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

To address Will's concern, I grabbed the LLVM 13.0.1 (since that's the
minimum supported version) from https://www.kernel.org/pub//tools/llvm/,
and using v6.15-rc1 I checked the Kconfig resulting from:

  # magic script that puts the toolchain in my $PATH
  usekorg-llvm 13.0.1 make ARCH=arm64 LLVM=1 defconfig
  usekorg-llvm 13.0.1 make ARCH=arm64 LLVM=1 menuconfig

I then applied this series, and built a defconfig kernel with the same
toolchain, which built cleanly and boots fine.

The gist is that everything looks good, so:

Acked-by: Mark Rutland <mark.rutland@arm.com>

More specifically, with that I see:

	CC_IS_CLANG [=y]
	AS_IS_LLVM [=y]
	LD_IS_LLD [=y]

... and I've noted each of the Kconfig options below.

[...]

> -config ARM64_LD_HAS_FIX_ERRATUM_843419
> -	def_bool $(ld-option,--fix-cortex-a53-843419)

	ARM64_LD_HAS_FIX_ERRATUM_843419 [=y] 

> -config AS_HAS_LSE_ATOMICS
> -	def_bool $(as-instr,.arch_extension lse)

	AS_HAS_LSE_ATOMICS [=y]

> -config AS_HAS_ARMV8_2
> -	def_bool $(cc-option,-Wa$(comma)-march=armv8.2-a)

	AS_HAS_ARMV8_2 [=y]

> -config AS_HAS_SHA3
> -	def_bool $(as-instr,.arch armv8.2-a+sha3)

	AS_HAS_SHA3 [=y]

> -config CC_HAS_SIGN_RETURN_ADDRESS
> -	# GCC 7, 8
> -	def_bool $(cc-option,-msign-return-address=all)

	 CC_HAS_SIGN_RETURN_ADDRESS [=y]

> -config AS_HAS_ARMV8_3
> -	def_bool $(cc-option,-Wa$(comma)-march=armv8.3-a)

	AS_HAS_ARMV8_3 [=y]

>  config AS_HAS_CFI_NEGATE_RA_STATE
> +	# binutils 2.34+
>  	def_bool $(as-instr,.cfi_startproc\n.cfi_negate_ra_state\n.cfi_endproc\n)

	AS_HAS_CFI_NEGATE_RA_STATE [=y]

> -config AS_HAS_LDAPR
> -	def_bool $(as-instr,.arch_extension rcpc)

	AS_HAS_LDAPR [=y]

> -config AS_HAS_ARMV8_4
> -	def_bool $(cc-option,-Wa$(comma)-march=armv8.4-a)

	AS_HAS_ARMV8_4 [=y]

> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index 1d5dfcd1c13e..73a10f65ce8b 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -16,14 +16,11 @@ ifeq ($(CONFIG_RELOCATABLE), y)
>  # Pass --no-apply-dynamic-relocs to restore pre-binutils-2.27 behaviour
>  # for relative relocs, since this leads to better Image compression
>  # with the relocation offsets always being zero.
> -LDFLAGS_vmlinux		+= -shared -Bsymbolic -z notext \
> -			$(call ld-option, --no-apply-dynamic-relocs)
> +LDFLAGS_vmlinux	+= -shared -Bsymbolic -z notext --no-apply-dynamic-relocs
>  endif

Looks good:

  [mark@lakrids:~/src/linux]% usekorg-llvm 13.0.1 ld.lld -shared -Bsymbolic -z notext --made-up-argument       
  ld.lld: error: unknown argument '--made-up-argument'
  [mark@lakrids:~/src/linux]% usekorg-llvm 13.0.1 ld.lld -shared -Bsymbolic -z notext --no-apply-dynamic-relocs
  ld.lld: error: no input files

>  ifeq ($(CONFIG_ARM64_ERRATUM_843419),y)
> -  ifeq ($(CONFIG_ARM64_LD_HAS_FIX_ERRATUM_843419),y)
>  LDFLAGS_vmlinux	+= --fix-cortex-a53-843419
> -  endif
>  endif

Looks good:

  [mark@lakrids:~/src/linux]% usekorg-llvm 13.0.1 ld.lld --made-up-argument
  ld.lld: error: unknown argument '--made-up-argument'
  [mark@lakrids:~/src/linux]% usekorg-llvm 13.0.1 ld.lld --fix-cortex-a53-843419
  ld.lld: error: no input files

[...]

>  ifeq ($(CONFIG_AS_HAS_ARMV8_5), y)
>    asm-arch := armv8.5-a
> -else ifeq ($(CONFIG_AS_HAS_ARMV8_4), y)
> +else
>    asm-arch := armv8.4-a
> -else ifeq ($(CONFIG_AS_HAS_ARMV8_3), y)
> -  asm-arch := armv8.3-a
> -else ifeq ($(CONFIG_AS_HAS_ARMV8_2), y)
> -  asm-arch := armv8.2-a
>  endif

Looks good; this was checked in Kconfig.

[...]

>  archprepare:
>  	$(Q)$(MAKE) $(build)=arch/arm64/tools kapi
> -ifeq ($(CONFIG_ARM64_ERRATUM_843419),y)
> -  ifneq ($(CONFIG_ARM64_LD_HAS_FIX_ERRATUM_843419),y)
> -	@echo "warning: ld does not support --fix-cortex-a53-843419; kernel may be susceptible to erratum" >&2
> -  endif
> -endif
> -ifeq ($(CONFIG_ARM64_USE_LSE_ATOMICS),y)
> -  ifneq ($(CONFIG_ARM64_LSE_ATOMICS),y)
> -	@echo "warning: LSE atomics not supported by binutils" >&2
> -  endif
> -endif

Looks good; both were checked in Kconfig.

[...]

> -#ifdef CONFIG_AS_HAS_LDAPR
>  #define __LOAD_RCPC(sfx, regs...)					\
>  	ALTERNATIVE(							\
>  		"ldar"	#sfx "\t" #regs,				\
>  		".arch_extension rcpc\n"				\
>  		"ldapr"	#sfx "\t" #regs,				\
>  	ARM64_HAS_LDAPR)
> -#else
> -#define __LOAD_RCPC(sfx, regs...)	"ldar" #sfx "\t" #regs
> -#endif /* CONFIG_AS_HAS_LDAPR */

Looks good.

>  
>  /*
>   * When building with LTO, there is an increased risk of the compiler
> diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> index 096e45acadb2..713248f240e0 100644
> --- a/arch/arm64/kvm/Kconfig
> +++ b/arch/arm64/kvm/Kconfig
> @@ -19,7 +19,6 @@ if VIRTUALIZATION
>  
>  menuconfig KVM
>  	bool "Kernel-based Virtual Machine (KVM) support"
> -	depends on AS_HAS_ARMV8_4
>  	select KVM_COMMON
>  	select KVM_GENERIC_HARDWARE_ENABLING
>  	select KVM_GENERIC_MMU_NOTIFIER

Looks good.

> diff --git a/arch/arm64/lib/xor-neon.c b/arch/arm64/lib/xor-neon.c
> index f9a53b7f9842..8fffebfa17b2 100644
> --- a/arch/arm64/lib/xor-neon.c
> +++ b/arch/arm64/lib/xor-neon.c
> @@ -319,7 +319,7 @@ static void xor_arm64_eor3_5(unsigned long bytes,
>  
>  static int __init xor_neon_init(void)
>  {
> -	if (IS_ENABLED(CONFIG_AS_HAS_SHA3) && cpu_have_named_feature(SHA3)) {
> +	if (cpu_have_named_feature(SHA3)) {

Looks good.

Mark.

