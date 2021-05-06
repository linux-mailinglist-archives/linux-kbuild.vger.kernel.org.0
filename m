Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 878F4375433
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 May 2021 14:55:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231580AbhEFM4L (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 6 May 2021 08:56:11 -0400
Received: from foss.arm.com ([217.140.110.172]:34196 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229946AbhEFM4J (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 May 2021 08:56:09 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFFD6106F;
        Thu,  6 May 2021 05:55:10 -0700 (PDT)
Received: from C02TD0UTHF1T.local (unknown [10.57.31.158])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C5893F73B;
        Thu,  6 May 2021 05:55:09 -0700 (PDT)
Date:   Thu, 6 May 2021 13:54:57 +0100
From:   Mark Rutland <mark.rutland@arm.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     linux-hardening@vger.kernel.org, Qing Zhao <qing.zhao@oracle.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-security-module@vger.kernel.org
Subject: Re: [PATCH] Makefile: Introduce CONFIG_ZERO_CALL_USED_REGS
Message-ID: <20210506125457.GA34956@C02TD0UTHF1T.local>
References: <20210505191804.4015873-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210505191804.4015873-1-keescook@chromium.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Kees,

On Wed, May 05, 2021 at 12:18:04PM -0700, Kees Cook wrote:
> When CONFIG_ZERO_CALL_USED_REGS is enabled, build the kernel with
> "-fzero-call-used-regs=used-gpr" (in GCC 11). This option will zero any
> caller-used register contents just before returning from a function,
> ensuring that temporary values are not leaked beyond the function
> boundary. This means that register contents are less likely to be
> available for side channel attacks and information exposures.
> 
> Additionally this helps reduce the number of useful ROP gadgets in the
> kernel image by about 20%:
> 
> $ ROPgadget.py --nosys --nojop --binary vmlinux.stock | tail -n1
> Unique gadgets found: 337245
> 
> $ ROPgadget.py --nosys --nojop --binary vmlinux.zero-call-regs | tail -n1
> Unique gadgets found: 267175
> 
> and more notably removes simple "write-what-where" gadgets:
> 
> $ ROPgadget.py --ropchain --binary vmlinux.stock | sed -n '/Step 1/,/Step 2/p'
> - Step 1 -- Write-what-where gadgets
> 
>         [+] Gadget found: 0xffffffff8102d76c mov qword ptr [rsi], rdx ; ret
>         [+] Gadget found: 0xffffffff81000cf5 pop rsi ; ret
>         [+] Gadget found: 0xffffffff8104d7c8 pop rdx ; ret
>         [-] Can't find the 'xor rdx, rdx' gadget. Try with another 'mov [reg], reg'
> 
>         [+] Gadget found: 0xffffffff814c2b4c mov qword ptr [rsi], rdi ; ret
>         [+] Gadget found: 0xffffffff81000cf5 pop rsi ; ret
>         [+] Gadget found: 0xffffffff81001e51 pop rdi ; ret
>         [-] Can't find the 'xor rdi, rdi' gadget. Try with another 'mov [reg], reg'
> 
>         [+] Gadget found: 0xffffffff81540d61 mov qword ptr [rsi], rdi ; pop rbx ; pop rbp ; ret
>         [+] Gadget found: 0xffffffff81000cf5 pop rsi ; ret
>         [+] Gadget found: 0xffffffff81001e51 pop rdi ; ret
>         [-] Can't find the 'xor rdi, rdi' gadget. Try with another 'mov [reg], reg'
> 
>         [+] Gadget found: 0xffffffff8105341e mov qword ptr [rsi], rax ; ret
>         [+] Gadget found: 0xffffffff81000cf5 pop rsi ; ret
>         [+] Gadget found: 0xffffffff81029a11 pop rax ; ret
>         [+] Gadget found: 0xffffffff811f1c3b xor rax, rax ; ret
> 
> - Step 2 -- Init syscall number gadgets
> 
> $ ROPgadget.py --ropchain --binary vmlinux.zero* | sed -n '/Step 1/,/Step 2/p'
> - Step 1 -- Write-what-where gadgets
> 
>         [-] Can't find the 'mov qword ptr [r64], r64' gadget
> 
> In parallel build tests, this has a less than 1% performance impact,
> and grows the image size less than 1%:
> 
> $ size vmlinux.stock vmlinux.zero-call-regs
>    text    data     bss     dec     hex filename
> 22437676   8559152 14127340 45124168 2b08a48 vmlinux.stock
> 22453184   8563248 14110956 45127388 2b096dc vmlinux.zero-call-regs

FWIW, I gave this a go on arm64, and the size increase is a fair bit
larger:

| [mark@lakrids:~/src/linux]% ls -l Image* 
| -rw-r--r-- 1 mark mark 31955456 May  6 13:36 Image.stock
| -rw-r--r-- 1 mark mark 33724928 May  6 13:23 Image.zero-call-regs

| [mark@lakrids:~/src/linux]% size vmlinux.stock vmlinux.zero-call-regs 
|    text    data     bss     dec     hex filename
| 20728552        11086474         505540 32320566        1ed2c36 vmlinux.stock
| 22500688        11084298         505540 34090526        2082e1e vmlinux.zero-call-regs

The Image is ~5.5% bigger, and the .text in the vmlinux is ~8.5% bigger

The resulting Image appears to work, but I haven't done anything beyond
booting, and I wasn't able to get ROPgadget.py going to quantify the
number of gadgets.

> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  Makefile                   |  5 +++++
>  security/Kconfig.hardening | 17 +++++++++++++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 31dcdb3d61fa..810600618490 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -811,6 +811,11 @@ KBUILD_CFLAGS	+= -ftrivial-auto-var-init=zero
>  KBUILD_CFLAGS	+= -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang
>  endif
>  
> +# Clear used registers at func exit (to reduce data lifetime and ROP gadgets).
> +ifdef CONFIG_ZERO_CALL_USED_REGS
> +KBUILD_CFLAGS	+= -fzero-call-used-regs=used-gpr
> +endif
> +
>  DEBUG_CFLAGS	:=
>  
>  # Workaround for GCC versions < 5.0
> diff --git a/security/Kconfig.hardening b/security/Kconfig.hardening
> index 269967c4fc1b..85f7f2036725 100644
> --- a/security/Kconfig.hardening
> +++ b/security/Kconfig.hardening
> @@ -217,6 +217,23 @@ config INIT_ON_FREE_DEFAULT_ON
>  	  touching "cold" memory areas. Most cases see 3-5% impact. Some
>  	  synthetic workloads have measured as high as 8%.
>  
> +config CC_HAS_ZERO_CALL_USED_REGS
> +	def_bool $(cc-option,-fzero-call-used-regs=used-gpr)
> +
> +config ZERO_CALL_USED_REGS
> +	bool "Enable register zeroing on function exit"
> +	depends on CC_HAS_ZERO_CALL_USED_REGS
> +	help
> +	  At the end of functions, always zero any caller-used register
> +	  contents. This helps ensure that temporary values are not
> +	  leaked beyond the function boundary. This means that register
> +	  contents are less likely to be available for side channels
> +	  and information exposures. Additionally, this helps reduce the
> +	  number of useful ROP gadgets by about 20% (and removes compiler
> +	  generated "write-what-where" gadgets) in the resulting kernel
> +	  image. This has a less than 1% performance impact on most
> +	  workloads, and grows the image size less than 1%.

I think the numbers need an "on x86" caveat, since they're not
necessarily representative of other architectures.

This shows up under the "Memory initialization" sub-menu, but I assume
it was meant to be directly under the "Kernel hardening options" menu...

> +
>  endmenu

... and should presumably be here?

Thanks,
Mark.

>  
>  endmenu
> -- 
> 2.25.1
> 
