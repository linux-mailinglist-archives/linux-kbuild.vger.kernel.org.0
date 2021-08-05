Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7538D3E17BD
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Aug 2021 17:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241429AbhHEPT0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 5 Aug 2021 11:19:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236413AbhHEPTY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Aug 2021 11:19:24 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DEF2C061765;
        Thu,  5 Aug 2021 08:18:56 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id w197so5286168qkb.1;
        Thu, 05 Aug 2021 08:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yDxgi4QuDiLFwBjP43H0Okt4+DMON7aEHD6wSYhjwNE=;
        b=Xduq6v10TZWlZnR8DNL7gSIN7evZHrm8YOqzcBT+ypQvSa6T4lGMk0xX1xDkDPDobT
         q96qIfSdd2eA/C0BRG0ghA5rQNW8S86ZBXpfWxHx+Fr6rq3IAsZjK/aopxU6gZkD9S4L
         dzQRGSJP1EktNKnO5Y7f1GpaWgDbxfXC+C2yAZH7VDz40jNtJS9ZoHcdAN5WWpvL9+sn
         a3im5uNFMjEXG7R909CG62KD4ruCsziZkYBXT0V6XJH8cSVvsdrzqr5tjfsm9GKH271U
         PwgKZ5SRLz2CZRm1MDBGC2/hL1VQK0fl3ni026MoyiV2ZO6ZTBCSvKKlztIktMyzl6qb
         UgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yDxgi4QuDiLFwBjP43H0Okt4+DMON7aEHD6wSYhjwNE=;
        b=DuHMTzGK/J5ImM8k9uYE8FiVzRzCclPPyA+n3crtd+2xIh42PX3AE6j0+99eEWfsyO
         xcIfyVYe7hRAxUhtb74RS9HbSO9ETPHUfyM1RTc1F9ggweZLZtef7/2w0poOfmFScIm4
         V6cqp3Vmo0eX3cXpKgNXyHEKSUIlyZoo7SiZvUWhWaUCTsogcFo5q0PEfHri+xW1Gdyv
         kfLGOQQ8nxuEiXTAYsHs2ENuqSizZAGOYYM7PIl0qLUsfmcPViof4VFRWFltihdtf4CV
         sjihXi4JYjN52u0Db8O1dxfz46ezCNjUXT80WwL8QBUy3/zLI1zHW/uvOYAP2ipVoS6y
         Ue0g==
X-Gm-Message-State: AOAM533YLYDcBKwjmse0b6RylYwJ+gDt4JyHjmvu3nzh7WMMvz4TPXH0
        rd00Gjqj17MO1Xjzob6N04kaIoURwpsoK97Dnwk=
X-Google-Smtp-Source: ABdhPJxLXtamZNxmKFRp6STk4zGKOeD01CDQfPTvkf0ZQe65Uqg7pknPxHmpV4sRvDPv9RJyGLTEDydUMgNP6e1+aig=
X-Received: by 2002:ae9:f201:: with SMTP id m1mr5279060qkg.381.1628176735385;
 Thu, 05 Aug 2021 08:18:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210802234304.3519577-1-ndesaulniers@google.com> <CAK7LNATWm94K=UcSNn88PyPST38rfe_31vLLpDf=ERPnKnBvVA@mail.gmail.com>
In-Reply-To: <CAK7LNATWm94K=UcSNn88PyPST38rfe_31vLLpDf=ERPnKnBvVA@mail.gmail.com>
From:   Khem Raj <raj.khem@gmail.com>
Date:   Thu, 5 Aug 2021 08:18:28 -0700
Message-ID: <CAMKF1squPYXQ1DV_oiWP1DYpnBuy87Rkp3WFq4CZkCgFzM5PJw@mail.gmail.com>
Subject: Re: [PATCH] scripts/Makefile.clang: default to LLVM_IAS=1
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 5, 2021 at 8:16 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Tue, Aug 3, 2021 at 8:43 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
> >
> > LLVM_IAS=1 controls enabling clang's integrated assembler via
> > -integrated-as. This was an explicit opt in until we could enable
> > assembler support in Clang for more architecures. Now we have support
> > and CI coverage of LLVM_IAS=1 for all architecures except a few more
> > bugs affecting s390 and powerpc.
> >
> > This commit flips the default from opt in via LLVM_IAS=1 to opt out via
> > LLVM_IAS=0.  CI systems or developers that were previously doing builds
> > with CC=clang or LLVM=1 without explicitly setting LLVM_IAS must now
> > explicitly opt out via LLVM_IAS=0, otherwise they will be implicitly
> > opted-in.
> >
> > This finally shortens the command line invocation when cross compiling
> > with LLVM to simply:
> >
> > $ make ARCH=arm64 LLVM=1
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1434
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> > Note: base is:
> > https://lore.kernel.org/lkml/20210802183910.1802120-1-ndesaulniers@google.com/
> >
> >  Documentation/kbuild/llvm.rst | 14 ++++++++------
> >  Makefile                      |  2 +-
> >  arch/riscv/Makefile           |  2 +-
> >  scripts/Makefile.clang        |  6 +++---
> >  4 files changed, 13 insertions(+), 11 deletions(-)
> >
> > diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> > index f8a360958f4c..16712fab4d3a 100644
> > --- a/Documentation/kbuild/llvm.rst
> > +++ b/Documentation/kbuild/llvm.rst
> > @@ -60,17 +60,14 @@ They can be enabled individually. The full list of the parameters: ::
> >           OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf \
> >           HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar HOSTLD=ld.lld
> >
> > -Currently, the integrated assembler is disabled by default. You can pass
> > -``LLVM_IAS=1`` to enable it.
> > +Currently, the integrated assembler is enabled by default. You can pass
> > +``LLVM_IAS=0`` to disable it.
> >
> >  Omitting CROSS_COMPILE
> >  ----------------------
> >
> >  As explained above, ``CROSS_COMPILE`` is used to set ``--target=<triple>``.
> >
> > -Unless ``LLVM_IAS=1`` is specified, ``CROSS_COMPILE`` is also used to derive
> > -``--prefix=<path>`` to search for the GNU assembler and linker.
> > -
> >  If ``CROSS_COMPILE`` is not specified, the ``--target=<triple>`` is inferred
> >  from ``ARCH``.
> >
> > @@ -78,7 +75,12 @@ That means if you use only LLVM tools, ``CROSS_COMPILE`` becomes unnecessary.
> >
> >  For example, to cross-compile the arm64 kernel::
> >
> > -       make ARCH=arm64 LLVM=1 LLVM_IAS=1
> > +       make ARCH=arm64 LLVM=1
> > +
> > +If ``LLVM_IAS=0`` is specified, ``CROSS_COMPILE`` is also used to derive
> > +``--prefix=<path>`` to search for the GNU assembler and linker. ::
> > +
> > +       make ARCH=arm64 LLVM=1 LLVM_IAS=0 CROSS_COMPILE=aarch64-linux-gnu-
> >
> >  Supported Architectures
> >  -----------------------
> > diff --git a/Makefile b/Makefile
> > index 444558e62cbc..b24b48c9ebb7 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -845,7 +845,7 @@ else
> >  DEBUG_CFLAGS   += -g
> >  endif
> >
> > -ifneq ($(LLVM_IAS),1)
> > +ifeq ($(LLVM_IAS),0)
> >  KBUILD_AFLAGS  += -Wa,-gdwarf-2
> >  endif
> >
> > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > index bc74afdbf31e..807f7c94bc6f 100644
> > --- a/arch/riscv/Makefile
> > +++ b/arch/riscv/Makefile
> > @@ -41,7 +41,7 @@ endif
> >  ifeq ($(CONFIG_LD_IS_LLD),y)
> >         KBUILD_CFLAGS += -mno-relax
> >         KBUILD_AFLAGS += -mno-relax
> > -ifneq ($(LLVM_IAS),1)
> > +ifeq ($(LLVM_IAS),0)
> >         KBUILD_CFLAGS += -Wa,-mno-relax
> >         KBUILD_AFLAGS += -Wa,-mno-relax
> >  endif
>
>
>
> Please drop these two hunks.
>
> I will apply my patch instead.
> https://lore.kernel.org/patchwork/patch/1472580/
>
>
>
>
>
>
> > diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
> > index 1f4e3eb70f88..3ae63bd35582 100644
> > --- a/scripts/Makefile.clang
> > +++ b/scripts/Makefile.clang
> > @@ -22,12 +22,12 @@ else
> >  CLANG_FLAGS    += --target=$(notdir $(CROSS_COMPILE:%-=%))
> >  endif # CROSS_COMPILE
> >
> > -ifeq ($(LLVM_IAS),1)
> > -CLANG_FLAGS    += -integrated-as
> > -else
> > +ifeq ($(LLVM_IAS),0)
> >  CLANG_FLAGS    += -no-integrated-as
> >  GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
> >  CLANG_FLAGS    += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
> > +else
> > +CLANG_FLAGS    += -integrated-as
> >  endif
> >  CLANG_FLAGS    += -Werror=unknown-warning-option
> >  KBUILD_CFLAGS  += $(CLANG_FLAGS)
> >
> > base-commit: d7a86429dbc691bf540688fcc8542cc20246a85b
> > prerequisite-patch-id: 0d3072ecb5fd06ff6fd6ea81fe601f6c54c23910
> > prerequisite-patch-id: 2654829756eb8a094a0ffad1679caa75a4d86619
> > prerequisite-patch-id: a51e7885ca2376d008bbf146a5589da247806f7b
> > --
> > 2.32.0.554.ge1b32706d8-goog
> >
>
>
> When we negate a flag that is enabled by default,
> which is a common way?
>  - set it to '0'
>  - set is to empty
>
>
> So, I was wondering if we should support
> not only LLVM_IAS=0 but also LLVM_IAS=.
>
> What do you think?

always asking for 0 or 1 is perhaps better.

>
>
> --
> Best Regards
> Masahiro Yamada
