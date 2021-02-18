Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E26D31E451
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Feb 2021 03:26:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbhBRCZZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 17 Feb 2021 21:25:25 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:51689 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbhBRCZZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Feb 2021 21:25:25 -0500
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 11I2OHjA013610;
        Thu, 18 Feb 2021 11:24:18 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 11I2OHjA013610
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613615058;
        bh=BKHKij0qeUumqHHZXO0fU069UkfL1mfkCHNe+k3IYU0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Dw2dV5rhBzzD6WpXFPeHLYv8Z91ZgUPXOExqBupBkeGxCinDW0Tbm3riy62JQlGEL
         W23F7JjM6+KSZUrHXydSBKgexnElPPUYGdu/HmMozjzOajqFFFcAhJ6Q2jE1Fgtzjn
         mjgn2s8gg2R9GSi86hkmihC5llksdIhdbDsPuJrTfSY5CnACe3S/9y+i+f/Jf2YN2+
         fC8lRtoP+woAJF3RAfIGvleNJ66PWVUfL4hEbsxzZE9YPDT+Ead8STWZhOjGIop8Ag
         pBU/1Lgs3Hepp8Zy0H6jIt7Ms0OVM5FTYQ6H7FPSkeDMMUlpauLlWxH0isbUK0P5P6
         Ox7HoWXS8c/ow==
X-Nifty-SrcIP: [209.85.214.179]
Received: by mail-pl1-f179.google.com with SMTP id b8so381790plh.12;
        Wed, 17 Feb 2021 18:24:17 -0800 (PST)
X-Gm-Message-State: AOAM532y3DiMK7m0mvLvxi9vhUjkQLqlB4I6d5wcO2iCpn7PRrjm1YEQ
        dVyMS5bfm7FszVQHDLV7dt32V4yDc76zMzy5Mu0=
X-Google-Smtp-Source: ABdhPJxeju/ABdm5v6FT+f3FSW0wOw8JQmPC8IhfelhTY76k9RWyu9Ow9MqSqCTy/C7GFgLBQIjytgINbLk7PrfRQW8=
X-Received: by 2002:a17:902:bb87:b029:e1:d1f:2736 with SMTP id
 m7-20020a170902bb87b02900e10d1f2736mr2138431pls.1.1613615057037; Wed, 17 Feb
 2021 18:24:17 -0800 (PST)
MIME-Version: 1.0
References: <20210120174146.12287-1-lazerl0rd@thezest.dev>
In-Reply-To: <20210120174146.12287-1-lazerl0rd@thezest.dev>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 18 Feb 2021 11:23:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNARgi+UEBiO_ZyTpYj7x-He-gcRQ9-MbYy8i2OkZL6dGcQ@mail.gmail.com>
Message-ID: <CAK7LNARgi+UEBiO_ZyTpYj7x-He-gcRQ9-MbYy8i2OkZL6dGcQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Add support for Clang's polyhedral loop optimizer.
To:     Diab Neiroukh <lazerl0rd@thezest.dev>
Cc:     clang-built-linux <clang-built-linux@googlegroups.com>,
        Danny Lin <danny@kdrag0n.dev>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Kees Cook <keescook@chromium.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Nick Terrell <terrelln@fb.com>,
        Quentin Perret <qperret@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 21, 2021 at 2:42 AM 'Diab Neiroukh' via Clang Built Linux
<clang-built-linux@googlegroups.com> wrote:
>
> Polly is able to optimize various loops throughout the kernel for cache
> locality. A mathematical representation of the program, based on
> polyhedra, is analysed to find opportunistic optimisations in memory
> access patterns which then leads to loop transformations.
>
> Polly is not built with LLVM by default, and requires LLVM to be compiled
> with the Polly "project". This can be done by adding Polly to
> -DLLVM_ENABLE_PROJECTS, for example:
>
> -DLLVM_ENABLE_PROJECTS="clang;libcxx;libcxxabi;polly"
>
> Preliminary benchmarking seems to show an improvement of around two
> percent across perf benchmarks:
>
> Benchmark                         | Control    | Polly
> --------------------------------------------------------
> bonnie++ -x 2 -s 4096 -r 0        | 12.610s    | 12.547s
> perf bench futex requeue          | 33.553s    | 33.094s
> perf bench futex wake             |  1.032s    |  1.021s
> perf bench futex wake-parallel    |  1.049s    |  1.025s
> perf bench futex requeue          |  1.037s    |  1.020s
>
> Furthermore, Polly does not produce a much larger image size netting it
> to be a "free" optimisation. A comparison of a bzImage for a kernel with
> and without Polly is shown below:
>
> bzImage        | stat --printf="%s\n"
> -------------------------------------
> Control        | 9333728
> Polly          | 9345792
>
> Compile times were one percent different at best, which is well within
> the range of noise. Therefore, I can say with certainty that Polly has
> a minimal effect on compile times, if none.
>
> Suggested-by: Danny Lin <danny@kdrag0n.dev>
> Signed-off-by: Diab Neiroukh <lazerl0rd@thezest.dev>



This patch was correctly sent to clang-built-linux ML,
but did not get any attention.


I did not evaluate anything about this patch, but
this patch is just adding several flags.

Please try to collect Reviewed-by, Tested-by, etc.
from Clang folks if you want this merged.


Just a minor comment:

Typos in the Makefile changes.
"beyound" -> "beyond"
"perfom" -> "perform"




> ---
>  Makefile     | 16 ++++++++++++++++
>  init/Kconfig | 13 +++++++++++++
>  2 files changed, 29 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index b9d3a47c57cf..00f15bde5f8b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -740,6 +740,22 @@ else ifdef CONFIG_CC_OPTIMIZE_FOR_SIZE
>  KBUILD_CFLAGS += -Os
>  endif
>
> +ifdef CONFIG_POLLY_CLANG
> +KBUILD_CFLAGS  += -mllvm -polly \
> +                  -mllvm -polly-ast-use-context \
> +                  -mllvm -polly-invariant-load-hoisting \
> +                  -mllvm -polly-opt-fusion=max \
> +                  -mllvm -polly-run-inliner \
> +                  -mllvm -polly-vectorizer=stripmine
> +# Polly may optimise loops with dead paths beyound what the linker
> +# can understand. This may negate the effect of the linker's DCE
> +# so we tell Polly to perfom proven DCE on the loops it optimises
> +# in order to preserve the overall effect of the linker's DCE.
> +ifdef CONFIG_LD_DEAD_CODE_DATA_ELIMINATION
> +KBUILD_CFLAGS  += -mllvm -polly-run-dce
> +endif
> +endif
> +
>  # Tell gcc to never replace conditional load with a non-conditional one
>  KBUILD_CFLAGS  += $(call cc-option,--param=allow-store-data-races=0)
>  KBUILD_CFLAGS  += $(call cc-option,-fno-allow-store-data-races)
> diff --git a/init/Kconfig b/init/Kconfig
> index 05131b3ad0f2..266d7d03ccd1 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -177,6 +177,19 @@ config BUILD_SALT
>           This is mostly useful for distributions which want to ensure the
>           build is unique between builds. It's safe to leave the default.
>
> +config POLLY_CLANG
> +       bool "Use Clang Polly optimizations"
> +       depends on CC_IS_CLANG && $(cc-option,-mllvm -polly)
> +       depends on !COMPILE_TEST
> +       help
> +         This option enables Clang's polyhedral loop optimizer known as
> +         Polly. Polly is able to optimize various loops throughout the
> +         kernel for cache locality. This requires a Clang toolchain
> +         compiled with support for Polly. More information can be found
> +         from Polly's website:
> +
> +           https://polly.llvm.org
> +
>  config HAVE_KERNEL_GZIP
>         bool
>
> --
> 2.30.0
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210120174146.12287-1-lazerl0rd%40thezest.dev.



-- 
Best Regards
Masahiro Yamada
