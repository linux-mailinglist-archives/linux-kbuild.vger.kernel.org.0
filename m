Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8772E43E276
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Oct 2021 15:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230297AbhJ1Nrp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 Oct 2021 09:47:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbhJ1Nro (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Oct 2021 09:47:44 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A212C061570;
        Thu, 28 Oct 2021 06:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=RseIqWUemXBQX2ZvxpTektn5wh2Dt3uxLghf6LdyvGI=; b=rcJB8/YGkFoVKJhJpe/4YdGPn+
        pBn68RiGAv0WKkT5phwJNeWyaa8gLk8Ffn9zWBtI26ZCLRoGwMzbxJ+uZs9ASbSiInNUvt1+Nodn3
        BbSE4rg0mjy9trP4GMt8YK7rmXJpLDwbAXK3F5iLnVSSX6l0A6UmngV+aZtdDmwx/zQvYC4XUbjze
        BgEDDhohhoIqevQa/bYDc7GJWpe40RYSTqMxjbc4E5ylMRcQ1hG0B7NtProsd1YAXBjhxv+jw6LXW
        5JXcLfE2rcAjg0SaG4ABudSmAp9cXTTB/8FnZfMUSjvvx/77RgThYErHyLSlmbhpK6R7PfU+BT9N9
        Wn/mwjPA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mg5h8-000njz-Fy; Thu, 28 Oct 2021 13:44:09 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 917313001BF;
        Thu, 28 Oct 2021 15:43:48 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 43F71200D2747; Thu, 28 Oct 2021 15:43:48 +0200 (CEST)
Date:   Thu, 28 Oct 2021 15:43:48 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     nathan@kernel.org, ndesaulniers@google.com, masahiroy@kernel.org,
        michal.lkml@markovi.net
Cc:     x86@kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Subject: [PATCH] kbuild: Support clang-$ver builds
Message-ID: <YXqpFHeY26sEbort@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

Debian (and derived) distros ship their compilers as -$ver suffixed
binaries. For gcc it is sufficent to use:

 $ make CC=gcc-12

However, clang builds (esp. clang-lto) need a whole array of tools to be
exactly right, leading to unweildy stuff like:

 $ make CC=clang-13 LD=ld.lld=14 AR=llvm-ar-13 NM=llvm-nm-13 OBJCOPY=llvm-objcopy-13 OBJDUMP=llvm-objdump-13 READELF=llvm-readelf-13 STRIP=llvm-strip-13 LLVM=1

which is, quite franktly, totally insane and unusable. Instead use the
already mandatory LLVM variable to convey this, enabling one such as
myself to use:

 $ make LLVM=-13

This also lets one quickly test different clang versions.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 Makefile                       | 27 +++++++++++++++++----------
 tools/scripts/Makefile.include | 23 +++++++++++++++--------
 2 files changed, 32 insertions(+), 18 deletions(-)

diff --git a/Makefile b/Makefile
index 30c7c81d0437..a38f38f7f190 100644
--- a/Makefile
+++ b/Makefile
@@ -423,9 +423,16 @@ HOST_LFS_CFLAGS := $(shell getconf LFS_CFLAGS 2>/dev/null)
 HOST_LFS_LDFLAGS := $(shell getconf LFS_LDFLAGS 2>/dev/null)
 HOST_LFS_LIBS := $(shell getconf LFS_LIBS 2>/dev/null)
 
+# When LLVM=-ver use clang-ver binaries, useful for Debian and other
+# multi-version setups
+ifeq ($(shell test $(LLVM) -lt 0; echo $$?),0)
+LLVM_SFX=$(LLVM)
+export LLVM_SFX
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
@@ -443,14 +450,14 @@ KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS) $(HOSTLDLIBS)
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
diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
index 071312f5eb92..a2b53cc91378 100644
--- a/tools/scripts/Makefile.include
+++ b/tools/scripts/Makefile.include
@@ -51,12 +51,19 @@ define allow-override
     $(eval $(1) = $(2)))
 endef
 
+# When LLVM=-ver use clang-ver binaries, useful for Debian and other
+# multi-version setups
+ifeq ($(shell test $(LLVM) -lt 0; echo $$?),0)
+LLVM_SFX=$(LLVM)
+export LLVM_SFX
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
@@ -69,9 +76,9 @@ endif
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
