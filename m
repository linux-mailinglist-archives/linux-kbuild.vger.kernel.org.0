Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 760B437A5B6
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 May 2021 13:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231126AbhEKL2G (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 11 May 2021 07:28:06 -0400
Received: from gate.crashing.org ([63.228.1.57]:44179 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230441AbhEKL2G (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 May 2021 07:28:06 -0400
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 14BBKWcY002034;
        Tue, 11 May 2021 06:20:32 -0500
Received: (from segher@localhost)
        by gate.crashing.org (8.14.1/8.14.1/Submit) id 14BBKKjC002001;
        Tue, 11 May 2021 06:20:20 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date:   Tue, 11 May 2021 06:20:19 -0500
From:   Segher Boessenkool <segher@kernel.crashing.org>
To:     Alexey Kardashevskiy <aik@ozlabs.ru>
Cc:     linuxppc-dev@lists.ozlabs.org,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        clang-built-linux@googlegroups.com,
        Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH kernel v2] powerpc/makefile: Do not redefine $(CPP) for preprocessor
Message-ID: <20210511112019.GK10366@gate.crashing.org>
References: <20210511044812.267965-1-aik@ozlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210511044812.267965-1-aik@ozlabs.ru>
User-Agent: Mutt/1.4.2.3i
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi!

On Tue, May 11, 2021 at 02:48:12PM +1000, Alexey Kardashevskiy wrote:
> --- a/arch/powerpc/kernel/vdso32/Makefile
> +++ b/arch/powerpc/kernel/vdso32/Makefile
> @@ -44,7 +44,7 @@ asflags-y := -D__VDSO32__ -s
>  
>  obj-y += vdso32_wrapper.o
>  targets += vdso32.lds
> -CPPFLAGS_vdso32.lds += -P -C -Upowerpc
> +CPPFLAGS_vdso32.lds += -C
>  
>  # link rule for the .so file, .lds has to be first
>  $(obj)/vdso32.so.dbg: $(src)/vdso32.lds $(obj-vdso32) $(obj)/vgettimeofday.o FORCE

> --- a/arch/powerpc/kernel/vdso64/Makefile
> +++ b/arch/powerpc/kernel/vdso64/Makefile
> @@ -30,7 +30,7 @@ ccflags-y := -shared -fno-common -fno-builtin -nostdlib \
>  asflags-y := -D__VDSO64__ -s
>  
>  targets += vdso64.lds
> -CPPFLAGS_vdso64.lds += -P -C -U$(ARCH)
> +CPPFLAGS_vdso64.lds += -C
>  
>  # link rule for the .so file, .lds has to be first
>  $(obj)/vdso64.so.dbg: $(src)/vdso64.lds $(obj-vdso64) $(obj)/vgettimeofday.o FORCE

Why are you removing -P and -Upowerpc here?  "powerpc" is a predefined
macro on powerpc-linux (no underscores or anything, just the bareword).
This is historical, like "unix" and "linux".  If you use the C
preprocessor for things that are not C code (like the kernel does here)
you need to undefine these macros, if anything in the files you run
through the preprocessor contains those words, or funny / strange / bad
things will happen.  Presumably at some time in the past it did contain
"powerpc" somewhere.

-P is to inhibit line number output.  Whatever consumes the
preprocessor output will have to handle line directives if you remove
this flag.  Did you check if this will work for everything that uses
$(CPP)?

In any case, please mention the reasoning (and the fact that you are
removing these flags!) in the commit message.  Thanks!


Segher
