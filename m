Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E49127FDB9
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Oct 2020 12:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732060AbgJAKwH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 1 Oct 2020 06:52:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731977AbgJAKwH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Oct 2020 06:52:07 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADCF1C0613E2
        for <linux-kbuild@vger.kernel.org>; Thu,  1 Oct 2020 03:52:06 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id s12so5119488wrw.11
        for <linux-kbuild@vger.kernel.org>; Thu, 01 Oct 2020 03:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=k2N0J/M9yplh3qBJTgm1trDqAWsQTbieqBVpcxzeRPI=;
        b=peG/ZBsEykKqm9oTMBx4fR4/bBMNa2xWkWHFuhuoSp0nPd5MDVeQdCOKCO0kN9CmDD
         zOEavwXdNYiPi/kCnqk+LFRkpLO0FY+b64//p4gpheRsRoOK6OJ0dhW5Mwu6xCQ/hON9
         H8cV2/1Ra0LflfbdXgYJRQhgBrc4eMajxPOjteMUYyy38iowW7V2U8JOzeNt6mDY7ghf
         0mSKl4BBUxSkzLB9wQ5dH0sQKkOpNPrWa5E3/fa7qMkauuksf1AnibTgAhVL0Xp9rcd6
         60gOegQinQi70+Ie2OKoyJQnhll6RVXNxDB1cfegJ9LIFjUIt4qIyl5WhQbWjwVIPDLE
         cAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=k2N0J/M9yplh3qBJTgm1trDqAWsQTbieqBVpcxzeRPI=;
        b=PrKxHyXgbkeDHKrieaCS5okzQdrBYPVjXveKkDAwPXroc6Smmk82GtKOTEF9u2Pqcr
         mu8W+tYLhOZ7mA9Hasb9EDi7sHP3mW3McNv+9KGSg17fOAxrdYjCZ1ZpRkPipCdB/wCF
         3IhKek4dXjTm+MaON5jRujlxPCDbN+u7Xngf/z9HYoAnsQRuWqbqCHOoSxbXq4PsPAzs
         /+vXdER5fUmdyY6QKcRjPia6IEDv6P3F4wJRaRpHq5d6e6Ms/ZLHy8Y5vJ8s5ZWZMy+O
         CZ9H6mkjZMCGRaRmKRtd0kdRReOuD9oEEuBAqBl1aFdXoHvttiTMN2yybVJu7m8zZyWZ
         2PjA==
X-Gm-Message-State: AOAM533m3LxF22eczeHliZETBLEjaJt+e+OOqX91k80GYOw9vrZ/GV7z
        Fr9ZZkeupz/CXwxyMXrDiASesA==
X-Google-Smtp-Source: ABdhPJw4xVEknNO9ydWnolFnG34BKOtlr/IEZ4YTGX+i9Dn0gani5VcV6oYIUxM0kGF6DYGs385bBQ==
X-Received: by 2002:adf:f2d0:: with SMTP id d16mr7896961wrp.332.1601549524567;
        Thu, 01 Oct 2020 03:52:04 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:109:4a0f:cfff:fe4a:6363])
        by smtp.gmail.com with ESMTPSA id i33sm9151325wri.79.2020.10.01.03.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 03:52:03 -0700 (PDT)
Date:   Thu, 1 Oct 2020 11:51:59 +0100
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
Subject: Re: [PATCH 05/14] KVM: arm64: Define a buffer that can pass UBSan
 data from hyp/nVHE to kernel
Message-ID: <20201001105159.GB541087@google.com>
References: <20200914172750.852684-1-georgepope@google.com>
 <20200914172750.852684-6-georgepope@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200914172750.852684-6-georgepope@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Sep 14, 2020 at 05:27:41PM +0000, George-Aurelian Popescu wrote:
> From: George Popescu <georgepope@google.com>
> 
> Store data, which is collected from UBSan handlers that lives inside hyp/nVHE,
> into the kvm_ubsan_buffer.
> This buffer is designed to store only UBSan data because it should not be
> preoccupied by other mechanisms data structures and functionalities.
> 
> Map the buffer and the write iqndex before switching the control to
> hyp/nVHE.
> 
> Map the kernel .data region to read the compile time generated UBSan struct's
> data from hyp/nVHE.
> 
> Signed-off-by: George Popescu <georgepope@google.com>
> ---
>  arch/arm64/include/asm/kvm_asm.h   |  3 +++
>  arch/arm64/include/asm/kvm_host.h  |  6 +++++
>  arch/arm64/include/asm/kvm_ubsan.h | 17 +++++++++++++
>  arch/arm64/kvm/Makefile            |  4 ++++
>  arch/arm64/kvm/arm.c               | 38 +++++++++++++++++++++++++++++-
>  arch/arm64/kvm/hyp/hyp-entry.S     |  4 ++++
>  arch/arm64/kvm/hyp/nvhe/ubsan.c    | 24 ++++++++++++++++++-
>  arch/arm64/kvm/kvm_ubsan_buffer.c  | 32 +++++++++++++++++++++++++
>  8 files changed, 126 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm64/include/asm/kvm_ubsan.h
>  create mode 100644 arch/arm64/kvm/kvm_ubsan_buffer.c
> 
> diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> index 200bb8d0a720..9d4a77f08ffd 100644
> --- a/arch/arm64/include/asm/kvm_asm.h
> +++ b/arch/arm64/include/asm/kvm_asm.h
> @@ -63,6 +63,9 @@
>  #define CHOOSE_VHE_SYM(sym)	sym
>  #define CHOOSE_NVHE_SYM(sym)	kvm_nvhe_sym(sym)
>  
> +#define this_cpu_ptr_nvhe(sym)		this_cpu_ptr(&kvm_nvhe_sym(sym))
> +#define per_cpu_ptr_nvhe(sym, cpu)	per_cpu_ptr(&kvm_nvhe_sym(sym), cpu)
> +
>  #ifndef __KVM_NVHE_HYPERVISOR__
>  /*
>   * BIG FAT WARNINGS:
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index adc8957e9321..337fd2d0f976 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -494,8 +494,14 @@ u64 __kvm_call_hyp(void *hypfn, ...);
>  		__kvm_call_hyp(kvm_ksym_ref_nvhe(f), ##__VA_ARGS__);	\
>  	})
>  
> +#ifdef CONFIG_UBSAN
> +extern void __kvm_check_ubsan_buffer(void);
> +#endif
> +
>  #define __kvm_arm_check_debug_buffer()					\
>  {									\
> +	if (IS_ENABLED(CONFIG_UBSAN))					\
> +		__kvm_check_ubsan_buffer();				\
>  }
>  
>  /*
> diff --git a/arch/arm64/include/asm/kvm_ubsan.h b/arch/arm64/include/asm/kvm_ubsan.h
> new file mode 100644
> index 000000000000..af607a796376
> --- /dev/null
> +++ b/arch/arm64/include/asm/kvm_ubsan.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright 2020 Google LLC
> + * Author: George Popescu <georgepope@google.com>
> + */
> +
> +#ifdef CONFIG_UBSAN

The header should have an inclusion guard as well.

> +#include <ubsan.h>

Is it possible to only include this from within kvm_ubsan_buffer.c
similar to how lib/ubsan.c keeps it self contained? Then export
function for things like mapping it up to hyp?

> +
> +
> +#define UBSAN_MAX_TYPE 6
> +#define KVM_UBSAN_BUFFER_SIZE 1000
> +
> +struct kvm_ubsan_info {
> +	int type;
> +};
> +#endif
> diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
> index 99977c1972cc..92f06cb5b3df 100644
> --- a/arch/arm64/kvm/Makefile
> +++ b/arch/arm64/kvm/Makefile
> @@ -24,4 +24,8 @@ kvm-y := $(KVM)/kvm_main.o $(KVM)/coalesced_mmio.o $(KVM)/eventfd.o \
>  	 vgic/vgic-mmio-v3.o vgic/vgic-kvm-device.o \
>  	 vgic/vgic-its.o vgic/vgic-debug.o
>  
> +CFLAGS_kvm_ubsan_buffer.o += -I $(srctree)/lib/
> +CFLAGS_arm.o += -I $(srctree)/lib
> +
> +kvm-$(CONFIG_UBSAN) += kvm_ubsan_buffer.o
>  kvm-$(CONFIG_KVM_ARM_PMU)  += pmu-emul.o
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index b588c3b5c2f0..eff57069e103 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -42,10 +42,17 @@
>  #include <kvm/arm_pmu.h>
>  #include <kvm/arm_psci.h>
>  
> +#include <asm/kvm_debug_buffer.h>
> +#include <asm/kvm_ubsan.h>
> +
>  #ifdef REQUIRES_VIRT
>  __asm__(".arch_extension	virt");
>  #endif
>  
> +#ifdef CONFIG_UBSAN
> +DECLARE_KVM_DEBUG_BUFFER(struct kvm_ubsan_info, kvm_ubsan_buff, KVM_UBSAN_BUFFER_SIZE);
> +#endif
> +
>  DEFINE_PER_CPU(kvm_host_data_t, kvm_host_data);
>  static DEFINE_PER_CPU(unsigned long, kvm_arm_hyp_stack_page);
>  
> @@ -1519,7 +1526,15 @@ static int init_hyp_mode(void)
>  		kvm_err("Cannot map bss section\n");
>  		goto out_err;
>  	}
> -
> +#ifdef CONFIG_UBSAN
> +	/* required by ubsan to access the handlers structures fields */
> +	err = create_hyp_mappings(kvm_ksym_ref(_data),
> +				  kvm_ksym_ref(__end_once), PAGE_HYP_RO);
> +	if (err) {
> +		kvm_err("Cannot map data section\n");
> +		goto out_err;
> +	}
> +#endif
>  	err = kvm_map_vectors();
>  	if (err) {
>  		kvm_err("Cannot map vectors\n");
> @@ -1552,6 +1567,27 @@ static int init_hyp_mode(void)
>  		}
>  	}
>  
> +#ifdef CONFIG_UBSAN
> +	for_each_possible_cpu(cpu) {
> +		/* map the write index */
> +		struct kvm_ubsan_info *buff;
> +		unsigned long *wr_ind;
> +
> +		wr_ind = per_cpu_ptr_nvhe(kvm_ubsan_buff_wr_ind, cpu);
> +		err = create_hyp_mappings(wr_ind, wr_ind + 1, PAGE_HYP);
> +		if (err) {
> +			kvm_err("Cannot map the busan buffer write index: %d\n", err);
> +			goto out_err;
> +		}
> +		buff = per_cpu_ptr(kvm_nvhe_sym(kvm_ubsan_buff), cpu);
> +		err = create_hyp_mappings(buff, buff + KVM_UBSAN_BUFFER_SIZE, PAGE_HYP);
> +		if (err) {
> +			kvm_err("Cannot map the ubsan buffer: %d\n", err);
> +			goto out_err;
> +		}
> +	}
> +#endif
> +
>  	err = hyp_map_aux_data();
>  	if (err)
>  		kvm_err("Cannot map host auxiliary data: %d\n", err);
> diff --git a/arch/arm64/kvm/hyp/hyp-entry.S b/arch/arm64/kvm/hyp/hyp-entry.S
> index 8df0082b9ccf..bcdbab4d2e43 100644
> --- a/arch/arm64/kvm/hyp/hyp-entry.S
> +++ b/arch/arm64/kvm/hyp/hyp-entry.S
> @@ -14,6 +14,7 @@
>  #include <asm/kvm_asm.h>
>  #include <asm/kvm_mmu.h>
>  #include <asm/mmu.h>
> +#include <asm/kvm_debug_buffer.h>
>  
>  .macro save_caller_saved_regs_vect
>  	/* x0 and x1 were saved in the vector entry */
> @@ -74,6 +75,9 @@ el1_sync:				// Guest trapped into EL2
>  	cmp	x0, #HVC_STUB_HCALL_NR
>  	b.hs	1f
>  
> +#ifdef CONFIG_UBSAN
> +	clear_kvm_debug_buffer kvm_ubsan_buff_wr_ind, x4, x5, x6
> +#endif
>  	/*
>  	 * Compute the idmap address of __kvm_handle_stub_hvc and
>  	 * jump there. Since we use kimage_voffset, do not use the
> diff --git a/arch/arm64/kvm/hyp/nvhe/ubsan.c b/arch/arm64/kvm/hyp/nvhe/ubsan.c
> index a5db6b61ceb2..a43c9646e1e8 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ubsan.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ubsan.c
> @@ -3,9 +3,31 @@
>   * Copyright 2020 Google LLC
>   * Author: George Popescu <georgepope@google.com>
>   */
> +#include <linux/bitops.h>
>  #include <linux/ctype.h>
>  #include <linux/types.h>
> -#include <ubsan.h>
> +#include <linux/percpu-defs.h>
> +#include <linux/kvm_host.h>
> +#include <asm/kvm_arm.h>
> +#include <asm/kvm_asm.h>
> +#include <asm/kvm_ubsan.h>
> +#include <asm/kvm_debug_buffer.h>
> +#include <kvm/arm_pmu.h>
> +
> +DEFINE_KVM_DEBUG_BUFFER(struct kvm_ubsan_info, kvm_ubsan_buff, KVM_UBSAN_BUFFER_SIZE);
> +
> +static inline struct kvm_ubsan_info *kvm_ubsan_buffer_next_slot(void)
> +{
> +	struct kvm_ubsan_info *res;
> +	struct kvm_ubsan_info *buff;
> +	unsigned long *buff_ind;
> +	unsigned long buff_size = KVM_UBSAN_BUFFER_SIZE;
> +	unsigned int struct_size = sizeof(struct kvm_ubsan_info);
> +
> +	init_kvm_debug_buffer(kvm_ubsan_buff, struct kvm_ubsan_info, buff, buff_ind);
> +	res = kvm_debug_buffer_next_slot(buff, buff_ind, struct_size, buff_size);
> +	return res;
> +}
>  
>  void __ubsan_handle_add_overflow(void *_data, void *lhs, void *rhs) {}
>  
> diff --git a/arch/arm64/kvm/kvm_ubsan_buffer.c b/arch/arm64/kvm/kvm_ubsan_buffer.c
> new file mode 100644
> index 000000000000..28dcf19b5706
> --- /dev/null
> +++ b/arch/arm64/kvm/kvm_ubsan_buffer.c
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright 2020 Google LLC
> + * Author: George Popescu <georgepope@google.com>
> + */
> +
> +#include <linux/ctype.h>
> +#include <linux/types.h>
> +#include <asm/kvm_debug_buffer.h>
> +#include <asm/kvm_arm.h>
> +#include <asm/kvm_asm.h>
> +#include <kvm/arm_pmu.h>
> +
> +#include <ubsan.h>
> +#include <asm/kvm_ubsan.h>
> +
> +DECLARE_KVM_DEBUG_BUFFER(struct kvm_ubsan_info, kvm_ubsan_buff, KVM_UBSAN_BUFFER_SIZE);
> +
> +
> +void __kvm_check_ubsan_buffer(void)
> +{
> +	unsigned long *write_ind;
> +	unsigned long it;
> +	struct kvm_ubsan_info *slot;
> +
> +	init_kvm_debug_buffer(kvm_ubsan_buff, struct kvm_ubsan_info, slot, write_ind);
> +	for_each_kvm_debug_buffer_slot(slot, write_ind, it) {
> +		/* check ubsan data */
> +		slot->type = 0;
> +	}
> +}
> +
> -- 
> 2.28.0.618.gf4bc123cb7-goog
> 
