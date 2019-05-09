Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86A85185C6
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 May 2019 09:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbfEIHIN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 May 2019 03:08:13 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36059 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbfEIHIN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 03:08:13 -0400
Received: by mail-wm1-f67.google.com with SMTP id j187so1696577wmj.1;
        Thu, 09 May 2019 00:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=+JOrLqUHtbdGmjNwbWJ1kYriu6LOEscnnflNAnMNam4=;
        b=iqzPXIyX4DxG9SwiCeeBm48s1axEx8WQvArG2LZUllfkGLRt53n05tqMzCzuPGEWJT
         97A0CHufyqKdfVmaKoPuDVTGtOiBflrL6xP/eI0EHHRsF82pjimaP3KwTivHWRssx0KN
         5Tja9iCo1xlz+pfBFTv/I0DXM9OAa8fjqNWDxc34PIeFjAXy4wRadzuf2HkIBabTEdBM
         g0K31faLRl9NxlW/ko7aMHOxztZWtKlMFU+HOtcUL/UwNuAQ4wFNwX0wYlnp7pz2SE5P
         GnTW1i+OaPHA2I3mnWmXTpSfuCCjGRxQIm5Aerk8mts+bKwAemDy7gRwF0CbLxC9vjk5
         KvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=+JOrLqUHtbdGmjNwbWJ1kYriu6LOEscnnflNAnMNam4=;
        b=Tx7Eq/ohqdExcUqe1dAyfqQ1bTriDcKcGMM6XqOpkY9gsJiW94jfiMbmhYN+9pjNLK
         FCiNlR0Jla8R6Y9aH9gwaLU6JYIrzeCIvjSk1MM7ohOHNXUBIkJDPgVOQoc0VvVLdVjq
         SXtK2zF9V0L2M/C80Ck/LxMcZSVXuSkeLMzOPTcQaQKcy1zvT680vvauNBUyDvqjjoOc
         JwyHTND6pksEgfNH4DnOQZqrodWAB/nUOtdIULSm4rHIWESG17958scFXIBHY8DwJOq2
         hIKwMSgblsPm5aQvDXgs1tsNR9bJ68JKyf5BmezPsbdEGdUOCPoXNBN1OqYET9v+Ngs6
         /WSg==
X-Gm-Message-State: APjAAAXDLGVxu65ZAWQ5OzqVus92ky8DJHlgIB3VJzBvheW5/29PPvJw
        NGm7uOCRclG2afJGYRFxVaLP8jIKS93NdSl/3y0=
X-Google-Smtp-Source: APXvYqw6s2zkJ7rv3Hf0YWguHDWrt34GzGW72V6Wm0pRY9+4M3H1zplAXFFScgo6ysLaEG324UeVSFx3nF2G0Vt6ifU=
X-Received: by 2002:a1c:a008:: with SMTP id j8mr1573477wme.73.1557385691165;
 Thu, 09 May 2019 00:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190509064549.1302-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190509064549.1302-1-yamada.masahiro@socionext.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Thu, 9 May 2019 09:07:59 +0200
Message-ID: <CA+icZUUB7EZhzfjoQcLLbSy8t=RroWNWSdMdzbvAje2wdXtJ=g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add -Wvla flag unconditionally
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 9, 2019 at 8:46 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> This flag is documented in the GCC 4.6 manual, and recognized by
> Clang as well. Let's rip off the cc-option switch.
>

[ CC Kees who did the VLA removal/cleanup ]

Looks good to me.

Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>

> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index c71ffb6f55b5..3f5e8a0f4561 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -841,7 +841,7 @@ NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
>  KBUILD_CFLAGS += -Wdeclaration-after-statement
>
>  # Variable Length Arrays (VLAs) should not be used anywhere in the kernel
> -KBUILD_CFLAGS += $(call cc-option,-Wvla)
> +KBUILD_CFLAGS += -Wvla
>
>  # disable pointer signed / unsigned warnings in gcc 4.0
>  KBUILD_CFLAGS += -Wno-pointer-sign
> --
> 2.17.1
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To post to this group, send email to clang-built-linux@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20190509064549.1302-1-yamada.masahiro%40socionext.com.
> For more options, visit https://groups.google.com/d/optout.
