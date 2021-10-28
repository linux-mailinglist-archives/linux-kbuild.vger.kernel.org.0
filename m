Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DEE443E777
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Oct 2021 19:44:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230380AbhJ1Rqj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 Oct 2021 13:46:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:49752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229610AbhJ1Rqi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Oct 2021 13:46:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A93660F38;
        Thu, 28 Oct 2021 17:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635443051;
        bh=0L2qrlxhpMUF7fTdRz7zfOLtpAuVLxVyftNL4daqgMM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Uaidu29HzagQtZy/rDOEXnhhBYuazWeFxUkwAZBdKASEYkA7RfBco4V9mGy2DOJ79
         l/eZTLVJur3foZrC9HbhB2bDVHwFy3vZ0Qrp3xQXlzUPi0lwEivPTXUkF4Zork2jF3
         bjTs5qJ6fzubzZj7Eozq7uDhuqZ/rW36l8DGEX/AV83sSr3TOlAzdcfQMhW0WPiImz
         BPvyR700KxhxR5DIy5Hsn1BwEajfvLgJyS35EWm1bPA5ypr559r9iNNiwxkNS/069O
         UnHBLeSqtkm3YgzLXUk3L2KQoPQbvVxMeD/VPKCXlTPP6t+bmtUi6/4ImGYUu2hU/g
         IhZehfEOUGFgQ==
Date:   Thu, 28 Oct 2021 10:44:06 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        X86 ML <x86@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        llvm@lists.linux.dev
Subject: Re: [PATCH] kbuild: Support clang-$ver builds
Message-ID: <YXrhZoOgv5dtFMTs@archlinux-ax161>
References: <YXqpFHeY26sEbort@hirez.programming.kicks-ass.net>
 <CAK7LNATUpgfKJvjp0+8H6VfMLMio9+BCoyj00mAO8FcaVGCqjg@mail.gmail.com>
 <YXqwZq53WUiTeqI7@hirez.programming.kicks-ass.net>
 <YXqyHhWGJfDkuxjP@hirez.programming.kicks-ass.net>
 <YXq72/yPe76DhDLu@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YXq72/yPe76DhDLu@hirez.programming.kicks-ass.net>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Oct 28, 2021 at 05:03:55PM +0200, Peter Zijlstra wrote:
> On Thu, Oct 28, 2021 at 04:22:22PM +0200, Peter Zijlstra wrote:
> > On Thu, Oct 28, 2021 at 04:15:02PM +0200, Peter Zijlstra wrote:
> > > On Thu, Oct 28, 2021 at 11:07:40PM +0900, Masahiro Yamada wrote:
> > > > On Thu, Oct 28, 2021 at 10:44 PM Peter Zijlstra <peterz@infradead.org> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > Debian (and derived) distros ship their compilers as -$ver suffixed
> > > > > binaries. For gcc it is sufficent to use:
> > > > >
> > > > >  $ make CC=gcc-12
> > > > >
> > > > > However, clang builds (esp. clang-lto) need a whole array of tools to be
> > > > > exactly right, leading to unweildy stuff like:
> > > > >
> > > > >  $ make CC=clang-13 LD=ld.lld=14 AR=llvm-ar-13 NM=llvm-nm-13 OBJCOPY=llvm-objcopy-13 OBJDUMP=llvm-objdump-13 READELF=llvm-readelf-13 STRIP=llvm-strip-13 LLVM=1
> > > > >
> > > > > which is, quite franktly, totally insane and unusable. Instead use the
> > > > > already mandatory LLVM variable to convey this, enabling one such as
> > > > > myself to use:
> > > > >
> > > > >  $ make LLVM=-13
> > > > >
> > > > > This also lets one quickly test different clang versions.
> > > > 
> > > > 
> > > > Please read the commit log of
> > > > a0d1c951ef08ed24f35129267e3595d86f57f5d3
> > > 
> > > That's yuck, I like LLVM=-13 or LLVM=-12 much better to select between
> > > compilers. Means I don't have to remember wth they live and or wreck
> > > PATH.
> > 
> > Even better, why not do something like:
> > 
> > if test "${CC:0:5}" == "clang"
> > then
> > 	LLVM=1
> > 	LLVM_SFX=${CC:5}
> > fi
> > 
> > Then we can simply use: make CC=clang-12 and have it all just work.
> > 
> 
> Like so..

I like the first iteration of this idea most, as CC=clang does not
currently imply using all LLVM tools. There are some architectures that
work with CC=clang but not LLVM=1 so I am not sure we want that meaning
to change.

I do think this issue of Debian's different clang versions needs to be
resolved as more and more LLVM features are being developed and non-LLVM
or ClangBuiltLinux developers want to test these features and make sure
that they work properly. There are a few different options:

1. Take Peter's first patch so that LLVM=1 and LLVM=-# can be used. The
   documentation should be updated to convey this change. The argument
   against doing this might be that Debian/Ubuntu/derivatives of either
   are special for using versioned suffixes and we do not want to add
   this to the build system but I think that might be short sighted.
   Peter's patch is not super complex nor does it change the status quo
   of LLVM=1.

2. Update the documentation to describe using the

   $ PATH=/usr/lib/llvm-#/bin:$PATH make LLVM=1 ...

   trick. This has been the preferred method for using different
   versions of LLVM but it has never been documented anywhere. This
   would allow us to keep the current build infrastructure while giving
   people clear instructions for how to handle different versions of
   clang. As Peter has noted, this would require people who are not
   familiar with building with LLVM to be constantly looking at the
   documentation to remember the command to invoke, whereas with
   LLVM=-#, it is easy to remember.

3. Explore recommending update-alternatives in the documentation or
   working with Debian to provide this automatically. As this is a
   Debian and derivatives only problem, a solution for it could come
   from the distribution itself. I found one post from a few years ago
   that talks about this but a command to use all LLVM tools from a
   particular version would be rather unweildy:

   https://askubuntu.com/questions/791616/set-clang-3-8-as-default

Overall, I think I like #1 the best. It is not that much more
complicated than what we have now and it leaves it entirely up to the
user how they want to build and it is hard for them to shoot themselves
in the foot. I am open to other suggestions or arguments though :)

Cheers,
Nathan

> ---
>  Makefile                       | 26 ++++++++++++++++----------
>  tools/scripts/Makefile.include | 22 ++++++++++++++--------
>  2 files changed, 30 insertions(+), 18 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 30c7c81d0437..1d0d4494e01d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -423,9 +423,15 @@ HOST_LFS_CFLAGS := $(shell getconf LFS_CFLAGS 2>/dev/null)
>  HOST_LFS_LDFLAGS := $(shell getconf LFS_LDFLAGS 2>/dev/null)
>  HOST_LFS_LIBS := $(shell getconf LFS_LIBS 2>/dev/null)
>  
> +CC_BASE = $(shell echo $(CC) | cut -b "1-5")
> +ifeq ($(shell test $(CC_BASE) = clang; echo $$?),0)
> +LLVM := 1
> +LLVM_SFX := $(shell echo $(CC) | cut -b "6-")
> +endif
> +
>  ifneq ($(LLVM),)
> -HOSTCC	= clang
> -HOSTCXX	= clang++
> +HOSTCC	= clang$(LLVM_SFX)
> +HOSTCXX	= clang++$(LLVM_SFX)
>  else
>  HOSTCC	= gcc
>  HOSTCXX	= g++
> @@ -443,14 +449,14 @@ KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS) $(HOSTLDLIBS)
>  # Make variables (CC, etc...)
>  CPP		= $(CC) -E
>  ifneq ($(LLVM),)
> -CC		= clang
> -LD		= ld.lld
> -AR		= llvm-ar
> -NM		= llvm-nm
> -OBJCOPY		= llvm-objcopy
> -OBJDUMP		= llvm-objdump
> -READELF		= llvm-readelf
> -STRIP		= llvm-strip
> +CC		= clang$(LLVM_SFX)
> +LD		= ld.lld$(LLVM_SFX)
> +AR		= llvm-ar$(LLVM_SFX)
> +NM		= llvm-nm$(LLVM_SFX)
> +OBJCOPY		= llvm-objcopy$(LLVM_SFX)
> +OBJDUMP		= llvm-objdump$(LLVM_SFX)
> +READELF		= llvm-readelf$(LLVM_SFX)
> +STRIP		= llvm-strip$(LLVM_SFX)
>  else
>  CC		= $(CROSS_COMPILE)gcc
>  LD		= $(CROSS_COMPILE)ld
> diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
> index 071312f5eb92..94c41083a7c7 100644
> --- a/tools/scripts/Makefile.include
> +++ b/tools/scripts/Makefile.include
> @@ -51,12 +51,18 @@ define allow-override
>      $(eval $(1) = $(2)))
>  endef
>  
> +CC_BASE = $(shell echo $(CC) | cut -b "1-5")
> +ifeq ($(shell test $(CC_BASE) = clang; echo $$?),0)
> +LLVM := 1
> +LLVM_SFX := $(shell echo $(CC) | cut -b "6-")
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
> @@ -69,9 +75,9 @@ endif
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
