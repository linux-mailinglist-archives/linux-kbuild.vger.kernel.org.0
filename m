Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CFB39FA0B
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2019 07:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbfH1Fzr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Aug 2019 01:55:47 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:41721 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725959AbfH1Fzr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Aug 2019 01:55:47 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id x7S5sQl2027215;
        Wed, 28 Aug 2019 14:54:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x7S5sQl2027215
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1566971668;
        bh=qJTg+AM4SVuAt9eaitUPepAhylXNc0xd+RxSAWBzAtU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kIYIbU4AbUD9farUf9eBzCAwYeQBzv+AHzrT/s/jZzazBkLlCimwBpkOX3TnC4FKh
         fIixvoywpVrCh1ZGv4x6EpYWUtm7ICQuIlvDhSRZp3SeYN824z0VVpVKNsEfjZpOnm
         +0O80CMd1F7YEREygkWtN+GESpCkcx6fJOxSf8JvJMG03qZORVXArkaiJW3kotqgyM
         ZhjtDXHNXdnw/1Z6iZKZ/0sIIosoyX+8dd2+f2KMn6Eh5pDYtYrw/albHLiC1RyoC2
         VRVA6THt4ZOlOyl03q/T0xknxIjCjnz3NAROjIHB8McQbuKpgYbkE3LpxJ8bcZGAwZ
         HduYVIGixbcpg==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Kees Cook <keescook@chromium.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Sven Schnelle <svens@stackframe.org>,
        Xiaozhou Liu <liuxiaozhou@bytedance.com>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] kbuild: allow Clang to find unused static inline functions for W=1 build
Date:   Wed, 28 Aug 2019 14:54:25 +0900
Message-Id: <20190828055425.24765-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828055425.24765-1-yamada.masahiro@socionext.com>
References: <20190828055425.24765-1-yamada.masahiro@socionext.com>
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
normal build.

My initial attempt was to add -Wno-unused-function for no W=1 build
(https://lore.kernel.org/patchwork/patch/1120594/)

Nathan Chancellor pointed out that would weaken Clang's checks since
we would no longer get -Wunused-function without W=1. It is true GCC
would detect unused static non-inline functions, but it would weaken
Clang as a standalone compiler at least.

Here is a counter implementation. The current problem is, W=... only
controls compiler flags, which are globally effective. There is no way
to narrow the scope to only 'static inline' functions.

This commit defines KBUILD_EXTRA_WARN[123] corresponding to W=[123].
When KBUILD_EXTRA_WARN1 is defined, __maybe_unused is omitted from
the 'inline' macro.

This makes the code a bit uglier, so personally I do not want to carry
this forever. If we can manage to fix most of the warnings, we can
drop this entirely, then enable -Wunused-function all the time.

If you contribute to code clean-up, please run "make CC=clang W=1"
and check -Wunused-function warnings. You will find lots of unused
functions.

Some of them are false-positives because the call-sites are disabled
by #ifdef. I do not like to abuse the inline keyword for suppressing
unused-function warnings because it is intended to be a hint for the
compiler optimization. I prefer #ifdef around the definition, or
__maybe_unused if #ifdef would make the code too ugly.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

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
index 1fa53968e292..3af1770497fd 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -28,6 +28,8 @@ KBUILD_CFLAGS += $(call cc-option, -Wstringop-truncation)
 KBUILD_CFLAGS += -Wno-missing-field-initializers
 KBUILD_CFLAGS += -Wno-sign-compare
 
+KBUILD_CPPFLAGS += -DKBUILD_EXTRA_WARN1
+
 else
 
 # W=1 also stops suppressing some warnings
@@ -56,6 +58,8 @@ KBUILD_CFLAGS += -Wsign-compare
 KBUILD_CFLAGS += $(call cc-option, -Wmaybe-uninitialized)
 KBUILD_CFLAGS += $(call cc-option, -Wunused-macros)
 
+KBUILD_CPPFLAGS += -DKBUILD_EXTRA_WARN2
+
 endif
 
 #
@@ -73,4 +77,6 @@ KBUILD_CFLAGS += -Wredundant-decls
 KBUILD_CFLAGS += -Wswitch-default
 KBUILD_CFLAGS += $(call cc-option, -Wpacked-bitfield-compat)
 
+KBUILD_CPPFLAGS += -DKBUILD_EXTRA_WARN3
+
 endif
-- 
2.17.1

