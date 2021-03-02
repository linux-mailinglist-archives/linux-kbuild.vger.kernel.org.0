Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE7F32B059
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Mar 2021 04:43:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239511AbhCCBhi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Mar 2021 20:37:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378027AbhCBWee (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Mar 2021 17:34:34 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C4BCC06178A
        for <linux-kbuild@vger.kernel.org>; Tue,  2 Mar 2021 14:33:52 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id y12so13173814ljj.12
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Mar 2021 14:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aHp3sOBhNVG2z21fEC5nTsyRiHJNdtFKTVUSbILsbhc=;
        b=ZS/VhMSd3AAuXIJcy+MFcS0NXV1EQ4IYXoq1/6lldjXI/rRvpGh0BThVrxwXFoiX0K
         UKpRi0U2HUmyhBuDuRMlboovXP678k0wC4io8y964qYD2X0/g+vCr/TesHwpqfP/FnSJ
         M0Yo3fDAIt63ruryZtsSlzqSSkuD2jhVmX6OZwYJcBoaOkt3O1ph4vuk1lHJ++IlpKWs
         GtxfKtlHV9zGhqPCGT55XCKT5xu/X/UjhDtfZAcW9bZNDlU/iTXgRbclQZ5y9WcDqbw3
         FLWpNpKEvCguEXvq0990sFhuL1MO5nmysQ2Fhtmjg9zLuQ+12VUDQplLx3oFsdaEzavG
         VOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aHp3sOBhNVG2z21fEC5nTsyRiHJNdtFKTVUSbILsbhc=;
        b=YCc6+12uBlnF/myrFuY8S2vx0WNhJMUUHOWatVm3aCgME2xd/NqA64ZulZ4mya66hU
         d4qGtLa8r1+2QSvA/dp1hRv/987pGPnn0Og7kQEiCzjz9uSLoAxNmS0zGERwajFE+Yx0
         m7TEW58Ws7pBrF4CUKSGKQsKFzYYlP7dFbZt4E9o4YruN9Ja+fdVoI7jQhu6zMX+4jsC
         B9q94z5+STA11K/OZMYlU1AQjm9/ZONi83S3jj4te80nn4qU6+7PsGetrlA1Dhth2C8A
         WsYX5BogWpFKqw79IRcu6U8+Q/ZiojcSmou5C66xDwz2Q2IUv3ZMD/BCgRQU/a1n1yVu
         AiGQ==
X-Gm-Message-State: AOAM532Uv/Wnnppc0er9P3UHHbKpfQJ0cDQ9LcPdD0+iAy1mwj8zCjXr
        snjehsUydPkGY+7IEtssfdpzA747pOQlIT+UuODJfg==
X-Google-Smtp-Source: ABdhPJww/wJF01NlHj2uUUXXZ3qb7y9gB9grBjIx9xxfrcRRhyi/ZmXUTOC8lBxHPcSNgwJlir4Q1+sRJRHe/MT0YoE=
X-Received: by 2002:a2e:b008:: with SMTP id y8mr4382857ljk.233.1614724430576;
 Tue, 02 Mar 2021 14:33:50 -0800 (PST)
MIME-Version: 1.0
References: <20210302210646.3044738-1-nathan@kernel.org>
In-Reply-To: <20210302210646.3044738-1-nathan@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 2 Mar 2021 14:33:38 -0800
Message-ID: <CAKwvOdn42+2bFOMvJpJUuvmM1cj3V6uNEJWfwBWCRFMXtvQfcA@mail.gmail.com>
Subject: Re: [PATCH 1/2] Makefile: Remove '--gcc-toolchain' flag
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 2, 2021 at 1:07 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> This is not necessary anymore now that we specify '--prefix=', which
> tells clang exactly where to find the GNU cross tools. This has been
> verified with self compiled LLVM 10.0.1 and LLVM 13.0.0 as well as a
> distribution version of LLVM 11.1.0 without binutils in the LLVM
> toolchain locations.
>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>

I see this pattern still being used in
arch/arm64/kernel/vdso32/Makefile, but that can be separate cleanups.

> ---
>  Makefile | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index f9b54da2fca0..c20f0ad8be73 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -568,10 +568,6 @@ ifneq ($(CROSS_COMPILE),)
>  CLANG_FLAGS    += --target=$(notdir $(CROSS_COMPILE:%-=%))
>  GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
>  CLANG_FLAGS    += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
> -GCC_TOOLCHAIN  := $(realpath $(GCC_TOOLCHAIN_DIR)/..)
> -endif
> -ifneq ($(GCC_TOOLCHAIN),)
> -CLANG_FLAGS    += --gcc-toolchain=$(GCC_TOOLCHAIN)
>  endif
>  ifneq ($(LLVM_IAS),1)
>  CLANG_FLAGS    += -no-integrated-as
>
> base-commit: 7a7fd0de4a9804299793e564a555a49c1fc924cb
> --
> 2.31.0.rc0.75.gec125d1bc1
>


-- 
Thanks,
~Nick Desaulniers
