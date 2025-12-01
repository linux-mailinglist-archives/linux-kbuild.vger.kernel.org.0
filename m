Return-Path: <linux-kbuild+bounces-9919-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C3EC95937
	for <lists+linux-kbuild@lfdr.de>; Mon, 01 Dec 2025 03:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3831F3A1B17
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Dec 2025 02:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558C217A309;
	Mon,  1 Dec 2025 02:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ggTpk1m2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1551F146D53;
	Mon,  1 Dec 2025 02:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764555474; cv=none; b=i8OU3Q84H0c3+Cv6KvuAF3g/WKDL26N0olY8qLB2N86IKc6NYk5TfGN3V0LhmtohDJWZxYb0tXh9voj6CUTKGToF2WoBhMqc1anvugeuSL6Nc7SxaYLFOa3tlNoKOMlhePnMtxzbX7V7q9db1r6rN+OqZbsl9+ZlxlBPLK3F6ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764555474; c=relaxed/simple;
	bh=QPcB6NV9WphWByyTSrRRobitP73Z6jrcq8qO99pRXQI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h/8R2rN7B7grjf1ow+UWBvWwlGW+QtvBtL3Gg1UcAZ7sr6diAyFJkLSMlRspy6mU3skXVIY35pKBSsj5I74VKhZxDKya8X1DOnkhY7xIQJ6L7aEHJWbCXbYQsfN+QsOcphxUJ2jiysHCr8weIjV6jwE1e9BllmKY703+2XOtcZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ggTpk1m2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DE88C4CEFB;
	Mon,  1 Dec 2025 02:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764555472;
	bh=QPcB6NV9WphWByyTSrRRobitP73Z6jrcq8qO99pRXQI=;
	h=From:To:Cc:Subject:Date:From;
	b=ggTpk1m2Nje0+iGbz6w+KoJDZBdoB7V5hd1eq8aPY/Eyac5UOqK/rreG2Zz0GfX3R
	 KwXhYBIpjndhE61mXOcy2Zibx4GSHlo1RSczoxtU6WkDb5KL6h9y022r0xI6jxbXJc
	 vtHsLvBl7EPdQllPhjcZriLn6+2GPC5t5cvU11eoXZfCXZmJFGrO20ljpCjZ8qjXo4
	 HbWxug7ON06LpOEjwNWjjW3u147ju0zQH0uvhqI9CdLBRSQSztD2jXoGlDeBLTXXgJ
	 sDggZVQ32duHuqgj4eMM52vVVqPRImNnBO8qASN/w0P4xknRsuBOJ5WmDoACkA79RE
	 KmCrKuv6LNctg==
From: Miguel Ojeda <ojeda@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Sergio=20Gonz=C3=A1lez=20Collado?= <sergio.collado@gmail.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: `KSYM_NAME_LEN` strikes again
Date: Mon,  1 Dec 2025 03:16:59 +0100
Message-ID: <20251201021659.1729308-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

In some Rust configs with -Os and doctests enabled, we are hitting
KSYM_NAME_LEN again:

    Symbol _RINvMs3_NvNtNtCs1ewLyjEZ7Le_6kernel4sync4lock1__INtB6_12___ThePinData
    NtNvNvNvCs1RN9EnoqSlC_25doctests_kernel_generated43rust_doctest_kernel_sync_lock_spinlock_rs_0
    4main52__doctest_main_rust_kernel_sync_lock_spinlock_rs_34_05InnerNtNtB8_8spinlock
    15SpinLockBackendE5stateNtNtCsb7ts3l0a5c3_4core7convert10InfallibleINtNtCs5hDniGXnib3_
    8pin_init10___internal11InitClosureNCINvMs5_NtBc_5typesINtB61_6OpaqueNtNtCse4H1uDrGHP9_
    8bindings12bindings_raw8spinlockE8ffi_initNCNCNvMs0_B8_INtB8_4LockB15_B3F_E3new0s_0E0B6c_B4j_EEB1d_
    too long for kallsyms (518 >= 512).
    Please increase KSYM_NAME_LEN both in kernel and kallsyms.c

Which expands to e.g.

    <kernel::sync::lock::_::__ThePinData<doctests_kernel_generated::rust_doctest_kernel_sync_lock_spinlock_rs_0::main::_doctest_main_rust_kernel_sync_lock_spinlock_rs_34_0::Inner,
    kernel::sync::lock::spinlock::SpinLockBackend>>::state::<core::convert::Infallible,
    pin_init::__internal::InitClosure<<kernel::types::Opaque<bindings::bindings_raw::spinlock>>::ffi_init
    <<kernel::sync::lock::Lock<doctests_kernel_generated::rust_doctest_kernel_sync_lock_spinlock_rs_0::main::_doctest_main_rust_kernel_sync_lock_spinlock_rs_34_0::Inner,
    kernel::sync::lock::spinlock::SpinLockBackend>>::new::{closure#0}::{closure#1}>::{closure#0},
    kernel::types::Opaque<bindings::bindings_raw::spinlock>, core::convert::Infallible>>

If we decide to increase KSYM_NAME_LEN again, we need to use a number
that is a multiple of 64:

    BUILD_BUG_ON(KSYM_NAME_LEN % sizeof(u64));

I first tried with 512+128, but I still saw things symbols slightly over
that:

    too long for kallsyms (645 >= 640).

So I picked 512+256 and it builds clean with a patch like the one below.
Hopefully nobody relies on it being a power of 2.

Other options:

  - Conditionally doing it only for those builds that need it, to avoid
    penalizing other builds (including normal Rust builds).

  - Building the Rust side with -O2 for now, or at least tweaking some
    of the inlining behavior under -Os.

  - Not supporting Rust for `CC_OPTIMIZE_FOR_SIZE` for now (e.g. under
    `BROKEN`).

  - Stop all this and go with a hashing approach like Willy/Linus
    discussed back then:

        https://lore.kernel.org/rust-for-linux/CAHk-=whzXv=Fu7dQshSTyd9H1-JS5=gyKwW-GMNGccAKs4Mwpg@mail.gmail.com/

Cheers,
Miguel

From: Miguel Ojeda <ojeda@kernel.org>
Date: Sun, 30 Nov 2025 17:46:29 +0100
Subject: [PATCH] kallsyms: increase KSYM_NAME_LEN to 768 (512+256)

Untested!
---
 include/linux/kallsyms.h            | 2 +-
 kernel/livepatch/core.c             | 4 ++--
 lib/tests/longest_symbol_kunit.c    | 7 +++++--
 scripts/kallsyms.c                  | 2 +-
 tools/include/linux/kallsyms.h      | 2 +-
 tools/lib/perf/include/perf/event.h | 2 +-
 tools/lib/symbol/kallsyms.h         | 2 +-
 7 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/include/linux/kallsyms.h b/include/linux/kallsyms.h
index d5dd54c53ace..f17d335f36b2 100644
--- a/include/linux/kallsyms.h
+++ b/include/linux/kallsyms.h
@@ -15,7 +15,7 @@

 #include <asm/sections.h>

-#define KSYM_NAME_LEN 512
+#define KSYM_NAME_LEN 768
 #define KSYM_SYMBOL_LEN (sizeof("%s+%#lx/%#lx [%s %s]") + \
 			(KSYM_NAME_LEN - 1) + \
 			2*(BITS_PER_LONG*3/10) + (MODULE_NAME_LEN - 1) + \
diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
index 0e73fac55f8e..cf7f2d561386 100644
--- a/kernel/livepatch/core.c
+++ b/kernel/livepatch/core.c
@@ -210,7 +210,7 @@ static int klp_resolve_symbols(Elf_Shdr *sechdrs, const char *strtab,
 	 * we use the smallest/strictest upper bound possible (56, based on
 	 * the current definition of MODULE_NAME_LEN) to prevent overflows.
 	 */
-	BUILD_BUG_ON(MODULE_NAME_LEN < 56 || KSYM_NAME_LEN != 512);
+	BUILD_BUG_ON(MODULE_NAME_LEN < 56 || KSYM_NAME_LEN != 768);

 	relas = (Elf_Rela *) relasec->sh_addr;
 	/* For each rela in this klp relocation section */
@@ -224,7 +224,7 @@ static int klp_resolve_symbols(Elf_Shdr *sechdrs, const char *strtab,

 		/* Format: .klp.sym.sym_objname.sym_name,sympos */
 		cnt = sscanf(strtab + sym->st_name,
-			     ".klp.sym.%55[^.].%511[^,],%lu",
+			     ".klp.sym.%55[^.].%767[^,],%lu",
 			     sym_objname, sym_name, &sympos);
 		if (cnt != 3) {
 			pr_err("symbol %s has an incorrectly formatted name\n",
diff --git a/lib/tests/longest_symbol_kunit.c b/lib/tests/longest_symbol_kunit.c
index 9b4de3050ba7..ff8eed2cb4bd 100644
--- a/lib/tests/longest_symbol_kunit.c
+++ b/lib/tests/longest_symbol_kunit.c
@@ -19,8 +19,11 @@
 #define DDDDI(name) DDDI(n##name##name)
 #define DDDDDI(name) DDDDI(n##name##name)

-/*Generate a symbol whose name length is 511 */
-#define LONGEST_SYM_NAME  DDDDDI(g1h2i3j4k5l6m7n)
+#define __SUM(A, B) s##A##B
+#define SUM(A, B) __SUM(A, B)
+
+/* Generate a symbol whose name length is KSYM_NAME_LEN (including null) */
+#define LONGEST_SYM_NAME SUM(DDDDDI(g1h2i3j4k5l6m7n),DDDDI(g1h2i3j4k5l6m7n))

 #define RETURN_LONGEST_SYM 0xAAAAA

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 4b0234e4b12f..c90bb90c874e 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -31,7 +31,7 @@

 #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof(arr[0]))

-#define KSYM_NAME_LEN		512
+#define KSYM_NAME_LEN		768

 struct sym_entry {
 	unsigned long long addr;
diff --git a/tools/include/linux/kallsyms.h b/tools/include/linux/kallsyms.h
index f61a01dd7eb7..089b59906641 100644
--- a/tools/include/linux/kallsyms.h
+++ b/tools/include/linux/kallsyms.h
@@ -6,7 +6,7 @@
 #include <stdio.h>
 #include <unistd.h>

-#define KSYM_NAME_LEN 512
+#define KSYM_NAME_LEN 768

 struct module;

diff --git a/tools/lib/perf/include/perf/event.h b/tools/lib/perf/include/perf/event.h
index aa1e91c97a22..ea3debf97db9 100644
--- a/tools/lib/perf/include/perf/event.h
+++ b/tools/lib/perf/include/perf/event.h
@@ -104,7 +104,7 @@ struct perf_record_throttle {
 };

 #ifndef KSYM_NAME_LEN
-#define KSYM_NAME_LEN 512
+#define KSYM_NAME_LEN 768
 #endif

 struct perf_record_ksymbol {
diff --git a/tools/lib/symbol/kallsyms.h b/tools/lib/symbol/kallsyms.h
index 542f9b059c3b..435f626c92d1 100644
--- a/tools/lib/symbol/kallsyms.h
+++ b/tools/lib/symbol/kallsyms.h
@@ -7,7 +7,7 @@
 #include <linux/types.h>

 #ifndef KSYM_NAME_LEN
-#define KSYM_NAME_LEN 512
+#define KSYM_NAME_LEN 768
 #endif

 static inline u8 kallsyms2elf_binding(char type)

base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
--
2.52.0

