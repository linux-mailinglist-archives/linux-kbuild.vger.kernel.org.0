Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A54951722EC
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Feb 2020 17:12:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730009AbgB0QMP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 27 Feb 2020 11:12:15 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:27262 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729703AbgB0QMP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 27 Feb 2020 11:12:15 -0500
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 01RGCADP000978;
        Fri, 28 Feb 2020 01:12:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 01RGCADP000978
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582819932;
        bh=dCIdExQy8zrf9NhMRaOGJJL9zPcIodXfI3s7oSAI5p4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=wxYIJFReNxomo24FiCsLd7MDQNSnegeTFXAKLRpKXGC5R+vv2aK/gnANaXgiqyzIZ
         9V0SLRbj99uCt6mtS38dAqm495QbctDI4FsAtyRjNaEql7f7q53pCkTv0BdUEiJ4sW
         ZRDf/Jd0Dh5ZTde+NFym86EoIAGG6axZM1HxtC9fHDRTtrkMavKGVN/24g3ApdAy3x
         hWTPHaQ//w0xD0AkxhLvHuLOSLBBIu3i2inwdRRhxW8hLntCblzURnnKDHtcV6BH4a
         /p6Q/t6pnikPEvNKurgEar1l3kg/ny2j/NUOOPkLLbVP9SClGoZg7NvOlutEYoMxCG
         VYOABtvMQvwXg==
X-Nifty-SrcIP: [209.85.217.43]
Received: by mail-vs1-f43.google.com with SMTP id m4so2168337vsa.12;
        Thu, 27 Feb 2020 08:12:11 -0800 (PST)
X-Gm-Message-State: APjAAAWjuKwuCK1sxNJXxZk60s12kjS37KBr2Azwdu3MIjyr6JOjM1JQ
        9zNVn2jI146wuT2dA1k12nlWZ9ULi6TcykiGJYk=
X-Google-Smtp-Source: APXvYqzHtClR5DvEw/exWEpLpyKt9uSNp2+MkFTTUmkcTIr4mHc+49cy/+C4LfpTHnqPQl1ib4adA7gBbtNt83b8m+w=
X-Received: by 2002:a05:6102:48b:: with SMTP id n11mr3071450vsa.181.1582819930147;
 Thu, 27 Feb 2020 08:12:10 -0800 (PST)
MIME-Version: 1.0
References: <20200225210250.64366-1-ndesaulniers@google.com> <20200226232336.252872-1-ndesaulniers@google.com>
In-Reply-To: <20200226232336.252872-1-ndesaulniers@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 28 Feb 2020 01:11:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT=O9+VMEy1j9Un9rznnb_qaxtC-C_xO1DLwiZAhCxZ0g@mail.gmail.com>
Message-ID: <CAK7LNAT=O9+VMEy1j9Un9rznnb_qaxtC-C_xO1DLwiZAhCxZ0g@mail.gmail.com>
Subject: Re: [PATCH v3] Documentation/llvm: add documentation on building w/ Clang/LLVM
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Feb 27, 2020 at 8:23 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Added to kbuild documentation. Provides more official info on building
> kernels with Clang and LLVM than our wiki.
>
> Suggested-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---

Applied to linux-kbuild.

Thanks.


> Changes V2 -> V3:
> * Drop Randy's Suggested-by tag. Sorry Randy, I do appreciate the review
>   though.
> * Add F: line to MAINTAINERS.
>
> Changes V1 -> V2:
> * s/On going/ongoing/
> * add Randy's Suggested-by
> * add Nathan and Sedat's Reviewed-by
> * Upgrade Kees' Sugguested-by to Reviewed-by
> * s/suffix/prefix/
>
>  Documentation/kbuild/index.rst |  1 +
>  Documentation/kbuild/llvm.rst  | 80 ++++++++++++++++++++++++++++++++++
>  MAINTAINERS                    |  1 +
>  3 files changed, 82 insertions(+)
>  create mode 100644 Documentation/kbuild/llvm.rst
>
> diff --git a/Documentation/kbuild/index.rst b/Documentation/kbuild/index.rst
> index 0f144fad99a6..3882bd5f7728 100644
> --- a/Documentation/kbuild/index.rst
> +++ b/Documentation/kbuild/index.rst
> @@ -19,6 +19,7 @@ Kernel Build System
>
>      issues
>      reproducible-builds
> +    llvm
>
>  .. only::  subproject and html
>
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> new file mode 100644
> index 000000000000..d6c79eb4e23e
> --- /dev/null
> +++ b/Documentation/kbuild/llvm.rst
> @@ -0,0 +1,80 @@
> +==============================
> +Building Linux with Clang/LLVM
> +==============================
> +
> +This document covers how to build the Linux kernel with Clang and LLVM
> +utilities.
> +
> +About
> +-----
> +
> +The Linux kernel has always traditionally been compiled with GNU toolchains
> +such as GCC and binutils. Ongoing work has allowed for `Clang
> +<https://clang.llvm.org/>`_ and `LLVM <https://llvm.org/>`_ utilities to be
> +used as viable substitutes. Distributions such as `Android
> +<https://www.android.com/>`_, `ChromeOS
> +<https://www.chromium.org/chromium-os>`_, and `OpenMandriva
> +<https://www.openmandriva.org/>`_ use Clang built kernels.  `LLVM is a
> +collection of toolchain components implemented in terms of C++ objects
> +<https://www.aosabook.org/en/llvm.html>`_. Clang is a front-end to LLVM that
> +supports C and the GNU C extensions required by the kernel, and is pronounced
> +"klang," not "see-lang."
> +
> +Clang
> +-----
> +
> +The compiler used can be swapped out via `CC=` command line argument to `make`.
> +`CC=` should be set when selecting a config and during a build.
> +
> +       make CC=clang defconfig
> +
> +       make CC=clang
> +
> +Cross Compiling
> +---------------
> +
> +A single Clang compiler binary will typically contain all supported backends,
> +which can help simplify cross compiling.
> +
> +       ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make CC=clang
> +
> +`CROSS_COMPILE` is not used to prefix the Clang compiler binary, instead
> +`CROSS_COMPILE` is used to set a command line flag: `--target <triple>`. For
> +example:
> +
> +       clang --target aarch64-linux-gnu foo.c
> +
> +LLVM Utilities
> +--------------
> +
> +LLVM has substitutes for GNU binutils utilities. These can be invoked as
> +additional parameters to `make`.
> +
> +       make CC=clang AS=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \\
> +         OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump OBJSIZE=llvm-objsize \\
> +         READELF=llvm-readelf HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar \\
> +         HOSTLD=ld.lld
> +
> +Getting Help
> +------------
> +
> +- `Website <https://clangbuiltlinux.github.io/>`_
> +- `Mailing List <https://groups.google.com/forum/#!forum/clang-built-linux>`_: <clang-built-linux@googlegroups.com>
> +- `Issue Tracker <https://github.com/ClangBuiltLinux/linux/issues>`_
> +- IRC: #clangbuiltlinux on chat.freenode.net
> +- `Telegram <https://t.me/ClangBuiltLinux>`_: @ClangBuiltLinux
> +- `Wiki <https://github.com/ClangBuiltLinux/linux/wiki>`_
> +- `Beginner Bugs <https://github.com/ClangBuiltLinux/linux/issues?q=is%3Aopen+is%3Aissue+label%3A%22good+first+issue%22>`_
> +
> +Getting LLVM
> +-------------
> +
> +- http://releases.llvm.org/download.html
> +- https://github.com/llvm/llvm-project
> +- https://llvm.org/docs/GettingStarted.html
> +- https://llvm.org/docs/CMake.html
> +- https://apt.llvm.org/
> +- https://www.archlinux.org/packages/extra/x86_64/llvm/
> +- https://github.com/ClangBuiltLinux/tc-build
> +- https://github.com/ClangBuiltLinux/linux/wiki/Building-Clang-from-source
> +- https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8b85f22b9b69..79e1f9bfb2b6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4124,6 +4124,7 @@ B:        https://github.com/ClangBuiltLinux/linux/issues
>  C:     irc://chat.freenode.net/clangbuiltlinux
>  S:     Supported
>  K:     \b(?i:clang|llvm)\b
> +F:     Documentation/kbuild/llvm.rst
>
>  CLEANCACHE API
>  M:     Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> --
> 2.25.0.265.gbab2e86ba0-goog
>


-- 
Best Regards
Masahiro Yamada
