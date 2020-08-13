Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C59AE243221
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Aug 2020 03:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbgHMBfz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 12 Aug 2020 21:35:55 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:21996 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbgHMBfz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Aug 2020 21:35:55 -0400
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 07D1ZS13028466;
        Thu, 13 Aug 2020 10:35:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 07D1ZS13028466
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1597282529;
        bh=lrLt6MViZfHVoAxmdOr+AtPRSZUb1nHMJgHZW/9Z6ZA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GSyFkaw3BiH7pQq/LKwdDw9Wk5jXNUuyK1BzCtKHqX6eMo34NsQEYT6+BTWYhh5TD
         uAOpd70TZ1upFOjWOBllKBrh6lSX9t3K9A7Bs0Mf8KnFSt3ihBtyyqHWFq6zuOCX3n
         axv0mPwYsA0KXroC5Xuzt5+rdD9h4f7CyDAQjQrz7+YUwxVxhmvIjD/lxBA/sMyNhL
         sOfxyrFpTGwjrOxTB8kGTZBDiHpKPoUio2wFu5t1crDmQHtjOCFjTk/C9wgZY27U21
         atPJrAXR+qwg6XIXZi9zSuxo+ivtXDVhabr6DYj/92KZY1daahnpYwcWwa2XpSbO+u
         ucEP/XszzanbA==
X-Nifty-SrcIP: [209.85.217.54]
Received: by mail-vs1-f54.google.com with SMTP id b26so2090894vsa.13;
        Wed, 12 Aug 2020 18:35:28 -0700 (PDT)
X-Gm-Message-State: AOAM5331RO5INRJRDzEcWrjrpnke0S9eIGzIfi0SzSbML290eeQVrxXz
        OG0+NE+r7mSa87RUfdf7g6HuPHDOXtsXunOzpXI=
X-Google-Smtp-Source: ABdhPJwHCYha0DGnVlJbeg0bMwop7IHdQJrygv5JsQk0ZZC5iIpl+3DbrYGy8c7HsohBwBUYs3GJCIb7XrUNbtHUDR4=
X-Received: by 2002:a67:bb06:: with SMTP id m6mr1647566vsn.54.1597282527307;
 Wed, 12 Aug 2020 18:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200812173958.2307251-1-masahiroy@kernel.org>
 <CAJkfWY6vhW9kNK-t+2vZQ7Rhn3HedykvT2du7AfO0_9oUAXvjw@mail.gmail.com> <CAKwvOdm3VTZ2QXXxf9pjM6n87UE=Lc-9Cx=V70sNsYGmHCb-hA@mail.gmail.com>
In-Reply-To: <CAKwvOdm3VTZ2QXXxf9pjM6n87UE=Lc-9Cx=V70sNsYGmHCb-hA@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 13 Aug 2020 10:34:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNASb9HwvfmywT+3UjMvMUV3QCCaLVr_mSREiED=KNoy4eA@mail.gmail.com>
Message-ID: <CAK7LNASb9HwvfmywT+3UjMvMUV3QCCaLVr_mSREiED=KNoy4eA@mail.gmail.com>
Subject: Re: [PATCH 0/3] kbuild: clang-tidy
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Nathan Huckleberry <nhuck@google.com>,
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

On Thu, Aug 13, 2020 at 7:53 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Aug 12, 2020 at 12:56 PM Nathan Huckleberry <nhuck@google.com> wrote:
> >
> > On Wed, Aug 12, 2020 at 12:40 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > >
> > > I improved gen_compile_commands.py in the first two patches,
> > > then rebased Nathan's v7 [1] on top of them.
> > > To save time, I modified the Makefile part.
> > > No change for run-clang-tools.py
> > >
> > > I am not sure if the new directory, scripts/clang-tools/,
> > > is worth creating only for 2 files, but I do not have
> > > a strong opinion about it.
> > >
> > > "make clang-tidy" should work in-tree build,
> > > out-of-tree build (O=), and external module build (M=).
> > > Tests and reviews are appreciated.
> > >
> > > "make clang-tidy" worked for me.
> > >
> > > masahiro@oscar:~/workspace/linux-kbuild$ make -j24 CC=clang clang-tidy
> > >   DESCEND  objtool
> > >   CALL    scripts/atomic/check-atomics.sh
> > >   CALL    scripts/checksyscalls.sh
> > >   CHK     include/generated/compile.h
> > >   GEN     compile_commands.json
> > >   CHECK   compile_commands.json
> > >
> > > But "make clang-analyzer" just sprinkled the following error:
> > >
> > >   Error: no checks enabled.
> > >   USAGE: clang-tidy [options] <source0> [... <sourceN>]
>
> I wasn't able to reproduce Masahiro's reported failure, but seeing as
> he has `GEN` for compile_commands.json and I have `CHK`, I wonder if
> that's from a run when the series was still under development?
>
> I can reproduce if I run:
> $ clang-tidy '-checks='
> so maybe was string quoting problem?
>
> > >
> > > I built clang-tidy from the latest source.
> > > I had no idea how to make it work...
> >
> > How are you building clang-tidy? The clang static-analyzer may not
> > have been built.
> > I believe the static analyzer is built as a part of clang, not as a
> > part of clang-tools-extra.
> >
> > I use this command to build.
> > cmake -DCMAKE_BUILD_TYPE="release"
> > -DLLVM_TARGETS_TO_BUILD="X86;AArch64;ARM;RISCV"
> > -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;lld;llvm-as"
> > -DLLVM_ENABLE_LLD=1 -G "Ninja" ../llvm
> >
> > Adding clang to the list of -DLLVM_ENABLE_PROJECTS will build the
> > static analyzer.
> > -DCLANG_ENABLE_STATIC_ANALYZER=1 might also work, but I haven't tested it.
> >
> > I tested the patchset and both clang-tidy and clang-analyzer work for me.
>
> If you rename clang-tidy in your build dir, and ensure you don't have
> a `clang-tidy` in your $PATH (`which clang-tidy`), maybe there's more
> we can do to politely inform the user they're missing a dependency to
> execute the make target?  Not sure if we could could test that
> clang-tidy supports the clang-analyzer-* checks.  Isn't there an
> invocation that prints the supported checks? `clang-tidy '-checks=*'
> --list-checks` is in my shell history.  Maybe grepping that and
> informing the user how to fix the problem might solve a "papercut?"
>
> If I remove clang-tidy with this series applied, I get (the failure is
> obvious to me, but...):
> ```
> $ make LLVM=1 -j71 clang-tidy
> ...
> multiprocessing.pool.RemoteTraceback:
> """
> Traceback (most recent call last):
>   File "/usr/lib/python3.8/multiprocessing/pool.py", line 125, in worker
>     result = (True, func(*args, **kwds))
>   File "/usr/lib/python3.8/multiprocessing/pool.py", line 48, in mapstar
>     return list(map(*args))
>   File "./scripts/clang-tools/run-clang-tools.py", line 54, in run_analysis
>     p = subprocess.run(["clang-tidy", "-p", args.path, checks, entry["file"]],
>   File "/usr/lib/python3.8/subprocess.py", line 489, in run
>     with Popen(*popenargs, **kwargs) as process:
>   File "/usr/lib/python3.8/subprocess.py", line 854, in __init__
>     self._execute_child(args, executable, preexec_fn, close_fds,
>   File "/usr/lib/python3.8/subprocess.py", line 1702, in _execute_child
>     raise child_exception_type(errno_num, err_msg, err_filename)
> FileNotFoundError: [Errno 2] No such file or directory: 'clang-tidy'
> """
>
> The above exception was the direct cause of the following exception:
>
> Traceback (most recent call last):
>   File "./scripts/clang-tools/run-clang-tools.py", line 74, in <module>
>     main()
>   File "./scripts/clang-tools/run-clang-tools.py", line 70, in main
>     pool.map(run_analysis, datastore)
>   File "/usr/lib/python3.8/multiprocessing/pool.py", line 364, in map
>     return self._map_async(func, iterable, mapstar, chunksize).get()
>   File "/usr/lib/python3.8/multiprocessing/pool.py", line 771, in get
>     raise self._value
> FileNotFoundError: [Errno 2] No such file or directory: 'clang-tidy'
> make: *** [Makefile:1861: clang-tidy] Error 1
> ```
> $ clang-tidy '-checks=*' --list-checks | grep clang-analyzer | wc -l
> 111
>
> And I'm not sure you can even build clang or clang-tidy but not the analyzer.



I rebuilt clang-tools-extra with -DCLANG_ENABLE_STATIC_ANALYZER on,
and now clang-analyzer worked for me.  :)

Perhaps, we could do some checks for clang-tidy.
I am OK with leaving it as a follow-up work.

-- 
Best Regards
Masahiro Yamada
