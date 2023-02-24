Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F9966A1868
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Feb 2023 10:00:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbjBXJAP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 24 Feb 2023 04:00:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbjBXJAK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Feb 2023 04:00:10 -0500
Received: from mail-ed1-x54a.google.com (mail-ed1-x54a.google.com [IPv6:2a00:1450:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74DD44FA94
        for <linux-kbuild@vger.kernel.org>; Fri, 24 Feb 2023 01:00:08 -0800 (PST)
Received: by mail-ed1-x54a.google.com with SMTP id co14-20020a0564020c0e00b004aab4319cedso17976918edb.2
        for <linux-kbuild@vger.kernel.org>; Fri, 24 Feb 2023 01:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AjV3k78q3XXhT1GHWCKfTuGEDWgoZOrO6Fv+xEYetZM=;
        b=EAGIOwQG78YZ4s5FvVIyWmJSdj/9+oRp2Z+JOiSUHX7UEHTavbHpWoSCToIN25ZVBh
         adJIFeTdGpgUgUlgPbR4Ed7A8vOy6wisOboBbYRYTdNzBqbwUwCAPRSSvoPl6Bh2MdOs
         DxBjn4j0OaOB/g65HjuRXZVQ1recSusgjrsuNkNrBC2P4Rnt9uhiw7JBjRqIzDCLljyl
         RPUozPvaTPHrb+3qYhJ4gLVhfC9eX0jRr0iYQ685BfQTxNz35kPbfNpdQBbihXcZZQ/x
         MfmXpF+Z0ozIFxGcdCWnKbZF7Ky7Dr+DKmP+UpWWa7yzYqJWwtqt9X0IGq+6o/8Df7+R
         thCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AjV3k78q3XXhT1GHWCKfTuGEDWgoZOrO6Fv+xEYetZM=;
        b=Tty2SMBEfBm7B0JGfv4hyyh6gxi7zqf4srbxyrUVXCXZ44YALNhveIxbCjGJLE0iWz
         XUXQaeb9Fk0JAxfjmkEKr3tbaqGbDyGyzJbUM7WeXRhXrlCgNn70lOMJ2BiIOzqQo3N0
         TCnclrqIQC3NDti3csKSnxdusu6P568CrKbmaJL18rqDQi5TDPBfNeLhjJmZ1anp1RWy
         zxXgcobD+iKL3JasPbsz9X1TL6u1ws++Mnfd6TNHvO1RheA76fmUHIS4m/2vSYdYh9Ji
         V2HJvQEFoD8jIXSIJO56GGRv39E8TSW0G77GcV2dqKgWkCkH5pK5/zOXEUSxbpgGcqOs
         PfTg==
X-Gm-Message-State: AO0yUKXJ+O0SchASBS7zAybohGHwlLQkonyqTUEkZd4nkT6WZauJnjj9
        kNqqI9ktvkqDBvBO7sn5DpiTuJl/WQ==
X-Google-Smtp-Source: AK7set+F0E0+hHGoUz0EDxGYty9hHOhM9cQA2n6bHMhFaQ+TBLOYuMWa+x6cFVA/P5UZsJl9kORIJ4SYdA==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:53eb:6453:f5f5:3bb9])
 (user=elver job=sendgmr) by 2002:a05:6402:3216:b0:4ad:7bb2:eefb with SMTP id
 g22-20020a056402321600b004ad7bb2eefbmr9255387eda.3.1677229206892; Fri, 24 Feb
 2023 01:00:06 -0800 (PST)
Date:   Fri, 24 Feb 2023 09:59:42 +0100
In-Reply-To: <20230224085942.1791837-1-elver@google.com>
Mime-Version: 1.0
References: <20230224085942.1791837-1-elver@google.com>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
Message-ID: <20230224085942.1791837-4-elver@google.com>
Subject: [PATCH v5 4/4] kasan, x86: Don't rename memintrinsics in
 uninstrumented files
From:   Marco Elver <elver@google.com>
To:     elver@google.com, Andrew Morton <akpm@linux-foundation.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Jakub Jelinek <jakub@redhat.com>,
        linux-toolchains@vger.kernel.org,
        Alexander Potapenko <glider@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Kees Cook <keescook@chromium.org>,
        linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
        linux-mm@kvack.org, linux-kbuild@vger.kernel.org,
        linux-hardening@vger.kernel.org
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

Now that memcpy/memset/memmove are no longer overridden by KASAN, we can
just use the normal symbol names in uninstrumented files.

Drop the preprocessor redefinitions.

Fixes: 69d4c0d32186 ("entry, kasan, x86: Disallow overriding mem*() functions")
Signed-off-by: Marco Elver <elver@google.com>
Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
---
v5:
* New patch.
---
 arch/x86/include/asm/string_64.h | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/arch/x86/include/asm/string_64.h b/arch/x86/include/asm/string_64.h
index 888731ccf1f6..c1e14cee0722 100644
--- a/arch/x86/include/asm/string_64.h
+++ b/arch/x86/include/asm/string_64.h
@@ -85,25 +85,6 @@ char *strcpy(char *dest, const char *src);
 char *strcat(char *dest, const char *src);
 int strcmp(const char *cs, const char *ct);
 
-#if (defined(CONFIG_KASAN) && !defined(__SANITIZE_ADDRESS__))
-/*
- * For files that not instrumented (e.g. mm/slub.c) we
- * should use not instrumented version of mem* functions.
- */
-
-#undef memcpy
-#define memcpy(dst, src, len) __memcpy(dst, src, len)
-#undef memmove
-#define memmove(dst, src, len) __memmove(dst, src, len)
-#undef memset
-#define memset(s, c, n) __memset(s, c, n)
-
-#ifndef __NO_FORTIFY
-#define __NO_FORTIFY /* FORTIFY_SOURCE uses __builtin_memcpy, etc. */
-#endif
-
-#endif
-
 #ifdef CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE
 #define __HAVE_ARCH_MEMCPY_FLUSHCACHE 1
 void __memcpy_flushcache(void *dst, const void *src, size_t cnt);
-- 
2.39.2.637.g21b0678d19-goog

