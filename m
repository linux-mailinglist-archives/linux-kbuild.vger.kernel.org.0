Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A13503687CC
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Apr 2021 22:19:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236915AbhDVUUW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 22 Apr 2021 16:20:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:59420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236896AbhDVUUW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Apr 2021 16:20:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 91DEC60BBB;
        Thu, 22 Apr 2021 20:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619122787;
        bh=pdRsc4FICGEMSWS9jEaCj4oziHTjotNknXiAZpjKryU=;
        h=From:To:Cc:Subject:Date:From;
        b=EGSr2oJERuzEyuPj2cTR6pIK06e+9W2PVn6+eiB/pNPjen/Mc+OKxJnDb347At4SA
         10+0M774zzTZXU2MPJBONaJPEPkupXzcgC/ZYa+Unc4XP0AuIpYGPGAT3PVruWGqh/
         RYQ+m/7OJ8ljB5z8Mx5iLOlUZz+XlzRfKcJKYu/Z/yI/BeDdXpTmSSf3o+mzDoXGo7
         6z3gp1r/q7qcLT2V0JmD25rWhlb1u7ieI1sCuJxtuENOX1DlBP1joi/sKfvC5JuTjy
         I+/QL3qjp2+dfQoid4F/VlzabHDaaLoWZmUVeQlitNP87uwIkMH4Sdm3eNw1ldZnYg
         czfKN15eJWhVA==
From:   Nathan Chancellor <nathan@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] kbuild: Add $(KBUILD_HOSTLDFLAGS) to 'has_libelf' test
Date:   Thu, 22 Apr 2021 13:19:14 -0700
Message-Id: <20210422201914.3682494-1-nathan@kernel.org>
X-Mailer: git-send-email 2.31.1.362.g311531c9de
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Normally, invocations of $(HOSTCC) include $(KBUILD_HOSTLDFLAGS), which
in turn includes $(HOSTLDFLAGS), which allows users to pass in their own
flags when linking. However, the 'has_libelf' test does not, meaning
that if a user requests a specific linker via HOSTLDFLAGS=-fuse-ld=...,
it is not respected and the build might error.

For example, if a user building with clang wants to use all of the LLVM
tools without any GNU tools, they might remove all of the GNU tools from
their system or PATH then build with

$ make HOSTLDFLAGS=-fuse-ld=lld LLVM=1 LLVM_IAS=1

which says use all of the LLVM tools, the integrated assembler, and
ld.lld for linking host executables. Without this change, the build will
error because $(HOSTCC) uses its default linker, rather than the one
requested via -fuse-ld=..., which is GNU ld in clang's case in a default
configuration.

error: Cannot generate ORC metadata for CONFIG_UNWINDER_ORC=y, please
install libelf-dev, libelf-devel or elfutils-libelf-devel
make[1]: *** [Makefile:1260: prepare-objtool] Error 1

Add $(KBUILD_HOSTLDFLAGS) to the 'has_libelf' test so that the linker
choice is respected.

Link: https://github.com/ClangBuiltLinux/linux/issues/479
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index bc19584fee59..1535b32c8baa 100644
--- a/Makefile
+++ b/Makefile
@@ -1092,7 +1092,7 @@ export mod_sign_cmd
 HOST_LIBELF_LIBS = $(shell pkg-config libelf --libs 2>/dev/null || echo -lelf)
 
 has_libelf = $(call try-run,\
-               echo "int main() {}" | $(HOSTCC) -xc -o /dev/null $(HOST_LIBELF_LIBS) -,1,0)
+               echo "int main() {}" | $(HOSTCC) $(KBUILD_HOSTLDFLAGS) -xc -o /dev/null $(HOST_LIBELF_LIBS) -,1,0)
 
 ifdef CONFIG_STACK_VALIDATION
   ifeq ($(has_libelf),1)

base-commit: bf05bf16c76bb44ab5156223e1e58e26dfe30a88
-- 
2.31.1.362.g311531c9de

