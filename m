Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E01622B5FE
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Jul 2020 20:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbgGWSpk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 23 Jul 2020 14:45:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbgGWSpk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Jul 2020 14:45:40 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E61D5C0619E2
        for <linux-kbuild@vger.kernel.org>; Thu, 23 Jul 2020 11:45:39 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 207so3468339pfu.3
        for <linux-kbuild@vger.kernel.org>; Thu, 23 Jul 2020 11:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UR7P+fyHf9A6kuWvdMYE4bbXsulfV8lg4DAiwVHXuHw=;
        b=s3ca5fuDl9tu2QDOQdNENTv+dhgOpKy3a0JLkQqpy0iTJWyf3OUdGUlrA+pEwchWH6
         WW7Wpna86AVUWEqhtj3Bm9gNAeLlCbC8W/XOWyLB8YKEzPZ+NQ+/XKrIntyEdeNI5Wye
         Uq/MPm+hPKt8vNbuxUimHWePfBh7gqSbBKaaOmaJSYJapQ0CeIfPKN+HZh4qZ0UbHmYe
         k9SQsyeQqM39BruuNINtoLWDX3DD0Rn19Q/eiryQ62vcpgjmAUpZ0IJ11xY6QK3I51Qv
         gwTPBmWsnyjNQY3FL45ZwsFhpn+kKk/zlj3j5F8B57jfJwW6ZEG33GVLm/X+gDM/7bXh
         OFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UR7P+fyHf9A6kuWvdMYE4bbXsulfV8lg4DAiwVHXuHw=;
        b=mDVlvIr8lGAK+nogVPDqP7+eyIzHW1PAyPPySOeXh9LDKobvVpg3QIfi73QwSdwlK0
         0c99LGDO50T+yrJ6TUCNQfphJ6YJQFSBoR/hr5WiSlTLGwNWP3wDyZF8ksnKtD6VuUFS
         iM+8vKWaTh2W8Buc7dn37QRk/SE8S7GBWapZoucc/XVmbK5axWpS/VpgO5X4AgkOptVV
         2kgpCa8c0eeCOlpu5UmtZnWERRbVo+TDbWL5s/MShqAmocTWa5te3ye0oY27RHRMqyoo
         I/Nplw3Gtp0mgnpL5up9HCYqwXmpd1Z+/JYFEyMwUJCHEsbJKfA+QVdM45Mtwl9Idvcg
         wxRg==
X-Gm-Message-State: AOAM533V+EanMUHs/cdxeS7vRdc8PzL2ct5QyFa7zzSBTLdLTpxHMh9i
        6e8CUNBcJNgw9kHghArqvW+dKNq9tBVneZUyOH7kOA==
X-Google-Smtp-Source: ABdhPJzX1Xd6FkBr2LEFlw1vXZV/iwXdCH5ywbduQwU9K7R68U0eZQnVnUbIFk2PVWDn9XG0l3Q6aUkpFu6tO1LTFMc=
X-Received: by 2002:a63:a119:: with SMTP id b25mr5260107pgf.10.1595529938904;
 Thu, 23 Jul 2020 11:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAGG=3QUSOnosdPs7XMWdGdcOWNy_jYrFWT2evb9EwjWSUWaORQ@mail.gmail.com>
 <20200722231045.1421735-1-nhuck@google.com>
In-Reply-To: <20200722231045.1421735-1-nhuck@google.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 23 Jul 2020 11:45:27 -0700
Message-ID: <CAKwvOdnMS98=4Q_D0DTECGBv8i+A62xDjTS89WtkePr_wME=_A@mail.gmail.com>
Subject: Re: [PATCH v5] Makefile: Add clang-tidy and static analyzer support
 to makefile
To:     Nathan Huckleberry <nhuck@google.com>,
        Bill Wendling <morbo@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Pirama Arumuga Nainar <pirama@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 22, 2020 at 4:11 PM 'Nathan Huckleberry' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> This patch adds clang-tidy and the clang static-analyzer as make
> targets. The goal of this patch is to make static analysis tools
> usable and extendable by any developer or researcher who is familiar
> with basic c++.
>
> The current static analysis tools require intimate knowledge of the
> internal workings of the static analysis. Clang-tidy and the clang
> static analyzers expose an easy to use api and allow users unfamiliar
> with clang to write new checks with relative ease.
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
> Changes v4->v5
> * Use PEP8 style
> * Other misc style fixes
>  MAINTAINERS                                   |  1 +
>  Makefile                                      |  3 +
>  scripts/clang-tools/Makefile.clang-tools      | 23 ++++++
>  .../{ => clang-tools}/gen_compile_commands.py |  0
>  scripts/clang-tools/run-clang-tools.py        | 76 +++++++++++++++++++
>  5 files changed, 103 insertions(+)
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
> index 000000000000..5c9d76f77595
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
> +       $(PYTHON3) scripts/clang-tools/run-clang-tools.py clang-analyzer compile_commands.json
> +else
> +       $(error clang-analyzer requires CC=clang)
> +endif
> diff --git a/scripts/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
> similarity index 100%
> rename from scripts/gen_compile_commands.py
> rename to scripts/clang-tools/gen_compile_commands.py
> diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
> new file mode 100755
> index 000000000000..41ed15d99933
> --- /dev/null
> +++ b/scripts/clang-tools/run-clang-tools.py
> @@ -0,0 +1,76 @@
> +#!/usr/bin/env python
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Copyright (C) Google LLC, 2020
> +#
> +# Author: Nathan Huckleberry <nhuck@google.com>
> +#
> +"""A helper routine run clang-tidy and the clang static-analyzer on
> +compile_commands.json.
> +"""
> +
> +import argparse
> +import json
> +import logging
> +import multiprocessing
> +import os
> +import subprocess
> +import sys
> +
> +
> +def parse_arguments():
> +    """Set up and parses command-line arguments.
> +    Returns:
> +        args: Dict of parsed args
> +        Has keys: [file, type]
> +    """
> +    usage = """Run clang-tidy or the clang static-analyzer on a
> +        compilation database."""
> +    parser = argparse.ArgumentParser(description=usage)
> +
> +    type_help = "Type of analysis to be performed"
> +    parser.add_argument("type",
> +                        choices=["clang-tidy", "clang-analyzer"],
> +                        help=type_help)
> +    file_path_help = "Path to the compilation database to parse"
> +    parser.add_argument("file", type=str, help=file_path_help)
> +
> +    args = parser.parse_args()
> +
> +    return args
> +
> +
> +def init(l, t):
> +    global lock
> +    global analysis_type
> +    lock = l
> +    analysis_type = t
> +
> +
> +def run_analysis(entry):
> +    filename = entry["file"]
> +    # Disable all checks, then re-enable the ones we want
> +    checks = "-checks=-*,{}".format("linuxkernel-*" if analysis_type ==
> +                                    "clang-tidy" else "clang-analyzer-*")


ugh, sorry, I have one last nit.  This line bothers me for two reasons:
1. The use of ternary statements is preferred when it is more concise
than than an if/else statement.  If the ternary doesn't fit on one
line, is it still more concise?  The wrapping of the condition here
is...upsetting.
2. `format` is nice when string interpolation is needed within the
middle of a string, but when you're simply appending to the end of a
string, it might be more concise to use the `+=` operator.

I think this statement would would be nicer as:
```python
checks = "-check=-*,"
checks += "linuxkernel-*" if analysis_type == "clang-tidy" else
"clang-analyzer-*"
```
If PEP8 requires line length <= 80; then maybe
```python
checks = "-check=-*,"
if analysis_type == "clang-tidy":
  checks += "linuxkernel-*"
else:
  checks += "clang-analyzer-*"
```
is more appropriate.  Bill, thoughts?

> +    p = subprocess.run(
> +        ["clang-tidy", "-p", os.getcwd(), checks, filename],
> +        stdout=subprocess.PIPE,
> +        stderr=subprocess.STDOUT)
> +    with lock:
> +        sys.stderr.buffer.write(p.stdout)
> +
> +
> +def main():
> +    args = parse_arguments()
> +    filename = args.file
> +
> +    lock = multiprocessing.Lock()
> +    pool = multiprocessing.Pool(initializer=init, initargs=(lock, args.type))
> +    # Read JSON data into the datastore variable
> +    with open(filename, "r") as f:
> +        datastore = json.load(f)
> +        pool.map(run_analysis, datastore)
> +
> +
> +if __name__ == "__main__":
> +    main()
> --
> 2.28.0.rc0.105.gf9edc3c819-goog
>
> --

-- 
Thanks,
~Nick Desaulniers
