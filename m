Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82381688C5
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2019 14:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729948AbfGOMP0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Jul 2019 08:15:26 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:19477 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729946AbfGOMP0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Jul 2019 08:15:26 -0400
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x6FCF5C7012022;
        Mon, 15 Jul 2019 21:15:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x6FCF5C7012022
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1563192906;
        bh=ZXLECSGCInnXXU0ujGIQpHqb198I/3hegfmoAjHhnCM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OSUlOH6/dWQmflPxC3CUAMNIO+3Dj8jjv7TnTOHdTXAzCtYtqpqdew6/ioz2zXvlI
         FQszv1ux5UZFkcBtosvNoZsRaCZ1CeeSYuOYYHDcztoKUvWtzMNbDVUAU4U10THjb/
         IrFBOxIdyX/WsFAWT8FZdmrcnmBU7XhsmhqfHVOoL3ct25sVTvEvL9QXVo+S5+PASw
         wWJKex64/KHnkWIpy700jN3BuD5iwaxvFAn6MIe46Wk8gMKXkIdXHFEtfPXoIhCBXF
         J+wC4ifFOwLKgpTIYTxtSSNPKSnFUWxPL0o/lUqBs/4tVPqlrfPCjFDfqBxTEVx3QN
         AMtNnfOBQx1XQ==
X-Nifty-SrcIP: [209.85.217.46]
Received: by mail-vs1-f46.google.com with SMTP id u124so11191309vsu.2;
        Mon, 15 Jul 2019 05:15:06 -0700 (PDT)
X-Gm-Message-State: APjAAAU4UZQinAj6luda1pK4rpY/XYGsLOcxkz7GY+q3ovDq9f3R0VSb
        CX82EbU+ZFWv5xuTXVW/1LAoTEQ3Ze6TK9fx+Uw=
X-Google-Smtp-Source: APXvYqygQq9yRgYrckbp1UEQfPoO0pRpzqU0G9FXOj44UW2BgIJ0QxuwfbfddiNolLL2uNZo7L2irknOQp3akcOZ0Kg=
X-Received: by 2002:a67:d46:: with SMTP id 67mr16138374vsn.181.1563192905027;
 Mon, 15 Jul 2019 05:15:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190713040110.18210-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190713040110.18210-1-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 15 Jul 2019 21:14:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNARGiW1BCf9-K1oWLWKvVNZU7rzsdeGKTuT-Q2yGApi7+A@mail.gmail.com>
Message-ID: <CAK7LNARGiW1BCf9-K1oWLWKvVNZU7rzsdeGKTuT-Q2yGApi7+A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add --hash-style= and --build-id unconditionally
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        X86 ML <x86@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Andy Lutomirski <luto@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        sparclinux <sparclinux@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jul 13, 2019 at 1:01 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> As commit 1e0221374e30 ("mips: vdso: drop unnecessary cc-ldoption")
> explained, these flags are supported by the minimal required version
> of binutils.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.


>
>  Makefile                          | 6 ++----
>  arch/arm/vdso/Makefile            | 3 +--
>  arch/arm64/kernel/vdso32/Makefile | 4 ++--
>  arch/sparc/vdso/Makefile          | 3 +--
>  arch/x86/entry/vdso/Makefile      | 5 ++---
>  5 files changed, 8 insertions(+), 13 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 2c5d00ba537e..969182105dbd 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -900,10 +900,8 @@ KBUILD_CPPFLAGS += $(ARCH_CPPFLAGS) $(KCPPFLAGS)
>  KBUILD_AFLAGS   += $(ARCH_AFLAGS)   $(KAFLAGS)
>  KBUILD_CFLAGS   += $(ARCH_CFLAGS)   $(KCFLAGS)
>
> -# Use --build-id when available.
> -LDFLAGS_BUILD_ID := $(call ld-option, --build-id)
> -KBUILD_LDFLAGS_MODULE += $(LDFLAGS_BUILD_ID)
> -LDFLAGS_vmlinux += $(LDFLAGS_BUILD_ID)
> +KBUILD_LDFLAGS_MODULE += --build-id
> +LDFLAGS_vmlinux += --build-id
>
>  ifeq ($(CONFIG_STRIP_ASM_SYMS),y)
>  LDFLAGS_vmlinux        += $(call ld-option, -X,)
> diff --git a/arch/arm/vdso/Makefile b/arch/arm/vdso/Makefile
> index ca85df247775..87b7769214e0 100644
> --- a/arch/arm/vdso/Makefile
> +++ b/arch/arm/vdso/Makefile
> @@ -13,8 +13,7 @@ ccflags-y += -DDISABLE_BRANCH_PROFILING
>  ldflags-$(CONFIG_CPU_ENDIAN_BE8) := --be8
>  ldflags-y := -Bsymbolic --no-undefined -soname=linux-vdso.so.1 \
>             -z max-page-size=4096 -nostdlib -shared $(ldflags-y) \
> -           $(call ld-option, --hash-style=sysv) \
> -           $(call ld-option, --build-id) \
> +           --hash-style=sysv --build-id \
>             -T
>
>  obj-$(CONFIG_VDSO) += vdso.o
> diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
> index 288c14d30b45..60a4c6239712 100644
> --- a/arch/arm64/kernel/vdso32/Makefile
> +++ b/arch/arm64/kernel/vdso32/Makefile
> @@ -96,8 +96,8 @@ VDSO_LDFLAGS := $(VDSO_CPPFLAGS)
>  VDSO_LDFLAGS += -Wl,-Bsymbolic -Wl,--no-undefined -Wl,-soname=linux-vdso.so.1
>  VDSO_LDFLAGS += -Wl,-z,max-page-size=4096 -Wl,-z,common-page-size=4096
>  VDSO_LDFLAGS += -nostdlib -shared -mfloat-abi=soft
> -VDSO_LDFLAGS += $(call cc32-ldoption,-Wl$(comma)--hash-style=sysv)
> -VDSO_LDFLAGS += $(call cc32-ldoption,-Wl$(comma)--build-id)
> +VDSO_LDFLAGS += -Wl,--hash-style=sysv
> +VDSO_LDFLAGS += -Wl,--build-id
>  VDSO_LDFLAGS += $(call cc32-ldoption,-fuse-ld=bfd)
>
>
> diff --git a/arch/sparc/vdso/Makefile b/arch/sparc/vdso/Makefile
> index 5a9e4e1f9f81..324a23947585 100644
> --- a/arch/sparc/vdso/Makefile
> +++ b/arch/sparc/vdso/Makefile
> @@ -115,8 +115,7 @@ quiet_cmd_vdso = VDSO    $@
>                        -T $(filter %.lds,$^) $(filter %.o,$^) && \
>                 sh $(srctree)/$(src)/checkundef.sh '$(OBJDUMP)' '$@'
>
> -VDSO_LDFLAGS = -shared $(call ld-option, --hash-style=both) \
> -       $(call ld-option, --build-id) -Bsymbolic
> +VDSO_LDFLAGS = -shared --hash-style=both --build-id -Bsymbolic
>  GCOV_PROFILE := n
>
>  #
> diff --git a/arch/x86/entry/vdso/Makefile b/arch/x86/entry/vdso/Makefile
> index 39106111be86..4c234a18638a 100644
> --- a/arch/x86/entry/vdso/Makefile
> +++ b/arch/x86/entry/vdso/Makefile
> @@ -179,9 +179,8 @@ quiet_cmd_vdso = VDSO    $@
>                        -T $(filter %.lds,$^) $(filter %.o,$^) && \
>                  sh $(srctree)/$(src)/checkundef.sh '$(NM)' '$@'
>
> -VDSO_LDFLAGS = -shared $(call ld-option, --hash-style=both) \
> -       $(call ld-option, --build-id) $(call ld-option, --eh-frame-hdr) \
> -       -Bsymbolic
> +VDSO_LDFLAGS = -shared --hash-style=both --build-id \
> +       $(call ld-option, --eh-frame-hdr) -Bsymbolic
>  GCOV_PROFILE := n
>
>  #
> --
> 2.17.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel



-- 
Best Regards
Masahiro Yamada
