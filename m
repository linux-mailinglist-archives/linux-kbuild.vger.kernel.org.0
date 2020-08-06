Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63E6823E3BE
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Aug 2020 00:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbgHFWAs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 6 Aug 2020 18:00:48 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:19146 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726078AbgHFWAr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Aug 2020 18:00:47 -0400
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 076M0TUn006651;
        Fri, 7 Aug 2020 07:00:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 076M0TUn006651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596751230;
        bh=Xfs85PHXdOhRcMjUjbm4/NBLl7dcQvPuB0IgyJvQcNY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=xItFWfax66V1ZlVuvEA/5RZID3kXTCWeBtcMORvBRgSfWXPwamCAkrwdwA0S8/b/k
         /154VHpCDvYt7vYSXrKjIz0Y8CPUmE9GkVL2xNRNFxKKJyMO8QRKxjDC/2iNVbLyUg
         bYHXHjmXKfqxuRglfmAYs6gqFzpxtWrr+LQOl+aeIrraoJ40THoJRZuS/Sz9oh1rPz
         7HtXBZh6y7B2IHNbSxim8Giv6ZhkXqc26FALl+KIQAV2fu2N9aGrjU75pLdIEjGLD6
         V601vnzM/ZBII0ObJyn9TfYh4Iqc1CWGBbEjTHIRthG73/QOPOnxPvEOKPbM6WaIcy
         6E9R3JceQurXA==
X-Nifty-SrcIP: [209.85.217.51]
Received: by mail-vs1-f51.google.com with SMTP id n25so11186415vsq.6;
        Thu, 06 Aug 2020 15:00:29 -0700 (PDT)
X-Gm-Message-State: AOAM5334jNectuqMkMvnDpY6yL+quG3Pj7Qbptv/VvLyCko/eK76tK1e
        ArbT0Nb8VUfgBxoIUNUVzassql2sGbFuGBVgCxQ=
X-Google-Smtp-Source: ABdhPJzz7ZZOU/6VCnvmI3r7gzwomd0hOWCZWY3UlQMHSS3+9qv2lWLJwLf6DZJtEiuUw3mJA7PzeBefGQiHc/jfmQ8=
X-Received: by 2002:a67:d908:: with SMTP id t8mr8112536vsj.215.1596751228524;
 Thu, 06 Aug 2020 15:00:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200702233929.181409-1-danny@kdrag0n.dev> <20200705024318.GA433@Ryzen-9-3900X.localdomain>
In-Reply-To: <20200705024318.GA433@Ryzen-9-3900X.localdomain>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 7 Aug 2020 06:59:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ1VqK=zwMUdWCqh2ZmKbQ7p80QBZ0XB9wJyzKgefwY-Q@mail.gmail.com>
Message-ID: <CAK7LNAQ1VqK=zwMUdWCqh2ZmKbQ7p80QBZ0XB9wJyzKgefwY-Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Allow Clang global merging if !MODULES
To:     Nathan Chancellor <natechancellor@gmail.com>,
        Danny Lin <danny@kdrag0n.dev>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Kees Cook <keescook@chromium.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jul 5, 2020 at 11:43 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Hi Danny,
>
> On Thu, Jul 02, 2020 at 04:39:29PM -0700, Danny Lin wrote:
> > The old reasoning for disabling Clang's global merging optimization is
> > that it breaks modpost by coalescing many symbols into _MergedGlobals.
> > However, modpost is only used in builds with dynamic modules;
> > vmlinux.symvers is still created during standalone builds, but it's
> > effectively just an empty dummy file.

I am not convinced with this statement.

modpost is used even if CONFIG_MODULES=n

You can see the following log for allnoconfig.

  MODPOST vmlinux.symvers


Yes, vmlinux.symver is empty.
This is because EXPORT_SYMBOL is no-op when CONFIG_MODULES=n.



> >
> > Enabling the optimization whenever possible allows us to reap the
> > benefits of reduced register pressure when many global variables are
> > used in the same function.
>
> Have you run into any place within the kernel that this is the case or
> this more of a "could help if this ever happens" type of deal?
>
> > An x86 defconfig kernel built with this optimization boots fine in qemu,
> > and a downstream 4.14 kernel has been used on arm64 for nearly a year
> > without any issues caused by this optimization.
>
> If I am reading LLVM's source correctly, this option only seems relevant
> for ARM and AArch64?
>
> $ rg --no-heading createGlobalMergePass
> llvm/lib/CodeGen/GlobalMerge.cpp:679:Pass *llvm::createGlobalMergePass(const TargetMachine *TM, unsigned Offset,
> llvm/lib/Target/AArch64/AArch64TargetMachine.cpp:524:    addPass(createGlobalMergePass(TM, 4095, OnlyOptimizeForSize,
> llvm/lib/Target/ARM/ARMTargetMachine.cpp:456:    addPass(createGlobalMergePass(TM, 127, OnlyOptimizeForSize,
> llvm/include/llvm/CodeGen/Passes.h:419:  Pass *createGlobalMergePass(const TargetMachine *TM, unsigned MaximalOffset,
>
> Otherwise, I think this is probably okay. According to [1], when the
> optimization level is less than -O3, we get a less aggressive version of
> this optimization level, which is good for code size:
>
> https://github.com/llvm/llvm-project/commit/8207641251706ea808df6d2a1ea8f87b8ee04c6d


I do not understand how -mglobal-merge works.
Do you have test code to generate _MergedGlobals ?


Thanks.





> However, we do potentially get merging of extern globals if we do not
> specify -mglobal-merge (if I am reading the source correctly), which
> this commit claims might hurt performance? Not sure if there is any way
> to test or verify that?
>
> https://github.com/llvm/llvm-project/commit/de73404b8c4332190750537eb93ce0d5b6451300
>
> > Signed-off-by: Danny Lin <danny@kdrag0n.dev>
> > ---
> >  Makefile | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Makefile b/Makefile
> > index a60c98519c37..f04c3639cf61 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -772,10 +772,13 @@ ifdef CONFIG_CC_IS_CLANG
> >  KBUILD_CPPFLAGS += -Qunused-arguments
> >  KBUILD_CFLAGS += -Wno-format-invalid-specifier
> >  KBUILD_CFLAGS += -Wno-gnu
> > +
> > +ifdef CONFIG_MODULES
> >  # CLANG uses a _MergedGlobals as optimization, but this breaks modpost, as the
> >  # source of a reference will be _MergedGlobals and not on of the whitelisted names.
> >  # See modpost pattern 2
> >  KBUILD_CFLAGS += -mno-global-merge
> > +endif
> >  else
> >
> >  # These warnings generated too much noise in a regular build.
> > --
> > 2.27.0
> >
>
> Cheers,
> Nathan



--
Best Regards
Masahiro Yamada
