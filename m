Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 367BE218FFE
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jul 2020 20:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726795AbgGHSzI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Jul 2020 14:55:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgGHSzI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Jul 2020 14:55:08 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 172E1C061A0B;
        Wed,  8 Jul 2020 11:55:08 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id z5so22096792pgb.6;
        Wed, 08 Jul 2020 11:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M/PjmAninS+4waGJS0k7TVpi9mX9COho3YSX6SxTl+Y=;
        b=C5qkDTBlKsutks0JEupkZfHwo8y5SxKoQXfLgrkjU7F701gh7bIE+b9MA+cl46gqLL
         5JEyK/WQJMN0oF1puD+BtFVL3h+QCD14FwO8ZM+j2ceQMWpaaG+a4qH3H4lXb+T64K6d
         /6YvyxeiC+PMU/KuaIn/UIt5OFU0vcksSdOTRH4Al7x2iQT4AzefU73hcCEOCy4CJS/z
         oQryTOhzD32zb5nTrp7hsKNmG2mq3jUX1fPDa7U1pr2d/5wDpykPY7ZdK95FoCs1gGrn
         TNT8+xE726F4SWQaTeMpzbpa2Wh0DsA/1AK47NxlK7jSjVzuOOXaQAzk4frKRAv41OdB
         3tCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M/PjmAninS+4waGJS0k7TVpi9mX9COho3YSX6SxTl+Y=;
        b=DaHuPIaKhej4uDWRJbsqnkFmtUIbIBzzTEX2wEFvpOTYL3b8ZCDirc7McV5G+kpq9C
         hzveOCxCmpEoh1d4wUid3D6AYKdsfCxE23rFTOuyS4G/zn9TKqhw6f2AWWs20CpKBsS5
         1FQYtUQaZw0aWqW731JG+cpVFLdCglpct7ZPkVBCxpbi/nmuN7sDyJSZxQaPrVWx9xv9
         dVu3nG71AfTvujrAmawCYeeKO8dYmjeGbpZcNVI2FmbRFAFKVI8dwmZjBLqwR+9doU2m
         yxBeflsYF8oYP9muBe10H5Q9xsvHAUGKWsaOYcUbYI350dKmeJeOturSpvaOSUqNcwu1
         djsQ==
X-Gm-Message-State: AOAM533cI7gU0FnM/ZA0dyi3Qnagy0dy+mt7WxzREnVwJgVjL7rSRdeD
        T5E3Fyynu+rROxgMm4EFNCk=
X-Google-Smtp-Source: ABdhPJxpBbwra2DCeXLPPKwG0kI9akD1oeTKODn81rLsaEKa0akYV5DT/Yl/+LuHKbbk4ZS6pjBmCA==
X-Received: by 2002:a62:ceca:: with SMTP id y193mr22237574pfg.11.1594234507475;
        Wed, 08 Jul 2020 11:55:07 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net. [98.33.101.203])
        by smtp.gmail.com with ESMTPSA id c132sm485606pfb.112.2020.07.08.11.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 11:55:06 -0700 (PDT)
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
        Alex Xu <alex_y_xu@yahoo.ca>, Nick Terrell <terrelln@fb.com>
Subject: [PATCH v7 1/7] lib: prepare zstd for preboot environment
Date:   Wed,  8 Jul 2020 11:50:18 -0700
Message-Id: <20200708185024.2767937-2-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200708185024.2767937-1-nickrterrell@gmail.com>
References: <20200708185024.2767937-1-nickrterrell@gmail.com>
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

