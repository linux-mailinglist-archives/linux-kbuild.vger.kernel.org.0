Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AF693E1526
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Aug 2021 14:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236980AbhHEM4z (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 5 Aug 2021 08:56:55 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:25229 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232615AbhHEM4y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Aug 2021 08:56:54 -0400
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 175CuNhC014299;
        Thu, 5 Aug 2021 21:56:24 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 175CuNhC014299
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1628168184;
        bh=/8/3wCfLu/4cFvkS/DxXUoTejOJZixLrqpyNHz7+H/k=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FCGRuPzW2ZdOkpr1FDIjYrWAaUQWM+HNlOPFh99beLhWIXJW1PBIC1iJzQjteiEOs
         FmCP3LEs363NVX0VTREBIckBk5cYAyUVHvHuU6bzkG2YcN71KnM1FKZ79S4D1J4QVt
         kT/Bui1zSKl80/7ANnQ2qu61O9NDYTGO49s6103eflKXLGKifG8B1N78nlToutnyZX
         H4Qhr1GwbkN4632NEdi6n6QVPTaf9bEHIBr1bbQfqMacuoLzRDSQhQaCRruJ2EtdUW
         LX5pe6Ki3yYOp+BXx5wjEZVABbp0zV7YjJMgVsrF2UYqZSqq7COpLp81ySoml+L1Ly
         xley5dWU5pGPA==
X-Nifty-SrcIP: [209.85.216.48]
Received: by mail-pj1-f48.google.com with SMTP id t7-20020a17090a5d87b029017807007f23so11328278pji.5;
        Thu, 05 Aug 2021 05:56:24 -0700 (PDT)
X-Gm-Message-State: AOAM532DrIpz6kEiZowAylET5D9hnJgV0ji52SEzhHPfIVo5Xlwm/1dC
        mONVQtq2EFL9akTrQU9WjkMYlereqY1QtkRGLCg=
X-Google-Smtp-Source: ABdhPJzy4AKrESjk80SzDSvhoYIeOF8an2S+dqlAkQPqcCtbkFOCN9DfXQZa4vKnQG0geqMg7iRfmO0ynHOO0Oah/fI=
X-Received: by 2002:a17:902:a5c5:b029:12c:a867:a839 with SMTP id
 t5-20020a170902a5c5b029012ca867a839mr1763754plq.71.1628168183373; Thu, 05 Aug
 2021 05:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210802183910.1802120-1-ndesaulniers@google.com>
 <20210802183910.1802120-2-ndesaulniers@google.com> <CAFP8O3Jc=iwzAQojgBZZzdT8iVBY9TO6GLTq+0vkXoo6L5JJ-A@mail.gmail.com>
In-Reply-To: <CAFP8O3Jc=iwzAQojgBZZzdT8iVBY9TO6GLTq+0vkXoo6L5JJ-A@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 5 Aug 2021 21:55:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS4wQNvWd0H1bEG-zbznkm_kfQHEZWKUOPQqReA+Cru3w@mail.gmail.com>
Message-ID: <CAK7LNAS4wQNvWd0H1bEG-zbznkm_kfQHEZWKUOPQqReA+Cru3w@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] Makefile: move initial clang flag handling into scripts/Makefile.clang
To:     =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 3, 2021 at 6:06 AM 'F=C4=81ng-ru=C3=AC S=C3=B2ng' via Clang Bui=
lt Linux
<clang-built-linux@googlegroups.com> wrote:
>
> On Mon, Aug 2, 2021 at 11:39 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > With some of the changes we'd like to make to CROSS_COMPILE, the initia=
l
> > block of clang flag handling which controls things like the target trip=
le,
> > whether or not to use the integrated assembler and how to find GAS,
> > and erroring on unknown warnings is becoming unwieldy. Move it into its
> > own file under scripts/.
> >
> > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> >  MAINTAINERS            |  1 +
> >  Makefile               | 15 +--------------
> >  scripts/Makefile.clang | 14 ++++++++++++++
> >  3 files changed, 16 insertions(+), 14 deletions(-)
> >  create mode 100644 scripts/Makefile.clang
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 19135a9d778e..3af8d39f43ef 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -4501,6 +4501,7 @@ B:        https://github.com/ClangBuiltLinux/linu=
x/issues
> >  C:     irc://chat.freenode.net/clangbuiltlinux
> >  F:     Documentation/kbuild/llvm.rst
> >  F:     include/linux/compiler-clang.h
> > +F:     scripts/Makefile.clang
> >  F:     scripts/clang-tools/
> >  K:     \b(?i:clang|llvm)\b
> >
> > diff --git a/Makefile b/Makefile
> > index 6b555f64df06..444558e62cbc 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -586,20 +586,7 @@ endif
> >  CC_VERSION_TEXT =3D $(subst $(pound),,$(shell $(CC) --version 2>/dev/n=
ull | head -n 1))
> >
> >  ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
> > -ifneq ($(CROSS_COMPILE),)
> > -CLANG_FLAGS    +=3D --target=3D$(notdir $(CROSS_COMPILE:%-=3D%))
> > -endif
> > -ifeq ($(LLVM_IAS),1)
> > -CLANG_FLAGS    +=3D -integrated-as
> > -else
> > -CLANG_FLAGS    +=3D -no-integrated-as
> > -GCC_TOOLCHAIN_DIR :=3D $(dir $(shell which $(CROSS_COMPILE)elfedit))
> > -CLANG_FLAGS    +=3D --prefix=3D$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_CO=
MPILE))
> > -endif
> > -CLANG_FLAGS    +=3D -Werror=3Dunknown-warning-option
> > -KBUILD_CFLAGS  +=3D $(CLANG_FLAGS)
> > -KBUILD_AFLAGS  +=3D $(CLANG_FLAGS)
> > -export CLANG_FLAGS
> > +include $(srctree)/scripts/Makefile.clang
> >  endif
> >
> >  # Include this also for config targets because some architectures need
> > diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
> > new file mode 100644
> > index 000000000000..297932e973d4
> > --- /dev/null
> > +++ b/scripts/Makefile.clang
> > @@ -0,0 +1,14 @@
> > +ifneq ($(CROSS_COMPILE),)
> > +CLANG_FLAGS    +=3D --target=3D$(notdir $(CROSS_COMPILE:%-=3D%))
> > +endif
> > +ifeq ($(LLVM_IAS),1)
> > +CLANG_FLAGS    +=3D -integrated-as
>
> -i* options are for includes. -fintegrated-as is the canonical spelling.


If -fintegrated-as is preferred to -integrated-as,
please send a patch.
(on top of this series)


Thanks.






> Since -fintegrated-as is the default (for most llvm/lib/Target/
> targets and the ones clang builds actually support),
> it can even be deleted.
>
> > +else
> > +CLANG_FLAGS    +=3D -no-integrated-as
> > +GCC_TOOLCHAIN_DIR :=3D $(dir $(shell which $(CROSS_COMPILE)elfedit))
> > +CLANG_FLAGS    +=3D --prefix=3D$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_CO=
MPILE))
> > +endif
> > +CLANG_FLAGS    +=3D -Werror=3Dunknown-warning-option
> > +KBUILD_CFLAGS  +=3D $(CLANG_FLAGS)
> > +KBUILD_AFLAGS  +=3D $(CLANG_FLAGS)
> > +export CLANG_FLAGS
> > --
> > 2.32.0.554.ge1b32706d8-goog
> >
>
> --
> You received this message because you are subscribed to the Google Groups=
 "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/clang-built-linux/CAFP8O3Jc%3DiwzAQojgBZZzdT8iVBY9TO6GLTq%2B0vkXoo6L5JJ-A=
%40mail.gmail.com.



--=20
Best Regards
Masahiro Yamada
