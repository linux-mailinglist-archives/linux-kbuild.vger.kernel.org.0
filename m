Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FDB919A4C4
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2020 07:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731770AbgDAFib (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Apr 2020 01:38:31 -0400
Received: from mail-pg1-f176.google.com ([209.85.215.176]:39141 "EHLO
        mail-pg1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731589AbgDAFib (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Apr 2020 01:38:31 -0400
Received: by mail-pg1-f176.google.com with SMTP id g32so5538841pgb.6;
        Tue, 31 Mar 2020 22:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bTF5OM/AHfN5IdNwERhI8sUbyo3nVY3s0MI5dijF+Kg=;
        b=HEXVKdwkxKNFbsufqMUOQg2sKMGWh4JPvK/Lm0/eqNOA9GOSCSNAnU/+oBjOHIukt5
         gtWcYLtznBsdQtphsfvv/PLq+Y0d53rRi+ooeRDEklSLjqGTeFsLOXDlznpOx4cZ21Dl
         iTQldIUW6hFMaJCz+wK5zxbfr4sVIAP9qRil3TNib8FRxT7U3dtAPVXZE0wyKUTw0Och
         FJA95KWblbyzdJ3hLOFG/naPebTqdH2Zgxaa002q7I98WvIPBcc7x0WYKN3hAeyX2dY2
         LLam2fL4JfI0bUCPlSabC1aIZ7CQcTfPVk1GsC4M3Rm9p89P9RInLlOEKEbOWHLEP0HZ
         VJnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bTF5OM/AHfN5IdNwERhI8sUbyo3nVY3s0MI5dijF+Kg=;
        b=MBS284lgjnVmgDGX8AjnxSTTg+U9234bVS3gI8tdoEGe8KdkzMl/sSD/fFcT1HFEuh
         qQboKYJqLBBRn9SS6ZJ43JzwIerHQyyJblotJwYoLIn2T0TPSHvjNnCL9s4A86F59ksg
         3KCO6M+htUcTbrzqQdWuLB1656+Jp440JcRbnEgJirqsoQJeYfynEaODd6zHBnAxWGMr
         h8PlyhSazFnpZ5uWCyHcqNhVlQNh2kYt9Gf1ur8x3vn/nW3WuidlAsGxi6OKb2f2fhb6
         YPhbRfxGcCzrhOhEmQd0x/eX1TgrigQPpAwMPkRYr9IMH4zxWX2T9YrihCZnU7oitwOz
         MnRw==
X-Gm-Message-State: ANhLgQ0hI6z1bQYSVTmAdIF8Mdqi2s8LEFTFyFHOSIlPfWAWskOBbwAV
        Y9/ZWXY1iLJw+djEajXFhWQ=
X-Google-Smtp-Source: ADFU+vv76KBhMk4Ah+6P6xjGb6P7wAYmjZH2t3AEWnEAF/J5e1c8mZPHe8lQApn2uCo4tgHnNMLNww==
X-Received: by 2002:a62:ed19:: with SMTP id u25mr21685110pfh.114.1585719509354;
        Tue, 31 Mar 2020 22:38:29 -0700 (PDT)
Received: from nickserv.localdomain (c-67-188-225-242.hsd1.ca.comcast.net. [67.188.225.242])
        by smtp.gmail.com with ESMTPSA id w69sm683077pfc.52.2020.03.31.22.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 22:38:28 -0700 (PDT)
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
Subject: [PATCH v4 1/8] lib: prepare zstd for preboot environment
Date:   Tue, 31 Mar 2020 22:39:06 -0700
Message-Id: <20200401053913.216783-2-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200401053913.216783-1-nickrterrell@gmail.com>
References: <20200401053913.216783-1-nickrterrell@gmail.com>
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

