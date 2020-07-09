Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF35A21A65A
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Jul 2020 19:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728108AbgGIR4U (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 Jul 2020 13:56:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726876AbgGIR4U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Jul 2020 13:56:20 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40769C08C5CE
        for <linux-kbuild@vger.kernel.org>; Thu,  9 Jul 2020 10:56:20 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id r22so2629012qke.13
        for <linux-kbuild@vger.kernel.org>; Thu, 09 Jul 2020 10:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S8PNFrNm7Gxlphzf91I5ant8WQf2gL0zIFt6y9w6si0=;
        b=LNdIXv4NeJ+85sDvSLR6dPs/QkbfYTJSC9vLotRuaLY3qGYbmPHds9paUjZLXtNPGe
         zhY/khY1a9mgdTxxdKNqnC0XckSKE7SWqTiHByHHIZQfizm0wVcrLpwAapD+9I17/VBC
         /It9ZRSKreb6qFhGlMpdJvyPMMkqFd5iN7lu4S+vG5G6SFvstZRt1BnKvAr0S3L+C/JZ
         CiJziy4C9YI0wAl62S9jFM4r2IlccDoqz8g5j7teX+SLFyI9NyJHeXitzhahcGe/e4+u
         0OdGZsvDVu0pA5vA9EuN8so18e8T/SRfzo3rx54U4p+5QNVcpl/sZt83Cq66fMGsYGyA
         aQSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S8PNFrNm7Gxlphzf91I5ant8WQf2gL0zIFt6y9w6si0=;
        b=SpRaHnA84I4fSpXKgcz6WpqPLW2mwMTEB9yxRjvup4W+gUbF8EapHLIjkMJeWj8zgv
         xeOzR9aigCMurNK3W7PS6C/3bV1xnLK+dXg7QwPFtUOy3VcMOSgb+79caRZ8gc5YNT5R
         IGNDVNx/YvAgRTNT45/SJ5FG18iqMKPjOsmsHB/cOB8m3CrYCPGsD3S20u8n7CJcpSZK
         ITqfsmVKL94sl++KpCQ1JJVhbC47N2wldZort/XLs6inmtKY/HQmZCfQTxaQ+VcWkQjc
         at0216nhqEqMY1fM133MctPLE3i4XBVq5v4JGuIeKMMZhTaSCI9rmDZDuNaCpC7CTwzU
         j+pQ==
X-Gm-Message-State: AOAM531OKIbn8b3kJpw+4kAASyhp1/1fGhGjOfM/DoAIdyayo/h/s1fX
        icFGvtBxcfXvDqAlhlW2exLElbTG9mugABDRbf3rag==
X-Google-Smtp-Source: ABdhPJw4R5jzPmqXoog8vHmmgF6uudu+txj0ae3Iqvx7c769MVw3aNwgBCjRaGAc4Yr4hfb3KD1bXwnuq0ZvSTBVhr0=
X-Received: by 2002:a37:a185:: with SMTP id k127mr58558772qke.221.1594317379110;
 Thu, 09 Jul 2020 10:56:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200708181905.257691-1-nhuck@google.com> <CAKwvOdmKsCedU=Vt_SBSGnf4gKc9Ae4sknn_Lj+kw9f0HY5MMA@mail.gmail.com>
In-Reply-To: <CAKwvOdmKsCedU=Vt_SBSGnf4gKc9Ae4sknn_Lj+kw9f0HY5MMA@mail.gmail.com>
From:   Nathan Huckleberry <nhuck@google.com>
Date:   Thu, 9 Jul 2020 12:56:07 -0500
Message-ID: <CAJkfWY58JwBqxjHcaQDwpUMrfG_hLiBkskrTfC4EeQvDrz5Q1g@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile: Add clang-tidy and static analyzer support
 to makefile
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Tom Roeder <tmroeder@google.com>,
        Bill Wendling <morbo@google.com>,
        Pirama Arumuga Nainar <pirama@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 8, 2020 at 2:11 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> On Wed, Jul 8, 2020 at 11:21 AM 'Nathan Huckleberry' via Clang Built
> Linux <clang-built-linux@googlegroups.com> wrote:
> >
> > This patch adds clang-tidy and the clang static-analyzer as make
> > targets. The goal of this patch is to make static analysis tools
> > usable and extendable by any developer or researcher who is familiar
> > with basic c++.
> >
> > The current static analysis tools require intimate knowledge of the internal
> > workings of the static analysis.  Clang-tidy and the clang static analyzers
> > expose an easy to use api and allow users unfamiliar with clang to
> > write new checks with relative ease.
> >
> > ===Clang-tidy===
> >
> > Clang-tidy is an easily extendable 'linter' that runs on the AST.
> > Clang-tidy checks are easy to write and understand. A check consists of
> > two parts, a matcher and a checker. The matcher is created using a
> > domain specific language that acts on the AST
> > (https://clang.llvm.org/docs/LibASTMatchersReference.html).  When AST
> > nodes are found by the matcher a callback is made to the checker. The
> > checker can then execute additional checks and issue warnings.
> >
> > Here is an example clang-tidy check to report functions that have calls
> > to local_irq_disable without calls to local_irq_enable and vice-versa.
> > Functions flagged with __attribute((annotation("ignore_irq_balancing")))
> > are ignored for analysis. (https://reviews.llvm.org/D65828)
> >
> > ===Clang static analyzer===
> >
> > The clang static analyzer is a more powerful static analysis tool that
> > uses symbolic execution to find bugs. Currently there is a check that
> > looks for potential security bugs from invalid uses of kmalloc and
> > kfree. There are several more general purpose checks that are useful for
> > the kernel.
> >
> > The clang static analyzer is well documented and designed to be
> > extensible.
> > (https://clang-analyzer.llvm.org/checker_dev_manual.html)
> > (https://github.com/haoNoQ/clang-analyzer-guide/releases/download/v0.1/clang-analyzer-guide-v0.1.pdf)
> >
> > The main draw of the clang tools is how accessible they are. The clang
> > documentation is very nice and these tools are built specifically to be
> > easily extendable by any developer. They provide an accessible method of
> > bug-finding and research to people who are not overly familiar with the
> > kernel codebase.
> >
> > Signed-off-by: Nathan Huckleberry <nhuck@google.com>
> > ---
> > Changes V1 -> V2:
> > * Remove dependencies on GNU Parallel
> > * * Clang-tidy/analyzer now invoked directly from python
> > Link: https://lkml.org/lkml/2019/8/6/941
> >
> >  Makefile                                      |  3 +
> >  scripts/clang-tools/Makefile.clang-tools      | 23 ++++++
> >  .../{ => clang-tools}/gen_compile_commands.py |  0
>
> + Tom for the rename.
>
> I think we should add scripts/clang-tools/ to MAINTAINERS under
> CLANG/LLVM SUPPORT:
> ```
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c87b94e6b2f6..42602231929c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4211,6 +4211,7 @@ W:        https://clangbuiltlinux.github.io/
>  B:     https://github.com/ClangBuiltLinux/linux/issues
>  C:     irc://chat.freenode.net/clangbuiltlinux
>  F:     Documentation/kbuild/llvm.rst
> +F:     scripts/clang-tools/
>  K:     \b(?i:clang|llvm)\b
>
>  CLEANCACHE API
> ```
> that way we get cc'ed properly on proposed changes (should folks use
> scripts/get_maintainer.pl).
>
> >  scripts/clang-tools/run-clang-tools.py        | 77 +++++++++++++++++++
> >  4 files changed, 103 insertions(+)
> >  create mode 100644 scripts/clang-tools/Makefile.clang-tools
> >  rename scripts/{ => clang-tools}/gen_compile_commands.py (100%)
> >  create mode 100755 scripts/clang-tools/run-clang-tools.py
> >
> > diff --git a/Makefile b/Makefile
> > index fe0164a654c7..3e2df010b342 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -747,6 +747,7 @@ KBUILD_CFLAGS       += $(call cc-option,-fno-allow-store-data-races)
> >
> >  include scripts/Makefile.kcov
> >  include scripts/Makefile.gcc-plugins
> > +include scripts/clang-tools/Makefile.clang-tools
> >
> >  ifdef CONFIG_READABLE_ASM
> >  # Disable optimizations that make assembler listings hard to read.
> > @@ -1543,6 +1544,8 @@ help:
> >         @echo  '  export_report   - List the usages of all exported symbols'
> >         @echo  '  headerdep       - Detect inclusion cycles in headers'
> >         @echo  '  coccicheck      - Check with Coccinelle'
> > +       @echo  '  clang-analyzer  - Check with clang static analyzer'
> > +       @echo  '  clang-tidy      - Check with clang-tidy'
> >         @echo  ''
> >         @echo  'Tools:'
> >         @echo  '  nsdeps          - Generate missing symbol namespace dependencies'
> > diff --git a/scripts/clang-tools/Makefile.clang-tools b/scripts/clang-tools/Makefile.clang-tools
> > new file mode 100644
> > index 000000000000..e09dc1a8efff
> > --- /dev/null
> > +++ b/scripts/clang-tools/Makefile.clang-tools
> > @@ -0,0 +1,23 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +#
> > +# Copyright (C) Google LLC, 2020
> > +#
> > +# Author: Nathan Huckleberry <nhuck@google.com>
> > +#
> > +PHONY += clang-tidy
> > +clang-tidy:
> > +ifdef CONFIG_CC_IS_CLANG
> > +       $(PYTHON3) scripts/clang-tools/gen_compile_commands.py
> > +       $(PYTHON3) scripts/clang-tools/run-clang-tools.py clang-tidy compile_commands.json
> > +else
> > +       $(error Clang-tidy requires CC=clang)
>
> s/Clang/clang/ to match the case of the target.
>
> > +endif
> > +
> > +PHONY += clang-analyzer
> > +clang-analyzer:
> > +ifdef CONFIG_CC_IS_CLANG
> > +       $(PYTHON3) scripts/clang-tools/gen_compile_commands.py
> > +       $(PYTHON3) scripts/clang-tools/run-clang-tools.py static-analyzer compile_commands.json
> > +else
> > +       $(error Clang-analyzer requires CC=clang)
>
> s/Clang/clang/ to match the case of the target.
>
> > +endif
> > diff --git a/scripts/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
> > similarity index 100%
> > rename from scripts/gen_compile_commands.py
> > rename to scripts/clang-tools/gen_compile_commands.py
> > diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
> > new file mode 100755
> > index 000000000000..d429a150e23a
> > --- /dev/null
> > +++ b/scripts/clang-tools/run-clang-tools.py
> > @@ -0,0 +1,77 @@
> > +#!/usr/bin/env python
> > +# SPDX-License-Identifier: GPL-2.0
> > +#
> > +# Copyright (C) Google LLC, 2020
> > +#
> > +# Author: Nathan Huckleberry <nhuck@google.com>
> > +#
> > +"""A helper routine run clang-tidy and the clang static-analyzer on
> > +compile_commands.json."""
> > +
> > +import argparse
> > +import json
> > +import logging
> > +import multiprocessing
> > +import os
> > +import re
> > +import subprocess
> > +
> > +def parse_arguments():
> > +  """Set up and parses command-line arguments.
> > +  Returns:
> > +    args: Dict of parsed args
> > +      Has keys 'file' and 'type'
> > +  """
> > +  usage = """Run clang-tidy or the clang static-analyzer on a
> > +  compilation database."""
> > +  parser = argparse.ArgumentParser(description=usage)
> > +
> > +  type_help = ('Type of analysis to be performed')
> > +  parser.add_argument('type', choices=['clang-tidy', 'static-analyzer'],
> > +                      help=type_help)
> > +  file_path_help = ('Path to the compilation database to parse')
> > +  parser.add_argument('file',  type=str, help=file_path_help)
>
> I don't know if the kernel has a preferred style for Python, but I
> think it would be good to be consistent in the use of single vs double
> quotes for strings.  My preference is for double quotes, but I don't
> know enough about the various PEPs for style or if the kernel has a
> preferred style for these.
>
> + Bill who knows a bit about Python style.
>
> > +
> > +  args = parser.parse_args()
> > +
> > +  return args
> > +
> > +def init(l,t):
> > +  global lock
> > +  global analysis_type
> > +  lock = l
> > +  analysis_type = t
>
> Is this canonical Python?  Maybe wrap these functions into methods of
> an object you construct, that way you can assign these as instance
> variables against `self`, rather than using global variables.

I did this to allow shared locks between processes, see
https://stackoverflow.com/questions/25557686/python-sharing-a-lock-between-processes

>
> > +
> > +def run_analysis(entry):
> > +  filename = entry['file']
> > +  p = None
> > +  if(analysis_type == "clang-tidy"):
> > +    p = subprocess.run(["clang-tidy", "-p", os.getcwd(),
> > +                        "-checks=-*,linuxkernel-*", filename],
> > +                       stdout=subprocess.PIPE, stderr=subprocess.PIPE)
> > +  if(analysis_type == "static-analyzer"):
> > +    p = subprocess.run(["clang-tidy", "-p", os.getcwd(),
> > +                        "-checks=-*,clang-analyzer-*", filename],
> > +                       stdout=subprocess.PIPE, stderr=subprocess.PIPE)
>
> When you have a fair amount of duplication between two branches of an
> if/else (for instance, same method invocation and number of
> parameters, just slight differences in parameter values), consider if
> you can use a ternary to simplify or make the code more concise. That
> would also help avoid initializing `p` to `None`:
>
> checks = "-checks=-*,linuxkernel-*" if analysis_type == "clang-tidy"
> else "-checks=-*,clang-analyzer-*"
> p = subprocess.run(["clang-tidy", "-p", os.getcwd(), checks,
>     stdout=subprocess.PIPE, stderr=subprocess.PIPE]
>
> then maybe do some validation of the analysis_type when validating
> command line arguments earlier.

Argparse should already handle validation of the analysis type.

>
> > +  lock.acquire()
> > +  print(entry['file'])
> > +  os.write(1, p.stdout)
> > +  os.write(2, p.stderr)
>
> Please use sys.stdout and sys.stderr rather than magic constants for
> their file descriptors.
>
> > +  lock.release()
> > +
> > +
> > +def main():
> > +  args = parse_arguments()
> > +  filename = args.file
> > +
> > +  #Read JSON data into the datastore variable
> > +  if filename:
>
> Isn't there a way to make command line arguments required with
> Argparse? In that case, would you still need the conditional?
>
> > +    with open(filename, 'r') as f:
> > +      datastore = json.load(f)
> > +
> > +      lock = multiprocessing.Lock()
> > +      pool = multiprocessing.Pool(initializer=init, initargs=(lock,args.type,))
> > +      pool.map(run_analysis,datastore)
>
> Please use a space to separate parameters in a parameter list.
>
> > +
> > +if __name__ == '__main__':
> > +    main()
>
> So rather than call a function named main, you could simply construct
> an object, then call a method on it or have the constructor simply
> kick off the analysis (essentially a mix of `main` and `init`).
>
> --
> Thanks,
> ~Nick Desaulniers

Thanks,
Nathan Huckleberry
