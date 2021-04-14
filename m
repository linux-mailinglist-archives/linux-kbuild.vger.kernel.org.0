Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2069E35FE91
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 01:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbhDNXri (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Apr 2021 19:47:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbhDNXrh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Apr 2021 19:47:37 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E324C061756
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Apr 2021 16:47:13 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id a36so14262249ljq.8
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Apr 2021 16:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+TpZa+C9cCQwz4Q2nu+eQulPH6EC1ZhAKJ0Pt2gzF58=;
        b=CjmCZvhyG1hOPzQ0l7b1Br0e4i7SFJ8KrImnZRGRP0SCVDXXfHW4HoDlWBvTbq0WSv
         fcLuenxPR5TSbfjQ5WLbNxs4D/NVnzepr7FK1GKTd+9yxFp2VJ0GJiai7n5rL72Uq1aM
         k3WkJ5gAaYpFl4qQnWX8ZCTVosqEi7TA2Lv6054ltoIuPK4G4ZQ4jvl6eKT82QnjkBAF
         Q5ZPhd81n9Xkk9fA61LKnmq+9yejt3s3XqOHeHq+/XeTbgYIGpvlwr19zfoDp+QsqCyQ
         vHm1OgzZtwmFWKakdNo6gbNopibS26GcSs32BtOUqA4UMcnY0TV3dAeu1Dx9xqoPwCr1
         sl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+TpZa+C9cCQwz4Q2nu+eQulPH6EC1ZhAKJ0Pt2gzF58=;
        b=bR1oDzsQuKfub+A0y+MeoWio4F1AyySvlTw33OkrrZW2bCO0RsfzFvBv0rcQedkBhW
         an4KZbs3xHA1xRUk/AA98+gXYmVad39+SRueS1h6PBonVU3NwUuabmPwKMWw+fBJe4jf
         BR3ZsWYv+Cytouvs1RsoJ3SKNFREBHkMRyNCSLLOnVXZBQCbqvBaL1AriUC6G1pYOj/o
         kqsohpXQRiGNdj/iuQFNCy6FQ6lc+OHtb+3VqRVftb6UQdTa7hwuabr4LzSe3skidHIK
         8RGsvKb9Ji+PXIWorZcy7v1Nd8PsfuPF8O00T7npxkOWXV2DeltV5r/NxRZeKJhbBJ0O
         ON/Q==
X-Gm-Message-State: AOAM533rHKvxmJ/qFnYWAuNt7g9qHGk1Rdrm7yXHDvK3Z8cKuIXLK/7k
        LTefPtIzgbi5QqarotdcbZJCGvp3n/CyY4r6xqlCfg==
X-Google-Smtp-Source: ABdhPJx1061aL/GqHoj3QkAEX++DNSP6KXBGITCMLiN6jW2qaQa8bGDJNhOL8TCspjkGwTLyMoKgn+vBboav1U+bOOg=
X-Received: by 2002:a2e:b817:: with SMTP id u23mr249392ljo.116.1618444031762;
 Wed, 14 Apr 2021 16:47:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-4-ojeda@kernel.org>
In-Reply-To: <20210414184604.23473-4-ojeda@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 14 Apr 2021 16:46:59 -0700
Message-ID: <CAKwvOd=YV1Ck3hYKEC9035o+yghy_Oh1VWAyeGLQP5B9SR9xLw@mail.gmail.com>
Subject: Re: [PATCH 03/13] Makefile: Generate CLANG_FLAGS even in GCC builds
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 14, 2021 at 11:48 AM <ojeda@kernel.org> wrote:
>
> From: Miguel Ojeda <ojeda@kernel.org>
>
> To support Rust under GCC-built kernels, we need to save the flags that
> would have been passed if the kernel was being compiled with Clang.
>
> The reason is that bindgen -- the tool we use to generate Rust bindings
> to the C side of the kernel -- relies on libclang to parse C. Ideally:
>
>   - bindgen would support a GCC backend (requested at [1]),
>
>   - or the Clang driver would be perfectly compatible with GCC,
>     including plugins. Unlikely, of course, but perhaps a big
>     subset of configs may be possible to guarantee to be kept
>     compatible nevertheless.
>
> This is also the reason why GCC builds are very experimental and some
> configurations may not work (e.g. GCC_PLUGIN_RANDSTRUCT). However,
> we keep GCC builds working (for some example configs) in the CI
> to avoid diverging/regressing further, so that we are better prepared
> for the future when a solution might become available.
>
> [1] https://github.com/rust-lang/rust-bindgen/issues/1949
>
> Link: https://github.com/Rust-for-Linux/linux/issues/167
>
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
> ---
>  Makefile | 27 ++++++++++++++++-----------
>  1 file changed, 16 insertions(+), 11 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index d4784d181123..9c75354324ed 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -559,26 +559,31 @@ ifdef building_out_of_srctree
>         { echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
>  endif
>
> -# The expansion should be delayed until arch/$(SRCARCH)/Makefile is included.
> -# Some architectures define CROSS_COMPILE in arch/$(SRCARCH)/Makefile.
> -# CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
> -# and from include/config/auto.conf.cmd to detect the compiler upgrade.
> -CC_VERSION_TEXT = $(shell $(CC) --version 2>/dev/null | head -n 1 | sed 's/\#//g')
> +TENTATIVE_CLANG_FLAGS := -Werror=unknown-warning-option
>
> -ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
>  ifneq ($(CROSS_COMPILE),)
> -CLANG_FLAGS    += --target=$(notdir $(CROSS_COMPILE:%-=%))
> +TENTATIVE_CLANG_FLAGS  += --target=$(notdir $(CROSS_COMPILE:%-=%))
>  GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
> -CLANG_FLAGS    += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
> +TENTATIVE_CLANG_FLAGS  += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
>  GCC_TOOLCHAIN  := $(realpath $(GCC_TOOLCHAIN_DIR)/..)
>  endif
>  ifneq ($(GCC_TOOLCHAIN),)
> -CLANG_FLAGS    += --gcc-toolchain=$(GCC_TOOLCHAIN)
> +TENTATIVE_CLANG_FLAGS  += --gcc-toolchain=$(GCC_TOOLCHAIN)
>  endif
>  ifneq ($(LLVM_IAS),1)
> -CLANG_FLAGS    += -no-integrated-as
> +TENTATIVE_CLANG_FLAGS  += -no-integrated-as
>  endif
> -CLANG_FLAGS    += -Werror=unknown-warning-option
> +
> +export TENTATIVE_CLANG_FLAGS

I'm ok with this approach, but I'm curious:
If the user made a copy of the CLANG_FLAGS variable and modified its
copy, would TENTATIVE_CLANG_FLAGS even be necessary? IIUC,
TENTATIVE_CLANG_FLAGS is used to filter out certain flags before
passing them to bindgen?

Or, I'm curious whether you even need to rename this variable (or
create a new variable) at all? Might make for a shorter diff if you
just keep the existing identifier (CLANG_FLAGS), but create them
unconditionally (at least not conditional on CC=clang).


> +
> +# The expansion should be delayed until arch/$(SRCARCH)/Makefile is included.
> +# Some architectures define CROSS_COMPILE in arch/$(SRCARCH)/Makefile.
> +# CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
> +# and from include/config/auto.conf.cmd to detect the compiler upgrade.
> +CC_VERSION_TEXT = $(shell $(CC) --version 2>/dev/null | head -n 1 | sed 's/\#//g')
> +
> +ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
> +CLANG_FLAGS    += $(TENTATIVE_CLANG_FLAGS)
>  KBUILD_CFLAGS  += $(CLANG_FLAGS)
>  KBUILD_AFLAGS  += $(CLANG_FLAGS)
>  export CLANG_FLAGS
> --
> 2.17.1
>


--
Thanks,
~Nick Desaulniers
