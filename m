Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FDFF1BABB2
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Apr 2020 19:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726226AbgD0Rvo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 Apr 2020 13:51:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726162AbgD0Rvo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Apr 2020 13:51:44 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 031F4C0610D5
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Apr 2020 10:51:42 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id w3so7270511plz.5
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Apr 2020 10:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dJ17v9H467897ZVwuE0ureLW7wDRPRyU689O1y5ZV5A=;
        b=XjRzckfvIvP0s0WPToecVrTWvFlp5f+I3xVuru1I+sl4sz0Jw5QF5XRaH18XAfmaFe
         arz4IxhBOZd9LFFZ+YKUjHAKubh4tQObKMUB4DItRgzf+DxyCrI1xaOVQnOAjfQ/3GyY
         UoEa6EryFeOyn+6CPo14hxqgKRFjDzLcmQTwn9lT8YFtbhB1z5/SYmP9wlelEM4QRA/P
         90bdeKi2wbH85X5bafyfXXQhGaIp+W+mX5+oeKNXe/lovhWiouqqaefLHN9mhiaI28vd
         hi4L4RVgg5PU/SN7kSSDmAV/3T8v2q5WyEqMWZHsenS70QIWNmls+5KvbkvQcj4JzWc/
         19Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dJ17v9H467897ZVwuE0ureLW7wDRPRyU689O1y5ZV5A=;
        b=gBPDXFtXZlX7d7e/wL731WYjDkLtTfksLOALqqlxIc1Cjit3uqTSRdbfE/MhZ0rv/B
         y2KD6A26BsVmAeRlz5H8Ya9GNfCgO2dhLy6yEJEXBsv9XSs8JHxoktx9h7+k/C/qtlaW
         DLGoqci9nwIX0/MXtgJaBEDrPaN20pruy5ZO8dO+fzJjxdTWArqCmKArBKocz59JoInq
         h86pg4Ibw6yov7kzADpuD9inotWkl5C2ktOfsVWjc/hiDRfhQaAfB3MVj/2M7D3KYu2L
         QTpZco00W7KUy5IFqL2vap46rBlI93XuMc29daXUq+pSBtBrpZoElIk5D3qtyJeGiDw8
         +96Q==
X-Gm-Message-State: AGi0PuaqWpGBRwVjWYYurhh/M8J8t0Bi7Xg4zIjmDuJT0bHdOVeCioeh
        eCETS+7IfmKykczaE7jJgUxa9MyI6SiLzGXNSs8Pig==
X-Google-Smtp-Source: APiQypIph5UQ7zAXbug0H0w8INlnKV1E/F5QgE60ll0GfOaIYravv9zQJ6Q2AapFCP7S6ERPg62h6IPV9xznjSXLGv4=
X-Received: by 2002:a17:902:ac87:: with SMTP id h7mr23322320plr.119.1588009902182;
 Mon, 27 Apr 2020 10:51:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200425060640.823362-1-masahiroy@kernel.org>
In-Reply-To: <20200425060640.823362-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 27 Apr 2020 10:51:31 -0700
Message-ID: <CAKwvOd=0hnjUh9eZFVJhQc4-7dq+T0c9BGEd7UM-dDXVehqOeQ@mail.gmail.com>
Subject: Re: [PATCH] unicore32: do not evaluate compiler's library path when cleaning
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Guan Xuetao <gxt@pku.edu.cn>,
        Nathan Chancellor <natechancellor@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 24, 2020 at 11:07 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Since commit a83e4ca26af8 ("kbuild: remove cc-option switch from
> -Wframe-larger-than="), 'make ARCH=unicore32 clean' emits error
> messages as follows:
>
>   $ make ARCH=unicore32 clean
>   gcc: error: missing argument to '-Wframe-larger-than='
>   gcc: error: missing argument to '-Wframe-larger-than='
>
> We do not care compiler flags when cleaning.
>
> Use the '=' operator for lazy expansion because we do not use
> GNU_LIBC_A or GNU_LIBGCC_A when cleaning.

So many assignment operators!
https://www.gnu.org/software/make/manual/html_node/Setting.html
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Fixes: a83e4ca26af8 ("kbuild: remove cc-option switch from -Wframe-larger-than=")
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/unicore32/lib/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/unicore32/lib/Makefile b/arch/unicore32/lib/Makefile
> index 098981a01841..5af06645b8f0 100644
> --- a/arch/unicore32/lib/Makefile
> +++ b/arch/unicore32/lib/Makefile
> @@ -10,12 +10,12 @@ lib-y       += strncpy_from_user.o strnlen_user.o
>  lib-y  += clear_user.o copy_page.o
>  lib-y  += copy_from_user.o copy_to_user.o
>
> -GNU_LIBC_A             := $(shell $(CC) $(KBUILD_CFLAGS) -print-file-name=libc.a)
> +GNU_LIBC_A             = $(shell $(CC) $(KBUILD_CFLAGS) -print-file-name=libc.a)
>  GNU_LIBC_A_OBJS                := memchr.o memcpy.o memmove.o memset.o
>  GNU_LIBC_A_OBJS                += strchr.o strrchr.o
>  GNU_LIBC_A_OBJS                += rawmemchr.o                  # needed by strrchr.o
>
> -GNU_LIBGCC_A           := $(shell $(CC) $(KBUILD_CFLAGS) -print-file-name=libgcc.a)
> +GNU_LIBGCC_A           = $(shell $(CC) $(KBUILD_CFLAGS) -print-file-name=libgcc.a)
>  GNU_LIBGCC_A_OBJS      := _ashldi3.o _ashrdi3.o _lshrdi3.o
>  GNU_LIBGCC_A_OBJS      += _divsi3.o _modsi3.o _ucmpdi2.o _umodsi3.o _udivsi3.o
>
> --
> 2.25.1
>


-- 
Thanks,
~Nick Desaulniers
