Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EE833E1B24
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Aug 2021 20:22:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241160AbhHESWj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 5 Aug 2021 14:22:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241147AbhHESWi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Aug 2021 14:22:38 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 689C4C0613D5
        for <linux-kbuild@vger.kernel.org>; Thu,  5 Aug 2021 11:22:23 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id m18so8329422ljo.1
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Aug 2021 11:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LNpT8+EvILfJwMhJDbf0NVaUrZW6zw0xKERByrH5p/E=;
        b=Y2oK9TpDhBO7ojoFD7/ZGm1Vo4Q4+SveD8msknb3vaTKUGGyIi7lO02RrvoHgt+oFU
         eLoj0GPIulWoDqtcS/1D6J/RO07/jT5HY76dgvqoYHM7yxInkwOqPjJl/c+Evze2+mgN
         Yg/mZLJ9Tj1NX1d4prbdV1Yyb2fC0mJ4qyn6BsHr2GPVNJLmRIaH0ufv2gF/s21HQfF0
         x8DNVd0msrA6o/siIIKWBuWCUvrk8G32z6H6laIAVGXZLbI60vhZlhaVzK3C1Fuy4haa
         Vy0D0PaQ5ZcXJrhKOmbCJMW6vCV5E8I3Pog57qHQwxW8sQGHtqlbQiqVHwuRpOA3O5WN
         3lWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LNpT8+EvILfJwMhJDbf0NVaUrZW6zw0xKERByrH5p/E=;
        b=bO/2C1IB2ZKHexH7nN7Hz0OYPVyb3kSxoXjdPQFFsmd9MDMurBDFV7ssdumeJd5nwC
         hxovsS/Jv/VRK3kAW6i7j+ulQ0oMDRWTz7qoUM5JV2lw8/YAoRoO5C93bS40pw43bagy
         ic7Vba2AsFaAcm7ZQ01tLRP1x5Iirma1sk8GaDRkdH9orMSUnjWlf7bx9mzKJJFwnU/b
         saL5imsyk0CUTkqPRgMyqHIJieeAZJ0ySp0ZvSJJZvWq3Wqh1AJM1tHvtoYJjOI3BM0h
         936WA1j1JlC9t3j8D3XKgWblxxJamiAh22TeCSuEVXEveNKwRHaBCpcupCvSx7WdV0w3
         /16w==
X-Gm-Message-State: AOAM5315zHaaqLb9hdEftPUOPzCNDBPnRbZsDiIOsqIukAhyynJV1MQs
        9vwe8Ofq6RSb4fbMWR7XWfj/EcASrnlzWxQJUSFKhQ==
X-Google-Smtp-Source: ABdhPJzG4CnCEu4/HQYiDExo1dwwbMB/7DskuDEQchiSBg4779eMZg08PYrCHI1U+FwCgq4FcQXBPxK8q6kT+eH7xOo=
X-Received: by 2002:a2e:a911:: with SMTP id j17mr3939091ljq.341.1628187741325;
 Thu, 05 Aug 2021 11:22:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210805150102.131008-1-masahiroy@kernel.org>
In-Reply-To: <20210805150102.131008-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 5 Aug 2021 11:22:10 -0700
Message-ID: <CAKwvOdkoMnqoz_if9_W9x-WEq3Eu85t6P8sDSUXThypMeT6wiQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: check CONFIG_AS_IS_LLVM instead of LLVM_IAS
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 5, 2021 at 8:01 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> LLVM_IAS is the user interface to set the -(no-)integrated-as flag,
> and it should be used only for that purpose.
>
> LLVM_IAS is checked in some places to determine the assembler type,
> but it is not precise.
>
>  $ make CC=gcc LLVM_IAS=1
>
> ... will use the GNU assembler since LLVM_IAS=1 is effective only when
> $(CC) is clang.
>
> Of course, the combination of CC=gcc and LLVM_IAS=1 does not make
> sense, but the build system can be more robust against such insane
> input.
>
> Commit ba64beb17493a ("kbuild: check the minimum assembler version in
> Kconfig") introduced CONFIG_AS_IS_GNU/LLVM, which is more precise
> because Kconfig checks the version string from the assembler in use.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
>  Makefile            | 2 +-
>  arch/riscv/Makefile | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 4ab151060931..8b56c9692c3c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -844,7 +844,7 @@ else
>  DEBUG_CFLAGS   += -g
>  endif
>
> -ifneq ($(LLVM_IAS),1)
> +ifndef CONFIG_AS_IS_LLVM
>  KBUILD_AFLAGS  += -Wa,-gdwarf-2
>  endif
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index bc74afdbf31e..dcfbd2a87d41 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -41,7 +41,7 @@ endif
>  ifeq ($(CONFIG_LD_IS_LLD),y)
>         KBUILD_CFLAGS += -mno-relax
>         KBUILD_AFLAGS += -mno-relax
> -ifneq ($(LLVM_IAS),1)
> +ifndef CONFIG_AS_IS_LLVM
>         KBUILD_CFLAGS += -Wa,-mno-relax
>         KBUILD_AFLAGS += -Wa,-mno-relax
>  endif
> --
> 2.30.2
>


-- 
Thanks,
~Nick Desaulniers
