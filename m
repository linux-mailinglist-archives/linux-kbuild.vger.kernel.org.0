Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8ADC69ABE7
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Feb 2023 13:53:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbjBQMxX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 Feb 2023 07:53:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbjBQMxW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Feb 2023 07:53:22 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8521D19F34
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Feb 2023 04:53:19 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id w13so836379wrl.13
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Feb 2023 04:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ulgx+po/trB+4FXQcLmj6nxw3N0m6LL1KXnQpc+SYhI=;
        b=BVGRp9vYDHaCoxsJwjIYvbuDVbtvx0mVDEmbX2XZy1ny1uCuSjxjVE1KzSyOk3rj68
         k44oJEa1DPZ4PRmT7xT/Q0u4DRT2JSJ/yo8S1a7AaMmYCvBjLHcX2R10GNIz6orDQOsX
         caM8QvKnausu95V3Nykyrl6B1e4AjbF2MdOKqNLT54r0MUW5HnpnlqBmXGnGzka3U4KQ
         G+4xM3Mi9Rkg+zl7MNlhU3uRT5nCpv8Ej9bPU+mSGdU2obiShaU/RgpDqwmiPx6rPtwe
         npy5gWb5Kq7NBI0JHLXVs3DeTqD9M+5UWblWrMSfPkrJk1MR6fQPP9yWt51aSkt66MPZ
         QKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ulgx+po/trB+4FXQcLmj6nxw3N0m6LL1KXnQpc+SYhI=;
        b=c5Rn0PdU09H3sRRaaeTi0+Pr1C73mCcNoQOExE9YWqLulAigVvCHQh9uyRHfNbfnVv
         v87XzY2oybJ5yCyPyDgyOL2a5U9cBT7Y33nrWJINiUfjEslYyYzqQ5iH7rBoCI87Z+xB
         /Mo+gepOJSIDBWBiBVRk6e0cHciwRGz/j3P5c+gVD97ZoCXY8jI5ywiq6V7WPzeOpdcO
         KAqUi2HBHXX+MaZ+NoZaZaWUQcX+yaCMdBUX0CZO9vRgKr1Pn3gs83Xu0eUPm8aMuWSJ
         udlXGVqCH/N8R6GNZ6kFMRGMvjUQkUhSxsxpnCI3R4GyA94ml3i604lGzICFqNGC+OUP
         gCeA==
X-Gm-Message-State: AO0yUKWsFAFGcEvCfRPZbFENhKJhqL56zUDlLblCJxeE4+BJovMCUbME
        /EtFcPlSSbwm2awv3AH0LcwrSA==
X-Google-Smtp-Source: AK7set8a/gyHg3t36Zyr4mxRFV/aOKMOB5cnYYED79FZtuRdCJQaJGG18Ti/CRRpve9Jdk6dcbhgQA==
X-Received: by 2002:adf:fb92:0:b0:2c5:5933:1752 with SMTP id a18-20020adffb92000000b002c559331752mr700692wrr.52.1676638397783;
        Fri, 17 Feb 2023 04:53:17 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:9c:201:34a3:b9c:4ef:ef85])
        by smtp.gmail.com with ESMTPSA id s17-20020a5d4251000000b002c6e8cb612fsm1050348wrr.92.2023.02.17.04.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 04:53:17 -0800 (PST)
Date:   Fri, 17 Feb 2023 13:53:10 +0100
From:   Marco Elver <elver@google.com>
To:     Peter Zijlstra <peterz@infradead.org>
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
Subject: [PATCH -tip v4 4/4] kasan, x86: Don't rename memintrinsics in
 uninstrumented files
Message-ID: <Y+94tm7xoeTGqPgs@elver.google.com>
References: <20230216234522.3757369-1-elver@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216234522.3757369-1-elver@google.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
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
---
v4:
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

