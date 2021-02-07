Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6533120F7
	for <lists+linux-kbuild@lfdr.de>; Sun,  7 Feb 2021 03:48:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbhBGCsK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 6 Feb 2021 21:48:10 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:36582 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhBGCsJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Feb 2021 21:48:09 -0500
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 1172l0Up032711;
        Sun, 7 Feb 2021 11:47:00 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 1172l0Up032711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1612666021;
        bh=ghNVF7RId+0rBDAA/rTFEzf4FBB/DzAejlaBZNUlMNQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZLOSshleSkDyLPWelX5UHaSTIMKfpGukLdHNfT9V05nCW0AVihLhLG+OI6wuYtgdN
         +3Bcc5PQfAga66kR2xsPwQSYWEmFg56WWa+iFNydp7g5p6SMOKrs2a9h6PfJ3Pyf6z
         UpCuM4/746ma77L9Aq25L5NS/Je2W9oY6P2+TJfulCMP1MgMdx2k0YEqh9xsc3JMBF
         Fcsg0cO29e1XXxUkdrlIzDOVkgTrpR/wcsLgoaFG0U2GjRH7ep39Klrf0DHzREBVPS
         fkXQcj25I2Xv8Y/dFF1gxCQSks4HGN42P4xxfk3XHEqs2LVhqPzWuT0HROAwWMJ9xJ
         Ew8tSNu0LCHiw==
X-Nifty-SrcIP: [209.85.216.52]
Received: by mail-pj1-f52.google.com with SMTP id cl8so6341265pjb.0;
        Sat, 06 Feb 2021 18:47:00 -0800 (PST)
X-Gm-Message-State: AOAM533U+3b6EwUnvgdxPa4ClKBm6fTKto6h97JdAKKGqxRF2AL2AmCs
        ElmtLZBXYrmoHW8AOwokqZCId1tZUSOmktYCL9U=
X-Google-Smtp-Source: ABdhPJyI8oeeKjMMpgdj5S+fpS+hlAiCOqX7zqHl60Jp9ZhrcXH2ACe4Oi607ImgqQbyjdA+NWpFLkbuu90nHd3g0ww=
X-Received: by 2002:a17:90a:5403:: with SMTP id z3mr11066020pjh.198.1612666019722;
 Sat, 06 Feb 2021 18:46:59 -0800 (PST)
MIME-Version: 1.0
References: <20200829051524.706585-1-masahiroy@kernel.org> <20200829051524.706585-4-masahiroy@kernel.org>
In-Reply-To: <20200829051524.706585-4-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 7 Feb 2021 11:46:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNASj6f1FxZwyhRp_KoPX2UL=-49RPLwWK_Na64pwtBertA@mail.gmail.com>
Message-ID: <CAK7LNASj6f1FxZwyhRp_KoPX2UL=-49RPLwWK_Na64pwtBertA@mail.gmail.com>
Subject: Re: [PATCH 3/3] ia64: remove generated/nr-irqs.h generation to fix
 build warning
To:     Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>,
        linux-ia64@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Aug 29, 2020 at 2:15 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Randy reports the following warning when building ARCH=ia64 with
> CONFIG_IA64_PALINFO=m:
>
> ../scripts/Makefile.build:68: 'arch/ia64/kernel/palinfo.ko' will not be built even though obj-m is specified.
> ../scripts/Makefile.build:69: You cannot use subdir-y/m to visit a module Makefile. Use obj-y/m instead.
>
> This message is actually false-positive, and you can get palinfo.ko
> correctly built. It is emitted in the archprepare stage, where Kbuild
> descends into arch/ia64/kernel to generate include/generated/nr-irqs.h
> instead of any kind of kernel objects.
>
> arch/ia64/kernel/nr-irqs.c was introduced by commit 213060a4d699
> ("[IA64] pvops: paravirtualize NR_IRQS") to pre-calculate:
>
>    NR_IRQS = max(IA64_NATIVE_NR_IRQS, XEN_NR_IRQS, FOO_NR_IRQS...)
>
> Since commit d52eefb47d4e ("ia64/xen: Remove Xen support for ia64"), this
> union contains just one field, making NR_IRQS and IA64_NATIVE_NR_IRQS
> always match.
>
> So, the following hard-coding now works:
>
>   #define NR_IRQS                IA64_NATIVE_NR_IRQS
>
> If you need to re-introduce NR_IRQS = max(...) gimmick in the future,
> please try to implement it in asm-offsets.c instead of a separate file.
> It will be possible because the header inclusion has been consolidated
> to make asm-offsets.c independent of <asm/irqs.h>.
>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>


This build issue is still remaining.

I will send this series in the next MW
via my kbuild tree.





> ---
>
>  arch/ia64/Makefile          |  6 ------
>  arch/ia64/include/asm/irq.h |  4 +++-
>  arch/ia64/kernel/Makefile   |  5 -----
>  arch/ia64/kernel/nr-irqs.c  | 22 ----------------------
>  4 files changed, 3 insertions(+), 34 deletions(-)
>  delete mode 100644 arch/ia64/kernel/nr-irqs.c
>
> diff --git a/arch/ia64/Makefile b/arch/ia64/Makefile
> index 2876a7df1b0a..3d54d411fcc4 100644
> --- a/arch/ia64/Makefile
> +++ b/arch/ia64/Makefile
> @@ -87,9 +87,3 @@ define archhelp
>    echo '  install      - Install compressed kernel image'
>    echo '* unwcheck     - Check vmlinux for invalid unwind info'
>  endef
> -
> -archprepare: make_nr_irqs_h
> -PHONY += make_nr_irqs_h
> -
> -make_nr_irqs_h:
> -       $(Q)$(MAKE) $(build)=arch/ia64/kernel include/generated/nr-irqs.h
> diff --git a/arch/ia64/include/asm/irq.h b/arch/ia64/include/asm/irq.h
> index 5acf52e90872..0eccf33dfe8b 100644
> --- a/arch/ia64/include/asm/irq.h
> +++ b/arch/ia64/include/asm/irq.h
> @@ -14,7 +14,9 @@
>
>  #include <linux/types.h>
>  #include <linux/cpumask.h>
> -#include <generated/nr-irqs.h>
> +#include <asm/native/irq.h>
> +
> +#define NR_IRQS                IA64_NATIVE_NR_IRQS
>
>  static __inline__ int
>  irq_canonicalize (int irq)
> diff --git a/arch/ia64/kernel/Makefile b/arch/ia64/kernel/Makefile
> index 1a8df6669eee..7c9354ee4b3e 100644
> --- a/arch/ia64/kernel/Makefile
> +++ b/arch/ia64/kernel/Makefile
> @@ -48,8 +48,3 @@ CFLAGS_traps.o  += -mfixed-range=f2-f5,f16-f31
>
>  # The gate DSO image is built using a special linker script.
>  include $(src)/Makefile.gate
> -
> -include/generated/nr-irqs.h: arch/$(SRCARCH)/kernel/nr-irqs.s FORCE
> -       $(call filechk,offsets,__ASM_NR_IRQS_H__)
> -
> -targets += nr-irqs.s
> diff --git a/arch/ia64/kernel/nr-irqs.c b/arch/ia64/kernel/nr-irqs.c
> deleted file mode 100644
> index f2633b22d3be..000000000000
> --- a/arch/ia64/kernel/nr-irqs.c
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/*
> - * calculate
> - * NR_IRQS = max(IA64_NATIVE_NR_IRQS, XEN_NR_IRQS, FOO_NR_IRQS...)
> - * depending on config.
> - * This must be calculated before processing asm-offset.c.
> - */
> -
> -#define ASM_OFFSETS_C 1
> -
> -#include <linux/kbuild.h>
> -#include <linux/threads.h>
> -#include <asm/native/irq.h>
> -
> -void foo(void)
> -{
> -       union paravirt_nr_irqs_max {
> -               char ia64_native_nr_irqs[IA64_NATIVE_NR_IRQS];
> -       };
> -
> -       DEFINE(NR_IRQS, sizeof (union paravirt_nr_irqs_max));
> -}
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
