Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A651128D209
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Oct 2020 18:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389434AbgJMQSD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Oct 2020 12:18:03 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:21313 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389429AbgJMQSD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Oct 2020 12:18:03 -0400
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 09DGHa36006473;
        Wed, 14 Oct 2020 01:17:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 09DGHa36006473
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1602605857;
        bh=PTNol6ZKZ6WikiQS1iwVWRfK1eVWXWR50IMrdlrgv8M=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=q7/RJVmC0Rm2kzu4LxJqza6MaZHKRJgBPSgg2aZOe+OkSkgURy9o9u2QyfUqYw85Z
         lsEIBoK9SCxjmuz1dorQtiSLg6LRYBgf4TW0QkEi67tltKA31tBkkoo3xOWZcd3M5M
         V+g8EYvhGkW++rbWQzPruAO5zLvCSUnSnzODvuboM885IU5F8khmy6b1dnrywrzGrd
         7z2lU2frrVbEM1nW6eeszBtPmeD5l2XJ6+1kpqn8LOwZyfSnl2m1Smr43Yi1tbAIyn
         J0btJWgtd3Sn1vLG0yoUtj+Wa22s9A5EnROF5GQi0QZyD1+VwiJV0yqL8d+94Cn30u
         S2tqpE1EYlA2Q==
X-Nifty-SrcIP: [209.85.215.178]
Received: by mail-pg1-f178.google.com with SMTP id x16so17882456pgj.3;
        Tue, 13 Oct 2020 09:17:36 -0700 (PDT)
X-Gm-Message-State: AOAM532WH6opO6P4+foHCAe2UjSQRMA9vPHLQb3oQc+/JhbsND+Ot/MR
        jMezjliZYjUmi3llOk5T7D8VDg1HukUyPN2Wr2Y=
X-Google-Smtp-Source: ABdhPJzoZHD68/Bv80yh/fLdH9j83UlF0155g7tzFH3hJt8WHYLx/UCm8PIQzsWZMa1AG2H0V0LitxpCakYhO3exLY4=
X-Received: by 2002:aa7:90cf:0:b029:156:2bff:5a87 with SMTP id
 k15-20020aa790cf0000b02901562bff5a87mr429693pfk.63.1602605855902; Tue, 13 Oct
 2020 09:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <20201012170631.1241502-1-ujjwalkumar0501@gmail.com> <20201012170631.1241502-2-ujjwalkumar0501@gmail.com>
In-Reply-To: <20201012170631.1241502-2-ujjwalkumar0501@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 14 Oct 2020 01:16:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQUXwH0KoNNQo9F1UCkkah2S1gJZKJFB1+91M3ZGSHQSQ@mail.gmail.com>
Message-ID: <CAK7LNAQUXwH0KoNNQo9F1UCkkah2S1gJZKJFB1+91M3ZGSHQSQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kconfig: use interpreters to invoke scripts
To:     Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-ia64@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Oct 13, 2020 at 2:08 AM Ujjwal Kumar <ujjwalkumar0501@gmail.com> wrote:
>
> We cannot rely on execute bits to be set on files in the repository.
> The build script should use the explicit interpreter when invoking any
> script from the repository.
>
> Link: https://lore.kernel.org/lkml/20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org/
> Link: https://lore.kernel.org/lkml/202008271102.FEB906C88@keescook/
>
> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> Suggested-by: Kees Cook <keescook@chromium.org>
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
> ---



The patch prefix 'kconfig:' should be used for changes
under scripts/kconfig/.


I want to see both prefixed with "kbuild:".

1/2:   kbuild: use interpreters in Kconfig files to invoke scripts
2/2:   kbuild: use interpreters in Makefiles to invoke scripts


More preferably, those two patches should be squashed into a
single patch titled "kbuild: use interpreters to invoke scripts"



BTW, I notice some code left unconverted.

For example,
https://github.com/torvalds/linux/blob/master/init/Kconfig#L68
https://github.com/torvalds/linux/blob/v5.9/certs/Makefile#L25

Maybe more...



I know it is difficult to cover everything, but please
re-check the remaining code.







>  init/Kconfig | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index c9446911cf41..8adf3194d26f 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -30,12 +30,12 @@ config CC_IS_GCC
>
>  config GCC_VERSION
>         int
> -       default $(shell,$(srctree)/scripts/gcc-version.sh $(CC)) if CC_IS_GCC
> +       default $(shell,$(CONFIG_SHELL) $(srctree)/scripts/gcc-version.sh $(CC)) if CC_IS_GCC
>         default 0
>
>  config LD_VERSION
>         int
> -       default $(shell,$(LD) --version | $(srctree)/scripts/ld-version.sh)
> +       default $(shell,$(LD) --version | $(AWK) -f $(srctree)/scripts/ld-version.sh)
>
>  config CC_IS_CLANG
>         def_bool $(success,echo "$(CC_VERSION_TEXT)" | grep -q clang)
> @@ -45,20 +45,20 @@ config LD_IS_LLD
>
>  config CLANG_VERSION
>         int
> -       default $(shell,$(srctree)/scripts/clang-version.sh $(CC))
> +       default $(shell,$(CONFIG_SHELL) $(srctree)/scripts/clang-version.sh $(CC))
>
>  config CC_CAN_LINK
>         bool
> -       default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
> -       default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag))
> +       default $(success,$(CONFIG_SHELL) $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
> +       default $(success,$(CONFIG_SHELL) $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag))
>
>  config CC_CAN_LINK_STATIC
>         bool
> -       default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag) -static) if 64BIT
> -       default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag) -static)
> +       default $(success,$(CONFIG_SHELL) $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag) -static) if 64BIT
> +       default $(success,$(CONFIG_SHELL) $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag) -static)
>
>  config CC_HAS_ASM_GOTO
> -       def_bool $(success,$(srctree)/scripts/gcc-goto.sh $(CC))
> +       def_bool $(success,$(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC))
>
>  config CC_HAS_ASM_GOTO_OUTPUT
>         depends on CC_HAS_ASM_GOTO
> --
> 2.25.1
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20201012170631.1241502-2-ujjwalkumar0501%40gmail.com.



-- 
Best Regards
Masahiro Yamada
