Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0D6F345E86
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Mar 2021 13:52:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231240AbhCWMvw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 23 Mar 2021 08:51:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230439AbhCWMvp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Mar 2021 08:51:45 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA17AC061756
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Mar 2021 05:51:44 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id x2so16854272oiv.2
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Mar 2021 05:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IAmVG/HBeCtgkbLWnwaUrodtWDBlDiqTMm626xAgpp8=;
        b=Fd41GIP8RzSKS++6KWoo1+6KAs7pGNTKJu7Ty7MHxacWYr2L3k5V4/KNK1pHad0Y33
         3AnD2/ZR9a3C0XWXzWGV+16X+w4Q1VS2S5l7v6gg2v49uEA2I6of6uDTZhO9o/3vgJYv
         06OB4nr6hKC1gqpGJdsaTIQTsUxQRyKpcRmjLPb6tifDGPHl+phnxujUDr92Osy6o9au
         mHMwczfz5BHPoEId1cj9cFoM3s8TzJS4tFswWyF+tskq25OMJCzCAk4CyPhYiJm1GsSu
         qHjfeMU2ACcDuzHqrYdV07KyEHn5oosvaECnkglXw1PKxh632jsoemBiq4GgEHZiiW+T
         jUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IAmVG/HBeCtgkbLWnwaUrodtWDBlDiqTMm626xAgpp8=;
        b=C55BOFzobeJqR338//qMjbSp4ijIqU48Cqj7p4G3UV/MaWq+TrZlNBCqn86u4Yn0AM
         9u1BiZou5kWB7628aXcYU5jWRFIKkrpTjDfQuPuuMpdaUkKWD+rmhJCVOXtz9K/mBi4i
         91ft3RBSp1eRQvvWWMIzghUzObMTTZxNjvJwSed1FgA97Lr8EC6XdhxsD4K+oieeccjA
         mJHnWR9B98SZtpINnZPN86cHQpLnKtYOpNnX2otUMFC244JnKMZ1dZdYRio/PYLhtL7j
         mh9gZWWhxPhc5XOJw4qv8ngdostxefGJ6+0vTPHvJDgMuwFCtlncJ7EyR06bFRsM8kPU
         DfiA==
X-Gm-Message-State: AOAM532huOtqUW9Erlldowjj+3MSi5ekFmLvXfChK41Qu5VL3MlMb8kG
        SMeqQMS9b3Kk5MEvAb17kRcwT2wABAVv8rI46R0Piw==
X-Google-Smtp-Source: ABdhPJz7C2nFx3TNGcA2kPWglDXevGlSobY4qQtjsyM80aG5M2q43eLouximDawKJlCzsoXlY0gUTLIt2Xl+j20FnCU=
X-Received: by 2002:aca:44d6:: with SMTP id r205mr3166533oia.172.1616503903973;
 Tue, 23 Mar 2021 05:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210323124112.1229772-1-arnd@kernel.org>
In-Reply-To: <20210323124112.1229772-1-arnd@kernel.org>
From:   Marco Elver <elver@google.com>
Date:   Tue, 23 Mar 2021 13:51:32 +0100
Message-ID: <CANpmjNM8D+yp==DmKP0aa+g6=P38o0v6gd7y5iV52yyDUv91qw@mail.gmail.com>
Subject: Re: [PATCH] kasan: fix hwasan build for gcc
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Alexander Potapenko <glider@google.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, 23 Mar 2021 at 13:41, Arnd Bergmann <arnd@kernel.org> wrote:
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

Reviewed-by: Marco Elver <elver@google.com>

Although I think you need to rebase against either -mm or -next,
because there have been changes to the CONFIG_KASAN_STACK variable.

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
