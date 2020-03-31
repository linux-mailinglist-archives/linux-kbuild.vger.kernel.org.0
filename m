Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC2D4198A17
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2020 04:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727703AbgCaCl4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 30 Mar 2020 22:41:56 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:55571 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727614AbgCaCl4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Mar 2020 22:41:56 -0400
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 02V2fYj9001485;
        Tue, 31 Mar 2020 11:41:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 02V2fYj9001485
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585622494;
        bh=qUuUnCsN8QlAO5iOjog4Igp1OPvQEJ88D5zsqGqYn7U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=dW6dJjZl4xezbyiRpUG9JZjRS4M2F6Ip77bTIlynUunxfFiP/emz/sxqvnBo9QiWC
         R+pSsK8b+2OHzDLbIMbUw4cJg2qc1cVlyv7qPUkC/ofNZzgAhYOh0vpP30gg658JgD
         ovqjV0us7rU+NJPkADzjG2p+T45BjAt6WOfYJneSgBNfyAXiIfaawU08T+mve4iuH+
         JvhMCrbiHWwOfNwIAf6A3XUDCllO+f0BXCmWuVgPBnkOoXtdxcsBvcwzQJACMW7aRC
         uVmNl5BdIstQAOLKBK0J20U1Z5p8+2cmM6gm4MXWDSQDBb/5zHmEO/IvK81ZIoEsyV
         xgTWFfJb4bx9g==
X-Nifty-SrcIP: [209.85.217.44]
Received: by mail-vs1-f44.google.com with SMTP id x82so12462892vsc.12;
        Mon, 30 Mar 2020 19:41:34 -0700 (PDT)
X-Gm-Message-State: AGi0Pub8z/QjZN92xRceBuUpVu099iyIJ2DKkp9ACD2o31NzNSSvs7cx
        dI3/8UFpM88yaSnIYiF4ARiyiL0i0i9H53HqqS8=
X-Google-Smtp-Source: APiQypIsfngKW6W3/e3RrGqIhGPUv4K9UPA+khlcl/3rMUyBDK4h1+L0IalpWWgd/sy++0ILPCJrgJn0ughJVH6Xwwo=
X-Received: by 2002:a67:6542:: with SMTP id z63mr11156512vsb.179.1585622493397;
 Mon, 30 Mar 2020 19:41:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200326080104.27286-1-masahiroy@kernel.org> <20200326080104.27286-9-masahiroy@kernel.org>
In-Reply-To: <20200326080104.27286-9-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 31 Mar 2020 11:40:57 +0900
X-Gmail-Original-Message-ID: <CAK7LNARueG4wM-_z+xDjwHci=wwAad8CqP1UF5mFJpPf8Zg71Q@mail.gmail.com>
Message-ID: <CAK7LNARueG4wM-_z+xDjwHci=wwAad8CqP1UF5mFJpPf8Zg71Q@mail.gmail.com>
Subject: Re: [PATCH v2 08/16] x86: replace arch macros from compiler with CONFIG_X86_{32,64}
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        "H . Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>,
        "Jason A . Donenfeld" <Jason@zx2c4.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 26, 2020 at 5:03 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> If the intention is to check i386/x86_64 excluding UML, testing
> CONFIG_X86_{32,64} is simpler.
>
> The reason for checking __i386__ / __x86_64__ was perhaps because
> lib/raid6/algos.c is built not only for the kernel but also for
> testing the library code from userspace.
>
> However, lib/raid6/test/Makefile passes -DCONFIG_X86_{32,64} for
> this case. So, I do not see a reason to not use CONFIG option here.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Acked-by: H. Peter Anvin (Intel) <hpa@zytor.com>
> ---


Sorry, this patch broke UML builds.

https://lkml.org/lkml/2020/3/27/618



I will drop this patch for tomorrow's linux-next.



CONFIG_X86 is not defined for ARCH=um.
So, I still think it is OK to replace one complicated line
in lib/raid6/x86.h

   #if (defined(__i386__) || defined(__x86_64__)) && !defined(__arch_um__)

with:

   #ifdef CONFIG_X86




Also, I slightly prefer

   #if defined(CONFIG_X86_32) && !defined(CONFIG_UML)

to

   #if defined(__i386__) && !defined(__arch_um__)



But, we do not need to rush this now.


This patch does not affect the rest of this series.

Thanks.





> Changes in v2: None
>
>  kernel/signal.c   | 2 +-
>  lib/raid6/algos.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/kernel/signal.c b/kernel/signal.c
> index 5b2396350dd1..db557e1629e5 100644
> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -1246,7 +1246,7 @@ static void print_fatal_signal(int signr)
>         struct pt_regs *regs = signal_pt_regs();
>         pr_info("potentially unexpected fatal signal %d.\n", signr);
>
> -#if defined(__i386__) && !defined(__arch_um__)
> +#ifdef CONFIG_X86_32
>         pr_info("code at %08lx: ", regs->ip);
>         {
>                 int i;
> diff --git a/lib/raid6/algos.c b/lib/raid6/algos.c
> index df08664d3432..b5a02326cfb7 100644
> --- a/lib/raid6/algos.c
> +++ b/lib/raid6/algos.c
> @@ -29,7 +29,7 @@ struct raid6_calls raid6_call;
>  EXPORT_SYMBOL_GPL(raid6_call);
>
>  const struct raid6_calls * const raid6_algos[] = {
> -#if defined(__i386__) && !defined(__arch_um__)
> +#ifdef CONFIG_X86_32
>  #ifdef CONFIG_AS_AVX512
>         &raid6_avx512x2,
>         &raid6_avx512x1,
> @@ -45,7 +45,7 @@ const struct raid6_calls * const raid6_algos[] = {
>         &raid6_mmxx2,
>         &raid6_mmxx1,
>  #endif
> -#if defined(__x86_64__) && !defined(__arch_um__)
> +#ifdef CONFIG_X86_64
>  #ifdef CONFIG_AS_AVX512
>         &raid6_avx512x4,
>         &raid6_avx512x2,
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
