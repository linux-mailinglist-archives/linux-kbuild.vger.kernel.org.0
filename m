Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7042927FCD7
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Oct 2020 12:08:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725938AbgJAKH7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 1 Oct 2020 06:07:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730378AbgJAKH5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Oct 2020 06:07:57 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AA9EC0613E2
        for <linux-kbuild@vger.kernel.org>; Thu,  1 Oct 2020 03:07:57 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id z1so4978799wrt.3
        for <linux-kbuild@vger.kernel.org>; Thu, 01 Oct 2020 03:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NUXTaxsY7NaXachlgBjQGlyIz9BkJJJNfphdb55Lwns=;
        b=hWAwHmbvpL/fUYlWSvL43XM6O7kxQXolhLytRW4KP0Z6zlw+30mFb+/NKei2wkyFjW
         AFJtE+PMI/8r5JP1ykHUGVR4ysFO99EDr4a4/9WUldbEdf+iWIoIG2MyvVu/GGNvk/q9
         CwVZ7wkgPJe+3LCECgMYFCtBvbG7Z3EYknif+gIIDLkj+/ir0S1ToxC9pmbjg1Bfgm14
         i1ARfg5oRTR6difVdGKpxvzYyyEubV3G0o9JxizzDMIQuHMmG1K87BjB2Wtc9BlxKcIQ
         wyzQjihFjT1hNaUUEMeAKf4Etzh4HG37dmxP+26a9fblWLk5m9/ErrxU1igmKfxxYVD8
         KMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NUXTaxsY7NaXachlgBjQGlyIz9BkJJJNfphdb55Lwns=;
        b=WDwF8GIqBnkfsdWteszIjp7wJYd7FVeDrpTW3U1ax092hda0zKxSEAzCXSxafNj5kI
         Oze14IDQPWwjgNmMV9c4nvzG996BMgnDDFZhTtx3c6oc1D6U9hEJ2z1y+lKfdAFqMibb
         kvR7TcCHFjs7rLvl+sNZoDVSvhRRxDrATNFyRNUTOHRA9O0CjeClzyJdRzSBg+DvBRSg
         SO2RzH+V3TRPjcQXjP9Qspc4BXVNDzcfnzE1cp3x7QlVo6w9dDg0IydEVMeBmMM2EdCe
         IoVgxefIy8JWX+8gp8fHmPamLLvn7XvF4E4Xhu9vbmr9LIeOuI9Ciaawh3UCMzGTAV2f
         80MQ==
X-Gm-Message-State: AOAM532F3TTIxbxAzlH0BJmWUc1A5CDmwtuqNjLJTcamnvPqCs6y6hln
        rXKYxqYo0BCroBOrBEBiPDJPcg==
X-Google-Smtp-Source: ABdhPJw+OAQXeCZAgHYba/uf4iegthEQioEJaaLoGJ3ir7TtqURdZbSjpiI/+z+XYaADHTW1Un++OQ==
X-Received: by 2002:adf:f750:: with SMTP id z16mr7697659wrp.377.1601546875447;
        Thu, 01 Oct 2020 03:07:55 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:109:4a0f:cfff:fe4a:6363])
        by smtp.gmail.com with ESMTPSA id p14sm8281917wmc.8.2020.10.01.03.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 03:07:54 -0700 (PDT)
Date:   Thu, 1 Oct 2020 11:07:50 +0100
From:   Andrew Scull <ascull@google.com>
To:     George-Aurelian Popescu <georgepope@google.com>
Cc:     maz@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        masahiroy@kernel.org, michal.lkml@markovi.net,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        clang-built-linux@googlegroups.com, james.morse@arm.com,
        julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com,
        natechancellor@gmail.com, ndesaulniers@google.com,
        dbrazdil@google.com, broonie@kernel.org, maskray@google.com,
        keescook@chromium.org, akpm@linux-foundation.org,
        dvyukov@google.com, elver@google.com, tglx@linutronix.de,
        arnd@arndb.de
Subject: Re: [PATCH 03/14] KVM: arm64: Add support for creating and checking
 a logging buffer inside hyp/nVHE
Message-ID: <20201001100750.GA541087@google.com>
References: <20200914172750.852684-1-georgepope@google.com>
 <20200914172750.852684-4-georgepope@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200914172750.852684-4-georgepope@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Sep 14, 2020 at 05:27:39PM +0000, George-Aurelian Popescu wrote:
> From: George Popescu <georgepope@google.com>
> 
> Share a buffer between the kernel and the hyp/nVHE code by using the
> macros from kvm_debug_buffer.h.
> 
> The buffer is composed of a writing index and a statically allocated
> array. The writing index counts how many elements have been written inside
> the buffer and should be set to zero whenever the code goes back to
> EL2 with the clear_kvm_debug_buffer macro.
> 
> To avoid consistency problems the buffer is defined per_cpu and is designed
> to be read-only from the kernel perspective.
> 
> Check if there is any logging data from hyp/nVHE code.
> 
> Every time when the state returns back to the kernel after an hvc call,
> the __kvm_arm_check_debug_buffer macro checks if there is any data inside
> one of the predefined buffers.
> 
> Signed-off-by: George Popescu <georgepope@google.com>
> ---
>  arch/arm64/include/asm/kvm_debug_buffer.h | 34 +++++++++++++++++++++++
>  arch/arm64/include/asm/kvm_host.h         |  6 ++++
>  arch/arm64/kvm/hyp/hyp-entry.S            |  2 +-
>  3 files changed, 41 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/include/asm/kvm_debug_buffer.h
> 
> diff --git a/arch/arm64/include/asm/kvm_debug_buffer.h b/arch/arm64/include/asm/kvm_debug_buffer.h
> new file mode 100644
> index 000000000000..30c9b0b1a7bf
> --- /dev/null
> +++ b/arch/arm64/include/asm/kvm_debug_buffer.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright 2020 Google LLC
> + * Author: George Popescu <georgepope@google.com>
> + */
> +#ifndef __ASSEMBLY__
> +
> +#include <linux/percpu-defs.h>
> +#include <asm/kvm_asm.h>
> +
> +#ifdef __KVM_NVHE_HYPERVISOR__
> +#define DEFINE_KVM_DEBUG_BUFFER(type_name, buff_name, size)             \
> +	DEFINE_PER_CPU(type_name, buff_name)[(size)];	                \
> +	DEFINE_PER_CPU(unsigned long, buff_name##_wr_ind) = 0
> +
> +#define DECLARE_KVM_DEBUG_BUFFER(type_name, buff_name, size)            \
> +	DECLARE_PER_CPU(type_name, buff_name)[(size)];                  \
> +	DECLARE_PER_CPU(unsigned long, buff_name##_wr_ind)
> +
> +#else
> +
> +#define DECLARE_KVM_DEBUG_BUFFER(type_name, buff_name, size)            \
> +	DECLARE_PER_CPU(type_name, kvm_nvhe_sym(buff_name))[(size)];    \
> +	DECLARE_PER_CPU(unsigned long, kvm_nvhe_sym(buff_name##_wr_ind))
> +#endif //__KVM_NVHE_HYPERVISOR__

nit: comment style, here and below

> +
> +#else
> +
> +.macro clear_kvm_debug_buffer sym tmp1, tmp2, tmp3
> +	mov \tmp1, 0
> +	hyp_str_this_cpu \sym, \tmp1, \tmp2, \tmp3
> +.endm

Can you can use xzr (zero register) directly rather than moving the
constant 0 into a temporary?

	hyp_str_this_cpu \sym, xzr, \tmp1, \tmp2

> +
> +#endif // __ASSEMBLY__
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 905c2b87e05a..adc8957e9321 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -494,6 +494,10 @@ u64 __kvm_call_hyp(void *hypfn, ...);
>  		__kvm_call_hyp(kvm_ksym_ref_nvhe(f), ##__VA_ARGS__);	\
>  	})
>  
> +#define __kvm_arm_check_debug_buffer()					\
> +{									\
> +}
> +
>  /*
>   * The couple of isb() below are there to guarantee the same behaviour
>   * on VHE as on !VHE, where the eret to EL1 acts as a context
> @@ -506,6 +510,7 @@ u64 __kvm_call_hyp(void *hypfn, ...);
>  			isb();						\
>  		} else {						\
>  			kvm_call_hyp_nvhe(f, ##__VA_ARGS__);		\
> +			__kvm_arm_check_debug_buffer();			\
>  		}							\
>  	} while(0)
>  
> @@ -518,6 +523,7 @@ u64 __kvm_call_hyp(void *hypfn, ...);
>  			isb();						\
>  		} else {						\
>  			ret = kvm_call_hyp_nvhe_ret(f, ##__VA_ARGS__);	\
> +			__kvm_arm_check_debug_buffer();			\

As Will was pointing out earlier, does the checking need to have
preemption disabled in case there is another call into hyp that corrupts
the buffer while it is being checked?

>  		}							\
>  									\
>  		ret;							\
> diff --git a/arch/arm64/kvm/hyp/hyp-entry.S b/arch/arm64/kvm/hyp/hyp-entry.S
> index 46b4dab933d0..8df0082b9ccf 100644
> --- a/arch/arm64/kvm/hyp/hyp-entry.S
> +++ b/arch/arm64/kvm/hyp/hyp-entry.S
> @@ -68,7 +68,7 @@ el1_sync:				// Guest trapped into EL2
>  	cbnz	x1, el1_hvc_guest	// called HVC
>  
>  	/* Here, we're pretty sure the host called HVC. */
> -	ldp	x0, x1, [sp], #16
> +	ldp	x0, x1,	[sp], #16

Is this a whitespace change? Maybe drop from this patch if it isn't
related.

>  
>  	/* Check for a stub HVC call */
>  	cmp	x0, #HVC_STUB_HCALL_NR
> -- 
> 2.28.0.618.gf4bc123cb7-goog
> 
