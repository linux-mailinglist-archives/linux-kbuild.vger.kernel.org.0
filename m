Return-Path: <linux-kbuild+bounces-8555-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22045B2F78B
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Aug 2025 14:08:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D49021CC606C
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Aug 2025 12:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2A9823E32B;
	Thu, 21 Aug 2025 12:08:35 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DC481FBEA6;
	Thu, 21 Aug 2025 12:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755778115; cv=none; b=JvEWyUMWArszwV0SUg8x5tGvaB9t/yFTGScbktvnj7VXEGLWKfBuOCmB+UfNReJRGgghYqDgxatZrG0CGD8WnEuImB5Bbcl/YJRZgCoPRfje4g4Jdmzfa7rSltTysVCYV+a2v72aTpp1+9wE5EUPEGt6JRPi20b7zk/5uWtVZxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755778115; c=relaxed/simple;
	bh=GzHl16/x6W5NkDZWC69L8YWJBfzX5OeUne9pKPmNcvk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pP6GUJBaECuc3VsRiKClNmt7vrqD66trSjE1At6/yAIlaTH8+GrC7idqvjOTAjnd4bxtacqwp3UVuZmaYGcGMSMFyQNwWKt1WWjtKfU8WMmJL/DIggDFW8npp74K11b0XYMR8KM6U0KKP58XxdNWbJFQ8eSFdY2Lomym+g3qpGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27EE7152B;
	Thu, 21 Aug 2025 05:08:25 -0700 (PDT)
Received: from e137867.arm.com (unknown [10.57.1.220])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 23BC33F63F;
	Thu, 21 Aug 2025 05:08:30 -0700 (PDT)
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
To: kasan-dev@googlegroups.com
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Marco Elver <elver@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>
Subject: [PATCH] kasan: fix GCC mem-intrinsic prefix with sw tags
Date: Thu, 21 Aug 2025 13:07:35 +0100
Message-ID: <20250821120735.156244-1-ada.coupriediaz@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GCC doesn't support "hwasan-kernel-mem-intrinsic-prefix", only
"asan-kernel-mem-intrinsic-prefix"[0], while LLVM supports both.
This is already taken into account when checking
"CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX", but not in the KASAN Makefile
adding those parameters when "CONFIG_KASAN_SW_TAGS" is enabled.

Replace the version check with "CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX",
which already validates that mem-intrinsic prefix parameter can be used,
and choose the correct name depending on compiler.

GCC 13 and above trigger "CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX" which
prevents `mem{cpy,move,set}()` being redefined in "mm/kasan/shadow.c"
since commit 36be5cba99f6 ("kasan: treat meminstrinsic as builtins
in uninstrumented files"), as we expect the compiler to prefix
those calls with `__(hw)asan_` instead.
But as the option passed to GCC has been incorrect, the compiler has
not been emitting those prefixes, effectively never calling
the instrumented versions of `mem{cpy,move,set}()`
with "CONFIG_KASAN_SW_TAGS" enabled.

If "CONFIG_FORTIFY_SOURCES" is enabled, this issue would be mitigated
as it redefines `mem{cpy,move,set}()` and properly aliases the
`__underlying_mem*()` that will be called to the instrumented versions.

[0]: https://gcc.gnu.org/onlinedocs/gcc-13.4.0/gcc/Optimize-Options.html

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Fixes: 36be5cba99f6 ("kasan: treat meminstrinsic as builtins in uninstrumented files")
---
 scripts/Makefile.kasan | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
index 693dbbebebba..0ba2aac3b8dc 100644
--- a/scripts/Makefile.kasan
+++ b/scripts/Makefile.kasan
@@ -86,10 +86,14 @@ kasan_params += hwasan-instrument-stack=$(stack_enable) \
 		hwasan-use-short-granules=0 \
 		hwasan-inline-all-checks=0
 
-# Instrument memcpy/memset/memmove calls by using instrumented __hwasan_mem*().
-ifeq ($(call clang-min-version, 150000)$(call gcc-min-version, 130000),y)
-	kasan_params += hwasan-kernel-mem-intrinsic-prefix=1
-endif
+# Instrument memcpy/memset/memmove calls by using instrumented __(hw)asan_mem*().
+ifdef CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX
+	ifdef CONFIG_CC_IS_GCC
+		kasan_params += asan-kernel-mem-intrinsic-prefix=1
+	else
+		kasan_params += hwasan-kernel-mem-intrinsic-prefix=1
+	endif
+endif # CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX
 
 endif # CONFIG_KASAN_SW_TAGS
 

base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.43.0


