Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57976450662
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Nov 2021 15:11:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232060AbhKOOOD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Nov 2021 09:14:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:33846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232047AbhKOONi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Nov 2021 09:13:38 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D855961B3D;
        Mon, 15 Nov 2021 14:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636985442;
        bh=RuXQHCVZcU03zBGN5L7+2FodEXGg41UQODWWtuCZZ24=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=sMBTXOYrwCYoJGvDsSNVjD1XPK682oJ5ydMDSMbUYKgeFtdxTPWTYaOPHKUkAiRy6
         YyKz4rlPWn3K2xB/1TcRX3vQJK4L8c4Z9uWv82rtqGfhAWD6/+zpAlC/0RfIqjMVbG
         CVGA7KMp4wu3v3RT3s2taHDN1wFkQovu+z+7z9x7wSknnYzkeFD15TWzXZ4SFtTLs3
         fb+FhmYNIbIhFVvlISdUAjHTl9/DC/JcLZWbsSBkOY2LsH7UT4XuQyp+xt0FWTuWRb
         FVaTPoswchXzRMDd4Rdqw9Nza2KiInkarEZFAt22Ix3gLoCz6fSABK+EGJSHZiAdRj
         LnNdxniwJNXKw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id A22FA5C065D; Mon, 15 Nov 2021 06:10:42 -0800 (PST)
Date:   Mon, 15 Nov 2021 06:10:42 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Qian Cai <quic_qiancai@quicinc.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Marco Elver <elver@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] configs: Introduce debug.config for CI-like setup
Message-ID: <20211115141042.GH641268@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20211115134754.7334-1-quic_qiancai@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211115134754.7334-1-quic_qiancai@quicinc.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Nov 15, 2021 at 08:47:54AM -0500, Qian Cai wrote:
> Some general debugging features like kmemleak, KASAN, lockdep, UBSAN etc
> help fix many viruses like a microscope. On the other hand, those features
> are scatter around and mixed up with more situational debugging options
> making them difficult to consume properly. This cold help amplify the
> general debugging/testing efforts and help establish sensitive default
> values for those options across the broad. This could also help different
> distros to collaborate on maintaining debug-flavored kernels.
> 
> The config is based on years' experiences running daily CI inside the
> largest enterprise Linux distro company to seek regressions on
> linux-next builds on different bare-metal and virtual platforms. It can be
> used for example,
> 
> $ make ARCH=arm64 defconfig debug.config
> 
> Since KASAN and KCSAN can't be enabled together, we will need to create a
> separate one for KCSAN later as well.
> 
> Signed-off-by: Qian Cai <quic_qiancai@quicinc.com>
> ---
> v5:
> - Removed CONFIG_RCU_CPU_STALL_TIMEOUT as an old bug had already been fixed
>   and now the default is sane.

Given this change, from an RCU perspective:

Acked-by: Paul E. McKenney <paulmck@kernel.org>

> - Updated the changelog for the motivation.
> - Rebased to v5.16-rc1.
> 
>  kernel/configs/debug.config | 105 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 kernel/configs/debug.config
> 
> diff --git a/kernel/configs/debug.config b/kernel/configs/debug.config
> new file mode 100644
> index 000000000000..e9ffb0cc1eec
> --- /dev/null
> +++ b/kernel/configs/debug.config
> @@ -0,0 +1,105 @@
> +# The config is based on running daily CI for enterprise Linux distros to
> +# seek regressions on linux-next builds on different bare-metal and virtual
> +# platforms. It can be used for example,
> +#
> +# $ make ARCH=arm64 defconfig debug.config
> +#
> +# Keep alphabetically sorted inside each section.
> +#
> +# printk and dmesg options
> +#
> +CONFIG_DEBUG_BUGVERBOSE=y
> +CONFIG_DYNAMIC_DEBUG=y
> +CONFIG_PRINTK_CALLER=y
> +CONFIG_PRINTK_TIME=y
> +CONFIG_SYMBOLIC_ERRNAME=y
> +#
> +# Compile-time checks and compiler options
> +#
> +CONFIG_DEBUG_INFO=y
> +CONFIG_DEBUG_SECTION_MISMATCH=y
> +CONFIG_FRAME_WARN=2048
> +CONFIG_SECTION_MISMATCH_WARN_ONLY=y
> +#
> +# Generic Kernel Debugging Instruments
> +#
> +# CONFIG_UBSAN_ALIGNMENT is not set
> +# CONFIG_UBSAN_DIV_ZERO is not set
> +# CONFIG_UBSAN_TRAP is not set
> +# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
> +CONFIG_DEBUG_FS=y
> +CONFIG_DEBUG_FS_ALLOW_ALL=y
> +CONFIG_DEBUG_IRQFLAGS=y
> +CONFIG_UBSAN=y
> +CONFIG_UBSAN_BOOL=y
> +CONFIG_UBSAN_BOUNDS=y
> +CONFIG_UBSAN_ENUM=y
> +CONFIG_UBSAN_SHIFT=y
> +CONFIG_UBSAN_UNREACHABLE=y
> +#
> +# Memory Debugging
> +#
> +# CONFIG_DEBUG_PAGEALLOC is not set
> +# CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF is not set
> +# CONFIG_DEBUG_RODATA_TEST is not set
> +# CONFIG_DEBUG_WX is not set
> +# CONFIG_KFENCE is not set
> +# CONFIG_PAGE_POISONING is not set
> +# CONFIG_SLUB_STATS is not set
> +CONFIG_PAGE_EXTENSION=y
> +CONFIG_PAGE_OWNER=y
> +CONFIG_DEBUG_KMEMLEAK=y
> +CONFIG_DEBUG_KMEMLEAK_AUTO_SCAN=y
> +CONFIG_DEBUG_OBJECTS=y
> +CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
> +CONFIG_DEBUG_OBJECTS_FREE=y
> +CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=y
> +CONFIG_DEBUG_OBJECTS_RCU_HEAD=y
> +CONFIG_DEBUG_OBJECTS_TIMERS=y
> +CONFIG_DEBUG_OBJECTS_WORK=y
> +CONFIG_DEBUG_PER_CPU_MAPS=y
> +CONFIG_DEBUG_STACK_USAGE=y
> +CONFIG_DEBUG_VIRTUAL=y
> +CONFIG_DEBUG_VM=y
> +CONFIG_DEBUG_VM_PGFLAGS=y
> +CONFIG_DEBUG_VM_RB=y
> +CONFIG_DEBUG_VM_VMACACHE=y
> +CONFIG_GENERIC_PTDUMP=y
> +CONFIG_KASAN=y
> +CONFIG_KASAN_GENERIC=y
> +CONFIG_KASAN_INLINE=y
> +CONFIG_KASAN_VMALLOC=y
> +CONFIG_PTDUMP_DEBUGFS=y
> +CONFIG_SCHED_STACK_END_CHECK=y
> +CONFIG_SLUB_DEBUG_ON=y
> +#
> +# Debug Oops, Lockups and Hangs
> +#
> +# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
> +# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
> +CONFIG_DEBUG_ATOMIC_SLEEP=y
> +CONFIG_DETECT_HUNG_TASK=y
> +CONFIG_PANIC_ON_OOPS=y
> +CONFIG_PANIC_TIMEOUT=0
> +CONFIG_SOFTLOCKUP_DETECTOR=y
> +#
> +# Lock Debugging (spinlocks, mutexes, etc...)
> +#
> +# CONFIG_PROVE_RAW_LOCK_NESTING is not set
> +CONFIG_PROVE_LOCKING=y
> +#
> +# Debug kernel data structures
> +#
> +CONFIG_BUG_ON_DATA_CORRUPTION=y
> +#
> +# RCU Debugging
> +#
> +CONFIG_PROVE_RCU=y
> +CONFIG_PROVE_RCU_LIST=y
> +#
> +# Tracers
> +#
> +CONFIG_BRANCH_PROFILE_NONE=y
> +CONFIG_DYNAMIC_FTRACE=y
> +CONFIG_FTRACE=y
> +CONFIG_FUNCTION_TRACER=y
> -- 
> 2.30.2
> 
