Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B157220149
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jul 2020 02:18:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbgGOAS0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 14 Jul 2020 20:18:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725981AbgGOAS0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Jul 2020 20:18:26 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 041D4C061755
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Jul 2020 17:18:26 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id m16so369028pls.5
        for <linux-kbuild@vger.kernel.org>; Tue, 14 Jul 2020 17:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VKz0ARpq5MDLj9K45daGnPMEyKlao4XZmq4tn5REs6Q=;
        b=i6O2sMFjKkipVxCildMn6AzET2z4pdczDQE3sZOr1uwSdT3eZ65QTtVd5rG9TZCpJu
         T5PiVd+GwVHsuqNXczfnQ/yoLjLrWDHE34c6beCJTjNoKtk6ozH74O8EJFtFi2GBlB7H
         fMvwevHXqDBkTvV8xoKASTd5bj/ErMEE6X3yZq5KHjsA7g2YsStC7ElhAMmb6SXnl1mE
         dSHT/3FqVk76ABqguIEKNL9BzGqmcUW6vlqMWtlSKw3Kypb3e1qy2iFTmh/XT/usxERv
         CNqQCdlyLT7F//fp5WtJ+VE2Yom1VZF1MaEHN2vFEgLkty4et18e+oBR7f/DwLkNanhO
         6n5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VKz0ARpq5MDLj9K45daGnPMEyKlao4XZmq4tn5REs6Q=;
        b=SxrUlX4ixfessZ0zBBZOZYLx8hEaXD5kc0nVJX3ycZBmjeOkZObtGj56OAsZAEV4A0
         hOrvkv/6oMttYjGrrgmjfaNitZ3klBqDL9i2OX60rDq3Vo19KfKWgnJWC3tlgUoMxzR/
         q3a1X6K4vHby6X7tXu4V6VC0w+lXN49u4te1COR9YSUbWN2c+Nd1HAlRKW+jyIn/R7vg
         H7Tncop6CU4Nhteev2k4UIyG2RoU98A4QDhTdxtXiixkyEdRrurwZRDg+U+FFIudlfOU
         NcUWH+fWjC7EctMiFgmtRzfiGOsEnAMjpmmrNSA6IuxjzQQjNMFvQ+x/DXeqwRSisqGZ
         iDgw==
X-Gm-Message-State: AOAM533IoP4Abclq6GB/yMEZx+nGcEAi+KNlbkq3ee8V877u5iqtxKmd
        gOgpibTOS+3vcdAwVSx0CK4bzkA9L+8nYCDbpkdAMaGjbOE=
X-Google-Smtp-Source: ABdhPJwa2dzmCFcQqTMjbmnXoLW3w7WXixblDqFy52K1oh7MLD0H+RydmNx0h+dj1KgCAmDIW1rNAAkyVatrnsANveQ=
X-Received: by 2002:a17:90a:d306:: with SMTP id p6mr6741341pju.25.1594772305155;
 Tue, 14 Jul 2020 17:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200713225103.GA1095851@google.com> <20200714232349.2198114-1-nhuck@google.com>
In-Reply-To: <20200714232349.2198114-1-nhuck@google.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 14 Jul 2020 17:18:13 -0700
Message-ID: <CAKwvOdnsp=zuxbFVcbGRN+-ZH-F5UFVfKzNBfHM714WkwRZyCQ@mail.gmail.com>
Subject: Re: [PATCH v3] Makefile: Add clang-tidy and static analyzer support
 to makefile
To:     Nathan Huckleberry <nhuck@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 14, 2020 at 4:24 PM 'Nathan Huckleberry' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> This patch adds clang-tidy and the clang static-analyzer as make
> targets. The goal of this patch is to make static analysis tools
> usable and extendable by any developer or researcher who is familiar
> with basic c++.
>
> The current static analysis tools require intimate knowledge of the
> internal
> workings of the static analysis.  Clang-tidy and the clang static
> analyzers
> expose an easy to use api and allow users unfamiliar with clang to
> write new checks with relative ease.
>
> ===Clang-tidy===
>
> Clang-tidy is an easily extendable 'linter' that runs on the AST.
> Clang-tidy checks are easy to write and understand. A check consists of
> two parts, a matcher and a checker. The matcher is created using a
> domain specific language that acts on the AST
> (https://clang.llvm.org/docs/LibASTMatchersReference.html).  When AST
> nodes are found by the matcher a callback is made to the checker. The
> checker can then execute additional checks and issue warnings.
>
> Here is an example clang-tidy check to report functions that have calls
> to local_irq_disable without calls to local_irq_enable and vice-versa.
> Functions flagged with __attribute((annotation("ignore_irq_balancing")))
> are ignored for analysis. (https://reviews.llvm.org/D65828)
>
> ===Clang static analyzer===
>
> The clang static analyzer is a more powerful static analysis tool that
> uses symbolic execution to find bugs. Currently there is a check that
> looks for potential security bugs from invalid uses of kmalloc and
> kfree. There are several more general purpose checks that are useful for
> the kernel.
>
> The clang static analyzer is well documented and designed to be
> extensible.
> (https://clang-analyzer.llvm.org/checker_dev_manual.html)
> (https://github.com/haoNoQ/clang-analyzer-guide/releases/download/v0.1/clang-analyzer-guide-v0.1.pdf)
>
> The main draw of the clang tools is how accessible they are. The clang
> documentation is very nice and these tools are built specifically to be
> easily extendable by any developer. They provide an accessible method of
> bug-finding and research to people who are not overly familiar with the
> kernel codebase.
>
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>
> ---
> Changes v2 -> v3
> * Redirect clang-tidy output to stderr
> * Style fixes
> * Add directory to MAINTAINERS
>  MAINTAINERS                                   |  1 +
>  Makefile                                      |  3 +
>  scripts/clang-tools/Makefile.clang-tools      | 23 +++++++
>  .../{ => clang-tools}/gen_compile_commands.py |  0
>  scripts/clang-tools/run-clang-tools.py        | 69 +++++++++++++++++++
>  5 files changed, 96 insertions(+)
>  create mode 100644 scripts/clang-tools/Makefile.clang-tools
>  rename scripts/{ => clang-tools}/gen_compile_commands.py (100%)
>  create mode 100755 scripts/clang-tools/run-clang-tools.py
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1d4aa7f942de..a444564e5572 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4198,6 +4198,7 @@ W:        https://clangbuiltlinux.github.io/
>  B:     https://github.com/ClangBuiltLinux/linux/issues
>  C:     irc://chat.freenode.net/clangbuiltlinux
>  F:     Documentation/kbuild/llvm.rst
> +F:     scripts/clang-tools/
>  K:     \b(?i:clang|llvm)\b
>
>  CLEANCACHE API
> diff --git a/Makefile b/Makefile
> index fe0164a654c7..3e2df010b342 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -747,6 +747,7 @@ KBUILD_CFLAGS       += $(call cc-option,-fno-allow-store-data-races)
>
>  include scripts/Makefile.kcov
>  include scripts/Makefile.gcc-plugins
> +include scripts/clang-tools/Makefile.clang-tools
>
>  ifdef CONFIG_READABLE_ASM
>  # Disable optimizations that make assembler listings hard to read.
> @@ -1543,6 +1544,8 @@ help:
>         @echo  '  export_report   - List the usages of all exported symbols'
>         @echo  '  headerdep       - Detect inclusion cycles in headers'
>         @echo  '  coccicheck      - Check with Coccinelle'
> +       @echo  '  clang-analyzer  - Check with clang static analyzer'
> +       @echo  '  clang-tidy      - Check with clang-tidy'
>         @echo  ''
>         @echo  'Tools:'
>         @echo  '  nsdeps          - Generate missing symbol namespace dependencies'
> diff --git a/scripts/clang-tools/Makefile.clang-tools b/scripts/clang-tools/Makefile.clang-tools
> new file mode 100644
> index 000000000000..7ad3308c1937
> --- /dev/null
> +++ b/scripts/clang-tools/Makefile.clang-tools
> @@ -0,0 +1,23 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Copyright (C) Google LLC, 2020
> +#
> +# Author: Nathan Huckleberry <nhuck@google.com>
> +#
> +PHONY += clang-tidy
> +clang-tidy:
> +ifdef CONFIG_CC_IS_CLANG
> +       $(PYTHON3) scripts/clang-tools/gen_compile_commands.py
> +       $(PYTHON3) scripts/clang-tools/run-clang-tools.py clang-tidy compile_commands.json
> +else
> +       $(error clang-tidy requires CC=clang)
> +endif
> +
> +PHONY += clang-analyzer
> +clang-analyzer:
> +ifdef CONFIG_CC_IS_CLANG
> +       $(PYTHON3) scripts/clang-tools/gen_compile_commands.py
> +       $(PYTHON3) scripts/clang-tools/run-clang-tools.py static-analyzer compile_commands.json

^ note below on `static-analyzer`

> +else
> +       $(error clang-analyzer requires CC=clang)
> +endif
> diff --git a/scripts/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
> similarity index 100%
> rename from scripts/gen_compile_commands.py
> rename to scripts/clang-tools/gen_compile_commands.py
> diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
> new file mode 100755
> index 000000000000..00b8532c1729
> --- /dev/null
> +++ b/scripts/clang-tools/run-clang-tools.py
> @@ -0,0 +1,69 @@
> +#!/usr/bin/env python
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Copyright (C) Google LLC, 2020
> +#
> +# Author: Nathan Huckleberry <nhuck@google.com>
> +#
> +"""A helper routine run clang-tidy and the clang static-analyzer on
> +compile_commands.json."""
> +
> +import argparse
> +import json
> +import logging
> +import multiprocessing
> +import os
> +import subprocess
> +import sys
> +
> +def parse_arguments():
> +  """Set up and parses command-line arguments.
> +  Returns:
> +    args: Dict of parsed args
> +      Has keys "file" and "type"
> +  """
> +  usage = """Run clang-tidy or the clang static-analyzer on a
> +  compilation database."""
> +  parser = argparse.ArgumentParser(description=usage)
> +
> +  type_help = ("Type of analysis to be performed")
> +  parser.add_argument("type", choices=["clang-tidy", "static-analyzer"],

Rather than "static-analyzer", how about "clang-analyzer" to be
consistent with the `make` target?  Top level Makefile would need to
pass that here, too.

> +                      help=type_help)
> +  file_path_help = ("Path to the compilation database to parse")
> +  parser.add_argument("file",  type=str, help=file_path_help)
> +
> +  args = parser.parse_args()
> +
> +  return args
> +
> +def init(l,t):
> +  global lock
> +  global analysis_type
> +  lock = l
> +  analysis_type = t
> +
> +def run_analysis(entry):
> +  filename = entry["file"]
> +  checks = "-checks=-*,linuxkernel-*" if (analysis_type == "clang-tidy") else "-checks=-*,clang-analyzer-*"

I'm not sure that the parens are necessary ^, but it's not a big
enough deal to necessitate a v4, IMO.

Though this is still running `-*,` for static-analyzer which I would
like removed.

> +  p = subprocess.run(["clang-tidy", "-p", os.getcwd(),
> +                    checks, filename],
> +                    stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
> +  lock.acquire()
> +  print(filename, file=sys.stderr)

Should we drop printing the filename? Analyzing the output of `make
LLVM=1 -j71 defconfig clang-tidy 2> log.txt`, for example I see:
Error while processing
/linux-next/drivers/net/ethernet/freescale/fman/fman_sp.c.
...
<hundreds of lines from different files>
drivers/net/ethernet/freescale/fman/fman_sp.c

It's surprising to me how these appear out of order; maybe buffering
or not has something to do with it?

Anyways, if we print the filename anyways per error, and files with no
errors are just printed kind of meaninglessly, then I think we don't
need to print the filename being analyzed again.  For clang-analyzer,
the errors also have the filename per line of the warning printed.

> +  sys.stderr.buffer.write(p.stdout)
> +  lock.release()
> +
> +
> +def main():
> +  args = parse_arguments()
> +  filename = args.file
> +
> +  #Read JSON data into the datastore variable
> +  with open(filename, "r") as f:
> +    datastore = json.load(f)
> +    lock = multiprocessing.Lock()
> +    pool = multiprocessing.Pool(initializer=init, initargs=(lock, args.type))
> +    pool.map(run_analysis,datastore)
> +
> +if __name__ == "__main__":
> +    main()
> --


-- 
Thanks,
~Nick Desaulniers
