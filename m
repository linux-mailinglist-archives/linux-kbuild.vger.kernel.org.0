Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 423F12B5DE5
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Nov 2020 12:05:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbgKQLDo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Nov 2020 06:03:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728013AbgKQLDl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Nov 2020 06:03:41 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24753C0613CF;
        Tue, 17 Nov 2020 03:03:41 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Cb32n6sgtz9sPB;
        Tue, 17 Nov 2020 22:03:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1605611018;
        bh=i/svJAZmTk2kg6v8zT8EZqiqZc9UMvNy/3ThMO2UdQw=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=jG5pC4YuW33uG18L63yZsbHQxACl3KCO78X3u18VtCg0KKuCZr+KVTLDo2Ub9EUEj
         PNgGVzUAAi/i4vCExY/qFqVMcWQUwPBO0JyuYFxRc6+iY5KNU0348R+B0VPCsIHRWu
         G8NgVZI1Lr5UEksWNLbNi2gJGnwXFpcURdeOD+jJdgpz5Fj5U/F9G+NN9WzDM0ODe5
         SyMI+hj7/i+dp+164CsgO94BSRdV2TDJKSlO2RQ9xJSd6xLLthleTaYW+USS0NEjdi
         xvFHLObSNrkx6NLKjjzUiYIn/+tszDaiJ1utlNJx3QFN5xi5nSPKFj7+0kTHMyCPwF
         uUd0dRKrBbrow==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Nathan Chancellor <natechancellor@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Kees Cook <keescook@chromium.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH 1/2] kbuild: Hoist '--orphan-handling' into Kconfig
In-Reply-To: <20201113195553.1487659-1-natechancellor@gmail.com>
References: <20201113195553.1487659-1-natechancellor@gmail.com>
Date:   Tue, 17 Nov 2020 22:03:29 +1100
Message-ID: <87tuto2qke.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Nathan Chancellor <natechancellor@gmail.com> writes:
> Currently, '--orphan-handling=warn' is spread out across four different
> architectures in their respective Makefiles, which makes it a little
> unruly to deal with in case it needs to be disabled for a specific
> linker version (in this case, ld.lld 10.0.1).
>
> To make it easier to control this, hoist this warning into Kconfig and
> the main Makefile so that disabling it is simpler, as the warning will
> only be enabled in a couple places (main Makefile and a couple of
> compressed boot folders that blow away LDFLAGS_vmlinx) and making it
> conditional is easier due to Kconfig syntax. One small additional
> benefit of this is saving a call to ld-option on incremental builds
> because we will have already evaluated it for CONFIG_LD_ORPHAN_WARN.
>
> To keep the list of supported architectures the same, introduce
> CONFIG_ARCH_WANT_LD_ORPHAN_WARN, which an architecture can select to
> gain this automatically after all of the sections are specified and size
> asserted. A special thanks to Kees Cook for the help text on this
> config.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1187
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  Makefile                          | 6 ++++++
>  arch/Kconfig                      | 9 +++++++++
>  arch/arm/Kconfig                  | 1 +
>  arch/arm/Makefile                 | 4 ----
>  arch/arm/boot/compressed/Makefile | 4 +++-
>  arch/arm64/Kconfig                | 1 +
>  arch/arm64/Makefile               | 4 ----
>  arch/powerpc/Kconfig              | 1 +
>  arch/powerpc/Makefile             | 1 -

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)


>  arch/x86/Kconfig                  | 1 +
>  arch/x86/Makefile                 | 3 ---
>  arch/x86/boot/compressed/Makefile | 4 +++-
>  init/Kconfig                      | 3 +++
>  13 files changed, 28 insertions(+), 14 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 008aba5f1a20..c443afd61886 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -984,6 +984,12 @@ ifeq ($(CONFIG_RELR),y)
>  LDFLAGS_vmlinux	+= --pack-dyn-relocs=relr
>  endif
>  
> +# We never want expected sections to be placed heuristically by the
> +# linker. All sections should be explicitly named in the linker script.
> +ifeq ($(CONFIG_LD_ORPHAN_WARN),y)
> +LDFLAGS_vmlinux += --orphan-handling=warn
> +endif

This is a nit, but you can use ifdef with bool CONFIG symbols in
Makefiles, which reads a bit nicer, eg:

ifdef CONFIG_LD_ORPHAN_WARN
LDFLAGS_vmlinux += --orphan-handling=warn
endif


cheers
