Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A06CD30B850
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Feb 2021 08:06:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232447AbhBBHFZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Feb 2021 02:05:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232380AbhBBHFD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Feb 2021 02:05:03 -0500
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DDEBC0613D6;
        Mon,  1 Feb 2021 23:04:23 -0800 (PST)
Received: by mail-io1-xd34.google.com with SMTP id f6so46467ioz.5;
        Mon, 01 Feb 2021 23:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=ch8HiDn9RPP6F97sx8UHBgj1bauCXmdUmArhq8iz8l4=;
        b=fQo6OikdEgR6C2XczWRSA8ZWbZu4d9ec4a3jPo5+kr3OxQ2keebKHgNsWCbNO2F0d7
         KgyDbNp2s8ytbt4bc5Ec/XgwvoeH5CbIG7LWF+6NLTafXjFhsAUVsYuK/Lm+uy+4fVjN
         8KBp9sTrWvxsVdjbK2X6ugOtyysIEWRa9jdNbpffoNGDj91ckXGjqXVXQEThv+H0KMta
         7kVFXza0J5I5cpZA1GGk1BGJQi95BHMqgGz+TajtazL2PZVxpy6NfzIN8UhREJwC4wZG
         6FBDVzC7jf85TVu7WGDmBkE78dQFutvEeUz737MlRQFcgeOCiIEObirBOinYLHQzfer3
         u3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=ch8HiDn9RPP6F97sx8UHBgj1bauCXmdUmArhq8iz8l4=;
        b=ogZIJtWiuOfNVEp7dv5+9QUnZvYu7TLDxcLB2GHo/eglywEFuaLSErhf/HwQaN7WrX
         0V9e9MqcZVvEI/u0vLID3V34F1+Dk7oBBaELcQnO6cwVjXeA/9HnGjIGPImA5K21vUMa
         25Yi2gqEIbQImQefktAdDaygfFfpoA74DPY27oshBvAROJDcARbOKKgD3wQemQegHMrz
         Yh1GLdE+gcmuXeiTv/IZmbW5SliySViPDUBpKXTTuuUXZmiwaIglC0ilDs2rFMvKnOsE
         CqUwVe8O356SvhjzPWyDu2U069nv5pT7YM/KTPdFslK/Z91lHtWz8uXwUbaxMtQULhEW
         xBxw==
X-Gm-Message-State: AOAM5327F55cAPemrvQajtlM5w1rF+WMPhzXBx43BysDlE3y/Pj7roox
        QX+2nCUf+UBmkSfIgX4nZRnfBRIwyrkw3nF/QNR34u/59ls73g==
X-Google-Smtp-Source: ABdhPJy+ZsksyunXUp7b5BB9oTqedYDFbUF8FSiCWLVWw6OiWXOQVFsj/mW0jDaw8d8URzhnK6EHzo/skdcMjXF5YJY=
X-Received: by 2002:a05:6602:1541:: with SMTP id h1mr6411983iow.171.1612249462958;
 Mon, 01 Feb 2021 23:04:22 -0800 (PST)
MIME-Version: 1.0
References: <20210202060604.711160-1-masahiroy@kernel.org>
In-Reply-To: <20210202060604.711160-1-masahiroy@kernel.org>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Tue, 2 Feb 2021 08:04:10 +0100
Message-ID: <CA+icZUVADDyNMhQQwjS9zvkha3ZuKQeZRT41c2Z=fgkPY+i7SQ@mail.gmail.com>
Subject: Re: [PATCH v2] scripts/clang-tools: switch explicitly to Python 3
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Feb 2, 2021 at 7:06 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> For the same reason as commit 51839e29cb59 ("scripts: switch explicitly
> to Python 3"), switch some more scripts, which I tested and confirmed
> working on Python 3.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> Acked-by: Nathan Chancellor <nathan@kernel.org>
> ---
>
> Changes in v2:
>  - Drop the spdxcheck.py change. The same fix exists in linux-next.
>

Link: https://lore.kernel.org/r/20210121085412.265400-1-bert@biot.com

- Sedat -

>  scripts/clang-tools/gen_compile_commands.py | 2 +-
>  scripts/clang-tools/run-clang-tools.py      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
> index 19963708bcf8..8ddb5d099029 100755
> --- a/scripts/clang-tools/gen_compile_commands.py
> +++ b/scripts/clang-tools/gen_compile_commands.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/env python
> +#!/usr/bin/env python3
>  # SPDX-License-Identifier: GPL-2.0
>  #
>  # Copyright (C) Google LLC, 2018
> diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
> index fa7655c7cec0..f754415af398 100755
> --- a/scripts/clang-tools/run-clang-tools.py
> +++ b/scripts/clang-tools/run-clang-tools.py
> @@ -1,4 +1,4 @@
> -#!/usr/bin/env python
> +#!/usr/bin/env python3
>  # SPDX-License-Identifier: GPL-2.0
>  #
>  # Copyright (C) Google LLC, 2020
> --
> 2.27.0
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210202060604.711160-1-masahiroy%40kernel.org.
