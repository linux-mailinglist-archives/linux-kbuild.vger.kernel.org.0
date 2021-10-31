Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5626D440C6E
	for <lists+linux-kbuild@lfdr.de>; Sun, 31 Oct 2021 02:18:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbhJaBVM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 30 Oct 2021 21:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbhJaBVL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 30 Oct 2021 21:21:11 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3D29C061570;
        Sat, 30 Oct 2021 18:18:39 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id x9so7102097ilu.6;
        Sat, 30 Oct 2021 18:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=oK8a2eneqG05SAm4dNNVc7lohBN5iM23v9Y1nFVy3c8=;
        b=f05txF58PVmMdvdoGlBbof++ZsKFJHoomqhQ1x+xlYiTctZHu03kIogY1oQG4IdA92
         t+hafsOkriYc4zohHwdWKsQojzL3xKG5pS1CpA+gDT2QtYVeJkXGTE4LCOBvtTcnf5QI
         yMeJa4JzMGV6cqAqxO0+v76ZBu4/0fGQFbNsuZLN0+yQKKxbsJhyWkD933+0LHNAN3go
         jBKc5tIfW6wb4u3LoCrgu5JJYGvJRvRpUakwsdgTcDXmdD59pXkHj/BO6gJQM3QHsxdN
         QjWvDygaiEcFA7pi6K/O7RUe5qxW/RZDm3uxTTTen89p3CApjsVWb8pylzSfWZy8BRCu
         FNRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=oK8a2eneqG05SAm4dNNVc7lohBN5iM23v9Y1nFVy3c8=;
        b=GOGMV7FTMV2bFgq33258m5VuHeWmYGp+yrRIcdHxUWM7DLLQQ1qnzM+l/dAABsgp3F
         XXuNAfbcNiS1cOy5kUEgLs6Qy+niR7TN23fkiwL1H5imp3eyz+qoh15ndKnw/KwJwlu3
         OO2IoPTjPYc3oVHcuPDhM3VkvEVLaK4mI2u5eYB0aRgX/T2CWaLje0lUctVqWGvSWaAo
         ycSsloWLpzllLmbjHCZ3zbZh7Be3lSrjlIF+7i3wFwEPFLxCaZCWt9zlxkHryh7Tkugd
         8bC98Iks+dd7mJ9CmPmusCgOlGgbfmgg2sEzK9Htj8gOoZnUjz6EJEPGFdyIAuMpEpXA
         uBEQ==
X-Gm-Message-State: AOAM533Ll41PWz0TsWepiujs/sgrSRJZ6CmG9RaHJF9OImx9lkY81f7d
        3bFyD5W7ftsqgZwdnCOyDbvOesGhV1U5oBHUf7w=
X-Google-Smtp-Source: ABdhPJwoL+vAAhyAQIJnbJfWIH++yhfFDhlskj/x/PrM4VnTj8FDFumstC6A9QTDxlQgmgPAgqAE8L22OvkB7b71Bz4=
X-Received: by 2002:a05:6e02:1b01:: with SMTP id i1mr13999241ilv.157.1635643119053;
 Sat, 30 Oct 2021 18:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <YXqpFHeY26sEbort@hirez.programming.kicks-ass.net>
 <CAK7LNATUpgfKJvjp0+8H6VfMLMio9+BCoyj00mAO8FcaVGCqjg@mail.gmail.com>
 <YXqwZq53WUiTeqI7@hirez.programming.kicks-ass.net> <YXqyHhWGJfDkuxjP@hirez.programming.kicks-ass.net>
 <YXq72/yPe76DhDLu@hirez.programming.kicks-ass.net> <YXrhZoOgv5dtFMTs@archlinux-ax161>
 <20211028204855.GP174703@worktop.programming.kicks-ass.net>
 <CAKwvOd=x9E=7WcCiieso-CDiiU-wMFcXL4W3V5j8dq7BL5QT+w@mail.gmail.com>
 <YXu2z6FQ6Z7qtjbk@hirez.programming.kicks-ass.net> <20211030143311.GH174730@worktop.programming.kicks-ass.net>
In-Reply-To: <20211030143311.GH174730@worktop.programming.kicks-ass.net>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Sun, 31 Oct 2021 02:18:01 +0100
Message-ID: <CA+icZUUU53OwtCDC-4FPfcCenYQeZo7b8b=wszbvrHSYBqbYOA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Support clang-$ver builds
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        X86 ML <x86@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        llvm@lists.linux.dev
Content-Type: multipart/mixed; boundary="000000000000174bce05cf9bd72e"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--000000000000174bce05cf9bd72e
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 30, 2021 at 4:34 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
>
> Latestest greatness... :-)
>
> ---
> Subject: kbuild: Fix clang/llvm build infra
>
> Debian (and derived) distros ship their compilers as -$ver suffixed
> binaries. For gcc it is sufficent to use:
>
>  $ make CC=gcc-12
>
> However, clang builds (esp. clang-lto) need a whole array of tools to be
> exactly right, leading to unweildy stuff like:
>
>  $ make CC=clang-13 LD=ld.lld=14 AR=llvm-ar-13 NM=llvm-nm-13 OBJCOPY=llvm-objcopy-13 OBJDUMP=llvm-objdump-13 READELF=llvm-readelf-13 STRIP=llvm-strip-13 LLVM=1
>
> which is, quite franktly, totally insane and unusable. Instead make
> the CC variable DTRT, enabling one such as myself to use:
>
>  $ make CC=clang-13
>
> This also lets one quickly test different clang versions.
> Additionally, also support path based LLVM suites like:
>
>  $ make CC=/opt/llvm/bin/clang
>

Hi Peter,

Thanks for bringing this up again.

Your issue is not new for Debianist and Linux-LLVM/Clang folks.

But let me comment.

I agree, it is preferable or should be treated the same way in using
clang-$ver like gcc-$ver.

Background:
Debian uses as meta-package llvm-toolchain-$ver and splits stuff into
different Debian packages like the Clang compiler. LLD linker and LLVM
(bin)utils.
These packages place their files in separate directories to
distinguish llvm-toolchain-$ver.
Binaries like clang-$ver, ld.lld-$ver, llvm-strip-$ver, etc. you find
in the /usr/bin/ directory which are symlinks.
Clang compiler is shipped with clang-$ver Debian package.
LLD linker is shipped as a separate Debian package called lld-$ver.
LLVM (bin)utils like llvm-strip-$ver are shipped with the llvm-$ver
Debian package.

Link: https://www.kernel.org/doc/html/latest/kbuild/llvm.html#llvm-utilities

EXAMPLES (here: llvm-toolchain-13):

$ dpkg -S $(which clang-13)
clang-13: /usr/bin/clang-13

$ dpkg -S /usr/bin/ld.lld-13
lld-13: /usr/bin/ld.lld-13

$ dpkg -S /usr/bin/llvm-strip-13
llvm-13: /usr/bin/llvm-strip-13

$ LC_ALL=C ll /usr/bin/clang-13
lrwxrwxrwx 1 root root 24 Oct 23 10:33 /usr/bin/clang-13 ->
../lib/llvm-13/bin/clang

$ LC_ALL=C ll /usr/bin/ld.lld-13
lrwxrwxrwx 1 root root 25 Oct 23 10:33 /usr/bin/ld.lld-13 ->
../lib/llvm-13/bin/ld.lld

$ LC_ALL=C ll /usr/bin/llvm-strip-13
lrwxrwxrwx 1 root root 29 Oct 23 10:33 /usr/bin/llvm-strip-13 ->
../lib/llvm-13/bin/llvm-strip

As a compromise I use in my build_linux-llvm-toolchain.sh script
$LLVM_TOOLCHAIN_PATH:
...
### GCC and LLVM version settings
##GCC_MAJOR_VER="10"
LLVM_MAJOR_VER="13"

### LLVM toolchain path options
# Explicitly set PATH to simplify `make LLVM=1` handling (see "LLVM
tools options")
# Option-1: Use system's LLVM toolchain
# Option-2: Use selfmade LLVM toolchain (here: ThinLTO+PGO optimized
via tc-build)
# Option-3: Set custom PATH in ~/.bashrc
##LLVM_TOOLCHAIN_PATH="/usr/lib/llvm-${LLVM_MAJOR_VER}/bin"
LLVM_TOOLCHAIN_PATH="/opt/llvm-toolchain/bin"
if [ -d ${LLVM_TOOLCHAIN_PATH} ]; then
   export PATH="${LLVM_TOOLCHAIN_PATH}:${PATH}"
fi
...

But...

...for several new features like Clang-LTO we need the LLVM full "eco system".
LLVM eco system means compiler, linker and binutils.
In several talks at LPC 2021 talkers used the term "LLVM/binutils"
like for GNU/binutils.
The LLVM/Clang kernel-docs talk about "LLVM util(itie)s" which is set
by LLVM=1 or not (LLVM=0).

Link: https://www.kernel.org/doc/html/latest/kbuild/llvm.html#llvm-utilities

AFAICS your patch has a primary focus to fix the LLVM/Clang
infrastructure when CONFIG_LTO_CLANG=y, right?
Can you massage the commit message to reflect this?

IMHO your patch can be improved to check for CONFIG_LTO_CLANG=y where
LLVM=1 is mandatory and IIRC LLVM_IAS=1, too.
( The default to use LLVM/Clang-IAS (Integrated ASsembler) was changed
recently for some combinations arches + Clang-LTO? )

Before I forgot:
Can you add a comment for the PPC and S390 situation in the commit message.

Please remember people also want to use combinations like gcc-$ver and
LLVM/binutils like ld.lld-$ver.
GCC-10 + LLD-$VER was the fastest combination to build a Linux Debian
package here on my Intel SandyBridge CPU system.
( There exists overrides like LD=... STRIP=... and I use
XXX_FOR_BUILD=... (see my attached build-script). )

Thanks.

Regards,
- Sedat -

> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  Makefile                       |   45 +++++++++++++++++++++++++++---------
>  tools/scripts/Makefile.include |   50 ++++++++++++++++++++++++++++-------------
>  2 files changed, 68 insertions(+), 27 deletions(-)
>
> --- a/Makefile
> +++ b/Makefile
> @@ -423,9 +423,29 @@ HOST_LFS_CFLAGS := $(shell getconf LFS_C
>  HOST_LFS_LDFLAGS := $(shell getconf LFS_LDFLAGS 2>/dev/null)
>  HOST_LFS_LIBS := $(shell getconf LFS_LIBS 2>/dev/null)
>
> -ifneq ($(LLVM),)
> -HOSTCC = clang
> -HOSTCXX        = clang++
> +# powerpc and s390 don't yet work with LLVM as a whole
> +ifeq ($(ARCH),powerpc)
> +LLVM = 0
> +endif
> +ifeq ($(ARCH),s390)
> +LLVM = 0
> +endif
> +
> +# otherwise, if CC=clang, default to using LLVM to enable LTO
> +CC_BASE := $(shell echo $(CC) | sed 's/.*\///')
> +CC_NAME := $(shell echo $(CC_BASE) | cut -b "1-5")
> +ifeq ($(shell test "$(CC_NAME)" = "clang"; echo $$?),0)
> +LLVM ?= 1
> +LLVM_PFX := $(shell echo $(CC) | sed 's/\(.*\/\)\?.*/\1/')
> +LLVM_SFX := $(shell echo $(CC_BASE) | cut -b "6-")
> +endif
> +
> +# if not set by now, do not use LLVM
> +LLVM ?= 0
> +
> +ifneq ($(LLVM),0)
> +HOSTCC = $(LLVM_PFX)clang$(LLVM_SFX)
> +HOSTCXX        = $(LLVM_PFX)clang++$(LLVM_SFX)
>  else
>  HOSTCC = gcc
>  HOSTCXX        = g++
> @@ -442,15 +462,15 @@ KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS)
>
>  # Make variables (CC, etc...)
>  CPP            = $(CC) -E
> -ifneq ($(LLVM),)
> -CC             = clang
> -LD             = ld.lld
> -AR             = llvm-ar
> -NM             = llvm-nm
> -OBJCOPY                = llvm-objcopy
> -OBJDUMP                = llvm-objdump
> -READELF                = llvm-readelf
> -STRIP          = llvm-strip
> +ifneq ($(LLVM),0)
> +CC             = $(LLVM_PFX)clang$(LLVM_SFX)
> +LD             = $(LLVM_PFX)ld.lld$(LLVM_SFX)
> +AR             = $(LLVM_PFX)llvm-ar$(LLVM_SFX)
> +NM             = $(LLVM_PFX)llvm-nm$(LLVM_SFX)
> +OBJCOPY                = $(LLVM_PFX)llvm-objcopy$(LLVM_SFX)
> +OBJDUMP                = $(LLVM_PFX)llvm-objdump$(LLVM_SFX)
> +READELF                = $(LLVM_PFX)llvm-readelf$(LLVM_SFX)
> +STRIP          = $(LLVM_PFX)llvm-strip$(LLVM_SFX)
>  else
>  CC             = $(CROSS_COMPILE)gcc
>  LD             = $(CROSS_COMPILE)ld
> @@ -461,6 +481,7 @@ OBJDUMP             = $(CROSS_COMPILE)objdump
>  READELF                = $(CROSS_COMPILE)readelf
>  STRIP          = $(CROSS_COMPILE)strip
>  endif
> +
>  PAHOLE         = pahole
>  RESOLVE_BTFIDS = $(objtree)/tools/bpf/resolve_btfids/resolve_btfids
>  LEX            = flex
> --- a/tools/scripts/Makefile.include
> +++ b/tools/scripts/Makefile.include
> @@ -51,12 +51,32 @@ define allow-override
>      $(eval $(1) = $(2)))
>  endef
>
> -ifneq ($(LLVM),)
> -$(call allow-override,CC,clang)
> -$(call allow-override,AR,llvm-ar)
> -$(call allow-override,LD,ld.lld)
> -$(call allow-override,CXX,clang++)
> -$(call allow-override,STRIP,llvm-strip)
> +# powerpc and s390 don't yet work with LLVM as a whole
> +ifeq ($(ARCH),powerpc)
> +LLVM = 0
> +endif
> +ifeq ($(ARCH),s390)
> +LLVM = 0
> +endif
> +
> +# otherwise, if CC=clang, default to using LLVM to enable LTO
> +CC_BASE := $(shell echo $(CC) | sed 's/.*\///')
> +CC_NAME := $(shell echo $(CC_BASE) | cut -b "1-5")
> +ifeq ($(shell test "$(CC_NAME)" = "clang"; echo $$?),0)
> +LLVM ?= 1
> +LLVM_PFX := $(shell echo $(CC) | sed 's/\(.*\/\)\?.*/\1/')
> +LLVM_SFX := $(shell echo $(CC_BASE) | cut -b "6-")
> +endif
> +
> +# if not set by now, do not use LLVM
> +LLVM ?= 0
> +
> +ifneq ($(LLVM),0)
> +$(call allow-override,CC,$(LLVM_PFX)clang$(LLVM_SFX))
> +$(call allow-override,AR,$(LLVM_PFX)llvm-ar$(LLVM_SFX))
> +$(call allow-override,LD,$(LLVM_PFX)ld.lld$(LLVM_SFX))
> +$(call allow-override,CXX,$(LLVM_PFX)clang++$(LLVM_SFX))
> +$(call allow-override,STRIP,$(LLVM_PFX)llvm-strip$(LLVM_SFX))
>  else
>  # Allow setting various cross-compile vars or setting CROSS_COMPILE as a prefix.
>  $(call allow-override,CC,$(CROSS_COMPILE)gcc)
> @@ -68,10 +88,10 @@ endif
>
>  CC_NO_CLANG := $(shell $(CC) -dM -E -x c /dev/null | grep -Fq "__clang__"; echo $$?)
>
> -ifneq ($(LLVM),)
> -HOSTAR  ?= llvm-ar
> -HOSTCC  ?= clang
> -HOSTLD  ?= ld.lld
> +ifneq ($(LLVM),0)
> +HOSTAR  ?= $(LLVM_PFX)llvm-ar$(LLVM_SFX)
> +HOSTCC  ?= $(LLVM_PFX)clang$(LLVM_SFX)
> +HOSTLD  ?= $(LLVM_PFX)ld.lld$(LLVM_SFX)
>  else
>  HOSTAR  ?= ar
>  HOSTCC  ?= gcc
> @@ -79,11 +99,11 @@ HOSTLD  ?= ld
>  endif
>
>  # Some tools require Clang, LLC and/or LLVM utils
> -CLANG          ?= clang
> -LLC            ?= llc
> -LLVM_CONFIG    ?= llvm-config
> -LLVM_OBJCOPY   ?= llvm-objcopy
> -LLVM_STRIP     ?= llvm-strip
> +CLANG          ?= $(LLVM_PFX)clang$(LLVM_SFX)
> +LLC            ?= $(LLVM_PFX)llc$(LLVM_SFX)
> +LLVM_CONFIG    ?= $(LLVM_PFX)llvm-config$(LLVM_SFX)
> +LLVM_OBJCOPY   ?= $(LLVM_PFX)llvm-objcopy$(LLVM_SFX)
> +LLVM_STRIP     ?= $(LLVM_PFX)llvm-strip$(LLVM_SFX)
>
>  ifeq ($(CC_NO_CLANG), 1)
>  EXTRA_WARNINGS += -Wstrict-aliasing=3

--000000000000174bce05cf9bd72e
Content-Type: application/x-shellscript; 
	name="build_linux-llvm-toolchain.sh"
Content-Disposition: attachment; filename="build_linux-llvm-toolchain.sh"
Content-Transfer-Encoding: base64
Content-ID: <f_kvejd0mk0>
X-Attachment-Id: f_kvejd0mk0

IyEvYmluL3NoCgojIyMgQ09QWUxFRlQKIyBBdXRob3I6IFNlZGF0IERpbGVrIDxzZWRhdC5kaWxl
a0BnbWFpbC5jb20+CiMgTGFzdCBjaGFuZ2VkOiAyNy1PY3QtMjAyMQoKIyMjIEhFTFAKIyAxLiBV
c2FnZSBvZiAibWFrZSBiaW5kZWItcGtnIgojIEZpbGU6IHNjcmlwdHMvcGFja2FnZS9idWlsZGRl
YgojIDIuIEN1c3RvbSBsb2NhbHZlcnNpb24gaGFuZGxpbmcKIyBGaWxlOiBzY3JpcHRzL3NldGxv
Y2FsdmVyc2lvbgojIDMuIEF2YWlsYWJsZSBLQlVJTERfVVNFUl8qIHZhcmlhYmxlcwojIEZpbGU6
IHNjcmlwdHMvbWtjb21waWxlX2gKIyA0LiBQcmVyZXFzIGFuZCBwcmVwYXJhdGlvbiAoc2VlIERl
YmFpbiBrZXJuZWwgaGFuZGJvb2spCiMgTGluazogaHR0cHM6Ly93d3cuZGViaWFuLm9yZy9kb2Mv
bWFudWFscy9kZWJpYW4ta2VybmVsLWhhbmRib29rL2NoLWNvbW1vbi10YXNrcy5odG1sI3M0LjIu
MT4KCiMjIyBQUkVSRVFTOiBJbnN0YWxsIGJ1aWxkLWVzc2VudGlhbCwgZmFrZXJvb3QsIGRwa2ct
ZGV2IGFuZCBnaXQgcGFja2FnZXMKIyNhcHQtZ2V0IHVwZGF0ZQojI2FwdC1nZXQgaW5zdGFsbCBi
dWlsZC1lc3NlbnRpYWwgZmFrZXJvb3QgZHBrZy1kZXYgZ2l0CiMgWFhYOiBJbnN0YWxsIExMVk0g
dG9vbGNoYWluIHZlcnNpb24gMTIgKGhlcmU6IHBhY2thZ2VzIGZyb20gPGFwdC5sbHZtLm9yZz4p
CiMjYXB0LWdldCBpbnN0YWxsIGxsdm0tMTIgY2xhbmctMTIgbGxkLTEyIGxsdm0tMTItdG9vbHMg
LS1uby1pbnN0YWxsLXJlY29tbWVuZHMgLXQgbGx2bS10b29sY2hhaW4tMTIgLXkKCiMjIyBMYW5n
dWFnZSBvcHRpb25zCmV4cG9ydCBMQU5HPUMKZXhwb3J0IExDX0FMTD1DCgojIyMgQmFzZSBkaXJl
Y3RvcnkKQkFTRV9ESVI9JChwd2QpCgojIyMgQ2xvbmUgTGludXggKG1haW5saW5lKSByZW1vdGUg
R2l0IHJlcG9zaXRvcnkKIyNjZCAkQkFTRV9ESVIKIyNHSVRfTUlSUk9SPSJnaXQ6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0IgojI2dp
dCBjbG9uZSAke0dJVF9NSVJST1J9IGdpdAoKIyBMaW51eCBsb2NhbCBHaXQgcmVwb3NpdG9yeQpT
UkNfRElSPSIke0JBU0VfRElSfS9naXQiCgojIyMgR0NDIGFuZCBMTFZNIHZlcnNpb24gc2V0dGlu
Z3MKR0NDX01BSk9SX1ZFUj0iMTAiCkxMVk1fTUFKT1JfVkVSPSIxMyIKCiMjIyBMTFZNIHRvb2xj
aGFpbiBwYXRoIG9wdGlvbnMKIyBFeHBsaWNpdGx5IHNldCBQQVRIIHRvIHNpbXBsaWZ5IGBtYWtl
IExMVk09MWAgaGFuZGxpbmcgKHNlZSAiTExWTSB0b29scyBvcHRpb25zIikKIyBPcHRpb24tMTog
VXNlIHN5c3RlbSdzIExMVk0gdG9vbGNoYWluCiMgT3B0aW9uLTI6IFVzZSBzZWxmbWFkZSBMTFZN
IHRvb2xjaGFpbiAoaGVyZTogVGhpbkxUTytQR08gb3B0aW1pemVkIHZpYSB0Yy1idWlsZCkKIyBP
cHRpb24tMzogU2V0IGN1c3RvbSBQQVRIIGluIH4vLmJhc2hyYwojI0xMVk1fVE9PTENIQUlOX1BB
VEg9Ii91c3IvbGliL2xsdm0tJHtMTFZNX01BSk9SX1ZFUn0vYmluIgpMTFZNX1RPT0xDSEFJTl9Q
QVRIPSIvb3B0L2xsdm0tdG9vbGNoYWluL2JpbiIKaWYgWyAtZCAke0xMVk1fVE9PTENIQUlOX1BB
VEh9IF07IHRoZW4KICAgZXhwb3J0IFBBVEg9IiR7TExWTV9UT09MQ0hBSU5fUEFUSH06JHtQQVRI
fSIKZmkKCiMjIyBHTlUgYmludXRpbHMgcGF0aCBvcHRpb25zCiMgMjAyMS0wMi0wNDogU2VsZm1h
ZGUgYmludXRpbHMgdjIuMzUuMiAoc2hpcHMgc29tZSBEV0FSRi12NSBmaXhlcykKIyAyMDIxLTAy
LTA0OgojIFhYWDogRG8gTk9UIHVzZSAvZXRjL2xkLnNvLmNvbmYuZC9hLWxvY2FsLWJpbnV0aWxz
LmNvbmYKIyNCSU5VVElMU19CSU5fUEFUSD0iL29wdC9iaW51dGlscy9iaW4iCiMjQklOVVRJTFNf
TElCX1BBVEg9Ii9vcHQvYmludXRpbHMvbGliIgojI2lmIFsgLWQgJHtCSU5VVElMU19CSU5fUEFU
SH0gXSAmJiBbIC1kICR7QklOVVRJTFNfTElCX1BBVEh9IF07IHRoZW4KIyMgICBleHBvcnQgUEFU
SD0iJHtCSU5VVElMU19CSU5fUEFUSH06JHtQQVRIfSIKIyMgICBleHBvcnQgTERfTElCUkFSWV9Q
QVRIPSIke0xEX0xJQlJBUllfUEFUSH06JHtCSU5VVElMU19MSUJfUEFUSH0iCiMjZmkKQklOVVRJ
TFNfQklOX1BBVEg9IiIKQklOVVRJTFNfTElCX1BBVEg9IiIKCiMjIyBjY2FjaGUgb3B0aW9ucwoj
IE5PVEU6IERvIE5PVCB1c2UgY2NhY2hlIHRvIHJlZHVjZSBidWlsZC10aW1lIChoZXJlOiBhcHBy
b3guIDAxOjAwIFtoaDptbV0pCiMgU1BFRURVUDogRm9yIGZhc3RlciBidWlsZHMgYW5kIHJlYnVp
bGRzIHVzZSBTQU5ESVNLIGlTU0Qgd2l0aCAxNkdCCiMgRG8gTk9UIG1lc3Mgd2l0aCB0aGUgZGVm
YXVsdCBjY2FjaGUgKGRlZmF1bHQ6ICRIT01FLy5jY2FjaGUpCiMgTGluazogaHR0cHM6Ly9uaWNr
ZGVzYXVsbmllcnMuZ2l0aHViLmlvL2Jsb2cvMjAxOC8wNi8wMi9zcGVlZGluZy11cC1saW51eC1r
ZXJuZWwtYnVpbGRzLXdpdGgtY2NhY2hlLwojI0xJTlVYX0NDQUNIRV9ESVI9IiR7V09SS0lOR19E
SVJ9L2NjYWNoZSIKIyNMSU5VWF9DQ0FDSEVfRElSPSIvbW50L3NhbmRpc2svY2NhY2hlL2xpbnV4
IgojIExpbWl0IG1heGltdW0gc2l6ZSBvZiBjYWNoZSB0byA1LjBHaUIgKGRlZmF1bHQ6IDUuMEdp
QikKIyNDQUNIRV9TSVpFPSI1LjBHIgojI2V4cG9ydCBDQ0FDSEVfRElSPSIke0xJTlVYX0NDQUNI
RV9ESVJ9IiBDQ0FDSEVfTUFYU0laRT0iJHtDQUNIRV9TSVpFfSIKCiMjIyBDaGFuZ2UgdG8gYnVp
bGQgZGlyZWN0b3J5CmNkICR7U1JDX0RJUn0KCiMjIyBDb21waWxlciBvcHRpb25zCiMgT3B0aW9u
YWw6IG15Y29tcGlsZXIgd3JhcHBlci1zY3JpcHQgKHN1Z2dlc3RlZCBieSBMaW51cyBUb3J2YWxk
cykKQ0NfRk9SX0JVSUxEPSJjbGFuZyIKQ1hYX0ZPUl9CVUlMRD0iY2xhbmcrKyIKIyBYWFg6IFVu
Y29tbWVudCB0aGUgYmVsb3cgbGluZShzKSB3aGVuIGJ1aWxkaW5nIHdpdGggR05VIHRvb2xjaGFp
bgojI0NDX0ZPUl9CVUlMRD0iZ2NjLSRHQ0NfTUFKT1JfVkVSIgojI0NYWF9GT1JfQlVJTEQ9Imcr
Ky0kR0NDX01BSk9SX1ZFUiIKCiMjIyBMaW5rZXIgb3B0aW9ucwojIE9wdGlvbmFsOiBteWxpbmtl
ciB3cmFwcGVyLXNjcmlwdApMRF9GT1JfQlVJTEQ9ImxkLmxsZCIKIyBYWFg6IFVuY29tbWVudCB0
aGUgYmVsb3cgbGluZShzKSB3aGVuIGJ1aWxkaW5nIHdpdGggR05VIHRvb2xjaGFpbgojI0xEX0ZP
Ul9CVUlMRD0ibGQuYmZkIgojI0xEX0ZPUl9CVUlMRD0kKHdoaWNoIGxkLmJmZCkKCiMjIyBHTlUg
dG9vbHMgb3B0aW9ucwojIFhYWDogVW5jb21tZW50IHRoZSBiZWxvdyBsaW5lKHMpIHdoZW4gYnVp
bGRpbmcgd2l0aCBHTlUgdG9vbGNoYWluCiMgTk9URTogU2VsZm1hZGUgR05VIEFTIHYyLjM1LjIg
bmVlZHMgdG8gYmUgc3ltbGlua2VkIGluIC91c3IvYmluIGRpcmVjdG9yeQojIFhYWDogU3ltbGlu
azogL3Vzci9iaW4vYXMgLT4gL29wdC9iaW51dGlscy0yLjM1LjIvYmluL2FzCiMjCiMgWFhYOiBX
aGVuIHNlbGZtYWRlIEdOVSBiaW51dGlscyBpcyB1c2VkIChzZWUgIkdOVSBiaW51dGlscyBwYXRo
IG9wdGlvbnMiIHNlY3Rpb24pCiMjQVJfRk9SX0JVSUxEPSQod2hpY2ggYXIpCiMjSE9TVEFSX0ZP
Ul9CVUlMRD0iJHtBUl9GT1JfQlVJTER9IgojI05NX0ZPUl9CVUlMRD0kKHdoaWNoIG5tKQojI09C
SkNPUFlfRk9SX0JVSUxEPSQod2hpY2ggb2JqY29weSkKIyNPQkpEVU1QX0ZPUl9CVUlMRD0kKHdo
aWNoIG9iamR1bXApCiMjUkVBREVMRl9GT1JfQlVJTEQ9JCh3aGljaCByZWFkZWxmKQojI1NUUklQ
X0ZPUl9CVUlMRD0kKHdoaWNoIHN0cmlwKQojI0dOVV9UT09MU19PUFRTPSJIT1NUQ0M9JHtDQ19G
T1JfQlVJTER9IEhPU1RDWFg9JHtDWFhfRk9SX0JVSUxEfSBIT1NUTEQ9JHtMRF9GT1JfQlVJTER9
IEhPU1RBUj0ke0hPU1RBUl9GT1JfQlVJTER9IgojI0dOVV9UT09MU19PUFRTPSIkR05VX1RPT0xT
X09QVFMgQ0M9JHtDQ19GT1JfQlVJTER9IExEPSR7TERfRk9SX0JVSUxEfSBBUj0ke0FSX0ZPUl9C
VUlMRH0gTk09JHtOTV9GT1JfQlVJTER9IgojI0dOVV9UT09MU19PUFRTPSIkR05VX1RPT0xTX09Q
VFMgT0JKQ09QWT0ke09CSkNPUFlfRk9SX0JVSUxEfSBPQkpEVU1QPSR7T0JKRFVNUF9GT1JfQlVJ
TER9IFJFQURFTEY9JHtSRUFERUxGX0ZPUl9CVUlMRH0gU1RSSVA9JHtTVFJJUF9GT1JfQlVJTER9
IgojIwojI0dOVV9UT09MU19PUFRTPSJIT1NUQ0M9JHtDQ19GT1JfQlVJTER9IEhPU1RDWFg9JHtD
WFhfRk9SX0JVSUxEfSBIT1NUTEQ9JHtMRF9GT1JfQlVJTER9IgojI0dOVV9UT09MU19PUFRTPSIk
R05VX1RPT0xTX09QVFMgQ0M9JHtDQ19GT1JfQlVJTER9IExEPSR7TERfRk9SX0JVSUxEfSIKIyMK
IyBYWFg6IFVuY29tbWVudCB0aGUgYmVsb3cgbGluZShzKSB3aGVuIGJ1aWxkaW5nIHdpdGggTExW
TSB0b29sY2hhaW4KR05VX1RPT0xTX09QVFM9IiIKCiMjIyBMTFZNIHRvb2xzIG9wdGlvbnMgKEVY
UEVSSU1FTlRBTCkKIyBgbWFrZSBMTFZNPTFgIHNldHMgdGhlc2UgaG9zdCBhbmQgdGFyZ2V0IG9w
dGlvbnM6CiMgLSBob3N0OiAgIEhPU1RDQz1jbGFuZyBIT1NUQ1hYPWNsYW5nKysgSE9TVExEPWxk
LmxsZCBIT1NUQVI9bGx2bS1hcgojIC0gdGFyZ2V0OiBDQz1jbGFuZyBMRD1sZC5sbGQgQVI9bGx2
bS1hciBOTT1sbHZtLW5tIFNUUklQPWxsdm0tc3RyaXAgT0JKQ09QWT1sbHZtLW9iamNvcHkgT0JK
RFVNUD1sbHZtLW9iamR1bXAgUkVBREVMRj1sbHZtLXJlYWRlbGYKIyBOT1RFOiBsbHZtLXNpemU6
IFNlZSBjb21taXQgZDliNTY2NWZiM2M4ICgia2J1aWxkOiByZW1vdmUgdW51c2VkIE9CSlNJWkUi
KQojIExpbms6IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvbGF0ZXN0L2tidWlsZC9s
bHZtLmh0bWwjbGx2bS11dGlsaXRpZXMKIyBMaW5rOiBodHRwczovL2dpdC5rZXJuZWwub3JnL2xp
bnVzL2Q5YjU2NjVmYjNjODIyNzMwODU3YmE5MTE5ZWFkOGI1ZTVmZjk2N2QKIyNMTFZNX1RPT0xT
X09QVFM9IkhPU1RDQz0ke0NDX0ZPUl9CVUlMRH0gSE9TVENYWD0ke0NYWF9GT1JfQlVJTER9IEhP
U1RMRD0ke0xEX0ZPUl9CVUlMRH0gQ0M9JHtDQ19GT1JfQlVJTER9IExEPSR7TERfRk9SX0JVSUxE
fSIKIyNMTFZNX1RPT0xTX09QVFM9IiRMTFZNX1RPT0xTX09QVFMgTExWTT0xIgpMTFZNX1RPT0xT
X09QVFM9IkxMVk09MSIKIyBYWFg6IFVuY29tbWVudCB0aGUgYmVsb3cgbGluZShzKSB3aGVuIGJ1
aWxkaW5nIHdpdGggR05VIHRvb2xjaGFpbgojI0xMVk1fVE9PTFNfT1BUUz0iIgoKIyMjIExMVk0g
SUFTIG9wdGlvbnMgKEVYUEVSSU1FTlRBTCkKIyBOT1RFOiBgbWFrZSBMTFZNX0lBUz0xYCB1c2Vz
IENsYW5nJ3MgKEkpbnRlZ3JhdGVkIChBUylzZW1ibGVyIChJQVMpIChkZWZhdWx0OiBkaXNhYmxl
ZCkKIyBMaW5rOiBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9rYnVpbGQv
bGx2bS5odG1sI2xsdm0tdXRpbGl0aWVzCkxMVk1fSUFTX09QVFM9IkxMVk1fSUFTPTEiCiMgWFhY
OiBVbmNvbW1lbnQgdGhlIGJlbG93IGxpbmUocykgd2hlbiBidWlsZGluZyB3aXRoIEdOVSB0b29s
Y2hhaW4KIyNMTFZNX0lBU19PUFRTPSIiCgojIyMgcGFob2xlIG9wdGlvbnMKIyBYWFg6IGR3YXJ2
ZXMgRGViaWFuIHBhY2thZ2Ugc2hpcHMgcGFob2xlIGJpbmFyeQojIFhYWDogUmVxdWlyZWQgd2hl
biBDT05GSUdfREVCVUdfSU5GT19CVEY9eQpQQUhPTEVfQklOQVJZPSIvb3B0L3BhaG9sZS9iaW4v
cGFob2xlIgpQQUhPTEVfT1BUUz0iUEFIT0xFPSRQQUhPTEVfQklOQVJZIgoKIyMjIEdOVSBBUyBh
bmQgQkZEIGNvbXBhdGliaWxpdHkgb3B0aW9ucwojIE5PVEU6IFVzZSB3aXRoIExMVk0gdG9vbGNo
YWluCiMgTGluazogaHR0cHM6Ly9yZXZpZXdzLmxsdm0ub3JnL0Q4NTQ3NAojI0JJTlVUSUxTX0NP
TVBBVF9WRVJTSU9OPSIyLjM1IgojI0JJTlVUSUxTX0NPTVBBVF9PUFRTPSJLQ0ZMQUdTPS1mYmlu
dXRpbHMtdmVyc2lvbj0kQklOVVRJTFNfQ09NUEFUX1ZFUlNJT04iCkJJTlVUSUxTX0NPTVBBVF9P
UFRTPSIiCgojIyMgTWFrZSBvcHRpb25zCiMgREVCVUc6IE1BS0U9Im1ha2UgVj0xIiAodmVyYm9z
ZSBvdXRwdXQgdG8gZGlzcGxheSBmdWxsIG1ha2UgbGluZXMpCiMgREVCVUc6IE1BS0U9Im1ha2Ug
Vz0xIiAoZW5hYmxlIGV4dHJhIHdhcm5pbmcgb3B0aW9ucyBmb3IgY29tcGlsZXIpCiMgREVCVUc6
IE1BS0VfSk9CUz0iMSIgICAobm8gcGFyYWxsZWwgbWFrZSBqb2JzKQojIE5PVEU6IEludGVsIFNh
bmR5IEJyaWRnZSBDUFUgaGFzIDQgYXZhaWxhYmxlIENQVXMKREVGQVVMVD0iJCgoJChnZXRjb25m
IF9OUFJPQ0VTU09SU19PTkxOKSAtMSkpIgpNQVhDUFVTPSIkKCgkKGdldGNvbmYgX05QUk9DRVNT
T1JTX09OTE4pKSkiClNQRUVEVVA9IiQoKCQoZ2V0Y29uZiBfTlBST0NFU1NPUlNfT05MTikgKzEp
KSIKTUFLRV9KT0JTPSIke01BWENQVVN9IgpNQUtFPSJtYWtlIgpNQUtFX1ZFUkJPU0VfT1BUUz0i
Vj0xIgojI01BS0VfVkVSQk9TRV9PUFRTPSIiCk1BS0VfT1BUUz0iJHtNQUtFX1ZFUkJPU0VfT1BU
U30gLWoke01BS0VfSk9CU30iCgojIyMgRXh0cmFjdCBsYXRlc3QgbWFpbmxpbmUgdmVyc2lvbiBH
aXQgdGFnCkxBVEVTVF9VUFNUUkVBTV9WRVJfVEFHPSQoZ2l0IGZvci1lYWNoLXJlZiAtLXNvcnQ9
dGFnZ2VyZGF0ZSAtLWZvcm1hdD0iJShyZWZuYW1lOnNob3J0KSIgcmVmcy90YWdzIHwgZ3JlcCBe
J3ZbMC05XS5bMC05XSonIHwgdGFpbCAtMSkKCiMjIyBEaXN0cmlidXRpb24gb3B0aW9ucwojIE5P
VEU6ICRkaXN0cmlidXRpb24gaXMgdXNlZCBpbiAkZGViaWFuX3JldmlzaW9uCmRpc3RyaWJ1dGlv
bj0kKGxzYl9yZWxlYXNlIC0tY29kZW5hbWUgLS1zaG9ydCkKCiMjIyBVcGxvYWRlciBvcHRpb25z
CiMgTk9URTogJHVwbG9hZGVyIGlzIHVzZWQgaW4gJGRlYmlhbl9yZXZpc2lvbgpleHBvcnQgREVC
RlVMTE5BTUU9IlNlZGF0IERpbGVrIgpleHBvcnQgREVCRU1BSUw9InNlZGF0LmRpbGVrQGdtYWls
LmNvbSIKdXBsb2FkZXI9ImRpbGVrcyIKCiMjIyBEZWJpYW4gdXBzdHJlYW0gdmVyc2lvbiBvcHRp
b25zCiMgTk9URS0xOiAkdXBzdHJlYW1fdmVyc2lvbiBpcyBleHRyYWN0ZWQgZnJvbSBNYWtlZmls
ZQojIE5PVEUtMjogJGRlYmlhbl91cHN0cmVhbV92ZXJzaW9uIGlzIHVzZWQgaW4gYnVpbGRkZWIg
b3B0aW9ucwojIE5PVEUtMzogQ29udmVydCAnLXJjWCcgaW4gJHVwc3RyZWFtX3ZlcnNpb24gdG8g
J35yY1gnIChzZWUgRVhUUkFWRVJTSU9OKQojIEVYQU1QTEUtMTogZGViaWFuX3Vwc3RyZWFtX3Zl
cnNpb249IjUuMTAuNCIKIyBFWEFNUExFLTI6IGRlYmlhbl91cHN0cmVhbV92ZXJzaW9uPSI1LjEx
LjB+cmMxIgp2ZXJzaW9uPSQoYXdrICcvXlZFUlNJT04gPSAvIHtwcmludCAkM30nIE1ha2VmaWxl
KQpwYXRjaGxldmVsPSQoYXdrICcvXlBBVENITEVWRUwgPSAvIHtwcmludCAkM30nIE1ha2VmaWxl
KQpzdWJsZXZlbD0kKGF3ayAnL15TVUJMRVZFTCA9IC8ge3ByaW50ICQzfScgTWFrZWZpbGUpCmV4
dHJhdmVyc2lvbj0kKGF3ayAnL15FWFRSQVZFUlNJT04gPSAvIHtwcmludCAkM30nIE1ha2VmaWxl
KQp1cHN0cmVhbV92ZXJzaW9uPSIke3ZlcnNpb259LiR7cGF0Y2hsZXZlbH0uJHtzdWJsZXZlbH0k
e2V4dHJhdmVyc2lvbn0iCmRlYmlhbl91cHN0cmVhbV92ZXJzaW9uPSQoZWNobyAkdXBzdHJlYW1f
dmVyc2lvbiB8IHRyICctJyAnficpCgojIyMgRGViaWFuIHJldmlzaW9uIG9wdGlvbnMKIyBOT1RF
LTE6ICRkZWJpYW5fcmV2aXNpb24gaXMgdXNlZCBpbiBidWlsZGRlYiBvcHRpb25zCiMgTk9URS0y
OiAkcmV2aXNpb24gaXMgdXNlZCBpbiAkZGViaWFuX3JldmlzaW9uIGFuZCAkbXlsb2NhbHZlcnNp
b24KIyBFWEFNUExFOiBkZWJpYW5fcmV2aXNpb249IjF+YnVsbHNleWUrZGlsZWtzMSIKcmV2aXNp
b249IjEiCnVwbG9hZGVyX3JldmlzaW9uPSIxIgpkZWJpYW5fcmV2aXNpb249IiR7cmV2aXNpb259
fiR7ZGlzdHJpYnV0aW9ufSske3VwbG9hZGVyfSR7dXBsb2FkZXJfcmV2aXNpb259IgoKIyMjIE15
IGtlcm5lbC1mZWF0dXJlc2V0IG9wdGlvbnMKIyBFWEFNUExFOiBVc2UgImFtZDY0IiBmZWF0dXJl
c2V0IG9mIERlYmlhbiBrZXJuZWwtdGVhbSAoYWRhcHRlZCBEZWJpYW4ncyBrZXJuZWwtY29uZmln
KQpteWZlYXR1cmVzZXQ9ImFtZDY0IgoKIyMjIE15IGtlcm5lbC1mbGF2b3VyIG9wdGlvbnMKIyBO
T1RFOiBDbGFuZy1MVE8sIENsYW5nLUNGSSBhbmQgQ2xhbmctUEdPIHJlY29tbWVuZCBvciByZXF1
aXJlIExMVk0vQ2xhbmcgPj0gMTIKIyBFWEFNUExFLTE6IGNsYW5nWFgtbGx2bTogVXNlIGNsYW5n
IHZlcnNpb24gWFggYW5kIExMVk0gdXRpbGl0aWVzIChtYWtlIExMVk09MSkKIyBFWEFNUExFLTI6
ICBjbGFuZ1hYLWlhczogVXNlIGNsYW5nIHZlcnNpb24gWFggd2l0aCBJQVMgc3VwcG9ydCAoRVhQ
RVJJTUVOVEFMKQojIEVYQU1QTEUtMzogIGNsYW5nWFgtbHRvOiBVc2UgY2xhbmcgdmVyc2lvbiBY
WCB3aXRoIExUTyBzdXBwb3J0IChFWFBFUklNRU5UQUwpCiMgRVhBTVBMRS00OiAgY2xhbmdYWC1j
Zmk6IFVzZSBjbGFuZyB2ZXJzaW9uIFhYIHdpdGggQ0ZJIHN1cHBvcnQgKEVYUEVSSU1FTlRBTCkK
IyBFWEFNUExFLTU6ICBjbGFuZ1hYLXBnbzogVXNlIGNsYW5nIHZlcnNpb24gWFggd2l0aCBQR08g
c3VwcG9ydCAoRVhQRVJJTUVOVEFMKQojIEVYQU1QTEUtNjogICAgZ2NjMTAtYmZkOiBVc2UgZ2Nj
LTEwIGFuZCBHTlUvbGQuYmZkIChkZWZhdWx0cyBpbiBEZWJpYW4vdGVzdGluZykKIyBFWEFNUExF
LTc6IGdjYzEwLWxsdm1YWDogVXNlIGdjYy0xMCBhbmQgTExWTSB1dGlsaXRpZXMgdmVyc2lvbiBY
WCAobWFrZSBMTFZNPTEpCiMgQ09ORklHLUxUTzogc2NyaXB0cy9jb25maWcgLWUgTFRPX0NMQU5H
IC1lIExUT19DTEFOR19USElOCiMgQ09ORklHLUNGSTogc2NyaXB0cy9jb25maWcgLWUgQ0ZJX0NM
QU5HIC1lIENGSV9DTEFOR19TSEFET1cgLWUgQ0ZJX1BFUk1JU1NJVkUKIyBDT05GSUctUEdPOiBz
Y3JpcHRzL2NvbmZpZyAtZSBQR09fQ0xBTkcKIyBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vc2Ft
aXRvbHZhbmVuL2xpbnV4L2NvbW1pdHMvY2xhbmctbHRvCiMgTGluazogaHR0cHM6Ly9naXRodWIu
Y29tL3NhbWl0b2x2YW5lbi9saW51eC9jb21taXRzL2NsYW5nLWNmaQojI215a2VybmVsZmxhdm91
cj0iY2xhbmcke0xMVk1fTUFKT1JfVkVSfS1sbHZtIgojI215a2VybmVsZmxhdm91cj0iY2xhbmck
e0xMVk1fTUFKT1JfVkVSfS1pYXMiCm15a2VybmVsZmxhdm91cj0iY2xhbmcke0xMVk1fTUFKT1Jf
VkVSfS1sdG8iCiMjbXlrZXJuZWxmbGF2b3VyPSJjbGFuZyR7TExWTV9NQUpPUl9WRVJ9LWNmaSIK
IyNteWtlcm5lbGZsYXZvdXI9ImNsYW5nJHtMTFZNX01BSk9SX1ZFUn0tcGdvIgojIFhYWDogVW5j
b21tZW50IHRoZSBiZWxvdyBsaW5lKHMpIHdoZW4gYnVpbGRpbmcgd2l0aCBHTlUgdG9vbGNoYWlu
CiMjbXlrZXJuZWxmbGF2b3VyPSJnY2Mke0dDQ19NQUpPUl9WRVJ9LWJmZCIKIyNteWtlcm5lbGZs
YXZvdXI9ImdjYyR7R0NDX01BSk9SX1ZFUn0tbGx2bSR7TExWTV9NQUpPUl9WRVJ9IgoKIyMjIEN1
c3RvbWl6ZWQgTE9DQUxWRVJTSU9OIG9wdGlvbnMKIyBDQVVUSU9OOiBEbyBOT1QgdXNlIHVuZGVy
c2NvcmUgKCJfIikgaW4gJG15bG9jYWx2ZXJzaW9uIChzZWUgRGViaWFuIGJ1ZyAjMjIyNDY3KQoj
IEVYQU1QTEU6IG15bG9jYWx2ZXJzaW9uPSIxLWFtZDY0LWdjYzEwLWJmZCIKIyBGaWxlOiBpbmNs
dWRlL2dlbmVyYXRlZC91dHNyZWxlYXNlLmgKIyBMaW5rOiBodHRwczovL2J1Z3MuZGViaWFuLm9y
Zy8yMjI0NjcKbXlsb2NhbHZlcnNpb249IiR7cmV2aXNpb259LSR7bXlmZWF0dXJlc2V0fS0ke215
a2VybmVsZmxhdm91cn0iCkxPQ0FMVkVSU0lPTl9PUFRTPSJMT0NBTFZFUlNJT049LSR7bXlsb2Nh
bHZlcnNpb259IgoKIyMjIFJlbW92ZSBhbnkgZXhpc3RpbmcgbG9jYWx2ZXJzaW9uKiBmaWxlKHMp
IGFzIGN1c3RvbWl6ZWQgTE9DQUxWRVJTSU9OIGlzIHVzZWQKIyBFWEFNUExFOiBMaW51eC1uZXh0
IHNoaXBzIGEgImxvY2FsdmVyc2lvbi1uZXh0IiBmaWxlLgpybSAtdiAtZiBsb2NhbHZlcnNpb24q
CgojIyMgQnVpbGQgbG9nLWZpbGUKS1ZFUj0iJHt1cHN0cmVhbV92ZXJzaW9ufS0ke215bG9jYWx2
ZXJzaW9ufSIKQlVJTERfTE9HX0ZJTEU9ImJ1aWxkLWxvZ18ke0tWRVJ9LnR4dCIKCiMjIyBLQlVJ
TEQgb3B0aW9ucwojIEluc3BpcmVkIGJ5IGNvbW1pdCAzM2QyZTE0ZDRkMGMgKCJCdWlsZCB3aXRo
IEtCVUlMRF9WRVJCT1NFPTEgYnkgZGVmYXVsdCIpCiMgQ0FVVElPTjogRG8gTk9UIHVzZSAxOTcw
LTAxLTAxICgwMS1KYW4tMTk3MCkKIyBFWEFNUExFOiBUSU1FU1RBTVA9IjIwMjEtMDEtMDEiCiMg
TGluazogaHR0cHM6Ly9zYWxzYS5kZWJpYW4ub3JnL2tlcm5lbC10ZWFtL2xpbnV4L2NvbW1pdC8z
M2QyZTE0ZDRkMGMxYTBjNDk4M2NjMWMxNzg5MWYyYjVjOTcyOTcyCiMgTGluazogaHR0cHM6Ly9u
aWNrZGVzYXVsbmllcnMuZ2l0aHViLmlvL2Jsb2cvMjAxOC8wNi8wMi9zcGVlZGluZy11cC1saW51
eC1rZXJuZWwtYnVpbGRzLXdpdGgtY2NhY2hlLwpIT1NUPSJpbml6YSIKVElNRVNUQU1QPSQoZGF0
ZSArJVktJW0tJWQpCiMjS0JVSUxEX1ZFUkJPU0VfT1BUUz0iS0JVSUxEX1ZFUkJPU0U9MSIKS0JV
SUxEX1ZFUkJPU0VfT1BUUz0iIgpLQlVJTERfQlVJTERfT1BUUz0iS0JVSUxEX0JVSUxEX0hPU1Q9
JHtIT1NUfSBLQlVJTERfQlVJTERfVVNFUj0ke0RFQkVNQUlMfSBLQlVJTERfQlVJTERfVElNRVNU
QU1QPSR7VElNRVNUQU1QfSIKS0JVSUxEX09QVFM9IiR7S0JVSUxEX1ZFUkJPU0VfT1BUU30gJHtL
QlVJTERfQlVJTERfT1BUU30iCgojIyMgYnVpbGRkZWIgKG1rZGViaWFuKSBvcHRpb25zCiMgRVhB
TVBMRS0xOiBCVUlMRERFQl9UQVJHRVQ9ImJpbmRlYi1wa2ciIChvbmx5IGdlbmVyYXRlIERlYmlh
biBwYWNrYWdlcyB3aXRoIExpbnV4ID49IHY0LjMtcmMxKQojIEVYQU1QTEUtMjogS0RFQl9QS0dW
RVJTSU9OPSI1LjEwLjQtMX5idWxsc2V5ZStkaWxla3MxIgojIEZpbGU6IHNjcmlwdHMvcGFja2Fn
ZS9NYWtlZmlsZQpCVUlMRERFQl9UQVJHRVQ9ImJpbmRlYi1wa2ciCkJVSUxEREVCX09QVFM9IiR7
QlVJTERERUJfVEFSR0VUfSBLREVCX1BLR1ZFUlNJT049JHtkZWJpYW5fdXBzdHJlYW1fdmVyc2lv
bn0tJHtkZWJpYW5fcmV2aXNpb259IgoKIyMjIExpbnV4IHBlcmYgc2V0dGluZ3MKIyBQRVJGOiBJ
bnN0YWxsIGxpbnV4LXBlcmYtJHZlcnNpb24gRGViaWFuIHBhY2thZ2Ugb3IgdXNlIHNlbGZtYWRl
IHBlcmYgYmluYXJ5CiMgUEVSRl9PUFRTOiBVc2UgInN0YXQiIChkZWZhdWx0KSBvciAicmVjb3Jk
IiAoc3RvcCB3aXRoIEN0cmwrQyBhZnRlciBzb21lIG1pbnV0ZXMgZHVlIHRvIGh1Z2UgcGVyZi5k
YXRhIGZpbGUpCiMgTW9yZSBkZXRhaWxzIHNlZSAnUGVyZiBldmVudHMgYW5kIHRvb2wgc2VjdXJp
dHknIGRvY3VtZW50CiMgTGluazogaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRl
c3QvYWRtaW4tZ3VpZGUvcGVyZi1zZWN1cml0eS5odG1sCiMjUEVSRl9CSU49IiRIT01FL2Jpbi9w
ZXJmIgpQRVJGX1ZFUj0iNS4xNCIKUEVSRl9CSU49Ii91c3IvYmluL3BlcmZfJHtQRVJGX1ZFUn0i
ClBFUkZfT1BUUz0ic3RhdCIKCiMgQ2xhbmcgUEdPIG9wdGlvbnMgKHJlYnVpbGQpCiMgRG9jdW1l
bnRhdGlvbi9kZXYtdG9vbHMvcGdvLnJzdDogbWFrZSBMTFZNPTEgS0NGTEFHUz0tZnByb2ZpbGUt
dXNlPXZtbGludXgucHJvZmRhdGEgLi4uCiMgTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
ci8yMDIxMDExMTA4MTgyMS4zMDQxNTg3LTEtbW9yYm9AZ29vZ2xlLmNvbQojIE5PVEU6IENsYW5n
LVBHTyB1c2VzIC1mcHJvZmlsZS1nZW5lcmF0ZSBhbmQgLWZwcm9maWxlLXVzZT0kUFJPRkRBVEEK
IyBOT1RFOiBMTFZNPTEgaXMgYWxyZWFkeSBzZXQgaW4gIkxMVk0gdG9vbHMgb3B0aW9ucyIgc2Vj
dGlvbgojIE5PVEU6IExMVk1fSUFTPTEgaXMgT0sgd2hlbiBzZWxmbWFkZSBwcm9mZGF0YS5wcm9m
IGlzIHVzZWQgKHNldCBpbiAiTExWTSBJQVMgb3B0aW9ucyIgc2VjdGlvbikKIyBOT1RFOiBSZWJ1
aWxkOiBTZXQgQ09ORklHX1BHT19DTEFORz1uIChSdW46IHNjcmlwdHMvY29uZmlnIC1kIFBHT19D
TEFORykKIyBOT1RFOiBjbGFuZy0xMiByZXF1aXJlcyAibW9kdWxlOiBJZ25vcmUgX0dMT0JBTF9P
RkZTRVRfVEFCTEVfIHdoZW4gd2FybmluZyBmb3IgdW5kZWZpbmVkIHN5bWJvbHMiCiMgTGluazog
aHR0cHM6Ly9naXRodWIuY29tL0NsYW5nQnVpbHRMaW51eC9saW51eC9pc3N1ZXMvMTI1MAojIExp
bms6IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvamV5dS9jL2ViZmFjN2I3NzhmYWM4YjBlOGU5MmVj
OTFkMGIwNTVmMDQ2YjQ2MDQKIyBYWFg6IERpcmVjdGx5IHVzZSBzZWxmbWFkZSAkUFJPRkRBVEEg
bWVhbnMgYSBwcmV2aW91cyBidWlsZCB3aXRoIENPTkZJR19QR09fQ0xBTkc9eSBpcyBub3QgbmVl
ZGVkCiMjUFJPRkRBVEE9InByb2ZkYXRhLnByb2YiCiMjQ0xBTkdfUEdPX09QVFM9IktDRkxBR1M9
LWZwcm9maWxlLXVzZT0ke1BST0ZEQVRBfSIKQ0xBTkdfUEdPX09QVFM9IiIKCiMjIyBMaXN0IHNv
bWUgdmVyc2lvbnMgYW5kIG9wdGlvbnMKZWNobyAiTExWTSB0b29sY2hhaW4gcGF0aCAuLi4uLi4u
ICR7TExWTV9UT09MQ0hBSU5fUEFUSH0iCmVjaG8gIkxpbnV4IG1haW5saW5lIHZlcnNpb24gLi4u
LiAke0xBVEVTVF9VUFNUUkVBTV9WRVJfVEFHfSIKZWNobyAiRGViaWFuIHVwc3RyZWFtIHZlcnNp
b24gLi4uICR7ZGViaWFuX3Vwc3RyZWFtX3ZlcnNpb259IgplY2hvICJEZWJpYW4gcmV2aXNpb24g
Li4uLi4uLi4uLi4gJHtkZWJpYW5fcmV2aXNpb259IgplY2hvICJMTFZNIG1ham9yIHZlcnNpb24g
Li4uLi4uLi4gJHtMTFZNX01BSk9SX1ZFUn0iCmVjaG8gIkxMVk0gdG9vbGNoYWluIHBhdGggLi4u
Li4uLiAke0xMVk1fVE9PTENIQUlOX1BBVEh9IgplY2hvICJHTlUvYmludXRpbHMgcGF0aCAuLi4u
Li4uLi4gJHtCSU5VVElMU19CSU5fUEFUSH0gJHtCSU5VVElMU19MSUJfUEFUSH0iCmVjaG8gIkND
IGNvbXBpbGVyIC4uLi4uLi4uLi4uLi4uLiAke0NDX0ZPUl9CVUlMRH0iCmVjaG8gIkNYWCBjb21w
aWxlciAuLi4uLi4uLi4uLi4uLiAke0NYWF9GT1JfQlVJTER9IgplY2hvICJMaW5rZXIgLi4uLi4u
Li4uLi4uLi4uLi4uLi4gJHtMRF9GT1JfQlVJTER9IgplY2hvICJHTlUgdG9vbHMgb3B0aW9ucyAu
Li4uLi4uLi4gJHtHTlVfVE9PTFNfT1BUU30iCmVjaG8gIkxMVk0gdG9vbHMgb3B0aW9ucyAuLi4u
Li4uLiAke0xMVk1fVE9PTFNfT1BUU30iCmVjaG8gIkxMVk0vQ2xhbmcgSUFTIG9wdGlvbnMgLi4u
LiAke0xMVk1fSUFTX09QVFN9IgplY2hvICJwYWhvbGUgb3B0aW9ucyAuLi4uLi4uLi4uLi4gJHtQ
QUhPTEVfT1BUU30iCmVjaG8gIkdOVS9iaW51dGlscyBjb21wYXQgb3B0cyAuLiAke0JJTlVUSUxT
X0NPTVBBVF9PUFRTfSIKZWNobyAibWFrZSBvcHRpb25zIC4uLi4uLi4uLi4uLi4uICR7TUFLRV9P
UFRTfSIKZWNobyAibG9jYWx2ZXJzaW9uIG9wdGlvbnMgLi4uLi4uICR7TE9DQUxWRVJTSU9OX09Q
VFN9IgplY2hvICJrYnVpbGQgb3B0aW9ucyAuLi4uLi4uLi4uLi4gJHtLQlVJTERfT1BUU30iCmVj
aG8gImJ1aWxkZGViIG9wdGlvbnMgLi4uLi4uLi4uLiAke0JVSUxEREVCX09QVFN9IgplY2hvICJM
aW51eCBwZXJmIG9wdGlvbnMgLi4uLi4uLi4gJHtQRVJGX0JJTn0gJHtQRVJGX09QVFN9IgplY2hv
ICJDbGFuZyBQR08gb3B0cyAuLi4uLi4uLi4uLi4gJHtDTEFOR19QR09fT1BUU30iCmVjaG8gIiIK
ZWNobyAiVXNlcidzIHBhdGggLi4uLi4uLi4uLi4uLi4uICR7UEFUSH0iCmVjaG8gIlVzZXIncyBs
aWJyYXJ5IHBhdGggLi4uLi4uLiAke0xEX0xJQlJBUllfUEFUSH0iCmVjaG8gIiIKCiMjIyBTdGFy
dCBidWlsZAplY2hvICIjIyMjIyBTdGFydGluZyBMaW51eC1rZXJuZWwgYnVpbGQgLi4uIgplY2hv
ICJsaW51eC1wZXJmOiBBZGp1c3QgbGltaXRlZCBhY2Nlc3MgdG8gcGVyZm9ybWFuY2UgbW9uaXRv
cmluZyBhbmQgb2JzZXJ2YWJpbGl0eSBvcGVyYXRpb25zIgplY2hvIDAgfCBzdWRvIHRlZSAvcHJv
Yy9zeXMva2VybmVsL2twdHJfcmVzdHJpY3QgL3Byb2Mvc3lzL2tlcm5lbC9wZXJmX2V2ZW50X3Bh
cmFub2lkCiR7UEVSRl9CSU59ICR7UEVSRl9PUFRTfSAke01BS0V9ICR7TUFLRV9PUFRTfSAke0dO
VV9UT09MU19PUFRTfSAke0xMVk1fVE9PTFNfT1BUU30gJHtMTFZNX0lBU19PUFRTfSAke1BBSE9M
RV9PUFRTfSAke0JJTlVUSUxTX0NPTVBBVF9PUFRTfSAke0xPQ0FMVkVSU0lPTl9PUFRTfSAke0tC
VUlMRF9PUFRTfSAke0JVSUxEREVCX09QVFN9ICR7Q0xBTkdfUEdPX09QVFN9IDI+JjEgfCB0ZWUg
Li4vJHtCVUlMRF9MT0dfRklMRX0KZWNobyAxIHwgc3VkbyB0ZWUgL3Byb2Mvc3lzL2tlcm5lbC9r
cHRyX3Jlc3RyaWN0IC9wcm9jL3N5cy9rZXJuZWwvcGVyZl9ldmVudF9wYXJhbm9pZAplY2hvICJs
aW51eC1wZXJmOiBSZXNldCBsaW1pdGVkIGFjY2VzcyB0byBwZXJmb3JtYW5jZSBtb25pdG9yaW5n
IGFuZCBvYnNlcnZhYmlsaXR5IG9wZXJhdGlvbnMiCg==
--000000000000174bce05cf9bd72e--
