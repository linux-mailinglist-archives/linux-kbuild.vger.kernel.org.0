Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1B211A2B89
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Apr 2020 23:55:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726773AbgDHVz6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Apr 2020 17:55:58 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37531 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726744AbgDHVz4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Apr 2020 17:55:56 -0400
Received: by mail-pf1-f196.google.com with SMTP id u65so3075842pfb.4;
        Wed, 08 Apr 2020 14:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bTF5OM/AHfN5IdNwERhI8sUbyo3nVY3s0MI5dijF+Kg=;
        b=ny161/cSdk163pkAnt7S/XzQgWWXu0cC7ixYUku5uKpKBt7ft06Y1HQQjEaDkN0rw1
         bJnO6nRLcllujCXSxcXsUkCBgpIE/fYK+5QgXfyOYVsdgavTPLzkF2yQvErMtdH8GC3z
         GuhrEc0zW6Rkf3mvM9YXZD0YxefXDCDT9/LdDWilEGvYhoTG2cGWxwZqNtr3tn7VOMZA
         8bozi9IF5+ktqaeUhIDZDKMi3Gs4n69ptdUomEprmvjIM3qgf9nj1f1Cua8E6iq8SUf6
         smOcbjx12rKhzVP6mHh5t16EiJXn0BK5vFGgmjLMZUSulq01Qbc3/F4R6mvImd0tKW98
         rlMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bTF5OM/AHfN5IdNwERhI8sUbyo3nVY3s0MI5dijF+Kg=;
        b=RKAxu3r28RCi2zpMMTTELd9w7HTan7FpoVwOWJ+NFjPYYEzcgaWbRU9s6NNQNzP+Eb
         LkttOmrOv6N6yc25kp927EgcX0c8ybQ4Ai5PyRvDGwrI7vF6Zg/X8ns+5o6IzGG6AIvf
         GfR+cbmrMafSN3Z5PyJpsZZfk0G5AatgFvIQPqw4C3YydkzilxZMaRjIyF6OCUxRYoRy
         Cicx6bXrPVivKU7xKAm29obVRkFr6NUV8U84/GxQvUTxDqbDpgBHyEu/RKLSXrIR/NFP
         wN5gHdArFXU5gGGeHpPVTuXfTTDWbPP0zLfhSY6cTMN4J4fW1AlNmGsMP6HH4xyvAgc1
         tRvw==
X-Gm-Message-State: AGi0PubE7jmAu7aehyZ7lYRNfiQGDIe3j8p66ReeHqNZSMWNBTgdC3JD
        23f2n6PyTGlxfiFVD4RB3fkMzlabU3QJkg==
X-Google-Smtp-Source: APiQypKvmcFfv0wmmMqwBwoqqHO0biHv26F0B3n1H6Vx7xVTbMPZnRK/pQhK/Jpq1/ESsS3OTCha6Q==
X-Received: by 2002:a63:894a:: with SMTP id v71mr3932304pgd.314.1586382955047;
        Wed, 08 Apr 2020 14:55:55 -0700 (PDT)
Received: from nickserv.localdomain (c-73-222-55-223.hsd1.ca.comcast.net. [73.222.55.223])
        by smtp.gmail.com with ESMTPSA id ci13sm459604pjb.16.2020.04.08.14.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 14:55:54 -0700 (PDT)
From:   Nick Terrell <nickrterrell@gmail.com>
To:     Nick Terrell <terrelln@fb.com>
Cc:     linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
        linux-kbuild@vger.kernel.org, x86@kernel.org,
        gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>,
        Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Nick Terrell <nickrterrell@gmail.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>
Subject: [PATCH v5 1/8] lib: prepare zstd for preboot environment
Date:   Wed,  8 Apr 2020 14:57:04 -0700
Message-Id: <20200408215711.137639-2-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200408215711.137639-1-nickrterrell@gmail.com>
References: <20200408215711.137639-1-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Nick Terrell <terrelln@fb.com>

* Don't export symbols if ZSTD_PREBOOT is defined.
* Remove a double definition of the CHECK_F macro when the zstd
  library is amalgamated.
* Switch ZSTD_copy8() to __builtin_memcpy(), because in the preboot
  environment on x86 gcc can't inline `memcpy()` otherwise.
* Limit the gcc hack in ZSTD_wildcopy() to the broken gcc version. See
  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81388.

These changes are necessary to get the build to work in the preboot
environment, and to get reasonable performance. ZSTD_copy8() and
ZSTD_wildcopy() are in the core of the zstd hot loop. So outlining
these calls to memcpy(), and having an extra branch are very
detrimental to performance.

Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
Signed-off-by: Nick Terrell <terrelln@fb.com>
---
 lib/zstd/decompress.c     |  2 ++
 lib/zstd/fse_decompress.c |  9 +--------
 lib/zstd/zstd_internal.h  | 14 ++++++++++++--
 3 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/lib/zstd/decompress.c b/lib/zstd/decompress.c
index 269ee9a796c1..73ded63278cf 100644
--- a/lib/zstd/decompress.c
+++ b/lib/zstd/decompress.c
@@ -2490,6 +2490,7 @@ size_t ZSTD_decompressStream(ZSTD_DStream *zds, ZSTD_outBuffer *output, ZSTD_inB
 	}
 }
 
+#ifndef ZSTD_PREBOOT
 EXPORT_SYMBOL(ZSTD_DCtxWorkspaceBound);
 EXPORT_SYMBOL(ZSTD_initDCtx);
 EXPORT_SYMBOL(ZSTD_decompressDCtx);
@@ -2529,3 +2530,4 @@ EXPORT_SYMBOL(ZSTD_insertBlock);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("Zstd Decompressor");
+#endif
diff --git a/lib/zstd/fse_decompress.c b/lib/zstd/fse_decompress.c
index a84300e5a013..0b353530fb3f 100644
--- a/lib/zstd/fse_decompress.c
+++ b/lib/zstd/fse_decompress.c
@@ -47,6 +47,7 @@
 ****************************************************************/
 #include "bitstream.h"
 #include "fse.h"
+#include "zstd_internal.h"
 #include <linux/compiler.h>
 #include <linux/kernel.h>
 #include <linux/string.h> /* memcpy, memset */
@@ -60,14 +61,6 @@
 		enum { FSE_static_assert = 1 / (int)(!!(c)) }; \
 	} /* use only *after* variable declarations */
 
-/* check and forward error code */
-#define CHECK_F(f)                  \
-	{                           \
-		size_t const e = f; \
-		if (FSE_isError(e)) \
-			return e;   \
-	}
-
 /* **************************************************************
 *  Templates
 ****************************************************************/
diff --git a/lib/zstd/zstd_internal.h b/lib/zstd/zstd_internal.h
index 1a79fab9e13a..dac753397f86 100644
--- a/lib/zstd/zstd_internal.h
+++ b/lib/zstd/zstd_internal.h
@@ -127,7 +127,14 @@ static const U32 OF_defaultNormLog = OF_DEFAULTNORMLOG;
 *  Shared functions to include for inlining
 *********************************************/
 ZSTD_STATIC void ZSTD_copy8(void *dst, const void *src) {
-	memcpy(dst, src, 8);
+	/*
+	 * zstd relies heavily on gcc being able to analyze and inline this
+	 * memcpy() call, since it is called in a tight loop. Preboot mode
+	 * is compiled in freestanding mode, which stops gcc from analyzing
+	 * memcpy(). Use __builtin_memcpy() to tell gcc to analyze this as a
+	 * regular memcpy().
+	 */
+	__builtin_memcpy(dst, src, 8);
 }
 /*! ZSTD_wildcopy() :
 *   custom version of memcpy(), can copy up to 7 bytes too many (8 bytes if length==0) */
@@ -137,13 +144,16 @@ ZSTD_STATIC void ZSTD_wildcopy(void *dst, const void *src, ptrdiff_t length)
 	const BYTE* ip = (const BYTE*)src;
 	BYTE* op = (BYTE*)dst;
 	BYTE* const oend = op + length;
-	/* Work around https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81388.
+#if defined(GCC_VERSION) && GCC_VERSION >= 70000 && GCC_VERSION < 70200
+	/*
+	 * Work around https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81388.
 	 * Avoid the bad case where the loop only runs once by handling the
 	 * special case separately. This doesn't trigger the bug because it
 	 * doesn't involve pointer/integer overflow.
 	 */
 	if (length <= 8)
 		return ZSTD_copy8(dst, src);
+#endif
 	do {
 		ZSTD_copy8(op, ip);
 		op += 8;
-- 
2.26.0

