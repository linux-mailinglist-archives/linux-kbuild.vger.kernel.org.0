Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A83B3D0856
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jul 2021 07:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231363AbhGUExe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 21 Jul 2021 00:53:34 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:41749 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbhGUEx0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Jul 2021 00:53:26 -0400
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 16L5XoBn019310;
        Wed, 21 Jul 2021 14:33:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 16L5XoBn019310
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1626845630;
        bh=z652dcQglMhDrSggn6HZsaONlg0ssZKb/LMa5k913sA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Gmi62dIoA2VzwyQ3i+mgj5hZVtDZSUyOrRg/kFMu9/PRDl6Sr9t0sujGJmNn+dL0b
         FXJkcsyJ2+lkMdI9VglSkJZtRkZqSLCOHERwmsWeHWSv1lra6OuXVGgpDDMzpfieHf
         Cclfl8EAWUiT3Cvx4KOwCKVSU+BEp4ol2mMbZdV/7Fy6Msqb4kznbE2FXypMIS/LgT
         1+BFUNjxMU2zOz4QmsK5rZ9N55Rt9w5X8hxU5LRpUGVmRxpdbTY3SvKwfSH5Gmd3co
         F22tpuQiGBdm5IUW6OlEVO2zdi4eKFvbrTMiUFSkpSV18L9Xf90wbsHsH/R7b4nRbh
         rmXvqaSFQtz1Q==
X-Nifty-SrcIP: [209.85.215.175]
Received: by mail-pg1-f175.google.com with SMTP id 70so853557pgh.2;
        Tue, 20 Jul 2021 22:33:50 -0700 (PDT)
X-Gm-Message-State: AOAM530r8oEab0BSrKK/A1CBmrtgKtNNqFVIb9lnUOD2cLr528BMlekb
        TsGk7CoMeZRx37+Ghrg0n6sbZkk3DAhZPYcA6D4=
X-Google-Smtp-Source: ABdhPJyv/+DCLAPheQLAYNtqbCOzVlaBOUQkj1dK5vsPDv5cYKrEjHDiwgdWqdo7JCDOxBKhjpXYnJMph0lcOEeR0K8=
X-Received: by 2002:a65:498a:: with SMTP id r10mr34611970pgs.7.1626845629877;
 Tue, 20 Jul 2021 22:33:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210708232522.3118208-1-ndesaulniers@google.com>
 <20210708232522.3118208-3-ndesaulniers@google.com> <CAK7LNARye5Opc0AdXpn+DHB7hTaphoRSCUWxJgXu+sjuNjWUCg@mail.gmail.com>
 <CAHk-=wgGxu4_hgzdYpFuKd95SfnkJbPTWAQ9-fMgmMN1Oxs2xQ@mail.gmail.com>
 <CAKwvOdkvju7heeNpk87brsjkhXHbdKFsUgf63KWhXox9rDkQsA@mail.gmail.com>
 <CAHk-=wiZe2FuiAOwhbKR_VMmFBKekz0NFREm4fvik25PEdcK_g@mail.gmail.com> <YPeoGucPDzFcmJ7p@infradead.org>
In-Reply-To: <YPeoGucPDzFcmJ7p@infradead.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 21 Jul 2021 14:33:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ0eopgjVi7UTJdnLBpL0T=vOi4UZtsUaFh8zaX0-Oiig@mail.gmail.com>
Message-ID: <CAK7LNAQ0eopgjVi7UTJdnLBpL0T=vOi4UZtsUaFh8zaX0-Oiig@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Makefile: infer CROSS_COMPILE from SRCARCH for
 LLVM=1 LLVM_IAS=1
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 21, 2021 at 1:53 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Tue, Jul 20, 2021 at 02:54:35PM -0700, Linus Torvalds wrote:
> > But there are other things that stick around. In particular, I have
> > considered simply using git config variables for that.
> >
> > Something like this in the main Makefile:
> >
> >     ARCH=$(shell git config build.arch)
> >     CC=$(shell git config --default=gcc build.cc)
> >
> > would actually be optimal for what _I_ do. Then for my clang build tree, I'd do
> >
> >     git config build.cc clang
> >
> > and it would stick in that tree. If you don't set the option, it would use gcc.
> >
> > Maybe that would be an acceptable model these days? We've used git
> > long enough that non-git worries aren't a big deal any more, and I
> > guess people could use the old-fashioned
>
> I still this only papers around the fact that the architecture is
> fundamentally part of the kernel config


In fact, I am the person who did it in U-boot several years ago.

In U-Boot Kconfig, the architecture is selected by a Kconfig choice:

https://github.com/u-boot/u-boot/blob/v2021.07/arch/Kconfig#L22

(but, if you look at Makefiles and Kconfigs of U-Boot,
you will notice they are uglier than the kernel's ones.)



Theoretically, yes, it is possible to make ARCH as part of the .config
in the kernel as well, but we need careful consideration to make
it robust, clean, and efficient.

In the current model, the Kconfig stage would be even slower
because Kconfig would end up with a bunch of unrelated cc-option
from other architectures.

For example, arch/s390/Kconfig has so many cc-option.
If we allow Kconfig to choose "ARCH', all Kconfig files
of all architectures must be parsed.
If you intend to build the x86 kernel, you might think that
parsing the expensive arch/s390/Kconfig is pointless.





> and should come from .config,
> and the toolchain probably as well.
>
> I for one do have a few different tree for different projects, but
> need to try cross compiles in each of them.  And unfortunately sometimes
> with clang (nothing against clang itself [1], just that having to deal
> with multiple toolchains is a pain)
>
> [1] well, except for the sometimes idiotic diagnostics..


--
Best Regards
Masahiro Yamada
