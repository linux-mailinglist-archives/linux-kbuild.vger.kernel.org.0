Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4540F191723
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2020 18:02:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727324AbgCXRBy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Mar 2020 13:01:54 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:39586 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727273AbgCXRBy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Mar 2020 13:01:54 -0400
Received: by mail-pj1-f65.google.com with SMTP id ck23so1723572pjb.4
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Mar 2020 10:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i+ozVGPWZ8LGXvVCrBNoRqT1LP5S57LScccMkP4xx1s=;
        b=bN5MWtinMkkGMgnRAyAqfbx0aTgj4CzDaAyRAb87s0p2LmLygHyloKbCrzH3cvXBh7
         A6bNm6PHTHxgbSGDCQGnz/1gXeaVdYSZugx560dd8/Bs4TYINhhP/825DM9gUaEHVJn2
         gEnbgREevzflqEJNXMSc5WfsG62EGZ4JSBlv242eHA2kaSoYQXy4PTglNFxQgMl0AhpX
         uvyKiHw+unfXdofnfF+eGzoKYzPvmqUl/buHZuTPvrSzL8P9mW5Zi9F4b8SJFJuznbKJ
         q90+Fd8uVuZ4thRQMtGjiAqIX1KGeOiOBy584/HzwLQmYQAfJTDZ71SHldrJdNRc+HIR
         i3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i+ozVGPWZ8LGXvVCrBNoRqT1LP5S57LScccMkP4xx1s=;
        b=CWixCWyUJe9DQ9he1mnTdwQHMp3vidLPzKMLnW/RWMvVC1ZKHVRrpJRQB1snpMtX3c
         xj1/oLmn4/C9ky03LgyzOPxuKFWQHB2Ke/XtUfbZyLFfZFMGQHiYk1zr9YvWziKUNVy2
         Q8Gmp+z4Hb/zhoLU2Jok5/5KonnUoxxKaltTKeJIOuWImQWi5iTPBKwo7SfuzjjlxBSE
         CVejo0XHlNbdl6khwOvDuwcpMHKwOH3Lno/M/EZG78ajKJzgnSPBwm6iOzHFUvTlQsbl
         B041NKoaT67mOOHFM7B/aMtX31ddkgYrjbsBHytvyy2xuQM3nblSTArSTRMdPTjSO41e
         NwpA==
X-Gm-Message-State: ANhLgQ2qv775uhT9iQKX9DKSgmyK1oeNxmeDuvc1olYX7K2ok9oFdqm4
        WDd0ngFK4seSp7wyly0BDM1Hd0vjl9ZqPziTgE6z/A==
X-Google-Smtp-Source: ADFU+vtVV7q9ZYiy6kEgLdGa9dyonp/PW3+YJJ6BjgV5hz2wcA9qnvJRTZc95LMEKfsLb77OdSU/upzGXQR7MTtqRJ4=
X-Received: by 2002:a17:902:22e:: with SMTP id 43mr26258620plc.119.1585069311796;
 Tue, 24 Mar 2020 10:01:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200324084821.29944-1-masahiroy@kernel.org> <20200324084821.29944-12-masahiroy@kernel.org>
In-Reply-To: <20200324084821.29944-12-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 24 Mar 2020 10:01:40 -0700
Message-ID: <CAKwvOdkj3dDNcbY4hwyManfviPdFoBooJJmFOAKL2YJCZNuhtA@mail.gmail.com>
Subject: Re: [PATCH 11/16] x86: probe assembler capabilities via kconfig
 instead of makefile
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" 
        <linux-crypto@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        "H . Peter Anvin" <hpa@zytor.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Can 11 just be rebased with 8 dropped?

On Tue, Mar 24, 2020 at 1:49 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> From: "Jason A. Donenfeld" <Jason@zx2c4.com>
>
> Doing this probing inside of the Makefiles means we have a maze of
> ifdefs inside the source code and child Makefiles that need to make
> proper decisions on this too. Instead, we do it at Kconfig time, like
> many other compiler and assembler options, which allows us to set up the
> dependencies normally for full compilation units. In the process, the
> ADX test changes to use %eax instead of %r10 so that it's valid in both
> 32-bit and 64-bit mode.
>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/x86/Kconfig           |  2 ++
>  arch/x86/Kconfig.assembler | 22 ++++++++++++++++++++++
>  arch/x86/Makefile          | 15 ---------------
>  3 files changed, 24 insertions(+), 15 deletions(-)
>  create mode 100644 arch/x86/Kconfig.assembler
>
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index beea77046f9b..707673227837 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -2935,3 +2935,5 @@ config HAVE_ATOMIC_IOMAP
>  source "drivers/firmware/Kconfig"
>
>  source "arch/x86/kvm/Kconfig"
> +
> +source "arch/x86/Kconfig.assembler"
> diff --git a/arch/x86/Kconfig.assembler b/arch/x86/Kconfig.assembler
> new file mode 100644
> index 000000000000..46868ec7b723
> --- /dev/null
> +++ b/arch/x86/Kconfig.assembler
> @@ -0,0 +1,22 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# Copyright (C) 2020 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
> +
> +# binutils >= 2.22
> +config AS_AVX2
> +       def_bool $(as-instr,vpbroadcastb %xmm0$(comma)%ymm1)
> +
> +# binutils >= 2.25
> +config AS_AVX512
> +       def_bool $(as-instr,vpmovm2b %k1$(comma)%zmm5)
> +
> +# binutils >= 2.24
> +config AS_SHA1_NI
> +       def_bool $(as-instr,sha1msg1 %xmm0$(comma)%xmm1)
> +
> +# binutils >= 2.24
> +config AS_SHA256_NI
> +       def_bool $(as-instr,sha256msg1 %xmm0$(comma)%xmm1)
> +
> +# binutils >= 2.23
> +config AS_ADX
> +       def_bool $(as-instr,adox %eax$(comma)%eax)
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index 4c57cb3018fb..b65ec63c7db7 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -177,21 +177,6 @@ ifeq ($(ACCUMULATE_OUTGOING_ARGS), 1)
>         KBUILD_CFLAGS += $(call cc-option,-maccumulate-outgoing-args,)
>  endif
>
> -# does binutils support specific instructions?
> -# binutils >= 2.22
> -avx2_instr :=$(call as-instr,vpbroadcastb %xmm0$(comma)%ymm1,-DCONFIG_AS_AVX2=1)
> -# binutils >= 2.25
> -avx512_instr :=$(call as-instr,vpmovm2b %k1$(comma)%zmm5,-DCONFIG_AS_AVX512=1)
> -# binutils >= 2.24
> -sha1_ni_instr :=$(call as-instr,sha1msg1 %xmm0$(comma)%xmm1,-DCONFIG_AS_SHA1_NI=1)
> -# binutils >= 2.24
> -sha256_ni_instr :=$(call as-instr,sha256msg1 %xmm0$(comma)%xmm1,-DCONFIG_AS_SHA256_NI=1)
> -# binutils >= 2.23
> -adx_instr := $(call as-instr,adox %r10$(comma)%r10,-DCONFIG_AS_ADX=1)
> -
> -KBUILD_AFLAGS += $(avx2_instr) $(avx512_instr) $(sha1_ni_instr) $(sha256_ni_instr) $(adx_instr)
> -KBUILD_CFLAGS += $(avx2_instr) $(avx512_instr) $(sha1_ni_instr) $(sha256_ni_instr) $(adx_instr)
> -
>  KBUILD_LDFLAGS := -m elf_$(UTS_MACHINE)
>
>  #
> --
> 2.17.1
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200324084821.29944-12-masahiroy%40kernel.org.



-- 
Thanks,
~Nick Desaulniers
