Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E932E29250A
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Oct 2020 11:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727647AbgJSJ5C (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Oct 2020 05:57:02 -0400
Received: from foss.arm.com ([217.140.110.172]:53798 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726249AbgJSJ5B (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Oct 2020 05:57:01 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C624630E;
        Mon, 19 Oct 2020 02:57:00 -0700 (PDT)
Received: from [10.37.8.82] (unknown [10.37.8.82])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB5793F66E;
        Mon, 19 Oct 2020 02:56:58 -0700 (PDT)
Subject: Re: [PATCH] arm64: vdso32: Allow ld.lld to properly link the VDSO
To:     Nathan Chancellor <natechancellor@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>
References: <20201013033947.2257501-1-natechancellor@gmail.com>
From:   Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <53b74ed0-f143-6870-1227-3d9663166068@arm.com>
Date:   Mon, 19 Oct 2020 10:59:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201013033947.2257501-1-natechancellor@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


Hi Nathan,

On 10/13/20 4:39 AM, Nathan Chancellor wrote:
> As it stands now, the vdso32 Makefile hardcodes the linker to ld.bfd
> using -fuse-ld=bfd with $(CC). This was taken from the arm vDSO
> Makefile, as the comment notes, done in commit d2b30cd4b722 ("ARM:
> 8384/1: VDSO: force use of BFD linker").
> 
> Commit fe00e50b2db8 ("ARM: 8858/1: vdso: use $(LD) instead of $(CC) to
> link VDSO") changed that Makefile to use $(LD) directly instead of
> through $(CC), which matches how the rest of the kernel operates. Since
> then, LD=ld.lld means that the arm vDSO will be linked with ld.lld,
> which has shown no problems so far.
> 
> Allow ld.lld to link this vDSO as we do the regular arm vDSO. To do
> this, we need to do a few things:
> 
> * Add a LD_COMPAT variable, which defaults to $(CROSS_COMPILE_COMPAT)ld
>   with gcc and $(LD) if LLVM is 1, which will be ld.lld, or
>   $(CROSS_COMPILE_COMPAT)ld if not, which matches the logic of the main
>   Makefile. It is overrideable for further customization and avoiding
>   breakage.
> 
> * Eliminate cc32-ldoption, which matches commit 055efab3120b ("kbuild:
>   drop support for cc-ldoption").
> 
> With those, we can use $(LD_COMPAT) in cmd_ldvdso and change the flags
> from compiler linker flags to linker flags directly. We eliminate
> -mfloat-abi=soft because it is not handled by the linker.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1033
> Reported-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Just a small nit on my side (see below) and as you already stated it requires
rebasing if we want to merge it in mainline. Otherwise:

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

> ---
> 
> NOTE: This patch is currently based on the kbuild tree due to the
> --build-id -> --build-id=sha1 change that Bill did. If the arm64
> maintainers would prefer to take this patch, I can rebase it (althought
> presumably this won't hit mainline until at least 5.11 so it can
> probably just stay as is for now).
> 
>  arch/arm64/kernel/vdso32/Makefile | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
> index 7f96a1a9f68c..1cf00c58805d 100644
> --- a/arch/arm64/kernel/vdso32/Makefile
> +++ b/arch/arm64/kernel/vdso32/Makefile
> @@ -22,16 +22,21 @@ endif
>  
>  CC_COMPAT ?= $(CC)
>  CC_COMPAT += $(CC_COMPAT_CLANG_FLAGS)
> +
> +ifeq ($(LLVM),1)

Nit: Here can we check 'ifneq ($(LLVM),)' for consistency with what the main
Makefile does?

> +LD_COMPAT ?= $(LD)
> +else
> +LD_COMPAT ?= $(CROSS_COMPILE_COMPAT)ld
> +endif
>  else
>  CC_COMPAT ?= $(CROSS_COMPILE_COMPAT)gcc
> +LD_COMPAT ?= $(CROSS_COMPILE_COMPAT)ld
>  endif
>  
>  cc32-option = $(call try-run,\
>          $(CC_COMPAT) $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
>  cc32-disable-warning = $(call try-run,\
>  	$(CC_COMPAT) -W$(strip $(1)) -c -x c /dev/null -o "$$TMP",-Wno-$(strip $(1)))
> -cc32-ldoption = $(call try-run,\
> -        $(CC_COMPAT) $(1) -nostdlib -x c /dev/null -o "$$TMP",$(1),$(2))
>  cc32-as-instr = $(call try-run,\
>  	printf "%b\n" "$(1)" | $(CC_COMPAT) $(VDSO_AFLAGS) -c -x assembler -o "$$TMP" -,$(2),$(3))
>  
> @@ -122,14 +127,10 @@ dmbinstr := $(call cc32-as-instr,dmb ishld,-DCONFIG_AS_DMB_ISHLD=1)
>  VDSO_CFLAGS += $(dmbinstr)
>  VDSO_AFLAGS += $(dmbinstr)
>  
> -VDSO_LDFLAGS := $(VDSO_CPPFLAGS)
>  # From arm vDSO Makefile
> -VDSO_LDFLAGS += -Wl,-Bsymbolic -Wl,--no-undefined -Wl,-soname=linux-vdso.so.1
> -VDSO_LDFLAGS += -Wl,-z,max-page-size=4096 -Wl,-z,common-page-size=4096
> -VDSO_LDFLAGS += -nostdlib -shared -mfloat-abi=soft
> -VDSO_LDFLAGS += -Wl,--hash-style=sysv
> -VDSO_LDFLAGS += -Wl,--build-id=sha1
> -VDSO_LDFLAGS += $(call cc32-ldoption,-fuse-ld=bfd)
> +VDSO_LDFLAGS += -Bsymbolic --no-undefined -soname=linux-vdso.so.1
> +VDSO_LDFLAGS += -z max-page-size=4096 -z common-page-size=4096
> +VDSO_LDFLAGS += -nostdlib -shared --hash-style=sysv --build-id=sha1
>  
>  
>  # Borrow vdsomunge.c from the arm vDSO
> @@ -189,8 +190,8 @@ quiet_cmd_vdsold_and_vdso_check = LD32    $@
>        cmd_vdsold_and_vdso_check = $(cmd_vdsold); $(cmd_vdso_check)
>  
>  quiet_cmd_vdsold = LD32    $@
> -      cmd_vdsold = $(CC_COMPAT) -Wp,-MD,$(depfile) $(VDSO_LDFLAGS) \
> -                   -Wl,-T $(filter %.lds,$^) $(filter %.o,$^) -o $@
> +      cmd_vdsold = $(LD_COMPAT) $(VDSO_LDFLAGS) \
> +                   -T $(filter %.lds,$^) $(filter %.o,$^) -o $@
>  quiet_cmd_vdsocc = CC32    $@
>        cmd_vdsocc = $(CC_COMPAT) -Wp,-MD,$(depfile) $(VDSO_CFLAGS) -c -o $@ $<
>  quiet_cmd_vdsocc_gettimeofday = CC32    $@
> 
> base-commit: 172aad81a882443eefe1bd860c4eddc81b14dd5b
> 

-- 
Regards,
Vincenzo
