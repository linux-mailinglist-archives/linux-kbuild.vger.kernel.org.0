Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE5F236A31E
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Apr 2021 23:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233958AbhDXVOq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 24 Apr 2021 17:14:46 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:55036 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232708AbhDXVOp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 24 Apr 2021 17:14:45 -0400
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 13OLDoUM031351;
        Sun, 25 Apr 2021 06:13:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 13OLDoUM031351
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1619298831;
        bh=3OnUjkY5ajv//Bx4vO1T7kFi9gDr5XvlyfkukgBhE8M=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QHcGgY38MLzXqjy+XVuE/W20vy9QzFQxvpkTeBGkSk1M0rivIN10Urz73YCeS3meL
         skTmYehfrRmgyfQeFWVIfT30FunJZoXfxltEobiLNMPShdTRUkF+LUEXq19mhtvE/o
         vNu5Kl7PZj3v6XToI+6z2PoLqhWYZmNg8PFx+cxhJxOQsaWqKy73bxPQBoXDbwRQwD
         JlZiR0oTCEPvqhD2V/E+yPj+l16tMGQ/vF6gjfSrwbSau16Z91mJ7LfHAcjU66+JfW
         P/8DU/uObzcwSINbNS3uAhYT7rRR2tMAHa3FhFbifHs0h4FVhtn0BgmoeybDSCREGJ
         us+bddLjoQqAw==
X-Nifty-SrcIP: [209.85.215.176]
Received: by mail-pg1-f176.google.com with SMTP id y32so37556763pga.11;
        Sat, 24 Apr 2021 14:13:51 -0700 (PDT)
X-Gm-Message-State: AOAM532WUoYbSLpuJfVP3kijXORcWTU6g/tH7cwXBtxK5IOvG//q14tA
        +jNZwzudLOr3QTM5yC8p9oTq24lzyC8XyzFWSfs=
X-Google-Smtp-Source: ABdhPJyH9gmmhhYlqBrKttzO47kXPH9XC/yWV/ZvhYSXUkxKYpk1zoN97j2v0cXd+U7krYzpYVs6DnLq72QsCFH4irY=
X-Received: by 2002:a63:e1d:: with SMTP id d29mr10258164pgl.175.1619298830397;
 Sat, 24 Apr 2021 14:13:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210422201914.3682494-1-nathan@kernel.org>
In-Reply-To: <20210422201914.3682494-1-nathan@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 25 Apr 2021 06:13:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNATgbzTBCrDaD3HhUQv=W3wLOKq3_iOiKM3CNEB4B=qh6Q@mail.gmail.com>
Message-ID: <CAK7LNATgbzTBCrDaD3HhUQv=W3wLOKq3_iOiKM3CNEB4B=qh6Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Add $(KBUILD_HOSTLDFLAGS) to 'has_libelf' test
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 23, 2021 at 5:19 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Normally, invocations of $(HOSTCC) include $(KBUILD_HOSTLDFLAGS), which
> in turn includes $(HOSTLDFLAGS), which allows users to pass in their own
> flags when linking. However, the 'has_libelf' test does not, meaning
> that if a user requests a specific linker via HOSTLDFLAGS=-fuse-ld=...,
> it is not respected and the build might error.
>
> For example, if a user building with clang wants to use all of the LLVM
> tools without any GNU tools, they might remove all of the GNU tools from
> their system or PATH then build with
>
> $ make HOSTLDFLAGS=-fuse-ld=lld LLVM=1 LLVM_IAS=1
>
> which says use all of the LLVM tools, the integrated assembler, and
> ld.lld for linking host executables. Without this change, the build will
> error because $(HOSTCC) uses its default linker, rather than the one
> requested via -fuse-ld=..., which is GNU ld in clang's case in a default
> configuration.
>
> error: Cannot generate ORC metadata for CONFIG_UNWINDER_ORC=y, please
> install libelf-dev, libelf-devel or elfutils-libelf-devel
> make[1]: *** [Makefile:1260: prepare-objtool] Error 1
>
> Add $(KBUILD_HOSTLDFLAGS) to the 'has_libelf' test so that the linker
> choice is respected.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/479
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---

I applied this since the MW is opening shortly.

However, I believe the right thing to do is
to kill the pointless check entirely.




>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index bc19584fee59..1535b32c8baa 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1092,7 +1092,7 @@ export mod_sign_cmd
>  HOST_LIBELF_LIBS = $(shell pkg-config libelf --libs 2>/dev/null || echo -lelf)
>
>  has_libelf = $(call try-run,\
> -               echo "int main() {}" | $(HOSTCC) -xc -o /dev/null $(HOST_LIBELF_LIBS) -,1,0)
> +               echo "int main() {}" | $(HOSTCC) $(KBUILD_HOSTLDFLAGS) -xc -o /dev/null $(HOST_LIBELF_LIBS) -,1,0)
>
>  ifdef CONFIG_STACK_VALIDATION
>    ifeq ($(has_libelf),1)
>
> base-commit: bf05bf16c76bb44ab5156223e1e58e26dfe30a88
> --
> 2.31.1.362.g311531c9de
>


-- 
Best Regards
Masahiro Yamada
