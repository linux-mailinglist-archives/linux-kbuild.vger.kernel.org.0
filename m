Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC3742B1371
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Nov 2020 01:45:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbgKMApQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 12 Nov 2020 19:45:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726011AbgKMApQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Nov 2020 19:45:16 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36CC2C0613D4
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Nov 2020 16:44:58 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id z24so5699069pgk.3
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Nov 2020 16:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uPz0VNRgAU6deAyeUwvHx8BA1S/DOt0Kxt6fec1P47Y=;
        b=jVu4e1SpPT8q2ZSLkXlUchM4CAK+7CacjDt1JACHjvW3bNh3Jw0OxOWHELqcqv47hV
         h8wN6iQfU66pciPEgbgT1chLXIf9cRIZskLq2NrJWCPuY+/9tirTRRWs6PwUkwwhg8yM
         C1A21Zo+dbuBqJVJlG/IvsQPjDiOiuFnD3chj0Of9bMEy1Q1/BhakuQYfRecPXacg6w6
         JsKZn7CFQzRwglZdBGIh0eEEvRcSzvGlllD96QpxYfT/Vb1xifRy1Kgo1x7m89VvDOUR
         i4V4iiFbJdTUWMEvpxuWuG6pPz/WWDJxuqqEfz5/NaC+1f2PwZkAtBA4e3t3/FAS6bp/
         DWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uPz0VNRgAU6deAyeUwvHx8BA1S/DOt0Kxt6fec1P47Y=;
        b=j2A+8h+dqXHMRZwQVwZzsn/jIenMiArSYroZw3CwVHy//MTrhhReTW6e9lpiulLweD
         n/+fSEzCUiJ9GqIeZ2tTX4SzKXdpM2uhIxCWQbMerHNiIRBwQg9k0PRixV2jMEmx50wM
         L2L6J1t5fSoztIzcIqVwiR8wWXGqtCVYrvYC/3DOuHi2rYyDjEbacpUfeXQXp+G9ACtp
         xf7i0oa4M4hA/DD1yU3T75FrOMzi3pq1HRLZUEUvI/A4cvcuPQint8YJD4hHWTvwrQR4
         V3PHV+m4sKmbK10+N1eF/i3f+PezY5q9g7mqfROPaEyDow4ucSfUff0IhuqVxL2WPgd3
         jIaA==
X-Gm-Message-State: AOAM530xolflnvNTbqSsPl8XdmL6cmnN/63SZ/YnsPw98ZrL5OqKtBVJ
        D77/V8QrQP2PVqgGbqv5nFVz4y1jnmFm1TeDiyt9OQ==
X-Google-Smtp-Source: ABdhPJxGes8jw96mSloaUfHwfGTOota16TXwD/Vk/8CX5nUzF9zDdKv5unc+Ykk2kcWi7/EBCVvv5iWQLVXMiEeSDhk=
X-Received: by 2002:a17:90b:110b:: with SMTP id gi11mr457122pjb.25.1605228297498;
 Thu, 12 Nov 2020 16:44:57 -0800 (PST)
MIME-Version: 1.0
References: <20201112183839.1009297-1-natechancellor@gmail.com>
In-Reply-To: <20201112183839.1009297-1-natechancellor@gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 12 Nov 2020 16:44:46 -0800
Message-ID: <CAKwvOdkShrqgNDWO0bsPcPZLx-+u79mfmPrGy7CnSKZVdcYzSA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Always link with '-z norelro'
To:     Nathan Chancellor <natechancellor@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Abbott Liu <liuwenliang@huawei.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jian Cai <jiancai@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Nov 12, 2020 at 10:41 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Commit 3bbd3db86470 ("arm64: relocatable: fix inconsistencies in linker
> script and options") added '-z norelro' to the arm64 Makefile when
> CONFIG_RELOCATABLE was set to help support ld.lld because ld.lld
> defaults to '-z relro' but the kernel does not use program headers or
> adhere to the section layout that is required for RELRO to work.
>
> Commit 3b92fa7485eb ("arm64: link with -z norelro regardless of
> CONFIG_RELOCATABLE") unconditionally added it to LDFLAGS_vmlinux because
> an error occurs with CONFIG_KASAN set even when CONFIG_RELOCATABLE is
> unset.
>
> As it turns out, ARM experiences the same error after CONFIG_KASAN was
> implemented, meaning that '-z norelro' needs to be added to that
> Makefile as well (multi_v7_defconfig + CONFIG_KASAN=y + LD=ld.lld):
>
> $ make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- LLVM=1 zImage
> ld.lld: error: section: .exit.data is not contiguous with other relro sections
>
> To avoid playing whack-a-mole with different architectures over time,
> hoist '-z norelro' into the main Makefile. This does not affect ld.bfd
> because '-z norelro' is the default for it.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1189
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Why not add it additionally to KBUILD_LDFLAGS_MODULE a la
`--build-id=sha1` a few lines above? (or `LDFLAGS_MODULE`, but that
looks unused?)  We probably don't want this for modules either.  In
that case, you could add -z norelo to the two existing lines with
`--build-id=sha1` above?

> ---
>
> Hi all,
>
> This should probably go into Russell's tree with acks from the arm64 and
> kbuild maintainers.
>
> Cheers,
> Nathan
>
>  Makefile            | 2 ++
>  arch/arm64/Makefile | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 008aba5f1a20..648bfb486244 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -984,6 +984,8 @@ ifeq ($(CONFIG_RELR),y)
>  LDFLAGS_vmlinux        += --pack-dyn-relocs=relr
>  endif
>
> +LDFLAGS_vmlinux += -z norelro
> +
>  # Align the bit size of userspace programs with the kernel
>  KBUILD_USERCFLAGS  += $(filter -m32 -m64 --target=%, $(KBUILD_CFLAGS))
>  KBUILD_USERLDFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CFLAGS))
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index 5789c2d18d43..85495ff8f0fd 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -10,7 +10,7 @@
>  #
>  # Copyright (C) 1995-2001 by Russell King
>
> -LDFLAGS_vmlinux        :=--no-undefined -X -z norelro
> +LDFLAGS_vmlinux        :=--no-undefined -X
>
>  ifeq ($(CONFIG_RELOCATABLE), y)
>  # Pass --no-apply-dynamic-relocs to restore pre-binutils-2.27 behaviour
>
> base-commit: f8394f232b1eab649ce2df5c5f15b0e528c92091
> --
> 2.29.2
>


-- 
Thanks,
~Nick Desaulniers
