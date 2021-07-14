Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3515D3C8A91
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jul 2021 20:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbhGNSRD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Jul 2021 14:17:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239990AbhGNSRD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Jul 2021 14:17:03 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2000EC061764
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Jul 2021 11:14:11 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id a18so5123950lfs.10
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Jul 2021 11:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O8TPU0hqO2c6lrmOpVCEHEZ3QntgeMzfXOeutKZUuGQ=;
        b=GP0Dd2HejNzwHWckSqUuuJQz3ybU1NQTkuAQYQ0Iix+Gqdo0eWbTBj7XnDaLG0wE8k
         08OctU1iaTR+/lL1dLgTUKi8wCk+YBwdSpn0GKuvAGGCSDTXUJI/aMos9QYPB3SKgEc/
         PAkGIeIRMCIYXU5yjKfC0MyZtFjcbDMD3hIxnGNz6Na67oIJlknmivj1spY/A/5qz5Ba
         h1I8KLXm+/aU4Kp8zxzQyuqrf52MKJN5gD5k96UWqJwy4ZIdiLeX0P0di+mSs4zycdR4
         JYf35fE902Tc/W595ve57Iqs1LGBtYOmeKqw8jUZyPZKYI//Pi0OzfT+ooT83u22YhH/
         v85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O8TPU0hqO2c6lrmOpVCEHEZ3QntgeMzfXOeutKZUuGQ=;
        b=aL1ygRsda6l+214yRl2JvNeyNQV1DBYWeJgGXFuaUFxTfEzK+V2nIHORG0orIeKCgD
         qDUhdRoApuLP+HO1XHTQTCt75l7V+3mZfmyU6N5aOLlu0dIUDsgpjr90QLtl1jHcNFJp
         zejx360hSFq7Wn5E2KnSomEutTWI1FrI18SfGN0uW7nS9AGNEQy33buE8NfW2HFySDbe
         0IKBnv5lQacdVqmsaLf4ekP/Gt2uZKx2qLm8I3TVT96UreYTXSFGGL0aVmuPtaUrTlck
         m9ARznRiKRARYzUJZ6/FGjUxqIf//XFlkXEVLxK3n3s2iG2Exg8qMdG2dyM6xNems1p1
         b42A==
X-Gm-Message-State: AOAM5327s00F+IEcWnY9qlkwuSIPY9Pq3oAcEVQfLGbW1jln4mqOtK/j
        1LSJK8oPpSC8gBic8BpgrN/J1Ls3DQP89eTCQYWUaA==
X-Google-Smtp-Source: ABdhPJzGQBRL19G8n4JdfX5XiIs4hch17ulA/Fmu33Rkcgp58p/SczPkAD+RTaPFPpf30NDPB1c736FtkruzNIUr9lM=
X-Received: by 2002:a05:6512:3e0c:: with SMTP id i12mr8768338lfv.122.1626286449128;
 Wed, 14 Jul 2021 11:14:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210704202756.29107-1-ojeda@kernel.org> <20210704202756.29107-4-ojeda@kernel.org>
In-Reply-To: <20210704202756.29107-4-ojeda@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 14 Jul 2021 11:13:57 -0700
Message-ID: <CAKwvOdnO1ZbM_FzY3qwokEkWDxsr37t_u57H_wEO6Pbu6CqFZw@mail.gmail.com>
Subject: Re: [PATCH 03/17] Makefile: generate `CLANG_FLAGS` even in GCC builds
To:     ojeda@kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jul 4, 2021 at 1:28 PM <ojeda@kernel.org> wrote:
>
> From: Miguel Ojeda <ojeda@kernel.org>
>
> To support Rust under GCC-built kernels, we need to save the flags that
> would have been passed if the kernel was being compiled with Clang.
>
> The reason is that `bindgen` -- the tool we use to generate Rust
> bindings to the C side of the kernel -- relies on `libclang` to
> parse C. Ideally:
>
>   - `bindgen` would support a GCC backend (requested at [1]),
>
>   - or the Clang driver would be perfectly compatible with GCC,
>     including plugins. Unlikely, of course, but perhaps a big
>     subset of configs may be possible to guarantee to be kept
>     compatible nevertheless.
>
> This is also the reason why GCC builds are very experimental and some
> configurations may not work (e.g. `GCC_PLUGIN_RANDSTRUCT`). However,
> we keep GCC builds working (for some example configs) in the CI
> to avoid diverging/regressing further, so that we are better prepared
> for the future when a solution might become available.
>
> [1] https://github.com/rust-lang/rust-bindgen/issues/1949
>
> Link: https://github.com/Rust-for-Linux/linux/issues/167
> Co-developed-by: Alex Gaynor <alex.gaynor@gmail.com>
> Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>
> Co-developed-by: Geoffrey Thomas <geofft@ldpreload.com>
> Signed-off-by: Geoffrey Thomas <geofft@ldpreload.com>
> Co-developed-by: Finn Behrens <me@kloenk.de>
> Signed-off-by: Finn Behrens <me@kloenk.de>
> Co-developed-by: Adam Bratschi-Kaye <ark.email@gmail.com>
> Signed-off-by: Adam Bratschi-Kaye <ark.email@gmail.com>
> Co-developed-by: Wedson Almeida Filho <wedsonaf@google.com>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Patch LGTM; please keep an eye on the series:
https://lore.kernel.org/lkml/20210707224310.1403944-2-ndesaulniers@google.com/

If that lands in kbuild before this, this patch will need to be
rebased to avoid a conflict in linux-next.

So (tentatively :-P):
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

If the patch needs to be rebased on the series linked above, please
drop my reviewed by tag and I will re-review. Perhaps putting me
explicitly on Cc: in the commit message will help notify me if there
are successive versions?

> ---
>  Makefile | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 0565caea036..6e823d8bd64 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -573,18 +573,23 @@ endif
>  # and from include/config/auto.conf.cmd to detect the compiler upgrade.
>  CC_VERSION_TEXT = $(subst $(pound),,$(shell $(CC) --version 2>/dev/null | head -n 1))
>
> -ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
> +TENTATIVE_CLANG_FLAGS := -Werror=unknown-warning-option
> +
>  ifneq ($(CROSS_COMPILE),)
> -CLANG_FLAGS    += --target=$(notdir $(CROSS_COMPILE:%-=%))
> +TENTATIVE_CLANG_FLAGS  += --target=$(notdir $(CROSS_COMPILE:%-=%))
>  endif
>  ifeq ($(LLVM_IAS),1)
> -CLANG_FLAGS    += -integrated-as
> +TENTATIVE_CLANG_FLAGS  += -integrated-as
>  else
> -CLANG_FLAGS    += -no-integrated-as
> +TENTATIVE_CLANG_FLAGS  += -no-integrated-as
>  GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
> -CLANG_FLAGS    += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
> +TENTATIVE_CLANG_FLAGS  += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
>  endif
> -CLANG_FLAGS    += -Werror=unknown-warning-option
> +
> +export TENTATIVE_CLANG_FLAGS
> +
> +ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
> +CLANG_FLAGS    += $(TENTATIVE_CLANG_FLAGS)
>  KBUILD_CFLAGS  += $(CLANG_FLAGS)
>  KBUILD_AFLAGS  += $(CLANG_FLAGS)
>  export CLANG_FLAGS
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
