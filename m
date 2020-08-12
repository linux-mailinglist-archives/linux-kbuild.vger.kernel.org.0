Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85BBA2423AC
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Aug 2020 03:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgHLBYT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 11 Aug 2020 21:24:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726235AbgHLBYT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Aug 2020 21:24:19 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AD8FC061787
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Aug 2020 18:24:18 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id s16so389928qtn.7
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Aug 2020 18:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ewSouZ9fpSEqZWpAjbpVyaVqXVUq6CVMjFsKBDahtnA=;
        b=lZsU7VTCLsPtWPM/L3bqU+0m2kixqI2GJ46B2K+lUDagXWPvRVXoj1AdyZ6B4KoHJC
         Cf1mMvr0sO7LIXAJ6d2BEvX5vE8RYJmmchMngdYY360bUtzyeydNsd7e1OecIXsA4FMb
         CM9v3hRVaJzn4rbkz+gMPc0ZC/w/PoGCDNEwgb1SKDfAZisfk555leoGQxBS1AwHUyBb
         PKCxR0emj9skP4EzKF3a/xPM72PYAa3moFbS3B301da8BI3b2gSeuZKGSjS6dywDYHAQ
         TQdOU73hqhn6vse2RnmJ5Q7VrxWIsE99auT5DgwTSUx7oVgEPr38UuPrVwx85v7lswBd
         vI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ewSouZ9fpSEqZWpAjbpVyaVqXVUq6CVMjFsKBDahtnA=;
        b=WEK+nR9zmNa9+ZJhV6Tg4+Bm7rJ3ZDZ5V1n0/ejaZP6ApFzm+QCQl3JwBsDUZt+/B2
         uCykF8ZhKsUJNQgh1pczTg6HVFtP9wEOHYeoaxIoLwNdMAUtfFlBHIJnmK3VUQhJSlgo
         FP3unYm7C4UauJXqt4y7pARi1l6pofwvLVpbXEeJbkAhinEwb/xpswoeNFdP4ipQs4yo
         2yW9vVks9xyOhprSG7ia9IfgfujH01qvp0O5SClPBiPkYKkb63p5vEjWz6fqu8DYYQKk
         yIin87WPvtEBzm4vD9nyv1ORmuu8vXawdW53/4/G5iakREvFIoXtMXtAHLx0kbX88WST
         RUVw==
X-Gm-Message-State: AOAM531v3VbylCBD+77JkHa6hvrtWLXAcFrrnbcNyVoTKaInbm1kUhNa
        z6Zmd/PsJ4LMmHmUZjMD6KCrCX5nyTE14yUN6DAc9w==
X-Google-Smtp-Source: ABdhPJxSoECnj7cKPvhQqD6TsZLpmFHvnLieALQ4Afa1wq3Ducda4IRFPNWsrQs2hFst5g7YfcaqMWwn0Mk27rewDAk=
X-Received: by 2002:ac8:7c87:: with SMTP id y7mr4131359qtv.375.1597195456411;
 Tue, 11 Aug 2020 18:24:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOdnni_G2tw+0eCLQQvvdcz97Fy1-cBjzPvLwbBNDu1-KqQ@mail.gmail.com>
 <20200728004736.3590053-1-nhuck@google.com> <CAK7LNAT-AO9_Y-qunRvPbBYf7GZnoE6bxYKFNtcdKAKV8d_A+w@mail.gmail.com>
 <CAJkfWY5ywOtO6fAyPd0B2BjEWamJRRMgg4et0uVq2bpkJSECwA@mail.gmail.com> <CAK7LNAQVdhMraYejrTsGZSLFJDk4CVf6ke-bsQ7kaDUM2Lf4SA@mail.gmail.com>
In-Reply-To: <CAK7LNAQVdhMraYejrTsGZSLFJDk4CVf6ke-bsQ7kaDUM2Lf4SA@mail.gmail.com>
From:   Nathan Huckleberry <nhuck@google.com>
Date:   Tue, 11 Aug 2020 20:24:04 -0500
Message-ID: <CAJkfWY5kooS1cPFq+3s0oFT8=O_vszAMnJ8BBOmy084oi+4tgw@mail.gmail.com>
Subject: Re: [PATCH v7] Makefile: Add clang-tidy and static analyzer support
 to makefile
To:     Masahiro Yamada <masahiroy@kernel.org>
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

Sounds good. Do you think this patch is ready to land then?

On Thu, Aug 6, 2020 at 5:10 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Fri, Aug 7, 2020 at 6:42 AM 'Nathan Huckleberry' via Clang Built
> Linux <clang-built-linux@googlegroups.com> wrote:
> >
> > On Thu, Aug 6, 2020 at 3:44 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > On Tue, Jul 28, 2020 at 9:47 AM Nathan Huckleberry <nhuck@google.com> wrote:
> > > >
> > > > This patch adds clang-tidy and the clang static-analyzer as make
> > > > targets. The goal of this patch is to make static analysis tools
> > > > usable and extendable by any developer or researcher who is familiar
> > > > with basic c++.
> > > >
> > > > The current static analysis tools require intimate knowledge of the
> > > > internal workings of the static analysis. Clang-tidy and the clang
> > > > static analyzers expose an easy to use api and allow users unfamiliar
> > > > with clang to write new checks with relative ease.
> > > >
> > > > ===Clang-tidy===
> > > >
> > > > Clang-tidy is an easily extendable 'linter' that runs on the AST.
> > > > Clang-tidy checks are easy to write and understand. A check consists of
> > > > two parts, a matcher and a checker. The matcher is created using a
> > > > domain specific language that acts on the AST
> > > > (https://clang.llvm.org/docs/LibASTMatchersReference.html).  When AST
> > > > nodes are found by the matcher a callback is made to the checker. The
> > > > checker can then execute additional checks and issue warnings.
> > > >
> > > > Here is an example clang-tidy check to report functions that have calls
> > > > to local_irq_disable without calls to local_irq_enable and vice-versa.
> > > > Functions flagged with __attribute((annotation("ignore_irq_balancing")))
> > > > are ignored for analysis. (https://reviews.llvm.org/D65828)
> > > >
> > > > ===Clang static analyzer===
> > > >
> > > > The clang static analyzer is a more powerful static analysis tool that
> > > > uses symbolic execution to find bugs. Currently there is a check that
> > > > looks for potential security bugs from invalid uses of kmalloc and
> > > > kfree. There are several more general purpose checks that are useful for
> > > > the kernel.
> > > >
> > > > The clang static analyzer is well documented and designed to be
> > > > extensible.
> > > > (https://clang-analyzer.llvm.org/checker_dev_manual.html)
> > > > (https://github.com/haoNoQ/clang-analyzer-guide/releases/download/v0.1/clang-analyzer-guide-v0.1.pdf)
> > > >
> > > > The main draw of the clang tools is how accessible they are. The clang
> > > > documentation is very nice and these tools are built specifically to be
> > > > easily extendable by any developer. They provide an accessible method of
> > > > bug-finding and research to people who are not overly familiar with the
> > > > kernel codebase.
> > > >
> > > > Signed-off-by: Nathan Huckleberry <nhuck@google.com>
> > > > ---
> > > > Changes v6->v7
> > > > * Fix issues with relative paths
> > > > * Additional style fixes
> > > >  MAINTAINERS                                   |  1 +
> > > >  Makefile                                      |  3 +
> > > >  scripts/clang-tools/Makefile.clang-tools      | 23 ++++++
> > > >  .../{ => clang-tools}/gen_compile_commands.py |  0
> > > >  scripts/clang-tools/run-clang-tools.py        | 74 +++++++++++++++++++
> > > >  5 files changed, 101 insertions(+)
> > > >  create mode 100644 scripts/clang-tools/Makefile.clang-tools
> > > >  rename scripts/{ => clang-tools}/gen_compile_commands.py (100%)
> > > >  create mode 100755 scripts/clang-tools/run-clang-tools.py
> > > >
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index 1d4aa7f942de..a444564e5572 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -4198,6 +4198,7 @@ W:        https://clangbuiltlinux.github.io/
> > > >  B:     https://github.com/ClangBuiltLinux/linux/issues
> > > >  C:     irc://chat.freenode.net/clangbuiltlinux
> > > >  F:     Documentation/kbuild/llvm.rst
> > > > +F:     scripts/clang-tools/
> > > >  K:     \b(?i:clang|llvm)\b
> > > >
> > > >  CLEANCACHE API
> > > > diff --git a/Makefile b/Makefile
> > > > index fe0164a654c7..3e2df010b342 100644
> > > > --- a/Makefile
> > > > +++ b/Makefile
> > > > @@ -747,6 +747,7 @@ KBUILD_CFLAGS       += $(call cc-option,-fno-allow-store-data-races)
> > > >
> > > >  include scripts/Makefile.kcov
> > > >  include scripts/Makefile.gcc-plugins
> > > > +include scripts/clang-tools/Makefile.clang-tools
> > > >
> > > >  ifdef CONFIG_READABLE_ASM
> > > >  # Disable optimizations that make assembler listings hard to read.
> > > > @@ -1543,6 +1544,8 @@ help:
> > > >         @echo  '  export_report   - List the usages of all exported symbols'
> > > >         @echo  '  headerdep       - Detect inclusion cycles in headers'
> > > >         @echo  '  coccicheck      - Check with Coccinelle'
> > > > +       @echo  '  clang-analyzer  - Check with clang static analyzer'
> > > > +       @echo  '  clang-tidy      - Check with clang-tidy'
> > > >         @echo  ''
> > > >         @echo  'Tools:'
> > > >         @echo  '  nsdeps          - Generate missing symbol namespace dependencies'
> > > > diff --git a/scripts/clang-tools/Makefile.clang-tools b/scripts/clang-tools/Makefile.clang-tools
> > > > new file mode 100644
> > > > index 000000000000..5c9d76f77595
> > > > --- /dev/null
> > > > +++ b/scripts/clang-tools/Makefile.clang-tools
> > > > @@ -0,0 +1,23 @@
> > > > +# SPDX-License-Identifier: GPL-2.0
> > > > +#
> > > > +# Copyright (C) Google LLC, 2020
> > > > +#
> > > > +# Author: Nathan Huckleberry <nhuck@google.com>
> > > > +#
> > > > +PHONY += clang-tidy
> > > > +clang-tidy:
> > > > +ifdef CONFIG_CC_IS_CLANG
> > > > +       $(PYTHON3) scripts/clang-tools/gen_compile_commands.py
> > > > +       $(PYTHON3) scripts/clang-tools/run-clang-tools.py clang-tidy compile_commands.json
> > > > +else
> > > > +       $(error clang-tidy requires CC=clang)
> > > > +endif
> > > > +
> > > > +PHONY += clang-analyzer
> > > > +clang-analyzer:
> > > > +ifdef CONFIG_CC_IS_CLANG
> > > > +       $(PYTHON3) scripts/clang-tools/gen_compile_commands.py
> > > > +       $(PYTHON3) scripts/clang-tools/run-clang-tools.py clang-analyzer compile_commands.json
> > > > +else
> > > > +       $(error clang-analyzer requires CC=clang)
> > > > +endif
> > >
> > >
> > >
> > > You can unify the almost same two rules.
> > >
> > > PHONY += clang-tidy clang-analyzer
> > > clang-tidy clang-analyzer:
> > > ifdef CONFIG_CC_IS_CLANG
> > >         $(PYTHON3) scripts/clang-tools/gen_compile_commands.py
> > >         $(PYTHON3) scripts/clang-tools/run-clang-tools.py $@
> > > compile_commands.json
> > > else
> > >         $(error $@ requires CC=clang)
> > > endif
> > >
> >
> > I like this.
> >
> > >
> > >
> > >
> > > But, before we proceed, please tell me
> > > what this check is intended for.
> > >
> >
> > Clang-tidy invokes clang using the command line
> > options specified in the compile_commands.json file.
> > Using gcc command line options causes a bunch of
> > errors for unknown options.
> >
> > >
> > >
> > >
> > >
> > > Case 1)
> > > Build the kernel with CC=clang,
> > > and then run clang-tidy without CC=clang.
> > >
> > > $ make CC=clang defconfig
> > > $ make CC=clang -j$(nproc)
> > > $ make clang-tidy
> > >
> > > scripts/clang-tools/Makefile.clang-tools:13: *** clang-tidy requires
> > > CC=clang.  Stop.
> > >
> >
> > I suppose this case could allow clang-tidy to
> > be run.
> >
> > >
> > >
> > >
> > > Case 2)
> > > Build the kernel using GCC,
> > > and then run clang-tidy with CC=clang.
> > >
> > > $ make defconfig
> > > $ make -j$(nproc)
> > > $ make CC=clang clang-tidy
> > >
> > > This patch happily runs clang-tidy
> > > although compile_commands.json
> > > contains GCC commands.
> > >
> >
> > This is the worst of the two cases. I'm not
> > sure how to prevent this other than parsing the
> > compiler invocation in run-clang-tools.py.
> >
> > I'm open to better suggestions.
> >
> > >
> > >
> > >
> > >
> > > So, it checks if you have passed CC=clang
> > > to "make clang-tidy", where I do not see
> > > any user of the $(CC) variable.
> > >
> > > It does not care whether you have built
> > > the kernel with GCC or Clang.
> > >
> > >
> > >
> > > What happens if you run clang-tidy against
> > > compile_commands.json that contains GCC
> > > commands?
> >
> > Clang-tidy itself uses the command line options from
> > compile_commands.json to invoke clang. If you run
> > clang-tidy against GCC commands you get lots of
> > errors similar to this
> >
> > Found compiler error(s).
> > 12 warnings and 8 errors generated.
> > Error while processing /usr/local/google/home/nhuck/linux/arch/x86/lib/iomem.c.
> > error: unknown argument: '-fconserve-stack' [clang-diagnostic-error]
> > error: unknown argument: '-fno-var-tracking-assignments'
> > [clang-diagnostic-error]
> > error: unknown argument: '-mindirect-branch-register' [clang-diagnostic-error]
> > error: unknown argument: '-mindirect-branch=thunk-extern'
> > [clang-diagnostic-error]
> > error: unknown argument: '-mno-fp-ret-in-387' [clang-diagnostic-error]
> > error: unknown argument: '-mpreferred-stack-boundary=3' [clang-diagnostic-error]
> > error: unknown argument: '-mskip-rax-setup' [clang-diagnostic-error]
> >
> > >
> > >
> > > I also care about stale commands
> > > in compile_commands.json.
> > >
> >
> > I agree with this point, but it's more of a bug with
> > gen_compile_commands.py. Maybe gen_compile_commands.py
> > could emit a warning when stale commands are detected in the
> > .*.cmd files.
>
>
> Nathan, thanks for your comments.
>
> I can improve this
> so compile_commands.json contains
> only commands from the last build.
>
> Working on a patch.
>
> --
> Best Regards
> Masahiro Yamada
