Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E1A416B861
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Feb 2020 05:08:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728725AbgBYEI3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 24 Feb 2020 23:08:29 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45050 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728776AbgBYEI3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Feb 2020 23:08:29 -0500
Received: by mail-pg1-f196.google.com with SMTP id a14so5826001pgb.11
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Feb 2020 20:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hsmwTWPSD0szPQ7rhutWKLwR4ldbSWtt8mN+lR7f3aU=;
        b=MXlDVQn4uxGfZrKHYHdu9vVDcDBZL3lMcLcfkDncLFD0zglrIbydVAGMBV8Agofb0n
         zkD60KvQ1pCfz2obp+2lXF8jOXuSGqU5dzcfEw46uZTOuXz4r7clGnU0mWjfozvjJ1O6
         IpVneKjih9wEx7/pBxWAh0Ykd2vjNwYiRAEEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hsmwTWPSD0szPQ7rhutWKLwR4ldbSWtt8mN+lR7f3aU=;
        b=U5V73nIManvWMp6k3yj01htIrxEJh1r3gMUBp1NyOWGqPTRmIoPi0RZIgtzgoiClUG
         tVKaMLj1+9xvtGDtI9ZzxoeFXQE4zYEmLgFKis691dMitDzwkOCEH8Kk+DlwHMTwSpph
         25lXrlmW6Vs+Owri8j03xsl1R6aMjg47jhIFQTs9xnXBxPFWMVItN6wzPJZgJP2XNggu
         uY8PGYjri5EyYMo6OqBLUllZlky1C3iueGsKoglwR532n8e13hIgVDf1lsMX6VBj6OF1
         xC1HtQPXKpZz2oqibJyc60GAxBLHJQwsqH8bV3EZrkUMtYWbGJAJv40kTxOhLkRdKOCF
         3+Sw==
X-Gm-Message-State: APjAAAVRjdbSkokRmj2KcxBWadCYfMIbYoE48HZQfl84FPtQ6DEpJl/l
        eVHwBmG20hMjpNJfbY+7pxy6gw==
X-Google-Smtp-Source: APXvYqzLSh4qBx7e3y9T7+6B1WtB3BYgqC7e04hpV+b/CjGdlLicTi1+yUxV41DvXvzlMP3W7wKwaA==
X-Received: by 2002:a63:b515:: with SMTP id y21mr9533512pge.148.1582603708389;
        Mon, 24 Feb 2020 20:08:28 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z27sm14758726pfj.107.2020.02.24.20.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 20:08:27 -0800 (PST)
Date:   Mon, 24 Feb 2020 20:08:26 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     corbet@lwn.net, masahiroy@kernel.org,
        Nathan Chancellor <natechancellor@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH] Documentation/llvm: add documentation on building w/
 Clang/LLVM
Message-ID: <202002242003.870E5F80@keescook>
References: <20200224174129.2664-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200224174129.2664-1-ndesaulniers@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Feb 24, 2020 at 09:41:28AM -0800, Nick Desaulniers wrote:
> Added to kbuild documentation. Provides more official info on building
> kernels with Clang and LLVM than our wiki.
> 
> Suggested-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
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
> index 000000000000..68ae022aebc0
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
> +such as GCC and binutils. On going work has allowed for `Clang
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
> +	make CC=clang defconfig
> +
> +	make CC=clang
> +
> +Cross Compiling
> +---------------
> +
> +A single Clang compiler binary will typically contain all supported backends,
> +which can help simplify cross compiling.
> +
> +	ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make CC=clang
> +
> +`CROSS_COMPILE` is not used to suffix the Clang compiler binary, instead

s/suffix/prefix/

> +`CROSS_COMPILE` is used to set a command line flag: `--target <triple>`. For
> +example:
> +
> +	clang --target aarch64-linux-gnu foo.c
> +
> +LLVM Utilities
> +--------------
> +
> +LLVM has substitutes for GNU binutils utilities. These can be invoked as
> +additional parameters to `make`.
> +
> +	make CC=clang AS=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \\
> +	  OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump OBJSIZE=llvm-objsize \\
> +	  READELF=llvm-readelf HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar \\
> +	  HOSTLD=ld.lld
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

Should this also include an update to Documentation/process/changes.rst
with the minimum version required? (I would expect this to be "9" for Clang,
and "11" for ld.lld.)

Otherwise, yes, with Randy and Masahiro's suggestions, please consider it:

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
