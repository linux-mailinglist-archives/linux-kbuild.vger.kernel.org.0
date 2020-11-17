Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0C192B69F5
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Nov 2020 17:22:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727265AbgKQQW2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Nov 2020 11:22:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727235AbgKQQW1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Nov 2020 11:22:27 -0500
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FC5BC0613CF;
        Tue, 17 Nov 2020 08:22:27 -0800 (PST)
Received: by mail-qk1-x743.google.com with SMTP id v143so20944512qkb.2;
        Tue, 17 Nov 2020 08:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9JS/uYKk8GrJCTbc2FAe05O+XJ9e/pB4+Xwp7tXwPZ0=;
        b=aJlDOBsATEWSe1rlycoHMeV4ei94yuVwrrm65Xysp4oVHYz7irZb27aTwZ7IgeMrMO
         rwVNaVpE25sjKuSTnOO7NmkzBWOBSTx4fb3R/DCWK4SogrXa2AC7enZkjLsyuNjXxuvM
         NTnekDgslWYIalrCbTxJ86SdaNtQP3cHwjrypdeVUFonoFUCuScqV6kG/ZkGwOFtl6yH
         GGnqDGXXV/Rp0vgelpRy+c9ngWmBiSSV1q/ABKAKx6pMiIrVNRaIq9LBAGHm9r1XHYPX
         JJd8Mz5c3TX5hRrGoRqUPlThTtb3gM5hidlGyqicc9LqyBTLzcNk5GjMNiGQAYvcDs09
         OmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9JS/uYKk8GrJCTbc2FAe05O+XJ9e/pB4+Xwp7tXwPZ0=;
        b=jIWr4prY5Tkb16Q2zqWthSJ1cFELIbXYuBlUBYbfALNAxmVEvM7X04EGUW1ltfLR71
         NV6SzL+TFLhBAvy/OTs9fA19gkrM5d7bvf/VdMnj7i9dilIHscOoGhI1Z1MeAOGFjGQ3
         Og54KMZFxkGriMBdgcdk4R3B+ZhjDApgqvrG9PVnkXglMDInXH2IbThSGT+1NCDn4Y7l
         BopOjqFZ+hvyaaGSCL4gNDX33wPa8TvJxTK7WLHCDnGYW7ICdxiEIydbxk8USia3hkIk
         5RT1D2r1jQ9kKTEIpnJEYdY97stxMuew5Au6k5/9qcyCyZcLZH5s0t3CaFtJYtwebaiD
         W0iQ==
X-Gm-Message-State: AOAM533eyOx2KFvZTNATDVjb4ryKQ6CHz3p058VmFiUk3ZPZHFbP/dH/
        ztksbbhm86edvlPvKV14DzOkKfC8ZMdCyQ==
X-Google-Smtp-Source: ABdhPJxFV05KKJ6XDlOOAOJnsbl9Wf8WKTjRzQrKCSJ0EvUBlKv7/HeKNXgdCIuMoNy2WooiBd+UYw==
X-Received: by 2002:a37:8542:: with SMTP id h63mr366329qkd.102.1605630146479;
        Tue, 17 Nov 2020 08:22:26 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
        by smtp.gmail.com with ESMTPSA id v16sm15074576qka.72.2020.11.17.08.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 08:22:25 -0800 (PST)
Date:   Tue, 17 Nov 2020 09:22:23 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Kees Cook <keescook@chromium.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH 1/2] kbuild: Hoist '--orphan-handling' into Kconfig
Message-ID: <20201117162223.GA1428250@ubuntu-m3-large-x86>
References: <20201113195553.1487659-1-natechancellor@gmail.com>
 <87tuto2qke.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tuto2qke.fsf@mpe.ellerman.id.au>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Nov 17, 2020 at 10:03:29PM +1100, Michael Ellerman wrote:
> Nathan Chancellor <natechancellor@gmail.com> writes:
> > Currently, '--orphan-handling=warn' is spread out across four different
> > architectures in their respective Makefiles, which makes it a little
> > unruly to deal with in case it needs to be disabled for a specific
> > linker version (in this case, ld.lld 10.0.1).
> >
> > To make it easier to control this, hoist this warning into Kconfig and
> > the main Makefile so that disabling it is simpler, as the warning will
> > only be enabled in a couple places (main Makefile and a couple of
> > compressed boot folders that blow away LDFLAGS_vmlinx) and making it
> > conditional is easier due to Kconfig syntax. One small additional
> > benefit of this is saving a call to ld-option on incremental builds
> > because we will have already evaluated it for CONFIG_LD_ORPHAN_WARN.
> >
> > To keep the list of supported architectures the same, introduce
> > CONFIG_ARCH_WANT_LD_ORPHAN_WARN, which an architecture can select to
> > gain this automatically after all of the sections are specified and size
> > asserted. A special thanks to Kees Cook for the help text on this
> > config.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1187
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > ---
> >  Makefile                          | 6 ++++++
> >  arch/Kconfig                      | 9 +++++++++
> >  arch/arm/Kconfig                  | 1 +
> >  arch/arm/Makefile                 | 4 ----
> >  arch/arm/boot/compressed/Makefile | 4 +++-
> >  arch/arm64/Kconfig                | 1 +
> >  arch/arm64/Makefile               | 4 ----
> >  arch/powerpc/Kconfig              | 1 +
> >  arch/powerpc/Makefile             | 1 -
> 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> 
> 
> >  arch/x86/Kconfig                  | 1 +
> >  arch/x86/Makefile                 | 3 ---
> >  arch/x86/boot/compressed/Makefile | 4 +++-
> >  init/Kconfig                      | 3 +++
> >  13 files changed, 28 insertions(+), 14 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 008aba5f1a20..c443afd61886 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -984,6 +984,12 @@ ifeq ($(CONFIG_RELR),y)
> >  LDFLAGS_vmlinux	+= --pack-dyn-relocs=relr
> >  endif
> >  
> > +# We never want expected sections to be placed heuristically by the
> > +# linker. All sections should be explicitly named in the linker script.
> > +ifeq ($(CONFIG_LD_ORPHAN_WARN),y)
> > +LDFLAGS_vmlinux += --orphan-handling=warn
> > +endif
> 
> This is a nit, but you can use ifdef with bool CONFIG symbols in
> Makefiles, which reads a bit nicer, eg:
> 
> ifdef CONFIG_LD_ORPHAN_WARN
> LDFLAGS_vmlinux += --orphan-handling=warn
> endif

That is indeed cleaner, I did not realize I could do that as long as the
config was a boolean. I will use that in v2, which I will send along
within the next few days to give Masahiro some time to comment.

Cheers,
Nathan
