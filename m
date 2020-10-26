Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 621E9299A5F
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Oct 2020 00:23:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404719AbgJZXXs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 26 Oct 2020 19:23:48 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:28022 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404500AbgJZXXr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Oct 2020 19:23:47 -0400
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 09QNNCb1020175;
        Tue, 27 Oct 2020 08:23:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 09QNNCb1020175
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1603754593;
        bh=kUhFWI4WsYDgPcCkl7UnZNZiYWnYQ9Bwztn+54+tYPg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mLJcQqGMY3sI5x/0HBbnk3MWxG/rQNjjSbrC0fKsRXZzPOVgDVdX+tjUznP/aCjf7
         E+GMyS67jkwRFerMLEBgFnPpHa6FzBuefFBXz8Sw9gautf3UrwcthmXsV5yhODGTMo
         BscrXdLmiyDJxKkJXtIBdEagJIJLx87RquEXI50QWF9aPIcnb57cJYV0a0huveXn2+
         UifxuK3f1RS+gghmF0TEC0f+X7i7JMzT14s0qguB0ZfAMZdlcjqXTKHWdIhRbW/nMB
         Mij/WLV4gMER9hDTPTXawx6Y3uGuILlj1h80EpsfCTlCNVTE0z3m7nOP9kDVXs+KlI
         Jp/gW8s9O57QA==
X-Nifty-SrcIP: [209.85.210.179]
Received: by mail-pf1-f179.google.com with SMTP id a200so7054485pfa.10;
        Mon, 26 Oct 2020 16:23:13 -0700 (PDT)
X-Gm-Message-State: AOAM531zYVsNgmHcFqhLo5qvUwl4SCsu/qX3iA8WQ7bswJ9t8oQ7T6G3
        q2UQhWU+Y+lX07BqcaC4h3aONrvII7/vdQadCns=
X-Google-Smtp-Source: ABdhPJz8xafCjuSWKoYJgrmHRvjnmC1v42wxlgvZXWvr0PjykbuIZrN+qroqBZosBWNbIh3ZjoBTyujO7Bc8iTxztO0=
X-Received: by 2002:a62:ac08:0:b029:163:ecb1:ea2b with SMTP id
 v8-20020a62ac080000b0290163ecb1ea2bmr162391pfe.63.1603754592351; Mon, 26 Oct
 2020 16:23:12 -0700 (PDT)
MIME-Version: 1.0
References: <patch.git-ef02981ce9bc.your-ad-here.call-01603453662-ext-3714@work.hours>
 <20201023181805.GA3852821@ubuntu-m3-large-x86>
In-Reply-To: <20201023181805.GA3852821@ubuntu-m3-large-x86>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 27 Oct 2020 08:22:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNATuqqbd5MKWsFhOEAaGby6LZizSqAOVKX7+o-NiZ=ehcw@mail.gmail.com>
Message-ID: <CAK7LNATuqqbd5MKWsFhOEAaGby6LZizSqAOVKX7+o-NiZ=ehcw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove unused OBJSIZE
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Vasily Gorbik <gor@linux.ibm.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Oct 24, 2020 at 3:18 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Fri, Oct 23, 2020 at 01:57:32PM +0200, Vasily Gorbik wrote:
> > The "size" tool has been solely used by s390 to enforce .bss section usage
> > restrictions in early startup code. Since commit 980d5f9ab36b ("s390/boot:
> > enable .bss section for compressed kernel") and commit 2e83e0eb85ca
> > ("s390: clean .bss before running uncompressed kernel") these restrictions
> > have been lifted for the decompressor and uncompressed kernel and the
> > size tool is now unused.
> >
> > Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>
>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

Applied to linux-kbuild. Thanks.


>
> Thanks for the patch!
>
> > ---
> >  Documentation/kbuild/llvm.rst | 5 ++---
> >  Makefile                      | 4 +---
> >  2 files changed, 3 insertions(+), 6 deletions(-)
> >
> > diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> > index cf3ca236d2cc..21c847890d03 100644
> > --- a/Documentation/kbuild/llvm.rst
> > +++ b/Documentation/kbuild/llvm.rst
> > @@ -57,9 +57,8 @@ to enable them. ::
> >  They can be enabled individually. The full list of the parameters: ::
> >
> >       make CC=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \
> > -       OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump OBJSIZE=llvm-size \
> > -       READELF=llvm-readelf HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar \
> > -       HOSTLD=ld.lld
> > +       OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf \
> > +       HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar HOSTLD=ld.lld
> >
> >  Currently, the integrated assembler is disabled by default. You can pass
> >  ``LLVM_IAS=1`` to enable it.
> > diff --git a/Makefile b/Makefile
> > index d35a59f98e83..d2123c2c829a 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -433,7 +433,6 @@ NM                = llvm-nm
> >  OBJCOPY              = llvm-objcopy
> >  OBJDUMP              = llvm-objdump
> >  READELF              = llvm-readelf
> > -OBJSIZE              = llvm-size
> >  STRIP                = llvm-strip
> >  else
> >  CC           = $(CROSS_COMPILE)gcc
> > @@ -443,7 +442,6 @@ NM                = $(CROSS_COMPILE)nm
> >  OBJCOPY              = $(CROSS_COMPILE)objcopy
> >  OBJDUMP              = $(CROSS_COMPILE)objdump
> >  READELF              = $(CROSS_COMPILE)readelf
> > -OBJSIZE              = $(CROSS_COMPILE)size
> >  STRIP                = $(CROSS_COMPILE)strip
> >  endif
> >  PAHOLE               = pahole
> > @@ -509,7 +507,7 @@ KBUILD_LDFLAGS :=
> >  CLANG_FLAGS :=
> >
> >  export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC
> > -export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
> > +export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
> >  export PERL PYTHON PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
> >  export KGZIP KBZIP2 KLZOP LZMA LZ4 XZ ZSTD
> >  export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
> > --
> > 2.25.4
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20201023181805.GA3852821%40ubuntu-m3-large-x86.



-- 
Best Regards
Masahiro Yamada
