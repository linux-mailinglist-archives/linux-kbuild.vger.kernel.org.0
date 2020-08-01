Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BCBA235427
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Aug 2020 21:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727058AbgHATXR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 1 Aug 2020 15:23:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727006AbgHATXR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 1 Aug 2020 15:23:17 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7FE0C06174A;
        Sat,  1 Aug 2020 12:23:16 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id k8so12066137wma.2;
        Sat, 01 Aug 2020 12:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=lxmrQBrFfZXvQ6G6prEpJ8xP8QVgrd72b+FrTGiwTRo=;
        b=BpS7JGPus75dtD3/ruZu4z4zMLaODhAjMs+ax3hyyB/ekrXzxUDzJHvFibBmKWbooo
         wYMUH8HILczR/ih7+p0t4PFBbY10Jvkx5nthOTfzeBmsKN/myqyNeTezD5rQTd+FB8HB
         PQLzUhTGydLjrz3HwrvX2SM49QcyFXGcMy2VDlfhXbHHPSBLbXw0PaQNXSaL/Jm/oKxY
         IqXkJ1qixYWi+0cIrKleykSOpfFM9LW5CdVYgHqopGkyvYehSUejOoXHy60sbgUebXar
         g26X8RR+sP1bsgh6PiJ/QivU1wgrQ5VH/ClYrmzdQzTTDDtchLV9+8COPmjikwKqbvzm
         kGXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=lxmrQBrFfZXvQ6G6prEpJ8xP8QVgrd72b+FrTGiwTRo=;
        b=tcMo6r8Yo4rs4mHAhEWBERN/vMYoOURr4aGoZOiXK2eeXd/kfZSTVfuHYRuyRNcjA1
         BjLeZywxNAU++eO1rnzXNf5VA0wkytKabzVk7GANu3GkDWCjxZP9evqEbaRm2OilRPSg
         7anj7yLlOFF/Nb41fiCKbMvZTURFvsLifqQH5CjZzLMnNFLuomW9dulbFM/0BbLmevrx
         Q6Y9WLWgmpIuv2uH8QSdPuUw2fL5K33U3MEbGC5oNFT+J+7jD98y7xbuaLHqKRSDWbGy
         pQkm0UI5fMi4jiHrkZQ3OKIPvCwmjKjiYob/nwM0naDva+ABp5BzRqS/YO+1AlzhPhQm
         /uXA==
X-Gm-Message-State: AOAM533agcwpO91Az1GBJpCb3s6OElTtRXB07VI4POT3rTgfmGVlvwP7
        0vfeDhUfHtURjJoqkXRJ/Nw=
X-Google-Smtp-Source: ABdhPJwE+m5AhLY0PPEfsjnGYu+BjMU8Cd4C2Lx5q/WTi4q+PKvWtvRS/km9+9pLa6mxBuIZEm9pvw==
X-Received: by 2002:a7b:c3d4:: with SMTP id t20mr8929822wmj.8.1596309795243;
        Sat, 01 Aug 2020 12:23:15 -0700 (PDT)
Received: from felia ([2001:16b8:2de0:f200:cdcf:e9a1:5247:ee26])
        by smtp.gmail.com with ESMTPSA id g70sm17425448wmg.24.2020.08.01.12.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2020 12:23:14 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date:   Sat, 1 Aug 2020 21:23:05 +0200 (CEST)
X-X-Sender: lukas@felia
To:     Nathan Huckleberry <nhuck@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>
cc:     masahiroy@kernel.org, michal.lkml@markovi.net,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com, pirama@google.com,
        morbo@google.com
Subject: Re: [PATCH v7] Makefile: Add clang-tidy and static analyzer support
 to makefile
In-Reply-To: <20200728004736.3590053-1-nhuck@google.com>
Message-ID: <alpine.DEB.2.21.2008012031540.14646@felia>
References: <CAKwvOdnni_G2tw+0eCLQQvvdcz97Fy1-cBjzPvLwbBNDu1-KqQ@mail.gmail.com> <20200728004736.3590053-1-nhuck@google.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On Tue, 28 Jul 2020, 'Nathan Huckleberry' via Clang Built Linux wrote:

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

Hi Nathan, Hi Nick,

I have been busy with other topics around the kernel and static analysis; 
but then, I read clang and static analysis in my mailbox in this patch.

So, I thought let me give this patch a try on the weekend.

I applied the patch on next-2020729; that worked.

Then:
$ make clang-tidy
scripts/clang-tools/Makefile.clang-tools:13: *** clang-tidy requires 
CC=clang.  Stop.

Okay, that is a good and clear error message.

Then:

$ make CC=clang-10 defconfig
$ make CC=clang-10 clang-tidy

python3 scripts/clang-tools/gen_compile_commands.py
WARNING: Found 8 entries. Have you compiled the kernel?
python3 scripts/clang-tools/run-clang-tools.py clang-tidy 
compile_commands.json
 
Then actually an error in clang-tidy.
Error: no checks enabled.
USAGE: clang-tidy [options] <source0> [... <sourceN>]
...

I will get to that later how I fixed that for my setup.

Okay, good, that is clear... I need to compile it first, got it.

$ make CC=clang-10
$ make CC=clang-10 clang-tidy

Okay, I run except for the fix I needed.

Where is the output from clang-tidy?

It prints:

python3 scripts/clang-tools/gen_compile_commands.py
python3 scripts/clang-tools/run-clang-tools.py clang-tidy compile_commands.json

That is it. Does that mean 0 warnings, or where do I find the output?
The script suggests it should be in stderr once all the parallel runs 
collected it, right?

I was confused; maybe a short summary output might help here.

Then, I ran

$ make CC=clang-10 clang-analyzer

And I see a lot of warnings... I guess that is intended.

There is a lot of:

Suppressed XX warnings (XX in non-user code).
Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.

To an outsider, it is unclear if that is intended or if the tool is broken 
in this setup.

Is there are way to silent that meta-warning? Or is my setup broken?

In summary, it is pretty clear how to run clang-tidy and clang-analyzer 
and it was a pretty smooth experience, even with no documentation at hand.

It was fun for me. Keep up the good work!

Just one issue... see below.

> ---
> Changes v6->v7
> * Fix issues with relative paths
> * Additional style fixes
>  MAINTAINERS                                   |  1 +
>  Makefile                                      |  3 +
>  scripts/clang-tools/Makefile.clang-tools      | 23 ++++++
>  .../{ => clang-tools}/gen_compile_commands.py |  0
>  scripts/clang-tools/run-clang-tools.py        | 74 +++++++++++++++++++
>  5 files changed, 101 insertions(+)
>  create mode 100644 scripts/clang-tools/Makefile.clang-tools
>  rename scripts/{ => clang-tools}/gen_compile_commands.py (100%)
>  create mode 100755 scripts/clang-tools/run-clang-tools.py
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1d4aa7f942de..a444564e5572 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4198,6 +4198,7 @@ W:	https://clangbuiltlinux.github.io/
>  B:	https://github.com/ClangBuiltLinux/linux/issues
>  C:	irc://chat.freenode.net/clangbuiltlinux
>  F:	Documentation/kbuild/llvm.rst
> +F:	scripts/clang-tools/
>  K:	\b(?i:clang|llvm)\b
>  
>  CLEANCACHE API
> diff --git a/Makefile b/Makefile
> index fe0164a654c7..3e2df010b342 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -747,6 +747,7 @@ KBUILD_CFLAGS	+= $(call cc-option,-fno-allow-store-data-races)
>  
>  include scripts/Makefile.kcov
>  include scripts/Makefile.gcc-plugins
> +include scripts/clang-tools/Makefile.clang-tools
>  
>  ifdef CONFIG_READABLE_ASM
>  # Disable optimizations that make assembler listings hard to read.
> @@ -1543,6 +1544,8 @@ help:
>  	@echo  '  export_report   - List the usages of all exported symbols'
>  	@echo  '  headerdep       - Detect inclusion cycles in headers'
>  	@echo  '  coccicheck      - Check with Coccinelle'
> +	@echo  '  clang-analyzer  - Check with clang static analyzer'
> +	@echo  '  clang-tidy      - Check with clang-tidy'
>  	@echo  ''
>  	@echo  'Tools:'
>  	@echo  '  nsdeps          - Generate missing symbol namespace dependencies'
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
> +	$(PYTHON3) scripts/clang-tools/gen_compile_commands.py
> +	$(PYTHON3) scripts/clang-tools/run-clang-tools.py clang-tidy compile_commands.json
> +else
> +	$(error clang-tidy requires CC=clang)
> +endif
> +
> +PHONY += clang-analyzer
> +clang-analyzer:
> +ifdef CONFIG_CC_IS_CLANG
> +	$(PYTHON3) scripts/clang-tools/gen_compile_commands.py
> +	$(PYTHON3) scripts/clang-tools/run-clang-tools.py clang-analyzer compile_commands.json
> +else
> +	$(error clang-analyzer requires CC=clang)
> +endif
> diff --git a/scripts/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
> similarity index 100%
> rename from scripts/gen_compile_commands.py
> rename to scripts/clang-tools/gen_compile_commands.py
> diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
> new file mode 100755
> index 000000000000..fa7655c7cec0
> --- /dev/null
> +++ b/scripts/clang-tools/run-clang-tools.py
> @@ -0,0 +1,74 @@
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
> +        Has keys: [path, type]
> +    """
> +    usage = """Run clang-tidy or the clang static-analyzer on a
> +        compilation database."""
> +    parser = argparse.ArgumentParser(description=usage)
> +
> +    type_help = "Type of analysis to be performed"
> +    parser.add_argument("type",
> +                        choices=["clang-tidy", "clang-analyzer"],
> +                        help=type_help)
> +    path_help = "Path to the compilation database to parse"
> +    parser.add_argument("path", type=str, help=path_help)
> +
> +    return parser.parse_args()
> +
> +
> +def init(l, a):
> +    global lock
> +    global args
> +    lock = l
> +    args = a
> +
> +
> +def run_analysis(entry):
> +    # Disable all checks, then re-enable the ones we want
> +    checks = "-checks=-*,"
> +    if args.type == "clang-tidy":
> +        checks += "linuxkernel-*"
> +    else:
> +        checks += "clang-analyzer-*"
> +    p = subprocess.run(["clang-tidy", "-p", args.path, checks, entry["file"]],

You hardcoded here: clang-tidy

But in my Ubuntu 18.04 setup, I got multiple versions of clang and 
clang-tidy installed; yeah, maybe my setup is broken, but maybe those from 
others are similar.

When I run:

  make CC=clang-10 clang-tidy

it picks up the "wrong" clang-tidy version...

My setup is:

$ which clang-tidy
/usr/bin/clang-tidy

$ which clang-tidy-10
/usr/bin/clang-tidy-10

$ clang-tidy --version
LLVM (http://llvm.org/):
  LLVM version 6.0.0
  
  Optimized build.
  Default target: x86_64-pc-linux-gnu
  Host CPU: znver1

$ clang-tidy-10 --version
LLVM (http://llvm.org/):
  LLVM version 10.0.1
  
  Optimized build.
  Default target: x86_64-pc-linux-gnu
  Host CPU: znver1

When I run make CC=clang-10 clang-tidy, I would expect it to use 
clang-tidy-10, not clang-tidy. (clang-tidy errors just because it is too 
old; I guess it does have the linuxkernel-* options.)

Now, I cannot fix that without touching your script. There is no way I can 
tell the build target to use clang-tidy-10.

With a quick touch:

-    p = subprocess.run(["clang-tidy", "-p", args.path, checks, entry["file"]],
+    p = subprocess.run(["clang-tidy-10", "-p", args.path, checks, entry["file"]],

I got it to work.

Maybe you have a good idea how to get make clang-tidy to pick 
up the intended version without touching the python script itself?

It is a minor issue, but it would be nice if that setting would work 
somehow.

Thanks a lot.

Best regards,

Lukas

> +                       stdout=subprocess.PIPE,
> +                       stderr=subprocess.STDOUT,
> +                       cwd=entry["directory"])
> +    with lock:
> +        sys.stderr.buffer.write(p.stdout)
> +
> +
> +def main():
> +    args = parse_arguments()
> +
> +    lock = multiprocessing.Lock()
> +    pool = multiprocessing.Pool(initializer=init, initargs=(lock, args))
> +    # Read JSON data into the datastore variable
> +    with open(args.path, "r") as f:
> +        datastore = json.load(f)
> +        pool.map(run_analysis, datastore)
> +
> +
> +if __name__ == "__main__":
> +    main()
> -- 
> 2.28.0.rc0.142.g3c755180ce-goog
> 
> -- 
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200728004736.3590053-1-nhuck%40google.com.
> 
