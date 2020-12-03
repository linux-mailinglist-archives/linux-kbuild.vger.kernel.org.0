Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D433B2CCB2E
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Dec 2020 01:47:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbgLCAqQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Dec 2020 19:46:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728009AbgLCAqO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Dec 2020 19:46:14 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 262A4C061A52
        for <linux-kbuild@vger.kernel.org>; Wed,  2 Dec 2020 16:44:54 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id w16so320890pga.9
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Dec 2020 16:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z1WNWr4Yssq0/5Vtew+l4Dfo12ADeEEDmVhirIMi4z0=;
        b=V09WbiGv0UIvjMaB1tgeu63AuzE7TH1mzAOpyP3g3j9W5AgLjwKDvgnE3LHFfgqWjW
         0kKOM/r4AIPvRv1TX1FsfW9kXlB+PkWLSohCBDpg5eHla2bgYm0rWENsuCZaC8Vj9cFv
         QvCrHlRR0Zp7FaQJQNfH6O0b2exmGO1EXUayA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z1WNWr4Yssq0/5Vtew+l4Dfo12ADeEEDmVhirIMi4z0=;
        b=TJ85/Qh2yXc4a0mOyU83xhNT7JHpXBdFbEX6xhbd9uTi1JFQJ+Ko0bwEj0SWSZ8c/B
         co0Jj9yWazqTIfEvLqKApixBeN9cvSRljrX+TLMRMaqvaiQmdNRtmTMH9tZ0knncSL8S
         kawrdxUyXYcbYX7/3ICyq+C+4mEJff4Waq6PxL27YxFI1xrlh12EDdfyOb+zsKbuofy8
         CVPw7pu8ahVQYdOpdDU21qAUKR6s7A/VlOWDJ5F8mtQuQWGiJ5dhVnd5R2sFhWRlu9iY
         3vbEYXKkSEWF4qFHU8VajUhfy/ecJ3i3ygIVHxm8nnuOYpkt2j6V5KstZbj40qQlERoF
         p7cg==
X-Gm-Message-State: AOAM532fymnlkRW/Fasi4DSgrCpvFpddz7JXTdpfev8gGYvLPWd07LI5
        AIoejtQiTatLGdL2LcMY13U7DfDAmukqaNWh
X-Google-Smtp-Source: ABdhPJxupcqKAfA+6spUnlhW8IX/viTvkmgPPQK2M4J/B8WH49ApqBuj68hx69v8fVuEibwX6AJSQA==
X-Received: by 2002:a05:6a00:804:b029:198:28cb:5564 with SMTP id m4-20020a056a000804b029019828cb5564mr585025pfk.34.1606956293726;
        Wed, 02 Dec 2020 16:44:53 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id e3sm230780pfe.154.2020.12.02.16.44.48
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
Subject: [PATCH v2 7/7] ubsan: Expand tests and reporting
Date:   Wed,  2 Dec 2020 16:44:37 -0800
Message-Id: <20201203004437.389959-8-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201203004437.389959-1-keescook@chromium.org>
References: <20201203004437.389959-1-keescook@chromium.org>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; g=2cf313139724ec58519e6664e9a14e6268ecf30d; i=5lkU2JU0knpRbnEGI0MkYsIoBxjXl4xXGIllYmzSIGQ=; m=kgOPxhW7R6TIbM/bwRigMo8Ka2QwPGpIF95ynIKphxM=; p=/LAtDzvPWFywHprOgzGx/Lz/VhGmTOdUpXFh8ZmZT5A=
X-Patch-Sig: m=pgp; i=keescook@chromium.org; s=0x0x8972F4DFDC6DC026; b=iQIzBAABCgAdFiEEpcP2jyKd1g9yPm4TiXL039xtwCYFAl/INPQACgkQiXL039xtwCYy2g//e1+ EI1BbChrdfCHCWJRFW7pVBIi1oM7zL0fF/he+6qvH91idsBFvsoEuQ371CZ4yo5uemkHx/KHNRemK 2q+lvPRUKztKEAK7aaF6SWheUaR5xWDzz6ny7xH2xAfvbe2oX4ahOv9fNhXaAeWaUri7d17/1HV7D P7Z7RgPYEmp056ngiT2jSlktgQBG0Q+r45RDL/Sla86inHgveJd2sSN+PMJyQGspcy2XyxqpQZxl7 LJ0/cRVRcJ8VXx+ufiJlyxNujf2edBwJRuc6+1L/MUzKfFykDKkyNalC7wgPhPJIAiAiFlxgf+hU5 ZJEAKmrN+kLai7Z+8sMy4n/m3zR6rrY0Tl93gFGoThoZwqrbbMut/qC0SogF1WWZ/xNd/zkQ8iVJi Jt60P6ogGMslmJqbBMxBLi6xGIPLr6950ImItmEz5IiHqL8XLlEIsxgyY7KazqxjCNAP3iXaihhZF 4TSscntGIXvD8lZyC9QyZHosH4WrLAcVlJg8hWPxQ6HzbVecyvPRiDJSYWlV2J3OmqEb7jlZvKlOE evxk1QPQx9PiGLAnIPyj2szgqkcMnRZzpQlBKZ9IhmKEzGp2T6PnOnq+UKbBpL3Pd4xC/DinXUkME SEzxqPks1RSUkIZMGt14EUdHymcTu6QVY5QZASn2sUz7Pt6ytA3kqrlOX+5q/ZSQ=
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Expand the UBSAN tests to include some additional UB cases. Notably the
out-of-bounds enum loading appears not to work. Also include per-test
reporting, including the relevant CONFIG_UBSAN... Kconfigs.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 lib/test_ubsan.c | 74 ++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 66 insertions(+), 8 deletions(-)

diff --git a/lib/test_ubsan.c b/lib/test_ubsan.c
index 9ea10adf7a66..5e5d9355ef49 100644
--- a/lib/test_ubsan.c
+++ b/lib/test_ubsan.c
@@ -5,32 +5,54 @@
 
 typedef void(*test_ubsan_fp)(void);
 
+#define UBSAN_TEST(config, ...)	do {					\
+		pr_info("%s " __VA_ARGS__ "%s(%s=%s)\n", __func__,	\
+			sizeof(" " __VA_ARGS__) > 2 ? " " : "",		\
+			#config, IS_ENABLED(config) ? "y" : "n");	\
+	} while (0)
+
 static void test_ubsan_add_overflow(void)
 {
 	volatile int val = INT_MAX;
+	volatile unsigned int uval = UINT_MAX;
 
+	UBSAN_TEST(CONFIG_UBSAN_SIGNED_OVERFLOW);
 	val += 2;
+
+	UBSAN_TEST(CONFIG_UBSAN_UNSIGNED_OVERFLOW);
+	uval += 2;
 }
 
 static void test_ubsan_sub_overflow(void)
 {
 	volatile int val = INT_MIN;
+	volatile unsigned int uval = 0;
 	volatile int val2 = 2;
 
+	UBSAN_TEST(CONFIG_UBSAN_SIGNED_OVERFLOW);
 	val -= val2;
+
+	UBSAN_TEST(CONFIG_UBSAN_UNSIGNED_OVERFLOW);
+	uval -= val2;
 }
 
 static void test_ubsan_mul_overflow(void)
 {
 	volatile int val = INT_MAX / 2;
+	volatile unsigned int uval = UINT_MAX / 2;
 
+	UBSAN_TEST(CONFIG_UBSAN_SIGNED_OVERFLOW);
 	val *= 3;
+
+	UBSAN_TEST(CONFIG_UBSAN_UNSIGNED_OVERFLOW);
+	uval *= 3;
 }
 
 static void test_ubsan_negate_overflow(void)
 {
 	volatile int val = INT_MIN;
 
+	UBSAN_TEST(CONFIG_UBSAN_SIGNED_OVERFLOW);
 	val = -val;
 }
 
@@ -39,37 +61,67 @@ static void test_ubsan_divrem_overflow(void)
 	volatile int val = 16;
 	volatile int val2 = 0;
 
+	UBSAN_TEST(CONFIG_UBSAN_DIV_ZERO);
 	val /= val2;
 }
 
 static void test_ubsan_shift_out_of_bounds(void)
 {
-	volatile int val = -1;
-	int val2 = 10;
+	volatile int neg = -1, wrap = 4;
+	int val1 = 10;
+	int val2 = INT_MAX;
+
+	UBSAN_TEST(CONFIG_UBSAN_SHIFT, "negative exponent");
+	val1 <<= neg;
 
-	val2 <<= val;
+	UBSAN_TEST(CONFIG_UBSAN_SHIFT, "left overflow");
+	val2 <<= wrap;
 }
 
 static void test_ubsan_out_of_bounds(void)
 {
-	volatile int i = 4, j = 5;
+	volatile int i = 4, j = 5, k = -1;
+	volatile char above[4] = { }; /* Protect surrounding memory. */
 	volatile int arr[4];
+	volatile char below[4] = { }; /* Protect surrounding memory. */
 
+	above[0] = below[0];
+
+	UBSAN_TEST(CONFIG_UBSAN_BOUNDS, "above");
 	arr[j] = i;
+
+	UBSAN_TEST(CONFIG_UBSAN_BOUNDS, "below");
+	arr[k] = i;
 }
 
+enum ubsan_test_enum {
+	UBSAN_TEST_ZERO = 0,
+	UBSAN_TEST_ONE,
+	UBSAN_TEST_MAX,
+};
+
 static void test_ubsan_load_invalid_value(void)
 {
 	volatile char *dst, *src;
 	bool val, val2, *ptr;
-	char c = 4;
+	enum ubsan_test_enum eval, eval2, *eptr;
+	unsigned char c = 0xff;
 
+	UBSAN_TEST(CONFIG_UBSAN_BOOL, "bool");
 	dst = (char *)&val;
 	src = &c;
 	*dst = *src;
 
 	ptr = &val2;
 	val2 = val;
+
+	UBSAN_TEST(CONFIG_UBSAN_ENUM, "enum");
+	dst = (char *)&eval;
+	src = &c;
+	*dst = *src;
+
+	eptr = &eval2;
+	eval2 = eval;
 }
 
 static void test_ubsan_null_ptr_deref(void)
@@ -77,6 +129,7 @@ static void test_ubsan_null_ptr_deref(void)
 	volatile int *ptr = NULL;
 	int val;
 
+	UBSAN_TEST(CONFIG_UBSAN_OBJECT_SIZE);
 	val = *ptr;
 }
 
@@ -85,6 +138,7 @@ static void test_ubsan_misaligned_access(void)
 	volatile char arr[5] __aligned(4) = {1, 2, 3, 4, 5};
 	volatile int *ptr, val = 6;
 
+	UBSAN_TEST(CONFIG_UBSAN_ALIGNMENT);
 	ptr = (int *)(arr + 1);
 	*ptr = val;
 }
@@ -95,6 +149,7 @@ static void test_ubsan_object_size_mismatch(void)
 	volatile int val __aligned(8) = 4;
 	volatile long long *ptr, val2;
 
+	UBSAN_TEST(CONFIG_UBSAN_OBJECT_SIZE);
 	ptr = (long long *)&val;
 	val2 = *ptr;
 }
@@ -104,15 +159,19 @@ static const test_ubsan_fp test_ubsan_array[] = {
 	test_ubsan_sub_overflow,
 	test_ubsan_mul_overflow,
 	test_ubsan_negate_overflow,
-	test_ubsan_divrem_overflow,
 	test_ubsan_shift_out_of_bounds,
 	test_ubsan_out_of_bounds,
 	test_ubsan_load_invalid_value,
-	//test_ubsan_null_ptr_deref, /* exclude it because there is a crash */
 	test_ubsan_misaligned_access,
 	test_ubsan_object_size_mismatch,
 };
 
+/* Excluded because they Oops the module. */
+static const test_ubsan_fp skip_ubsan_array[] = {
+	test_ubsan_divrem_overflow,
+	test_ubsan_null_ptr_deref,
+};
+
 static int __init test_ubsan_init(void)
 {
 	unsigned int i;
@@ -120,7 +179,6 @@ static int __init test_ubsan_init(void)
 	for (i = 0; i < ARRAY_SIZE(test_ubsan_array); i++)
 		test_ubsan_array[i]();
 
-	(void)test_ubsan_null_ptr_deref; /* to avoid unsed-function warning */
 	return 0;
 }
 module_init(test_ubsan_init);
-- 
2.25.1

