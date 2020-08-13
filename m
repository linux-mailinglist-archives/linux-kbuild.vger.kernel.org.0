Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A26F2431E5
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Aug 2020 02:58:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgHMA6p (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 12 Aug 2020 20:58:45 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:28434 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbgHMA6o (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Aug 2020 20:58:44 -0400
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 07D0wC5e031519;
        Thu, 13 Aug 2020 09:58:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 07D0wC5e031519
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1597280293;
        bh=KJEXsGT7cf1jNK7EqEJcxc2sDM3WPtp8flA8NDzcZDY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=uqfwHqWIDE1ch9B0SjW0K+io0UM3zgUY5ozBHWZa2/mqAeW7bnqQxAGKcLq5qnSDv
         8kOZ50oXAFU9DgIuka8JTgNnh+dKKmxSQJf5eJhUgaKhy/WG28pgB9i2haknY51Qta
         r1aCzOD3fokyGP8jRdIPivZM8/QRfsX/kybRZ6Q14XJNEJl7eyXQVEy2sPfWYMZAwb
         N/kgeleQYjM32Cy/KMwYOTfoOUJa7tKUQXYVL5UlpRj8e5/uww2FPJoyrUioC9o72w
         HldqC6NOliKleHHr5w5tejX7xopL8UiKdba+/Qzu1wlY/KWwDAC5AZ4j45Ft9MIf+a
         q+l9ikoJi5cAA==
X-Nifty-SrcIP: [209.85.217.46]
Received: by mail-vs1-f46.google.com with SMTP id p8so2058751vsm.12;
        Wed, 12 Aug 2020 17:58:12 -0700 (PDT)
X-Gm-Message-State: AOAM530ZhiCac51hy4QBFZ6mef9ZwIrO53f7reKRqTXeQ0XqtZue0FI2
        rI2ZNEvybWG3PwgZKmY/YztXM3ug2xS+CK7HxyE=
X-Google-Smtp-Source: ABdhPJwvLTQwspsgXxlDcg9bHgvFDjwX/VfzFXBdx/iGob1VdxKEQSv511K45i7CSCFXXex+QzKgAc8qNzi6QJaeuok=
X-Received: by 2002:a67:bb06:: with SMTP id m6mr1570844vsn.54.1597280291357;
 Wed, 12 Aug 2020 17:58:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200812173958.2307251-1-masahiroy@kernel.org>
 <CAJkfWY6vhW9kNK-t+2vZQ7Rhn3HedykvT2du7AfO0_9oUAXvjw@mail.gmail.com>
 <CAKwvOdm3VTZ2QXXxf9pjM6n87UE=Lc-9Cx=V70sNsYGmHCb-hA@mail.gmail.com> <20200813005045.GA3726321@ubuntu-n2-xlarge-x86>
In-Reply-To: <20200813005045.GA3726321@ubuntu-n2-xlarge-x86>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 13 Aug 2020 09:57:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT+zOT78s6e2z4DWbL87hzySt+_xDwpO3sWY5j0uL1egA@mail.gmail.com>
Message-ID: <CAK7LNAT+zOT78s6e2z4DWbL87hzySt+_xDwpO3sWY5j0uL1egA@mail.gmail.com>
Subject: Re: [PATCH 0/3] kbuild: clang-tidy
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Huckleberry <nhuck@google.com>,
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

On Thu, Aug 13, 2020 at 9:50 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Wed, Aug 12, 2020 at 03:52:54PM -0700, 'Nick Desaulniers' via Clang Built Linux wrote:
> > On Wed, Aug 12, 2020 at 12:56 PM Nathan Huckleberry <nhuck@google.com> wrote:
> > >
> > > On Wed, Aug 12, 2020 at 12:40 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > > >
> > > >
> > > > I improved gen_compile_commands.py in the first two patches,
> > > > then rebased Nathan's v7 [1] on top of them.
> > > > To save time, I modified the Makefile part.
> > > > No change for run-clang-tools.py
> > > >
> > > > I am not sure if the new directory, scripts/clang-tools/,
> > > > is worth creating only for 2 files, but I do not have
> > > > a strong opinion about it.
> > > >
> > > > "make clang-tidy" should work in-tree build,
> > > > out-of-tree build (O=), and external module build (M=).
> > > > Tests and reviews are appreciated.
> > > >
> > > > "make clang-tidy" worked for me.
> > > >
> > > > masahiro@oscar:~/workspace/linux-kbuild$ make -j24 CC=clang clang-tidy
> > > >   DESCEND  objtool
> > > >   CALL    scripts/atomic/check-atomics.sh
> > > >   CALL    scripts/checksyscalls.sh
> > > >   CHK     include/generated/compile.h
> > > >   GEN     compile_commands.json
> > > >   CHECK   compile_commands.json
> > > >
> > > > But "make clang-analyzer" just sprinkled the following error:
> > > >
> > > >   Error: no checks enabled.
> > > >   USAGE: clang-tidy [options] <source0> [... <sourceN>]
> >
> > I wasn't able to reproduce Masahiro's reported failure, but seeing as
> > he has `GEN` for compile_commands.json and I have `CHK`, I wonder if
> > that's from a run when the series was still under development?
> >
> > I can reproduce if I run:
> > $ clang-tidy '-checks='
> > so maybe was string quoting problem?
> >
> > > >
> > > > I built clang-tidy from the latest source.
> > > > I had no idea how to make it work...
> > >
> > > How are you building clang-tidy? The clang static-analyzer may not
> > > have been built.
> > > I believe the static analyzer is built as a part of clang, not as a
> > > part of clang-tools-extra.
> > >
> > > I use this command to build.
> > > cmake -DCMAKE_BUILD_TYPE="release"
> > > -DLLVM_TARGETS_TO_BUILD="X86;AArch64;ARM;RISCV"
> > > -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;lld;llvm-as"
> > > -DLLVM_ENABLE_LLD=1 -G "Ninja" ../llvm
> > >
> > > Adding clang to the list of -DLLVM_ENABLE_PROJECTS will build the
> > > static analyzer.
> > > -DCLANG_ENABLE_STATIC_ANALYZER=1 might also work, but I haven't tested it.
> > >
> > > I tested the patchset and both clang-tidy and clang-analyzer work for me.
> >
> > If you rename clang-tidy in your build dir, and ensure you don't have
> > a `clang-tidy` in your $PATH (`which clang-tidy`), maybe there's more
> > we can do to politely inform the user they're missing a dependency to
> > execute the make target?  Not sure if we could could test that
> > clang-tidy supports the clang-analyzer-* checks.  Isn't there an
> > invocation that prints the supported checks? `clang-tidy '-checks=*'
> > --list-checks` is in my shell history.  Maybe grepping that and
> > informing the user how to fix the problem might solve a "papercut?"
> >
> > If I remove clang-tidy with this series applied, I get (the failure is
> > obvious to me, but...):
> > ```
> > $ make LLVM=1 -j71 clang-tidy
> > ...
> > multiprocessing.pool.RemoteTraceback:
> > """
> > Traceback (most recent call last):
> >   File "/usr/lib/python3.8/multiprocessing/pool.py", line 125, in worker
> >     result = (True, func(*args, **kwds))
> >   File "/usr/lib/python3.8/multiprocessing/pool.py", line 48, in mapstar
> >     return list(map(*args))
> >   File "./scripts/clang-tools/run-clang-tools.py", line 54, in run_analysis
> >     p = subprocess.run(["clang-tidy", "-p", args.path, checks, entry["file"]],
> >   File "/usr/lib/python3.8/subprocess.py", line 489, in run
> >     with Popen(*popenargs, **kwargs) as process:
> >   File "/usr/lib/python3.8/subprocess.py", line 854, in __init__
> >     self._execute_child(args, executable, preexec_fn, close_fds,
> >   File "/usr/lib/python3.8/subprocess.py", line 1702, in _execute_child
> >     raise child_exception_type(errno_num, err_msg, err_filename)
> > FileNotFoundError: [Errno 2] No such file or directory: 'clang-tidy'
> > """
> >
> > The above exception was the direct cause of the following exception:
> >
> > Traceback (most recent call last):
> >   File "./scripts/clang-tools/run-clang-tools.py", line 74, in <module>
> >     main()
> >   File "./scripts/clang-tools/run-clang-tools.py", line 70, in main
> >     pool.map(run_analysis, datastore)
> >   File "/usr/lib/python3.8/multiprocessing/pool.py", line 364, in map
> >     return self._map_async(func, iterable, mapstar, chunksize).get()
> >   File "/usr/lib/python3.8/multiprocessing/pool.py", line 771, in get
> >     raise self._value
> > FileNotFoundError: [Errno 2] No such file or directory: 'clang-tidy'
> > make: *** [Makefile:1861: clang-tidy] Error 1
> > ```
> > $ clang-tidy '-checks=*' --list-checks | grep clang-analyzer | wc -l
> > 111
> >
> > And I'm not sure you can even build clang or clang-tidy but not the analyzer.
>
> I think that is the point of '-DCLANG_ENABLE_STATIC_ANALYZER=OFF'.
> clang-tools-extra/clang-tidy/CMakeLists.txt has some checks for
> CLANG_ENABLE_STATIC_ANALYZER to link in certain libraries related to
> the analyzer.
>
> For the record, tc-build adds that cmake define:
>
> https://github.com/ClangBuiltLinux/tc-build/blob/071eeefd2e201d3f24468cc06ed6a5860161437d/build-llvm.py#L610-L613
>
> $ ../build-llvm.py --build-stage1-only --projects "clang;clang-tools-extra" --targets X86
> ...
>
> $ ../build/llvm/stage1/bin/clang-tidy '-checks=*' --list-checks | grep clang-analyzer | wc -l
> 0
>
> If I remove that define and rebuild:
>
> $ ../build-llvm.py --build-stage1-only --projects "clang;clang-tools-extra" --targets X86
> ...
>
> $ ../build/llvm/stage1/bin/clang-tidy '-checks=*' --list-checks | grep clang-analyzer | wc -l
> 111
>
> I suppose if this series depends on it, we can remove that from the base
> defines and either add a flag to enable/disable it depending on people's
> preferences.


Ah, right.

I used tc-build to build clang, clang-tools-extra.


I will remove   'CLANG_ENABLE_STATIC_ANALYZER': 'OFF',
and rebuild clang-tools-extra.
Thanks.


-- 
Best Regards
Masahiro Yamada
