Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1285AC42A
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Sep 2019 04:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732723AbfIGCx1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 6 Sep 2019 22:53:27 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:30159 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726940AbfIGCx0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Sep 2019 22:53:26 -0400
Received: from grover.flets-west.jp (softbank126125143222.bbtec.net [126.125.143.222]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id x872qesW001419;
        Sat, 7 Sep 2019 11:52:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x872qesW001419
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1567824760;
        bh=PZoVAwxKRkB7MOfjTWAYsfkZTV9kTLCPSHxAD3utiuY=;
        h=From:To:Cc:Subject:Date:From;
        b=EonH+7o5xKFuLJ5IxqfdqYayAom+ScKrLvK7VWcGlHqNtGlulbEYWqKAEI6ekCkUi
         nLtSLhAW+8615lzL5tUNGXLK8gxQ4wr4CzCUN97Qnj5D6BcRnPFjCr0WyaDEmuVoDP
         M4/ApHJh2pCXelDO7eC+bjEm0RyV/pZ6zX9xBWJYTWZMQY5l6Q71vg/QxUUOtzyJou
         JiyCJz/NvJVnvIpAJzovT2SFoPfxNKeWLCuIA2Sm+AlrGAfCKN7KGdJC1DW1SbxQE3
         bKlQ8aJj5Nj4spQkuNEKpxAy9N5cMgDk9HZA0gNEhCuFjRFf9zI+GpB+g3gqPr27gV
         NQ1PIr8KuWHjw==
X-Nifty-SrcIP: [126.125.143.222]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Subject: [PATCH v2] kbuild: allow Clang to find unused static inline functions for W=1 build
Date:   Sat,  7 Sep 2019 11:52:36 +0900
Message-Id: <20190907025236.31393-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

GCC and Clang have different policy for -Wunused-function; GCC does not
warn unused static inline functions at all whereas Clang does if they
are defined in source files instead of included headers although it has
been suppressed since commit abb2ea7dfd82 ("compiler, clang: suppress
warning for unused static inline functions").

We often miss to delete unused functions where 'static inline' is used
in *.c files since there is no tool to detect them. Unused code remains
until somebody notices. For example, commit 075ddd75680f ("regulator:
core: remove unused rdev_get_supply()").

Let's remove __maybe_unused from the inline macro to allow Clang to
start finding unused static inline functions. For now, we do this only
for W=1 build since it is not a good idea to sprinkle warnings for the
normal build (e.g. 35 warnings for arch/x86/configs/x86_64_defconfig).

My initial attempt was to add -Wno-unused-function for no W= build
(https://lore.kernel.org/patchwork/patch/1120594/)

Nathan Chancellor pointed out that would weaken Clang's checks since
we would no longer get -Wunused-function without W=1. It is true GCC
would catch unused static non-inline functions, but it would weaken
Clang as a standalone compiler, at least.

Hence, here is a counter implementation. The current problem is, W=...
only controls compiler flags, which are globally effective. There is
no way to address only 'static inline' functions.

This commit defines KBUILD_EXTRA_WARN[123] corresponding to W=[123].
When KBUILD_EXTRA_WARN1 is defined, __maybe_unused is omitted from
the 'inline' macro.

The new macro __inline_maybe_unused makes the code a bit uglier, so I
hope we can remove it entirely after fixing most of the warnings.

If you contribute to code clean-up, please run "make CC=clang W=1"
and check -Wunused-function warnings. You will find lots of unused
functions.

Some of them are false-positives because the call-sites are disabled
by #ifdef. I do not like to abuse the inline keyword for suppressing
unused-function warnings because it is intended to be a hint for the
compiler optimization. I prefer #ifdef around the definition, or
__maybe_unused if #ifdef would make the code too ugly.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>
---

Changes in v2:
 - Rebase on top of https://patchwork.kernel.org/patch/11124933/

 include/linux/compiler_types.h | 20 ++++++++++++++------
 scripts/Makefile.extrawarn     |  6 ++++++
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index 599c27b56c29..b056a40116da 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -130,10 +130,6 @@ struct ftrace_likely_data {
 
 /*
  * Force always-inline if the user requests it so via the .config.
- * GCC does not warn about unused static inline functions for
- * -Wunused-function.  This turns out to avoid the need for complex #ifdef
- * directives.  Suppress the warning in clang as well by using "unused"
- * function attribute, which is redundant but not harmful for gcc.
  * Prefer gnu_inline, so that extern inline functions do not emit an
  * externally visible function. This makes extern inline behave as per gnu89
  * semantics rather than c99. This prevents multiple symbol definition errors
@@ -144,15 +140,27 @@ struct ftrace_likely_data {
  */
 #if !defined(CONFIG_OPTIMIZE_INLINING)
 #define inline inline __attribute__((__always_inline__)) __gnu_inline \
-	__maybe_unused notrace
+	__inline_maybe_unused notrace
 #else
 #define inline inline                                    __gnu_inline \
-	__maybe_unused notrace
+	__inline_maybe_unused notrace
 #endif
 
 #define __inline__ inline
 #define __inline   inline
 
+/*
+ * GCC does not warn about unused static inline functions for -Wunused-function.
+ * Suppress the warning in clang as well by using __maybe_unused, but enable it
+ * for W=1 build. This will allow clang to find unused functions. Remove the
+ * __inline_maybe_unused entirely after fixing most of -Wunused-function warnings.
+ */
+#ifdef KBUILD_EXTRA_WARN1
+#define __inline_maybe_unused
+#else
+#define __inline_maybe_unused __maybe_unused
+#endif
+
 /*
  * Rather then using noinline to prevent stack consumption, use
  * noinline_for_stack instead.  For documentation reasons.
diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 53eb7e0c6a5a..ecddf83ac142 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -36,6 +36,8 @@ KBUILD_CFLAGS += $(call cc-option, -Wstringop-truncation)
 KBUILD_CFLAGS += -Wno-missing-field-initializers
 KBUILD_CFLAGS += -Wno-sign-compare
 
+KBUILD_CPPFLAGS += -DKBUILD_EXTRA_WARN1
+
 else
 
 # Some diagnostics enabled by default are noisy.
@@ -65,6 +67,8 @@ KBUILD_CFLAGS += -Wsign-compare
 KBUILD_CFLAGS += $(call cc-option, -Wmaybe-uninitialized)
 KBUILD_CFLAGS += $(call cc-option, -Wunused-macros)
 
+KBUILD_CPPFLAGS += -DKBUILD_EXTRA_WARN2
+
 endif
 
 #
@@ -82,4 +86,6 @@ KBUILD_CFLAGS += -Wredundant-decls
 KBUILD_CFLAGS += -Wswitch-default
 KBUILD_CFLAGS += $(call cc-option, -Wpacked-bitfield-compat)
 
+KBUILD_CPPFLAGS += -DKBUILD_EXTRA_WARN3
+
 endif
-- 
2.17.1

