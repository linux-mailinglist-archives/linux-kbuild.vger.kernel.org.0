Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8DF8410919
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Sep 2021 04:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232470AbhISCDj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 18 Sep 2021 22:03:39 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:42446 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230377AbhISCDi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 18 Sep 2021 22:03:38 -0400
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 18J220fs028187;
        Sun, 19 Sep 2021 11:02:00 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 18J220fs028187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1632016920;
        bh=Z/gNxIq+bDVsIzi7WYm/lUdYSrE6EljYQaYBdU/xrxE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HSEPVfsG+udftoyE19f0nHM6NcHFPq3gJIVhvRXtqThMQF59ggtQO/HCzqlZZIgQ0
         oS9mYGl27M82beRh2ss3EhHJY8s+bdjmaY9+sA7+N1NbCJ8uUFsHFKY+t5yXZ0HA45
         aTuZFxlAVsbwcdEFOLA1j7Joj3K+nI9LwO2ZZVXbwiALu3vriYus+vN/SKqFfeIlj2
         /+q0UqMQhQF72czXeO5W+vCGcjqu0458hfjSf6fA2JctXzGdqY+UsQNhcy7748DLNe
         SP/VGOWifGlzki8rHDPTwD9waoprKyZbNv3gmwx13uH/I4rHD55YBTsDBH6kPx6rpz
         N93MZqSUjdmJg==
X-Nifty-SrcIP: [209.85.215.169]
Received: by mail-pg1-f169.google.com with SMTP id q68so13733502pga.9;
        Sat, 18 Sep 2021 19:02:00 -0700 (PDT)
X-Gm-Message-State: AOAM530y+i/HLAcAWyAxYytwz/6wz+BPfyK3/MvIX/znb2BiymxDiIBL
        DGN/iK58aVWi12OCy1qLklFBS389xivYei2b88Q=
X-Google-Smtp-Source: ABdhPJyw1BAb4i9nakU7J7GTQ5NMugRyYo7+seI20mR/j8MquU+znpaVKlN6fnF1fNFhjEZHUIOU3jifNrszBT+QZVo=
X-Received: by 2002:a65:40c4:: with SMTP id u4mr17266657pgp.186.1632016919668;
 Sat, 18 Sep 2021 19:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210916184017.1881473-1-nathan@kernel.org> <20210916184017.1881473-2-nathan@kernel.org>
In-Reply-To: <20210916184017.1881473-2-nathan@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 19 Sep 2021 11:01:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNARZwfag+2NFeHQb2=fDJMd+7jLKbre20o6kf0+JGb+Z+w@mail.gmail.com>
Message-ID: <CAK7LNARZwfag+2NFeHQb2=fDJMd+7jLKbre20o6kf0+JGb+Z+w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] x86/build: Do not add -falign flags
 unconditionally for clang
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        X86 ML <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        llvm@lists.linux.dev, kernel test robot <lkp@intel.com>,
        Borislav Petkov <bp@suse.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Sep 17, 2021 at 3:42 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> clang does not support -falign-jumps and only recently gained support
> for -falign-loops. When one of the configuration options that adds these
> flags is enabled, clang warns and all cc-{disable-warning,option} that
> follow fail because -Werror gets added to test for the presence of this
> warning:
>
> clang-14: warning: optimization flag '-falign-jumps=0' is not supported
> [-Wignored-optimization-argument]
>
> To resolve this, add a couple of cc-option calls when building with
> clang; gcc has supported these options since 3.2 so there is no point in
> testing for their support. -falign-functions was implemented in clang-7,
> -falign-loops was implemented in clang-14, and -falign-jumps has not
> been implemented yet.
>
> Link: https://lore.kernel.org/r/YSQE2f5teuvKLkON@Ryzen-9-3900X.localdomain/
> Link: https://lore.kernel.org/r/20210824022640.2170859-2-nathan@kernel.org/
> Reported-by: kernel test robot <lkp@intel.com>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Acked-by: Borislav Petkov <bp@suse.de>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  arch/x86/Makefile_32.cpu | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/arch/x86/Makefile_32.cpu b/arch/x86/Makefile_32.cpu
> index e7355f8b51c2..94834c4b5e5e 100644
> --- a/arch/x86/Makefile_32.cpu
> +++ b/arch/x86/Makefile_32.cpu
> @@ -4,6 +4,12 @@
>
>  tune           = $(call cc-option,-mtune=$(1),$(2))
>
> +ifdef CONFIG_CC_IS_CLANG
> +align          := -falign-functions=0 $(call cc-option,-falign-jumps=0) $(call cc-option,-falign-loops=0)
> +else
> +align          := -falign-functions=0 -falign-jumps=0 -falign-loops=0
> +endif
> +
>  cflags-$(CONFIG_M486SX)                += -march=i486
>  cflags-$(CONFIG_M486)          += -march=i486
>  cflags-$(CONFIG_M586)          += -march=i586
> @@ -19,11 +25,11 @@ cflags-$(CONFIG_MK6)                += -march=k6
>  # They make zero difference whatsosever to performance at this time.
>  cflags-$(CONFIG_MK7)           += -march=athlon
>  cflags-$(CONFIG_MK8)           += $(call cc-option,-march=k8,-march=athlon)
> -cflags-$(CONFIG_MCRUSOE)       += -march=i686 -falign-functions=0 -falign-jumps=0 -falign-loops=0
> -cflags-$(CONFIG_MEFFICEON)     += -march=i686 $(call tune,pentium3) -falign-functions=0 -falign-jumps=0 -falign-loops=0
> +cflags-$(CONFIG_MCRUSOE)       += -march=i686 $(align)
> +cflags-$(CONFIG_MEFFICEON)     += -march=i686 $(call tune,pentium3) $(align)
>  cflags-$(CONFIG_MWINCHIPC6)    += $(call cc-option,-march=winchip-c6,-march=i586)
>  cflags-$(CONFIG_MWINCHIP3D)    += $(call cc-option,-march=winchip2,-march=i586)
> -cflags-$(CONFIG_MCYRIXIII)     += $(call cc-option,-march=c3,-march=i486) -falign-functions=0 -falign-jumps=0 -falign-loops=0
> +cflags-$(CONFIG_MCYRIXIII)     += $(call cc-option,-march=c3,-march=i486) $(align)
>  cflags-$(CONFIG_MVIAC3_2)      += $(call cc-option,-march=c3-2,-march=i686)
>  cflags-$(CONFIG_MVIAC7)                += -march=i686
>  cflags-$(CONFIG_MCORE2)                += -march=i686 $(call tune,core2)
>
> base-commit: a9086b878b7fd65894eb8cb1fa395dd469970566
> --
> 2.33.0
>

Applied to linux-kbuild. Thanks.


-- 
Best Regards
Masahiro Yamada
