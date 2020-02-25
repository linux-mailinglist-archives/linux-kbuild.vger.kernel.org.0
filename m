Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E59D116B9C3
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Feb 2020 07:31:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbgBYGbE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 25 Feb 2020 01:31:04 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45116 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgBYGbE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Feb 2020 01:31:04 -0500
Received: by mail-wr1-f67.google.com with SMTP id g3so13203676wrs.12;
        Mon, 24 Feb 2020 22:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=ZjrDQL3LER0qAgx1gMeLpsXVl1KwKwuKmN0OHczFSk4=;
        b=MblnRK6LdgNKiZ0kMjzz1DJp+UX58M1YT+G+HTkk3Oq7VIbxtgSsyoGgRzmQdHeKwX
         uGQCRfVCtOpwr9ypQBxp6QNjooJboY/0va+v7sK51PnxrwOD0wAraumNRh9xKLGdAOb0
         ZiaFXoAGJOGdtVM+t0uNTdVhuxFMPGwJNKNviKo7t4qoG0UwgtF0WzEtORwWOLwvypEG
         7nhODu6G1D31m3A+oYgXolptvawJJYTJoJIJy2+agzUWsJvv7kuxJHGK5ZQnR42j/DX8
         OS2ztgHu+xugT9PoLff3V2iH+D2xjfn4siP/s8dMHWQtnxi5J989WJ2QkFTVoeAnV7Fv
         JRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=ZjrDQL3LER0qAgx1gMeLpsXVl1KwKwuKmN0OHczFSk4=;
        b=dgKt+Dxf8pEedobrjsYYKlW/l0lavf0NasDhx1TBPnmN0q2hpziNaGpVGKPKAWpsvU
         AOXk91l5OhK1YXGW9eNrE/tKsCdEBrHrxAH6nSPWTfSN0uN9BcdXRU3+AshjgOyo3AQu
         kOZfrFhhjh39gl9y/b+xdEU74ZCEEMDqkwD1K87fx7C7bndWKmL+6pm2GY4aITSQWHSK
         m198FXmB6KBvbIa0lycjGSSpNNI/YkzUp/jyikwM1Q9kmzEMKd/7iQE5oTQecsmUPVYo
         ceOrAwYDIG/gd4jqXc66ZQCQh47p6dzg3Rvm0SyRbHJF7SgOelH40RiiXRrWwrDercwi
         vOUA==
X-Gm-Message-State: APjAAAUyr1dSrn6rEeUDnd1g9+GWu3OQJm1wCE1J2XZrUvPddSPWsDFd
        dZJc+puWMJQS0VpIe0bznGgaRwFtaSvZWJWmJTE=
X-Google-Smtp-Source: APXvYqz0m+/GUt9kS8abLMTXEYt6gf+ptK2KMsPZVIeNT03+EOs6epg/ikq1RZRLIbmZb2r3HvAFXBg3bpJq1B3jr3E=
X-Received: by 2002:a05:6000:114f:: with SMTP id d15mr44810682wrx.130.1582612261176;
 Mon, 24 Feb 2020 22:31:01 -0800 (PST)
MIME-Version: 1.0
References: <20200224174129.2664-1-ndesaulniers@google.com> <202002242003.870E5F80@keescook>
In-Reply-To: <202002242003.870E5F80@keescook>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Tue, 25 Feb 2020 07:33:27 +0100
Message-ID: <CA+icZUWVybtEW3bxw5p8UFvoRr5OU=sgcpL=EbQTW7sTWYsRqg@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: add documentation on building w/ Clang/LLVM
To:     Kees Cook <keescook@chromium.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>, corbet@lwn.net,
        masahiroy@kernel.org, Nathan Chancellor <natechancellor@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Feb 25, 2020 at 5:08 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Mon, Feb 24, 2020 at 09:41:28AM -0800, Nick Desaulniers wrote:
> > Added to kbuild documentation. Provides more official info on building
> > kernels with Clang and LLVM than our wiki.
> >
> > Suggested-by: Kees Cook <keescook@chromium.org>
> > Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> >  Documentation/kbuild/index.rst |  1 +
> >  Documentation/kbuild/llvm.rst  | 80 ++++++++++++++++++++++++++++++++++
> >  2 files changed, 81 insertions(+)
> >  create mode 100644 Documentation/kbuild/llvm.rst
> >
> > diff --git a/Documentation/kbuild/index.rst b/Documentation/kbuild/index.rst
> > index 0f144fad99a6..3882bd5f7728 100644
> > --- a/Documentation/kbuild/index.rst
> > +++ b/Documentation/kbuild/index.rst
> > @@ -19,6 +19,7 @@ Kernel Build System
> >
> >      issues
> >      reproducible-builds
> > +    llvm
> >
> >  .. only::  subproject and html
> >
> > diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> > new file mode 100644
> > index 000000000000..68ae022aebc0
> > --- /dev/null
> > +++ b/Documentation/kbuild/llvm.rst
> > @@ -0,0 +1,80 @@
> > +==============================
> > +Building Linux with Clang/LLVM
> > +==============================
> > +
> > +This document covers how to build the Linux kernel with Clang and LLVM
> > +utilities.
> > +
> > +About
> > +-----
> > +
> > +The Linux kernel has always traditionally been compiled with GNU toolchains
> > +such as GCC and binutils. On going work has allowed for `Clang
> > +<https://clang.llvm.org/>`_ and `LLVM <https://llvm.org/>`_ utilities to be
> > +used as viable substitutes. Distributions such as `Android
> > +<https://www.android.com/>`_, `ChromeOS
> > +<https://www.chromium.org/chromium-os>`_, and `OpenMandriva
> > +<https://www.openmandriva.org/>`_ use Clang built kernels.  `LLVM is a
> > +collection of toolchain components implemented in terms of C++ objects
> > +<https://www.aosabook.org/en/llvm.html>`_. Clang is a front-end to LLVM that
> > +supports C and the GNU C extensions required by the kernel, and is pronounced
> > +"klang," not "see-lang."
> > +
> > +Clang
> > +-----
> > +
> > +The compiler used can be swapped out via `CC=` command line argument to `make`.
> > +`CC=` should be set when selecting a config and during a build.
> > +
> > +     make CC=clang defconfig
> > +
> > +     make CC=clang
> > +
> > +Cross Compiling
> > +---------------
> > +
> > +A single Clang compiler binary will typically contain all supported backends,
> > +which can help simplify cross compiling.
> > +
> > +     ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make CC=clang
> > +
> > +`CROSS_COMPILE` is not used to suffix the Clang compiler binary, instead
>
> s/suffix/prefix/
>
> > +`CROSS_COMPILE` is used to set a command line flag: `--target <triple>`. For
> > +example:
> > +
> > +     clang --target aarch64-linux-gnu foo.c
> > +
> > +LLVM Utilities
> > +--------------
> > +
> > +LLVM has substitutes for GNU binutils utilities. These can be invoked as
> > +additional parameters to `make`.
> > +
> > +     make CC=clang AS=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \\
> > +       OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump OBJSIZE=llvm-objsize \\
> > +       READELF=llvm-readelf HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar \\
> > +       HOSTLD=ld.lld
> > +
> > +Getting Help
> > +------------
> > +
> > +- `Website <https://clangbuiltlinux.github.io/>`_
> > +- `Mailing List <https://groups.google.com/forum/#!forum/clang-built-linux>`_: <clang-built-linux@googlegroups.com>
> > +- `Issue Tracker <https://github.com/ClangBuiltLinux/linux/issues>`_
> > +- IRC: #clangbuiltlinux on chat.freenode.net
> > +- `Telegram <https://t.me/ClangBuiltLinux>`_: @ClangBuiltLinux
> > +- `Wiki <https://github.com/ClangBuiltLinux/linux/wiki>`_
> > +- `Beginner Bugs <https://github.com/ClangBuiltLinux/linux/issues?q=is%3Aopen+is%3Aissue+label%3A%22good+first+issue%22>`_
> > +
> > +Getting LLVM
> > +-------------
> > +
> > +- http://releases.llvm.org/download.html
> > +- https://github.com/llvm/llvm-project
> > +- https://llvm.org/docs/GettingStarted.html
> > +- https://llvm.org/docs/CMake.html
> > +- https://apt.llvm.org/
> > +- https://www.archlinux.org/packages/extra/x86_64/llvm/
> > +- https://github.com/ClangBuiltLinux/tc-build
> > +- https://github.com/ClangBuiltLinux/linux/wiki/Building-Clang-from-source
> > +- https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/
>
> Should this also include an update to Documentation/process/changes.rst
> with the minimum version required? (I would expect this to be "9" for Clang,
> and "11" for ld.lld.)
>
> Otherwise, yes, with Randy and Masahiro's suggestions, please consider it:
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
>

Hi,

that update for documentation purposes was overdue.

My last experiments were with Linux v5.3 and llvm-toolchain 9.0 means
Clang compiler v9.0 and LLD linker v9.0 on x86-64.
With Debian's kernel-config I was able to build OOTB (out-of-the-box)
with no extra patches.
I cannot speak for higher Linux and/or llvm-toolchain versions/combinations.

I would prefer such an information also for the *supported* Linux
versions, so people have a good orientation.

So for the above scenario, you can add:

Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>.(Clang and LLD v9.0,
Linux v5.3, x86-64)

Regards,
- Sedat -




> --
> Kees Cook
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/202002242003.870E5F80%40keescook.
