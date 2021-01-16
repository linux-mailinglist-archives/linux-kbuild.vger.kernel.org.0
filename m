Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BEF42F8F2A
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 Jan 2021 21:24:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbhAPUY0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 16 Jan 2021 15:24:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726785AbhAPUYX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 16 Jan 2021 15:24:23 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66292C061574
        for <linux-kbuild@vger.kernel.org>; Sat, 16 Jan 2021 12:23:43 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id g12so18216574ejf.8
        for <linux-kbuild@vger.kernel.org>; Sat, 16 Jan 2021 12:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rwd0e1UxPf4jra+cHgWc0pdWvVXVnpNKf6ZNL9rziWo=;
        b=V/PF3zTRAPSuMz/PY6z7EpaAAhzS/ekxEyEZfpEg1kBJha5i6wHIP1FCKE6xPTsDy1
         0jdiAQBHRqf81tJsxzsv5soM3DHtdZMtttOiOrmkEXJAHP4b/w2bj32+jhuA8B9TUkEM
         3Rc3/NLN3DdqBvZehqGaf6hjSdmZ/v73dazd9rh2l55qK/osRcxlFwWEy5EqeisOxlZ4
         3zQ8JnD1gixwfDacfRngfeG2lL+0B9IZMOc9YhmAZkZlRNT0KiLGkics8+nH5zzg4kQR
         dMXMYOYMdHXzTAeJIt1hnJg399o3rUz8pJEr+EPBZ3u0mQLv9bR3oNQcISIFVbFm4Y0s
         LVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rwd0e1UxPf4jra+cHgWc0pdWvVXVnpNKf6ZNL9rziWo=;
        b=eYX3zYfy8zY1cnzlf/8/bcakUoHBtg+RGE/Krs5g1GcBWTv1M6MzV9NBT9L2ULEryj
         Vk4gNMsbzXxA0iFDDa2prayRXL6iFUZSH3Nl3npbiG/JxRlDvtG5hdF5sx/dhDvUHTlV
         AWc6le5yWGJGL3yzDHZHMYeclJVrctQJB44dl/rVcRTKNopllFDfWiTeZzvrC4iBx/gq
         MbJkfx7cctd6Nk9Xphx7htHEBuMkrWh4hFkF07iZZePzcTQzdvzHqIwhbing6mk616VR
         rDXoraWjNcyrbAr9d++r588X//W83/WjQW/R3L4uTFdmhhC3HdLdrtS8FhAQ/aIRT8VQ
         04cQ==
X-Gm-Message-State: AOAM532jwOs8/X/Z4P3j6a/WPfplb0FWKIv+UTxX+eAlnAtk2NiHcIhU
        R2TEFeuvA53lr9Ew2KPPrBa+he/RPaLcrwyryPxw
X-Google-Smtp-Source: ABdhPJzo0AP0RDAtCq2gyoETqDiGAA0T9hgndPM++Eqn8o3YPkx46pPWnmqch3+II54asGfiIz3fsWNxK2Z2Ll/Yqpc=
X-Received: by 2002:a17:906:b002:: with SMTP id v2mr12976263ejy.531.1610828620606;
 Sat, 16 Jan 2021 12:23:40 -0800 (PST)
MIME-Version: 1.0
References: <20210113061958.886723-1-morbo@google.com> <20210116094357.3620352-1-morbo@google.com>
 <CA+icZUUgTuD6fO_AZFs9KoRFS8FUmyhezvYeeoRX2dveG_ifDA@mail.gmail.com>
In-Reply-To: <CA+icZUUgTuD6fO_AZFs9KoRFS8FUmyhezvYeeoRX2dveG_ifDA@mail.gmail.com>
From:   Bill Wendling <morbo@google.com>
Date:   Sat, 16 Jan 2021 12:23:29 -0800
Message-ID: <CAGG=3QXZTR_f9pKzAR=LrALmMzdDqsvWM_zrTXOb2PpiDGB-+A@mail.gmail.com>
Subject: Re: [PATCH v5] pgo: add clang's Profile Guided Optimization infrastructure
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jan 16, 2021 at 9:39 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> On Sat, Jan 16, 2021 at 10:44 AM 'Bill Wendling' via Clang Built Linux
> <clang-built-linux@googlegroups.com> wrote:
> >
> > From: Sami Tolvanen <samitolvanen@google.com>
> >
> > Enable the use of clang's Profile-Guided Optimization[1]. To generate a
> > profile, the kernel is instrumented with PGO counters, a representative
> > workload is run, and the raw profile data is collected from
> > /sys/kernel/debug/pgo/profraw.
> >
> > The raw profile data must be processed by clang's "llvm-profdata" tool
> > before it can be used during recompilation:
> >
> >   $ cp /sys/kernel/debug/pgo/profraw vmlinux.profraw
> >   $ llvm-profdata merge --output=vmlinux.profdata vmlinux.profraw
> >
> > Multiple raw profiles may be merged during this step.
> >
> > The data can now be used by the compiler:
> >
> >   $ make LLVM=1 KCFLAGS=-fprofile-use=vmlinux.profdata ...
> >
> > This initial submission is restricted to x86, as that's the platform we
> > know works. This restriction can be lifted once other platforms have
> > been verified to work with PGO.
> >
> > Note that this method of profiling the kernel is clang-native, unlike
> > the clang support in kernel/gcov.
> >
> > [1] https://clang.llvm.org/docs/UsersManual.html#profile-guided-optimization
> >
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > Co-developed-by: Bill Wendling <morbo@google.com>
> > Signed-off-by: Bill Wendling <morbo@google.com>
> > ---
> > v2: - Added "__llvm_profile_instrument_memop" based on Nathan Chancellor's
> >       testing.
> >     - Corrected documentation, re PGO flags when using LTO, based on Fangrui
> >       Song's comments.
> > v3: - Added change log section based on Sedat Dilek's comments.
> > v4: - Remove non-x86 Makfile changes and se "hweight64" instead of using our
> >       own popcount implementation, based on Nick Desaulniers's comment.
> > v5: - Correct padding calculation, discovered by Nathan Chancellor.
> > ---
> >  Documentation/dev-tools/index.rst     |   1 +
> >  Documentation/dev-tools/pgo.rst       | 127 +++++++++
> >  MAINTAINERS                           |   9 +
> >  Makefile                              |   3 +
> >  arch/Kconfig                          |   1 +
> >  arch/x86/Kconfig                      |   1 +
> >  arch/x86/boot/Makefile                |   1 +
> >  arch/x86/boot/compressed/Makefile     |   1 +
> >  arch/x86/crypto/Makefile              |   2 +
> >  arch/x86/entry/vdso/Makefile          |   1 +
> >  arch/x86/kernel/vmlinux.lds.S         |   2 +
> >  arch/x86/platform/efi/Makefile        |   1 +
> >  arch/x86/purgatory/Makefile           |   1 +
> >  arch/x86/realmode/rm/Makefile         |   1 +
> >  arch/x86/um/vdso/Makefile             |   1 +
> >  drivers/firmware/efi/libstub/Makefile |   1 +
> >  include/asm-generic/vmlinux.lds.h     |  44 +++
> >  kernel/Makefile                       |   1 +
> >  kernel/pgo/Kconfig                    |  35 +++
> >  kernel/pgo/Makefile                   |   5 +
> >  kernel/pgo/fs.c                       | 382 ++++++++++++++++++++++++++
> >  kernel/pgo/instrument.c               | 185 +++++++++++++
> >  kernel/pgo/pgo.h                      | 206 ++++++++++++++
> >  scripts/Makefile.lib                  |  10 +
> >  24 files changed, 1022 insertions(+)
> >  create mode 100644 Documentation/dev-tools/pgo.rst
> >  create mode 100644 kernel/pgo/Kconfig
> >  create mode 100644 kernel/pgo/Makefile
> >  create mode 100644 kernel/pgo/fs.c
> >  create mode 100644 kernel/pgo/instrument.c
> >  create mode 100644 kernel/pgo/pgo.h
> >
> > diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/index.rst
> > index f7809c7b1ba9e..8d6418e858062 100644
> > --- a/Documentation/dev-tools/index.rst
> > +++ b/Documentation/dev-tools/index.rst
> > @@ -26,6 +26,7 @@ whole; patches welcome!
> >     kgdb
> >     kselftest
> >     kunit/index
> > +   pgo
> >
> >
> >  .. only::  subproject and html
> > diff --git a/Documentation/dev-tools/pgo.rst b/Documentation/dev-tools/pgo.rst
> > new file mode 100644
> > index 0000000000000..b7f11d8405b73
> > --- /dev/null
> > +++ b/Documentation/dev-tools/pgo.rst
> > @@ -0,0 +1,127 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +===============================
> > +Using PGO with the Linux kernel
> > +===============================
> > +
> > +Clang's profiling kernel support (PGO_) enables profiling of the Linux kernel
> > +when building with Clang. The profiling data is exported via the ``pgo``
> > +debugfs directory.
> > +
> > +.. _PGO: https://clang.llvm.org/docs/UsersManual.html#profile-guided-optimization
> > +
> > +
> > +Preparation
> > +===========
> > +
> > +Configure the kernel with:
> > +
> > +.. code-block:: make
> > +
> > +   CONFIG_DEBUG_FS=y
> > +   CONFIG_PGO_CLANG=y
> > +
> > +Note that kernels compiled with profiling flags will be significantly larger
> > +and run slower.
> > +
> > +Profiling data will only become accessible once debugfs has been mounted:
> > +
> > +.. code-block:: sh
> > +
> > +   mount -t debugfs none /sys/kernel/debug
> > +
> > +
> > +Customization
> > +=============
> > +
> > +You can enable or disable profiling for individual file and directories by
> > +adding a line similar to the following to the respective kernel Makefile:
> > +
> > +- For a single file (e.g. main.o)
> > +
> > +  .. code-block:: make
> > +
> > +     PGO_PROFILE_main.o := y
> > +
> > +- For all files in one directory
> > +
> > +  .. code-block:: make
> > +
> > +     PGO_PROFILE := y
> > +
> > +To exclude files from being profiled use
> > +
> > +  .. code-block:: make
> > +
> > +     PGO_PROFILE_main.o := n
> > +
> > +and
> > +
> > +  .. code-block:: make
> > +
> > +     PGO_PROFILE := n
> > +
> > +Only files which are linked to the main kernel image or are compiled as kernel
> > +modules are supported by this mechanism.
> > +
> > +
> > +Files
> > +=====
> > +
> > +The PGO kernel support creates the following files in debugfs:
> > +
> > +``/sys/kernel/debug/pgo``
> > +       Parent directory for all PGO-related files.
> > +
> > +``/sys/kernel/debug/pgo/reset``
> > +       Global reset file: resets all coverage data to zero when written to.
> > +
> > +``/sys/kernel/debug/profraw``
> > +       The raw PGO data that must be processed with ``llvm_profdata``.
> > +
> > +
> > +Workflow
> > +========
> > +
> > +The PGO kernel can be run on the host or test machines. The data though should
> > +be analyzed with Clang's tools from the same Clang version as the kernel was
> > +compiled. Clang's tolerant of version skew, but it's easier to use the same
> > +Clang version.
> > +
> > +The profiling data is useful for optimizing the kernel, analyzing coverage,
> > +etc. Clang offers tools to perform these tasks.
> > +
> > +Here is an example workflow for profiling an instrumented kernel with PGO and
> > +using the result to optimize the kernel:
> > +
> > +1) Install the kernel on the TEST machine.
> > +
> > +2) Reset the data counters right before running the load tests
> > +
> > +   .. code-block:: sh
> > +
> > +      $ echo 1 > /sys/kernel/debug/pgo/reset
> > +
>
> I do not get this...
>
> # mount | grep debugfs
> debugfs on /sys/kernel/debug type debugfs (rw,nosuid,nodev,noexec,relatime)
>
> After the load-test...?
>
> echo 0 > /sys/kernel/debug/pgo/reset
>
Writing anything to /sys/kernel/debug/pgo/reset will cause it to reset
the profiling counters. I picked 1 (one) semi-randomly, but it could
be any number, letter, your favorite short story, etc. You don't want
to reset it before collecting the profiling data from your load tests
though.

> > +3) Run the load tests.
> > +
> > +4) Collect the raw profile data
> > +
> > +   .. code-block:: sh
> > +
> > +      $ cp -a /sys/kernel/debug/pgo/profraw /tmp/vmlinux.profraw
> > +
>
> This is only 4,9M small and seen from the date 5mins before I run the
> echo-1 line.
>
> # ll /sys/kernel/debug/pgo
> insgesamt 0
> drwxr-xr-x  2 root root 0 16. Jan 17:29 .
> drwx------ 41 root root 0 16. Jan 17:29 ..
> -rw-------  1 root root 0 16. Jan 17:29 profraw
> --w-------  1 root root 0 16. Jan 18:19 reset
>
> # cp -a /sys/kernel/debug/pgo/profraw /tmp/vmlinux.profraw
>
> # ll /tmp/vmlinux.profraw
> -rw------- 1 root root 4,9M 16. Jan 17:29 /tmp/vmlinux.profraw
>
> For me there was no prof-data collected from my defconfig kernel-build.
>
The /sys/kernel/debug/pgo/profraw file is read-only. Nothing writes to
it, not even the kernel. All it does is serialize the profiling
counters from a memory location in the kernel into a format that
LLVM's tools can understand.

> > +5) (Optional) Download the raw profile data to the HOST machine.
> > +
> > +6) Process the raw profile data
> > +
> > +   .. code-block:: sh
> > +
> > +      $ llvm-profdata merge --output=vmlinux.profdata vmlinux.profraw
> > +
>
> Is that executed in /path/to/linux/git?
>
The llvm-profdata tool is not in the linux source tree. You need to
grab it from a clang distribution (or built from clang's git repo).

> > +   Note that multiple raw profile data files can be merged during this step.
> > +
> > +7) Rebuild the kernel using the profile data (PGO disabled)
> > +
> > +   .. code-block:: sh
> > +
> > +      $ make LLVM=1 KCFLAGS=-fprofile-use=vmlinux.profdata ...
>
> How big is vmlinux.profdata (make defconfig)?
>
I don't have numbers for this, but from what you listed here, it's ~5M
in size. The size is proportional to the number of counters
instrumented in the kernel.

> Do I need to do a full defconfig build or can I stop the build after
> let me say 10mins?
>
You should do a full rebuild. Make sure that PGO is disabled during the rebuild.

-bw
