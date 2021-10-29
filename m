Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1D4343F9E9
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Oct 2021 11:31:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231462AbhJ2Jds (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 29 Oct 2021 05:33:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231449AbhJ2Jdr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Oct 2021 05:33:47 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06985C061714
        for <linux-kbuild@vger.kernel.org>; Fri, 29 Oct 2021 02:31:19 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id y84-20020a1c7d57000000b00330cb84834fso2767834wmc.2
        for <linux-kbuild@vger.kernel.org>; Fri, 29 Oct 2021 02:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=p2geQeuyHyqJc4nrCbzk98EKhgtWv8pILv8YFFDOIjI=;
        b=rCk9OdXPcAXWiGFfjmqyR63rgXSjAixWRsicz4BAT9DOkW8IBdaZAYn+TQwrwHC7WG
         jMKVopeE8nIkcsZ9nLcaMKioPOoSw2YwZF3iJhPKNffUmaHpqwbZSMUq0uJfzknOgwE9
         Axi5OiipoKghcLsjPNam0ZRVcN2sczewnOCndSEPrG3JeWqawghZat1gsa3zemD5SA23
         sX2c23i+teO8z/V023Inx8jh6aW6vn+eCB+1zPstFfSh2gWlD0omWhud7v+0MS3I0cKB
         kPs/1/10ld5WeHCGYr1ARfsf9Sdcy4dABdTPDV1U5ibBaaL8U8EiE+Z893rtOT46RPMZ
         dlnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=p2geQeuyHyqJc4nrCbzk98EKhgtWv8pILv8YFFDOIjI=;
        b=BExNDR+FMVUUNmBDpZZeOq8lFtfatQIWjC1WyEfKNOofTcb8SOVOu7gGp/NxuuEFwS
         +ZOgTNDqhogPcPzqGhQJb2FcKq+dUn77C3qqBbLKI8j4vK122LxwbiOdA2unSa4b8atp
         fcdo1/Mm7daQMNqzlxhrHO5Jr1U0q4nQzD/eYlYdFYz7vW7W86Vr1dJPp30h/7opJ+Dk
         VnFk3RX4/mZ9W9V1pO6+JHuU8QvMlwH2rTxQTEwyJ3Bzi4C8CAI8wrVtY1Yq2rUgwRIG
         y+algz7dcysmv/hPLRqE6MabF06TvmBKDqUZyFrPjQbTaTnPLtKPOg7MOoCdEWnNjt89
         Jm1w==
X-Gm-Message-State: AOAM531JkH5XvqfPTJaF5En8dikD1JPUeQLYFZOfR014O5lUcXGC9T6V
        MRmLsJg6ytvBio6DZOSnjOn31xzUU3Hwa27Y
X-Google-Smtp-Source: ABdhPJw0KxtYQYY53mjK9cdCDLX96ZYlrcrBt7x1LVPKw3suCIo+CepvwyQ7w1qXFo+za9ZbHFpE+w==
X-Received: by 2002:a7b:cb10:: with SMTP id u16mr18153483wmj.65.1635499877541;
        Fri, 29 Oct 2021 02:31:17 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id y5sm6819655wrd.75.2021.10.29.02.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 02:31:17 -0700 (PDT)
Date:   Fri, 29 Oct 2021 10:31:15 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Qian Cai <quic_qiancai@quicinc.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] configs: Introduce debug.config for CI-like setup
Message-ID: <20211029093115.6ychbe56pnebzi43@maple.lan>
References: <20211029034434.24553-1-quic_qiancai@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211029034434.24553-1-quic_qiancai@quicinc.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Oct 28, 2021 at 11:44:34PM -0400, Qian Cai wrote:
> Some general debugging features like kmemleak, KASAN, lockdep, UBSAN etc
> help fix many viruses like a microscope. On the other hand, those features
> are scatter around and mixed up with more situational debugging options
> making them difficult to consume properly. This cold help amplify the
> general debugging/testing efforts and help establish sensitive default
> values for those options across the broad.
> 
> The config is based on years' experiences running daily CI inside the
> largest enterprise Linux distro company to seek regressions on
> linux-next builds on different bare-metal and virtual platforms. This is
> more of some art than science. It can be used for example,
> 
> $ make ARCH=arm64 defconfig debug.config
> 
> Signed-off-by: Qian Cai <quic_qiancai@quicinc.com>
> ---
> v2:
> Double the size of CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE due to the most
> of defconfigs used 4KB page instead of 64KB which would consume more early
> kmemleak objects to track early_pgtable_alloc(). Otherwise, we could
> run out of kmemleak early memory pool and disable kmemleak entirely.
> 
>  kernel/configs/debug.config | 119 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 119 insertions(+)
>  create mode 100644 kernel/configs/debug.config
> 
> diff --git a/kernel/configs/debug.config b/kernel/configs/debug.config
> new file mode 100644
> index 000000000000..fea127155eb6
> --- /dev/null
> +++ b/kernel/configs/debug.config
> @@ -0,0 +1,119 @@

Does this config need comments at the top of the file describing its 
"mission"?  Put another way, the comments in the description about
where these config options come from seem too important leave buried
in the git history. They are important to understanding what it is
for.

I know this the other configs do not have big header comments. However
the existing configs are closer to self-describing. debug.config simply
does not explain what the file does in the way xen.config can! People
will surely want to add their "favourite" debug options[1] and those
contributors would benefit from clues on what the configs here are
intended for.


> +# Keep alphabetically sorted.

This results in 119 line file that is more-or-less impossible to
comment. It alphabetic really the best way to maintain something
containing so much subjective judgement?


Daniel.



> +#
> +# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
> +# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
> +# CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF is not set
> +# CONFIG_DEBUG_PAGEALLOC is not set
> +# CONFIG_DEBUG_RODATA_TEST is not set
> +# CONFIG_DEBUG_WX is not set
> +# CONFIG_KFENCE is not set
> +# CONFIG_PAGE_POISONING is not set
> +# CONFIG_PROVE_RAW_LOCK_NESTING is not set
> +# CONFIG_SLUB_STATS is not set
> +# CONFIG_UBSAN_ALIGNMENT is not set
> +# CONFIG_UBSAN_DIV_ZERO is not set
> +# CONFIG_UBSAN_TRAP is not set
> +# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
> +CONFIG_BRANCH_PROFILE_NONE=y
> +CONFIG_BUG_ON_DATA_CORRUPTION=y
> +CONFIG_CONTEXT_SWITCH_TRACER=y
> +CONFIG_DEBUG_ATOMIC_SLEEP=y
> +CONFIG_DEBUG_BUGVERBOSE=y
> +CONFIG_DEBUG_FS_ALLOW_ALL=y
> +CONFIG_DEBUG_FS=y
> +CONFIG_DEBUG_INFO=y
> +CONFIG_DEBUG_IRQFLAGS=y
> +CONFIG_DEBUG_KERNEL=y
> +CONFIG_DEBUG_KMEMLEAK_AUTO_SCAN=y
> +CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE=80000
> +CONFIG_DEBUG_KMEMLEAK=y
> +CONFIG_DEBUG_LIST=y
> +CONFIG_DEBUG_LOCK_ALLOC=y
> +CONFIG_DEBUG_MUTEXES=y
> +CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
> +CONFIG_DEBUG_OBJECTS_FREE=y
> +CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=y
> +CONFIG_DEBUG_OBJECTS_RCU_HEAD=y
> +CONFIG_DEBUG_OBJECTS_TIMERS=y
> +CONFIG_DEBUG_OBJECTS_WORK=y
> +CONFIG_DEBUG_OBJECTS=y
> +CONFIG_DEBUG_PER_CPU_MAPS=y
> +CONFIG_DEBUG_RT_MUTEXES=y
> +CONFIG_DEBUG_RWSEMS=y
> +CONFIG_DEBUG_SECTION_MISMATCH=y
> +CONFIG_DEBUG_SPINLOCK=y
> +CONFIG_DEBUG_STACK_USAGE=y
> +CONFIG_DEBUG_VIRTUAL=y
> +CONFIG_DEBUG_VM_PGFLAGS=y
> +CONFIG_DEBUG_VM_RB=y
> +CONFIG_DEBUG_VM_VMACACHE=y
> +CONFIG_DEBUG_VM=y
> +CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
> +CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=120
> +CONFIG_DETECT_HUNG_TASK=y
> +CONFIG_DYNAMIC_DEBUG_CORE=y
> +CONFIG_DYNAMIC_DEBUG=y
> +CONFIG_DYNAMIC_FTRACE_WITH_REGS=y
> +CONFIG_DYNAMIC_FTRACE=y
> +CONFIG_EVENT_TRACING=y
> +CONFIG_FRAME_POINTER=y
> +CONFIG_FRAME_WARN=2048
> +CONFIG_FTRACE_MCOUNT_RECORD=y
> +CONFIG_FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY=y
> +CONFIG_FTRACE=y
> +CONFIG_FUNCTION_TRACER=y
> +CONFIG_GENERIC_PTDUMP=y
> +CONFIG_GENERIC_TRACER=y
> +CONFIG_IO_STRICT_DEVMEM=y
> +CONFIG_KASAN_GENERIC=y
> +CONFIG_KASAN_INLINE=y
> +CONFIG_KASAN_STACK=y
> +CONFIG_KASAN_VMALLOC=y
> +CONFIG_KASAN=y
> +CONFIG_LOCK_DEBUGGING_SUPPORT=y
> +CONFIG_LOCKDEP_BITS=15
> +CONFIG_LOCKDEP_CHAINS_BITS=16
> +CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
> +CONFIG_LOCKDEP_STACK_TRACE_BITS=19
> +CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
> +CONFIG_LOCKDEP=y
> +CONFIG_LOCKUP_DETECTOR=y
> +CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
> +CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=""
> +CONFIG_MAGIC_SYSRQ_SERIAL=y
> +CONFIG_MAGIC_SYSRQ=y
> +CONFIG_NOP_TRACER=y
> +CONFIG_PAGE_EXTENSION=y
> +CONFIG_PAGE_OWNER=y
> +CONFIG_PANIC_ON_OOPS_VALUE=1
> +CONFIG_PANIC_ON_OOPS=y
> +CONFIG_PANIC_TIMEOUT=0
> +CONFIG_PREEMPTIRQ_TRACEPOINTS=y
> +CONFIG_PRINTK_CALLER=y
> +CONFIG_PRINTK_TIME=y
> +CONFIG_PROVE_LOCKING=y
> +CONFIG_PROVE_RCU_LIST=y
> +CONFIG_PROVE_RCU=y
> +CONFIG_PTDUMP_CORE=y
> +CONFIG_PTDUMP_DEBUGFS=y
> +CONFIG_RCU_CPU_STALL_TIMEOUT=60
> +CONFIG_RING_BUFFER=y
> +CONFIG_SCHED_INFO=y
> +CONFIG_SCHED_STACK_END_CHECK=y
> +CONFIG_SECTION_MISMATCH_WARN_ONLY=y
> +CONFIG_SLUB_DEBUG_ON=y
> +CONFIG_SOFTLOCKUP_DETECTOR=y
> +CONFIG_STACKTRACE=y
> +CONFIG_STRICT_DEVMEM=y
> +CONFIG_SYMBOLIC_ERRNAME=y
> +CONFIG_TRACE_CLOCK=y
> +CONFIG_TRACE_IRQFLAGS=y
> +CONFIG_TRACING_SUPPORT=y
> +CONFIG_TRACING=y
> +CONFIG_UBSAN_BOOL=y
> +CONFIG_UBSAN_BOUNDS=y
> +CONFIG_UBSAN_ENUM=y
> +CONFIG_UBSAN_ONLY_BOUNDS=y
> +CONFIG_UBSAN_SHIFT=y
> +CONFIG_UBSAN_UNREACHABLE=y
> +CONFIG_UBSAN=y
> -- 
> 2.30.2
> 
