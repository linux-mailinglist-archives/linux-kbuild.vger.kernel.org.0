Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2630F410D83
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Sep 2021 23:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232903AbhISVqt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 19 Sep 2021 17:46:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:49298 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229790AbhISVqs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 19 Sep 2021 17:46:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 72FBC60F92;
        Sun, 19 Sep 2021 21:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632087922;
        bh=Jm3nJojXxT0r30IXLhyp5n0DfvgwwMDvnybLcAvRX58=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jkNZeaa9P5mSICrVPwZbGQ31FtnQSuxk/JPR1gs6ahAa4SEPc65qbsL3ZqFjXsJ4/
         4/ZBWkNBm7/MmWHGF2Ng8HMqveZd+0kw1cbIZxFVhQMUcU8PWNcsWcftGdqtGh5va6
         suJU+foPHsm0R8aodT0QzWYE6VIROTI/y+tjV90DsB/eS5QJgQ9R2K31STUdXf1LrK
         HMWMDRmQyybXIGt7z+PtgUIGPRWv89PmvRmxr2iCgmN0qAZRH85mk/fPOAQGZFT52o
         DXGlu4wPueq/OZmVSEgcq3gdxJ49ZDE234liWkEJf20cZVGydbJzhknOxI+89jn0GV
         vHwWJ+IH/Ls0g==
Date:   Sun, 19 Sep 2021 14:45:15 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Dan Li <ashimida@linux.alibaba.com>
Cc:     masahiroy@kernel.org, michal.lkml@markovi.net,
        keescook@chromium.org, ndesaulniers@google.com,
        akpm@linux-foundation.org, tglx@linutronix.de,
        peterz@infradead.org, samitolvanen@google.com, frederic@kernel.org,
        rppt@kernel.org, yifeifz2@illinois.edu, viresh.kumar@linaro.org,
        colin.king@canonical.com, andreyknvl@gmail.com,
        mark.rutland@arm.com, ojeda@kernel.org, will@kernel.org,
        ardb@kernel.org, luc.vanoostenryck@gmail.com, elver@google.com,
        nivedita@alum.mit.edu, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH] [RFC/RFT]SCS:Add gcc plugin to support Shadow Call Stack
Message-ID: <YUeva0jP7P2qCr+R@archlinux-ax161>
References: <1632069436-25075-1-git-send-email-ashimida@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1632069436-25075-1-git-send-email-ashimida@linux.alibaba.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Dan,

A couple of initial high level comments, I do not really feel qualified
to review the plugin itself.

On Mon, Sep 20, 2021 at 12:37:16AM +0800, Dan Li wrote:
> The Clang-based shadow call stack protection has been integrated into the
> mainline, but kernel compiled by gcc cannot enable this feature for now.
> 
> This Patch supports gcc-based SCS protection by adding a plugin.
> 
> For each function that x30 will be pushed onto the stack during execution,
> this plugin:
> 1) insert "str x30, [x18], #8" at the entry of the function to save x30
>    to current SCS
> 2) insert "ldr x30, [x18, #-8]!"  before the exit of this function to
>    restore x30
> 
> At present, this patch has been successfully compiled(based on defconfig)
> in the following gcc versions(if plugin is supported) and startup normally:
> * 6.3.1
> * 7.3.1
> * 7.5.0
> * 8.2.1
> * 9.2.0
> * 10.3.1
> 
> with commands:
> make ARCH=arm64 defconfig
> ./scripts/config -e CONFIG_GCC_PLUGINS -e CONFIG_GCC_PLUGIN_SHADOW_CALL_STACK
> make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
> 
> ---
> FYI:
> 1) The function can be used to test whether the shadow stack is effective:
> //noinline void __noscs scs_test(void)
> noinline void scs_test(void)
> {
>     register unsigned long *sp asm("sp");
>     unsigned long * lr = sp + 1;
> 
>     asm volatile("":::"x30");
>     *lr = 0;
> }
> 
> ffff800010012670 <scs_test>:
> ffff800010012670:       f800865e        str     x30, [x18], #8
> ffff800010012674:       a9bf7bfd        stp     x29, x30, [sp, #-16]!
> ffff800010012678:       910003fd        mov     x29, sp
> ffff80001001267c:       f90007ff        str     xzr, [sp, #8]
> ffff800010012680:       a8c17bfd        ldp     x29, x30, [sp], #16
> ffff800010012684:       f85f8e5e        ldr     x30, [x18, #-8]!
> ffff800010012688:       d65f03c0        ret
> 
> If SCS protection is enabled, this function will return normally.
> If the function has __noscs attribute (scs disabled), it will crash due to 0
> address access.
> 
> 2) Other tests are in progress ...
> 
> Signed-off-by: Dan Li <ashimida@linux.alibaba.com>
> ---
>  Makefile                               |   2 +-
>  arch/Kconfig                           |   2 +-
>  include/linux/compiler-gcc.h           |   4 +
>  scripts/Makefile.gcc-plugins           |   4 +
>  scripts/gcc-plugins/Kconfig            |   8 ++
>  scripts/gcc-plugins/arm64_scs_plugin.c | 256 +++++++++++++++++++++++++++++++++
>  6 files changed, 274 insertions(+), 2 deletions(-)
>  create mode 100644 scripts/gcc-plugins/arm64_scs_plugin.c
> 
> diff --git a/Makefile b/Makefile
> index 61741e9..0f0121a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -924,7 +924,7 @@ LDFLAGS_vmlinux += --gc-sections
>  endif
>  
>  ifdef CONFIG_SHADOW_CALL_STACK

I would rather see this become

ifeq ($(CONFIG_SHADOW_CALL_STACK)$(CONFIG_CC_IS_CLANG), yy)
...
endif

rather than just avoiding assigning to CC_FLAGS_SCS.

However, how does disabling the shadow call stack plugin work for a
whole translation unit or directory? There are a few places where
CC_FLAGS_SCS are filtered out and I am not sure I see where that happens
here? It looks like the plugin has a disabled option but I do not see it
hooked in anywhere.

> -CC_FLAGS_SCS	:= -fsanitize=shadow-call-stack
> +CC_FLAGS_SCS	:= $(if $(CONFIG_CC_IS_CLANG),-fsanitize=shadow-call-stack,)
>  KBUILD_CFLAGS	+= $(CC_FLAGS_SCS)
>  export CC_FLAGS_SCS
>  endif
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 98db634..81ff127 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -594,7 +594,7 @@ config ARCH_SUPPORTS_SHADOW_CALL_STACK
>  
>  config SHADOW_CALL_STACK
>  	bool "Clang Shadow Call Stack"
> -	depends on CC_IS_CLANG && ARCH_SUPPORTS_SHADOW_CALL_STACK
> +	depends on (CC_IS_CLANG && ARCH_SUPPORTS_SHADOW_CALL_STACK) || GCC_PLUGIN_SHADOW_CALL_STACK

Is this logic right? SHADOW_CALL_STACK is only supported by arm64 (as
they set ARCH_SUPPORTS_SHADOW_CALL_STACK) but now you are enabling it
for any architecture, even though it seems like it still only works on
arm64. I think this wants to be

depends on (CC_IS_CLANG || GCC_PLUGIN_SHADOW_CALL_STACK) && ARCH_SUPPORTS_SHADOW_CALL_STACK

>  	depends on DYNAMIC_FTRACE_WITH_REGS || !FUNCTION_GRAPH_TRACER
>  	help
>  	  This option enables Clang's Shadow Call Stack, which uses a
> diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
> index cb9217f..426c8e5 100644
> --- a/include/linux/compiler-gcc.h
> +++ b/include/linux/compiler-gcc.h
> @@ -50,6 +50,10 @@
>  #define __latent_entropy __attribute__((latent_entropy))
>  #endif
>  
> +#if defined(SHADOW_CALL_STACK_PLUGIN) && !defined(__CHECKER__)
> +#define __noscs __attribute__((no_shadow_call_stack))
> +#endif
> +
>  /*
>   * calling noreturn functions, __builtin_unreachable() and __builtin_trap()
>   * confuse the stack allocation in gcc, leading to overly large stack
> diff --git a/scripts/Makefile.gcc-plugins b/scripts/Makefile.gcc-plugins
> index 952e468..eeaf2c6 100644
> --- a/scripts/Makefile.gcc-plugins
> +++ b/scripts/Makefile.gcc-plugins
> @@ -46,6 +46,10 @@ ifdef CONFIG_GCC_PLUGIN_ARM_SSP_PER_TASK
>  endif
>  export DISABLE_ARM_SSP_PER_TASK_PLUGIN
>  
> +gcc-plugin-$(CONFIG_GCC_PLUGIN_SHADOW_CALL_STACK) += arm64_scs_plugin.so
> +gcc-plugin-cflags-$(CONFIG_GCC_PLUGIN_SHADOW_CALL_STACK)	\
> +		+= -DSHADOW_CALL_STACK_PLUGIN
> +
>  # All the plugin CFLAGS are collected here in case a build target needs to
>  # filter them out of the KBUILD_CFLAGS.
>  GCC_PLUGINS_CFLAGS := $(strip $(addprefix -fplugin=$(objtree)/scripts/gcc-plugins/, $(gcc-plugin-y)) $(gcc-plugin-cflags-y))
> diff --git a/scripts/gcc-plugins/Kconfig b/scripts/gcc-plugins/Kconfig
> index ab9eb4c..2534195e 100644
> --- a/scripts/gcc-plugins/Kconfig
> +++ b/scripts/gcc-plugins/Kconfig
> @@ -19,6 +19,14 @@ menuconfig GCC_PLUGINS
>  
>  if GCC_PLUGINS
>  
> +config GCC_PLUGIN_SHADOW_CALL_STACK
> +	bool "GCC Shadow Call Stack plugin"

This should also have a

depends on ARCH_SUPPORTS_SHADOW_CALL_STACK

if you are selecting SHADOW_CALL_STACK, as selecting does not account
for dependencies.

> +	select SHADOW_CALL_STACK
> +	help
> +	  This plugin is used to support the kernel CONFIG_SHADOW_CALL_STACK
> +	  compiled by gcc. Its principle is basically the same as that of CLANG.
> +	  For more information, please refer to "config SHADOW_CALL_STACK"
> +
>  config GCC_PLUGIN_CYC_COMPLEXITY
>  	bool "Compute the cyclomatic complexity of a function" if EXPERT
>  	depends on !COMPILE_TEST	# too noisy

Cheers,
Nathan
