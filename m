Return-Path: <linux-kbuild+bounces-5988-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A464FA55F4F
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Mar 2025 05:19:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B5013B29D2
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Mar 2025 04:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D39418FDD0;
	Fri,  7 Mar 2025 04:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m7xtot/L"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7E4DDBE;
	Fri,  7 Mar 2025 04:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741321158; cv=none; b=Yea1MAKBv+AlhBiDMXtgCIF4+qjdQ2YLPu2DyWYpcl03GBjiju4lj0YmeGvoxQuJG3jGmTC+q/JOLdsrTczzWSZkaIrIuxD7UtpRkTKGQ6hrBOUdNIceOaDn2UD6lm3A+jyvlVGZCJwOnwB2eIorFEtJtCW0F3QdyC/rY5kdudg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741321158; c=relaxed/simple;
	bh=jF2FPa66QDBZ6tSBhJch3R++EPhCPpvxAmCZwq5WTIw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m/fMGHbV+29p1xSMtzwMgQ+7ZNs3ai3UmCoqTx4pUJ+6oTAK5VSWAC9Ww7RGcEsnCyvAEtGVO0v+xMQsAmfCWwOlPAp2aqtHYMIx5HA138duilrX/pjzSCN26sRYwNa9CKYRC3BOAgvHoJyuxqNsnRDRzf67GnupI1x4CV354V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m7xtot/L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D534FC4CED1;
	Fri,  7 Mar 2025 04:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741321157;
	bh=jF2FPa66QDBZ6tSBhJch3R++EPhCPpvxAmCZwq5WTIw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m7xtot/Lt0LFY7vihSIgRz8bcjTz7WSNfg5W1XcUjFau17R9AfuIo7lUyNIaOY/AZ
	 ixRzMmH8/hYnFeqSv5W1CUjBgE8+7GFvwYuO6Awqk4fg1UuqCtJsN7ZWMsQr20waxF
	 20Ui6g74C39OxdprXojVr32xwUsKVdXLbT+vXT9BH+xKP/iRb/vOD6CfDr1JZab9gv
	 xAYZlXqAnigjOZuluwXgziWhVs5iTQPeIay24TnTwOrCRpJiJ7rUE2uy5sPLypwyIU
	 fY1IJ4IzMEpeVxCElrrNr6qut8AKQr+PzygyUisotp7UFkF8/6QOZp2OVqku/6FjwB
	 mPB0WhuusaTCg==
From: Kees Cook <kees@kernel.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Hao Luo <haoluo@google.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	linux-hardening@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-kbuild@vger.kernel.org,
	Bill Wendling <morbo@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Tony Ambardar <tony.ambardar@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Jan Hendrik Farr <kernel@jfarr.cc>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 1/3] ubsan/overflow: Rework integer overflow sanitizer option to turn on everything
Date: Thu,  6 Mar 2025 20:19:09 -0800
Message-Id: <20250307041914.937329-1-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250307040948.work.791-kees@kernel.org>
References: <20250307040948.work.791-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10875; i=kees@kernel.org; h=from:subject; bh=jF2FPa66QDBZ6tSBhJch3R++EPhCPpvxAmCZwq5WTIw=; b=owGbwMvMwCVmps19z/KJym7G02pJDOmnivc12DiqfHFzPZRQcErs48W+2m9Cyv4Tqp5zrr/fE 1J91LW/o5SFQYyLQVZMkSXIzj3OxeNte7j7XEWYOaxMIEMYuDgFYCKiogx/ZaobtZWP7PLMvcjF 5HpCa1HFJI8XFWUa7Y/SHQ8f2n1uLSPDu8uvpurGVdn6TmVZl7DO2M5AM6siZc1yt77EI59ytqg zAAA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Since we're going to approach integer overflow mitigation a type at a
time, we need to enable all of the associated sanitizers, and then opt
into types one at a time.

Rename the existing "signed wrap" sanitizer to just the entire topic area:
"integer wrap". Enable the implicit integer truncation sanitizers, with
required callbacks and tests.

Notably, this requires features (currently) only available in Clang,
so we can depend on the cc-option tests to determine availability
instead of doing version tests.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Justin Stitt <justinstitt@google.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Marco Elver <elver@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Hao Luo <haoluo@google.com>
Cc: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: linux-hardening@vger.kernel.org
Cc: kasan-dev@googlegroups.com
Cc: linux-kbuild@vger.kernel.org
---
 include/linux/compiler_types.h  |  2 +-
 kernel/configs/hardening.config |  2 +-
 lib/Kconfig.ubsan               | 23 +++++++++++------------
 lib/test_ubsan.c                | 18 ++++++++++++++----
 lib/ubsan.c                     | 28 ++++++++++++++++++++++++++--
 lib/ubsan.h                     |  8 ++++++++
 scripts/Makefile.lib            |  4 ++--
 scripts/Makefile.ubsan          |  8 ++++++--
 8 files changed, 69 insertions(+), 24 deletions(-)

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index f59393464ea7..4ad3e900bc3d 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -360,7 +360,7 @@ struct ftrace_likely_data {
 #endif
 
 /* Do not trap wrapping arithmetic within an annotated function. */
-#ifdef CONFIG_UBSAN_SIGNED_WRAP
+#ifdef CONFIG_UBSAN_INTEGER_WRAP
 # define __signed_wrap __attribute__((no_sanitize("signed-integer-overflow")))
 #else
 # define __signed_wrap
diff --git a/kernel/configs/hardening.config b/kernel/configs/hardening.config
index 3fabb8f55ef6..dd7c32fb5ac1 100644
--- a/kernel/configs/hardening.config
+++ b/kernel/configs/hardening.config
@@ -46,7 +46,7 @@ CONFIG_UBSAN_BOUNDS=y
 # CONFIG_UBSAN_SHIFT is not set
 # CONFIG_UBSAN_DIV_ZERO is not set
 # CONFIG_UBSAN_UNREACHABLE is not set
-# CONFIG_UBSAN_SIGNED_WRAP is not set
+# CONFIG_UBSAN_INTEGER_WRAP is not set
 # CONFIG_UBSAN_BOOL is not set
 # CONFIG_UBSAN_ENUM is not set
 # CONFIG_UBSAN_ALIGNMENT is not set
diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
index 1d4aa7a83b3a..63e5622010e0 100644
--- a/lib/Kconfig.ubsan
+++ b/lib/Kconfig.ubsan
@@ -116,21 +116,20 @@ config UBSAN_UNREACHABLE
 	  This option enables -fsanitize=unreachable which checks for control
 	  flow reaching an expected-to-be-unreachable position.
 
-config UBSAN_SIGNED_WRAP
-	bool "Perform checking for signed arithmetic wrap-around"
+config UBSAN_INTEGER_WRAP
+	bool "Perform checking for integer arithmetic wrap-around"
 	default UBSAN
 	depends on !COMPILE_TEST
-	# The no_sanitize attribute was introduced in GCC with version 8.
-	depends on !CC_IS_GCC || GCC_VERSION >= 80000
 	depends on $(cc-option,-fsanitize=signed-integer-overflow)
-	help
-	  This option enables -fsanitize=signed-integer-overflow which checks
-	  for wrap-around of any arithmetic operations with signed integers.
-	  This currently performs nearly no instrumentation due to the
-	  kernel's use of -fno-strict-overflow which converts all would-be
-	  arithmetic undefined behavior into wrap-around arithmetic. Future
-	  sanitizer versions will allow for wrap-around checking (rather than
-	  exclusively undefined behavior).
+	depends on $(cc-option,-fsanitize=unsigned-integer-overflow)
+	depends on $(cc-option,-fsanitize=implicit-signed-integer-truncation)
+	depends on $(cc-option,-fsanitize=implicit-unsigned-integer-truncation)
+	help
+	  This option enables all of the sanitizers involved in integer overflow
+	  (wrap-around) mitigation: signed-integer-overflow, unsigned-integer-overflow,
+	  implicit-signed-integer-truncation, and implicit-unsigned-integer-truncation.
+	  This is currently limited only to the size_t type while testing and
+	  compiler development continues.
 
 config UBSAN_BOOL
 	bool "Perform checking for non-boolean values used as boolean"
diff --git a/lib/test_ubsan.c b/lib/test_ubsan.c
index 5d7b10e98610..8772e5edaa4f 100644
--- a/lib/test_ubsan.c
+++ b/lib/test_ubsan.c
@@ -15,7 +15,7 @@ static void test_ubsan_add_overflow(void)
 {
 	volatile int val = INT_MAX;
 
-	UBSAN_TEST(CONFIG_UBSAN_SIGNED_WRAP);
+	UBSAN_TEST(CONFIG_UBSAN_INTEGER_WRAP);
 	val += 2;
 }
 
@@ -24,7 +24,7 @@ static void test_ubsan_sub_overflow(void)
 	volatile int val = INT_MIN;
 	volatile int val2 = 2;
 
-	UBSAN_TEST(CONFIG_UBSAN_SIGNED_WRAP);
+	UBSAN_TEST(CONFIG_UBSAN_INTEGER_WRAP);
 	val -= val2;
 }
 
@@ -32,7 +32,7 @@ static void test_ubsan_mul_overflow(void)
 {
 	volatile int val = INT_MAX / 2;
 
-	UBSAN_TEST(CONFIG_UBSAN_SIGNED_WRAP);
+	UBSAN_TEST(CONFIG_UBSAN_INTEGER_WRAP);
 	val *= 3;
 }
 
@@ -40,7 +40,7 @@ static void test_ubsan_negate_overflow(void)
 {
 	volatile int val = INT_MIN;
 
-	UBSAN_TEST(CONFIG_UBSAN_SIGNED_WRAP);
+	UBSAN_TEST(CONFIG_UBSAN_INTEGER_WRAP);
 	val = -val;
 }
 
@@ -53,6 +53,15 @@ static void test_ubsan_divrem_overflow(void)
 	val /= val2;
 }
 
+static void test_ubsan_truncate_signed(void)
+{
+	volatile long val = LONG_MAX;
+	volatile int val2 = 0;
+
+	UBSAN_TEST(CONFIG_UBSAN_INTEGER_WRAP);
+	val2 = val;
+}
+
 static void test_ubsan_shift_out_of_bounds(void)
 {
 	volatile int neg = -1, wrap = 4;
@@ -127,6 +136,7 @@ static const test_ubsan_fp test_ubsan_array[] = {
 	test_ubsan_sub_overflow,
 	test_ubsan_mul_overflow,
 	test_ubsan_negate_overflow,
+	test_ubsan_truncate_signed,
 	test_ubsan_shift_out_of_bounds,
 	test_ubsan_out_of_bounds,
 	test_ubsan_load_invalid_value,
diff --git a/lib/ubsan.c b/lib/ubsan.c
index a1c983d148f1..cdc1d31c3821 100644
--- a/lib/ubsan.c
+++ b/lib/ubsan.c
@@ -44,7 +44,7 @@ const char *report_ubsan_failure(struct pt_regs *regs, u32 check_type)
 	case ubsan_shift_out_of_bounds:
 		return "UBSAN: shift out of bounds";
 #endif
-#if defined(CONFIG_UBSAN_DIV_ZERO) || defined(CONFIG_UBSAN_SIGNED_WRAP)
+#if defined(CONFIG_UBSAN_DIV_ZERO) || defined(CONFIG_UBSAN_INTEGER_WRAP)
 	/*
 	 * SanitizerKind::IntegerDivideByZero and
 	 * SanitizerKind::SignedIntegerOverflow emit
@@ -79,7 +79,7 @@ const char *report_ubsan_failure(struct pt_regs *regs, u32 check_type)
 	case ubsan_type_mismatch:
 		return "UBSAN: type mismatch";
 #endif
-#ifdef CONFIG_UBSAN_SIGNED_WRAP
+#ifdef CONFIG_UBSAN_INTEGER_WRAP
 	/*
 	 * SanitizerKind::SignedIntegerOverflow emits
 	 * SanitizerHandler::AddOverflow, SanitizerHandler::SubOverflow,
@@ -303,6 +303,30 @@ void __ubsan_handle_negate_overflow(void *_data, void *old_val)
 }
 EXPORT_SYMBOL(__ubsan_handle_negate_overflow);
 
+void __ubsan_handle_implicit_conversion(void *_data, void *from_val, void *to_val)
+{
+	struct implicit_conversion_data *data = _data;
+	char from_val_str[VALUE_LENGTH];
+	char to_val_str[VALUE_LENGTH];
+
+	if (suppress_report(&data->location))
+		return;
+
+	val_to_string(from_val_str, sizeof(from_val_str), data->from_type, from_val);
+	val_to_string(to_val_str, sizeof(to_val_str), data->to_type, to_val);
+
+	ubsan_prologue(&data->location, "implicit-conversion");
+
+	pr_err("cannot represent %s value %s during %s %s, truncated to %s\n",
+		data->from_type->type_name,
+		from_val_str,
+		type_check_kinds[data->type_check_kind],
+		data->to_type->type_name,
+		to_val_str);
+
+	ubsan_epilogue();
+}
+EXPORT_SYMBOL(__ubsan_handle_implicit_conversion);
 
 void __ubsan_handle_divrem_overflow(void *_data, void *lhs, void *rhs)
 {
diff --git a/lib/ubsan.h b/lib/ubsan.h
index 07e37d4429b4..b37e22374e77 100644
--- a/lib/ubsan.h
+++ b/lib/ubsan.h
@@ -62,6 +62,13 @@ struct overflow_data {
 	struct type_descriptor *type;
 };
 
+struct implicit_conversion_data {
+	struct source_location location;
+	struct type_descriptor *from_type;
+	struct type_descriptor *to_type;
+	unsigned char type_check_kind;
+};
+
 struct type_mismatch_data {
 	struct source_location location;
 	struct type_descriptor *type;
@@ -142,6 +149,7 @@ void ubsan_linkage __ubsan_handle_sub_overflow(void *data, void *lhs, void *rhs)
 void ubsan_linkage __ubsan_handle_mul_overflow(void *data, void *lhs, void *rhs);
 void ubsan_linkage __ubsan_handle_negate_overflow(void *_data, void *old_val);
 void ubsan_linkage __ubsan_handle_divrem_overflow(void *_data, void *lhs, void *rhs);
+void ubsan_linkage __ubsan_handle_implicit_conversion(void *_data, void *lhs, void *rhs);
 void ubsan_linkage __ubsan_handle_type_mismatch(struct type_mismatch_data *data, void *ptr);
 void ubsan_linkage __ubsan_handle_type_mismatch_v1(void *_data, void *ptr);
 void ubsan_linkage __ubsan_handle_out_of_bounds(void *_data, void *index);
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index cad20f0e66ee..981d14ef9db2 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -166,8 +166,8 @@ _c_flags += $(if $(patsubst n%,, \
 		$(UBSAN_SANITIZE_$(target-stem).o)$(UBSAN_SANITIZE)$(is-kernel-object)), \
 		$(CFLAGS_UBSAN))
 _c_flags += $(if $(patsubst n%,, \
-		$(UBSAN_SIGNED_WRAP_$(target-stem).o)$(UBSAN_SANITIZE_$(target-stem).o)$(UBSAN_SIGNED_WRAP)$(UBSAN_SANITIZE)$(is-kernel-object)), \
-		$(CFLAGS_UBSAN_SIGNED_WRAP))
+		$(UBSAN_INTEGER_WRAP_$(target-stem).o)$(UBSAN_SANITIZE_$(target-stem).o)$(UBSAN_INTEGER_WRAP)$(UBSAN_SANITIZE)$(is-kernel-object)), \
+		$(CFLAGS_UBSAN_INTEGER_WRAP))
 endif
 
 ifeq ($(CONFIG_KCOV),y)
diff --git a/scripts/Makefile.ubsan b/scripts/Makefile.ubsan
index b2d3b273b802..4fad9afed24c 100644
--- a/scripts/Makefile.ubsan
+++ b/scripts/Makefile.ubsan
@@ -14,5 +14,9 @@ ubsan-cflags-$(CONFIG_UBSAN_TRAP)		+= $(call cc-option,-fsanitize-trap=undefined
 
 export CFLAGS_UBSAN := $(ubsan-cflags-y)
 
-ubsan-signed-wrap-cflags-$(CONFIG_UBSAN_SIGNED_WRAP)     += -fsanitize=signed-integer-overflow
-export CFLAGS_UBSAN_SIGNED_WRAP := $(ubsan-signed-wrap-cflags-y)
+ubsan-integer-wrap-cflags-$(CONFIG_UBSAN_INTEGER_WRAP)     +=	\
+	-fsanitize=signed-integer-overflow			\
+	-fsanitize=unsigned-integer-overflow			\
+	-fsanitize=implicit-signed-integer-truncation		\
+	-fsanitize=implicit-unsigned-integer-truncation
+export CFLAGS_UBSAN_INTEGER_WRAP := $(ubsan-integer-wrap-cflags-y)
-- 
2.34.1


