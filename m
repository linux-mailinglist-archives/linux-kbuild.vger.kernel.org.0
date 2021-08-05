Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D57D3E1633
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Aug 2021 15:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241235AbhHEN7q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 5 Aug 2021 09:59:46 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:58446 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240412AbhHEN7q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Aug 2021 09:59:46 -0400
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 175DxJWi003798;
        Thu, 5 Aug 2021 22:59:20 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 175DxJWi003798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1628171960;
        bh=MkSCffZ2FCUUtcooB4heJtTkmzuuejT3xGrOt7x1cAA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=iCajhmo40OkihncfjVEtcet2ltpY21QoQoMe2glAN2eNHaze9sMggGWmI+Co24TuK
         SDrOczVHIkrYXfuqXa/X3zwecFVtSzOzrZoD5WAA0rwtSZHxoDpm+2Ts+7vZY/7SBT
         XSn24Kym+dkx5qvXsgP+ShwIjyMeNIrJDD2gW7L36XEcB6JxQajQcme5g7iGQgpp85
         +MF7QYpe0eWrnuVt/dVelrA7nTWAwQv4bBrvKPfnpZIV2wYJIpfyQg0+WbfqOSaNg6
         ObuRbdyl7SfJqeDBEypbHtgwPUlkg+no0sgBdDAgpzEa9420Ef4nZNyJwRq/9Z9TQt
         Io/zsuI3TGEfQ==
X-Nifty-SrcIP: [209.85.216.52]
Received: by mail-pj1-f52.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so14998906pjr.1;
        Thu, 05 Aug 2021 06:59:20 -0700 (PDT)
X-Gm-Message-State: AOAM531TZ2mqnBs33PdqABq80J/R034GXpi1RGWXvGgAxwVY2nqXN8iR
        /d1v6vgxK1Wnpk5KcRxp1QGQiL1WpEW7J46obYc=
X-Google-Smtp-Source: ABdhPJxCsspIjv0BLuWLByxOzuSFxh1DUpAzcMHY2XGUempgsI0UeWvbevn5fwM0XLWpeN5CvxXCyLMYFkf5/ct/MeY=
X-Received: by 2002:a62:8896:0:b029:3c3:7c34:6527 with SMTP id
 l144-20020a6288960000b02903c37c346527mr5225762pfd.80.1628171959400; Thu, 05
 Aug 2021 06:59:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210802183910.1802120-1-ndesaulniers@google.com> <20210802183910.1802120-3-ndesaulniers@google.com>
In-Reply-To: <20210802183910.1802120-3-ndesaulniers@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 5 Aug 2021 22:58:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQKd1obWkcN9BPfdx==ZVgDV16POCxhYFbexyvB5Nz7KA@mail.gmail.com>
Message-ID: <CAK7LNAQKd1obWkcN9BPfdx==ZVgDV16POCxhYFbexyvB5Nz7KA@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] Makefile: infer --target from ARCH for CC=clang
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>, Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 3, 2021 at 3:39 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> We get constant feedback that the command line invocation of make is too
> long when compiling with LLVM. CROSS_COMPILE is helpful when a toolchain
> has a prefix of the target triple, or is an absolute path outside of
> $PATH.
>
> Since a Clang binary is generally multi-targeted, we can infer a given
> target from SRCARCH/ARCH.  If CROSS_COMPILE is not set, simply set
> --target= for CLANG_FLAGS, KBUILD_CFLAGS, and KBUILD_AFLAGS based on
> $SRCARCH.
>
> Previously, we'd cross compile via:
> $ ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make LLVM=1 LLVM_IAS=1
> Now:
> $ ARCH=arm64 make LLVM=1 LLVM_IAS=1
>
> For native builds (not involving cross compilation) we now explicitly
> specify a target triple rather than rely on the implicit host triple.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1399
> Suggested-by: Arnd Bergmann <arnd@kernel.org>
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Acked-by: Arnd Bergmann <arnd@kernel.org>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> Changes v5 -> v6:
> * Use indirection as per Linus. We now have CLANG_TARGET_FLAGS and a
>   few variables suffixed with $SRCARCH.
> * Add Linus' SB tag.
> * Change hexagon target triple from -gnu to -musl.
>
> Changes v3 -> v4:
> * Reword commit message and oneline, as per Nathan.
> * Drop documentation change (it's the next patch, could be squashed in,
>   I guess).
> * Drop LLVM_IAS=1 requirement, as per Masahiro.
> * Carry Arnd's and Nathan's AB/RB/TB tags, confirmed OK on IRC+Discord.
>
> Changes v2 -> v3:
> * Drop check/requirement for LLVM=1, as per Masahiro.
> * Change oneliner from LLVM=1 LLVM_IAS=1 to CC=clang LLVM_IAS=1.
> * Don't carry forward Nathan's RB/TB tags. :( Sorry Nathan, but thank
>   you for testing+reviewing v2.
> * Update wording of docs slightly.
>
> Changes v1 -> v2:
> * Fix typos in commit message as per Geert and Masahiro.
> * Use SRCARCH instead of ARCH, simplifying x86 handling, as per
>   Masahiro. Add his sugguested by tag.
> * change commit oneline from 'drop' to 'infer.'
> * Add detail about explicit host --target and relationship of ARCH to
>   SRCARCH, as per Masahiro.
>
> Changes RFC -> v1:
> * Rebase onto linux-kbuild/for-next
> * Keep full target triples since missing the gnueabi suffix messes up
>   32b ARM. Drop Fangrui's sugguested by tag. Update commit message to
>   drop references to arm64.
> * Flush out TODOS.
> * Add note about -EL/-EB, -m32/-m64.
> * Add note to Documentation/.
>
>  scripts/Makefile.clang | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
> index 297932e973d4..1f4e3eb70f88 100644
> --- a/scripts/Makefile.clang
> +++ b/scripts/Makefile.clang
> @@ -1,6 +1,27 @@
> -ifneq ($(CROSS_COMPILE),)
> +# Individual arch/{arch}/Makefiles should use -EL/-EB to set intended
> +# endianness and -m32/-m64 to set word size based on Kconfigs instead of
> +# relying on the target triple.
> +CLANG_TARGET_FLAGS_arm         := arm-linux-gnueabi
> +CLANG_TARGET_FLAGS_arm64       := aarch64-linux-gnu
> +CLANG_TARGET_FLAGS_hexagon     := hexagon-linux-musl
> +CLANG_TARGET_FLAGS_m68k                := m68k-linux-gnu
> +CLANG_TARGET_FLAGS_mips                := mipsel-linux-gnu
> +CLANG_TARGET_FLAGS_powerpc     := powerpc64le-linux-gnu
> +CLANG_TARGET_FLAGS_riscv       := riscv64-linux-gnu
> +CLANG_TARGET_FLAGS_s390                := s390x-linux-gnu
> +CLANG_TARGET_FLAGS_x86         := x86_64-linux-gnu
> +CLANG_TARGET_FLAGS             := $(CLANG_TARGET_FLAGS_$(SRCARCH))
> +
> +ifeq ($(CROSS_COMPILE),)
> +ifeq ($(CLANG_TARGET_FLAGS),)
> +$(error Specify CROSS_COMPILE or add '--target=' option to scripts/Makefile.clang)


When I was browsing the code, I noticed a nit.

I believe non-build targets such as
'make help', 'make clean' etc. should succeed
without any correct CROSS_COMPILE set
since they do not use the compiler at all.


The remaining architectures may fail to clean.

$ export LLVM=1
$ make ARCH=csky  clean
scripts/Makefile.clang:17: *** Specify CROSS_COMPILE or add
'--target=' option to scripts/Makefile.clang.  Stop.



I decided to not be worried about it because it
is fixable later.
I will pick it up unless a significant issue is found.





> +else
> +CLANG_FLAGS    += --target=$(CLANG_TARGET_FLAGS)
> +endif # CLANG_TARGET_FLAGS
> +else
>  CLANG_FLAGS    += --target=$(notdir $(CROSS_COMPILE:%-=%))
> -endif
> +endif # CROSS_COMPILE
> +
>  ifeq ($(LLVM_IAS),1)
>  CLANG_FLAGS    += -integrated-as
>  else
> --
> 2.32.0.554.ge1b32706d8-goog
>


--
Best Regards


Masahiro Yamada
