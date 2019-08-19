Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D700921B2
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2019 12:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727319AbfHSKw6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Aug 2019 06:52:58 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:19333 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbfHSKw5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Aug 2019 06:52:57 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id x7JAps3U023174;
        Mon, 19 Aug 2019 19:51:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x7JAps3U023174
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1566211915;
        bh=uAr7g3dUlNXQ7fN/nZvH1d8U2EQBEBFwzuJnQ8Wz3oU=;
        h=From:To:Cc:Subject:Date:From;
        b=ff7Ixy/f25QXv5KncFABS/pABvuk1I/MIXIBj5f3+90JOltA+Ka/pTfOyhKT5yKoV
         Mu/xzkLxYMMrRYrRAqiiuabc68TyAwnZjYNReWf3K6jMTIW+I4C7W5L9K4wup0nTtt
         7rMlL/yLEPOw4RfoFvNNleN5Cj0CGXAQ+o1ZrJnaTaQEhPq111lGn/KoCC4JAy4ddt
         7gc18oO7AKpJpJfCtM18M2sOPt8bUWkSR96jMAupet7jkJrOVrriuC3eBmRUbniH0n
         82cQJf5M5Yz6+IratFRHqwKoudYON59/Fydi5XgDuOnsOipXGMl005tAVlF6o6SCQo
         4gIBlM0StSuCw==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Borislav Petkov <bp@suse.de>,
        Kees Cook <keescook@chromium.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Paul Burton <paul.burton@mips.com>,
        Xiaozhou Liu <liuxiaozhou@bytedance.com>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: enable unused-function warnings for W= build with Clang
Date:   Mon, 19 Aug 2019 19:51:38 +0900
Message-Id: <20190819105138.5053-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

GCC and Clang have different policy for -Wunused-function; GCC does
not report unused-function warnings at all for the functions marked
as 'static inline'. Clang does report unused-function warnings if they
are defined in source files instead of headers.

We could use Clang for detecting unused functions, but it has been
suppressed since commit abb2ea7dfd82 ("compiler, clang: suppress
warning for unused static inline functions").

So, we never notice left-over code if functions in .c files are
marked as inline.

Let's remove __maybe_unused from the inline macro. As always, it is
not a good idea to sprinkle warnings for the normal build. So, these
warnings will be shown for the W= build.

If you contribute to code clean-up, please run "make CC=clang W=1"
and check -Wunused-function warnings. You will find lots of unused
functions.

Some of them are false-positives because the call-sites are disabled
by #ifdef. I do not like to abuse the inline keyword for suppressing
unused-function warnings because it might affect the compiler's
optimization. When I need to fix unused-functions warnings, I prefer
adding #ifdef or __maybe_unused to function definitions.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 include/linux/compiler_types.h | 10 ++--------
 scripts/Makefile.extrawarn     |  1 +
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index 599c27b56c29..14de8d0162fb 100644
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
@@ -143,11 +139,9 @@ struct ftrace_likely_data {
  * (which would break users of __always_inline).
  */
 #if !defined(CONFIG_OPTIMIZE_INLINING)
-#define inline inline __attribute__((__always_inline__)) __gnu_inline \
-	__maybe_unused notrace
+#define inline inline __attribute__((__always_inline__)) __gnu_inline notrace
 #else
-#define inline inline                                    __gnu_inline \
-	__maybe_unused notrace
+#define inline inline                                    __gnu_inline notrace
 #endif
 
 #define __inline__ inline
diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index a74ce2e3c33e..92f542797e03 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -70,5 +70,6 @@ KBUILD_CFLAGS += -Wno-initializer-overrides
 KBUILD_CFLAGS += -Wno-format
 KBUILD_CFLAGS += -Wno-sign-compare
 KBUILD_CFLAGS += -Wno-format-zero-length
+KBUILD_CFLAGS += -Wno-unused-function
 endif
 endif
-- 
2.17.1

