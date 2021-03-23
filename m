Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E82B345E5D
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Mar 2021 13:42:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231296AbhCWMlk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 23 Mar 2021 08:41:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:38306 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231309AbhCWMlT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Mar 2021 08:41:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A7790600CC;
        Tue, 23 Mar 2021 12:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616503277;
        bh=472SlIvDxZ+AwgZzUK/wefpcRSeIob0JLIzRiCW/rPk=;
        h=From:To:Cc:Subject:Date:From;
        b=Tz0RmbNAz5hhzDcgOnrNBLJaOWXLkq3jkVK9w6VKsju9Fkb3to3orHRK3B2Zkduj8
         1lJt2kcT+6fSxPk1+17itpCpHSr+QeT5nS9n5Jd4YdasDS9InYZv5F1cwIHgWotYO4
         XrwQBMMHnJf76+02qFSepzZz4MubLFYddgeD9mZ8WErb412nhZPqqF4XzZLl2WNcQ7
         nt9HVB2fCThvfuzgiiakObsNor2L7gJ6jHLEC9YtxnUsLyvK68kmIEkecoxBTpCQ6o
         VcOMP69gF8LWyD9/hztYaEGy2M9pTbUJMtuMBG/VJK1qNT6zJ1Jr4ba2RnAJsylGuJ
         V1A5aJywwtKhA==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Alexander Potapenko <glider@google.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Marco Elver <elver@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: [PATCH] kasan: fix hwasan build for gcc
Date:   Tue, 23 Mar 2021 13:41:04 +0100
Message-Id: <20210323124112.1229772-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

gcc-11 adds support for -fsanitize=kernel-hwaddress, so it becomes
possible to enable CONFIG_KASAN_SW_TAGS.

Unfortunately this fails to build at the moment, because the
corresponding command line arguments use llvm specific syntax.

Change it to use the cc-param macro instead, which works on both
clang and gcc.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 scripts/Makefile.kasan | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
index 1e000cc2e7b4..0a2789783d1b 100644
--- a/scripts/Makefile.kasan
+++ b/scripts/Makefile.kasan
@@ -36,14 +36,14 @@ endif # CONFIG_KASAN_GENERIC
 ifdef CONFIG_KASAN_SW_TAGS
 
 ifdef CONFIG_KASAN_INLINE
-    instrumentation_flags := -mllvm -hwasan-mapping-offset=$(KASAN_SHADOW_OFFSET)
+    instrumentation_flags := $(call cc-param,hwasan-mapping-offset=$(KASAN_SHADOW_OFFSET))
 else
-    instrumentation_flags := -mllvm -hwasan-instrument-with-calls=1
+    instrumentation_flags := $(call cc-param,hwasan-instrument-with-calls=1)
 endif
 
 CFLAGS_KASAN := -fsanitize=kernel-hwaddress \
-		-mllvm -hwasan-instrument-stack=$(CONFIG_KASAN_STACK) \
-		-mllvm -hwasan-use-short-granules=0 \
+		$(call cc-param,hwasan-instrument-stack=$(CONFIG_KASAN_STACK)) \
+		$(call cc-param,hwasan-use-short-granules=0) \
 		$(instrumentation_flags)
 
 endif # CONFIG_KASAN_SW_TAGS
-- 
2.29.2

