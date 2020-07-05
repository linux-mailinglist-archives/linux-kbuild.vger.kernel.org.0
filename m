Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8992149A9
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Jul 2020 04:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728105AbgGECnW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 4 Jul 2020 22:43:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728004AbgGECnW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Jul 2020 22:43:22 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F028BC061794;
        Sat,  4 Jul 2020 19:43:21 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id j19so9941364pgm.11;
        Sat, 04 Jul 2020 19:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sKCO9/1M60oSMeKwbDwHzeuGQ1Mf9xZp+DMEQlF5lwQ=;
        b=MSrIH0a4J9XsiPgo+Fn1qp6egiFzl8eI/X83hrzOYNJk41o4bjYaGsi2PlFLTP/uxc
         hNiHYLshRPDVOBX0o/hjiegjuCkc1b6beTEShwKedXNQnerGtVNbs2WnJocQnbSo3ycS
         dPT6vUCKCP+u5o87Ym0rXwOELygNOKaCMgKH04EG3APzFUCQ7p59E2glSKsf+gs8tUAX
         c54pVFZcQ2L71zmglOZ8dl0RAkFAONiMHtl5p1m5rKx0caS7M//xor/1vILfHjzimiTg
         JZ9XVJVMVac4Oufa6Mg9ASVdrVaiSqsJDliuSvWJJogHI/2DZ3pREffWXOPzfQ3QWomM
         dKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sKCO9/1M60oSMeKwbDwHzeuGQ1Mf9xZp+DMEQlF5lwQ=;
        b=L9DUNA8ElZ6rV6206eXbhjYdjfMJgFbICZgTwUssGV3ed6NkHXwDYXfZGrQHSqt5OQ
         n1PCLqvMXWOB9kmVaz+dbJLuvFp+kiU+9Gkj46gyghk7VsXTaXMP+hp8Ls+w0Yjy8xG8
         YbZe/aUDJIwPKlsWGnaz9FH8tbBWQwRStjJJJk5L1ikz5bCRE34O11HcQ5I8Ifi6nCay
         IGS3Td66gx8SD92Ar8lztsKJ3IUsw0vODcOu/rjd6go4C06EOxFwYzCeo17xtnBjqozO
         5K5GvIgpghM27Y5oMiOXslY2a1Xs4wj6oRedc7JvfkkkfYQkFWIUXDKBTjmxfZl/Piw9
         2DXg==
X-Gm-Message-State: AOAM533RkKQjFZSetxsk3yNkREXsrPgqJECzYOzhq4FEdG5eAo/b/PXo
        fqc8PGvPOEfSZngTPFGpAqc=
X-Google-Smtp-Source: ABdhPJxYeCqP9g8tCTW9IiPPU0zAVCRvQeqPcpWbvW4ag+B8GJLLkxmBOhGt628/FsgVEeEjTcdDKg==
X-Received: by 2002:a63:5a20:: with SMTP id o32mr26437223pgb.15.1593917001330;
        Sat, 04 Jul 2020 19:43:21 -0700 (PDT)
Received: from Ryzen-9-3900X.localdomain ([104.200.135.125])
        by smtp.gmail.com with ESMTPSA id d65sm7525552pfc.97.2020.07.04.19.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2020 19:43:20 -0700 (PDT)
Date:   Sat, 4 Jul 2020 19:43:18 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Danny Lin <danny@kdrag0n.dev>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Kees Cook <keescook@chromium.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH] kbuild: Allow Clang global merging if !MODULES
Message-ID: <20200705024318.GA433@Ryzen-9-3900X.localdomain>
References: <20200702233929.181409-1-danny@kdrag0n.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200702233929.181409-1-danny@kdrag0n.dev>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Danny,

On Thu, Jul 02, 2020 at 04:39:29PM -0700, Danny Lin wrote:
> The old reasoning for disabling Clang's global merging optimization is
> that it breaks modpost by coalescing many symbols into _MergedGlobals.
> However, modpost is only used in builds with dynamic modules;
> vmlinux.symvers is still created during standalone builds, but it's
> effectively just an empty dummy file.
> 
> Enabling the optimization whenever possible allows us to reap the
> benefits of reduced register pressure when many global variables are
> used in the same function.

Have you run into any place within the kernel that this is the case or
this more of a "could help if this ever happens" type of deal?

> An x86 defconfig kernel built with this optimization boots fine in qemu,
> and a downstream 4.14 kernel has been used on arm64 for nearly a year
> without any issues caused by this optimization.

If I am reading LLVM's source correctly, this option only seems relevant
for ARM and AArch64?

$ rg --no-heading createGlobalMergePass
llvm/lib/CodeGen/GlobalMerge.cpp:679:Pass *llvm::createGlobalMergePass(const TargetMachine *TM, unsigned Offset,
llvm/lib/Target/AArch64/AArch64TargetMachine.cpp:524:    addPass(createGlobalMergePass(TM, 4095, OnlyOptimizeForSize,
llvm/lib/Target/ARM/ARMTargetMachine.cpp:456:    addPass(createGlobalMergePass(TM, 127, OnlyOptimizeForSize,
llvm/include/llvm/CodeGen/Passes.h:419:  Pass *createGlobalMergePass(const TargetMachine *TM, unsigned MaximalOffset,

Otherwise, I think this is probably okay. According to [1], when the
optimization level is less than -O3, we get a less aggressive version of
this optimization level, which is good for code size:

https://github.com/llvm/llvm-project/commit/8207641251706ea808df6d2a1ea8f87b8ee04c6d

However, we do potentially get merging of extern globals if we do not
specify -mglobal-merge (if I am reading the source correctly), which
this commit claims might hurt performance? Not sure if there is any way
to test or verify that?

https://github.com/llvm/llvm-project/commit/de73404b8c4332190750537eb93ce0d5b6451300

> Signed-off-by: Danny Lin <danny@kdrag0n.dev>
> ---
>  Makefile | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index a60c98519c37..f04c3639cf61 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -772,10 +772,13 @@ ifdef CONFIG_CC_IS_CLANG
>  KBUILD_CPPFLAGS += -Qunused-arguments
>  KBUILD_CFLAGS += -Wno-format-invalid-specifier
>  KBUILD_CFLAGS += -Wno-gnu
> +
> +ifdef CONFIG_MODULES
>  # CLANG uses a _MergedGlobals as optimization, but this breaks modpost, as the
>  # source of a reference will be _MergedGlobals and not on of the whitelisted names.
>  # See modpost pattern 2
>  KBUILD_CFLAGS += -mno-global-merge
> +endif
>  else
>  
>  # These warnings generated too much noise in a regular build.
> -- 
> 2.27.0
> 

Cheers,
Nathan
