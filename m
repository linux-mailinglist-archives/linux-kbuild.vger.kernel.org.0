Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19E6043E317
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Oct 2021 16:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbhJ1OLF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 Oct 2021 10:11:05 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:39888 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbhJ1OLF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Oct 2021 10:11:05 -0400
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 19SE8H6k023321;
        Thu, 28 Oct 2021 23:08:18 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 19SE8H6k023321
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1635430098;
        bh=IcpYv7zWe5UQhJrI79AsCfWxxZvFKvcreINhWE0NajI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YxOIeYLDuS0h3c2gODHmpmjviov+d4UQNZI5XcUQm9Gw+FjMt5Cv2md1zinagZU1P
         rw82N2SiDVSqbuE+tzuUOsPHWYpO+sPG3os8K+ruy0OwLi7hYxuCTIu+ZzMMbY6EAA
         jiuA4nOvBPJDUvluM1OwZxiCmGybRlMEvK+YC1HIPyQexPWTPoSrIw4bbZhfqeFwEh
         abkxKEfX1Y+dZzccYk4KfDUbx0YaGbImPutGumzW5vUWFmd4ynRh8Ponz/r0NyKyyK
         ipfRkDZs/cjfEgIWLWw3ka3BQZTjv3D/e9a0DLdZCknip5ILXXgLNR6796N+nQXRet
         oMdgZjvUbHmhA==
X-Nifty-SrcIP: [209.85.216.51]
Received: by mail-pj1-f51.google.com with SMTP id k2-20020a17090ac50200b001a218b956aaso4821889pjt.2;
        Thu, 28 Oct 2021 07:08:18 -0700 (PDT)
X-Gm-Message-State: AOAM533BF+4oUODzq/eqG4UHgLURG/w9DB68f4jChwW12RH7ivcvHaQG
        pFRxhDOqhgnC4Bgty+1aU1gSaYYrEPG/u2Oek9c=
X-Google-Smtp-Source: ABdhPJzVFYbKNCh5NMd97Z3K+qVlRxTWjQ19pEitcfweyZV2B/3abCoKrJBl47vojEOwhmyU4YFrGcIuZKH08TVdTIY=
X-Received: by 2002:a17:90b:4ac1:: with SMTP id mh1mr4795598pjb.144.1635430097162;
 Thu, 28 Oct 2021 07:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <YXqpFHeY26sEbort@hirez.programming.kicks-ass.net>
In-Reply-To: <YXqpFHeY26sEbort@hirez.programming.kicks-ass.net>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 28 Oct 2021 23:07:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNATUpgfKJvjp0+8H6VfMLMio9+BCoyj00mAO8FcaVGCqjg@mail.gmail.com>
Message-ID: <CAK7LNATUpgfKJvjp0+8H6VfMLMio9+BCoyj00mAO8FcaVGCqjg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Support clang-$ver builds
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        X86 ML <x86@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Oct 28, 2021 at 10:44 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> Hi,
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
> which is, quite franktly, totally insane and unusable. Instead use the
> already mandatory LLVM variable to convey this, enabling one such as
> myself to use:
>
>  $ make LLVM=-13
>
> This also lets one quickly test different clang versions.


Please read the commit log of
a0d1c951ef08ed24f35129267e3595d86f57f5d3






> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  Makefile                       | 27 +++++++++++++++++----------
>  tools/scripts/Makefile.include | 23 +++++++++++++++--------
>  2 files changed, 32 insertions(+), 18 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 30c7c81d0437..a38f38f7f190 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -423,9 +423,16 @@ HOST_LFS_CFLAGS := $(shell getconf LFS_CFLAGS 2>/dev/null)
>  HOST_LFS_LDFLAGS := $(shell getconf LFS_LDFLAGS 2>/dev/null)
>  HOST_LFS_LIBS := $(shell getconf LFS_LIBS 2>/dev/null)
>
> +# When LLVM=-ver use clang-ver binaries, useful for Debian and other
> +# multi-version setups
> +ifeq ($(shell test $(LLVM) -lt 0; echo $$?),0)
> +LLVM_SFX=$(LLVM)
> +export LLVM_SFX
> +endif
> +
>  ifneq ($(LLVM),)
> -HOSTCC = clang
> -HOSTCXX        = clang++
> +HOSTCC = clang$(LLVM_SFX)
> +HOSTCXX        = clang++$(LLVM_SFX)
>  else
>  HOSTCC = gcc
>  HOSTCXX        = g++
> @@ -443,14 +450,14 @@ KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS) $(HOSTLDLIBS)
>  # Make variables (CC, etc...)
>  CPP            = $(CC) -E
>  ifneq ($(LLVM),)
> -CC             = clang
> -LD             = ld.lld
> -AR             = llvm-ar
> -NM             = llvm-nm
> -OBJCOPY                = llvm-objcopy
> -OBJDUMP                = llvm-objdump
> -READELF                = llvm-readelf
> -STRIP          = llvm-strip
> +CC             = clang$(LLVM_SFX)
> +LD             = ld.lld$(LLVM_SFX)
> +AR             = llvm-ar$(LLVM_SFX)
> +NM             = llvm-nm$(LLVM_SFX)
> +OBJCOPY                = llvm-objcopy$(LLVM_SFX)
> +OBJDUMP                = llvm-objdump$(LLVM_SFX)
> +READELF                = llvm-readelf$(LLVM_SFX)
> +STRIP          = llvm-strip$(LLVM_SFX)
>  else
>  CC             = $(CROSS_COMPILE)gcc
>  LD             = $(CROSS_COMPILE)ld
> diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
> index 071312f5eb92..a2b53cc91378 100644
> --- a/tools/scripts/Makefile.include
> +++ b/tools/scripts/Makefile.include
> @@ -51,12 +51,19 @@ define allow-override
>      $(eval $(1) = $(2)))
>  endef
>
> +# When LLVM=-ver use clang-ver binaries, useful for Debian and other
> +# multi-version setups
> +ifeq ($(shell test $(LLVM) -lt 0; echo $$?),0)
> +LLVM_SFX=$(LLVM)
> +export LLVM_SFX
> +endif
> +
>  ifneq ($(LLVM),)
> -$(call allow-override,CC,clang)
> -$(call allow-override,AR,llvm-ar)
> -$(call allow-override,LD,ld.lld)
> -$(call allow-override,CXX,clang++)
> -$(call allow-override,STRIP,llvm-strip)
> +$(call allow-override,CC,clang$(LLVM_SFX))
> +$(call allow-override,AR,llvm-ar$(LLVM_SFX))
> +$(call allow-override,LD,ld.lld$(LLVM_SFX))
> +$(call allow-override,CXX,clang++$(LLVM_SFX))
> +$(call allow-override,STRIP,llvm-strip$(LLVM_SFX))
>  else
>  # Allow setting various cross-compile vars or setting CROSS_COMPILE as a prefix.
>  $(call allow-override,CC,$(CROSS_COMPILE)gcc)
> @@ -69,9 +76,9 @@ endif
>  CC_NO_CLANG := $(shell $(CC) -dM -E -x c /dev/null | grep -Fq "__clang__"; echo $$?)
>
>  ifneq ($(LLVM),)
> -HOSTAR  ?= llvm-ar
> -HOSTCC  ?= clang
> -HOSTLD  ?= ld.lld
> +HOSTAR  ?= llvm-ar$(LLVM_SFX)
> +HOSTCC  ?= clang$(LLVM_SFX)
> +HOSTLD  ?= ld.lld$(LLVM_SFX)
>  else
>  HOSTAR  ?= ar
>  HOSTCC  ?= gcc



-- 
Best Regards
Masahiro Yamada
