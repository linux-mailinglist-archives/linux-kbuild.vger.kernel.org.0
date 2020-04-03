Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6560E19CFB7
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Apr 2020 07:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731967AbgDCFSP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 3 Apr 2020 01:18:15 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:59337 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726024AbgDCFSP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Apr 2020 01:18:15 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 0335HC86000605;
        Fri, 3 Apr 2020 14:17:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 0335HC86000605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585891033;
        bh=zl/SnHIefZViz5A4+tN74d8D6ngYjxgigdH+W+cYlb0=;
        h=From:To:Cc:Subject:Date:From;
        b=b4CW45oxcja10CoKCxsuAziVBy8K7XFfOeokINUxBbIf5zYHH5D0IhLiNw3iOvdta
         lATWn/NeoGXp9N4ekTEIoBX/TaGFr9Eh9cuqCkCXPtLwi0JsDa1iP+zi4/3jKcreL+
         KPGq/qSILfMqTKPzzOGhUXV2/DG/R9PCvLkGoExdoJRRcgQPXATJ9oGkH7mq8GMTcB
         hw8RnBr9nIiHG+yFtL4QgXxmnHbRPPkTPKd1Fw+S42hvhn0BUnsXHURO+DGQueK8N3
         0T1HW27edyJGFcImOpzWahklK6TiUytSzl6mCpKIzgKFq62QnFeXDE8mbvFp1lq24W
         14IoypWou9h3w==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        clang-built-linux@googlegroups.com,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: support 'LLVM' to switch the default tools to Clang/LLVM
Date:   Fri,  3 Apr 2020 14:17:09 +0900
Message-Id: <20200403051709.22407-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

As Documentation/kbuild/llvm.rst implies, building the kernel with a
full set of LLVM tools gets very verbose and unwieldy.

Provide a single switch 'LLVM' to use Clang and LLVM tools instead of
GCC and Binutils. You can pass LLVM=1 from the command line or as an
environment variable. Then, Kbuild will use LLVM toolchains in your
PATH environment.

Please note LLVM=1 does not turn on the LLVM integrated assembler.
You need to explicitly pass AS=clang to use it. When the upstream
kernel is ready for the integrated assembler, I think we can make
it default.

We discussed what we need, and we agreed to go with a simple boolean
switch (https://lkml.org/lkml/2020/3/28/494).

Some items in the discussion:

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

- HOSTCC, HOSTCXX, etc.

  We can switch the host compilers in the same way:

  ifneq ($(LLVM),)
  HOSTCC       = clang
  HOSTCXX      = clang++
  else
  HOSTCC       = gcc
  HOSTCXX      = g++
  endif

  This may the right thing to do, but I could not make up my mind.
  Because we do not frequently switch the host compiler, a counter
  solution I had in my mind was to leave it to the default of the
  system.

  HOSTCC       = cc
  HOSTCXX      = c++

  Many distributions support update-alternatives to switch the default
  to GCC, Clang, or whatever, but reviewers were opposed to this
  approach. So, this commit does not touch the host tools.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/kbuild.rst |  5 +++++
 Documentation/kbuild/llvm.rst   |  5 +++++
 Makefile                        | 20 ++++++++++++++++----
 3 files changed, 26 insertions(+), 4 deletions(-)

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
index d6c79eb4e23e..4602369f6a4f 100644
--- a/Documentation/kbuild/llvm.rst
+++ b/Documentation/kbuild/llvm.rst
@@ -55,6 +55,11 @@ additional parameters to `make`.
 	  READELF=llvm-readelf HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar \\
 	  HOSTLD=ld.lld
 
+You can use a single switch `LLVM=1` to use LLVM utilities by default (except
+for building host programs).
+
+	make LLVM=1 HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar HOSTLD=ld.lld
+
 Getting Help
 ------------
 
diff --git a/Makefile b/Makefile
index c91342953d9e..6db89ecdd942 100644
--- a/Makefile
+++ b/Makefile
@@ -409,16 +409,28 @@ KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
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
-- 
2.17.1

