Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC4162DD55C
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Dec 2020 17:42:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725468AbgLQQmG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 17 Dec 2020 11:42:06 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:59945 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727303AbgLQQmF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Dec 2020 11:42:05 -0500
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 0BHGf1Av026737
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Dec 2020 01:41:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 0BHGf1Av026737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608223261;
        bh=SsEN3OpLqyZgzDlHfDzcuCo0xn4kYLDuE2NOuxevbVg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nuxv8Mrr58gXWk4EAqNG6PF0eC4ZUvPalV/l6tvMaz/tJMxWplkz+u5a72D/RV6qZ
         /X3LiVRGvjRP3KJoMwxX7okZ5zgPz99pMT4z/2tkb1LirWhhqTCcCHUKzScieHVXhk
         NUgCFFBLCX6LNBe5sMls8nptO7Ukncgov8k1/kqXRBUGMtlMtWM0+SAuNsyfZpIgQx
         Wxa1uJUTvXm5jVUOw90F1Veotxii30pn5C2LUIEgTNyI/nHKB+MGboMpJhjopkkqTx
         f3h6VUQPawzHRxWS+mQweiOwthJ6tHVtg3CwpPoeFtOqrEWKuwU4En42PBA80EWk8p
         b3H6OPKcJ2OLQ==
X-Nifty-SrcIP: [209.85.215.178]
Received: by mail-pg1-f178.google.com with SMTP id w5so19901679pgj.3
        for <linux-kbuild@vger.kernel.org>; Thu, 17 Dec 2020 08:41:01 -0800 (PST)
X-Gm-Message-State: AOAM533EOq0lJWscAyjy3HUZtc+lnI5B7WB0WuPRneVkZVQrMWJGO4r3
        jyOmFs353miZXpu5JGK50zJkr5pf2YFRPFYcPH8=
X-Google-Smtp-Source: ABdhPJxBBXkOVfXKBGRFKu7Y6BjImDMFcM5UN4U6jSKm4xmt/oMsFZLQhirOchlg7+94pl1SmwqcZ7775WS03i0cwlE=
X-Received: by 2002:a63:3205:: with SMTP id y5mr63081pgy.47.1608223260835;
 Thu, 17 Dec 2020 08:41:00 -0800 (PST)
MIME-Version: 1.0
References: <87tuslxhry.fsf@mpe.ellerman.id.au> <CAK7LNASTXyxhLzH7kRyAKCixe6ksJaKPiuPxWnsYZ6NJVCWDhQ@mail.gmail.com>
In-Reply-To: <CAK7LNASTXyxhLzH7kRyAKCixe6ksJaKPiuPxWnsYZ6NJVCWDhQ@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 18 Dec 2020 01:40:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNARAkJ3_-4gX0VA2UkapbOftuzfSTVMBbgbw=HD8n7N+7w@mail.gmail.com>
Message-ID: <CAK7LNARAkJ3_-4gX0VA2UkapbOftuzfSTVMBbgbw=HD8n7N+7w@mail.gmail.com>
Subject: Re: powerpc VDSO files being unnecessarily rebuilt
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Dec 17, 2020 at 6:23 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Thu, Dec 17, 2020 at 11:56 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
> >
> > Hi all,
> >
> > Since the merge of the C VDSO I see we are repeatedly rebuilding some
> > files in the VDSO, eg:
> >
> >   $ make V=2
> >   make[1]: Entering directory '/home/michael/linux/build~'
> >     GEN     Makefile
> >     CALL    /home/michael/linux/scripts/checksyscalls.sh - due to target missing
> >     CALL    /home/michael/linux/scripts/atomic/check-atomics.sh - due to target missing
> >     CHK     include/generated/compile.h
> >     CC      arch/powerpc/kernel/vdso64/vgettimeofday.o - due to vgettimeofday.o not in $(targets)
> >
> > This then causes multiple other files to be rebuilt.
> >
> > So the obvious fix is to add it to targets:
> >
> > diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vdso64/Makefile
> > index d365810a689a..5386532866ce 100644
> > --- a/arch/powerpc/kernel/vdso64/Makefile
> > +++ b/arch/powerpc/kernel/vdso64/Makefile
> > @@ -5,6 +5,7 @@ ARCH_REL_TYPE_ABS := R_PPC_JUMP_SLOT|R_PPC_GLOB_DAT|R_PPC_ADDR32|R_PPC_ADDR24|R_
> >  include $(srctree)/lib/vdso/Makefile
> >
> >  obj-vdso64 = sigtramp.o gettimeofday.o datapage.o cacheflush.o note.o getcpu.o
> > +targets := $(obj-vdso64) vdso64.so.dbg
> >
> >  ifneq ($(c-gettimeofday-y),)
> >    CFLAGS_vgettimeofday.o += -include $(c-gettimeofday-y)
> > @@ -13,11 +14,11 @@ ifneq ($(c-gettimeofday-y),)
> >    CFLAGS_vgettimeofday.o += -DDISABLE_BRANCH_PROFILING
> >    CFLAGS_vgettimeofday.o += -ffreestanding -fasynchronous-unwind-tables
> >    CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE)
> > +  targets += vgettimeofday.o
> >  endif
> >
> >  # Build rules
> >
> > -targets := $(obj-vdso64) vdso64.so.dbg
> >  obj-vdso64 := $(addprefix $(obj)/, $(obj-vdso64))
> >
> >  GCOV_PROFILE := n
> >
> >
> > But then I see it still rebuilt:
> >
> >   CC      arch/powerpc/kernel/vdso64/vgettimeofday.o - due to command line change
> >
> >
> > I'm not changing the command line, and AFAICS the .cmd file is not
> > changing either:
> >
> >   $ make V=2
> >   ...
> >     CC      arch/powerpc/kernel/vdso64/vgettimeofday.o - due to command line change
> >
> >   $ sha256sum build\~/arch/powerpc/kernel/vdso64/vgettimeofday.o
> >   7f635546bc2768c7b929d3de1724d83285f3cd54394fcd7104f8b1301d689d65  build~/arch/powerpc/kernel/vdso64/vgettimeofday.o
> >
> >   $ make V=2
> >   ...
> >     CC      arch/powerpc/kernel/vdso64/vgettimeofday.o - due to command line change
> >
> >   $ sha256sum build\~/arch/powerpc/kernel/vdso64/vgettimeofday.o
> >   7f635546bc2768c7b929d3de1724d83285f3cd54394fcd7104f8b1301d689d65  build~/arch/powerpc/kernel/vdso64/vgettimeofday.o
> >
> >
> > So any hints on what I'm missing here?
> >
> > cheers
>
>
> This is because PPC builds the vdso twice
> with different command arguments.
>
>
> First time:
>
> vdso_prepare: prepare0
>          $(if $(CONFIG_VDSO32),$(Q)$(MAKE) \
>                  $(build)=arch/powerpc/kernel/vdso32
> include/generated/vdso32-offsets.h)
>          $(if $(CONFIG_PPC64),$(Q)$(MAKE) \
>                  $(build)=arch/powerpc/kernel/vdso64
> include/generated/vdso64-offsets.h)
>
>
> Second time:
>    from  arch/powerpc/kernel/Makefile
>
>
>
>
>
> For the first build, -Werror is missing because
> Kbuild directly descends into arch/powerpc/kernel/vdso[32,64]/.
>
>
> For the second build,
>
> arch/powerpc/Kbuild appends the following:
>
> subdir-ccflags-$(CONFIG_PPC_WERROR) := -Werror
>


This is very dangerous because the vdso offsets are wrong.

I think ppc followed arm64 implementation.

Let me figure out how to fix arm64 vdso.



-- 
Best Regards
Masahiro Yamada
