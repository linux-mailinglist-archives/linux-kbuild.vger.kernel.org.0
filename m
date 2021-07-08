Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B38B3BF949
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Jul 2021 13:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231660AbhGHLrv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Jul 2021 07:47:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:39872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231628AbhGHLrv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Jul 2021 07:47:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B0B161621;
        Thu,  8 Jul 2021 11:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625744709;
        bh=eZBKe/AE3k2Idpe/yBgtZmT86HN/n74i8indY31fu+Y=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=biSn9xXdm195FlJIIP9CbMlBVPw6YSf28Xeb/NlKNwhwfpjZIFc94YzXPcG3kH9pg
         jqkl7HOf4banPoE/bdoaWEw+RAGxwXFENv9Trp9U+BC/dLRe0pIx/aE1CAauXCYlMX
         rl04moSbvHie/Ie2ZqFHmWamLge5Fw1OeUSIe+ynF23o0ko9LIMJLuoErwUAoAfbxy
         Hx0x9q7368ES3ock3k2TE+ybVEz9B/aNv/zbmviiys9gvByienVlj9MkUXcPRrz/J0
         0I0fg4p7U0WcJToH1yQyg5M1ieTMCCz0n13uTPGgaWdC12CQcS+H+/Ddi+1EuMk/Qj
         POHAjzQBFEVIw==
Received: by mail-wr1-f42.google.com with SMTP id i8so7104320wrp.12;
        Thu, 08 Jul 2021 04:45:09 -0700 (PDT)
X-Gm-Message-State: AOAM530KMC+7CATb4YVuqXSlZ3xPj7vGTBlfQ+2WIzmf+VJZ9YS5tv5e
        l7PWeSedHwpCo3zu9GuDt3OToJyDsNHAS4ro46g=
X-Google-Smtp-Source: ABdhPJwTsN6jaswrfsq9u1aI/abGeIi1wl/6hV6uQpSlnG4VEomSksDc2Yyee8kX88ih4MGSkbJsPOrfiApd7vrWZUQ=
X-Received: by 2002:adf:e107:: with SMTP id t7mr34238667wrz.165.1625744708010;
 Thu, 08 Jul 2021 04:45:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210707224310.1403944-1-ndesaulniers@google.com>
 <20210707224310.1403944-3-ndesaulniers@google.com> <CAK7LNAR66iE0w4bjpMVEz6W==mnc59MEnRWm1MXrqApP0aE4Qw@mail.gmail.com>
In-Reply-To: <CAK7LNAR66iE0w4bjpMVEz6W==mnc59MEnRWm1MXrqApP0aE4Qw@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 8 Jul 2021 13:44:52 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1MW9hYzDT-iL4CpwaJ5NUuQODT3XgheocrnF7496GKFw@mail.gmail.com>
Message-ID: <CAK8P3a1MW9hYzDT-iL4CpwaJ5NUuQODT3XgheocrnF7496GKFw@mail.gmail.com>
Subject: Re: [PATCH 2/2] Makefile: drop CROSS_COMPILE for LLVM=1 LLVM_IAS=1
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jul 8, 2021 at 12:23 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> On Thu, Jul 8, 2021 at 7:43 AM 'Nick Desaulniers' via Clang Built
>
> We must rely on this behavior of Clang because
> --target (which is contained in CLANG_FLAGS)
> must be specified before the Kconfig time.
> Then, a user can toggle CONFIG_64BIT any time
> from menuconfig etc.
>
> With this in mind, using $(ARCH) as if-else
> switches is pointless.
> $(SRCARCH) is the only meaningful input.
>
>
>   else ifeq ($(ARCH),i386)
>   CLANG_FLAGS    += --target=i686-linux-gnu
>   else ifeq ($(ARCH),x86)
>   CLANG_FLAGS    += --target=x86_64-linux-gnu
>   else ifeq ($(ARCH),x86_64)
>   CLANG_FLAGS    += --target=x86_64-linux-gnu
>
> should be replaced with:
>
>   else ifeq ($(SRCARCH),x86_64)
>   CLANG_FLAGS    += --target=x86_64-linux-gnu

I think we usually only have to provide the architecture
name, as in "--target=x86_64", though for arm I get a
warning "clang: warning: unknown platform, assuming
-mfloat-abi=soft" unless I provide the full triple.

> For example for ARCH=arm, which is better
> --target=arm-linux-gnueabi or
> --target=arm-lnux-gnueabihf or something we don't care about?

The kernel is always soft-float itself, so it does not matter either way.

       Arnd
