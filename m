Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D3C01BD039
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2020 00:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbgD1WyG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 28 Apr 2020 18:54:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726565AbgD1WyG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 Apr 2020 18:54:06 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0484C03C1AE
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Apr 2020 15:54:05 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id o185so60114pgo.3
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Apr 2020 15:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xdhVxVxjCVp6Qqe+xTFCZZzPWjQcwdRMhEMU3zXTXbM=;
        b=lZDn8hOpe6Orx5vNl0ApTSLRwJXULDkC6rY168+BbIR13IuGkIm6Bjp2a9BydV+OJQ
         NAjXXsgxk0wGFTKvp/IiW3Q4BCCsNkDftSdqVoQgSax/kgjal9/7NI9TBFZJ6CzOddDE
         yiJu2Z2IXUyYleZSCtekQITAqGsHikQbBV99DwAoFKbyd5IVP1QYet+YRMbtZVFGCbpm
         ZplOgxABlp5Pc97RJRDWA6xX36nup+lzOPgY+k6Tv7P88b0sPaqJ7XPWDCQWuftjN87K
         cm8iAoJOCGcJaUH4URp1Hs+X2+9+TYQ0YqUR0iHWUZ0rtJIUj6Uq+XxL1WZSil02tDuK
         a7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xdhVxVxjCVp6Qqe+xTFCZZzPWjQcwdRMhEMU3zXTXbM=;
        b=lN46NCSGG3tSYdDkxzedzkGwLT6UeiQtGYYogLO90SY7yJ+wNH5GiPH0Q+47LNyzjv
         d9ccuWrqWWgeZ2DhMtockh3sUT+tiIlVaGPBhBHZH7l+DTS7+3CZ5rSHRPE6zwW6zuHv
         /7DQ5fIzNgw6YZHLkSAW/83bp3aTu/F1XwX4g69JOCW9mCihnDjVL0JTi0O1EMdhNtKZ
         ufYJ+XNiThi0SdtoH6XxvXSs1/6aDicJ76jXCVI2l7E75gETSIfsXLI0TRaTrzvyywkV
         Jx5hXDASmCQRgoctzEeZ9w0PD1/QTK8C8wmlOqFswmdPywtzO0zJCGRWYKzBtvnYHfPn
         Y/jg==
X-Gm-Message-State: AGi0PuZIxyL0t/UdYCb5nTYWT1+szDb7BXgDkmpR7SIs7kyGMsTafzIT
        kFY4kPWFA5H/ccV0UgGWkM+rLQ==
X-Google-Smtp-Source: APiQypJNucB0GAu1iaDS0cUINfCTVxRJEvfFFcvSDOLx2zmaCo8f+iE0QAo5svuV0Mv1rpNmPMI3PQ==
X-Received: by 2002:a63:a35e:: with SMTP id v30mr5973904pgn.134.1588114444821;
        Tue, 28 Apr 2020 15:54:04 -0700 (PDT)
Received: from google.com ([2620:15c:2ce:0:9efe:9f1:9267:2b27])
        by smtp.gmail.com with ESMTPSA id p2sm13799090pgh.25.2020.04.28.15.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 15:54:04 -0700 (PDT)
Date:   Tue, 28 Apr 2020 15:54:01 -0700
From:   Fangrui Song <maskray@google.com>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Dmitry Golovin <dima@golovin.in>,
        Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: [PATCH v4 4/5] MIPS: VDSO: Use $(LD) instead of $(CC) to link
 VDSO
Message-ID: <20200428225401.7yrld7u2xr67t4xf@google.com>
References: <20200423171807.29713-1-natechancellor@gmail.com>
 <20200428221419.2530697-1-natechancellor@gmail.com>
 <20200428221419.2530697-5-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200428221419.2530697-5-natechancellor@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


On 2020-04-28, Nathan Chancellor wrote:
>Currently, the VDSO is being linked through $(CC). This does not match
>how the rest of the kernel links objects, which is through the $(LD)
>variable.
>
>When clang is built in a default configuration, it first attempts to use
>the target triple's default linker then the system's default linker,
>unless told otherwise through -fuse-ld=... We do not use -fuse-ld=
>because it can be brittle and we have support for invoking $(LD)
>directly. See commit fe00e50b2db8c ("ARM: 8858/1: vdso: use $(LD)
>instead of $(CC) to link VDSO") and commit 691efbedc60d2 ("arm64: vdso:
>use $(LD) instead of $(CC) to link VDSO") for examples of doing this in
>the VDSO.
>
>Do the same thing here. Replace the custom linking logic with $(cmd_ld)
>and ldflags-y so that $(LD) is respected. We need to explicitly add two
>flags to the linker that were implicitly passed by the compiler:
>-G 0 (which comes from ccflags-vdso) and --eh-frame-hdr.
>
>Before this patch (generated by adding '-v' to VDSO_LDFLAGS):
>
><gcc_prefix>/libexec/gcc/mips64-linux/9.3.0/collect2 \
>-plugin <gcc_prefix>/libexec/gcc/mips64-linux/9.3.0/liblto_plugin.so \
>-plugin-opt=<gcc_prefix>/libexec/gcc/mips64-linux/9.3.0/lto-wrapper \
>-plugin-opt=-fresolution=/tmp/ccGEi5Ka.res \
>--eh-frame-hdr \
>-G 0 \
>-EB \
>-mips64r2 \
>-shared \
>-melf64btsmip \
>-o arch/mips/vdso/vdso.so.dbg.raw \
>-L<gcc_prefix>/lib/gcc/mips64-linux/9.3.0/64 \
>-L<gcc_prefix>/lib/gcc/mips64-linux/9.3.0 \
>-L<gcc_prefix>/lib/gcc/mips64-linux/9.3.0/../../../../mips64-linux/lib \
>-Bsymbolic \
>--no-undefined \
>-soname=linux-vdso.so.1 \
>-EB \
>--hash-style=sysv \
>--build-id \
>-T arch/mips/vdso/vdso.lds \
>arch/mips/vdso/elf.o \
>arch/mips/vdso/vgettimeofday.o \
>arch/mips/vdso/sigreturn.o
>
>After this patch:
>
><gcc_prefix>/bin/mips64-linux-ld \
>-m elf64btsmip \
>-Bsymbolic \
>--no-undefined \
>-soname=linux-vdso.so.1 \
>-EB \
>-nostdlib \
>-shared \
>-G 0 \
>--eh-frame-hdr \
>--hash-style=sysv \
>--build-id \
>-T  arch/mips/vdso/vdso.lds \
>arch/mips/vdso/elf.o \
>arch/mips/vdso/vgettimeofday.o
>arch/mips/vdso/sigreturn.o \
>-o arch/mips/vdso/vdso.so.dbg.raw
>
>Note that we leave behind -mips64r2. Turns out that ld ignores it (see
>get_emulation in ld/ldmain.c). This is true of current trunk and 2.23,
>which is the minimum supported version for the kernel:
>
>https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=ld/ldmain.c;hb=aa4209e7b679afd74a3860ce25659e71cc4847d5#l593
>https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=ld/ldmain.c;hb=a55e30b51bc6227d8d41f707654d0a5620978dcf#l641
>
>Before this patch, LD=ld.lld did nothing:
>
>$ llvm-readelf -p.comment arch/mips/vdso/vdso.so.dbg | sed 's/(.*//'
>String dump of section '.comment':
>[     0] ClangBuiltLinux clang version 11.0.0
>
>After this patch, it does:
>
>$ llvm-readelf -p.comment arch/mips/vdso/vdso.so.dbg | sed 's/(.*//'
>String dump of section '.comment':
>[     0] Linker: LLD 11.0.0
>[    62] ClangBuiltLinux clang version 11.0.0
>
>Link: https://github.com/ClangBuiltLinux/linux/issues/785
>Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
>---
>
>v3 -> v4:
>
>* Improve commit message to show that ld command is effectively the
>  same as the one generated by GCC.
>
>* Add '-G 0' and '--eh-frame-hdr' because they were added by GCC.

My understanding is that we start to use more -fasynchronous-unwind-tables to eliminate .eh_frame in object files.
Without .eh_frame, LD --eh-frame-hdr is really not useful.


Sigh...  -G 0. This is an option ignored by LLD. GCC devs probably should
have used the long option --gpsize rather than take the short option -G.
Even better, -z gpsize= or similar if this option is specific to ELF.

>v2 -> v3:
>
>* New patch.
>
> arch/mips/vdso/Makefile | 13 ++++---------
> 1 file changed, 4 insertions(+), 9 deletions(-)
>
>diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
>index 92b53d1df42c3..2e64c7600eead 100644
>--- a/arch/mips/vdso/Makefile
>+++ b/arch/mips/vdso/Makefile
>@@ -60,10 +60,9 @@ ifdef CONFIG_MIPS_DISABLE_VDSO
> endif
>
> # VDSO linker flags.
>-VDSO_LDFLAGS := \
>-	-Wl,-Bsymbolic -Wl,--no-undefined -Wl,-soname=linux-vdso.so.1 \
>-	$(addprefix -Wl$(comma),$(filter -E%,$(KBUILD_CFLAGS))) \
>-	-nostdlib -shared -Wl,--hash-style=sysv -Wl,--build-id
>+ldflags-y := -Bsymbolic --no-undefined -soname=linux-vdso.so.1 \
>+	$(filter -E%,$(KBUILD_CFLAGS)) -nostdlib -shared \
>+	-G 0 --eh-frame-hdr --hash-style=sysv --build-id -T
>
> CFLAGS_REMOVE_vdso.o = -pg
>
>@@ -82,11 +81,7 @@ quiet_cmd_vdso_mips_check = VDSOCHK $@
> #
>
> quiet_cmd_vdsold_and_vdso_check = LD      $@
>-      cmd_vdsold_and_vdso_check = $(cmd_vdsold); $(cmd_vdso_check); $(cmd_vdso_mips_check)
>-
>-quiet_cmd_vdsold = VDSO    $@
>-      cmd_vdsold = $(CC) $(c_flags) $(VDSO_LDFLAGS) \
>-                   -Wl,-T $(filter %.lds,$^) $(filter %.o,$^) -o $@
>+      cmd_vdsold_and_vdso_check = $(cmd_ld); $(cmd_vdso_check); $(cmd_vdso_mips_check)
>
> quiet_cmd_vdsoas_o_S = AS      $@
>       cmd_vdsoas_o_S = $(CC) $(a_flags) -c -o $@ $<
>-- 
>2.26.2
>
