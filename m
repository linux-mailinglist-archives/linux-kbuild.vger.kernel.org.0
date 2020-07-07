Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F48D2164D6
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Jul 2020 05:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgGGDuo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Jul 2020 23:50:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbgGGDuo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Jul 2020 23:50:44 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80A0CC061755;
        Mon,  6 Jul 2020 20:50:44 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id gc15so432952pjb.0;
        Mon, 06 Jul 2020 20:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hJxeJYkVyPgQ3e+BoSs/bgu9khzwEd5MWF8nMf1shj0=;
        b=bCfgZNkOu+lKeiPkmLvQSiXZBD2Hme9qzGIYZWNEd85DeWtt2BmS149u9fk03v99DX
         f6RrNrrC1Pf3ueCRFa698TaxllEMKs0ctO1vzcEIzIZvHqnyAwQi8IlDHINiy2GKzO1G
         NOFLR2DWWAnHOzi4/4KI1iP9SJnuV39ua59ZbJlV9PFGGci4la/DmuAxPlWJdUx59Pum
         aXj3F9tB/foV/vlk2uXI+JzLixBh+8uj/LKSmFz6PbVQMiNM0zTeL7jPBaw6f5iMCTbT
         slfrEij7sOYZLDr7pBvyMtIFaJ5U3QCL8A7f2XxCPHJ+rvu4VSC2xxRViPKQ76p5lpPW
         5xxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hJxeJYkVyPgQ3e+BoSs/bgu9khzwEd5MWF8nMf1shj0=;
        b=tCPxOHAC7DIIhIcqLgn14vXynAipMHE+1N12pmbRA6PHQueC6Ys0LOXjLQCX1LNcDD
         CoTa966TeNqR2sUraOdhamqiCeSLeMqFkRVtkYVhNQQ7Sw9lFH4+9VDS21/g2j70EdDN
         TL9j41jmHApFyRI+FOrmsThSxLX+b0lQQ8x3kQcflrTjZXoB5fLYTnJ4lZAQM1Kbchin
         mIAbIHSDGR5NvIqrZtfMtruf1divaJOURAClPkuCOH4zb4N4NddSgJqAsauPWRDnChrg
         JaaylA7FTwJGn891MEIcLU4wf9mLrI1926n9JKYIQO/7aFjHVq92/P2sJjoVZtFEkV5e
         XgZA==
X-Gm-Message-State: AOAM532bXMdj8p4eFHyHAlu54/p2oYCHqkb3mq5EFv2LSAEsznRBkGmw
        w2SxZOqv90M4kcIzi1+mO/yYmlwkXzo=
X-Google-Smtp-Source: ABdhPJwWlz+iSIdhANepBneDfY7iwQePdD8nqbU392ag3beMsaLEVnTb5z1F4wsy4RpQWrZWbbIXLw==
X-Received: by 2002:a17:902:8a8f:: with SMTP id p15mr44108698plo.172.1594093843989;
        Mon, 06 Jul 2020 20:50:43 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net. [98.33.101.203])
        by smtp.gmail.com with ESMTPSA id d22sm20466320pfd.105.2020.07.06.20.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 20:50:43 -0700 (PDT)
From:   Nick Terrell <nickrterrell@gmail.com>
To:     Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
        linux-kbuild@vger.kernel.org, x86@kernel.org,
        gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>,
        Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Nick Terrell <nickrterrell@gmail.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Norbert Lange <nolange79@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nick Terrell <terrelln@fb.com>
Subject: [PATCH v6 1/8] lib: prepare zstd for preboot environment
Date:   Mon,  6 Jul 2020 20:45:57 -0700
Message-Id: <20200707034604.1539157-2-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200707034604.1539157-1-nickrterrell@gmail.com>
References: <20200707034604.1539157-1-nickrterrell@gmail.com>
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
2.27.0

