Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 934AC3EDEC1
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Aug 2021 22:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232882AbhHPUte (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 16:49:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232812AbhHPUtd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 16:49:33 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 982A5C0613C1
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 13:48:58 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id w20so37021454lfu.7
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 13:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RkFK9buKoxTffeATRlVHoBzA8iEtr+XNkO5dgCSB86k=;
        b=m3xilTAzBzihkA8v50VsWQG5DE3gEYSRMpfHNON4yVg8CpvTvPXX2TwqQPp8C6Q/Lo
         Hzhp9tkqPXRB4YPHyQtREdBUlEGyzpmKyVQ8521U1Rb25UqcULU9r3XUi73qHFJmexa9
         kCdtmLcLhrDUEDy3og/wnXBNl5IJUkdfWRwgEGpEHDTLVft5X00zemrmoi2cRbCzVd/U
         UPTUzL0m0748lk3DbQN8bwzPRoT2v9e8ldYxOXnaEX2xYNJY6UXLwSJvUW7E//x6RerG
         5RHmcNXtjfxRMwtHarVuBSXG7U6+ORge9VLnV9nIToAd3ew5hUJm40M1XieDGOqnylyp
         C6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RkFK9buKoxTffeATRlVHoBzA8iEtr+XNkO5dgCSB86k=;
        b=jwGD/9KBvs/lLIxxZ04KQ3/u6hUD+ki0EMJOsT5+pXOb4on1OmPK640Hj5B9DUijdJ
         tfhlydTjqhhbM7NBHGu8eKtqBMbODZZjc5YC0mH0YrDajSGAc0vHPpu+NmP49dw6q7Ka
         xeFYhrRLlegEWOuUiD5efZp+RVYwiQwGG+SefKmeoOYenabwsm2P8C5/Qz6x+uEaL4KB
         r3KV2vBIEXdhnEzO2nKOuPeT2WsMa9ZgTw4k7444NOuKTCTzE698RRhmVDBv19yNHvDz
         D4HBoIy5wuY9C7tKD4Tg0ACzEL7mMvBkBIKjDGvQ7CDi3i5Q/NmuRNYivquCRUQpYBMk
         1sJA==
X-Gm-Message-State: AOAM53066HRzIyzsvCDoXPQHWXRCtcN2wnXZqdzh6hg8Uzil8Yg4MKMZ
        nA9vQd/RH45et3bQyyZFt50UkyI95LxBvtlBifK8aw==
X-Google-Smtp-Source: ABdhPJwe+qAgFomVIXuWbzGAauJU9wj72eVu31zTOsLfxyczSpIqa75RCrqQAbiGL1Hz6QJ8MriELl6fBZWSTfBvUWI=
X-Received: by 2002:ac2:4e8c:: with SMTP id o12mr188297lfr.374.1629146936679;
 Mon, 16 Aug 2021 13:48:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210816203635.53864-1-nathan@kernel.org>
In-Reply-To: <20210816203635.53864-1-nathan@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 16 Aug 2021 13:48:45 -0700
Message-ID: <CAKwvOd=+rn-xyHrX=P=B19EJ8MSmDvQt8oU+QD=59KUHOC7R=A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Switch to 'f' variants of integrated assembler flag
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 16, 2021 at 1:37 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> It has been brought up a few times in various code reviews that clang
> 3.5 introduced -f{,no-}integrated-as as the preferred way to enable and
> disable the integrated assembler, mentioning that -{no-,}integrated-as
> are now considered legacy flags.
>
> Switch the kernel over to using those variants in case there is ever a
> time where clang decides to remove the non-'f' variants of the flag.
>
> Link: https://releases.llvm.org/3.5.0/tools/clang/docs/ReleaseNotes.html#new-compiler-flags
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch! Want to fix
tools/testing/selftests/rseq/Makefile and
tools/testing/selftests/sched/Makefile, too? Either way...
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  scripts/Makefile.clang | 4 ++--
>  scripts/as-version.sh  | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
> index 3ae63bd35582..4cce8fd0779c 100644
> --- a/scripts/Makefile.clang
> +++ b/scripts/Makefile.clang
> @@ -23,11 +23,11 @@ CLANG_FLAGS += --target=$(notdir $(CROSS_COMPILE:%-=%))
>  endif # CROSS_COMPILE
>
>  ifeq ($(LLVM_IAS),0)
> -CLANG_FLAGS    += -no-integrated-as
> +CLANG_FLAGS    += -fno-integrated-as
>  GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
>  CLANG_FLAGS    += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
>  else
> -CLANG_FLAGS    += -integrated-as
> +CLANG_FLAGS    += -fintegrated-as
>  endif
>  CLANG_FLAGS    += -Werror=unknown-warning-option
>  KBUILD_CFLAGS  += $(CLANG_FLAGS)
> diff --git a/scripts/as-version.sh b/scripts/as-version.sh
> index 8b9410e329df..a0fc366728f1 100755
> --- a/scripts/as-version.sh
> +++ b/scripts/as-version.sh
> @@ -21,13 +21,13 @@ get_canonical_version()
>         echo $((10000 * $1 + 100 * ${2:-0} + ${3:-0}))
>  }
>
> -# Clang fails to handle -Wa,--version unless -no-integrated-as is given.
> -# We check -(f)integrated-as, expecting it is explicitly passed in for the
> +# Clang fails to handle -Wa,--version unless -fno-integrated-as is given.
> +# We check -fintegrated-as, expecting it is explicitly passed in for the
>  # integrated assembler case.
>  check_integrated_as()
>  {
>         while [ $# -gt 0 ]; do
> -               if [ "$1" = -integrated-as -o "$1" = -fintegrated-as ]; then
> +               if [ "$1" = -fintegrated-as ]; then
>                         # For the intergrated assembler, we do not check the

^ want to fix this typo, too? s/intergrated/integrated/

>                         # version here. It is the same as the clang version, and
>                         # it has been already checked by scripts/cc-version.sh.
>
> base-commit: f12b034afeb3a977bbb1c6584dedc0f3dc666f14
> --
> 2.33.0.rc2
>


-- 
Thanks,
~Nick Desaulniers
