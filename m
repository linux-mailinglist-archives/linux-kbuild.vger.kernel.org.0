Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 679412CCB2D
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Dec 2020 01:47:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728110AbgLCAqQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Dec 2020 19:46:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727088AbgLCAqO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Dec 2020 19:46:14 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3A48C061A51
        for <linux-kbuild@vger.kernel.org>; Wed,  2 Dec 2020 16:44:52 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id t18so193165plo.0
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Dec 2020 16:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dc/B94hjAeeyKCOv3YRX+BzkhQc/9V1asn3WsTw2Emg=;
        b=KCozItYQFWLllJ/3pMAxfk37c5QpWqP3NQUj14wmLRKek80rHiUS1DZNCv0Q4KMxHU
         5ejxgGHJdYtjtFFmvZqlkr7a6bJJlthvCpWz+9MxqB/qYgicf9da4F8mcbhAft0oYzCk
         RWU9I+B0O2HNtnqfmJv9wBdTJs3AzyiFYuFkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dc/B94hjAeeyKCOv3YRX+BzkhQc/9V1asn3WsTw2Emg=;
        b=mPEAu/U1gIiGNTadeeZne2cMAsu3WlCxcoljOcIMm4lT33PO1W9T+H7SMTXg+43dDg
         33fFvJmFjFIPawW4fKAR+/TvC+4pnIq1X1JMR789nap0fvNM4M3Solgn/JOeksxNU2B8
         xcnP9mEP+wqDib5f5dAXrxwHK8xDwQZgBfIMueosEu5v262JEphNzypUDUC8NIhEn48C
         hTPwCu/TMlLUl+yA+hJtoMeh3bwbjlkBv2ncbgce8/GYLpYHbvGVg9JrXcWbfb0pTAod
         KNYBz0m4Qj53+aFfaM7ybpoM68FOMO3Uzmx5gHSJyhtgtqIBDx9Ecwxb6tgMOQrMkgeF
         OmbA==
X-Gm-Message-State: AOAM5334kzWj4LX9FBzQTwmblPtZHiKHk4OLaiF/Zs8qLBSvCN1hMV7f
        UxETStnolgw3Tr1pl8Fn6A/qBA==
X-Google-Smtp-Source: ABdhPJx6xQenCwuNX2ZCZy/A6ik6/e/dmVRk804M2XukKlxvRwKY15kPrAy5XgSLxnGDaXlwpripig==
X-Received: by 2002:a17:90a:2941:: with SMTP id x1mr536181pjf.25.1606956292378;
        Wed, 02 Dec 2020 16:44:52 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v17sm182577pga.58.2020.12.02.16.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 16:44:50 -0800 (PST)
From:   Kees Cook <keescook@chromium.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Marco Elver <elver@google.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        George Popescu <georgepope@android.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/7] ubsan: Enable for all*config builds
Date:   Wed,  2 Dec 2020 16:44:35 -0800
Message-Id: <20201203004437.389959-6-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201203004437.389959-1-keescook@chromium.org>
References: <20201203004437.389959-1-keescook@chromium.org>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; g=b538973a44c54262367b4d33deb73da5b9328033; i=y2ZB2kMMmteaaxHC5mHSUdhJgsBf0nGKs7RacrLCqlE=; m=zUsL7RmnkOj+b6Khcg8fr3fiXPqryJ08VhnTKbEU1Mg=; p=adBx699hUBCCxPOKJsyVzds6QQ4qK9em/JNMtma7uYk=
X-Patch-Sig: m=pgp; i=keescook@chromium.org; s=0x0x8972F4DFDC6DC026; b=iQIzBAABCgAdFiEEpcP2jyKd1g9yPm4TiXL039xtwCYFAl/INPQACgkQiXL039xtwCbckw/+MHF DMemlYPqFYSNUkcUBfZkp72BYFal/uMFeRTNr+JH7SmQ4qADnIuKPhg/IkuA1CrBhfLoCIVZz0wJp 9uXYIeY73Y9goLfi/uQycbAv2+6n0Ev1ZnEKbRWTXDmJ1PBJdM+SIxx6LgRh+6pwNhF9w+0l4GCuD lU10CJhAwxFaCaA92ijuU25oCLheb+3gCqKK4N0u6diUnxDr61oGnupq/ErwQs0jI5JcoP8tM6T2Y BDRqMr7ZcM5nf/BUTL44oFo0xTWzCfpRzae2Q/OwzWOrAD/ni6Vxtuh59XtxEtMhPXj/GqJTbfl+t DP1xgLbIOiWPC/SCWcg5KS4XEwVCTttkr5pfITzNMs2aqkq5ZvwrX3tHrKHuwZTnje9g1Sxqc8Klq ivVMtK/UrUIZNjMjgzuKIzDwomKSD1u+u2k9Lj+1hnMM+6IceZSDVufUKHMbDnQDZqpBzWGLd07Uv e9EHanX905neUm1uHstqg3R0vX+AP+7DfhYZPwLCTRR2fQoIZIlWvE31QwgZZaSML8wCUUhYAIb4n X2Y/CFvjoyQrNIGHgmOnX9DlUZyFwiljzrqGgUUQCSWv5r3M2tdqkqDtZv99lBPJo/p+Bq3aNUp1V SH9kNgtWPR7W5Gk/bdHcXz7b/lYxykHiAFMe+nZzOBSr4nn/jSKTTDQPJqE8e7Tc=
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

With UBSAN_OBJECT_SIZE disabled for GCC, only UBSAN_ALIGNMENT remained
a noisy UBSAN option. Disable it for COMPILE_TEST so the rest of UBSAN
can be used for full all*config builds or other large combinations.

Link: https://lore.kernel.org/lkml/CAHk-=wgXW=YLxGN0QVpp-1w5GDd2pf1W-FqY15poKzoVfik2qA@mail.gmail.com/
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 lib/Kconfig.ubsan | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
index 6e8b67d4b0d9..fa78f0f3c1dc 100644
--- a/lib/Kconfig.ubsan
+++ b/lib/Kconfig.ubsan
@@ -130,7 +130,6 @@ config UBSAN_ENUM
 config UBSAN_SANITIZE_ALL
 	bool "Enable instrumentation for the entire kernel"
 	depends on ARCH_HAS_UBSAN_SANITIZE_ALL
-	depends on !COMPILE_TEST
 	default y
 	help
 	  This option activates instrumentation for the entire kernel.
@@ -142,7 +141,7 @@ config UBSAN_SANITIZE_ALL
 config UBSAN_ALIGNMENT
 	bool "Enable checks for pointers alignment"
 	default !HAVE_EFFICIENT_UNALIGNED_ACCESS
-	depends on !UBSAN_TRAP
+	depends on !UBSAN_TRAP && !COMPILE_TEST
 	depends on $(cc-option,-fsanitize=alignment)
 	help
 	  This option enables the check of unaligned memory accesses.
-- 
2.25.1

