Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBAFF3E5040
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Aug 2021 02:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233281AbhHJAH1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Aug 2021 20:07:27 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:28788 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237108AbhHJAH1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Aug 2021 20:07:27 -0400
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 17A06ZeT022827;
        Tue, 10 Aug 2021 09:06:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 17A06ZeT022827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1628553996;
        bh=JjfxB/NWBg6Ktsgql9hFjDsswtW13cjHVcXKJN/HvB8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=L8nrKPMiFzkWiSZ1GVQYdzO47hlpkYHhAspKesCgblfesCiZAt/K0aUt84N2jrK2u
         xPkcmooAFQczDF9yGo/PXMWGlkisP3ici1IeTadRa6I9KKK+nAfrGQPuG0KGxwtZEz
         Ds8ClTxNga+xFcM4H6lsL7GYpuSRlUx7ftXrbur2PG4zXfF0IzCkrbKkGV+ryMs/de
         ENP07lym8+xJuE7Lb9LuYJcIJAkw1s1NkdMWNLvXlfY0eOZ7H48/KnRadgtJtUi8G/
         Dibhn9Hv5bW4OiGI5LKNT+trSkEQEvtZyvxKQOjfkrPAquo+OvXkI1otuqPuJbESiM
         Odo/M9aBB3XaQ==
X-Nifty-SrcIP: [209.85.216.43]
Received: by mail-pj1-f43.google.com with SMTP id w13-20020a17090aea0db029017897a5f7bcso2584985pjy.5;
        Mon, 09 Aug 2021 17:06:36 -0700 (PDT)
X-Gm-Message-State: AOAM531lnsUGHcu/gQFjCcO1FMKYIBFUpLjkWYUXlkJaYoCBz+gy2OP4
        6KiI2T2DcTjErALoKPv7a94QdKCVQps6utdSzjY=
X-Google-Smtp-Source: ABdhPJx9ClJ+m1I4D4HsYDac1G2c1fRVRcLzTQ2DLoTRMnDzgs2C1ORwZqwvUlYi2Sd+H4wsQ6FQxBTe4HKJCajO5eA=
X-Received: by 2002:a17:90a:7384:: with SMTP id j4mr24142360pjg.153.1628553995364;
 Mon, 09 Aug 2021 17:06:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210805150102.131008-1-masahiroy@kernel.org> <59ce441e-8deb-39ff-700f-4e1c4e871177@kernel.org>
In-Reply-To: <59ce441e-8deb-39ff-700f-4e1c4e871177@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 10 Aug 2021 09:05:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT+7y+uNXKfTfW7HpQa1mVt0nuKHFPMQ3tMhjJrKt0v7Q@mail.gmail.com>
Message-ID: <CAK7LNAT+7y+uNXKfTfW7HpQa1mVt0nuKHFPMQ3tMhjJrKt0v7Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: check CONFIG_AS_IS_LLVM instead of LLVM_IAS
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Aug 6, 2021 at 3:46 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On 8/5/2021 8:01 AM, Masahiro Yamada wrote:
> > LLVM_IAS is the user interface to set the -(no-)integrated-as flag,
> > and it should be used only for that purpose.
> >
> > LLVM_IAS is checked in some places to determine the assembler type,
> > but it is not precise.
> >
> >   $ make CC=gcc LLVM_IAS=1
> >
> > ... will use the GNU assembler since LLVM_IAS=1 is effective only when
> > $(CC) is clang.
> >
> > Of course, the combination of CC=gcc and LLVM_IAS=1 does not make
> > sense, but the build system can be more robust against such insane
> > input.
> >
> > Commit ba64beb17493a ("kbuild: check the minimum assembler version in
> > Kconfig") introduced CONFIG_AS_IS_GNU/LLVM, which is more precise
> > because Kconfig checks the version string from the assembler in use.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>





Applied to linux-kbuild.




> > ---
> >
> >   Makefile            | 2 +-
> >   arch/riscv/Makefile | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 4ab151060931..8b56c9692c3c 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -844,7 +844,7 @@ else
> >   DEBUG_CFLAGS        += -g
> >   endif
> >
> > -ifneq ($(LLVM_IAS),1)
> > +ifndef CONFIG_AS_IS_LLVM
> >   KBUILD_AFLAGS       += -Wa,-gdwarf-2
> >   endif
> >
> > diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> > index bc74afdbf31e..dcfbd2a87d41 100644
> > --- a/arch/riscv/Makefile
> > +++ b/arch/riscv/Makefile
> > @@ -41,7 +41,7 @@ endif
> >   ifeq ($(CONFIG_LD_IS_LLD),y)
> >       KBUILD_CFLAGS += -mno-relax
> >       KBUILD_AFLAGS += -mno-relax
> > -ifneq ($(LLVM_IAS),1)
> > +ifndef CONFIG_AS_IS_LLVM
> >       KBUILD_CFLAGS += -Wa,-mno-relax
> >       KBUILD_AFLAGS += -Wa,-mno-relax
> >   endif
> >



-- 
Best Regards
Masahiro Yamada
