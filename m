Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1E8144098D
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 Oct 2021 16:34:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbhJ3OhK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 30 Oct 2021 10:37:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbhJ3OhJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 30 Oct 2021 10:37:09 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97BC2C061570;
        Sat, 30 Oct 2021 07:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=ba2xFt3kXSmSTLD8SqkglhCszGSJjIidpOhGBZZRwqs=; b=KxNTFF6MESt7Owjy7Rsimcsszl
        9FviqkuUnjHAEdEUcpb27yNW2R3RQl4BZ2BpEpgKnVGmCQgS43k8yyDkiEwOmJIXh9ny17Oqy49fk
        PDzxT4IF3ecJyJ+aS8I9Pl95V3b/lHt+cppYj8q6WWrmZVghxldeDp6c0yugf64yb86maeZhY0XW6
        M4ELbvaS5q42icbzRDk3cL6+bH2lFgfKSth6aBFEFmuvDPZNSdnDF8V0ZJ41dihgWJ3r1h5l6jHoC
        2yuB27lUIfCxkj/34CUOzYY9V4KFnELO6o+846IGnZxokUITPIP03oyMWbD8H19o9GstbZWmtYv4X
        f5ChCmVg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=worktop.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mgpQ1-002TG3-24; Sat, 30 Oct 2021 14:33:22 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
        id C89129816BA; Sat, 30 Oct 2021 16:33:11 +0200 (CEST)
Date:   Sat, 30 Oct 2021 16:33:11 +0200
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
Message-ID: <20211030143311.GH174730@worktop.programming.kicks-ass.net>
References: <YXqpFHeY26sEbort@hirez.programming.kicks-ass.net>
 <CAK7LNATUpgfKJvjp0+8H6VfMLMio9+BCoyj00mAO8FcaVGCqjg@mail.gmail.com>
 <YXqwZq53WUiTeqI7@hirez.programming.kicks-ass.net>
 <YXqyHhWGJfDkuxjP@hirez.programming.kicks-ass.net>
 <YXq72/yPe76DhDLu@hirez.programming.kicks-ass.net>
 <YXrhZoOgv5dtFMTs@archlinux-ax161>
 <20211028204855.GP174703@worktop.programming.kicks-ass.net>
 <CAKwvOd=x9E=7WcCiieso-CDiiU-wMFcXL4W3V5j8dq7BL5QT+w@mail.gmail.com>
 <YXu2z6FQ6Z7qtjbk@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YXu2z6FQ6Z7qtjbk@hirez.programming.kicks-ass.net>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


Latestest greatness... :-)

---
Subject: kbuild: Fix clang/llvm build infra

Debian (and derived) distros ship their compilers as -$ver suffixed
binaries. For gcc it is sufficent to use:

 $ make CC=gcc-12

However, clang builds (esp. clang-lto) need a whole array of tools to be
exactly right, leading to unweildy stuff like:

 $ make CC=clang-13 LD=ld.lld=14 AR=llvm-ar-13 NM=llvm-nm-13 OBJCOPY=llvm-objcopy-13 OBJDUMP=llvm-objdump-13 READELF=llvm-readelf-13 STRIP=llvm-strip-13 LLVM=1

which is, quite franktly, totally insane and unusable. Instead make
the CC variable DTRT, enabling one such as myself to use:

 $ make CC=clang-13

This also lets one quickly test different clang versions.
Additionally, also support path based LLVM suites like:

 $ make CC=/opt/llvm/bin/clang

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 Makefile                       |   45 +++++++++++++++++++++++++++---------
 tools/scripts/Makefile.include |   50 ++++++++++++++++++++++++++++-------------
 2 files changed, 68 insertions(+), 27 deletions(-)

--- a/Makefile
+++ b/Makefile
@@ -423,9 +423,29 @@ HOST_LFS_CFLAGS := $(shell getconf LFS_C
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
+CC_BASE := $(shell echo $(CC) | sed 's/.*\///')
+CC_NAME := $(shell echo $(CC_BASE) | cut -b "1-5")
+ifeq ($(shell test "$(CC_NAME)" = "clang"; echo $$?),0)
+LLVM ?= 1
+LLVM_PFX := $(shell echo $(CC) | sed 's/\(.*\/\)\?.*/\1/')
+LLVM_SFX := $(shell echo $(CC_BASE) | cut -b "6-")
+endif
+
+# if not set by now, do not use LLVM
+LLVM ?= 0
+
+ifneq ($(LLVM),0)
+HOSTCC	= $(LLVM_PFX)clang$(LLVM_SFX)
+HOSTCXX	= $(LLVM_PFX)clang++$(LLVM_SFX)
 else
 HOSTCC	= gcc
 HOSTCXX	= g++
@@ -442,15 +462,15 @@ KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS)
 
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
+CC		= $(LLVM_PFX)clang$(LLVM_SFX)
+LD		= $(LLVM_PFX)ld.lld$(LLVM_SFX)
+AR		= $(LLVM_PFX)llvm-ar$(LLVM_SFX)
+NM		= $(LLVM_PFX)llvm-nm$(LLVM_SFX)
+OBJCOPY		= $(LLVM_PFX)llvm-objcopy$(LLVM_SFX)
+OBJDUMP		= $(LLVM_PFX)llvm-objdump$(LLVM_SFX)
+READELF		= $(LLVM_PFX)llvm-readelf$(LLVM_SFX)
+STRIP		= $(LLVM_PFX)llvm-strip$(LLVM_SFX)
 else
 CC		= $(CROSS_COMPILE)gcc
 LD		= $(CROSS_COMPILE)ld
@@ -461,6 +481,7 @@ OBJDUMP		= $(CROSS_COMPILE)objdump
 READELF		= $(CROSS_COMPILE)readelf
 STRIP		= $(CROSS_COMPILE)strip
 endif
+
 PAHOLE		= pahole
 RESOLVE_BTFIDS	= $(objtree)/tools/bpf/resolve_btfids/resolve_btfids
 LEX		= flex
--- a/tools/scripts/Makefile.include
+++ b/tools/scripts/Makefile.include
@@ -51,12 +51,32 @@ define allow-override
     $(eval $(1) = $(2)))
 endef
 
-ifneq ($(LLVM),)
-$(call allow-override,CC,clang)
-$(call allow-override,AR,llvm-ar)
-$(call allow-override,LD,ld.lld)
-$(call allow-override,CXX,clang++)
-$(call allow-override,STRIP,llvm-strip)
+# powerpc and s390 don't yet work with LLVM as a whole
+ifeq ($(ARCH),powerpc)
+LLVM = 0
+endif
+ifeq ($(ARCH),s390)
+LLVM = 0
+endif
+
+# otherwise, if CC=clang, default to using LLVM to enable LTO
+CC_BASE := $(shell echo $(CC) | sed 's/.*\///')
+CC_NAME := $(shell echo $(CC_BASE) | cut -b "1-5")
+ifeq ($(shell test "$(CC_NAME)" = "clang"; echo $$?),0)
+LLVM ?= 1
+LLVM_PFX := $(shell echo $(CC) | sed 's/\(.*\/\)\?.*/\1/')
+LLVM_SFX := $(shell echo $(CC_BASE) | cut -b "6-")
+endif
+
+# if not set by now, do not use LLVM
+LLVM ?= 0
+
+ifneq ($(LLVM),0)
+$(call allow-override,CC,$(LLVM_PFX)clang$(LLVM_SFX))
+$(call allow-override,AR,$(LLVM_PFX)llvm-ar$(LLVM_SFX))
+$(call allow-override,LD,$(LLVM_PFX)ld.lld$(LLVM_SFX))
+$(call allow-override,CXX,$(LLVM_PFX)clang++$(LLVM_SFX))
+$(call allow-override,STRIP,$(LLVM_PFX)llvm-strip$(LLVM_SFX))
 else
 # Allow setting various cross-compile vars or setting CROSS_COMPILE as a prefix.
 $(call allow-override,CC,$(CROSS_COMPILE)gcc)
@@ -68,10 +88,10 @@ endif
 
 CC_NO_CLANG := $(shell $(CC) -dM -E -x c /dev/null | grep -Fq "__clang__"; echo $$?)
 
-ifneq ($(LLVM),)
-HOSTAR  ?= llvm-ar
-HOSTCC  ?= clang
-HOSTLD  ?= ld.lld
+ifneq ($(LLVM),0)
+HOSTAR  ?= $(LLVM_PFX)llvm-ar$(LLVM_SFX)
+HOSTCC  ?= $(LLVM_PFX)clang$(LLVM_SFX)
+HOSTLD  ?= $(LLVM_PFX)ld.lld$(LLVM_SFX)
 else
 HOSTAR  ?= ar
 HOSTCC  ?= gcc
@@ -79,11 +99,11 @@ HOSTLD  ?= ld
 endif
 
 # Some tools require Clang, LLC and/or LLVM utils
-CLANG		?= clang
-LLC		?= llc
-LLVM_CONFIG	?= llvm-config
-LLVM_OBJCOPY	?= llvm-objcopy
-LLVM_STRIP	?= llvm-strip
+CLANG		?= $(LLVM_PFX)clang$(LLVM_SFX)
+LLC		?= $(LLVM_PFX)llc$(LLVM_SFX)
+LLVM_CONFIG	?= $(LLVM_PFX)llvm-config$(LLVM_SFX)
+LLVM_OBJCOPY	?= $(LLVM_PFX)llvm-objcopy$(LLVM_SFX)
+LLVM_STRIP	?= $(LLVM_PFX)llvm-strip$(LLVM_SFX)
 
 ifeq ($(CC_NO_CLANG), 1)
 EXTRA_WARNINGS += -Wstrict-aliasing=3
