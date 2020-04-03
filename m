Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFA0D19DDE4
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Apr 2020 20:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbgDCSYL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 3 Apr 2020 14:24:11 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45438 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728368AbgDCSYL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Apr 2020 14:24:11 -0400
Received: by mail-pl1-f196.google.com with SMTP id t4so3013935plq.12
        for <linux-kbuild@vger.kernel.org>; Fri, 03 Apr 2020 11:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F6nEi34wGHl5ptuJvEUUsZZ8ppzvgbFtnHK/ANYoAz4=;
        b=hSiP+tbh1HMst9CJTr4abEA9o8la3VX16GcMbJ1GhprFlwJ3asEkpsMOUMAEACpP6s
         QnesiQRf5CySslF5VEN4MiVG5d1vZzMQkMCfPCFbZ0C8lRbzr8NY6dYciX9/45/gB6Ah
         dnqNvKaze1eI4iEpUYIRLRLdfhjnfAG1dnSF90d24Eq3YCORbhhAhp7+okqa5nl3mA6Y
         Lnh35gwuyGr/99OYrJmQ4VXLoTDzL6HkI76WhWDwytrs/GzDan+XrVhCRNEAeK6Imo2H
         8v97yoerUxvCPRm/ha/NVfoI6JitZRjHkiEwlGvS27XUDO6L8I7ZCDa3fzxETlvQE2QD
         8DmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F6nEi34wGHl5ptuJvEUUsZZ8ppzvgbFtnHK/ANYoAz4=;
        b=HGAfX+CVjxIaiuR20FnvoHnN38v5Pfz5dHIFFI7IA282hRH9ZOjXkV6KHvINwUw+vq
         cZ3XpL6+z48nDEiB6GigekNnp/jtOmZKLvgaKfUzAIE51tdWodHzttyxU+HzDWaFW6tQ
         buvSWSgxxbgdTqaBLuiOxuIVSnKS2nzQHZugTiCmX1rsXFqrtBLmHes8oY10YHAVbDpH
         OFiu6i8Jr6uNybbgzcoNzPd7zcJ6wz3Ay2Pyg/Z1Vr9720yky83ui2Upz9d/z6WYGGze
         LpONHYpA2Y9FObkqoawwqqsVA2WSxx707gMBKDzRbz2qu2dXb7lHWk3S44ZVJXKALyBM
         jdBg==
X-Gm-Message-State: AGi0PuZC17EPmL64iMx7TyrQwMU11NSs58fQsyt+2ZODq6MDVaXO7BA3
        IeeEA3N0d9FKzL+FXop6MI0Unm4VYPQUYu0+nTbuEQ==
X-Google-Smtp-Source: APiQypLpRmtfIY3nrhe76N1I9CbEK0fUm3aPCBNyzCk8ft5ztwvBQBHkgBefdOI0rk/4y+wgjwgDf2weipZMz/4UC0o=
X-Received: by 2002:a17:90a:c08c:: with SMTP id o12mr11521946pjs.27.1585938249318;
 Fri, 03 Apr 2020 11:24:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200403051709.22407-1-masahiroy@kernel.org>
In-Reply-To: <20200403051709.22407-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 3 Apr 2020 11:23:57 -0700
Message-ID: <CAKwvOdnaZ6qDVxaPY-GEH8pdUkzH6eqm16ok9_wzRSVRG-1kiQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: support 'LLVM' to switch the default tools to Clang/LLVM
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Matthias_M=C3=A4nnich?= <maennich@google.com>,
        Sandeep Patil <sspatil@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 2, 2020 at 10:17 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> As Documentation/kbuild/llvm.rst implies, building the kernel with a
> full set of LLVM tools gets very verbose and unwieldy.
>
> Provide a single switch 'LLVM' to use Clang and LLVM tools instead of
> GCC and Binutils. You can pass LLVM=1 from the command line or as an
> environment variable. Then, Kbuild will use LLVM toolchains in your
> PATH environment.
>
> Please note LLVM=1 does not turn on the LLVM integrated assembler.
> You need to explicitly pass AS=clang to use it. When the upstream
> kernel is ready for the integrated assembler, I think we can make
> it default.

Having this behavior change over time may be surprising.  I'd rather
that if you want to not use the integrated assembler, you explicitly
negate it, or just don't use the LLVM=1 syntax, ie. `make CC=clang
LD=ld.lld ...`.

We could modify how `-no-integrated-as` is chosen when LLVM=1.

make LLVM=1 LLVMIA=0 ... # add `-no-integrated-as`
# what the flag is doesn't really matter to me, something shorter might be nice.
make LLVM=1 # use all LLVM tools

Since we got rid of $(AS), it would be appropriate to remove/change it
there, since no one really relies on AS=clang right now. (We do have 1
of our 60+ CI targets using it, but we can also change that trivially.
So I think we have a lot of freedom to change how `-no-integrated-as`
is set.

This could even be independent of this patch.

>
> We discussed what we need, and we agreed to go with a simple boolean
> switch (https://lkml.org/lkml/2020/3/28/494).
>
> Some items in the discussion:
>
> - LLVM_DIR
>
>   When multiple versions of LLVM are installed, I just thought supporting
>   LLVM_DIR=/path/to/my/llvm/bin/ might be useful.
>
>   CC      = $(LLVM_DIR)clang
>   LD      = $(LLVM_DIR)ld.lld
>     ...
>
>   However, we can handle this by modifying PATH. So, we decided to not do
>   this.
>
> - LLVM_SUFFIX
>
>   Some distributions (e.g. Debian) package specific versions of LLVM with
>   naming conventions that use the version as a suffix.
>
>   CC      = clang$(LLVM_SUFFIX)
>   LD      = ld.lld(LLVM_SUFFIX)
>     ...
>
>   will allow a user to pass LLVM_SUFFIX=-11 to use clang-11 etc.,
>   but the suffixed versions in /usr/bin/ are symlinks to binaries in
>   /usr/lib/llvm-#/bin/, so this can also be handled by PATH.
>
> - HOSTCC, HOSTCXX, etc.
>
>   We can switch the host compilers in the same way:
>
>   ifneq ($(LLVM),)
>   HOSTCC       = clang
>   HOSTCXX      = clang++
>   else
>   HOSTCC       = gcc
>   HOSTCXX      = g++
>   endif
>
>   This may the right thing to do, but I could not make up my mind.
>   Because we do not frequently switch the host compiler, a counter
>   solution I had in my mind was to leave it to the default of the
>   system.
>
>   HOSTCC       = cc
>   HOSTCXX      = c++
>
>   Many distributions support update-alternatives to switch the default
>   to GCC, Clang, or whatever, but reviewers were opposed to this
>   approach. So, this commit does not touch the host tools.

update-alternatives assumes you've installed Clang via a package manager?
$ update-alternatives --list cc
/usr/bin/gcc
On my system even though clang and friends are in my PATH.

And previously, there was feedback that maybe folks don't want to
change `cc` on their systems just for Clang kernel builds.
https://lkml.org/lkml/2020/3/30/836
https://lkml.org/lkml/2020/3/30/838

A goal for ClangBuiltLinux is to build a kernel image with no GCC or
binutils installed on the host.  Let the record reflect that.  And
there's been multiple complaints that the existing syntax is too long
for specifying all of the tools.

LLVM=1 is meant to be one flag.  Not `make LLVM=1 HOSTCC=clang
HOSTCXX=clang`.  If folks want fine grain flexibility, use the
existing command line interface, which this patch does not change.
LLVM=1 is opinionated, and inflexible, because it makes a strong
choice to enable LLVM for everything.

Another reason why I don't want to change these over time, and why I
want them all to be in sync is that there are 4 different CI systems
for the kernel, and they are currently fragmented in terms of who is
using what tools:

KernelCI: CC=clang only
Kbuild test robot aka 0day bot: CC=clang LD=ld.lld
Linaro TCWG: CC=clang only
our CI: a complete mix due to combinatorial explosion, but more
coverage of LLVM than everyone else.

That is a mess that we must solve.  Having 1 flag that works
consistently across systems is one solution.  Now if those were all
using LLVM=1, but some were enabling Clang's integrated assembler, and
some weren't because we changed the default over time, then we'd be
right back to this mismatch between systems.  I'd much rather draw the
line in the sand, and say "this is how this flag will work, since day
1."  Maybe it's too rigid, but it's important to me that if we create
something new to solve multiple objectives (1. simplifies existing
interface. 2. turns on everything.) that it does so.  It is a partial
solution, if it eliminates some of the flags while leaving others. I
want a full solution.

If folks want the flexibility to mix and match tools, the existing
interface is capable.  But for us to track who is using what, we need
1 flag that we know is not different depending on the cc of the
system.  Once clang's integrated assembler is good to go, we will
begin recommending LLVM=1 to everyone.  And we want feedback if we
regress building the host utilities during a kernel build, even if
there are not many.

I'm on the fence about having all of the above satisfied by one patch,
or taking this patch as is and following up on the above two points
(related to disabling `-no-integrated-as` and setting HOSTCC).  I
trust your judgement and respect your decisions, so I'll defer to you
Masahiro, but I need to make explicit the design goals.  Maybe with
this additional context it can help inform the design.
Tested-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  Documentation/kbuild/kbuild.rst |  5 +++++
>  Documentation/kbuild/llvm.rst   |  5 +++++
>  Makefile                        | 20 ++++++++++++++++----
>  3 files changed, 26 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
> index 510f38d7e78a..2d1fc03d346e 100644
> --- a/Documentation/kbuild/kbuild.rst
> +++ b/Documentation/kbuild/kbuild.rst
> @@ -262,3 +262,8 @@ KBUILD_BUILD_USER, KBUILD_BUILD_HOST
>  These two variables allow to override the user@host string displayed during
>  boot and in /proc/version. The default value is the output of the commands
>  whoami and host, respectively.
> +
> +LLVM
> +----
> +If this variable is set to 1, Kbuild will use Clang and LLVM utilities instead
> +of GCC and GNU binutils to build the kernel.
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> index d6c79eb4e23e..4602369f6a4f 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -55,6 +55,11 @@ additional parameters to `make`.
>           READELF=llvm-readelf HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar \\
>           HOSTLD=ld.lld
>
> +You can use a single switch `LLVM=1` to use LLVM utilities by default (except
> +for building host programs).
> +
> +       make LLVM=1 HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar HOSTLD=ld.lld
> +

I would like this to be the preferred method of building to LLVM, so
it should go first, followed by a footnote that says something along
the lines of "if you need something more flexible, the tools can be
specified in a more fine grain manner via the traditional syntax
below:"

>  Getting Help
>  ------------
>
> diff --git a/Makefile b/Makefile
> index c91342953d9e..6db89ecdd942 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -409,16 +409,28 @@ KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
>  KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS) $(HOSTLDLIBS)
>
>  # Make variables (CC, etc...)
> -LD             = $(CROSS_COMPILE)ld
> -CC             = $(CROSS_COMPILE)gcc
>  CPP            = $(CC) -E
> +ifneq ($(LLVM),)
> +CC             = clang
> +LD             = ld.lld
> +AR             = llvm-ar
> +NM             = llvm-nm
> +OBJCOPY                = llvm-objcopy
> +OBJDUMP                = llvm-objdump
> +READELF                = llvm-readelf
> +OBJSIZE                = llvm-size
> +STRIP          = llvm-strip
> +else
> +CC             = $(CROSS_COMPILE)gcc
> +LD             = $(CROSS_COMPILE)ld
>  AR             = $(CROSS_COMPILE)ar
>  NM             = $(CROSS_COMPILE)nm
> -STRIP          = $(CROSS_COMPILE)strip
>  OBJCOPY                = $(CROSS_COMPILE)objcopy
>  OBJDUMP                = $(CROSS_COMPILE)objdump
> -OBJSIZE                = $(CROSS_COMPILE)size
>  READELF                = $(CROSS_COMPILE)readelf
> +OBJSIZE                = $(CROSS_COMPILE)size
> +STRIP          = $(CROSS_COMPILE)strip
> +endif
>  PAHOLE         = pahole
>  LEX            = flex
>  YACC           = bison
> --
> 2.17.1
>


-- 
Thanks,
~Nick Desaulniers
