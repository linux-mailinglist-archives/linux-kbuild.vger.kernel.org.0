Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8B431963E0
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Mar 2020 06:52:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725800AbgC1FwS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 28 Mar 2020 01:52:18 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:16787 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgC1FwS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 28 Mar 2020 01:52:18 -0400
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 02S5q9Ms022225;
        Sat, 28 Mar 2020 14:52:09 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 02S5q9Ms022225
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585374729;
        bh=W82m+uPJj0ZNIAfNpMqLzdYQ4VZHAUDFKwdRLnvIJsg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=I1lUm+kQTfX5zbBuK1fXkcmXGDRVdkuiPvAzVf4N5HmyPET2HczrfoaOu8gS7IVDH
         uXNjATCNpNCWf6YaHuOeXfmaPjwL9gRhIFt2O4f6H6E/Yjs9YhlYEnqiEGOXVaTdCB
         bcXg8WyYzBew9lzNZqaNgIqMkjYmZNqMhokbw4NKosGKrrH/WLLB6aS3vYvdVC9VQb
         k0734S2/k4GIvrF99qH8j8lBhf3qnMfuFA2TzmiWE3QqSDa+U0DaFvQ4uLTWl7yJ+e
         SIrRORLlaw42BTio0sXll1r+PEnqHKo8OIt2qOe/yJlLnF90dE+7Fs1AWvypgxn1DZ
         TPHPAwpjKAuMA==
X-Nifty-SrcIP: [209.85.222.53]
Received: by mail-ua1-f53.google.com with SMTP id g24so4352840uan.10;
        Fri, 27 Mar 2020 22:52:09 -0700 (PDT)
X-Gm-Message-State: AGi0PuaziXokO0yvFOam8FgYnMfx+0Dme18In+czt3M1WmgEZouRh7G6
        dORm7uyyY61Jgz+uqEn2Ixgjp8d5KosXkZiXEcY=
X-Google-Smtp-Source: APiQypILE/tW/4qd4pKKajlOXtAV8ioqzFR3HUP4YwRg8dp254iEux1JLhKrO9n9lOCuaLJJKcAIk3yRBfwowhthINA=
X-Received: by 2002:ab0:28d8:: with SMTP id g24mr1639878uaq.121.1585374728531;
 Fri, 27 Mar 2020 22:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200326055719.16755-1-masahiroy@kernel.org> <20200326055719.16755-4-masahiroy@kernel.org>
In-Reply-To: <20200326055719.16755-4-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 28 Mar 2020 14:51:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR2Vg-Z2TEfU5__d2T2cBmhbgngwdQE9tshAT2XJvB4Mw@mail.gmail.com>
Message-ID: <CAK7LNAR2Vg-Z2TEfU5__d2T2cBmhbgngwdQE9tshAT2XJvB4Mw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] kbuild: remove AS variable
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     clang-built-linux <clang-built-linux@googlegroups.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 26, 2020 at 2:58 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> As commit 5ef872636ca7 ("kbuild: get rid of misleading $(AS) from
> documents") noted, we rarely use $(AS) directly in the kernel build.
>
> Now that the only/last user of $(AS) in drivers/net/wan/Makefile was
> converted to $(CC), $(AS) is no longer used in the build process.
>
> You can still pass in AS=clang, which is just a switch to turn on
> the LLVM integrated assembler.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>


I forgot to remove the export.




@@ -472,7 +471,7 @@ KBUILD_LDFLAGS :=
 GCC_PLUGINS_CFLAGS :=
 CLANG_FLAGS :=

-export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS
CROSS_COMPILE AS LD CC
+export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS
CROSS_COMPILE LD CC
 export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE READELF PAHOLE LEX
YACC AWK INSTALLKERNEL
 export PERL PYTHON PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
 export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE





> ---
>
> Changes in v2:
>   - Fix breakage of CC=clang build
>
>  Makefile | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index fcec84681e4e..2e12fa1cc8f3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -405,7 +405,6 @@ KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
>  KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS) $(HOSTLDLIBS)
>
>  # Make variables (CC, etc...)
> -AS             = $(CROSS_COMPILE)as
>  LD             = $(CROSS_COMPILE)ld
>  CC             = $(CROSS_COMPILE)gcc
>  CPP            = $(CC) -E
> @@ -535,7 +534,7 @@ endif
>  ifneq ($(GCC_TOOLCHAIN),)
>  CLANG_FLAGS    += --gcc-toolchain=$(GCC_TOOLCHAIN)
>  endif
> -ifeq ($(shell $(AS) --version 2>&1 | head -n 1 | grep clang),)
> +ifeq ($(if $(AS),$(shell $(AS) --version 2>&1 | head -n 1 | grep clang)),)
>  CLANG_FLAGS    += -no-integrated-as
>  endif
>  CLANG_FLAGS    += -Werror=unknown-warning-option
> --
> 2.17.1
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200326055719.16755-4-masahiroy%40kernel.org.



-- 
Best Regards
Masahiro Yamada
