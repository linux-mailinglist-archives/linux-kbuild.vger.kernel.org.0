Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DCBB16FDC1
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Feb 2020 12:31:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728255AbgBZLbt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Feb 2020 06:31:49 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:29023 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727954AbgBZLbt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Feb 2020 06:31:49 -0500
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 01QBVS9L020952;
        Wed, 26 Feb 2020 20:31:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 01QBVS9L020952
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582716689;
        bh=GDjPsWzrsBjPpbXYwVdhVCcx22MBva9/iaabNI2DfMY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VFgWW43I3nLFtzk4rxWaX8UzpfeU/fgCUgrcJJQPRjywx8t0A6yMcLoADZC/WB9dC
         DbMyNrdls3VcjjNKpNrc8YBcDnwpjAd8bxSytbCIEIwsTjJc5W4PGQz6UesIgedv1i
         CNXXNJd4rsk+ScbIuXMEM/gVbNY75/DNJnir10lMhlz/nk4rMF9IRikPHM//aRq8BF
         exHraW0bd1L8uaxVXdNwXZQNM1dfTe8Ayf6zpUnKSl4TKrpWsJLL1n8swF2FPWod48
         kBe0JFanZHz/HxnuIkX91izzXTtO2KeinHogtM2Cze2HS/zyKw2Dt65VSzmbD0ZrXH
         aBzUw3wOxiABg==
X-Nifty-SrcIP: [209.85.221.169]
Received: by mail-vk1-f169.google.com with SMTP id w67so694684vkf.1;
        Wed, 26 Feb 2020 03:31:28 -0800 (PST)
X-Gm-Message-State: APjAAAWuUrhhRuyY9gbmQwE3TuPtI5mnA/xjN5IDtkM+u6d9DB2Hgm2n
        dCOVxEB6AhNXkZV4P/15DOdfRycWNkwT+UdvS3Q=
X-Google-Smtp-Source: APXvYqwTLN0fkQHFGI4QO8kowzwxB4Wi0DpAxoGD+97b78BtWFJ5UNRU1cvEoaHtK6ivUZ0XHGPj9XqC1TqApqmB1WU=
X-Received: by 2002:a1f:6344:: with SMTP id x65mr3398079vkb.26.1582716687661;
 Wed, 26 Feb 2020 03:31:27 -0800 (PST)
MIME-Version: 1.0
References: <20200224174129.2664-1-ndesaulniers@google.com> <20200225210250.64366-1-ndesaulniers@google.com>
In-Reply-To: <20200225210250.64366-1-ndesaulniers@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 26 Feb 2020 20:30:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQJuF__26R+fEsdfYH1SAJuo3-8grGQAE4htjxzEG-nqw@mail.gmail.com>
Message-ID: <CAK7LNAQJuF__26R+fEsdfYH1SAJuo3-8grGQAE4htjxzEG-nqw@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation/llvm: add documentation on building w/ Clang/LLVM
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi.


On Wed, Feb 26, 2020 at 6:02 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Added to kbuild documentation. Provides more official info on building
> kernels with Clang and LLVM than our wiki.
>
> Suggested-by: Randy Dunlap <rdunlap@infradead.org>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> Changes V1 -> V2:
> * s/On going/ongoing/
> * add Randy's Suggested-by


I do not understand this tag update.

As far as I saw the review process,
I do not think Randy deserves to have Suggested-by
because he just pointed out a typo (on going -> ongoing) :
https://patchwork.kernel.org/patch/11401189/#23179575

(or, was there off-line activity I had missed?)


> * add Nathan and Sedat's Reviewed-by
> * Upgrade Kees' Sugguested-by to Reviewed-by

We can add both

Suggested-by: Kees Cook <keescook@chromium.org>

and

Reviewed-by: Kees Cook <keescook@chromium.org>



I think Suggested-by and Reviewed-by should be orthogonal.


Thanks.






> * s/suffix/prefix/
>
>
>  Documentation/kbuild/index.rst |  1 +
>  Documentation/kbuild/llvm.rst  | 80 ++++++++++++++++++++++++++++++++++
>  2 files changed, 81 insertions(+)
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
> --
> 2.25.0.265.gbab2e86ba0-goog
>


--
Best Regards
Masahiro Yamada
