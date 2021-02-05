Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC3353113C6
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Feb 2021 22:46:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231699AbhBEVpx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Feb 2021 16:45:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232748AbhBEVpk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Feb 2021 16:45:40 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DC17C06174A
        for <linux-kbuild@vger.kernel.org>; Fri,  5 Feb 2021 13:44:59 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id m22so11955774lfg.5
        for <linux-kbuild@vger.kernel.org>; Fri, 05 Feb 2021 13:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XsbuJM9sF8LMh+2PIYZcanGAWJaYjpFJ9kTMXGBhvxw=;
        b=F5jyzMKui4wZBfF1J60bgf+A7lVcbglMLEdaDcNc433j49B9KMNwOzGSEFpOH04Ads
         DGf+7QuvLAwPTjg4/ZRKbEAOAhsXhwKLz01G3BedZkP/oEmCxQY4b8TRQn/3638dKlXy
         tXtO+ORcmubYd71UREljQawwVv66a2d8BHc0FoW8chwffmjzdT4E+Eq8JlIen73plHVW
         GNryaHuibOo63buk5s366UHzc0LmYdBt9M+dqQ9WQHBv36nzSB9JG+cv1wQtHORzQ5RJ
         yHZggmPb9AoxmyKluZ/0gzLmiaCdgaE6uwd2vDWn+D0Iup4ixHHbl6vIMs4B4aWqg74p
         QICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XsbuJM9sF8LMh+2PIYZcanGAWJaYjpFJ9kTMXGBhvxw=;
        b=Qd74+gyCG3qfSFSQeqbjGpJ6QGm2Iy3vjzvHwOeHhaj+aZLvz3mGFJrR4Kliji6gdA
         F5EMOVHEl/yRIKSLLXBLW5CP2e9GY4rQhSHfZY2wy7NhzldGfWQY24d07a1A3b6dWeM1
         t6DC/3wRK6/5btbBsuTa5fehaZHweNWci+JV9J3zePGm0VAKzux/GGLf1qDIrrcFbUcR
         jZI3dySI7YhT6wVG02guT1ugYPUcXVCrcukjj3Ryn0HKoeBUdE4YSTsM4OKlXr1dBjNi
         Ieib58n/187eUz64iG8oeLiGkQWriAlrNrBcZBkCgO6q3p+T9tV6YgvBTgbMT4qwums8
         RikA==
X-Gm-Message-State: AOAM5308UusZfhpkJrjLyDaxNYmbjgtPHst9gw16AqUIg7NVSjQJCGOz
        88x9q/luV3L5jC6pEItQVTCbX9q5m6B/ryQ8NCZgLA==
X-Google-Smtp-Source: ABdhPJxohx8plN1mO6lnzh3vQrSXDcBIrLEGG/Q0NqWeOluo8U2IKELwp2WPdhfv12rp8VX6x9o6Y9gV1PL2+KE00o0=
X-Received: by 2002:a2e:8541:: with SMTP id u1mr3940752ljj.0.1612561497332;
 Fri, 05 Feb 2021 13:44:57 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUUjb_71mWwWFMYN_OPZir2vStLq1kDY1O+JCFjtmEEBjA@mail.gmail.com>
 <20210205213651.GA16907@Ryzen-5-4500U.localdomain>
In-Reply-To: <20210205213651.GA16907@Ryzen-5-4500U.localdomain>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 5 Feb 2021 13:44:44 -0800
Message-ID: <CAKwvOdk8vp5z71pQHG04REENSy15Z3DvY1MehS_GGVxnhXx_cg@mail.gmail.com>
Subject: Re: Using GNU AS from a selfmade binutils v2.35.2
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Sedat Dilek <sedat.dilek@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 5, 2021 at 1:37 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> It is entirely possible that '--prefix=' should always be present though:
>
> diff --git a/Makefile b/Makefile
> index f5842126e89d..409822f45bfd 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -562,10 +562,10 @@ endif
>  ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
>  ifneq ($(CROSS_COMPILE),)
>  CLANG_FLAGS    += --target=$(notdir $(CROSS_COMPILE:%-=%))
> +endif
>  GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
>  CLANG_FLAGS    += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
>  GCC_TOOLCHAIN  := $(realpath $(GCC_TOOLCHAIN_DIR)/..)
> -endif
>  ifneq ($(GCC_TOOLCHAIN),)
>  CLANG_FLAGS    += --gcc-toolchain=$(GCC_TOOLCHAIN)
>  endif

I'm unsure. Consider the case where I'm building with `LLVM=1
LLVM_IAS=1 CROSS_COMPILE=aarch64-linux-gnu`, ie. no GNU binutils and
am cross compiling.  In that case, we should not be setting any
--prefix or --gcc-toolchain, and yet today we are.  Perhaps that is
orthogonal though?
-- 
Thanks,
~Nick Desaulniers
