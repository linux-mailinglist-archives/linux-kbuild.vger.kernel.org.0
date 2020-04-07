Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEF101A152F
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Apr 2020 20:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726833AbgDGSow (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Apr 2020 14:44:52 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:37908 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgDGSow (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Apr 2020 14:44:52 -0400
Received: from grover.flets-west.jp (softbank126125134031.bbtec.net [126.125.134.31]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 037IhjLO002999;
        Wed, 8 Apr 2020 03:43:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 037IhjLO002999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1586285027;
        bh=XNTE7oEt9lkQ6ho43A7OCsPjG49xbLDUJDedlD0LjAE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=N1QRtUQFtTnark34hJEwsmB1H0bQyFIcOxtblQotSnSTaFoR0HirE0kBjk2BxdqGI
         js6hLexf7u+pZqPLGnUj3P/1citAM79Ao8bithdm4dPdjKSH8k2MaANxBlHNiHLtt2
         xMtagkHhe/zTfhNqrhuaIdcu4Lu4QT72QdNto5sPNwMjD1ejuVHYdO++gqZJBjGY24
         gUhJ9x6do5VPi7Y0Juvpx0I6G7hzkDhGgqPVbNS8NiAI4bbvHNRPx1hbL6gdk1olQ/
         5WEYp6LSgGRvy6i8b67v8OsY/ccilYxXEOxXNOwQ7NC2mP/6Jnpw8SHRItoM7I+t9i
         7ibEawmfexnSw==
X-Nifty-SrcIP: [126.125.134.31]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     clang-built-linux@googlegroups.com,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] kbuild: support LLVM=1 to switch the default tools to Clang/LLVM
Date:   Wed,  8 Apr 2020 03:43:36 +0900
Message-Id: <20200407184336.14612-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200407184336.14612-1-masahiroy@kernel.org>
References: <20200407184336.14612-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

As Documentation/kbuild/llvm.rst implies, building the kernel with a
full set of LLVM tools gets very verbose and unwieldy.

Provide a single switch LLVM=1 to use Clang and LLVM tools instead
of GCC and Binutils. You can pass it from the command line or as an
environment variable.

Please note LLVM=1 does not turn on the integrated assembler. You need
to pass LLVM_IA=1 to use it. When the upstream kernel is ready for the
integrated assembler, I think we can make it default.

We discussed what we need, and we agreed to go with a simple boolean
flag that switches both target and host tools:

  https://lkml.org/lkml/2020/3/28/494
  https://lkml.org/lkml/2020/4/3/43

Some items discussed, but not adopted:

- LLVM_DIR

  When multiple versions of LLVM are installed, I just thought supporting
  LLVM_DIR=/path/to/my/llvm/bin/ might be useful.

  CC      = $(LLVM_DIR)clang
  LD      = $(LLVM_DIR)ld.lld
    ...

  However, we can handle this by modifying PATH. So, we decided to not do
  this.

- LLVM_SUFFIX

  Some distributions (e.g. Debian) package specific versions of LLVM with
  naming conventions that use the version as a suffix.

  CC      = clang$(LLVM_SUFFIX)
  LD      = ld.lld(LLVM_SUFFIX)
    ...

  will allow a user to pass LLVM_SUFFIX=-11 to use clang-11 etc.,
  but the suffixed versions in /usr/bin/ are symlinks to binaries in
  /usr/lib/llvm-#/bin/, so this can also be handled by PATH.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com> # build
Tested-by: Nick Desaulniers <ndesaulniers@google.com>
---

Changes in v2:
  - Switch host compilers as well as requested

 Documentation/kbuild/kbuild.rst |  5 +++++
 Documentation/kbuild/llvm.rst   |  8 ++++++--
 Makefile                        | 29 +++++++++++++++++++++++------
 tools/objtool/Makefile          |  6 ++++++
 4 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index 510f38d7e78a..2d1fc03d346e 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -262,3 +262,8 @@ KBUILD_BUILD_USER, KBUILD_BUILD_HOST
 These two variables allow to override the user@host string displayed during
 boot and in /proc/version. The default value is the output of the commands
 whoami and host, respectively.
+
+LLVM
+----
+If this variable is set to 1, Kbuild will use Clang and LLVM utilities instead
+of GCC and GNU binutils to build the kernel.
diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
index 2b40afa58049..81f915c02c4c 100644
--- a/Documentation/kbuild/llvm.rst
+++ b/Documentation/kbuild/llvm.rst
@@ -47,8 +47,12 @@ example:
 LLVM Utilities
 --------------
 
-LLVM has substitutes for GNU binutils utilities. These can be invoked as
-additional parameters to `make`.
+LLVM has substitutes for GNU binutils utilities. Kbuild supports `LLVM=1`
+to enable them.
+
+	make LLVM=1
+
+They can be enabled individually. The full list of the parameters:
 
 	make CC=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \\
 	  OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump OBJSIZE=llvm-size \\
diff --git a/Makefile b/Makefile
index f9beb696d6d3..ffc1d2c618a7 100644
--- a/Makefile
+++ b/Makefile
@@ -399,8 +399,13 @@ HOST_LFS_CFLAGS := $(shell getconf LFS_CFLAGS 2>/dev/null)
 HOST_LFS_LDFLAGS := $(shell getconf LFS_LDFLAGS 2>/dev/null)
 HOST_LFS_LIBS := $(shell getconf LFS_LIBS 2>/dev/null)
 
-HOSTCC       = gcc
-HOSTCXX      = g++
+ifneq ($(LLVM),)
+HOSTCC	= clang
+HOSTCXX	= clang++
+else
+HOSTCC	= gcc
+HOSTCXX	= g++
+endif
 KBUILD_HOSTCFLAGS   := -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 \
 		-fomit-frame-pointer -std=gnu89 $(HOST_LFS_CFLAGS) \
 		$(HOSTCFLAGS)
@@ -409,16 +414,28 @@ KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
 KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS) $(HOSTLDLIBS)
 
 # Make variables (CC, etc...)
-LD		= $(CROSS_COMPILE)ld
-CC		= $(CROSS_COMPILE)gcc
 CPP		= $(CC) -E
+ifneq ($(LLVM),)
+CC		= clang
+LD		= ld.lld
+AR		= llvm-ar
+NM		= llvm-nm
+OBJCOPY		= llvm-objcopy
+OBJDUMP		= llvm-objdump
+READELF		= llvm-readelf
+OBJSIZE		= llvm-size
+STRIP		= llvm-strip
+else
+CC		= $(CROSS_COMPILE)gcc
+LD		= $(CROSS_COMPILE)ld
 AR		= $(CROSS_COMPILE)ar
 NM		= $(CROSS_COMPILE)nm
-STRIP		= $(CROSS_COMPILE)strip
 OBJCOPY		= $(CROSS_COMPILE)objcopy
 OBJDUMP		= $(CROSS_COMPILE)objdump
-OBJSIZE		= $(CROSS_COMPILE)size
 READELF		= $(CROSS_COMPILE)readelf
+OBJSIZE		= $(CROSS_COMPILE)size
+STRIP		= $(CROSS_COMPILE)strip
+endif
 PAHOLE		= pahole
 LEX		= flex
 YACC		= bison
diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index ee08aeff30a1..f591c4d1b6fe 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -3,9 +3,15 @@ include ../scripts/Makefile.include
 include ../scripts/Makefile.arch
 
 # always use the host compiler
+ifneq ($(LLVM),)
+HOSTAR	?= llvm-ar
+HOSTCC	?= clang
+HOSTLD	?= ld.lld
+else
 HOSTAR	?= ar
 HOSTCC	?= gcc
 HOSTLD	?= ld
+endif
 AR	 = $(HOSTAR)
 CC	 = $(HOSTCC)
 LD	 = $(HOSTLD)
-- 
2.17.1

