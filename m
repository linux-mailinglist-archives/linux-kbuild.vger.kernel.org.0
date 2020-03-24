Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A4C81916AC
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2020 17:43:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727647AbgCXQli (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Mar 2020 12:41:38 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:35171 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgCXQlh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Mar 2020 12:41:37 -0400
Received: by mail-pj1-f65.google.com with SMTP id g9so1706678pjp.0
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Mar 2020 09:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=979Mtap+CCQ7tKvldIjbiCeKqDiW28MMMAoe002pSds=;
        b=j98GJB7If0ApdU2aWtGequ2FE/n663QGTdo6OwpAj5gOsC68crPpU1zhyLu1cxDx+3
         Sc6xBVPOE9RSYBXgYJsG+eEEaFK2WV+Nx3CFxx0/x8kiT01nL6yKQoFGPZkoY44YTGfL
         VO21t32jmQN5fZMccfNwR8LQq63XaXlJCWoOF6/T635Yx3ORCPPLWErQ8Y9w2UY6fPfX
         6E84Ukc5ZNtjooyNnH/bboHJKr6wJU9J8D2rLmfQ7wFUQ2aOTMjY5psjHQ/lalul6np6
         ZsUd/FjPbkTuYiur6nMqcACieOJyxtWiH3PjWWDtLBZ9zFw4TN8xvo7mr57297aFteJr
         Dn5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=979Mtap+CCQ7tKvldIjbiCeKqDiW28MMMAoe002pSds=;
        b=rl6rxInrZUpkDmLIDfoVWgc/g4l5nD7IaJUrOVaP/Dmhha3LjB+y8WczBhCCTgr/CA
         O6xKseTddqtn/GCncckOwy/Hre3lwaWK8N9L/WMFcTp5hLGqgwoN+tGtrDy9Iby820LY
         y7189eWNdoA3EB6syZmj8QxZWW4FHWIfkHlTCkG3FhZxUfF17Ifb9RfWFFlMaFmEBXSH
         k/WBaubPLdMygX9hFb9BNPfrnQL9iHq2ZsQxVrvD13c60+QXHs2xBDCCYJQCCQisIOL/
         0QHxEc2T6iY3I3qOnF8ddjoHqxacsa//Q4gfsyCgb3+XBpeOICUEONYKvsgXaPl/EGdO
         TvcQ==
X-Gm-Message-State: ANhLgQ1H+WZ959qZ/dOPIp6ioKtHr6avcbVOTKm8QlkioAw6ScQPQ1wT
        CI1Hs3WYfGAv6wPMps5NG/2bIG0vZJchBCTMEd7GgQ==
X-Google-Smtp-Source: ADFU+vtqzM/h7+lFa90Wwln9N4BChx0mxDxEdoP4W7HcWwFcKGNGzxlnxh4n480Q5YY7oLXaZIzH0bnX0EyLxWF8PZg=
X-Received: by 2002:a17:90b:230d:: with SMTP id mt13mr6422700pjb.164.1585068096041;
 Tue, 24 Mar 2020 09:41:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200324084821.29944-1-masahiroy@kernel.org> <20200324084821.29944-5-masahiroy@kernel.org>
In-Reply-To: <20200324084821.29944-5-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 24 Mar 2020 09:41:24 -0700
Message-ID: <CAKwvOd=3tm+OQhuyM9SzC1Mo6QWphLWipd-=VBRYzEmMC6Bg=A@mail.gmail.com>
Subject: Re: [PATCH 04/16] x86: remove unneeded (CONFIG_AS_)CFI_SIGNAL_FRAME
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
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 24, 2020 at 1:49 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Commit 131484c8da97 ("x86/debug: Remove perpetually broken,
> unmaintainable dwarf annotations") removes all the users of
> CFI_SIGNAL_FRAME.
>
> Remove the CFI_SIGNAL_FRAME and CONFIG_AS_CFI_SIGNAL_FRAME.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Acked-by: Jason A. Donenfeld <Jason@zx2c4.com>

Please remember to clean up the reference to
CONFIG_AS_CFI_SIGNAL_FRAME in arch/arc/kernel/unwind.c.  It was not
defined by any Makefile scoped to arch/arc, so the the ifndef guards
can go, but the code they guard should stay.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  arch/x86/Makefile             | 6 ++----
>  arch/x86/include/asm/dwarf2.h | 6 ------
>  2 files changed, 2 insertions(+), 10 deletions(-)
>
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index 72f8f744ebd7..dd275008fc59 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -177,8 +177,6 @@ ifeq ($(ACCUMULATE_OUTGOING_ARGS), 1)
>         KBUILD_CFLAGS += $(call cc-option,-maccumulate-outgoing-args,)
>  endif
>
> -# is .cfi_signal_frame supported too?
> -cfi-sigframe := $(call as-instr,.cfi_startproc\n.cfi_signal_frame\n.cfi_endproc,-DCONFIG_AS_CFI_SIGNAL_FRAME=1)
>  cfi-sections := $(call as-instr,.cfi_sections .debug_frame,-DCONFIG_AS_CFI_SECTIONS=1)
>
>  # does binutils support specific instructions?
> @@ -190,8 +188,8 @@ sha1_ni_instr :=$(call as-instr,sha1msg1 %xmm0$(comma)%xmm1,-DCONFIG_AS_SHA1_NI=
>  sha256_ni_instr :=$(call as-instr,sha256msg1 %xmm0$(comma)%xmm1,-DCONFIG_AS_SHA256_NI=1)
>  adx_instr := $(call as-instr,adox %r10$(comma)%r10,-DCONFIG_AS_ADX=1)
>
> -KBUILD_AFLAGS += $(cfi-sigframe) $(cfi-sections) $(asinstr) $(avx_instr) $(avx2_instr) $(avx512_instr) $(sha1_ni_instr) $(sha256_ni_instr) $(adx_instr)
> -KBUILD_CFLAGS += $(cfi-sigframe) $(cfi-sections) $(asinstr) $(avx_instr) $(avx2_instr) $(avx512_instr) $(sha1_ni_instr) $(sha256_ni_instr) $(adx_instr)
> +KBUILD_AFLAGS += $(cfi-sections) $(asinstr) $(avx_instr) $(avx2_instr) $(avx512_instr) $(sha1_ni_instr) $(sha256_ni_instr) $(adx_instr)
> +KBUILD_CFLAGS += $(cfi-sections) $(asinstr) $(avx_instr) $(avx2_instr) $(avx512_instr) $(sha1_ni_instr) $(sha256_ni_instr) $(adx_instr)
>
>  KBUILD_LDFLAGS := -m elf_$(UTS_MACHINE)
>
> diff --git a/arch/x86/include/asm/dwarf2.h b/arch/x86/include/asm/dwarf2.h
> index 90807583cad7..f440790f09f9 100644
> --- a/arch/x86/include/asm/dwarf2.h
> +++ b/arch/x86/include/asm/dwarf2.h
> @@ -21,12 +21,6 @@
>  #define CFI_UNDEFINED          .cfi_undefined
>  #define CFI_ESCAPE             .cfi_escape
>
> -#ifdef CONFIG_AS_CFI_SIGNAL_FRAME
> -#define CFI_SIGNAL_FRAME       .cfi_signal_frame
> -#else
> -#define CFI_SIGNAL_FRAME
> -#endif
> -
>  #if defined(CONFIG_AS_CFI_SECTIONS)
>  #ifndef BUILD_VDSO
>         /*
> --
> 2.17.1
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200324084821.29944-5-masahiroy%40kernel.org.



-- 
Thanks,
~Nick Desaulniers
