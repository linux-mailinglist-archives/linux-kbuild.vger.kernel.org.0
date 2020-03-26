Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3A641945D3
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2020 18:50:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728214AbgCZRuo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Mar 2020 13:50:44 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36549 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbgCZRuo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 13:50:44 -0400
Received: by mail-pg1-f195.google.com with SMTP id j29so3254207pgl.3
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2020 10:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cVhUI8kuQt6IgMPqeY7HijNVaAh3KiroMym2JdHvBYQ=;
        b=brsAwQH29iSE8mshBIMEsiJaEJF+MtC9co7LTYM1s5iPoWfOYvOIqiYqjH3sBuZOf3
         aqds8K3ipNIbPBdAadLcYagS/lTtdbVlhTUmrIBZ9mbDJeONgOv1vCWhB5tI+4Aw+/Pi
         ot1xySrBGpzLiofvPdq7upFm4UOmM7bPls6Q3hPSIKH1C7D/h3F1h6uyB+NwBPWo3ylv
         vmazfw07csCTogMxGj5mLULnk1IQzywQQIDkM7rGQQmKlBoXRkuQ1KmGjjn/jc8Bew1c
         HJpG6xjrI35S1PYv8QsHru2S9u8+pEsACI1sA0tWL8Bv8i1MpKyJywC0yUpmTwWtFADV
         QLYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cVhUI8kuQt6IgMPqeY7HijNVaAh3KiroMym2JdHvBYQ=;
        b=rk8YnW9pUd431dnqt0LAoTPCX0bx4H29ZKbkYqbhDeZn6tKFs3/zYrlSqWYshX1ywB
         H2hD6aPGnoy+Nfhyi76YMBUlRKQf+McoOXTh4NL9PXxr5t1bdCvpNEhGdsnQ6QpvKYEs
         02U+TEcLlsXslnTp8Qg7wHP23VrOfJYgj5RHf9ePGGxavbighUhOcjC4CZDtXmann3qs
         BxJJKeNuUUymoKNtQ88Z/UmwQJS6gO4LMNTtfY6+DM0frqXoW7evK+gk8CbcuK5FmZ49
         eUujfC2YjRTSIJS3CtyB+auNFY/XXQsd8SSIqgGMaUyCJwZNBzk/7q6dp6mpQbEIrlU8
         qRzw==
X-Gm-Message-State: ANhLgQ0qf2ySMdx4exJu78q70T/gt2/ihbPHP+emrcnoXHaWaD0lEQ7D
        viRDpKzZDah2XUz6cqHSQL9HqbVtTNCBctehG0iHQg==
X-Google-Smtp-Source: ADFU+vv6mvUpG3SoGM36A9hiSxDUzQIQRzXI7YPfyK/2v9UhaSb0YZ1BviJKZdV84glpZdJUYol+/IfpWD7nc7hqWTs=
X-Received: by 2002:a63:4e22:: with SMTP id c34mr9894991pgb.263.1585245029988;
 Thu, 26 Mar 2020 10:50:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200326080104.27286-1-masahiroy@kernel.org> <20200326080104.27286-12-masahiroy@kernel.org>
In-Reply-To: <20200326080104.27286-12-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 26 Mar 2020 10:50:17 -0700
Message-ID: <CAKwvOd=3APTxrLD7U+hhMYoQm_ZTktckk-jurpwundm=w-pqKw@mail.gmail.com>
Subject: Re: [PATCH v2 11/16] x86: add comments about the binutils version to
 support code in as-instr
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        "H . Peter Anvin" <hpa@zytor.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        "Jason A . Donenfeld" <Jason@zx2c4.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Ingo Molnar <mingo@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 26, 2020 at 1:02 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> We raise the minimal supported binutils version from time to time.
> The last bump was commit 1fb12b35e5ff ("kbuild: Raise the minimum
> required binutils version to 2.21").
>
> We need to keep these as-instr checks because binutils 2.21 does not
> support them.
>
> I hope this will be a good hint which one can be dropped when we
> bump the minimal binutils version next time.
>
> As for the Clang/LLVM builds, we require very new LLVM version,
> so the LLVM integrated assembler supports all of them.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Acked-by: Jason A. Donenfeld <Jason@zx2c4.com>

Acked-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
> Changes in v2:
>   - Change the patch order and rebase
>
>  arch/x86/Kconfig.assembler | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/x86/Kconfig.assembler b/arch/x86/Kconfig.assembler
> index 91230bf11a14..a5a1d2766b3a 100644
> --- a/arch/x86/Kconfig.assembler
> +++ b/arch/x86/Kconfig.assembler
> @@ -3,15 +3,25 @@
>
>  config AS_AVX2
>         def_bool $(as-instr,vpbroadcastb %xmm0$(comma)%ymm1)
> +       help
> +         Supported by binutils >= 2.22 and LLVM integrated assembler
>
>  config AS_AVX512
>         def_bool $(as-instr,vpmovm2b %k1$(comma)%zmm5)
> +       help
> +         Supported by binutils >= 2.25 and LLVM integrated assembler
>
>  config AS_SHA1_NI
>         def_bool $(as-instr,sha1msg1 %xmm0$(comma)%xmm1)
> +       help
> +         Supported by binutils >= 2.24 and LLVM integrated assembler
>
>  config AS_SHA256_NI
>         def_bool $(as-instr,sha256msg1 %xmm0$(comma)%xmm1)
> +       help
> +         Supported by binutils >= 2.24 and LLVM integrated assembler
>
>  config AS_ADX
>         def_bool $(as-instr,adox %eax$(comma)%eax)
> +       help
> +         Supported by binutils >= 2.23 and LLVM integrated assembler
> --
> 2.17.1
>


-- 
Thanks,
~Nick Desaulniers
