Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03E2A21E332
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jul 2020 00:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726374AbgGMWvK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 13 Jul 2020 18:51:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726352AbgGMWvJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Jul 2020 18:51:09 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6A59C061794
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Jul 2020 15:51:08 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id k27so6707659pgm.2
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Jul 2020 15:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Yxq+7dE6xEVUHxQe706vzk/qOVJY6KeawtslG9XNswQ=;
        b=IQYbkY+ke4pMQVMfhjtud9t2hEkfeqMEine2CKmMCX6J0YcdSYkkUniqSU9NU2ta3T
         4fUf6hI2VmuQZRZZC5fwnJxfP1/NS9DWvki14kLhmdFudf3LDxj/qK+lZGgTOT0NkzaS
         DZBPlYbh3UdftpbzWH4Kw8A/E91xvDsMVarj+iZP/E4MbATJ+gxQMDg9SfX/Wqr3A/SK
         Owh2tt5wlRvwFjlxO1YjNQawx1/mGqAmTHlBBeORNCjVJ5VVolIc58Qb8Pupv/Q0dPNO
         Bm7WHlbOrhz+6cQryiZU/VgsPLd2q0TX8lpCSEQaimOpGR5lcwG4dW6/VLuCErT+tjW0
         TpuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Yxq+7dE6xEVUHxQe706vzk/qOVJY6KeawtslG9XNswQ=;
        b=OXrgjbr4biJ4yvb+uKjJZX1Z5dUSoI6t8et81ywoyr6P5t7F+AUyZC/7q2mzLns0bw
         OMMyqjRorKU7ao8VjyBFswDLEWYyOaBg5rior+Yhirn4/zDDFoop9Fx4pGIVDUshehoC
         EfU63xHblrI6EgaeG7FztYErqWOAPC6cNs8mdByBrBHmquu1sqPLlE2kefvbbt4hzcOi
         GVwTLkquRsAaQmdI621lsicWvtriKFJLuKER5bSRWfCtkJBlR3Ss627/WvecU3PkILA+
         8MVUnRGST8mqM756zBgzhFmQJI5mqR9Gb+ai1w2Kxtbzyk2krb6s78ArjyVKsffC+cOp
         j6yQ==
X-Gm-Message-State: AOAM533rGdfF9iiAU+O2iTcBotK/nrQcH/G4my5pnSk9gGUL1XTthrMM
        np+6NZID8u97dHBukoJzdTD0Ng==
X-Google-Smtp-Source: ABdhPJy7gGzzIXb6g+DdNRqNKIS2jm1T8j45qN3AlRcPOwcovsWyEgFuf5/JbZgrn/Ri3Kkznjio0A==
X-Received: by 2002:a65:6884:: with SMTP id e4mr1036008pgt.283.1594680667940;
        Mon, 13 Jul 2020 15:51:07 -0700 (PDT)
Received: from google.com ([2620:0:1008:1101:7220:84ff:fe09:dc21])
        by smtp.gmail.com with ESMTPSA id c1sm526129pje.9.2020.07.13.15.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 15:51:07 -0700 (PDT)
Date:   Mon, 13 Jul 2020 15:51:03 -0700
From:   Tom Roeder <tmroeder@google.com>
To:     Nathan Huckleberry <nhuck@google.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Bill Wendling <morbo@google.com>,
        Pirama Arumuga Nainar <pirama@google.com>
Subject: Re: [PATCH v2] Makefile: Add clang-tidy and static analyzer support
 to makefile
Message-ID: <20200713225103.GA1095851@google.com>
References: <20200708181905.257691-1-nhuck@google.com>
 <CAKwvOdmKsCedU=Vt_SBSGnf4gKc9Ae4sknn_Lj+kw9f0HY5MMA@mail.gmail.com>
 <CAJkfWY58JwBqxjHcaQDwpUMrfG_hLiBkskrTfC4EeQvDrz5Q1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAJkfWY58JwBqxjHcaQDwpUMrfG_hLiBkskrTfC4EeQvDrz5Q1g@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jul 09, 2020 at 12:56:07PM -0500, Nathan Huckleberry wrote:
>On Wed, Jul 8, 2020 at 2:11 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
>>
>> On Wed, Jul 8, 2020 at 11:21 AM 'Nathan Huckleberry' via Clang Built
>> Linux <clang-built-linux@googlegroups.com> wrote:
>> >
>> > This patch adds clang-tidy and the clang static-analyzer as make
>> > targets. The goal of this patch is to make static analysis tools
>> > usable and extendable by any developer or researcher who is familiar
>> > with basic c++.
>> >
>> > The current static analysis tools require intimate knowledge of the internal
>> > workings of the static analysis.  Clang-tidy and the clang static analyzers
>> > expose an easy to use api and allow users unfamiliar with clang to
>> > write new checks with relative ease.
>> >
>> > ===Clang-tidy===
>> >
>> > Clang-tidy is an easily extendable 'linter' that runs on the AST.
>> > Clang-tidy checks are easy to write and understand. A check consists of
>> > two parts, a matcher and a checker. The matcher is created using a
>> > domain specific language that acts on the AST
>> > (https://clang.llvm.org/docs/LibASTMatchersReference.html).  When AST
>> > nodes are found by the matcher a callback is made to the checker. The
>> > checker can then execute additional checks and issue warnings.
>> >
>> > Here is an example clang-tidy check to report functions that have calls
>> > to local_irq_disable without calls to local_irq_enable and vice-versa.
>> > Functions flagged with __attribute((annotation("ignore_irq_balancing")))
>> > are ignored for analysis. (https://reviews.llvm.org/D65828)
>> >
>> > ===Clang static analyzer===
>> >
>> > The clang static analyzer is a more powerful static analysis tool that
>> > uses symbolic execution to find bugs. Currently there is a check that
>> > looks for potential security bugs from invalid uses of kmalloc and
>> > kfree. There are several more general purpose checks that are useful for
>> > the kernel.
>> >
>> > The clang static analyzer is well documented and designed to be
>> > extensible.
>> > (https://clang-analyzer.llvm.org/checker_dev_manual.html)
>> > (https://github.com/haoNoQ/clang-analyzer-guide/releases/download/v0.1/clang-analyzer-guide-v0.1.pdf)
>> >
>> > The main draw of the clang tools is how accessible they are. The clang
>> > documentation is very nice and these tools are built specifically to be
>> > easily extendable by any developer. They provide an accessible method of
>> > bug-finding and research to people who are not overly familiar with the
>> > kernel codebase.
>> >
>> > Signed-off-by: Nathan Huckleberry <nhuck@google.com>
>> > ---
>> > Changes V1 -> V2:
>> > * Remove dependencies on GNU Parallel
>> > * * Clang-tidy/analyzer now invoked directly from python
>> > Link: https://lkml.org/lkml/2019/8/6/941
>> >
>> >  Makefile                                      |  3 +
>> >  scripts/clang-tools/Makefile.clang-tools      | 23 ++++++
>> >  .../{ => clang-tools}/gen_compile_commands.py |  0
>>
>> + Tom for the rename.

The rename is fine with me.

>>
>> I think we should add scripts/clang-tools/ to MAINTAINERS under
>> CLANG/LLVM SUPPORT:
>> ```
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index c87b94e6b2f6..42602231929c 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -4211,6 +4211,7 @@ W:        https://clangbuiltlinux.github.io/
>>  B:     https://github.com/ClangBuiltLinux/linux/issues
>>  C:     irc://chat.freenode.net/clangbuiltlinux
>>  F:     Documentation/kbuild/llvm.rst
>> +F:     scripts/clang-tools/
>>  K:     \b(?i:clang|llvm)\b
>>
>>  CLEANCACHE API
>> ```
>> that way we get cc'ed properly on proposed changes (should folks use
>> scripts/get_maintainer.pl).
>>
>> >  scripts/clang-tools/run-clang-tools.py        | 77 +++++++++++++++++++
>> >  4 files changed, 103 insertions(+)
>> >  create mode 100644 scripts/clang-tools/Makefile.clang-tools
>> >  rename scripts/{ => clang-tools}/gen_compile_commands.py (100%)
>> >  create mode 100755 scripts/clang-tools/run-clang-tools.py
>> >
>> > diff --git a/Makefile b/Makefile
>> > index fe0164a654c7..3e2df010b342 100644
>> > --- a/Makefile
>> > +++ b/Makefile
>> > @@ -747,6 +747,7 @@ KBUILD_CFLAGS       += $(call cc-option,-fno-allow-store-data-races)
>> >
>> >  include scripts/Makefile.kcov
>> >  include scripts/Makefile.gcc-plugins
>> > +include scripts/clang-tools/Makefile.clang-tools
>> >
>> >  ifdef CONFIG_READABLE_ASM
>> >  # Disable optimizations that make assembler listings hard to read.
>> > @@ -1543,6 +1544,8 @@ help:
>> >         @echo  '  export_report   - List the usages of all exported symbols'
>> >         @echo  '  headerdep       - Detect inclusion cycles in headers'
>> >         @echo  '  coccicheck      - Check with Coccinelle'
>> > +       @echo  '  clang-analyzer  - Check with clang static analyzer'
>> > +       @echo  '  clang-tidy      - Check with clang-tidy'
>> >         @echo  ''
>> >         @echo  'Tools:'
>> >         @echo  '  nsdeps          - Generate missing symbol namespace dependencies'
>> > diff --git a/scripts/clang-tools/Makefile.clang-tools b/scripts/clang-tools/Makefile.clang-tools
>> > new file mode 100644
>> > index 000000000000..e09dc1a8efff
>> > --- /dev/null
>> > +++ b/scripts/clang-tools/Makefile.clang-tools
>> > @@ -0,0 +1,23 @@
>> > +# SPDX-License-Identifier: GPL-2.0
>> > +#
>> > +# Copyright (C) Google LLC, 2020
>> > +#
>> > +# Author: Nathan Huckleberry <nhuck@google.com>
>> > +#
>> > +PHONY += clang-tidy
>> > +clang-tidy:
>> > +ifdef CONFIG_CC_IS_CLANG
>> > +       $(PYTHON3) scripts/clang-tools/gen_compile_commands.py
>> > +       $(PYTHON3) scripts/clang-tools/run-clang-tools.py clang-tidy compile_commands.json
>> > +else
>> > +       $(error Clang-tidy requires CC=clang)
>>
>> s/Clang/clang/ to match the case of the target.
>>
>> > +endif
>> > +
>> > +PHONY += clang-analyzer
>> > +clang-analyzer:
>> > +ifdef CONFIG_CC_IS_CLANG
>> > +       $(PYTHON3) scripts/clang-tools/gen_compile_commands.py
>> > +       $(PYTHON3) scripts/clang-tools/run-clang-tools.py static-analyzer compile_commands.json
>> > +else
>> > +       $(error Clang-analyzer requires CC=clang)
>>
>> s/Clang/clang/ to match the case of the target.
>>
>> > +endif
>> > diff --git a/scripts/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
>> > similarity index 100%
>> > rename from scripts/gen_compile_commands.py
>> > rename to scripts/clang-tools/gen_compile_commands.py
>> > diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
>> > new file mode 100755
>> > index 000000000000..d429a150e23a
>> > --- /dev/null
>> > +++ b/scripts/clang-tools/run-clang-tools.py
>> > @@ -0,0 +1,77 @@
>> > +#!/usr/bin/env python
>> > +# SPDX-License-Identifier: GPL-2.0
>> > +#
>> > +# Copyright (C) Google LLC, 2020
>> > +#
>> > +# Author: Nathan Huckleberry <nhuck@google.com>
>> > +#
>> > +"""A helper routine run clang-tidy and the clang static-analyzer on
>> > +compile_commands.json."""
>> > +
>> > +import argparse
>> > +import json
>> > +import logging
>> > +import multiprocessing
>> > +import os
>> > +import re
>> > +import subprocess
>> > +
>> > +def parse_arguments():
>> > +  """Set up and parses command-line arguments.
>> > +  Returns:
>> > +    args: Dict of parsed args
>> > +      Has keys 'file' and 'type'
>> > +  """
>> > +  usage = """Run clang-tidy or the clang static-analyzer on a
>> > +  compilation database."""
>> > +  parser = argparse.ArgumentParser(description=usage)
>> > +
>> > +  type_help = ('Type of analysis to be performed')
>> > +  parser.add_argument('type', choices=['clang-tidy', 'static-analyzer'],
>> > +                      help=type_help)
>> > +  file_path_help = ('Path to the compilation database to parse')
>> > +  parser.add_argument('file',  type=str, help=file_path_help)
>>
>> I don't know if the kernel has a preferred style for Python, but I
>> think it would be good to be consistent in the use of single vs double
>> quotes for strings.  My preference is for double quotes, but I don't
>> know enough about the various PEPs for style or if the kernel has a
>> preferred style for these.
>>
>> + Bill who knows a bit about Python style.
>>
>> > +
>> > +  args = parser.parse_args()
>> > +
>> > +  return args
>> > +
>> > +def init(l,t):
>> > +  global lock
>> > +  global analysis_type
>> > +  lock = l
>> > +  analysis_type = t
>>
>> Is this canonical Python?  Maybe wrap these functions into methods of
>> an object you construct, that way you can assign these as instance
>> variables against `self`, rather than using global variables.
>
>I did this to allow shared locks between processes, see
>https://stackoverflow.com/questions/25557686/python-sharing-a-lock-between-processes
>
>>
>> > +
>> > +def run_analysis(entry):
>> > +  filename = entry['file']
>> > +  p = None
>> > +  if(analysis_type == "clang-tidy"):
>> > +    p = subprocess.run(["clang-tidy", "-p", os.getcwd(),
>> > +                        "-checks=-*,linuxkernel-*", filename],
>> > +                       stdout=subprocess.PIPE, stderr=subprocess.PIPE)
>> > +  if(analysis_type == "static-analyzer"):
>> > +    p = subprocess.run(["clang-tidy", "-p", os.getcwd(),
>> > +                        "-checks=-*,clang-analyzer-*", filename],
>> > +                       stdout=subprocess.PIPE, stderr=subprocess.PIPE)
>>
>> When you have a fair amount of duplication between two branches of an
>> if/else (for instance, same method invocation and number of
>> parameters, just slight differences in parameter values), consider if
>> you can use a ternary to simplify or make the code more concise. That
>> would also help avoid initializing `p` to `None`:
>>
>> checks = "-checks=-*,linuxkernel-*" if analysis_type == "clang-tidy"
>> else "-checks=-*,clang-analyzer-*"
>> p = subprocess.run(["clang-tidy", "-p", os.getcwd(), checks,
>>     stdout=subprocess.PIPE, stderr=subprocess.PIPE]
>>
>> then maybe do some validation of the analysis_type when validating
>> command line arguments earlier.
>
>Argparse should already handle validation of the analysis type.
>
>>
>> > +  lock.acquire()
>> > +  print(entry['file'])
>> > +  os.write(1, p.stdout)
>> > +  os.write(2, p.stderr)
>>
>> Please use sys.stdout and sys.stderr rather than magic constants for
>> their file descriptors.
>>
>> > +  lock.release()
>> > +
>> > +
>> > +def main():
>> > +  args = parse_arguments()
>> > +  filename = args.file
>> > +
>> > +  #Read JSON data into the datastore variable
>> > +  if filename:
>>
>> Isn't there a way to make command line arguments required with
>> Argparse? In that case, would you still need the conditional?
>>
>> > +    with open(filename, 'r') as f:
>> > +      datastore = json.load(f)
>> > +
>> > +      lock = multiprocessing.Lock()
>> > +      pool = multiprocessing.Pool(initializer=init, initargs=(lock,args.type,))
>> > +      pool.map(run_analysis,datastore)
>>
>> Please use a space to separate parameters in a parameter list.
>>
>> > +
>> > +if __name__ == '__main__':
>> > +    main()
>>
>> So rather than call a function named main, you could simply construct
>> an object, then call a method on it or have the constructor simply
>> kick off the analysis (essentially a mix of `main` and `init`).
>>
>> --
>> Thanks,
>> ~Nick Desaulniers
>
>Thanks,
>Nathan Huckleberry
