Return-Path: <linux-kbuild+bounces-5559-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4A7A1DC87
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Jan 2025 20:11:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 153E57A40FC
	for <lists+linux-kbuild@lfdr.de>; Mon, 27 Jan 2025 19:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93323193435;
	Mon, 27 Jan 2025 19:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ie//lXsv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5566C190664;
	Mon, 27 Jan 2025 19:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738005035; cv=none; b=KfQ6VA67BpeOHL87MgFg9GQEy69ankitdaJx5zxPYWWWgpqUa3tOcfthcveLNAdkEHX8SeksIB9RVSW73f02BTxI4+FU/8MjzVW/FXDTgHEsgysGbZBT1Nn3pQy8AcZDGp44p/PHnsxqmrx4ugYCyNse2jZ8PZA6WROkhKv31Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738005035; c=relaxed/simple;
	bh=YPJwq5DVB44I+jO9br7SuFQ3XjAuvyyVVkJP3VZKCec=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=koNnNFxPnwM3HJK9Nbp0HoWQx8WjNP3bO4AsVhRcbbFln+fw8RlHnOUrFPq+bd6I8LLTIeVYEWuUBgCrZireBpVGPtZ2pqBxbhAcOj3ncOzSg8fuhGHXfW1E216G7dD+jUXWfT3+ykX7No6w47SpZYKHUeaafqe78o3l3nRysTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ie//lXsv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0CB2C4CED2;
	Mon, 27 Jan 2025 19:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738005034;
	bh=YPJwq5DVB44I+jO9br7SuFQ3XjAuvyyVVkJP3VZKCec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ie//lXsvp/0M2huuTvS56N8tWu5emnzuYiJAXnkMps1eO29AxNkNrVmvxp8lacRlr
	 imajBbxc/PiH/IDsmhNDQ4TsQaPj72jBgZS/6Ew5QO5hzwKTmo83vFm/hOfxvy6Q9Y
	 RsduXBTQP7Gq6vPf8RHkaElPNkJ9limjRIF/WNk7bvLaGzFWehPHhSYnsEQCXJ6ojX
	 7dUVLbNe2LMxQYG/eJJ/5GltNqLTf0qPjVqx/oObb1P0Tt683rWR6Ap7zCFoO17pzw
	 z8s+x2UOkJSgv1gTuprpDXhHFDTrxWGtIRu5zjAlsuPvgoJbFv1te3wllVjvC07dup
	 1278wS6KQ2tJA==
From: Kees Cook <kees@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jakub Jelinek <jakub@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 2/3] stackinit: Add union initialization to selftests
Date: Mon, 27 Jan 2025 11:10:27 -0800
Message-Id: <20250127191031.245214-2-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250127190636.it.745-kees@kernel.org>
References: <20250127190636.it.745-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9240; i=kees@kernel.org; h=from:subject; bh=YPJwq5DVB44I+jO9br7SuFQ3XjAuvyyVVkJP3VZKCec=; b=owGbwMvMwCVmps19z/KJym7G02pJDOnTbylXTK96M7X/N5f61D9+k/VCjy6q+pY+LfFIaWZM0 DNG+wLGjlIWBjEuBlkxRZYgO/c4F4+37eHucxVh5rAygQxh4OIUgIlE9DEyrAlxNe9VmLPf+nD+ Z863Rhn8h7KZX0TUG3E9/FiSqrI+kZHhz743N7dLzT4hFLL9z/y6l1tCp148ab3uoYtZVqmiSmE IOwA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

The stack initialization selftests were checking scalars, strings,
and structs, but not unions. Add union tests (which are mostly identical
setup to structs). This catches the recent union initialization behavioral
changes seen in GCC 15. Before GCC 15, this new test passes:

    ok 18 test_small_start_old_zero

With GCC 15, it fails:

    not ok 18 test_small_start_old_zero

Specifically, a union with a larger member where a smaller member is
initialized with the older "= { 0 }" syntax:

union test_small_start {
     char one:1;
     char two;
     short three;
     unsigned long four;
     struct big_struct {
             unsigned long array[8];
     } big;
};

This is a regression in compiler behavior that Linux has depended on.
GCC does not seem likely to fix it, instead suggesting that affected
projects start using -fzero-init-padding-bits=unions:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=118403

Signed-off-by: Kees Cook <kees@kernel.org>
---
 lib/stackinit_kunit.c | 103 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/lib/stackinit_kunit.c b/lib/stackinit_kunit.c
index 7cc9af181e89..fbe910c9c825 100644
--- a/lib/stackinit_kunit.c
+++ b/lib/stackinit_kunit.c
@@ -47,10 +47,12 @@ static bool stackinit_range_contains(char *haystack_start, size_t haystack_size,
 #define DO_NOTHING_TYPE_SCALAR(var_type)	var_type
 #define DO_NOTHING_TYPE_STRING(var_type)	void
 #define DO_NOTHING_TYPE_STRUCT(var_type)	void
+#define DO_NOTHING_TYPE_UNION(var_type)		void
 
 #define DO_NOTHING_RETURN_SCALAR(ptr)		*(ptr)
 #define DO_NOTHING_RETURN_STRING(ptr)		/**/
 #define DO_NOTHING_RETURN_STRUCT(ptr)		/**/
+#define DO_NOTHING_RETURN_UNION(ptr)		/**/
 
 #define DO_NOTHING_CALL_SCALAR(var, name)			\
 		(var) = do_nothing_ ## name(&(var))
@@ -58,10 +60,13 @@ static bool stackinit_range_contains(char *haystack_start, size_t haystack_size,
 		do_nothing_ ## name(var)
 #define DO_NOTHING_CALL_STRUCT(var, name)			\
 		do_nothing_ ## name(&(var))
+#define DO_NOTHING_CALL_UNION(var, name)			\
+		do_nothing_ ## name(&(var))
 
 #define FETCH_ARG_SCALAR(var)		&var
 #define FETCH_ARG_STRING(var)		var
 #define FETCH_ARG_STRUCT(var)		&var
+#define FETCH_ARG_UNION(var)		&var
 
 /*
  * On m68k, if the leaf function test variable is longer than 8 bytes,
@@ -77,6 +82,7 @@ static bool stackinit_range_contains(char *haystack_start, size_t haystack_size,
 #define INIT_CLONE_SCALAR		/**/
 #define INIT_CLONE_STRING		[FILL_SIZE_STRING]
 #define INIT_CLONE_STRUCT		/**/
+#define INIT_CLONE_UNION		/**/
 
 #define ZERO_CLONE_SCALAR(zero)		memset(&(zero), 0x00, sizeof(zero))
 #define ZERO_CLONE_STRING(zero)		memset(&(zero), 0x00, sizeof(zero))
@@ -92,6 +98,7 @@ static bool stackinit_range_contains(char *haystack_start, size_t haystack_size,
 		zero.three = 0;				\
 		zero.four = 0;				\
 	} while (0)
+#define ZERO_CLONE_UNION(zero)		ZERO_CLONE_STRUCT(zero)
 
 #define INIT_SCALAR_none(var_type)	/**/
 #define INIT_SCALAR_zero(var_type)	= 0
@@ -147,6 +154,34 @@ static bool stackinit_range_contains(char *haystack_start, size_t haystack_size,
 #define INIT_STRUCT_assigned_copy(var_type)				\
 					; var = *(arg)
 
+/* Union initialization is the same as structs. */
+#define INIT_UNION_none(var_type)	INIT_STRUCT_none(var_type)
+#define INIT_UNION_zero(var_type)	INIT_STRUCT_zero(var_type)
+#define INIT_UNION_old_zero(var_type)	INIT_STRUCT_old_zero(var_type)
+
+#define INIT_UNION_static_partial(var_type)		\
+	INIT_STRUCT_static_partial(var_type)
+#define INIT_UNION_static_all(var_type)			\
+	INIT_STRUCT_static_all(var_type)
+#define INIT_UNION_dynamic_partial(var_type)		\
+	INIT_STRUCT_dynamic_partial(var_type)
+#define INIT_UNION_dynamic_all(var_type)		\
+	INIT_STRUCT_dynamic_all(var_type)
+#define INIT_UNION_runtime_partial(var_type)		\
+	INIT_STRUCT_runtime_partial(var_type)
+#define INIT_UNION_runtime_all(var_type)		\
+	INIT_STRUCT_runtime_all(var_type)
+#define INIT_UNION_assigned_static_partial(var_type)	\
+	INIT_STRUCT_assigned_static_partial(var_type)
+#define INIT_UNION_assigned_static_all(var_type)	\
+	INIT_STRUCT_assigned_static_all(var_type)
+#define INIT_UNION_assigned_dynamic_partial(var_type)	\
+	INIT_STRUCT_assigned_dynamic_partial(var_type)
+#define INIT_UNION_assigned_dynamic_all(var_type)	\
+	INIT_STRUCT_assigned_dynamic_all(var_type)
+#define INIT_UNION_assigned_copy(var_type)		\
+	INIT_STRUCT_assigned_copy(var_type)
+
 /*
  * @name: unique string name for the test
  * @var_type: type to be tested for zeroing initialization
@@ -295,6 +330,33 @@ struct test_user {
 	unsigned long four;
 };
 
+/* No padding: all members are the same size. */
+union test_same_sizes {
+	unsigned long one;
+	unsigned long two;
+	unsigned long three;
+	unsigned long four;
+};
+
+/* Mismatched sizes, with one and two being small */
+union test_small_start {
+	char one:1;
+	char two;
+	short three;
+	unsigned long four;
+	struct big_struct {
+		unsigned long array[8];
+	} big;
+};
+
+/* Mismatched sizes, with one and two being small */
+union test_small_end {
+	short one;
+	unsigned long two;
+	char three:1;
+	char four;
+};
+
 #define ALWAYS_PASS	WANT_SUCCESS
 #define ALWAYS_FAIL	XFAIL
 
@@ -333,6 +395,11 @@ struct test_user {
 			    struct test_ ## name, STRUCT, init, \
 			    xfail)
 
+#define DEFINE_UNION_TEST(name, init, xfail)			\
+		DEFINE_TEST(name ## _ ## init,			\
+			    union test_ ## name, STRUCT, init,	\
+			    xfail)
+
 #define DEFINE_STRUCT_TESTS(init, xfail)			\
 		DEFINE_STRUCT_TEST(small_hole, init, xfail);	\
 		DEFINE_STRUCT_TEST(big_hole, init, xfail);	\
@@ -344,10 +411,22 @@ struct test_user {
 				    xfail);			\
 		DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
 
+#define DEFINE_UNION_INITIALIZER_TESTS(base, xfail)		\
+		DEFINE_UNION_TESTS(base ## _ ## partial,	\
+				    xfail);			\
+		DEFINE_UNION_TESTS(base ## _ ## all, xfail)
+
+#define DEFINE_UNION_TESTS(init, xfail)				\
+		DEFINE_UNION_TEST(same_sizes, init, xfail);	\
+		DEFINE_UNION_TEST(small_start, init, xfail);	\
+		DEFINE_UNION_TEST(small_end, init, xfail);
+
 /* These should be fully initialized all the time! */
 DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
 DEFINE_STRUCT_TESTS(zero, ALWAYS_PASS);
 DEFINE_STRUCT_TESTS(old_zero, ALWAYS_PASS);
+DEFINE_UNION_TESTS(zero, ALWAYS_PASS);
+DEFINE_UNION_TESTS(old_zero, ALWAYS_PASS);
 /* Struct initializers: padding may be left uninitialized. */
 DEFINE_STRUCT_INITIALIZER_TESTS(static, STRONG_PASS);
 DEFINE_STRUCT_INITIALIZER_TESTS(dynamic, STRONG_PASS);
@@ -355,6 +434,12 @@ DEFINE_STRUCT_INITIALIZER_TESTS(runtime, STRONG_PASS);
 DEFINE_STRUCT_INITIALIZER_TESTS(assigned_static, STRONG_PASS);
 DEFINE_STRUCT_INITIALIZER_TESTS(assigned_dynamic, STRONG_PASS);
 DEFINE_STRUCT_TESTS(assigned_copy, ALWAYS_FAIL);
+DEFINE_UNION_INITIALIZER_TESTS(static, STRONG_PASS);
+DEFINE_UNION_INITIALIZER_TESTS(dynamic, STRONG_PASS);
+DEFINE_UNION_INITIALIZER_TESTS(runtime, STRONG_PASS);
+DEFINE_UNION_INITIALIZER_TESTS(assigned_static, STRONG_PASS);
+DEFINE_UNION_INITIALIZER_TESTS(assigned_dynamic, STRONG_PASS);
+DEFINE_UNION_TESTS(assigned_copy, ALWAYS_FAIL);
 /* No initialization without compiler instrumentation. */
 DEFINE_SCALAR_TESTS(none, STRONG_PASS);
 DEFINE_STRUCT_TESTS(none, BYREF_PASS);
@@ -438,14 +523,23 @@ DEFINE_TEST_DRIVER(switch_2_none, uint64_t, SCALAR, ALWAYS_FAIL);
 		KUNIT_CASE(test_trailing_hole_ ## init),\
 		KUNIT_CASE(test_packed_ ## init)	\
 
+#define KUNIT_test_unions(init)				\
+		KUNIT_CASE(test_same_sizes_ ## init),	\
+		KUNIT_CASE(test_small_start_ ## init),	\
+		KUNIT_CASE(test_small_end_ ## init)	\
+
 static struct kunit_case stackinit_test_cases[] = {
 	/* These are explicitly initialized and should always pass. */
 	KUNIT_test_scalars(zero),
 	KUNIT_test_structs(zero),
 	KUNIT_test_structs(old_zero),
+	KUNIT_test_unions(zero),
+	KUNIT_test_unions(old_zero),
 	/* Padding here appears to be accidentally always initialized? */
 	KUNIT_test_structs(dynamic_partial),
 	KUNIT_test_structs(assigned_dynamic_partial),
+	KUNIT_test_unions(dynamic_partial),
+	KUNIT_test_unions(assigned_dynamic_partial),
 	/* Padding initialization depends on compiler behaviors. */
 	KUNIT_test_structs(static_partial),
 	KUNIT_test_structs(static_all),
@@ -455,8 +549,17 @@ static struct kunit_case stackinit_test_cases[] = {
 	KUNIT_test_structs(assigned_static_partial),
 	KUNIT_test_structs(assigned_static_all),
 	KUNIT_test_structs(assigned_dynamic_all),
+	KUNIT_test_unions(static_partial),
+	KUNIT_test_unions(static_all),
+	KUNIT_test_unions(dynamic_all),
+	KUNIT_test_unions(runtime_partial),
+	KUNIT_test_unions(runtime_all),
+	KUNIT_test_unions(assigned_static_partial),
+	KUNIT_test_unions(assigned_static_all),
+	KUNIT_test_unions(assigned_dynamic_all),
 	/* Everything fails this since it effectively performs a memcpy(). */
 	KUNIT_test_structs(assigned_copy),
+	KUNIT_test_unions(assigned_copy),
 	/* STRUCTLEAK_BYREF_ALL should cover everything from here down. */
 	KUNIT_test_scalars(none),
 	KUNIT_CASE(test_switch_1_none),
-- 
2.34.1


