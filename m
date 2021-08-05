Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 030733E1F83
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Aug 2021 01:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240950AbhHEXt0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 5 Aug 2021 19:49:26 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:63698 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242503AbhHEXtY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Aug 2021 19:49:24 -0400
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 175Nmjpo007990;
        Fri, 6 Aug 2021 08:48:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 175Nmjpo007990
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1628207325;
        bh=SRKkmpg2Ytr+z2oFhQunvdIzg5lvK7e7ZfnBXDllOFI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=pArzsqgvhURwTFqkPdF2HaoIvmUyR6Jc1FaPl40Jv2v7KKcT56yLCYiFrQ4hZengn
         RseE/QqaLvsMF5J71CRd7FFLMd84W9lz6a2VrhT5jTQUdAULIYGSJBURRycqwmWIsj
         ein7QATfXAo/1tT59wJoU3Z88XdjnxO4Z5Qo9PLhQBZ06dGMNv+oap3ze9O9lt9IQN
         soQ8p9uer8iqoIkf+SwJdWZXLe/+OMmSsy0s55twt1suSRUulag4ZfGuGkkUrjbjGN
         KZx2/DepgdkvR9HBM/b5x5i3wZB4or5dCcLG9E3BrFMydeU8+6cBaAyRUnUA5DVuxU
         LferMUlGG2kpQ==
X-Nifty-SrcIP: [209.85.216.42]
Received: by mail-pj1-f42.google.com with SMTP id u5-20020a17090ae005b029017842fe8f82so4305411pjy.0;
        Thu, 05 Aug 2021 16:48:45 -0700 (PDT)
X-Gm-Message-State: AOAM533ZbbivBXyOa62eyA9AXnJt/Bd7zSF72WXZikGmOI7I9ZYi3D79
        jCD7enNyB5MBTaWyxhOQsSzGYgqrPYeVtUbTFuQ=
X-Google-Smtp-Source: ABdhPJwZ7cJ0ZIJTYnKw/mbQ8ARTDMYtp8jfclSYxD2aE6daruKOvHALnEgAzkeTtAtQXmUyWy4rd/CBYhr3h8yTDBc=
X-Received: by 2002:a65:6459:: with SMTP id s25mr247411pgv.7.1628207324577;
 Thu, 05 Aug 2021 16:48:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210802234304.3519577-1-ndesaulniers@google.com>
 <CAK7LNATWm94K=UcSNn88PyPST38rfe_31vLLpDf=ERPnKnBvVA@mail.gmail.com> <CAKwvOdkVuzD68bQuAWS7fS0tat_wdR0bxb=Eh=Te84RtoRgZ8g@mail.gmail.com>
In-Reply-To: <CAKwvOdkVuzD68bQuAWS7fS0tat_wdR0bxb=Eh=Te84RtoRgZ8g@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 6 Aug 2021 08:48:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNATJRTD7dowBosb1-560C6-NxoorjxAYMzV5SZPd35GAtg@mail.gmail.com>
Message-ID: <CAK7LNATJRTD7dowBosb1-560C6-NxoorjxAYMzV5SZPd35GAtg@mail.gmail.com>
Subject: Re: [PATCH] scripts/Makefile.clang: default to LLVM_IAS=1
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Khem Raj <raj.khem@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>,
        Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Aug 6, 2021 at 3:40 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> On Thu, Aug 5, 2021 at 8:16 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Tue, Aug 3, 2021 at 8:43 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
> > >
> > > diff --git a/Makefile b/Makefile
> > > index 444558e62cbc..b24b48c9ebb7 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -845,7 +845,7 @@ else
> > >  DEBUG_CFLAGS   += -g
> > >  endif
> > >
> > > -ifneq ($(LLVM_IAS),1)
> > > +ifeq ($(LLVM_IAS),0)
> > >  KBUILD_AFLAGS  += -Wa,-gdwarf-2
> > >  endif
> > >
> > > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > > index bc74afdbf31e..807f7c94bc6f 100644
> > > --- a/arch/riscv/Makefile
> > > +++ b/arch/riscv/Makefile
> > > @@ -41,7 +41,7 @@ endif
> > >  ifeq ($(CONFIG_LD_IS_LLD),y)
> > >         KBUILD_CFLAGS += -mno-relax
> > >         KBUILD_AFLAGS += -mno-relax
> > > -ifneq ($(LLVM_IAS),1)
> > > +ifeq ($(LLVM_IAS),0)
> > >         KBUILD_CFLAGS += -Wa,-mno-relax
> > >         KBUILD_AFLAGS += -Wa,-mno-relax
> > >  endif
> >
> >
> >
> > Please drop these two hunks.
> >
> > I will apply my patch instead.
> > https://lore.kernel.org/patchwork/patch/1472580/
>
> Sure.  Will send a v2 with Matthew's suggestion as well.
>
> > When we negate a flag that is enabled by default,
> > which is a common way?
> >  - set it to '0'
> >  - set is to empty
> >
> >
> > So, I was wondering if we should support
> > not only LLVM_IAS=0 but also LLVM_IAS=.
> >
> > What do you think?
>
> LLVM_IAS= looks weird (so I agree with Khem's response), but if it's
> common/expected then maybe if there's a way to write a concise check
> for either =<blank> or =0?  I don't feel strongly about how it's
> specified to disable the integrated assembler, but let's sort that out
> _before_ I send a v2.
>
> How can you tell the difference between `make CC=clang` and `make
> CC=clang LLVM_IAS=`? (maybe that doesn't matter here, as either imply
> "don't use clang as the assembler when compiling with clang")


$(origin LLVM_IAS) knows the difference.

make CC=clang            ->  $(origin LLVM_IAS) is 'undefined'
make CC=clang LLVM_IAS=  ->  $(origin LLVM_IAS) is 'command line'
LLVM_IAS= make CC=clang  ->  $(origin LLVM_IAS) is 'environment'




The following patch makes both LLVM_IAS= and LLVM_IAS=0
work for disabling the integrated assembler.



@@ -22,6 +22,9 @@ else
 CLANG_FLAGS    += --target=$(notdir $(CROSS_COMPILE:%-=%))
 endif # CROSS_COMPILE

+# The integrated assembler is enabled by default.
+LLVM_IAS ?= 1
+
 ifeq ($(LLVM_IAS),1)
 CLANG_FLAGS    += -integrated-as
 else






But, I am not pretty sure if it is a good idea...

Perhaps, it is better to require LLVM_IAS=0
as Khem mentioned.


Another way for avoiding ambiguity is, perhaps
LLVM_IAS_DISABLE=1 instead of LLVM_IAS=0.


-- 
Best Regards
Masahiro Yamada
