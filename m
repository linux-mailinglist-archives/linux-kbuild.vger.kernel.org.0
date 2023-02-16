Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E619269A29C
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Feb 2023 00:45:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbjBPXpl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 16 Feb 2023 18:45:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbjBPXpk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Feb 2023 18:45:40 -0500
Received: from mail-ed1-x549.google.com (mail-ed1-x549.google.com [IPv6:2a00:1450:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92AB850AEC
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Feb 2023 15:45:38 -0800 (PST)
Received: by mail-ed1-x549.google.com with SMTP id fd23-20020a056402389700b004aaa054d189so3554658edb.11
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Feb 2023 15:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WEP0gdOIpvbUmMDY5eO53Tqx5XD06xr9LMwpgFaq1D0=;
        b=HPdFHv+aFKSsMbpRelJocXIyNNaSTVp3qtYGElmUkrSvs23G5uEnD+LPzwqpz2nqAX
         joUBeuv79NzEkPLc7mOxZoqwzVDUX2ycxbzeYQwSktyAJ44NBt7BtMjs+ZUCkCJbBGvh
         hMjDWAN0oodfC6ZSIMrPXtmSXIRP5wm4Cw2yQhBzH61FP8u0+Aj+P/vCkrSqwC/++qBV
         M1WDwrfKp3+bR+SMQbvIsRyz719j59IB0w/+Zbj4dTOfA7wrlaGroAwL4HUwMff9vMPe
         iAK38PEmmHmE2A0T11QxgDCFcAV7XQGZaPSySDNXm41D+0sxrmP2uphiQZZXVvsbIgFn
         Dkjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WEP0gdOIpvbUmMDY5eO53Tqx5XD06xr9LMwpgFaq1D0=;
        b=NSpm2tNTsF6Trxlvn3YUy6OUK2aUtglEuvOkQgGap9+Pa+ml6cYujw43OoYVgEQvQj
         SVHfiKVjV454nQ5TrIyShUeUB4fAtkIgm7/cmBg0sXb7Lnhk58EJ5W0uvde+1VB4uhhU
         HU5xdIQ1qTdV/QnVOfTteX/WXkv7/hi98W98P5c7rCKucSxrbHa3WgKVYI/pPOCN5H7v
         2flAZz9NU2U5PTM3IRIiaieu+fofqc98zpEu817gxcp+ayqvV9C7DjHZdL9WkxqtOG23
         tlPUQgbXb1r6uQY/o9wDZPYb+XIqJin+pV8bWdtAjVLHB54daSzuogbxyD8j00a7fvzl
         STEA==
X-Gm-Message-State: AO0yUKW1oZVT2TUgFNMxECB6V7vTPk1VSdCKP5WlnLpThktBt50UW3ut
        MnxuhP4Kz2m55EzsPXKadn46NW+5Uw==
X-Google-Smtp-Source: AK7set/LwR60te1ZQ71uZxsc1KgkcxZbDo0ZLCv+udJZ5Z75cmOSDIH+Ct1XO9+Xmd+GDajMudFF6OPa5g==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:34a3:b9c:4ef:ef85])
 (user=elver job=sendgmr) by 2002:a05:6402:2485:b0:4ad:739c:b38e with SMTP id
 q5-20020a056402248500b004ad739cb38emr1528006eda.1.1676591136985; Thu, 16 Feb
 2023 15:45:36 -0800 (PST)
Date:   Fri, 17 Feb 2023 00:45:21 +0100
In-Reply-To: <20230216234522.3757369-1-elver@google.com>
Mime-Version: 1.0
References: <20230216234522.3757369-1-elver@google.com>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
Message-ID: <20230216234522.3757369-2-elver@google.com>
Subject: [PATCH -tip v4 2/3] kasan: Treat meminstrinsic as builtins in
 uninstrumented files
From:   Marco Elver <elver@google.com>
To:     elver@google.com, Peter Zijlstra <peterz@infradead.org>
Cc:     Ingo Molnar <mingo@kernel.org>, Jakub Jelinek <jakub@redhat.com>,
        linux-toolchains@vger.kernel.org,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Alexander Potapenko <glider@google.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Where the compiler instruments meminstrinsics by generating calls to
__asan/__hwasan_ prefixed functions, let the compiler consider
memintrinsics as builtin again.

To do so, never override memset/memmove/memcpy if the compiler does the
correct instrumentation - even on !GENERIC_ENTRY architectures.

Fixes: 69d4c0d32186 ("entry, kasan, x86: Disallow overriding mem*() functions")
Signed-off-by: Marco Elver <elver@google.com>
---
v4:
* New patch.
---
 lib/Kconfig.kasan      | 9 +++++++++
 mm/kasan/shadow.c      | 5 ++++-
 scripts/Makefile.kasan | 9 +++++++++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
index be6ee6020290..fdca89c05745 100644
--- a/lib/Kconfig.kasan
+++ b/lib/Kconfig.kasan
@@ -49,6 +49,15 @@ menuconfig KASAN
 
 if KASAN
 
+config CC_HAS_KASAN_MEMINTRINSIC_PREFIX
+	def_bool (CC_IS_CLANG && $(cc-option,-fsanitize=kernel-address -mllvm -asan-kernel-mem-intrinsic-prefix=1)) || \
+		 (CC_IS_GCC && $(cc-option,-fsanitize=kernel-address --param asan-kernel-mem-intrinsic-prefix=1))
+	# Don't define it if we don't need it: compilation of the test uses
+	# this variable to decide how the compiler should treat builtins.
+	depends on !KASAN_HW_TAGS
+	help
+	  The compiler is able to prefix memintrinsics with __asan or __hwasan.
+
 choice
 	prompt "KASAN mode"
 	default KASAN_GENERIC
diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
index f8a47cb299cb..43b6a59c8b54 100644
--- a/mm/kasan/shadow.c
+++ b/mm/kasan/shadow.c
@@ -38,11 +38,14 @@ bool __kasan_check_write(const volatile void *p, unsigned int size)
 }
 EXPORT_SYMBOL(__kasan_check_write);
 
-#ifndef CONFIG_GENERIC_ENTRY
+#if !defined(CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX) && !defined(CONFIG_GENERIC_ENTRY)
 /*
  * CONFIG_GENERIC_ENTRY relies on compiler emitted mem*() calls to not be
  * instrumented. KASAN enabled toolchains should emit __asan_mem*() functions
  * for the sites they want to instrument.
+ *
+ * If we have a compiler that can instrument meminstrinsics, never override
+ * these, so that non-instrumented files can safely consider them as builtins.
  */
 #undef memset
 void *memset(void *addr, int c, size_t len)
diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
index fa9f836f8039..c186110ffa20 100644
--- a/scripts/Makefile.kasan
+++ b/scripts/Makefile.kasan
@@ -1,5 +1,14 @@
 # SPDX-License-Identifier: GPL-2.0
+
+ifdef CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX
+# Safe for compiler to generate meminstrinsic calls in uninstrumented files.
+CFLAGS_KASAN_NOSANITIZE :=
+else
+# Don't let compiler generate memintrinsic calls in uninstrumented files
+# because they are instrumented.
 CFLAGS_KASAN_NOSANITIZE := -fno-builtin
+endif
+
 KASAN_SHADOW_OFFSET ?= $(CONFIG_KASAN_SHADOW_OFFSET)
 
 cc-param = $(call cc-option, -mllvm -$(1), $(call cc-option, --param $(1)))
-- 
2.39.2.637.g21b0678d19-goog

