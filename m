Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F04DD2F9529
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 Jan 2021 21:35:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730261AbhAQUf6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 Jan 2021 15:35:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730254AbhAQUfx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 Jan 2021 15:35:53 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 381B3C061574
        for <linux-kbuild@vger.kernel.org>; Sun, 17 Jan 2021 12:35:12 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id g24so15291230edw.9
        for <linux-kbuild@vger.kernel.org>; Sun, 17 Jan 2021 12:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qRt+U2nexebC7agw5F2eizUo7yh6FfrEDdQvIp3D1ZY=;
        b=So0JnSINNudC/JmjfuOuRSHS6TyPZPcpgSJwsRGejcuahbGCdatFoU0BeH2pluriEY
         r0PD5kmZQMKHDBNKIJUjjZ/PXmdQG/T37yhSFdpWNrAjFfDBF/JoQCfyQo/Zngkwx4lo
         gbfo8emeNQFiM6jrUuz4wgm5v3wwCS1dWyYeL3IlDhuvnCQFd1l7hEIA+H8L9NZU5pPT
         crQrgai+WooFsf2Nz3PYgGJ6VD25WPDDr+C9u9CdiH3dOEU8pVqqVr69nE6FAqcuXi12
         NbY4tz0T9kuuO80PU2A28KoWD+HWPW+AKMw52EanEb0KCD8KJ36afKMreKCRRHpKX1JM
         CUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qRt+U2nexebC7agw5F2eizUo7yh6FfrEDdQvIp3D1ZY=;
        b=jFEM7dO015uhGBXCnNkpJn6sq4JMk5sLCttaxwzHOHnjmx1ui3WQIRluCGHIxcG0H6
         9zVbt98ivNLwIIIlUl54rm18b9UbbCYfvRh6r1nIsUNE4pcReDC0Bu4D6pMWA3mY3f4c
         FsorUI4iRwHhI86zwY6Qg96BDRTN7QlJxKs9uqb/GXjbXXB5ddqUg4fXEDQTr21Zx+et
         517MzuBvjcIM8GtIU/o71/Uv8AkRS7IhOFqZQF1thPYIHuEdhcLoUaKvjL5NHlIyYwoL
         EZRURVvPpECz1woCVikkGZvvnu5k4X69NhIrtTUeg+R6lob6UwCWZhbuu8r3dw1korA0
         K0Hw==
X-Gm-Message-State: AOAM532HNgRZcnb747/nXEUXPkcBN5oO/KDEGd+uHAdTF2nXt9HAGZI7
        v4il+ePJPraw5paitMvI+lOEXT8GECSVyxyqNqql
X-Google-Smtp-Source: ABdhPJy4WKfuMFd5AoRNavm7MMwsMrRLThq810tFh4qa0sKgQ2kBI3lO8LDjYOAPhtQ71IpWTNcqqAcyyVVwfMnHaLw=
X-Received: by 2002:a50:d8c4:: with SMTP id y4mr350137edj.261.1610915710349;
 Sun, 17 Jan 2021 12:35:10 -0800 (PST)
MIME-Version: 1.0
References: <20210113061958.886723-1-morbo@google.com> <20210116094357.3620352-1-morbo@google.com>
 <CA+icZUUgTuD6fO_AZFs9KoRFS8FUmyhezvYeeoRX2dveG_ifDA@mail.gmail.com>
 <CAGG=3QXZTR_f9pKzAR=LrALmMzdDqsvWM_zrTXOb2PpiDGB-+A@mail.gmail.com>
 <CA+icZUWf05ek+DFsJNyBc-4cg0s6cVrn=rNJDyL4RJ6=fMO5NA@mail.gmail.com>
 <CA+icZUVD1AHaXYu4Ne8JhzmtMR5DReL4C=ZxKfA0hjLtbC79qQ@mail.gmail.com>
 <CA+icZUUTJbwmTYCDJhyRtif3BdsB_yzQ3bSdLR62EmttJf3Row@mail.gmail.com>
 <CA+icZUUfWR1v3GStn6t_6MYDmwTdJ_zDwBTe2jmQRg7aOA1Q2A@mail.gmail.com>
 <CA+icZUU-3i7Of71C6XaNmee7xD4y_DeoWJFvUHnMUyBaMN3Ywg@mail.gmail.com>
 <CA+icZUXmn15w=kSq2CZzQD5JggJw_9AEam=Sz13M0KpJ68MWZg@mail.gmail.com> <CA+icZUWUPCuLWCo=kuPr9YZ4-NZ3F8Fv1GzDXPbDevyWjaMrJg@mail.gmail.com>
In-Reply-To: <CA+icZUWUPCuLWCo=kuPr9YZ4-NZ3F8Fv1GzDXPbDevyWjaMrJg@mail.gmail.com>
From:   Bill Wendling <morbo@google.com>
Date:   Sun, 17 Jan 2021 12:34:58 -0800
Message-ID: <CAGG=3QW+ayBzCxOusLyQ0-y5K5C_3hNXjara_pYOcxK8MseN9g@mail.gmail.com>
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

On Sun, Jan 17, 2021 at 9:42 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Sun, Jan 17, 2021 at 1:05 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > On Sun, Jan 17, 2021 at 12:58 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > >
> > > On Sun, Jan 17, 2021 at 12:42 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > > >
> > > > On Sun, Jan 17, 2021 at 12:23 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > > > >
> > > > > On Sun, Jan 17, 2021 at 11:53 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > > > > >
> > > > > > On Sun, Jan 17, 2021 at 11:44 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > > > > > >
> > > > > > > On Sat, Jan 16, 2021 at 9:23 PM Bill Wendling <morbo@google.com> wrote:
> > > > > > > >
> > > > > > > > On Sat, Jan 16, 2021 at 9:39 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > > > > > > > > On Sat, Jan 16, 2021 at 10:44 AM 'Bill Wendling' via Clang Built Linux
> > > > > > > > > <clang-built-linux@googlegroups.com> wrote:
> > > > > > > > > >
> > > > > > > > > > From: Sami Tolvanen <samitolvanen@google.com>
> > > > > > > > > >
> > > > > > > > > > Enable the use of clang's Profile-Guided Optimization[1]. To generate a
> > > > > > > > > > profile, the kernel is instrumented with PGO counters, a representative
> > > > > > > > > > workload is run, and the raw profile data is collected from
> > > > > > > > > > /sys/kernel/debug/pgo/profraw.
> > > > > > > > > >
> > > > > > > > > > The raw profile data must be processed by clang's "llvm-profdata" tool
> > > > > > > > > > before it can be used during recompilation:
> > > > > > > > > >
> > > > > > > > > >   $ cp /sys/kernel/debug/pgo/profraw vmlinux.profraw
> > > > > > > > > >   $ llvm-profdata merge --output=vmlinux.profdata vmlinux.profraw
> > > > > > > > > >
> > > > > > > > > > Multiple raw profiles may be merged during this step.
> > > > > > > > > >
> > > > > > > > > > The data can now be used by the compiler:
> > > > > > > > > >
> > > > > > > > > >   $ make LLVM=1 KCFLAGS=-fprofile-use=vmlinux.profdata ...
> > > > > > > > > >
> > > > > > > > > > This initial submission is restricted to x86, as that's the platform we
> > > > > > > > > > know works. This restriction can be lifted once other platforms have
> > > > > > > > > > been verified to work with PGO.
> > > > > > > > > >
> > > > > > > > > > Note that this method of profiling the kernel is clang-native, unlike
> > > > > > > > > > the clang support in kernel/gcov.
> > > > > > > > > >
> > > > > > > > > > [1] https://clang.llvm.org/docs/UsersManual.html#profile-guided-optimization
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > > > > > > > > > Co-developed-by: Bill Wendling <morbo@google.com>
> > > > > > > > > > Signed-off-by: Bill Wendling <morbo@google.com>
> > > > > > > > > > ---
> > > > > > > > > > v2: - Added "__llvm_profile_instrument_memop" based on Nathan Chancellor's
> > > > > > > > > >       testing.
> > > > > > > > > >     - Corrected documentation, re PGO flags when using LTO, based on Fangrui
> > > > > > > > > >       Song's comments.
> > > > > > > > > > v3: - Added change log section based on Sedat Dilek's comments.
> > > > > > > > > > v4: - Remove non-x86 Makfile changes and se "hweight64" instead of using our
> > > > > > > > > >       own popcount implementation, based on Nick Desaulniers's comment.
> > > > > > > > > > v5: - Correct padding calculation, discovered by Nathan Chancellor.
> > > > > > > > > > ---
> > > > > > > > > >  Documentation/dev-tools/index.rst     |   1 +
> > > > > > > > > >  Documentation/dev-tools/pgo.rst       | 127 +++++++++
> > > > > > > > > >  MAINTAINERS                           |   9 +
> > > > > > > > > >  Makefile                              |   3 +
> > > > > > > > > >  arch/Kconfig                          |   1 +
> > > > > > > > > >  arch/x86/Kconfig                      |   1 +
> > > > > > > > > >  arch/x86/boot/Makefile                |   1 +
> > > > > > > > > >  arch/x86/boot/compressed/Makefile     |   1 +
> > > > > > > > > >  arch/x86/crypto/Makefile              |   2 +
> > > > > > > > > >  arch/x86/entry/vdso/Makefile          |   1 +
> > > > > > > > > >  arch/x86/kernel/vmlinux.lds.S         |   2 +
> > > > > > > > > >  arch/x86/platform/efi/Makefile        |   1 +
> > > > > > > > > >  arch/x86/purgatory/Makefile           |   1 +
> > > > > > > > > >  arch/x86/realmode/rm/Makefile         |   1 +
> > > > > > > > > >  arch/x86/um/vdso/Makefile             |   1 +
> > > > > > > > > >  drivers/firmware/efi/libstub/Makefile |   1 +
> > > > > > > > > >  include/asm-generic/vmlinux.lds.h     |  44 +++
> > > > > > > > > >  kernel/Makefile                       |   1 +
> > > > > > > > > >  kernel/pgo/Kconfig                    |  35 +++
> > > > > > > > > >  kernel/pgo/Makefile                   |   5 +
> > > > > > > > > >  kernel/pgo/fs.c                       | 382 ++++++++++++++++++++++++++
> > > > > > > > > >  kernel/pgo/instrument.c               | 185 +++++++++++++
> > > > > > > > > >  kernel/pgo/pgo.h                      | 206 ++++++++++++++
> > > > > > > > > >  scripts/Makefile.lib                  |  10 +
> > > > > > > > > >  24 files changed, 1022 insertions(+)
> > > > > > > > > >  create mode 100644 Documentation/dev-tools/pgo.rst
> > > > > > > > > >  create mode 100644 kernel/pgo/Kconfig
> > > > > > > > > >  create mode 100644 kernel/pgo/Makefile
> > > > > > > > > >  create mode 100644 kernel/pgo/fs.c
> > > > > > > > > >  create mode 100644 kernel/pgo/instrument.c
> > > > > > > > > >  create mode 100644 kernel/pgo/pgo.h
> > > > > > > > > >
> > > > > > > > > > diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/index.rst
> > > > > > > > > > index f7809c7b1ba9e..8d6418e858062 100644
> > > > > > > > > > --- a/Documentation/dev-tools/index.rst
> > > > > > > > > > +++ b/Documentation/dev-tools/index.rst
> > > > > > > > > > @@ -26,6 +26,7 @@ whole; patches welcome!
> > > > > > > > > >     kgdb
> > > > > > > > > >     kselftest
> > > > > > > > > >     kunit/index
> > > > > > > > > > +   pgo
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > >  .. only::  subproject and html
> > > > > > > > > > diff --git a/Documentation/dev-tools/pgo.rst b/Documentation/dev-tools/pgo.rst
> > > > > > > > > > new file mode 100644
> > > > > > > > > > index 0000000000000..b7f11d8405b73
> > > > > > > > > > --- /dev/null
> > > > > > > > > > +++ b/Documentation/dev-tools/pgo.rst
> > > > > > > > > > @@ -0,0 +1,127 @@
> > > > > > > > > > +.. SPDX-License-Identifier: GPL-2.0
> > > > > > > > > > +
> > > > > > > > > > +===============================
> > > > > > > > > > +Using PGO with the Linux kernel
> > > > > > > > > > +===============================
> > > > > > > > > > +
> > > > > > > > > > +Clang's profiling kernel support (PGO_) enables profiling of the Linux kernel
> > > > > > > > > > +when building with Clang. The profiling data is exported via the ``pgo``
> > > > > > > > > > +debugfs directory.
> > > > > > > > > > +
> > > > > > > > > > +.. _PGO: https://clang.llvm.org/docs/UsersManual.html#profile-guided-optimization
> > > > > > > > > > +
> > > > > > > > > > +
> > > > > > > > > > +Preparation
> > > > > > > > > > +===========
> > > > > > > > > > +
> > > > > > > > > > +Configure the kernel with:
> > > > > > > > > > +
> > > > > > > > > > +.. code-block:: make
> > > > > > > > > > +
> > > > > > > > > > +   CONFIG_DEBUG_FS=y
> > > > > > > > > > +   CONFIG_PGO_CLANG=y
> > > > > > > > > > +
> > > > > > > > > > +Note that kernels compiled with profiling flags will be significantly larger
> > > > > > > > > > +and run slower.
> > > > > > > > > > +
> > > > > > > > > > +Profiling data will only become accessible once debugfs has been mounted:
> > > > > > > > > > +
> > > > > > > > > > +.. code-block:: sh
> > > > > > > > > > +
> > > > > > > > > > +   mount -t debugfs none /sys/kernel/debug
> > > > > > > > > > +
> > > > > > > > > > +
> > > > > > > > > > +Customization
> > > > > > > > > > +=============
> > > > > > > > > > +
> > > > > > > > > > +You can enable or disable profiling for individual file and directories by
> > > > > > > > > > +adding a line similar to the following to the respective kernel Makefile:
> > > > > > > > > > +
> > > > > > > > > > +- For a single file (e.g. main.o)
> > > > > > > > > > +
> > > > > > > > > > +  .. code-block:: make
> > > > > > > > > > +
> > > > > > > > > > +     PGO_PROFILE_main.o := y
> > > > > > > > > > +
> > > > > > > > > > +- For all files in one directory
> > > > > > > > > > +
> > > > > > > > > > +  .. code-block:: make
> > > > > > > > > > +
> > > > > > > > > > +     PGO_PROFILE := y
> > > > > > > > > > +
> > > > > > > > > > +To exclude files from being profiled use
> > > > > > > > > > +
> > > > > > > > > > +  .. code-block:: make
> > > > > > > > > > +
> > > > > > > > > > +     PGO_PROFILE_main.o := n
> > > > > > > > > > +
> > > > > > > > > > +and
> > > > > > > > > > +
> > > > > > > > > > +  .. code-block:: make
> > > > > > > > > > +
> > > > > > > > > > +     PGO_PROFILE := n
> > > > > > > > > > +
> > > > > > > > > > +Only files which are linked to the main kernel image or are compiled as kernel
> > > > > > > > > > +modules are supported by this mechanism.
> > > > > > > > > > +
> > > > > > > > > > +
> > > > > > > > > > +Files
> > > > > > > > > > +=====
> > > > > > > > > > +
> > > > > > > > > > +The PGO kernel support creates the following files in debugfs:
> > > > > > > > > > +
> > > > > > > > > > +``/sys/kernel/debug/pgo``
> > > > > > > > > > +       Parent directory for all PGO-related files.
> > > > > > > > > > +
> > > > > > > > > > +``/sys/kernel/debug/pgo/reset``
> > > > > > > > > > +       Global reset file: resets all coverage data to zero when written to.
> > > > > > > > > > +
> > > > > > > > > > +``/sys/kernel/debug/profraw``
> > > > > > > > > > +       The raw PGO data that must be processed with ``llvm_profdata``.
> > > > > > > > > > +
> > > > > > > > > > +
> > > > > > > > > > +Workflow
> > > > > > > > > > +========
> > > > > > > > > > +
> > > > > > > > > > +The PGO kernel can be run on the host or test machines. The data though should
> > > > > > > > > > +be analyzed with Clang's tools from the same Clang version as the kernel was
> > > > > > > > > > +compiled. Clang's tolerant of version skew, but it's easier to use the same
> > > > > > > > > > +Clang version.
> > > > > > > > > > +
> > > > > > > > > > +The profiling data is useful for optimizing the kernel, analyzing coverage,
> > > > > > > > > > +etc. Clang offers tools to perform these tasks.
> > > > > > > > > > +
> > > > > > > > > > +Here is an example workflow for profiling an instrumented kernel with PGO and
> > > > > > > > > > +using the result to optimize the kernel:
> > > > > > > > > > +
> > > > > > > > > > +1) Install the kernel on the TEST machine.
> > > > > > > > > > +
> > > > > > > > > > +2) Reset the data counters right before running the load tests
> > > > > > > > > > +
> > > > > > > > > > +   .. code-block:: sh
> > > > > > > > > > +
> > > > > > > > > > +      $ echo 1 > /sys/kernel/debug/pgo/reset
> > > > > > > > > > +
> > > > > > > > >
> > > > > > > > > I do not get this...
> > > > > > > > >
> > > > > > > > > # mount | grep debugfs
> > > > > > > > > debugfs on /sys/kernel/debug type debugfs (rw,nosuid,nodev,noexec,relatime)
> > > > > > > > >
> > > > > > > > > After the load-test...?
> > > > > > > > >
> > > > > > > > > echo 0 > /sys/kernel/debug/pgo/reset
> > > > > > > > >
> > > > > > > > Writing anything to /sys/kernel/debug/pgo/reset will cause it to reset
> > > > > > > > the profiling counters. I picked 1 (one) semi-randomly, but it could
> > > > > > > > be any number, letter, your favorite short story, etc. You don't want
> > > > > > > > to reset it before collecting the profiling data from your load tests
> > > > > > > > though.
> > > > > > > >
> > > > > > > > > > +3) Run the load tests.
> > > > > > > > > > +
> > > > > > > > > > +4) Collect the raw profile data
> > > > > > > > > > +
> > > > > > > > > > +   .. code-block:: sh
> > > > > > > > > > +
> > > > > > > > > > +      $ cp -a /sys/kernel/debug/pgo/profraw /tmp/vmlinux.profraw
> > > > > > > > > > +
> > > > > > > > >
> > > > > > > > > This is only 4,9M small and seen from the date 5mins before I run the
> > > > > > > > > echo-1 line.
> > > > > > > > >
> > > > > > > > > # ll /sys/kernel/debug/pgo
> > > > > > > > > insgesamt 0
> > > > > > > > > drwxr-xr-x  2 root root 0 16. Jan 17:29 .
> > > > > > > > > drwx------ 41 root root 0 16. Jan 17:29 ..
> > > > > > > > > -rw-------  1 root root 0 16. Jan 17:29 profraw
> > > > > > > > > --w-------  1 root root 0 16. Jan 18:19 reset
> > > > > > > > >
> > > > > > > > > # cp -a /sys/kernel/debug/pgo/profraw /tmp/vmlinux.profraw
> > > > > > > > >
> > > > > > > > > # ll /tmp/vmlinux.profraw
> > > > > > > > > -rw------- 1 root root 4,9M 16. Jan 17:29 /tmp/vmlinux.profraw
> > > > > > > > >
> > > > > > > > > For me there was no prof-data collected from my defconfig kernel-build.
> > > > > > > > >
> > > > > > > > The /sys/kernel/debug/pgo/profraw file is read-only. Nothing writes to
> > > > > > > > it, not even the kernel. All it does is serialize the profiling
> > > > > > > > counters from a memory location in the kernel into a format that
> > > > > > > > LLVM's tools can understand.
> > > > > > > >
> > > > > > > > > > +5) (Optional) Download the raw profile data to the HOST machine.
> > > > > > > > > > +
> > > > > > > > > > +6) Process the raw profile data
> > > > > > > > > > +
> > > > > > > > > > +   .. code-block:: sh
> > > > > > > > > > +
> > > > > > > > > > +      $ llvm-profdata merge --output=vmlinux.profdata vmlinux.profraw
> > > > > > > > > > +
> > > > > > > > >
> > > > > > > > > Is that executed in /path/to/linux/git?
> > > > > > > > >
> > > > > > > > The llvm-profdata tool is not in the linux source tree. You need to
> > > > > > > > grab it from a clang distribution (or built from clang's git repo).
> > > > > > > >
> > > > > > > > > > +   Note that multiple raw profile data files can be merged during this step.
> > > > > > > > > > +
> > > > > > > > > > +7) Rebuild the kernel using the profile data (PGO disabled)
> > > > > > > > > > +
> > > > > > > > > > +   .. code-block:: sh
> > > > > > > > > > +
> > > > > > > > > > +      $ make LLVM=1 KCFLAGS=-fprofile-use=vmlinux.profdata ...
> > > > > > > > >
> > > > > > > > > How big is vmlinux.profdata (make defconfig)?
> > > > > > > > >
> > > > > > > > I don't have numbers for this, but from what you listed here, it's ~5M
> > > > > > > > in size. The size is proportional to the number of counters
> > > > > > > > instrumented in the kernel.
> > > > > > > >
> > > > > > > > > Do I need to do a full defconfig build or can I stop the build after
> > > > > > > > > let me say 10mins?
> > > > > > > > >
> > > > > > > > You should do a full rebuild. Make sure that PGO is disabled during the rebuild.
> > > > > > > >
> > > > > > >
> > > > > > > Thanks Bill for all the information.
> > > > > > >
> > > > > > > And sorry if I am so pedantic.
> > > > > > >
> > > > > > > I have installed my Debian system with Legacy-BIOS enabled.
> > > > > > >
> > > > > > > When I rebuild with KCFLAGS=-fprofile-use=vmlinux.profdata (LLVM=1 I
> > > > > > > have as a default) my system hangs on reboot.
> > > > > > >
> > > > > > > [ diffconfig ]
> > > > > > > $ scripts/diffconfig /boot/config-5.11.0-rc3-8-amd64-clang12-pgo
> > > > > > > /boot/config-5.11.0-rc3-9-amd64-clang12-pgo
> > > > > > > BUILD_SALT "5.11.0-rc3-8-amd64-clang12-pgo" -> "5.11.0-rc3-9-amd64-clang12-pgo"
> > > > > > > PGO_CLANG y -> n
> > > > > > >
> > > > > > > [ my make line ]
> > > > > > > $ cat ../start-build_5.11.0-rc3-9-amd64-clang12-pgo.txt
> > > > > > > dileks     63120   63095  0 06:47 pts/2    00:00:00 /usr/bin/perf_5.10
> > > > > > > stat make V=1 -j4 HOSTCC=clang HOSTCXX=clang++ HOSTLD=ld.lld CC=clang
> > > > > > > LD=ld.lld LLVM=1 LLVM_IAS=1 PAHOLE=/opt/pahole/bin/pahole
> > > > > > > LOCALVERSION=-9-amd64-clang12-pgo KBUILD_VERBOSE=1
> > > > > > > KBUILD_BUILD_HOST=iniza KBUILD_BUILD_USER=sedat.dilek@gmail.com
> > > > > > > KBUILD_BUILD_TIMESTAMP=2021-01-17 bindeb-pkg
> > > > > > > KDEB_PKGVERSION=5.11.0~rc3-9~bullseye+dileks1
> > > > > > > KCFLAGS=-fprofile-use=vmlinux.profdata
> > > > > > >
> > > > > > > ( Yes, 06:47 a.m. in the morning :-). )
> > > > > > >
> > > > > > > When I boot with the rebuild Linux-kernel I see:
> > > > > > >
> > > > > > > Wrong EFI loader signature
> > > > > > > ...
> > > > > > > Decompressing
> > > > > > > Parsing EFI
> > > > > > > Performing Relocations done.
> > > > > > > Booting the Kernel.
> > > > > > >
> > > > > > > *** SYSTEM HANGS ***
> > > > > > > ( I waited for approx 1 min )
> > > > > > >
> > > > > > > I tried to turn UEFI support ON and OFF.
> > > > > > > No success.
> > > > > > >
> > > > > > > Does Clang-PGO support Legacy-BIOS or is something different wrong?
> > > > > > >
> > > > > > > Thanks.
> > > > > > >
> > > > > >
> > > > > > My bootloader is GRUB.
> > > > > >
> > > > > > In UEFI-BIOS settings there is no secure-boot disable option.
> > > > > > Just simple "Use UEFI BIOS" enabled|disabled.
> > > > > >
> > > > > > Installed Debian packages:
> > > > > >
> > > > > > ii grub-common 2.04-12
> > > > > > ii grub-pc 2.04-12
> > > > > > ii grub-pc-bin 2.04-12
> > > > > > ii grub2-common 2.04-12
> > > > > >
> > > > > > I found in the below link to do in grub-shell:
> > > > > >
> > > > > > set check_signatures=no
> > > > > >
> > > > > > But this is when grub-efi is installed.
> > > > > >
> > > > > > - Sedat -
> > > > > >
> > > > > > Link: https://unix.stackexchange.com/questions/126286/grub-efi-disable-signature-check
> > > > >
> > > > > Forget about that "Wrong EFI bootloader" - I see this with all other
> > > > > kernels (all boot fine).
> > > > >
> > > > > I tried in QEMU with and without KASLR:
> > > > >
> > > > > [ run_qemu.sh ]
> > > > > KPATH=$(pwd)
> > > > >
> > > > > APPEND="root=/dev/ram0 console=ttyS0 hung_task_panic=1 earlyprintk=ttyS0,115200"
> > > > > APPEND="$APPEND nokaslr"
> > > > >
> > > > > qemu-system-x86_64 -enable-kvm -M pc -kernel $KPATH/bzImage -initrd
> > > > > $KPATH/initrd.img -m 512 -net none -serial stdio -append "${APPEND}"
> > > > > [ /run_qemu.sh ]
> > > > >
> > > > > $ ./run_qemu.sh
> > > > > Probing EDD (edd=off to disable)... ok
> > > > > Wrong EFI loader signature.
> > > > > early console in extract_kernel
> > > > > input_data: 0x000000000289940d
> > > > > input_len: 0x000000000069804a
> > > > > output: 0x0000000001000000
> > > > > output_len: 0x0000000001ef2010
> > > > > kernel_total_size: 0x0000000001c2c000
> > > > > needed_size: 0x0000000002000000
> > > > > trampoline_32bit: 0x000000000009d000
> > > > >
> > > > >
> > > > > KASLR disabled: 'nokaslr' on cmdline.
> > > > >
> > > > >
> > > > > Decompressing Linux... Parsing ELF... No relocation needed... done.
> > > > > Booting the kernel.
> > > > >
> > > > > QEMU run stops, too.
> > > > >
> > > >
> > > > I re-generated my initrd.img with GZIP as compressor (my default is ZSTD).
> > > >
> > > > --- /etc/initramfs-tools/initramfs.conf 2021-01-17 12:35:30.823818501 +0100
> > > > +++ /etc/initramfs-tools/initramfs.conf.zstd    2020-09-21
> > > > 23:55:43.121735427 +0200
> > > > @@ -41,7 +41,7 @@ KEYMAP=n
> > > > # COMPRESS: [ gzip | bzip2 | lz4 | lzma | lzop | xz | zstd ]
> > > > #
> > > >
> > > > -COMPRESS=gzip
> > > > +COMPRESS=zstd
> > > >
> > > > #
> > > > # DEVICE: ...
> > > >
> > > > root# KVER="5.11.0-rc3-9-amd64-clang12-pgo" ; update-initramfs -c -k $KVER
> > > >
> > > > QEMU boot stops at the same stage.
> > > >
> > > > Now, my head is empty...
> > > >
> > > > Any comments?
> > > >
> > >
> > > ( Just as a side note I have Nick's DWARF-v5 support enabled. )
> > >
> > > There is one EFI related warning in my build-log:
> > >
> > > $ grep warning: build-log_5.11.0-rc3-9-amd64-clang12-pgo.txt
> > > dpkg-architecture: warning: specified GNU system type x86_64-linux-gnu
> > > does not match CC system type x86_64-pc-linux-gnu, try setting a
> > > correct CC environment variable
> > > warning: arch/x86/platform/efi/quirks.c: Function control flow change
> > > detected (hash mismatch) efi_arch_mem_reserve Hash =
> > > 391331300655996873 [-Wbackend-plugin]
> > > warning: arch/x86/platform/efi/efi.c: Function control flow change
> > > detected (hash mismatch) efi_attr_is_visible Hash = 567185240781730690
> > > [-Wbackend-plugin]
> > > arch/x86/crypto/aegis128-aesni-glue.c:265:30: warning: unused variable
> > > 'simd_alg' [-Wunused-variable]
> > > warning: lib/crypto/sha256.c: Function control flow change detected
> > > (hash mismatch) sha256_update Hash = 744640996947387358
> > > [-Wbackend-plugin]
> > > warning: arch/x86/boot/compressed/string.c: Function control flow
> > > change detected (hash mismatch) memcmp Hash = 742261418966908927
> > > [-Wbackend-plugin]
> > > warning: arch/x86/boot/compressed/string.c: Function control flow
> > > change detected (hash mismatch) bcmp Hash = 742261418966908927
> > > [-Wbackend-plugin]
> > > warning: arch/x86/boot/compressed/string.c: Function control flow
> > > change detected (hash mismatch) strcmp Hash = 536873291001348520
> > > [-Wbackend-plugin]
> > > warning: arch/x86/boot/compressed/string.c: Function control flow
> > > change detected (hash mismatch) strnlen Hash = 146835646621254984
> > > [-Wbackend-plugin]
> > > warning: arch/x86/boot/compressed/string.c: Function control flow
> > > change detected (hash mismatch) simple_strtoull Hash =
> > > 252792765950587360 [-Wbackend-plugin]
> > > warning: arch/x86/boot/compressed/string.c: Function control flow
> > > change detected (hash mismatch) strstr Hash = 391331303349076211
> > > [-Wbackend-plugin]
> > > warning: arch/x86/boot/compressed/string.c: Function control flow
> > > change detected (hash mismatch) strchr Hash = 1063705159280644635
> > > [-Wbackend-plugin]
> > > warning: arch/x86/boot/compressed/string.c: Function control flow
> > > change detected (hash mismatch) kstrtoull Hash = 758414239132790022
> > > [-Wbackend-plugin]
> > > drivers/infiniband/hw/hfi1/platform.o: warning: objtool: tune_serdes()
> > > falls through to next function apply_tx_lanes()
> > >
> > > Cannot say if this information is helpful.
> > >
> >
> > My LLVM/Clang v12 is from <apt.llvm.org>:
> >
> > clang-12 version 1:12~++20210115111113+45ef053bd709-1~exp1~20210115101809.3724
> >
> > My kernel-config is attached.
> >
>
> I dropped "LLVM_IAS=1" from my make line and did for my next build:
>
> $ scripts/diffconfig /boot/config-5.11.0-rc3-8-amd64-clang12-pgo .config
> BUILD_SALT "5.11.0-rc3-8-amd64-clang12-pgo" -> "5.11.0-rc3-10-amd64-clang12-pgo"
> DEBUG_INFO_DWARF2 n -> y
> DEBUG_INFO_DWARF5 y -> n
> PGO_CLANG y -> n
>
> Means dropped DWARF5 support.
>
Hi Sedat,

Using PGO just improves optimizations. So unless there's miscompile,
or some other nefarious thing, it shouldn't affect how the boot loader
runs.

As a sanity check, does the same Linux source and compiler version
generate a bootable kernel when PGO isn't used?

-bw
