Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3103346A18
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Mar 2021 21:41:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233470AbhCWUkd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 23 Mar 2021 16:40:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233466AbhCWUj4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Mar 2021 16:39:56 -0400
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FBE7C0613DF
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Mar 2021 13:39:55 -0700 (PDT)
Received: by mail-qt1-x849.google.com with SMTP id v18so1985910qtx.0
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Mar 2021 13:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=PeAEi4QdQeJS0R2WYWNNntX7QF/OnwnEUYEO8FB/zZI=;
        b=ME4u5UjKX6YIE3uv5oyrvvXZZ3jDHKxvg0e+6aqMZKUztdYp7UH3vHRfgdQzxCN4zy
         AMR5XMoxvqeXVqyIlJn+hPFAxZL4TQMv8yXuE2A03sfzLj0rDMM9qpT6OZbwGvww9Mv8
         grV2XE0qf126qqR9VAHX70l9XILxGlcga68lUIyRIcjYojuoLcnDWDSs1xGhji/tepMG
         PBfp9Zvp0mqwZ8XFmTGrrGrlAaTnxT7M5AW6ANe2fAcqA7CEXDKc4DyDrxO6kIuRFYR5
         fLVqRiEV3Wwjl4e92Jo79o5RUw9447jw9S1TrpuirFvX+vPBTTSo2yyfDiUXeMVwmetm
         m2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=PeAEi4QdQeJS0R2WYWNNntX7QF/OnwnEUYEO8FB/zZI=;
        b=R/8enVePvFQEtRU09kjAZXB1ChQt7lAgQ1D3+kwAOkrSv4CwrEa7UL+HBMuRek5vCb
         o7axYtpJTUO/eJLrLvc7zmpmiqQXyPhqyUE7o09M3Gm6kMIrALrTDKILECwYc2HG/vIU
         ysNP8Lbd4f9Dwk3eAa9FTTDjKH0QIa5LJIKg0U+pmFDxXvOyhrA3meWUYz8t6x9hUXJn
         FOJJ4POynkFs7YcbjEYLMX4T0JPxbcAQYk39ZmecN7CKrtulYx9bvehGzHSoHY16xwNX
         7PIQBowUB6ioa32DfoMgP4PxJycnzkbu4xjYXXzXs4yBz/P8/77oiaD9xOGNwSGosUXI
         TWeQ==
X-Gm-Message-State: AOAM533AUYf8kDjtcbX71mqeB/O8JBtFmmuNb81R4B4XokZhloODN0Vd
        t4BTaVHfS537Enuf2fdju83bXLYaBafF1sjFgNU=
X-Google-Smtp-Source: ABdhPJwlRHGVBhUTH+DIN3gqF/+urMKSoa77/A4cj7xtmd6a4b4sdc/0r2jdYr0i9s2c6CcWzw1XB1vTRyoJLpGvhpA=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:e9a3:260d:763b:67dc])
 (user=samitolvanen job=sendgmr) by 2002:a05:6214:f27:: with SMTP id
 iw7mr6736714qvb.50.1616531994399; Tue, 23 Mar 2021 13:39:54 -0700 (PDT)
Date:   Tue, 23 Mar 2021 13:39:32 -0700
In-Reply-To: <20210323203946.2159693-1-samitolvanen@google.com>
Message-Id: <20210323203946.2159693-4-samitolvanen@google.com>
Mime-Version: 1.0
References: <20210323203946.2159693-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
Subject: [PATCH v3 03/17] mm: add generic __va_function and __pa_function macros
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>, Jessica Yu <jeyu@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Tejun Heo <tj@kernel.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Peter Zijlstra <peterz@infradead.org>, bpf@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

With CONFIG_CFI_CLANG, the compiler replaces function addresses
in instrumented C code with jump table addresses. This means that
__pa_symbol(function) returns the physical address of the jump table
entry instead of the actual function, which may not work as the jump
table code will immediately jump to a virtual address that may not be
mapped.

To avoid this address space confusion, this change adds generic
definitions for __va_function and __pa_function, which architectures
that support CFI can override. The typical implementation of the
__va_function macro would use inline assembly to take the function
address, which avoids compiler instrumentation.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 include/linux/mm.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 64a71bf20536..a0d285cd59ce 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -116,6 +116,14 @@ extern int mmap_rnd_compat_bits __read_mostly;
 #define __pa_symbol(x)  __pa(RELOC_HIDE((unsigned long)(x), 0))
 #endif
 
+#ifndef __va_function
+#define __va_function(x) (x)
+#endif
+
+#ifndef __pa_function
+#define __pa_function(x) __pa_symbol(__va_function(x))
+#endif
+
 #ifndef page_to_virt
 #define page_to_virt(x)	__va(PFN_PHYS(page_to_pfn(x)))
 #endif
-- 
2.31.0.291.g576ba9dcdaf-goog

