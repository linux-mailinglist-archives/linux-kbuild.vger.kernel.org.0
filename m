Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 703DFA072B
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2019 18:21:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbfH1QVC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Aug 2019 12:21:02 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:46782 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726415AbfH1QVC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Aug 2019 12:21:02 -0400
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x7SGKwWr032555;
        Thu, 29 Aug 2019 01:20:58 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x7SGKwWr032555
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1567009258;
        bh=gLFsc4GoaKSP2blYoRMPLmZqDOXVyUGvyhVsoSy7tug=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=UkCaK5W8/HC7ydYopRcA4en5nWKsFmKqbSKJp9oK21bX2H06tR9nl9dHrNfyObGvh
         is4V+7oNJazKp1A6YNn+xiH8UxkoBKLuCUktUiLDOkdTdhW9Zebr630SBUJb9S98ky
         RSCqGlhu8eaFkQQ16Gw9HpVYOIYc6ssDAsN81AVAymmeN0SLgKc+KupvmJ2iLKS2rv
         YJMVJ3VSm7pT9S9shNhZUoILI0ydRy78d7idJOANrOWHVppD2c5dZK4eVFusmpFGwo
         6mDJ3ad0qWFf1T09eYOveiXmW/G+Ac9EoysRn+iJYXNlKLHAEA64Tvkhkyw2KkPI7d
         4L7DepLRaKhVg==
X-Nifty-SrcIP: [209.85.222.50]
Received: by mail-ua1-f50.google.com with SMTP id f9so175898uaj.4;
        Wed, 28 Aug 2019 09:20:58 -0700 (PDT)
X-Gm-Message-State: APjAAAWicYO1dAgErUkeAssot+HKphHGVExSuusKQDx+Ga/rMocrPPnx
        RKN7hpLMzjBJaD6Z4YfLfuUag+wVBN7op3xSJRI=
X-Google-Smtp-Source: APXvYqx0AiCoT1Nj6qNzrL4eY7yrUbBwb44z2Gqdj7kuBZooLZlGmtWqmGPjhiDk6h/Wjp4X3ddsAWdyEpa1sklEZD0=
X-Received: by 2002:ab0:32d8:: with SMTP id f24mr2475802uao.121.1567009256901;
 Wed, 28 Aug 2019 09:20:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190815225844.145726-1-nhuck@google.com> <20190827004155.11366-1-natechancellor@gmail.com>
In-Reply-To: <20190827004155.11366-1-natechancellor@gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 29 Aug 2019 01:20:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNATHj5KrnFa0fvHjuC-=5mV8VBT14vrpPMfuNKWw7wabag@mail.gmail.com>
Message-ID: <CAK7LNATHj5KrnFa0fvHjuC-=5mV8VBT14vrpPMfuNKWw7wabag@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Do not enable -Wimplicit-fallthrough for clang
 for now
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Huckleberry <nhuck@google.com>,
        Joe Perches <joe@perches.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 27, 2019 at 9:42 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> This functionally reverts commit bfd77145f35c ("Makefile: Convert
> -Wimplicit-fallthrough=3 to just -Wimplicit-fallthrough for clang").
>
> clang enabled support for -Wimplicit-fallthrough in C in r369414 [1],
> which causes a lot of warnings when building the kernel for two reasons:
>
> 1. Clang does not support the /* fall through */ comments. There seems
>    to be a general consensus in the LLVM community that this is not
>    something they want to support. Joe Perches wrote a script to convert
>    all of the comments to a "fallthrough" keyword that will be added to
>    compiler_attributes.h [2] [3], which catches the vast majority of the
>    comments. There doesn't appear to be any consensus in the kernel
>    community when to do this conversion.
>
> 2. Clang and GCC disagree about falling through to final case statements
>    with no content or cases that simply break:
>
>    https://godbolt.org/z/c8csDu
>
>    This difference contributes at least 50 warnings in an allyesconfig
>    build for x86, not considering other architectures. This difference
>    will need to be discussed to see which compiler is right [4] [5].
>
> [1]: https://github.com/llvm/llvm-project/commit/1e0affb6e564b7361b0aadb38805f26deff4ecfc
> [2]: https://lore.kernel.org/lkml/61ddbb86d5e68a15e24ccb06d9b399bbf5ce2da7.camel@perches.com/
> [3]: https://lore.kernel.org/lkml/1d2830aadbe9d8151728a7df5b88528fc72a0095.1564549413.git.joe@perches.com/
> [4]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91432
> [5]: https://github.com/ClangBuiltLinux/linux/issues/636
>
> Given these two problems need discussion and coordination, do not enable
> -Wimplicit-fallthrough with clang right now. Add a comment to explain
> what is going on as well. This commit should be reverted once these two
> issues are fully flushed out and resolved.
>
> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---

Applied to linux-kbuild. Thanks.

(If other clang folks give tags, I will add them later.)



>  Makefile | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index f125625efd60..6007a56bdbee 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -751,6 +751,11 @@ else
>  # These warnings generated too much noise in a regular build.
>  # Use make W=1 to enable them (see scripts/Makefile.extrawarn)
>  KBUILD_CFLAGS += -Wno-unused-but-set-variable
> +
> +# Warn about unmarked fall-throughs in switch statement.
> +# Disabled for clang while comment to attribute conversion happens and
> +# https://github.com/ClangBuiltLinux/linux/issues/636 is discussed.
> +KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough,)
>  endif
>
>  KBUILD_CFLAGS += $(call cc-disable-warning, unused-const-variable)
> @@ -845,9 +850,6 @@ NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
>  # warn about C99 declaration after statement
>  KBUILD_CFLAGS += -Wdeclaration-after-statement
>
> -# Warn about unmarked fall-throughs in switch statement.
> -KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough,)
> -
>  # Variable Length Arrays (VLAs) should not be used anywhere in the kernel
>  KBUILD_CFLAGS += -Wvla
>
> --
> 2.23.0
>


-- 
Best Regards
Masahiro Yamada
