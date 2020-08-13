Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46FBB2431C6
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Aug 2020 02:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbgHMAuv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 12 Aug 2020 20:50:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726126AbgHMAuu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Aug 2020 20:50:50 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E838C061383;
        Wed, 12 Aug 2020 17:50:50 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id j187so3838689qke.11;
        Wed, 12 Aug 2020 17:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pL5MmIRVU1OdOeaSv0wRzf09T7PB0hRsMz5ga7H+m/4=;
        b=bwfzCm0sbBP34OwcNxBaPy7//yJBaU05+1qY8DSKXwetHRowjlRs9XFkTfrDj3dph0
         1Nukr48e/0k7h9y8Se66Q3KMfW7kAVpTmn4yiBOF9kQWKinGJAxKsKw9GXDxoLda/NVk
         yYuGiz/sb9Erou7gCPKkIz3Pf0ngh09zNju5SrN0tLx+V0qEap7A4yc7UTgxTmwwpXc9
         QMKjeGelhjcg/Gd+QyzQz8n5oMkl4y8u2upIbZnY210nc5+Bq1k2L/J5Iiv8ZC0Rh/fv
         7WbelKb8t0ihgH5sEdmm+iI920L5KpTEebawX54+9URalB95DSLvb8sBTabhssMxVabt
         u2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pL5MmIRVU1OdOeaSv0wRzf09T7PB0hRsMz5ga7H+m/4=;
        b=OKsi8OpyOim7YrU52ze9vqHBjZbeCFtUu8pgFB5QfwoUxp6moVmtefb6g/K1ADLzTy
         jP4oy0MJigxorLHGZ9+wJKvjvbH1BK4AILSNs3w7U52pjf93Pugi1cTP5AGljNk8b7JE
         yIBuaLvYw8raymyzszOTUwbmX+YLlo0jPZhuFjbErWlIxQhb7zZqjn5j/476KcUc4xLs
         rFxn7MAwUr1kV2bTKhDt4PkgFK9+ilb6lqyRJ0Hfm4OM/AjnxZQD2M2M7qIOi2kujw0F
         LWgMJ3BcRcU8+FUR+woFYHVBfHoatG7sC/QsWXkW+9sFHH+LbP/daOAUyh82mE4A46BT
         dIIg==
X-Gm-Message-State: AOAM532XolOKZYkzaQJYscF6j6Wc6+WQvSJKXTr+FG2VZbvv0vPumxiC
        0IeWxDkNRtLahop1/2gle4c=
X-Google-Smtp-Source: ABdhPJyyz72U/mLeBKYblHnXZcPevNW9KuBIcqnp1tiHBAvON1+mtRh+JcN59tXFPGAIrXWiZVe9Bw==
X-Received: by 2002:a37:2750:: with SMTP id n77mr2524751qkn.26.1597279848302;
        Wed, 12 Aug 2020 17:50:48 -0700 (PDT)
Received: from ubuntu-n2-xlarge-x86 ([2604:1380:45d1:2600::1])
        by smtp.gmail.com with ESMTPSA id 103sm4396948qta.31.2020.08.12.17.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 17:50:47 -0700 (PDT)
Date:   Wed, 12 Aug 2020 17:50:45 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Nathan Huckleberry <nhuck@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Tom Roeder <tmroeder@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "David S. Miller" <davem@davemloft.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Rob Herring <robh@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] kbuild: clang-tidy
Message-ID: <20200813005045.GA3726321@ubuntu-n2-xlarge-x86>
References: <20200812173958.2307251-1-masahiroy@kernel.org>
 <CAJkfWY6vhW9kNK-t+2vZQ7Rhn3HedykvT2du7AfO0_9oUAXvjw@mail.gmail.com>
 <CAKwvOdm3VTZ2QXXxf9pjM6n87UE=Lc-9Cx=V70sNsYGmHCb-hA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdm3VTZ2QXXxf9pjM6n87UE=Lc-9Cx=V70sNsYGmHCb-hA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 12, 2020 at 03:52:54PM -0700, 'Nick Desaulniers' via Clang Built Linux wrote:
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

I think that is the point of '-DCLANG_ENABLE_STATIC_ANALYZER=OFF'.
clang-tools-extra/clang-tidy/CMakeLists.txt has some checks for
CLANG_ENABLE_STATIC_ANALYZER to link in certain libraries related to
the analyzer.

For the record, tc-build adds that cmake define:

https://github.com/ClangBuiltLinux/tc-build/blob/071eeefd2e201d3f24468cc06ed6a5860161437d/build-llvm.py#L610-L613

$ ../build-llvm.py --build-stage1-only --projects "clang;clang-tools-extra" --targets X86
...

$ ../build/llvm/stage1/bin/clang-tidy '-checks=*' --list-checks | grep clang-analyzer | wc -l
0

If I remove that define and rebuild:

$ ../build-llvm.py --build-stage1-only --projects "clang;clang-tools-extra" --targets X86
...

$ ../build/llvm/stage1/bin/clang-tidy '-checks=*' --list-checks | grep clang-analyzer | wc -l
111

I suppose if this series depends on it, we can remove that from the base
defines and either add a flag to enable/disable it depending on people's
preferences.

Cheers,
Nathan
