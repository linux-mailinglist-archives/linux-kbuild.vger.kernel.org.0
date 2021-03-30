Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9400734F13D
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Mar 2021 20:49:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232932AbhC3StQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Mar 2021 14:49:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232922AbhC3Ssr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Mar 2021 14:48:47 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E145C061762;
        Tue, 30 Mar 2021 11:48:47 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id u9so26329624ejj.7;
        Tue, 30 Mar 2021 11:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eN+6HYZu9ai/bWKIofpS3d379/+m4z1HTTkJ2Rk0/xc=;
        b=JylleUcVY9HtgGKw4+s9FRb45G3Ck5q4643g34+JGeKjbVSXRnrFiAs+VWREW3dpFU
         rat6h3xYlWUyj8Zx3DnZPiVut0bOo27hqZQ0BeIi7LBgmOIDrA2yoC8gtrnUKA08T4/8
         xbOKFuawNUPxf9YtrMeelgXIpMR4exct0ezzZW6XPA30WEnK/2IBUx+rR3+Q4YRkzuy5
         KaH09YB3UqUZ3H3OP3giQOs4y3kG1QpcT+2vLfri+cg+NxXjleNsXKR04gxOh5uIFjyn
         RpFtHMDDKv7He7O84rd0Y4s+ToUCgspRqYqBH9qNR2k0WQ4X1RY22eUyNzEh0026L+89
         OQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eN+6HYZu9ai/bWKIofpS3d379/+m4z1HTTkJ2Rk0/xc=;
        b=FK/GJt1nP5ULF1xks38DgtgAccdkQsvz9hH77o2V0/y4XGuH8tKrUCLF1LbcNSpqws
         PaqTOnMbPLX2/3cyhLgPIzlWnWUKcMhLk3o2skHxOqyVaHUOHW9g10lc0d5wRjqwSFXw
         RsTVvSlyia5hCSe8YoKau361WysJQeyy17jqw6M9JC12gehAKmsPUBX2RGXZXj8uhi4l
         r6rYUslA4uXq3oMqn3B2aeIT7c0nFqmeCqN8WOocJ5s1rkVU93IqsVNaX+MELN0wWkjA
         JuO/6AnneQDfyUUigJtY42X5VOBFBGuMuI4WPuFsbI7X59HwssFRO/XOB3ClUwLuLTqh
         ctmQ==
X-Gm-Message-State: AOAM533CjGPRjCpsdZB50RWmPBCE4wg2p4J4BEQUTDBGdlbBBbQmRBGE
        i+hoQNsNSdxFpr3PaZrLMnN9CLqPZNPUseOVgoI=
X-Google-Smtp-Source: ABdhPJzyy9+3wHeDgrA1FD8zLK6A8Db2R2IPn6AAPceZVkjSnuTDjVKtLdl17s9NBCOsiO8ALtXZ61D4+bz2N99zR1o=
X-Received: by 2002:a17:906:4e17:: with SMTP id z23mr34847959eju.439.1617130126127;
 Tue, 30 Mar 2021 11:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210323124112.1229772-1-arnd@kernel.org>
In-Reply-To: <20210323124112.1229772-1-arnd@kernel.org>
From:   Andrey Konovalov <andreyknvl@gmail.com>
Date:   Tue, 30 Mar 2021 20:48:35 +0200
Message-ID: <CA+fCnZfZre1d07eUq0PBzznn8b6Co0Scp9Dnwad6ZaGp4LyrCQ@mail.gmail.com>
Subject: Re: [PATCH] kasan: fix hwasan build for gcc
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Marco Elver <elver@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 23, 2021 at 1:41 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> gcc-11 adds support for -fsanitize=kernel-hwaddress, so it becomes
> possible to enable CONFIG_KASAN_SW_TAGS.
>
> Unfortunately this fails to build at the moment, because the
> corresponding command line arguments use llvm specific syntax.
>
> Change it to use the cc-param macro instead, which works on both
> clang and gcc.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  scripts/Makefile.kasan | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
> index 1e000cc2e7b4..0a2789783d1b 100644
> --- a/scripts/Makefile.kasan
> +++ b/scripts/Makefile.kasan
> @@ -36,14 +36,14 @@ endif # CONFIG_KASAN_GENERIC
>  ifdef CONFIG_KASAN_SW_TAGS
>
>  ifdef CONFIG_KASAN_INLINE
> -    instrumentation_flags := -mllvm -hwasan-mapping-offset=$(KASAN_SHADOW_OFFSET)
> +    instrumentation_flags := $(call cc-param,hwasan-mapping-offset=$(KASAN_SHADOW_OFFSET))
>  else
> -    instrumentation_flags := -mllvm -hwasan-instrument-with-calls=1
> +    instrumentation_flags := $(call cc-param,hwasan-instrument-with-calls=1)
>  endif
>
>  CFLAGS_KASAN := -fsanitize=kernel-hwaddress \
> -               -mllvm -hwasan-instrument-stack=$(CONFIG_KASAN_STACK) \
> -               -mllvm -hwasan-use-short-granules=0 \
> +               $(call cc-param,hwasan-instrument-stack=$(CONFIG_KASAN_STACK)) \
> +               $(call cc-param,hwasan-use-short-granules=0) \
>                 $(instrumentation_flags)
>
>  endif # CONFIG_KASAN_SW_TAGS
> --
> 2.29.2
>

Hi Arnd,

This patch breaks SW_TAGS build with Clang for me with:

arch/arm64/include/asm/current.h:19: undefined reference to `__hwasan_tls'

The reason for this is that cc-param is only defined for
KASAN_GENERIC, the definition needs to be moved.

Thanks!
