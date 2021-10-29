Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF00343F949
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Oct 2021 10:54:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbhJ2I5V (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 29 Oct 2021 04:57:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbhJ2I5U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Oct 2021 04:57:20 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80D7FC061570;
        Fri, 29 Oct 2021 01:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=pEwMErrKlTCn2rLDRGmwB6C9zC7PLQBRH5hp0mxseNM=; b=k9gE7vx4vhH/g8JoH7RXhyKT89
        H8yTOFR244Xi2csk9HEITDQO0BBwZSEFi7+bXNODZhR+OvIF1XvxVwZ5wjBP2DLf567ssPSUAfJXV
        yLb5pGAL+LSWtE9+GisKUush7vgPJKCh81aezNh3ewKh9yhzIVGRdFGyJ+5Tu0nQNIT5NUuytrs/K
        Pfn8r7tlaT0n1aevAmwv8vJAScaJinPX15uiLJKkCbUglFfpJuE5mJEB0Hm3eu68YGqbA6lu6x7lD
        5u7fDvKyC4rrh3/+Aum8HdCNdyQPPXYAgi67rPYS5nlruXByzMiYmETu/g0wOaAHmmwdNhtFLtktP
        Pmjr3fYg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mgNeq-00D3MU-HJ; Fri, 29 Oct 2021 08:54:40 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 4618330001C;
        Fri, 29 Oct 2021 10:54:39 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 2DA772BD30FAC; Fri, 29 Oct 2021 10:54:39 +0200 (CEST)
Date:   Fri, 29 Oct 2021 10:54:39 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        X86 ML <x86@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        llvm@lists.linux.dev
Subject: Re: [PATCH] kbuild: Support clang-$ver builds
Message-ID: <YXu2z6FQ6Z7qtjbk@hirez.programming.kicks-ass.net>
References: <YXqpFHeY26sEbort@hirez.programming.kicks-ass.net>
 <CAK7LNATUpgfKJvjp0+8H6VfMLMio9+BCoyj00mAO8FcaVGCqjg@mail.gmail.com>
 <YXqwZq53WUiTeqI7@hirez.programming.kicks-ass.net>
 <YXqyHhWGJfDkuxjP@hirez.programming.kicks-ass.net>
 <YXq72/yPe76DhDLu@hirez.programming.kicks-ass.net>
 <YXrhZoOgv5dtFMTs@archlinux-ax161>
 <20211028204855.GP174703@worktop.programming.kicks-ass.net>
 <CAKwvOd=x9E=7WcCiieso-CDiiU-wMFcXL4W3V5j8dq7BL5QT+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOd=x9E=7WcCiieso-CDiiU-wMFcXL4W3V5j8dq7BL5QT+w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Oct 28, 2021 at 04:27:55PM -0700, Nick Desaulniers wrote:
> On Thu, Oct 28, 2021 at 1:49 PM Peter Zijlstra <peterz@infradead.org> wrote:

> > > 2. Update the documentation to describe using the
> > >
> > >    $ PATH=/usr/lib/llvm-#/bin:$PATH make LLVM=1 ...
> > >
> > >    trick. This has been the preferred method for using different
> > >    versions of LLVM but it has never been documented anywhere. This
> > >    would allow us to keep the current build infrastructure while giving
> > >    people clear instructions for how to handle different versions of
> > >    clang. As Peter has noted, this would require people who are not
> > >    familiar with building with LLVM to be constantly looking at the
> > >    documentation to remember the command to invoke, whereas with
> > >    LLVM=-#, it is easy to remember.
> >
> > Right, this is no more than a crude hack and is super unfriendly. It
> > should never have been accepted.
> 
> Lots of tools modify PATH in your `.bashrc` or `.zshrc` etc.  I don't
> see how that's any different, other than one off commands in which you
> actually intend to use a specific version.

Typically /etc/profile.d/ stuff adds to PATH for easy access to
installed programs but it is very poor at handling conflicting versions
of the same program (IIRC you get the first one).

Why should I want to remember where clang-12 vs gcc-9 lives? I don't
want to remember or even type those paths, Debian has already kindly
given me these unambiguous names to use.

> > So how about we do the below instead? Then the normal way of things will
> > be:
> >
> >  $ make CC=clang-12
> >
> > and it will all *just*work*. The incomplete LLVM archs can revert back
> > to the old hybrid (clang+binutils) way of things by doing:
> >
> >  $ make CC=clang LLVM=0
> >
> > Which explicitly states, use clang but don't use the full llvm suite. Or
> > they can do that CONFIG_LLVM_BROKEN (or whatever) to have them default
> > to LLVM=0
> >
> > ifdef CONFIG_LLVM_BROKEN
> > LLVM ?= 0
> > endif
> >
> > in front of the CC magic in the below patch should take care of that.
> 
> I don't think setting CC should affect LD and friends (if you were
> suggesting that CC=clang-12 replace LLVM=1).  

Why not? Why should clang not default to ld.lld? If you want weird mixes
you can always override them.

Again, why should CC=clang not default to the whole LLVM suite? Why
should using LLVM as a whole, be made more difficult? It's almost as if
you don't want people to use it.

You're explicitly making clang-lto/cfi difficult to use; is that on
purpose?

> Like Nathan, I'm
> sympathetic and think that your first patch is probably closer to what
> I'd accept, but it needs to handle non-suffixed versions (looks like
> it should) and add this info to Documentations/kbuild/llvm.rst.

That first patch has some issues there, but should be fixable. The
latest CC= using one works there. As does the below.


--- a/Makefile
+++ b/Makefile
@@ -423,9 +423,27 @@ HOST_LFS_CFLAGS := $(shell getconf LFS_C
 HOST_LFS_LDFLAGS := $(shell getconf LFS_LDFLAGS 2>/dev/null)
 HOST_LFS_LIBS := $(shell getconf LFS_LIBS 2>/dev/null)
 
-ifneq ($(LLVM),)
-HOSTCC	= clang
-HOSTCXX	= clang++
+# powerpc and s390 don't yet work with LLVM as a whole
+ifeq ($(ARCH),powerpc)
+LLVM = 0
+endif
+ifeq ($(ARCH),s390)
+LLVM = 0
+endif
+
+# otherwise, if CC=clang, default to using LLVM to enable LTO
+CC_BASE := $(shell echo $(CC) | cut -b "1-5")
+ifeq ($(shell test "$(CC_BASE)" = "clang"; echo $$?),0)
+LLVM ?= 1
+LLVM_SFX := $(shell echo $(CC) | cut -b "6-")
+endif
+
+# if not set by now, do not use LLVM
+LLVM ?= 0
+
+ifneq ($(LLVM),0)
+HOSTCC	= clang$(LLVM_SFX)
+HOSTCXX	= clang++$(LLVM_SFX)
 else
 HOSTCC	= gcc
 HOSTCXX	= g++
@@ -442,15 +460,15 @@ KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS)
 
 # Make variables (CC, etc...)
 CPP		= $(CC) -E
-ifneq ($(LLVM),)
-CC		= clang
-LD		= ld.lld
-AR		= llvm-ar
-NM		= llvm-nm
-OBJCOPY		= llvm-objcopy
-OBJDUMP		= llvm-objdump
-READELF		= llvm-readelf
-STRIP		= llvm-strip
+ifneq ($(LLVM),0)
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
