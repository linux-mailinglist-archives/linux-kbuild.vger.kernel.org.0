Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 774B23F7EA1
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Aug 2021 00:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233054AbhHYWda (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 25 Aug 2021 18:33:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232978AbhHYWda (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Aug 2021 18:33:30 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBA81C0613C1
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Aug 2021 15:32:43 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id y34so2126968lfa.8
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Aug 2021 15:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G3Nt1IIP3rodQkGlNZEzuycv4KD2J93SOLZmuAiefgM=;
        b=lrXxjbDHt4LGtjkbfckfYoT3ZxGzMUiyyXWJUF5CH3FjXl5+3dPxMuWGOGSkUmLIE5
         QAWQRTWy1M0UZCeMkFSjw7lp8AbwwxMuvcZ77lrFkciaz9RvL7PJHvHHukpx+liFV7tR
         x5+7Mm4YbyO/FYX4t/BE39unt7T5ZW9Pd0IW+sHOHEMxWhznrxPdTiXJAcHf5NyhyBsr
         RWiHwuvcIJLI+dJS8+744eVk3+xMaB53KHuieW0SkEuQvl2mHXgJgF4sL4yxLGNiROF2
         OWXayr4gHv2oHShYVo28Vg5mYktrrQ2d0TqfrR5RoZHHODQSiEEpfOM3iNTxijGGz8e2
         Cd0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G3Nt1IIP3rodQkGlNZEzuycv4KD2J93SOLZmuAiefgM=;
        b=D6TLYqbMSTAReTL26e8kEwEkDoK0EIriaWU6F/iWrwcqAbgH0UI4YnjdvynFiTgwo0
         fH7rMQDvIOodQ/J4E9n8xA/vUu+3kXjHLZmr2/B7bbv0epsZtOopCQ1RSQnoNrzxx9WO
         tYAJ7yqH7qc334RdCc7kB0KPDIdmw92xQi8GQzdoX6/Y07O5RBhwpY3O40IfR/5ERTIF
         m4SgYZ4Ip5VbQ76biMtITnjPe2H8dlWJBPol2Fi3VBj9Ev8A2ciPh2uP2YKEXhR/GTZK
         julEkHCGKvy2sv2ATgHwuGHmvMfuJ6fhOAbBi9Cww1RmkG/ZJUfDJGNeEgo78Oa6nSEk
         Y7zQ==
X-Gm-Message-State: AOAM531xR2L3FJmEx5awf1Chu9BNuxmKKurdpnYrpeR/OCBO8ZZzPUVR
        ynf9csCH3gRL8nfRcKR89q5lxGCzOMBpv8a0L4tVbxQTbHqazQ==
X-Google-Smtp-Source: ABdhPJyHolY3oPsE0EVs30qtz/wG9gN1ApmXIOmikHfSXG0wMZESRPd/i92QlWepyD/Jrcd0urPBD6q27ZP4pMof9bk=
X-Received: by 2002:a19:f017:: with SMTP id p23mr267425lfc.547.1629930761847;
 Wed, 25 Aug 2021 15:32:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210824022640.2170859-1-nathan@kernel.org> <20210824022640.2170859-2-nathan@kernel.org>
In-Reply-To: <20210824022640.2170859-2-nathan@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 25 Aug 2021 15:32:30 -0700
Message-ID: <CAKwvOd=eXk6dJ3xodkaqA6h_npHENe8x2NLD53+Hnij1nytj5A@mail.gmail.com>
Subject: Re: [PATCH 1/2] x86: Do not add -falign flags unconditionally for clang
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 23, 2021 at 7:27 PM Nathan Chancellor <nathan@kernel.org> wrote:
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
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  arch/x86/Makefile_32.cpu | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/arch/x86/Makefile_32.cpu b/arch/x86/Makefile_32.cpu
> index cd3056759880..e8c65f990afd 100644
> --- a/arch/x86/Makefile_32.cpu
> +++ b/arch/x86/Makefile_32.cpu
> @@ -10,6 +10,12 @@ else
>  tune           = $(call cc-option,-mcpu=$(1),$(2))
>  endif
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
> @@ -25,11 +31,11 @@ cflags-$(CONFIG_MK6)                += -march=k6
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
> --
> 2.33.0
>


-- 
Thanks,
~Nick Desaulniers
