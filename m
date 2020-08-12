Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA5B24312C
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Aug 2020 00:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbgHLWxH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 12 Aug 2020 18:53:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbgHLWxH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Aug 2020 18:53:07 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD95CC061384
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Aug 2020 15:53:06 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id y206so1755324pfb.10
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Aug 2020 15:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pIEp8qQrdzVNH2K5gSBgID9o6T8cEMLr9WGCiRvu8Hg=;
        b=YvF7q2IAnFXd/bM4OiqLEc76Kn/j6qglkBD3SwbrVNrDs0UJYyH4ep0mzNatoP5dve
         ysWPd6MrmDsgMrylDwzfY2mQmFmrro2Pf4Iuq8fKACHNHKucXlB2pERR9XMqJqpom6WW
         A511bkUdhp4f+R5eO3zPfxnl8hKwC6OLWXK7lIJIoLgugRqvTVs4y66FGNVds2GnK3OC
         MDcdAQIF/3/Y7aXv2f5nT9aKoPobZNShbs2NKE6jOSYpch55i6HWgWir0kRh95PSo8NF
         xPWZTsp5b2nXLqbTE4Qn4Db2m96YF8xn3Dpg6/MaWiwnKnRZZMM2At8N8gOOE7v2bk/v
         xrAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pIEp8qQrdzVNH2K5gSBgID9o6T8cEMLr9WGCiRvu8Hg=;
        b=fRVM1ZzfTGXl0P936d3LNk3BvCW8ACtnBP6zsEX30wfrR2QewOQNsCizuwu6790tyz
         mg0kDsLwpyddMsvzN5EnmGxc5Wcu9R1qnGCuU0hqvd1u7dInwGUuBKh2fUMRCKmc049z
         5+ZEZoDHeBQjqVbaqtMVIbLqOwS27Xhgp60zQr/SNYg2TdlG6Y/WOsQOCTO/L9ClTzzg
         uVKDkOZ4CBUy8cHVn8XNWGFICYzZRAbzaGhwXZCpCrVOmfGC248e3O05VzgKoSzRs++u
         kT84U6voashPyWSevV0/AiziwTIpnISB6vaWs+7Evs+vzch2BDoX4VJMG7GDE/LGfwPx
         2MhA==
X-Gm-Message-State: AOAM533ZPRZzLrU3W8kG1cUTh80dLd2Os65iSbnaqGP+VxdqqbTqA8or
        jdC5LrVa2de3RvH2iAxLkb+8Gt7FJzl1ZZgmELw/OA==
X-Google-Smtp-Source: ABdhPJyZON0pHDi+e+xM1SdvQq1VgU0FfqFNCs+goB0SQ4KbnVvd4c9wRTGJeifvK1sWmdknBnGXTZhmQtKwDBhMmAo=
X-Received: by 2002:a63:a119:: with SMTP id b25mr1235241pgf.10.1597272785780;
 Wed, 12 Aug 2020 15:53:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200812173958.2307251-1-masahiroy@kernel.org> <CAJkfWY6vhW9kNK-t+2vZQ7Rhn3HedykvT2du7AfO0_9oUAXvjw@mail.gmail.com>
In-Reply-To: <CAJkfWY6vhW9kNK-t+2vZQ7Rhn3HedykvT2du7AfO0_9oUAXvjw@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 12 Aug 2020 15:52:54 -0700
Message-ID: <CAKwvOdm3VTZ2QXXxf9pjM6n87UE=Lc-9Cx=V70sNsYGmHCb-hA@mail.gmail.com>
Subject: Re: [PATCH 0/3] kbuild: clang-tidy
To:     Nathan Huckleberry <nhuck@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Tom Roeder <tmroeder@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "David S. Miller" <davem@davemloft.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Rob Herring <robh@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 12, 2020 at 12:56 PM Nathan Huckleberry <nhuck@google.com> wrote:
>
> On Wed, Aug 12, 2020 at 12:40 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> >
> > I improved gen_compile_commands.py in the first two patches,
> > then rebased Nathan's v7 [1] on top of them.
> > To save time, I modified the Makefile part.
> > No change for run-clang-tools.py
> >
> > I am not sure if the new directory, scripts/clang-tools/,
> > is worth creating only for 2 files, but I do not have
> > a strong opinion about it.
> >
> > "make clang-tidy" should work in-tree build,
> > out-of-tree build (O=), and external module build (M=).
> > Tests and reviews are appreciated.
> >
> > "make clang-tidy" worked for me.
> >
> > masahiro@oscar:~/workspace/linux-kbuild$ make -j24 CC=clang clang-tidy
> >   DESCEND  objtool
> >   CALL    scripts/atomic/check-atomics.sh
> >   CALL    scripts/checksyscalls.sh
> >   CHK     include/generated/compile.h
> >   GEN     compile_commands.json
> >   CHECK   compile_commands.json
> >
> > But "make clang-analyzer" just sprinkled the following error:
> >
> >   Error: no checks enabled.
> >   USAGE: clang-tidy [options] <source0> [... <sourceN>]

I wasn't able to reproduce Masahiro's reported failure, but seeing as
he has `GEN` for compile_commands.json and I have `CHK`, I wonder if
that's from a run when the series was still under development?

I can reproduce if I run:
$ clang-tidy '-checks='
so maybe was string quoting problem?

> >
> > I built clang-tidy from the latest source.
> > I had no idea how to make it work...
>
> How are you building clang-tidy? The clang static-analyzer may not
> have been built.
> I believe the static analyzer is built as a part of clang, not as a
> part of clang-tools-extra.
>
> I use this command to build.
> cmake -DCMAKE_BUILD_TYPE="release"
> -DLLVM_TARGETS_TO_BUILD="X86;AArch64;ARM;RISCV"
> -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;lld;llvm-as"
> -DLLVM_ENABLE_LLD=1 -G "Ninja" ../llvm
>
> Adding clang to the list of -DLLVM_ENABLE_PROJECTS will build the
> static analyzer.
> -DCLANG_ENABLE_STATIC_ANALYZER=1 might also work, but I haven't tested it.
>
> I tested the patchset and both clang-tidy and clang-analyzer work for me.

If you rename clang-tidy in your build dir, and ensure you don't have
a `clang-tidy` in your $PATH (`which clang-tidy`), maybe there's more
we can do to politely inform the user they're missing a dependency to
execute the make target?  Not sure if we could could test that
clang-tidy supports the clang-analyzer-* checks.  Isn't there an
invocation that prints the supported checks? `clang-tidy '-checks=*'
--list-checks` is in my shell history.  Maybe grepping that and
informing the user how to fix the problem might solve a "papercut?"

If I remove clang-tidy with this series applied, I get (the failure is
obvious to me, but...):
```
$ make LLVM=1 -j71 clang-tidy
...
multiprocessing.pool.RemoteTraceback:
"""
Traceback (most recent call last):
  File "/usr/lib/python3.8/multiprocessing/pool.py", line 125, in worker
    result = (True, func(*args, **kwds))
  File "/usr/lib/python3.8/multiprocessing/pool.py", line 48, in mapstar
    return list(map(*args))
  File "./scripts/clang-tools/run-clang-tools.py", line 54, in run_analysis
    p = subprocess.run(["clang-tidy", "-p", args.path, checks, entry["file"]],
  File "/usr/lib/python3.8/subprocess.py", line 489, in run
    with Popen(*popenargs, **kwargs) as process:
  File "/usr/lib/python3.8/subprocess.py", line 854, in __init__
    self._execute_child(args, executable, preexec_fn, close_fds,
  File "/usr/lib/python3.8/subprocess.py", line 1702, in _execute_child
    raise child_exception_type(errno_num, err_msg, err_filename)
FileNotFoundError: [Errno 2] No such file or directory: 'clang-tidy'
"""

The above exception was the direct cause of the following exception:

Traceback (most recent call last):
  File "./scripts/clang-tools/run-clang-tools.py", line 74, in <module>
    main()
  File "./scripts/clang-tools/run-clang-tools.py", line 70, in main
    pool.map(run_analysis, datastore)
  File "/usr/lib/python3.8/multiprocessing/pool.py", line 364, in map
    return self._map_async(func, iterable, mapstar, chunksize).get()
  File "/usr/lib/python3.8/multiprocessing/pool.py", line 771, in get
    raise self._value
FileNotFoundError: [Errno 2] No such file or directory: 'clang-tidy'
make: *** [Makefile:1861: clang-tidy] Error 1
```
$ clang-tidy '-checks=*' --list-checks | grep clang-analyzer | wc -l
111

And I'm not sure you can even build clang or clang-tidy but not the analyzer.

>
> >
> > [1] https://patchwork.kernel.org/patch/11687833/
> >
> >
> >
> > Masahiro Yamada (2):
> >   gen_compile_commands: parse only the first line of .*.cmd files
> >   gen_compile_commands: wire up build rule to Makefile
> >
> > Nathan Huckleberry (1):
> >   Makefile: Add clang-tidy and static analyzer support to makefile
> >
> >  MAINTAINERS                                 |   1 +
> >  Makefile                                    |  45 +++++-
> >  scripts/clang-tools/gen_compile_commands.py | 117 +++++++++++++++
> >  scripts/clang-tools/run-clang-tools.py      |  74 ++++++++++
> >  scripts/gen_compile_commands.py             | 151 --------------------
> >  5 files changed, 233 insertions(+), 155 deletions(-)
> >  create mode 100755 scripts/clang-tools/gen_compile_commands.py
> >  create mode 100755 scripts/clang-tools/run-clang-tools.py
> >  delete mode 100755 scripts/gen_compile_commands.py
> >
> > --
> > 2.25.1
> >



-- 
Thanks,
~Nick Desaulniers
