Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4046721E2DA
	for <lists+linux-kbuild@lfdr.de>; Tue, 14 Jul 2020 00:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbgGMWJj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 13 Jul 2020 18:09:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgGMWJi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Jul 2020 18:09:38 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0E73C061755
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Jul 2020 15:09:38 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id x72so6654342pfc.6
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Jul 2020 15:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ii9mc3yCq8mIv2xeGZGNAM8723q3fkKzZkvXtrPuIp4=;
        b=JyJazuncFHFbLjr2C5+Mwd7+2JyrrEz6NiBYMhbSNrAZ+VY7R8rsHYv7eFywxAA7YB
         ADyNBsRyhl5XzFz68i0oNLLwA6LlKmqE0w/NXl8Zr0orFCFfx2b3uLO2+LGtiIRW+VAz
         NI34r+7YjGjDFdEFRMTYQ495v5r2qCkcr/3+M7AP8/AmKDnGdfD2vEuM2Ab6iix+W+I7
         7SvVQJqVKRn1Xs8qhObmlY8Glf0Z4FuAMp3Zq5LaRbuqYSIZXPQ6TPj0CA96q414SmUm
         7vrzw//0NJWm0m3IWzzYuyZZ0k2GDqSJeUNLdsE4R0DWlOZ2Ej8TbtT2gTqNXvsa2zk7
         c+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ii9mc3yCq8mIv2xeGZGNAM8723q3fkKzZkvXtrPuIp4=;
        b=eflMX+SGJ2odo51zZ320DqT9DC6oeWv+MkUu+JzkJXHia9qcXZUM8O1G12f5JxoYBk
         /Jd8p7LHP9a+QKHqxRNxJAhkAAjkpOwbaDOCgAoyCpOuwFDfOIcG4Yq43bOypb/Oav5v
         of+8DoFfaEhCiNezIDSuodmvSvjv2POQcZTrSbopvZCffr9KMlrTBNh8wmjkD0hN8zaj
         g2E1C1pCnGfwH1OVrTdn0VCJTESWPkkYnXdOZ6xBbGLHoOXVcEsc3mEj7u+AXxkfQ2rV
         R0QaVHYj4z+a9VtpM9nddPEsVQ97Zl8NvRhW4guk9CoVBrWO3wSkZk8JyCi8/7bL8dO0
         La3A==
X-Gm-Message-State: AOAM532M9trCm2ShYYD+TUqFZwa8libOvAn6q/bojoVjURtLJQHwJuvk
        n4mn+92/GFcHW/E6zoN1q5LgEl5PB3eC7jJJ5aptsw==
X-Google-Smtp-Source: ABdhPJzhXynBs/4HRWeoQefjnGhYUU4Z+3zd3DP/MZMOKiY3P9g7I1d9M6nwuhK66IkDZE9YCZ6oWiVTDkS60Dxdk78=
X-Received: by 2002:a63:7e55:: with SMTP id o21mr997132pgn.263.1594678177107;
 Mon, 13 Jul 2020 15:09:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200708181905.257691-1-nhuck@google.com> <CAKwvOdmKsCedU=Vt_SBSGnf4gKc9Ae4sknn_Lj+kw9f0HY5MMA@mail.gmail.com>
 <CAJkfWY58JwBqxjHcaQDwpUMrfG_hLiBkskrTfC4EeQvDrz5Q1g@mail.gmail.com>
In-Reply-To: <CAJkfWY58JwBqxjHcaQDwpUMrfG_hLiBkskrTfC4EeQvDrz5Q1g@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 13 Jul 2020 15:09:25 -0700
Message-ID: <CAKwvOdnJmREByYq_RxfjxhQLMZi2RFk03a+e2GTWsz_VQFfbQA@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile: Add clang-tidy and static analyzer support
 to makefile
To:     Nathan Huckleberry <nhuck@google.com>
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

(bumping a few points for v3)

On Thu, Jul 9, 2020 at 10:56 AM Nathan Huckleberry <nhuck@google.com> wrote:
>
> On Wed, Jul 8, 2020 at 2:11 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
> >
> > On Wed, Jul 8, 2020 at 11:21 AM 'Nathan Huckleberry' via Clang Built
> > Linux <clang-built-linux@googlegroups.com> wrote:
> > >
> > I think we should add scripts/clang-tools/ to MAINTAINERS under
> > CLANG/LLVM SUPPORT:
> > ```
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index c87b94e6b2f6..42602231929c 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -4211,6 +4211,7 @@ W:        https://clangbuiltlinux.github.io/
> >  B:     https://github.com/ClangBuiltLinux/linux/issues
> >  C:     irc://chat.freenode.net/clangbuiltlinux
> >  F:     Documentation/kbuild/llvm.rst
> > +F:     scripts/clang-tools/
> >  K:     \b(?i:clang|llvm)\b
> >
> >  CLEANCACHE API
> > ```
> > that way we get cc'ed properly on proposed changes (should folks use
> > scripts/get_maintainer.pl).

bump

> > > --- /dev/null
> > > +++ b/scripts/clang-tools/run-clang-tools.py
> > > @@ -0,0 +1,77 @@
> > > +#!/usr/bin/env python
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +#
> > > +# Copyright (C) Google LLC, 2020
> > > +#
> > > +# Author: Nathan Huckleberry <nhuck@google.com>
> > > +#
> > > +"""A helper routine run clang-tidy and the clang static-analyzer on
> > > +compile_commands.json."""
> > > +
> > > +import argparse
> > > +import json
> > > +import logging
> > > +import multiprocessing
> > > +import os
> > > +import re

Is `re` being used anywhere?

> > > +import subprocess
> > > +
> > > +def parse_arguments():
> > > +  """Set up and parses command-line arguments.
> > > +  Returns:
> > > +    args: Dict of parsed args
> > > +      Has keys 'file' and 'type'
> > > +  """
> > > +  usage = """Run clang-tidy or the clang static-analyzer on a
> > > +  compilation database."""
> > > +  parser = argparse.ArgumentParser(description=usage)
> > > +
> > > +  type_help = ('Type of analysis to be performed')
> > > +  parser.add_argument('type', choices=['clang-tidy', 'static-analyzer'],
> > > +                      help=type_help)
> > > +  file_path_help = ('Path to the compilation database to parse')
> > > +  parser.add_argument('file',  type=str, help=file_path_help)
> >
> > I don't know if the kernel has a preferred style for Python, but I
> > think it would be good to be consistent in the use of single vs double
> > quotes for strings.  My preference is for double quotes, but I don't
> > know enough about the various PEPs for style or if the kernel has a
> > preferred style for these.

double quotes.

> > > +
> > > +  args = parser.parse_args()
> > > +
> > > +  return args
> > > +
> > > +def init(l,t):
> > > +  global lock
> > > +  global analysis_type
> > > +  lock = l
> > > +  analysis_type = t
> >
> > Is this canonical Python?  Maybe wrap these functions into methods of
> > an object you construct, that way you can assign these as instance
> > variables against `self`, rather than using global variables.
>
> I did this to allow shared locks between processes, see
> https://stackoverflow.com/questions/25557686/python-sharing-a-lock-between-processes

Ah, ok, I see the problem.  In that case, I'm less worried about this.
`global` just sets off red flags unless there is a very good reason to
use it.

>
> >
> > > +
> > > +def run_analysis(entry):
> > > +  filename = entry['file']
> > > +  p = None
> > > +  if(analysis_type == "clang-tidy"):
> > > +    p = subprocess.run(["clang-tidy", "-p", os.getcwd(),
> > > +                        "-checks=-*,linuxkernel-*", filename],
> > > +                       stdout=subprocess.PIPE, stderr=subprocess.PIPE)
> > > +  if(analysis_type == "static-analyzer"):
> > > +    p = subprocess.run(["clang-tidy", "-p", os.getcwd(),
> > > +                        "-checks=-*,clang-analyzer-*", filename],

Is it worthwhile to NOT run `-*` passes and only run
`clang-analyzer-*`? Otherwise `make clang-analyzer` and `make
clang-tidy` contain a ton of duplicate info.

> > > +                       stdout=subprocess.PIPE, stderr=subprocess.PIPE)
> >
> > When you have a fair amount of duplication between two branches of an
> > if/else (for instance, same method invocation and number of
> > parameters, just slight differences in parameter values), consider if
> > you can use a ternary to simplify or make the code more concise. That
> > would also help avoid initializing `p` to `None`:
> >
> > checks = "-checks=-*,linuxkernel-*" if analysis_type == "clang-tidy"
> > else "-checks=-*,clang-analyzer-*"
> > p = subprocess.run(["clang-tidy", "-p", os.getcwd(), checks,
> >     stdout=subprocess.PIPE, stderr=subprocess.PIPE]
> >
> > then maybe do some validation of the analysis_type when validating
> > command line arguments earlier.
>
> Argparse should already handle validation of the analysis type.

Cool, I still think the ternary can simplify a v3.

>
> >
> > > +  lock.acquire()
> > > +  print(entry['file'])
> > > +  os.write(1, p.stdout)
> > > +  os.write(2, p.stderr)
> >
> > Please use sys.stdout and sys.stderr rather than magic constants for
> > their file descriptors.

Also, I'm not a fan of how clang-tidy writes the errors to stdout.

$ make LLVM=1 -j71 defconfig clang-tidy 2> log.txt
write part of the log, and spews to stdout.  Do you think it would
make sense to redirect stdout from clang-tidy to stderr for this
script?

$ grep error: log.txt | sort -u
$ grep clang-analyzer log.txt | sort -u
Checking some of the clang-tidy warnings, some seem harmless.
linux-next/net/core/devlink.c:9527:6: error: redefinition of
'devlink_compat_running_version' [clang-diagnostic-error]
looks legit, though not terribly important to fix ASAP.  So that's cool.
The clang-analyzer report is a little beefier, once the traces start
getting long they become fairly hard to follow. Is it possible to dump
the html report of these? I guess the issue with that is that we
wouldn't be able to join them in the python script.

$ grep clang-analyzer log.txt | sort -u | cut -d '[' -f 2 | sort -u
clang-analyzer-core.CallAndMessage]
clang-analyzer-core.DivideZero]
clang-analyzer-core.NonNullParamChecker]
clang-analyzer-core.NullDereference]
clang-analyzer-core.StackAddressEscape]
clang-analyzer-core.UndefinedBinaryOperatorResult]
clang-analyzer-core.uninitialized.ArraySubscript]
clang-analyzer-core.uninitialized.Assign]
clang-analyzer-core.uninitialized.Branch]
clang-analyzer-core.uninitialized.UndefReturn]
clang-analyzer-deadcode.DeadStores]
clang-analyzer-optin.performance.Padding]
clang-analyzer-optin.portability.UnixAPI]
clang-analyzer-security.insecureAPI.bcmp]
clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
clang-analyzer-security.insecureAPI.strcpy]
clang-analyzer-unix.cstring.NullArg]
clang-analyzer-unix.Malloc]
clang-analyzer-valist.Uninitialized]

interesting. I like how clang-analyzer warns about bcmp and yet llvm
will generate calls to bcmp...
--
Thanks,
~Nick Desaulniers
