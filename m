Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59C4923E3D6
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Aug 2020 00:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbgHFWK7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 6 Aug 2020 18:10:59 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:33771 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbgHFWK7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Aug 2020 18:10:59 -0400
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 076MAdYx010846;
        Fri, 7 Aug 2020 07:10:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 076MAdYx010846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596751840;
        bh=GixLM4g/7oVPKB6aJETz+X61jnZ+y7CfPLscIRzlpvM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=F/y/MGcHje3aREZ5WOnpghavFwSZGI2jr1l93H6aL5ijDYlUfoNXvcFkYQjQTH82k
         iKiCMvpxBM6Fktv4Xo02sqY2p3+IkfTJFf+Mv8Iz4dkT1lrymnuoy8wj2ffM8ZU54p
         XicLuhNUzRjX17K+Ghm38pmUGYl15R8qEVlaXP7iLZ7FY41hSfNxnxGwsyOg//FSVm
         zgBNpjQyDfC8wcNk1IiHGrGYdtVXc1nPXNqu7LCZVAamdysLGtkwHnVOSpIljmXsk8
         391jzSG7db0a/lPSY4SlU5ol68XsiaWm5Rd2JgkyepXEYHTXxQhMpLytiH0nis+gZo
         pdnc9BhoS776Q==
X-Nifty-SrcIP: [209.85.217.41]
Received: by mail-vs1-f41.google.com with SMTP id r7so4356vsq.5;
        Thu, 06 Aug 2020 15:10:40 -0700 (PDT)
X-Gm-Message-State: AOAM530ftjUxrwpsCBexlJXS/Kf6GUqAcJpNdU6zDQX0GIAIVuKDifaD
        GblENTmiwOa0ujxNELHoaqWt7J/HDOfSXssv17I=
X-Google-Smtp-Source: ABdhPJwaESltMEOtHj2lithUIxvn18BWTkAkhifExzb3OhYRbnlb5/boIsP6Imgni1KyF07Xkg2XsKreEjO1bneoqWs=
X-Received: by 2002:a67:7905:: with SMTP id u5mr8405015vsc.179.1596751838971;
 Thu, 06 Aug 2020 15:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOdnni_G2tw+0eCLQQvvdcz97Fy1-cBjzPvLwbBNDu1-KqQ@mail.gmail.com>
 <20200728004736.3590053-1-nhuck@google.com> <CAK7LNAT-AO9_Y-qunRvPbBYf7GZnoE6bxYKFNtcdKAKV8d_A+w@mail.gmail.com>
 <CAJkfWY5ywOtO6fAyPd0B2BjEWamJRRMgg4et0uVq2bpkJSECwA@mail.gmail.com>
In-Reply-To: <CAJkfWY5ywOtO6fAyPd0B2BjEWamJRRMgg4et0uVq2bpkJSECwA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 7 Aug 2020 07:10:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQVdhMraYejrTsGZSLFJDk4CVf6ke-bsQ7kaDUM2Lf4SA@mail.gmail.com>
Message-ID: <CAK7LNAQVdhMraYejrTsGZSLFJDk4CVf6ke-bsQ7kaDUM2Lf4SA@mail.gmail.com>
Subject: Re: [PATCH v7] Makefile: Add clang-tidy and static analyzer support
 to makefile
To:     Nathan Huckleberry <nhuck@google.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Pirama Arumuga Nainar <pirama@google.com>,
        Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Aug 7, 2020 at 6:42 AM 'Nathan Huckleberry' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> On Thu, Aug 6, 2020 at 3:44 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Tue, Jul 28, 2020 at 9:47 AM Nathan Huckleberry <nhuck@google.com> wrote:
> > >
> > > This patch adds clang-tidy and the clang static-analyzer as make
> > > targets. The goal of this patch is to make static analysis tools
> > > usable and extendable by any developer or researcher who is familiar
> > > with basic c++.
> > >
> > > The current static analysis tools require intimate knowledge of the
> > > internal workings of the static analysis. Clang-tidy and the clang
> > > static analyzers expose an easy to use api and allow users unfamiliar
> > > with clang to write new checks with relative ease.
> > >
> > > ===Clang-tidy===
> > >
> > > Clang-tidy is an easily extendable 'linter' that runs on the AST.
> > > Clang-tidy checks are easy to write and understand. A check consists of
> > > two parts, a matcher and a checker. The matcher is created using a
> > > domain specific language that acts on the AST
> > > (https://clang.llvm.org/docs/LibASTMatchersReference.html).  When AST
> > > nodes are found by the matcher a callback is made to the checker. The
> > > checker can then execute additional checks and issue warnings.
> > >
> > > Here is an example clang-tidy check to report functions that have calls
> > > to local_irq_disable without calls to local_irq_enable and vice-versa.
> > > Functions flagged with __attribute((annotation("ignore_irq_balancing")))
> > > are ignored for analysis. (https://reviews.llvm.org/D65828)
> > >
> > > ===Clang static analyzer===
> > >
> > > The clang static analyzer is a more powerful static analysis tool that
> > > uses symbolic execution to find bugs. Currently there is a check that
> > > looks for potential security bugs from invalid uses of kmalloc and
> > > kfree. There are several more general purpose checks that are useful for
> > > the kernel.
> > >
> > > The clang static analyzer is well documented and designed to be
> > > extensible.
> > > (https://clang-analyzer.llvm.org/checker_dev_manual.html)
> > > (https://github.com/haoNoQ/clang-analyzer-guide/releases/download/v0.1/clang-analyzer-guide-v0.1.pdf)
> > >
> > > The main draw of the clang tools is how accessible they are. The clang
> > > documentation is very nice and these tools are built specifically to be
> > > easily extendable by any developer. They provide an accessible method of
> > > bug-finding and research to people who are not overly familiar with the
> > > kernel codebase.
> > >
> > > Signed-off-by: Nathan Huckleberry <nhuck@google.com>
> > > ---
> > > Changes v6->v7
> > > * Fix issues with relative paths
> > > * Additional style fixes
> > >  MAINTAINERS                                   |  1 +
> > >  Makefile                                      |  3 +
> > >  scripts/clang-tools/Makefile.clang-tools      | 23 ++++++
> > >  .../{ => clang-tools}/gen_compile_commands.py |  0
> > >  scripts/clang-tools/run-clang-tools.py        | 74 +++++++++++++++++++
> > >  5 files changed, 101 insertions(+)
> > >  create mode 100644 scripts/clang-tools/Makefile.clang-tools
> > >  rename scripts/{ => clang-tools}/gen_compile_commands.py (100%)
> > >  create mode 100755 scripts/clang-tools/run-clang-tools.py
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 1d4aa7f942de..a444564e5572 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -4198,6 +4198,7 @@ W:        https://clangbuiltlinux.github.io/
> > >  B:     https://github.com/ClangBuiltLinux/linux/issues
> > >  C:     irc://chat.freenode.net/clangbuiltlinux
> > >  F:     Documentation/kbuild/llvm.rst
> > > +F:     scripts/clang-tools/
> > >  K:     \b(?i:clang|llvm)\b
> > >
> > >  CLEANCACHE API
> > > diff --git a/Makefile b/Makefile
> > > index fe0164a654c7..3e2df010b342 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -747,6 +747,7 @@ KBUILD_CFLAGS       += $(call cc-option,-fno-allow-store-data-races)
> > >
> > >  include scripts/Makefile.kcov
> > >  include scripts/Makefile.gcc-plugins
> > > +include scripts/clang-tools/Makefile.clang-tools
> > >
> > >  ifdef CONFIG_READABLE_ASM
> > >  # Disable optimizations that make assembler listings hard to read.
> > > @@ -1543,6 +1544,8 @@ help:
> > >         @echo  '  export_report   - List the usages of all exported symbols'
> > >         @echo  '  headerdep       - Detect inclusion cycles in headers'
> > >         @echo  '  coccicheck      - Check with Coccinelle'
> > > +       @echo  '  clang-analyzer  - Check with clang static analyzer'
> > > +       @echo  '  clang-tidy      - Check with clang-tidy'
> > >         @echo  ''
> > >         @echo  'Tools:'
> > >         @echo  '  nsdeps          - Generate missing symbol namespace dependencies'
> > > diff --git a/scripts/clang-tools/Makefile.clang-tools b/scripts/clang-tools/Makefile.clang-tools
> > > new file mode 100644
> > > index 000000000000..5c9d76f77595
> > > --- /dev/null
> > > +++ b/scripts/clang-tools/Makefile.clang-tools
> > > @@ -0,0 +1,23 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +#
> > > +# Copyright (C) Google LLC, 2020
> > > +#
> > > +# Author: Nathan Huckleberry <nhuck@google.com>
> > > +#
> > > +PHONY += clang-tidy
> > > +clang-tidy:
> > > +ifdef CONFIG_CC_IS_CLANG
> > > +       $(PYTHON3) scripts/clang-tools/gen_compile_commands.py
> > > +       $(PYTHON3) scripts/clang-tools/run-clang-tools.py clang-tidy compile_commands.json
> > > +else
> > > +       $(error clang-tidy requires CC=clang)
> > > +endif
> > > +
> > > +PHONY += clang-analyzer
> > > +clang-analyzer:
> > > +ifdef CONFIG_CC_IS_CLANG
> > > +       $(PYTHON3) scripts/clang-tools/gen_compile_commands.py
> > > +       $(PYTHON3) scripts/clang-tools/run-clang-tools.py clang-analyzer compile_commands.json
> > > +else
> > > +       $(error clang-analyzer requires CC=clang)
> > > +endif
> >
> >
> >
> > You can unify the almost same two rules.
> >
> > PHONY += clang-tidy clang-analyzer
> > clang-tidy clang-analyzer:
> > ifdef CONFIG_CC_IS_CLANG
> >         $(PYTHON3) scripts/clang-tools/gen_compile_commands.py
> >         $(PYTHON3) scripts/clang-tools/run-clang-tools.py $@
> > compile_commands.json
> > else
> >         $(error $@ requires CC=clang)
> > endif
> >
>
> I like this.
>
> >
> >
> >
> > But, before we proceed, please tell me
> > what this check is intended for.
> >
>
> Clang-tidy invokes clang using the command line
> options specified in the compile_commands.json file.
> Using gcc command line options causes a bunch of
> errors for unknown options.
>
> >
> >
> >
> >
> > Case 1)
> > Build the kernel with CC=clang,
> > and then run clang-tidy without CC=clang.
> >
> > $ make CC=clang defconfig
> > $ make CC=clang -j$(nproc)
> > $ make clang-tidy
> >
> > scripts/clang-tools/Makefile.clang-tools:13: *** clang-tidy requires
> > CC=clang.  Stop.
> >
>
> I suppose this case could allow clang-tidy to
> be run.
>
> >
> >
> >
> > Case 2)
> > Build the kernel using GCC,
> > and then run clang-tidy with CC=clang.
> >
> > $ make defconfig
> > $ make -j$(nproc)
> > $ make CC=clang clang-tidy
> >
> > This patch happily runs clang-tidy
> > although compile_commands.json
> > contains GCC commands.
> >
>
> This is the worst of the two cases. I'm not
> sure how to prevent this other than parsing the
> compiler invocation in run-clang-tools.py.
>
> I'm open to better suggestions.
>
> >
> >
> >
> >
> > So, it checks if you have passed CC=clang
> > to "make clang-tidy", where I do not see
> > any user of the $(CC) variable.
> >
> > It does not care whether you have built
> > the kernel with GCC or Clang.
> >
> >
> >
> > What happens if you run clang-tidy against
> > compile_commands.json that contains GCC
> > commands?
>
> Clang-tidy itself uses the command line options from
> compile_commands.json to invoke clang. If you run
> clang-tidy against GCC commands you get lots of
> errors similar to this
>
> Found compiler error(s).
> 12 warnings and 8 errors generated.
> Error while processing /usr/local/google/home/nhuck/linux/arch/x86/lib/iomem.c.
> error: unknown argument: '-fconserve-stack' [clang-diagnostic-error]
> error: unknown argument: '-fno-var-tracking-assignments'
> [clang-diagnostic-error]
> error: unknown argument: '-mindirect-branch-register' [clang-diagnostic-error]
> error: unknown argument: '-mindirect-branch=thunk-extern'
> [clang-diagnostic-error]
> error: unknown argument: '-mno-fp-ret-in-387' [clang-diagnostic-error]
> error: unknown argument: '-mpreferred-stack-boundary=3' [clang-diagnostic-error]
> error: unknown argument: '-mskip-rax-setup' [clang-diagnostic-error]
>
> >
> >
> > I also care about stale commands
> > in compile_commands.json.
> >
>
> I agree with this point, but it's more of a bug with
> gen_compile_commands.py. Maybe gen_compile_commands.py
> could emit a warning when stale commands are detected in the
> .*.cmd files.


Nathan, thanks for your comments.

I can improve this
so compile_commands.json contains
only commands from the last build.

Working on a patch.

-- 
Best Regards
Masahiro Yamada
