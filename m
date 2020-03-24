Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59B5D1916B3
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2020 17:43:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbgCXQnj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Mar 2020 12:43:39 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37486 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727376AbgCXQnj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Mar 2020 12:43:39 -0400
Received: by mail-pf1-f193.google.com with SMTP id h72so7351961pfe.4
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Mar 2020 09:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0ckbAFa8zCaMccZFo+Gs27f6PIvd3NdOwxh/HtsnAf4=;
        b=PdrJdf/5ys6G3EkHhtXeLqfbI+F9R/JtXgfxhdtfi7xtfWtwBLpicCmJD0uQPiayuy
         KILQctVB/KRsDuF/iAO4i2lDkvrLBE361kCvNgGZzuoGNOwlS3Hos+htfICMB8QgcuM0
         8Zf6o6oIEWs+jLE656I8sssd65dAtKsBVPGpL5EZQtxQ7wncHCIzUUHcZZ76h20mAVy7
         Ybwt4nRtTUceiL5jelbX+fketk0uQvSKIWbV8D6CBucW9drzAfu9FgDMMUxIK+AV/clX
         6ABIVm85WrKDWOdv5G8YreS7FpcX0IDYwIAGpPYgH/Ii+2xwB5d2LHV1KX3APugdazIt
         f3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0ckbAFa8zCaMccZFo+Gs27f6PIvd3NdOwxh/HtsnAf4=;
        b=t2pXUu6O7gCyJnudS7QIgG9qoimaWvYaWfHZD1/IxQfDDcJAh+XasNDJ3+Dj9s4NiY
         XsfOcpcNcc5bhha7jThKOdP+SiBlnL8I/uTNNtlBkx6VUbE+hPD6+pMgxkK7As5RB/CA
         sxIxuMi4SmtFVi9iOhx/d5pZ0VJtjhbNpP6qFZWSupn/FQBO2ID+GNE/waNsIFUx+WKh
         9tUrKGSHrebn9vBw6q3shNo72Z9imCWL5czebIZvYJYB5JtM3QGUkoJOoSFz570G33RP
         KNRk7Xaq+8Lm3Z+0beRuqgLgunhVdKoXzU5TnGUdscHiwx8vSwWaBZ/ONI7ssR8kOJRH
         3m8Q==
X-Gm-Message-State: ANhLgQ3vHcrmbjxhdHwY4YY4b1BJEmm6qwMQrIsLcc28HSsl6QrQYqvx
        ORqHp+1uUzkT3vmTcV11pLM/HNCDHZOedRcbOcRURg==
X-Google-Smtp-Source: ADFU+vsYLJpgvdYUU6R2yZeo2upmrFukYJCYvpMGWGdaxSJf6OvZ3OIxFLbqDmEhy/067UwZ716Po3aVR6VwoqLuFIA=
X-Received: by 2002:a63:a34d:: with SMTP id v13mr7028614pgn.10.1585068217691;
 Tue, 24 Mar 2020 09:43:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200324084821.29944-1-masahiroy@kernel.org> <20200324084821.29944-3-masahiroy@kernel.org>
In-Reply-To: <20200324084821.29944-3-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 24 Mar 2020 09:43:26 -0700
Message-ID: <CAKwvOdk6aUuAH_o+P8b+WneQ96yhTPGAXqgzH+FJ5DHB9AqYYA@mail.gmail.com>
Subject: Re: [PATCH 02/16] x86: remove unneeded defined(__ASSEMBLY__) check
 from asm/dwarf2.h
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
> This header file has the following check at the top:
>
>   #ifndef __ASSEMBLY__
>   #warning "asm/dwarf2.h should be only included in pure assembly files"
>   #endif
>
> So, we expect defined(__ASSEMBLY__) is always true.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Acked-by: Jason A. Donenfeld <Jason@zx2c4.com>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  arch/x86/include/asm/dwarf2.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/x86/include/asm/dwarf2.h b/arch/x86/include/asm/dwarf2.h
> index ae391f609840..5a0502212bc5 100644
> --- a/arch/x86/include/asm/dwarf2.h
> +++ b/arch/x86/include/asm/dwarf2.h
> @@ -36,7 +36,7 @@
>  #define CFI_SIGNAL_FRAME
>  #endif
>
> -#if defined(CONFIG_AS_CFI_SECTIONS) && defined(__ASSEMBLY__)
> +#if defined(CONFIG_AS_CFI_SECTIONS)
>  #ifndef BUILD_VDSO
>         /*
>          * Emit CFI data in .debug_frame sections, not .eh_frame sections.
> --
> 2.17.1
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200324084821.29944-3-masahiroy%40kernel.org.



-- 
Thanks,
~Nick Desaulniers
