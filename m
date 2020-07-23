Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94D0922B6B9
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Jul 2020 21:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbgGWTa2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 23 Jul 2020 15:30:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725894AbgGWTa1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Jul 2020 15:30:27 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B184DC0619DC;
        Thu, 23 Jul 2020 12:30:27 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id s26so3533976pfm.4;
        Thu, 23 Jul 2020 12:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M/PjmAninS+4waGJS0k7TVpi9mX9COho3YSX6SxTl+Y=;
        b=gtWpmUkbDyxXG9vT39SFby2I3VHhBdbxuO+8/Fct2mmzX/vOwSKXOGskXREzOmcCo4
         E4x0q2HiJK8eJFHXwnTaFEQZDefmzJ7Sayqh/fC8XroDkfXEeeGtBQXxNWaAST4FyXAQ
         IIJBR5lskECMK00Zi/HWAZXH2TabChRsUYCGDJm/IYru6JamA1gUwgjChrahfZ2wpjBv
         rs9VjfPnR9wZ5Qfk6NWWD60mOWzqHnRlX0CEF2fZh20jPNd1TmaG6K/zv5rglRyHlsuW
         NA0Q48jAP+BudWICB4PnA5/QVfgqluXwVF0pYq72sOptQoe+57XdeGRyYVZkdPttt+h4
         WAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M/PjmAninS+4waGJS0k7TVpi9mX9COho3YSX6SxTl+Y=;
        b=iXgeMHrEFtlP0FBx2Z7fMwuMHlZWzPuWfI4C4js5m/8Byxa5r4uy3SetqQ2AGO2HYV
         oA2/algbT6NnpBtL13i8bdVMknf8UVK4BXsKfwyk227rThZ2TLDu2FFgjjUPG7vMSzhY
         D2bRly16F2tTC6zVwSqi7smfdK55TXzIwDBmXkpk2y1DtZfRJ2T7iGZPSVlwmnJkAGMG
         hKf/J1wDMyTvYPC16re6+IYnoCNmDBdLsIj/Yr8lXGSpatdA3jyeZEZ9vfNeh3JBEW4w
         PcsDLhFiAvcnHFeC6JrUceJ4DhafWfoREgyFYQ6t3KkqHRz8J3Jg6Smx91g9dM1+e+yl
         PuOg==
X-Gm-Message-State: AOAM5313ZNnYosLhwS9N7LMFxi5Qd3+ZtDlrSOjnlCmw8eEnnx0p/+iu
        RTPwXD225BB8wlDV3JF7eS4=
X-Google-Smtp-Source: ABdhPJzgXCkTryVlIVR+WxtAc5QT/kcHT99IAKh1NJTpx3UKgdKEO1E556g8wyvGuwiLDThDPtTj+Q==
X-Received: by 2002:a63:e617:: with SMTP id g23mr5387426pgh.102.1595532627167;
        Thu, 23 Jul 2020 12:30:27 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net. [98.33.101.203])
        by smtp.gmail.com with ESMTPSA id y18sm3794332pff.10.2020.07.23.12.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 12:30:26 -0700 (PDT)
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
        Alex Xu <alex_y_xu@yahoo.ca>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Nick Terrell <terrelln@fb.com>
Subject: [PATCH v8 1/7] lib: prepare zstd for preboot environment
Date:   Thu, 23 Jul 2020 12:27:55 -0700
Message-Id: <20200723192801.351114-2-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200723192801.351114-1-nickrterrell@gmail.com>
References: <20200723192801.351114-1-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Nick Terrell <terrelln@fb.com>

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
 lib/zstd/fse_decompress.c |  9 +--------
 lib/zstd/zstd_internal.h  | 14 ++++++++++++--
 2 files changed, 13 insertions(+), 10 deletions(-)

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

