Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77D391AED3
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 May 2019 04:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbfEMCWP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 12 May 2019 22:22:15 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:38102 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbfEMCWP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 12 May 2019 22:22:15 -0400
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x4D2LuXb009723;
        Mon, 13 May 2019 11:21:56 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x4D2LuXb009723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557714117;
        bh=yQxCG37w6Ly7xjh2CwAY8QJdOyakDs9OiQbyZ0eAim0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=MBCqaOYzYdWxF0AHi4tA46LHBqMqULIPASWNNej+mm0taGU3xhnjYQhmZe74r44Ht
         r6zxoqlYtI+c3QCTQ1ToB57TNn+6I6w0ESI2KCH9c/qmK09j17KluqXLa/I+y5aKT9
         UpzW7XT2cr27C8e8KzthxF2Dwz/ZsXuM0gI7NIoOpL3oTBfRKWOdhVTl0xFWRlOc28
         lK72ilXsqwoCHZGWqqf33cXfpl+xkZVvYGIOQEWNGDJ1CfpY9mJ1T3EmyDaTPDFL/C
         7BPogjdT2J64l1Ke5PdW1GP/a3fdrgEsPnhQ0AJK7Q9lJzt9MtQZ//zNTfbxQJFxfZ
         iKhp6fjC8ZIxA==
X-Nifty-SrcIP: [209.85.217.54]
Received: by mail-vs1-f54.google.com with SMTP id c24so7023323vsp.7;
        Sun, 12 May 2019 19:21:56 -0700 (PDT)
X-Gm-Message-State: APjAAAV31pNYncHSagflqftvgqVCdJYFfvI2ZbvhJfKBv4fiu/njl6Mk
        uV46Ny/UaajM/hWLc1vi+Z1MfLZqXappR3DvgeU=
X-Google-Smtp-Source: APXvYqyDL5INPfRuGMICJarENkYbnXBma+o3Xq/qi1fMnEwrw4kXQhAiG1YYv/FhWyD/VowZ+DMssvlY2j9ztgx3wMM=
X-Received: by 2002:a05:6102:3d9:: with SMTP id n25mr653917vsq.181.1557714115443;
 Sun, 12 May 2019 19:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <1557497409-18037-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1557497409-18037-1-git-send-email-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 13 May 2019 11:21:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNASu5ef8TbhL5J4Mgw=ZH4fpGR34xPfbruOSW4frm0c6gQ@mail.gmail.com>
Message-ID: <CAK7LNASu5ef8TbhL5J4Mgw=ZH4fpGR34xPfbruOSW4frm0c6gQ@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: add all Clang-specific flags unconditionally
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 10, 2019 at 11:11 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> We do not support old Clang versions. Upgrade your clang version
> if any of these flags is unsupported.
>
> Let's add all flags within ifdef CONFIG_CC_IS_CLANG unconditionally.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>
> ---

Applied to linux-kbuild.

>
> Changes in v2:
>   - Rebase on top of Nathan's patch
>      https://patchwork.kernel.org/patch/10937055/
>
>  Makefile                   | 10 +++++-----
>  scripts/Makefile.extrawarn | 12 ++++++------
>  2 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 914a3ad..1152fc4 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -731,15 +731,15 @@ stackp-flags-$(CONFIG_STACKPROTECTOR_STRONG)      := -fstack-protector-strong
>  KBUILD_CFLAGS += $(stackp-flags-y)
>
>  ifdef CONFIG_CC_IS_CLANG
> -KBUILD_CPPFLAGS += $(call cc-option,-Qunused-arguments,)
> -KBUILD_CFLAGS += $(call cc-disable-warning, format-invalid-specifier)
> -KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
> +KBUILD_CPPFLAGS += -Qunused-arguments
> +KBUILD_CFLAGS += -Wno-format-invalid-specifier
> +KBUILD_CFLAGS += -Wno-gnu
>  # Quiet clang warning: comparison of unsigned expression < 0 is always false
> -KBUILD_CFLAGS += $(call cc-disable-warning, tautological-compare)
> +KBUILD_CFLAGS += -Wno-tautological-compare
>  # CLANG uses a _MergedGlobals as optimization, but this breaks modpost, as the
>  # source of a reference will be _MergedGlobals and not on of the whitelisted names.
>  # See modpost pattern 2
> -KBUILD_CFLAGS += $(call cc-option, -mno-global-merge,)
> +KBUILD_CFLAGS += -mno-global-merge
>  else
>
>  # These warnings generated too much noise in a regular build.
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index 768306a..523c4ca 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -66,11 +66,11 @@ KBUILD_CFLAGS += $(warning)
>  else
>
>  ifdef CONFIG_CC_IS_CLANG
> -KBUILD_CFLAGS += $(call cc-disable-warning, initializer-overrides)
> -KBUILD_CFLAGS += $(call cc-disable-warning, unused-value)
> -KBUILD_CFLAGS += $(call cc-disable-warning, format)
> -KBUILD_CFLAGS += $(call cc-disable-warning, sign-compare)
> -KBUILD_CFLAGS += $(call cc-disable-warning, format-zero-length)
> -KBUILD_CFLAGS += $(call cc-disable-warning, uninitialized)
> +KBUILD_CFLAGS += -Wno-initializer-overrides
> +KBUILD_CFLAGS += -Wno-unused-value
> +KBUILD_CFLAGS += -Wno-format
> +KBUILD_CFLAGS += -Wno-sign-compare
> +KBUILD_CFLAGS += -Wno-format-zero-length
> +KBUILD_CFLAGS += -Wno-uninitialized
>  endif
>  endif
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
