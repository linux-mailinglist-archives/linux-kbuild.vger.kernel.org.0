Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA61EA272D
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Aug 2019 21:18:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728294AbfH2TSC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Aug 2019 15:18:02 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:38292 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728512AbfH2TSC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Aug 2019 15:18:02 -0400
Received: by mail-pl1-f194.google.com with SMTP id w11so2047863plp.5
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Aug 2019 12:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=h82RDi7ZzNpfF4AJAy2P12pYrYk0GOcUf/rAKW7b39I=;
        b=Fewo6YSb0G8pbm3NVKWjPJJ4aQFAxcAV3z7nvn0LVcFYaw7bkl+6v7OtUiPmt6wUfM
         2EM/xtMH3lZd7ShILVPWS5BUvWb0zp4FAMGMSxRS7/Ew0BcT8FGXbJrxhNRlsu5Oq4tn
         diDwd55+pIbAB+cxaj8HItHF91ZVzOxlfA2sE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=h82RDi7ZzNpfF4AJAy2P12pYrYk0GOcUf/rAKW7b39I=;
        b=KqXqQ0niqYr8d0GhW/vUdPD0lwjnihyQkglKbyo4TA8NTWDYYUK4pXv3L7ZSfTbnpI
         tklRdYCOHinnujVvihuyClp75ZPJ57grAutuW9HX+6Z2N/gD7kSN6fpv6QMrOdbenxbF
         AN4AdepWh1o1EL+X97SAfNnO+z1qhlmeON0JzlCiv2OyTeKWLNHYZiPGBUR1DSHuOJxM
         jFLZqlmFZf/loX/Kxi0z4Iaf1XwQB20xxOWCHAPb/tTmSB164LKI6+eNvzX/eizYQUH1
         V2Fl/j/Tn8GPFb1cbRy9reTDuTuNRR0h/iBBCbedO6BA0469kXdC9vmhYPGbNdmxvoTl
         Qplw==
X-Gm-Message-State: APjAAAVxEaVQ1JOnNxDmPpvW8weE/6Ia9bcka/p4KuZPu9PDD9EVy6mr
        v1ieFgGmF/STaYZ6d1+Nwj02qA==
X-Google-Smtp-Source: APXvYqw4GZuiFmnQGygCrZqfj45t3uqYtoewMkGQCWXIWByBT0W7CGLcM9R2RYYyfi2vJ7sPhMzpdg==
X-Received: by 2002:a17:902:9889:: with SMTP id s9mr11870896plp.100.1567106281373;
        Thu, 29 Aug 2019 12:18:01 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c35sm2864072pgl.72.2019.08.29.12.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 12:18:00 -0700 (PDT)
Date:   Thu, 29 Aug 2019 12:17:59 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Nathan Huckleberry <nhuck@google.com>
Cc:     mark.rutland@arm.com, clang-built-linux@googlegroups.com,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] Add clang-tidy and static analyzer support to
 makefile
Message-ID: <201908291207.3AE0872B88@keescook>
References: <20190806211047.232709-1-nhuck@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190806211047.232709-1-nhuck@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

[ Added kbuild and Masahiro to CC ... ]

On Tue, Aug 06, 2019 at 02:10:46PM -0700, Nathan Huckleberry wrote:
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>
> ---

These two lines should be at the end of your commit log. :)

> These patches add clang-tidy and the clang static-analyzer as make
> targets. The goal of these patches is to make static analysis tools
> usable and extendable by any developer or researcher who is familiar
> with basic c++.
> 
> The current static analysis tools require intimate knowledge of the internal
> workings of the static analysis.  Clang-tidy and the clang static analyzers
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
> are ignored for analysis.
> 
> The full patch can be found here (https://reviews.llvm.org/D65828)
> 
> ```
> void IrqUnbalancedCheck::registerMatchers(MatchFinder *Finder) {
>   // finds calls to "arch_local_irq_disable" in a function body
>   auto disable =
>               forEachDescendant(
>                   callExpr(
>                       hasDeclaration(
>                           namedDecl(
>                               hasName("arch_local_irq_disable")))).bind("disable"));
> 
>   // finds calls to "arch_local_irq_enable" in a function body
>   auto enable =
>               forEachDescendant(
>                   callExpr(
>                       hasDeclaration(
>                           namedDecl(
>                               hasName("arch_local_irq_enable")))).bind("enable"));
> 
>   // Looks for function body that has the following property:
>   // ((disable && !enable) || (enable && !disable))
>   auto matcher = functionDecl(
>       anyOf(allOf(disable, unless(enable)), allOf(enable, unless(disable))));
> 
>   Finder->addMatcher(matcher.bind("func"), this);
> }
> 
> std::string annotation = "ignore_irq_balancing";
> void IrqUnbalancedCheck::check(const MatchFinder::MatchResult &Result) {
>   const auto *MatchedDecl = Result.Nodes.getNodeAs<FunctionDecl>("func");
>   const auto *DisableCall = Result.Nodes.getNodeAs<CallExpr>("disable");
>   const auto *EnableCall = Result.Nodes.getNodeAs<CallExpr>("enable");
> 
>   // If the function has __attribute((annotate("ignore_irq_balancing"))
>   for (const auto *Attr : MatchedDecl->attrs()) {
>     if (Attr->getKind() == clang::attr::Annotate) {
>       if(dyn_cast<AnnotateAttr>(Attr)->getAnnotation().str() == annotation) {
>         return;
>       }
>     }
>   }
> 
>   if(EnableCall) {
>     diag(MatchedDecl->getLocation(), "call to 'enable_local_irq' without 'disable_local_irq' in %0 ")
>         << MatchedDecl;
>     diag(EnableCall->getBeginLoc(), "call to 'enable_local_irq'", DiagnosticIDs::Note)
>         << MatchedDecl;
>   }
> 
>   if(DisableCall) {
>     diag(MatchedDecl->getLocation(), "call to 'disable_local_irq' without 'enable_local_irq' in %0 ")
>         << MatchedDecl;
>     diag(DisableCall->getBeginLoc(), "call to 'disable_local_irq'", DiagnosticIDs::Note)
>         << MatchedDecl;
>   }
> }
> ```
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
> 
> Why add clang-tidy and the clang static analyzer when other static
> analyzers are already in the kernel?
> 
> The main draw of the clang tools is how accessible they are. The clang
> documentation is very nice and these tools are built specifically to be
> easily extendable by any developer. They provide an accessible method of
> bug-finding and research to people who are not overly familiar with the
> kernel codebase.
> 

^ i.e. they should be right here...

>  Makefile                                      |  3 ++
>  scripts/clang-tools/Makefile.clang-tools      | 35 ++++++++++++++
>  .../{ => clang-tools}/gen_compile_commands.py |  0
>  scripts/clang-tools/parse_compile_commands.py | 47 +++++++++++++++++++
>  4 files changed, 85 insertions(+)
>  create mode 100644 scripts/clang-tools/Makefile.clang-tools
>  rename scripts/{ => clang-tools}/gen_compile_commands.py (100%)
>  create mode 100755 scripts/clang-tools/parse_compile_commands.py
> 
> diff --git a/Makefile b/Makefile
> index fabc127d127f..49f1d3fa48a8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -709,6 +709,7 @@ KBUILD_CFLAGS	+= $(call cc-option,--param=allow-store-data-races=0)
>  
>  include scripts/Makefile.kcov
>  include scripts/Makefile.gcc-plugins
> +include scripts/clang-tools/Makefile.clang-tools
>  
>  ifdef CONFIG_READABLE_ASM
>  # Disable optimizations that make assembler listings hard to read.
> @@ -1470,6 +1471,8 @@ help:
>  	@echo  '  headers_check   - Sanity check on exported headers'
>  	@echo  '  headerdep       - Detect inclusion cycles in headers'
>  	@echo  '  coccicheck      - Check with Coccinelle'
> +	@echo  '  clang-analyzer  - Check with clang static analyzer'
> +	@echo  '  clang-tidy      - Check with clang-tidy'

I think this is great; more people will be able to run these tests.

>  	@echo  ''
>  	@echo  'Kernel selftest:'
>  	@echo  '  kselftest       - Build and run kernel selftest (run as root)'
> diff --git a/scripts/clang-tools/Makefile.clang-tools b/scripts/clang-tools/Makefile.clang-tools
> new file mode 100644
> index 000000000000..0adb6df20777
> --- /dev/null
> +++ b/scripts/clang-tools/Makefile.clang-tools
> @@ -0,0 +1,35 @@
> +# SPDX-License-Identifier: GPL-2.0
> +PHONY += clang-tidy
> +HAS_PARALLEL := $(shell (parallel --version 2> /dev/null) | grep 'GNU parallel' 2> /dev/null)
> +clang-tidy:
> +ifdef CONFIG_CC_IS_CLANG
> +	$(PYTHON3) scripts/clang-tools/gen_compile_commands.py
> +ifdef HAS_PARALLEL

Is it worth falling back to xargs? Are there builders where clang-tidy
or clang-analyzer are installed but parallel isn't? (i.e. it might just
be better to simply require parallel.) Note that there's no test for
python3 -- we just try to run it. :)

> +	#Xargs interleaves multiprocessed output. GNU Parallel does not.
> +	scripts/clang-tools/parse_compile_commands.py compile_commands.json \
> +		| parallel -k -j $(shell nproc) 'echo {} && clang-tidy -p . "-checks=-*,linuxkernel-*" {}'
> +else
> +	@echo "GNU parallel is not installed. Defaulting to non-parallelized runs"
> +	scripts/clang-tools/parse_compile_commands.py compile_commands.json \
> +		| xargs -L 1 -I@ sh -c "echo '@' && clang-tidy -p . '-checks=-*,linuxkernel-*' @"
> +endif
> +else
> +	$(error Clang-tidy requires CC=clang)
> +endif
> +
> +PHONY += clang-analyzer
> +clang-analyzer:
> +ifdef CONFIG_CC_IS_CLANG
> +	$(PYTHON3) scripts/clang-tools/gen_compile_commands.py
> +ifdef HAS_PARALLEL
> +	#Xargs interleaves multiprocessed output. GNU Parallel does not.
> +	scripts/clang-tools/parse_compile_commands.py compile_commands.json \
> +		| parallel -k -j $(shell nproc) 'echo {} && clang-tidy -p . "-checks=-*,clang-analyzer-*" {}'
> +else
> +	@echo "GNU parallel is not installed. Defaulting to non-parallelized runs"
> +	scripts/clang-tools/parse_compile_commands.py compile_commands.json \
> +		| xargs -L 1 -I@ sh -c "echo '@' && clang-tidy -p . '-checks=-*,clang-analyzer-*' @"
> +endif
> +else
> +	$(error Clang-analyzer requires CC=clang)
> +endif
> diff --git a/scripts/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
> similarity index 100%
> rename from scripts/gen_compile_commands.py
> rename to scripts/clang-tools/gen_compile_commands.py
> diff --git a/scripts/clang-tools/parse_compile_commands.py b/scripts/clang-tools/parse_compile_commands.py
> new file mode 100755
> index 000000000000..d6bc1bf9951e
> --- /dev/null
> +++ b/scripts/clang-tools/parse_compile_commands.py
> @@ -0,0 +1,47 @@
> +#!/usr/bin/env python
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Copyright (C) Google LLC, 2019
> +#
> +# Author: Nathan Huckleberry <nhuck@google.com>
> +#
> +"""A helper routine for make clang-tidy to parse compile_commands.json."""
> +
> +import argparse
> +import json
> +import logging
> +import os
> +import re
> +
> +def parse_arguments():
> +  """Set up and parses command-line arguments.
> +  Returns:
> +    file_path: Path to compile_commands.json file
> +  """
> +  usage = """Parse a compilation database and return a list of files
> +  included in the database"""
> +  parser = argparse.ArgumentParser(description=usage)
> +
> +  file_path_help = ('Path to the compilation database to parse')
> +  parser.add_argument('file',  type=str, help=file_path_help)
> +
> +  args = parser.parse_args()
> +
> +  return args.file
> +
> +
> +def main():
> +  filename = parse_arguments()
> +
> +  #Read JSON data into the datastore variable
> +  if filename:
> +    with open(filename, 'r') as f:
> +      datastore = json.load(f)
> +
> +      #Use the new datastore datastructure
> +      for entry in datastore:
> +        print(entry['file'])
> +
> +
> +if __name__ == '__main__':
> +    main()

And this is nice to have because now there is a real consumer of
gen_compile_commands.py.

-- 
Kees Cook
