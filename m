Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4653168F748
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Feb 2023 19:42:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230407AbjBHSmo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Feb 2023 13:42:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230335AbjBHSmn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Feb 2023 13:42:43 -0500
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02C6F17CFA
        for <linux-kbuild@vger.kernel.org>; Wed,  8 Feb 2023 10:42:42 -0800 (PST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-4fa63c84621so186156017b3.20
        for <linux-kbuild@vger.kernel.org>; Wed, 08 Feb 2023 10:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=muGKsBQpDMjO2rXBhVjlNe2+4h4S1u+JGQBqWajmnMY=;
        b=HxBkYsCyEckUoHuvqVZ5uRlBgYs41lGpzh9bJv5RycbHZDeZvkaOSzuAVFVt1ocvW2
         GUtHG6k3mrzIxEGxYLtddoREAd1jMYdlSfDEJ+H9rP1xQ3pUllwwQPEUZH1vYPa5ulra
         2/+qrCz0H5FEJKh2E1cpdMySNo/1cFVZG7fO8PhEVzQPZ3sEBVYBhs0rgDlHIWhU0+kO
         Yf9vVPbuo9u+AY1zPiE/WEBlftJL/MvXqqHw8ylsVXWkRAYZDDqRFx62tiV63uOOqLZe
         kMWoCoa+EkILLVIvTVknwJXc+UnFkKSqYWNUe0meeh0pNPjtvUMwge+IQDK+CpWpGHW4
         OFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=muGKsBQpDMjO2rXBhVjlNe2+4h4S1u+JGQBqWajmnMY=;
        b=e1C+z6TCoPkpA/Zls8eOY1BsqeuPMHvT4kCBEV72H7ZqEpFaBTzmeYYWpB5/CE+SIs
         UvaIZoIn94BV+1buZRH9IICe3cNqBZaNIKlRmFql7KNPUkrHOazC3lP+A5t05J92TyDL
         pHARWUjdLeNYQxAQqPu1f6bopb/K3fu2bU7HcqCmaikq5JKBlvL/oXrr9qtgI23KIc5Y
         RDEWiJ85J/6idxFMHEqxYcznHAVmDl6NNSe2KffBihBTTbCuyendTgcZrHHXOseqE9wr
         EQDlBjV2mHexVwM+8+I1w/W/H4/3yrLnFwOv8wYtcCabIMoYBsNpRF91scaBWYhqR0SU
         GYNw==
X-Gm-Message-State: AO0yUKWvGehx3VlLQ9xhwa6HtWR1pAG/SQcbFctLALF7i7KOcEU18zqx
        jJWnm9TCexfyqrv87cF08fRCLcPteA==
X-Google-Smtp-Source: AK7set+sdo20Ns8wgmN9XioMhWZZSNyxwANqkltuYnMXh+mc1E0tbFwUXNb6//5ZYyBNu7g9KmRAOxcLlw==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:a0ba:1bc4:8b19:5b22])
 (user=elver job=sendgmr) by 2002:a81:1312:0:b0:528:37bd:c122 with SMTP id
 18-20020a811312000000b0052837bdc122mr10ywt.5.1675881760758; Wed, 08 Feb 2023
 10:42:40 -0800 (PST)
Date:   Wed,  8 Feb 2023 19:42:03 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230208184203.2260394-1-elver@google.com>
Subject: [PATCH -tip] kasan: Emit different calls for instrumentable memintrinsics
From:   Marco Elver <elver@google.com>
To:     elver@google.com, Peter Zijlstra <peterz@infradead.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Alexander Potapenko <glider@google.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-toolchains@vger.kernel.org
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

Clang 15 will provide an option to prefix calls to memcpy/memset/memmove
with __asan_ in instrumented functions: https://reviews.llvm.org/D122724

GCC does not yet have similar support.

Use it to regain KASAN instrumentation of memcpy/memset/memmove on
architectures that require noinstr to be really free from instrumented
mem*() functions (all GENERIC_ENTRY architectures).

Fixes: 69d4c0d32186 ("entry, kasan, x86: Disallow overriding mem*() functions")
Signed-off-by: Marco Elver <elver@google.com>
---

The Fixes tag is just there to show the dependency, and that people
shouldn't apply this patch without 69d4c0d32186.

---
 scripts/Makefile.kasan | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
index b9e94c5e7097..78336b04c077 100644
--- a/scripts/Makefile.kasan
+++ b/scripts/Makefile.kasan
@@ -38,6 +38,13 @@ endif
 
 CFLAGS_KASAN += $(call cc-param,asan-stack=$(stack_enable))
 
+ifdef CONFIG_GENERIC_ENTRY
+# Instrument memcpy/memset/memmove calls by using instrumented __asan_mem*()
+# instead. With compilers that don't support this option, compiler-inserted
+# memintrinsics won't be checked by KASAN.
+CFLAGS_KASAN += $(call cc-param,asan-kernel-mem-intrinsic-prefix)
+endif
+
 endif # CONFIG_KASAN_GENERIC
 
 ifdef CONFIG_KASAN_SW_TAGS
-- 
2.39.1.519.gcb327c4b5f-goog

