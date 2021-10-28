Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D892543E9E3
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Oct 2021 22:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230451AbhJ1Uws (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 Oct 2021 16:52:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230404AbhJ1Uwr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Oct 2021 16:52:47 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DB56C061570;
        Thu, 28 Oct 2021 13:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=+yeJaGMjpw5txw3rg0Sql825GO1+QZGA7oq2b7F7QJI=; b=CmoAAsex2+d4f+v5YN1td958tj
        NfBgDnjHiuUK0RKf14mDZF+z5vL0zkSTpH3cV45NXf5XnyjAV3dBcPSXJYCTTQMSTO2NxUA95VbdP
        Bu8vv0ng6/t3Dc4unPo4fnYTLL9BCLUZPjyJ/x33x8mZlTvbZkSF9Oy6+Bc4T1K7gRWA3uAo/Th09
        va5tDiP+vwyBWFd2dUQruj25nGZ0Xyf2oSqjWgnYyTM4BYcjNaVPu995CQb8/blCVxrVBPiMbnI2i
        HXoqPjLnktGfWpv6BW3eA0Wl7tJwxrN3vzgTU9kNJ4qRHp7jlOCnhj9YgRhxpmcr7cQjQzVohYfyz
        VtQjmaQQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=worktop.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mgCKW-0012pN-1L; Thu, 28 Oct 2021 20:49:13 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
        id 48F3798629C; Thu, 28 Oct 2021 22:48:55 +0200 (CEST)
Date:   Thu, 28 Oct 2021 22:48:55 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        X86 ML <x86@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        llvm@lists.linux.dev
Subject: Re: [PATCH] kbuild: Support clang-$ver builds
Message-ID: <20211028204855.GP174703@worktop.programming.kicks-ass.net>
References: <YXqpFHeY26sEbort@hirez.programming.kicks-ass.net>
 <CAK7LNATUpgfKJvjp0+8H6VfMLMio9+BCoyj00mAO8FcaVGCqjg@mail.gmail.com>
 <YXqwZq53WUiTeqI7@hirez.programming.kicks-ass.net>
 <YXqyHhWGJfDkuxjP@hirez.programming.kicks-ass.net>
 <YXq72/yPe76DhDLu@hirez.programming.kicks-ass.net>
 <YXrhZoOgv5dtFMTs@archlinux-ax161>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YXrhZoOgv5dtFMTs@archlinux-ax161>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Oct 28, 2021 at 10:44:06AM -0700, Nathan Chancellor wrote:

> I like the first iteration of this idea most, as CC=clang does not
> currently imply using all LLVM tools. There are some architectures that
> work with CC=clang but not LLVM=1 so I am not sure we want that meaning
> to change.

Could such architecture set a CONFIG symbol to indicate they're
handicapped and have that make the Makefile not use the full LLVM suite?

> I do think this issue of Debian's different clang versions needs to be
> resolved as more and more LLVM features are being developed and non-LLVM
> or ClangBuiltLinux developers want to test these features and make sure
> that they work properly. There are a few different options:
> 
> 1. Take Peter's first patch so that LLVM=1 and LLVM=-# can be used. The
>    documentation should be updated to convey this change. The argument
>    against doing this might be that Debian/Ubuntu/derivatives of either
>    are special for using versioned suffixes and we do not want to add
>    this to the build system but I think that might be short sighted.
>    Peter's patch is not super complex nor does it change the status quo
>    of LLVM=1.

Also, I *greatly* appreciate having multiple versions of the compiler
at hand. I really think debian does the right thing here and other
distros are at a disadvantage.

Note: also Segher's buildall script generates version suffixed GCC
builds.

> 2. Update the documentation to describe using the
> 
>    $ PATH=/usr/lib/llvm-#/bin:$PATH make LLVM=1 ...
> 
>    trick. This has been the preferred method for using different
>    versions of LLVM but it has never been documented anywhere. This
>    would allow us to keep the current build infrastructure while giving
>    people clear instructions for how to handle different versions of
>    clang. As Peter has noted, this would require people who are not
>    familiar with building with LLVM to be constantly looking at the
>    documentation to remember the command to invoke, whereas with
>    LLVM=-#, it is easy to remember.

Right, this is no more than a crude hack and is super unfriendly. It
should never have been accepted.

> 3. Explore recommending update-alternatives in the documentation or
>    working with Debian to provide this automatically. As this is a
>    Debian and derivatives only problem, a solution for it could come
>    from the distribution itself. I found one post from a few years ago
>    that talks about this but a command to use all LLVM tools from a
>    particular version would be rather unweildy:
> 
>    https://askubuntu.com/questions/791616/set-clang-3-8-as-default

I also don't really appreciate this, I don't want to change the system
default 'clang' just to build a kernel. I might build the kernel with
various different compilers consecutively to look at differences in code
gen for example. Why should I not be able to build them concurrently?

> Overall, I think I like #1 the best. It is not that much more
> complicated than what we have now and it leaves it entirely up to the
> user how they want to build and it is hard for them to shoot themselves
> in the foot. I am open to other suggestions or arguments though :)

So I've been doing kernel builds using:

 $ make O=foo CC=gcc-$ver

for *years*, and I really don't understand or appreciate why building a
clang kernel needs to be so damn difficult. The whole: LLVM=1 thing is
just wrong.

 $ make O=foo CC=clang-$ver

*should* just work. This not working is a pain bug; people peddling
crazy things like 2) above is just mind-boggling insane. Having a
document explaining how to do an LLVM build should be a clue it's wrong.

So how about we do the below instead? Then the normal way of things will
be:

 $ make CC=clang-12

and it will all *just*work*. The incomplete LLVM archs can revert back
to the old hybrid (clang+binutils) way of things by doing:

 $ make CC=clang LLVM=0

Which explicitly states, use clang but don't use the full llvm suite. Or
they can do that CONFIG_LLVM_BROKEN (or whatever) to have them default
to LLVM=0

ifdef CONFIG_LLVM_BROKEN
LLVM ?= 0
endif

in front of the CC magic in the below patch should take care of that.

(also, having all this gunk twice isn't useful)

---
 Makefile                       |   26 ++++++++++++++++----------
 tools/scripts/Makefile.include |   22 ++++++++++++++--------
 2 files changed, 30 insertions(+), 18 deletions(-)

--- a/Makefile
+++ b/Makefile
@@ -423,9 +423,15 @@ HOST_LFS_CFLAGS := $(shell getconf LFS_C
 HOST_LFS_LDFLAGS := $(shell getconf LFS_LDFLAGS 2>/dev/null)
 HOST_LFS_LIBS := $(shell getconf LFS_LIBS 2>/dev/null)
 
+CC_BASE = $(shell echo $(CC) | cut -b "1-5")
+ifeq ($(shell test "$(CC_BASE)" = "clang"; echo $$?),0)
+LLVM ?= 1
+LLVM_SFX := $(shell echo $(CC) | cut -b "6-")
+endif
+
 ifneq ($(LLVM),)
-HOSTCC	= clang
-HOSTCXX	= clang++
+HOSTCC	= clang$(LLVM_SFX)
+HOSTCXX	= clang++$(LLVM_SFX)
 else
 HOSTCC	= gcc
 HOSTCXX	= g++
@@ -443,14 +449,14 @@ KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS)
 # Make variables (CC, etc...)
 CPP		= $(CC) -E
 ifneq ($(LLVM),)
-CC		= clang
-LD		= ld.lld
-AR		= llvm-ar
-NM		= llvm-nm
-OBJCOPY		= llvm-objcopy
-OBJDUMP		= llvm-objdump
-READELF		= llvm-readelf
-STRIP		= llvm-strip
+CC		= clang$(LLVM_SFX)
+LD		= ld.lld$(LLVM_SFX)
+AR		= llvm-ar$(LLVM_SFX)
+NM		= llvm-nm$(LLVM_SFX)
+OBJCOPY		= llvm-objcopy$(LLVM_SFX)
+OBJDUMP		= llvm-objdump$(LLVM_SFX)
+READELF		= llvm-readelf$(LLVM_SFX)
+STRIP		= llvm-strip$(LLVM_SFX)
 else
 CC		= $(CROSS_COMPILE)gcc
 LD		= $(CROSS_COMPILE)ld
--- a/tools/scripts/Makefile.include
+++ b/tools/scripts/Makefile.include
@@ -51,12 +51,18 @@ define allow-override
     $(eval $(1) = $(2)))
 endef
 
+CC_BASE = $(shell echo $(CC) | cut -b "1-5")
+ifeq ($(shell test "$(CC_BASE)" = "clang"; echo $$?),0)
+LLVM ?= 1
+LLVM_SFX := $(shell echo $(CC) | cut -b "6-")
+endif
+
 ifneq ($(LLVM),)
-$(call allow-override,CC,clang)
-$(call allow-override,AR,llvm-ar)
-$(call allow-override,LD,ld.lld)
-$(call allow-override,CXX,clang++)
-$(call allow-override,STRIP,llvm-strip)
+$(call allow-override,CC,clang$(LLVM_SFX))
+$(call allow-override,AR,llvm-ar$(LLVM_SFX))
+$(call allow-override,LD,ld.lld$(LLVM_SFX))
+$(call allow-override,CXX,clang++$(LLVM_SFX))
+$(call allow-override,STRIP,llvm-strip$(LLVM_SFX))
 else
 # Allow setting various cross-compile vars or setting CROSS_COMPILE as a prefix.
 $(call allow-override,CC,$(CROSS_COMPILE)gcc)
@@ -69,9 +75,9 @@ endif
 CC_NO_CLANG := $(shell $(CC) -dM -E -x c /dev/null | grep -Fq "__clang__"; echo $$?)
 
 ifneq ($(LLVM),)
-HOSTAR  ?= llvm-ar
-HOSTCC  ?= clang
-HOSTLD  ?= ld.lld
+HOSTAR  ?= llvm-ar$(LLVM_SFX)
+HOSTCC  ?= clang$(LLVM_SFX)
+HOSTLD  ?= ld.lld$(LLVM_SFX)
 else
 HOSTAR  ?= ar
 HOSTCC  ?= gcc
