Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5C449F7AD
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Jan 2022 11:56:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347912AbiA1K4t (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 28 Jan 2022 05:56:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244101AbiA1K4t (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Jan 2022 05:56:49 -0500
Received: from mail-wm1-x349.google.com (mail-wm1-x349.google.com [IPv6:2a00:1450:4864:20::349])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E54E9C061714
        for <linux-kbuild@vger.kernel.org>; Fri, 28 Jan 2022 02:56:48 -0800 (PST)
Received: by mail-wm1-x349.google.com with SMTP id s190-20020a1ca9c7000000b00347c6c39d9aso2794288wme.5
        for <linux-kbuild@vger.kernel.org>; Fri, 28 Jan 2022 02:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=hOuzpWzwLqePrG7KzMy6POmcapEVAbM5YRYunKpotWo=;
        b=fhKHd24To3BSoahiJrP4xlDXKpCv3i4ceobI3bbA37VyEE3jRp+O4mYy3/TpA/jZUB
         78s9JcvafHZk3Nv+QJ6aCkxV9DZmzWwQgza39CikAKbFpAJH0gRfvxzJxrMR/iUme2H3
         jBo52tynN+ZI9p0SCpL3h18OjUIbSbtNRMJGh80vv2vTRQiN+lFaGOP/UvUEWZe+EzBd
         qo4vUcf5tsb7t+H7W+pSujNUVMXKA/ziuTBUv4540NXCHFMarAxcrf7im8cjNoxjH+Eq
         XhJqmEV3hYNuBw30oMLQ+eJLGDpd3lfJyo0cx764C6KNLR1EY9entQi/H9+gyre8f59f
         GQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=hOuzpWzwLqePrG7KzMy6POmcapEVAbM5YRYunKpotWo=;
        b=J6ubEUrQjfKWIRXZZcXQO73JDEX7z7j7e986BPEIah186zPnex0Aij2j7UiLbLEWQU
         xXmlDh5DbTr/ua5Jwd/LwYESY1wSr+x9TLjxD3/V7B7v+LPA0G7s7hnWZ56RW6jSBaZo
         zCNNoRNmcVaumPpi13HhyziYcfUlgZjFK/SEyQJy992CgALAhB7KPwlPBv9SIaUaGUqI
         6CMX8TAPI48G2Zz15+j4DjScOtOiceUYayTzpvpCBx2TmkiYWb8UMveLdPqFnJ2iHLp2
         O71yCLIVPV/DK2m1YykEYBSO1+h9xO9KWD11P3rnNlBKAEqqCvZ8xjGh5nShYoPvyurm
         /Ojg==
X-Gm-Message-State: AOAM531/c03RK2a5iS26epe1ihMc8NgvAlWrNrkQDVEYdxboRJlVQlsr
        EvCLTizBH6MTGAx6jYzU6uS57Tf3gA==
X-Google-Smtp-Source: ABdhPJzZhi7RO2wuFmy6tcbCdw7/usEDleeyJpfpVLQrgRK/raZHfrPpldl5/HboAaShtwFxDIU0Zk2/tQ==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:f088:5245:7f91:d730])
 (user=elver job=sendgmr) by 2002:a1c:a544:: with SMTP id o65mr15295285wme.160.1643367407413;
 Fri, 28 Jan 2022 02:56:47 -0800 (PST)
Date:   Fri, 28 Jan 2022 11:56:31 +0100
Message-Id: <20220128105631.509772-1-elver@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
Subject: [PATCH] Revert "ubsan, kcsan: Don't combine sanitizer with kcov on clang"
From:   Marco Elver <elver@google.com>
To:     elver@google.com, Andrew Morton <akpm@linux-foundation.org>
Cc:     Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Kees Cook <keescook@chromium.org>, kasan-dev@googlegroups.com,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        linux-mm@kvack.org, Arnd Bergmann <arnd@arndb.de>,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This reverts commit ea91a1d45d19469001a4955583187b0d75915759.

Since df05c0e9496c ("Documentation: Raise the minimum supported version
of LLVM to 11.0.0") the minimum Clang version is now 11.0, which fixed
the UBSAN/KCSAN vs. KCOV incompatibilities.

Link: https://bugs.llvm.org/show_bug.cgi?id=45831
Link: https://lkml.kernel.org/r/YaodyZzu0MTCJcvO@elver.google.com
Signed-off-by: Marco Elver <elver@google.com>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
---
 lib/Kconfig.kcsan | 11 -----------
 lib/Kconfig.ubsan | 12 ------------
 2 files changed, 23 deletions(-)

diff --git a/lib/Kconfig.kcsan b/lib/Kconfig.kcsan
index 63b70b8c5551..de022445fbba 100644
--- a/lib/Kconfig.kcsan
+++ b/lib/Kconfig.kcsan
@@ -10,21 +10,10 @@ config HAVE_KCSAN_COMPILER
 	  For the list of compilers that support KCSAN, please see
 	  <file:Documentation/dev-tools/kcsan.rst>.
 
-config KCSAN_KCOV_BROKEN
-	def_bool KCOV && CC_HAS_SANCOV_TRACE_PC
-	depends on CC_IS_CLANG
-	depends on !$(cc-option,-Werror=unused-command-line-argument -fsanitize=thread -fsanitize-coverage=trace-pc)
-	help
-	  Some versions of clang support either KCSAN and KCOV but not the
-	  combination of the two.
-	  See https://bugs.llvm.org/show_bug.cgi?id=45831 for the status
-	  in newer releases.
-
 menuconfig KCSAN
 	bool "KCSAN: dynamic data race detector"
 	depends on HAVE_ARCH_KCSAN && HAVE_KCSAN_COMPILER
 	depends on DEBUG_KERNEL && !KASAN
-	depends on !KCSAN_KCOV_BROKEN
 	select STACKTRACE
 	help
 	  The Kernel Concurrency Sanitizer (KCSAN) is a dynamic
diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
index 236c5cefc4cc..f3c57ed51838 100644
--- a/lib/Kconfig.ubsan
+++ b/lib/Kconfig.ubsan
@@ -27,16 +27,6 @@ config UBSAN_TRAP
 	  the system. For some system builders this is an acceptable
 	  trade-off.
 
-config UBSAN_KCOV_BROKEN
-	def_bool KCOV && CC_HAS_SANCOV_TRACE_PC
-	depends on CC_IS_CLANG
-	depends on !$(cc-option,-Werror=unused-command-line-argument -fsanitize=bounds -fsanitize-coverage=trace-pc)
-	help
-	  Some versions of clang support either UBSAN or KCOV but not the
-	  combination of the two.
-	  See https://bugs.llvm.org/show_bug.cgi?id=45831 for the status
-	  in newer releases.
-
 config CC_HAS_UBSAN_BOUNDS
 	def_bool $(cc-option,-fsanitize=bounds)
 
@@ -46,7 +36,6 @@ config CC_HAS_UBSAN_ARRAY_BOUNDS
 config UBSAN_BOUNDS
 	bool "Perform array index bounds checking"
 	default UBSAN
-	depends on !UBSAN_KCOV_BROKEN
 	depends on CC_HAS_UBSAN_ARRAY_BOUNDS || CC_HAS_UBSAN_BOUNDS
 	help
 	  This option enables detection of directly indexed out of bounds
@@ -72,7 +61,6 @@ config UBSAN_ARRAY_BOUNDS
 config UBSAN_LOCAL_BOUNDS
 	bool "Perform array local bounds checking"
 	depends on UBSAN_TRAP
-	depends on !UBSAN_KCOV_BROKEN
 	depends on $(cc-option,-fsanitize=local-bounds)
 	help
 	  This option enables -fsanitize=local-bounds which traps when an
-- 
2.35.0.rc0.227.g00780c9af4-goog

