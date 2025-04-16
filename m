Return-Path: <linux-kbuild+bounces-6667-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F24A90C9B
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Apr 2025 21:54:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 485885A03F6
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Apr 2025 19:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32AA8224B1B;
	Wed, 16 Apr 2025 19:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lz8rnA0B"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A7F1547C0;
	Wed, 16 Apr 2025 19:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744833265; cv=none; b=N4StzA0RGXYuU/LFt/qMgOGeDjd1IsKCHO9HStfYRpydd4G0R1vjQxm6uCv3u3x1iicfjlR4YY88j/NQg4HJLshzs5t0mUxzEhWCgyKyH+wMq+tCUf2ojB6FPQi619ox3BTuKsMuaRldxkW5hvn2p1mXlr2YlT+uuafvtH1Vn/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744833265; c=relaxed/simple;
	bh=VOgmkXfdlWuIo4XkZejUC7sV2odScaUVZc1wtf1wTE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=omND7u6V1fW0LhzyDmtSl0+/j2HqNfV3K28yPEqKGQo9+SV9kcSISlzBT0ooHapRB2InaZxOwLWdnu74G9/HG+aN5s4Pv0va7c3AqoYNqLlJA9q1cvWFicCMNVCpsb8f+/GAh42Qtec+jrgjM5ZWhNnoxpd/N010q4FmCsP89WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lz8rnA0B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A95C4CEE2;
	Wed, 16 Apr 2025 19:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744833264;
	bh=VOgmkXfdlWuIo4XkZejUC7sV2odScaUVZc1wtf1wTE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lz8rnA0BHsADULNyL0KMwo4Act0zMwIUCn0nvTGvkBr6f8BjruW1ndqTE1Di5OZCi
	 UkuNKo0Nz4XpneU5MJdayxIwLU3YEjBnYSBSCoAUa2UG2FVMIgAkhLZ4tU9p7i/AMC
	 1U3q0RB0LdLEDHI4tzmJyG9bVWmyPD5T4sUixEk075h5/gOAwy9KDlG8VZDnnMaMFJ
	 Z8z51RMvOgos4Zn49+OoLoSFfn4hi48Rb/Gc8DESIxm8EMXA9WqIHo7LXyi0Y9N/Er
	 x4SBoCSP/h1DnaZawfgmSqpf0BZ2MCRdsdiRC0pVr9srZ2Ox+gDVgF03eAkKRLczqB
	 Ohal3WQ8xg/ew==
Date: Wed, 16 Apr 2025 12:54:21 -0700
From: Kees Cook <kees@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: kvmarm@lists.linux.dev, kasan-dev@googlegroups.com,
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev,
	broonie@kernel.org, catalin.marinas@arm.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, elver@google.com,
	andreyknvl@gmail.com, ryabinin.a.a@gmail.com,
	akpm@linux-foundation.org, yuzenghui@huawei.com,
	suzuki.poulose@arm.com, joey.gouly@arm.com, masahiroy@kernel.org,
	nathan@kernel.org, nicolas.schier@linux.dev
Subject: Re: [PATCH 3/4] KVM: arm64: Introduce CONFIG_UBSAN_KVM_EL2
Message-ID: <202504161250.CC5C277A@keescook>
References: <20250416180440.231949-1-smostafa@google.com>
 <20250416180440.231949-4-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416180440.231949-4-smostafa@google.com>

On Wed, Apr 16, 2025 at 06:04:33PM +0000, Mostafa Saleh wrote:
> Add a new Kconfig CONFIG_UBSAN_KVM_EL2 for KVM which enables
> UBSAN for EL2 code (in protected/nvhe/hvhe) modes.
> This will re-use the same checks enabled for the kernel for
> the hypervisor. The only difference is that for EL2 it always
> emits a "brk" instead of implementing hooks as the hypervisor
> can't print reports.
> 
> The KVM code will re-use the same code for the kernel
> "report_ubsan_failure()" so #ifdefs are changed to also have this
> code for CONFIG_UBSAN_KVM_EL2
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/Makefile | 6 ++++++
>  include/linux/ubsan.h            | 2 +-
>  lib/Kconfig.ubsan                | 9 +++++++++
>  lib/ubsan.c                      | 6 ++++--
>  scripts/Makefile.ubsan           | 5 ++++-
>  5 files changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
> index b43426a493df..cbe7e12752bc 100644
> --- a/arch/arm64/kvm/hyp/nvhe/Makefile
> +++ b/arch/arm64/kvm/hyp/nvhe/Makefile
> @@ -99,3 +99,9 @@ KBUILD_CFLAGS := $(filter-out $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS), $(KBUILD_CFLAG
>  # causes a build failure. Remove profile optimization flags.
>  KBUILD_CFLAGS := $(filter-out -fprofile-sample-use=% -fprofile-use=%, $(KBUILD_CFLAGS))
>  KBUILD_CFLAGS += -fno-asynchronous-unwind-tables -fno-unwind-tables
> +
> +ifeq ($(CONFIG_UBSAN_KVM_EL2),y)
> +UBSAN_SANITIZE := y
> +# Always use brk and not hooks
> +ccflags-y += $(CFLAGS_UBSAN_FOR_TRAP)
> +endif
> diff --git a/include/linux/ubsan.h b/include/linux/ubsan.h
> index c843816f5f68..3ab8d38aedb8 100644
> --- a/include/linux/ubsan.h
> +++ b/include/linux/ubsan.h
> @@ -2,7 +2,7 @@
>  #ifndef _LINUX_UBSAN_H
>  #define _LINUX_UBSAN_H
>  
> -#ifdef CONFIG_UBSAN_TRAP
> +#if defined(CONFIG_UBSAN_TRAP) || defined(CONFIG_UBSAN_KVM_EL2)
>  const char *report_ubsan_failure(u32 check_type);
>  #else
>  static inline const char *report_ubsan_failure(u32 check_type)
> diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
> index 4216b3a4ff21..3878858eb473 100644
> --- a/lib/Kconfig.ubsan
> +++ b/lib/Kconfig.ubsan
> @@ -166,4 +166,13 @@ config TEST_UBSAN
>  	  This is a test module for UBSAN.
>  	  It triggers various undefined behavior, and detect it.
>  
> +config UBSAN_KVM_EL2
> +	bool "UBSAN for KVM code at EL2"
> +	depends on ARM64
> +	help
> +	  Enable UBSAN when running on ARM64 with KVM in a split mode
> +	  (nvhe/hvhe/protected) for the hypervisor code running in EL2.
> +	  In this mode, any UBSAN violation in EL2 would panic the kernel
> +	  and information similar to UBSAN_TRAP would be printed.
> +
>  endif	# if UBSAN
> diff --git a/lib/ubsan.c b/lib/ubsan.c
> index 17993727fc96..a6ca235dd714 100644
> --- a/lib/ubsan.c
> +++ b/lib/ubsan.c
> @@ -19,7 +19,7 @@
>  
>  #include "ubsan.h"
>  
> -#ifdef CONFIG_UBSAN_TRAP
> +#if defined(CONFIG_UBSAN_TRAP) || defined(CONFIG_UBSAN_KVM_EL2)
>  /*
>   * Only include matches for UBSAN checks that are actually compiled in.
>   * The mappings of struct SanitizerKind (the -fsanitize=xxx args) to
> @@ -97,7 +97,9 @@ const char *report_ubsan_failure(u32 check_type)
>  	}
>  }
>  
> -#else
> +#endif
> +
> +#ifndef CONFIG_UBSAN_TRAP
>  static const char * const type_check_kinds[] = {
>  	"load of",
>  	"store to",
> diff --git a/scripts/Makefile.ubsan b/scripts/Makefile.ubsan
> index 9e35198edbf0..68af6830af0f 100644
> --- a/scripts/Makefile.ubsan
> +++ b/scripts/Makefile.ubsan
> @@ -1,5 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> +#Shared with KVM/arm64

Nitpick: Please add a space between "#" and "Shared", and end the line
with "."

> +export CFLAGS_UBSAN_FOR_TRAP := $(call cc-option,-fsanitize-trap=undefined,-fsanitize-undefined-trap-on-error)
> +
>  # Enable available and selected UBSAN features.
>  ubsan-cflags-$(CONFIG_UBSAN_ALIGNMENT)		+= -fsanitize=alignment
>  ubsan-cflags-$(CONFIG_UBSAN_BOUNDS_STRICT)	+= -fsanitize=bounds-strict
> @@ -10,7 +13,7 @@ ubsan-cflags-$(CONFIG_UBSAN_DIV_ZERO)		+= -fsanitize=integer-divide-by-zero
>  ubsan-cflags-$(CONFIG_UBSAN_UNREACHABLE)	+= -fsanitize=unreachable
>  ubsan-cflags-$(CONFIG_UBSAN_BOOL)		+= -fsanitize=bool
>  ubsan-cflags-$(CONFIG_UBSAN_ENUM)		+= -fsanitize=enum
> -ubsan-cflags-$(CONFIG_UBSAN_TRAP)		+= $(call cc-option,-fsanitize-trap=undefined,-fsanitize-undefined-trap-on-error)
> +ubsan-cflags-$(CONFIG_UBSAN_TRAP)		+= $(CFLAGS_UBSAN_FOR_TRAP)

Another minor style request: please name this "CFLAGS_UBSAN_TRAP"
(nothing else in Kconfig uses "FOR" like this, and leaving it off sounds
more declarative).

>  
>  export CFLAGS_UBSAN := $(ubsan-cflags-y)

Otherwise, yes, looks good.

-- 
Kees Cook

