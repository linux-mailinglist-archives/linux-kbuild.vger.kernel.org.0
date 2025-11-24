Return-Path: <linux-kbuild+bounces-9816-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA57C8150E
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 16:25:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D98DF34809A
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 15:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93AA6318121;
	Mon, 24 Nov 2025 15:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="auZhmb4K"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B2631355A;
	Mon, 24 Nov 2025 15:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763997599; cv=none; b=EdHw5R48CZhElzCGueimKrgowRSxcNlnUsFSQJRE0dYTVviWNJ3OEQnAq5wtFNq5txPOaDg8ccokorQRMfdRWZ/xuhGR7OrArvJkVh7DxY31lia7jkxuIq+D6YG7f2FobOUTS9+FaF06LqF2NxOR41fmAvQ+9DLkXGVIdPu/ufk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763997599; c=relaxed/simple;
	bh=9o7Mk4OPTg3U83R+FC8FwjwEWbG4Bl7tPSgERthXmXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MWtBTxZCY8Wjj9H89hMOj0Br8KE4em/C5wVtoVfUZqrpbEWMOPW3JBl+Wti1r+wyjPOHw2HGVim5HtUiOv9/z+ED58IufAgE4Avw1h26/6Po5/2v8C3faU3TFXY7GgJI3hBY6tie9zE47Lb0FpwpGNCz6rE4v/WFSpSYk+DAA3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=auZhmb4K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C070C116C6;
	Mon, 24 Nov 2025 15:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763997599;
	bh=9o7Mk4OPTg3U83R+FC8FwjwEWbG4Bl7tPSgERthXmXs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=auZhmb4KiLqbM2mUSC9CZ3NcG7BhP/vedqZelOKVJbXLxlNpoTtLvh8DZ701Rlf5z
	 BVdc66orhQW06k3g/zoNaBp0yBuH7iLYOwP3FiO9ZVZ7/3jGwUL9cFtYfcziv2o8cn
	 GHSQE55h9pBfKGWyzBOmN8nju5migXE5gT4yjc4G8E0WOZ07MmZdXq3MCDQl07Say3
	 awfjOZO88Np6EX3xoY7u5rWRyuOINCeBAIjPTTYBWEMyH4oxhkvp0S3q3yN3IGeZjC
	 Gpkhiq13up02uaDL5dBTgNpr249JEBXbZJujBmCd+4LldVYGDhpup3FMI9XdImIv7U
	 /I4IfKs6C0D6Q==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Jesung Yang <y.j3ms.n@gmail.com>
Subject: [PATCH v2 14/20] rust: quote: enable support in kbuild
Date: Mon, 24 Nov 2025 16:18:26 +0100
Message-ID: <20251124151837.2184382-15-ojeda@kernel.org>
In-Reply-To: <20251124151837.2184382-1-ojeda@kernel.org>
References: <20251124151837.2184382-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With all the new files in place and ready from the new crate, enable
the support for it in the build system.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Tested-by: Gary Guo <gary@garyguo.net>
Tested-by: Jesung Yang <y.j3ms.n@gmail.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Makefile                          |  1 +
 rust/Makefile                     | 38 ++++++++++++++++++++++++++++---
 scripts/generate_rust_analyzer.py |  7 ++++++
 3 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 589bcfe3bf75..85da055e4f00 100644
--- a/Makefile
+++ b/Makefile
@@ -1834,6 +1834,7 @@ rustfmt:
 	$(Q)find $(srctree) $(RCS_FIND_IGNORE) \
 		\( \
 			-path $(srctree)/rust/proc-macro2 \
+			-o -path $(srctree)/rust/quote \
 		\) -prune -o \
 		-type f -a -name '*.rs' -a ! -name '*generated*' -print \
 		| xargs $(RUSTFMT) $(rustfmt_flags)
diff --git a/rust/Makefile b/rust/Makefile
index 7dd1261ad98f..4f4a00594142 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -27,7 +27,7 @@ endif
 
 obj-$(CONFIG_RUST) += exports.o
 
-always-$(CONFIG_RUST) += libproc_macro2.rlib
+always-$(CONFIG_RUST) += libproc_macro2.rlib libquote.rlib
 
 always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.rs
 always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.c
@@ -89,6 +89,18 @@ proc_macro2-flags := \
     -Zcrate-attr='feature(proc_macro_byte_character,proc_macro_c_str_literals)' \
     $(call cfgs-to-flags,$(proc_macro2-cfgs))
 
+quote-cfgs := \
+    feature="proc-macro"
+
+quote-skip_flags := \
+    --edition=2021
+
+quote-flags := \
+    --edition=2018 \
+    --cap-lints=allow \
+    --extern proc_macro2 \
+    $(call cfgs-to-flags,$(quote-cfgs))
+
 # `rustdoc` did not save the target modifiers, thus workaround for
 # the time being (https://github.com/rust-lang/rust/issues/144521).
 rustdoc_modifiers_workaround := $(if $(call rustc-min-version,108800),-Cunsafe-allow-abi-mismatch=fixed-x18)
@@ -143,10 +155,17 @@ rustdoc-proc_macro2: private rustc_target_flags = $(proc_macro2-flags)
 rustdoc-proc_macro2: $(src)/proc-macro2/lib.rs rustdoc-clean FORCE
 	+$(call if_changed,rustdoc)
 
+rustdoc-quote: private rustdoc_host = yes
+rustdoc-quote: private rustc_target_flags = $(quote-flags)
+rustdoc-quote: private skip_flags = $(quote-skip_flags)
+rustdoc-quote: $(src)/quote/lib.rs rustdoc-clean rustdoc-proc_macro2 FORCE
+	+$(call if_changed,rustdoc)
+
 rustdoc-macros: private rustdoc_host = yes
 rustdoc-macros: private rustc_target_flags = --crate-type proc-macro \
     --extern proc_macro
-rustdoc-macros: $(src)/macros/lib.rs rustdoc-clean rustdoc-proc_macro2 FORCE
+rustdoc-macros: $(src)/macros/lib.rs rustdoc-clean rustdoc-proc_macro2 \
+    rustdoc-quote FORCE
 	+$(call if_changed,rustdoc)
 
 # Starting with Rust 1.82.0, skipping `-Wrustdoc::unescaped_backticks` should
@@ -207,6 +226,11 @@ rusttestlib-proc_macro2: private rustc_target_flags = $(proc_macro2-flags)
 rusttestlib-proc_macro2: $(src)/proc-macro2/lib.rs FORCE
 	+$(call if_changed,rustc_test_library)
 
+rusttestlib-quote: private skip_flags = $(quote-skip_flags)
+rusttestlib-quote: private rustc_target_flags = $(quote-flags)
+rusttestlib-quote: $(src)/quote/lib.rs rusttestlib-proc_macro2 FORCE
+	+$(call if_changed,rustc_test_library)
+
 rusttestlib-macros: private rustc_target_flags = --extern proc_macro
 rusttestlib-macros: private rustc_test_library_proc = yes
 rusttestlib-macros: $(src)/macros/lib.rs FORCE
@@ -458,6 +482,12 @@ $(obj)/libproc_macro2.rlib: private rustc_target_flags = $(proc_macro2-flags)
 $(obj)/libproc_macro2.rlib: $(src)/proc-macro2/lib.rs FORCE
 	+$(call if_changed_dep,rustc_procmacrolibrary)
 
+$(obj)/libquote.rlib: private skip_clippy = 1
+$(obj)/libquote.rlib: private skip_flags = $(quote-skip_flags)
+$(obj)/libquote.rlib: private rustc_target_flags = $(quote-flags)
+$(obj)/libquote.rlib: $(src)/quote/lib.rs $(obj)/libproc_macro2.rlib FORCE
+	+$(call if_changed_dep,rustc_procmacrolibrary)
+
 quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
       cmd_rustc_procmacro = \
 	$(RUSTC_OR_CLIPPY) $(rust_common_flags) $(rustc_target_flags) \
@@ -469,7 +499,8 @@ quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
 		@$(objtree)/include/generated/rustc_cfg $<
 
 # Procedural macros can only be used with the `rustc` that compiled it.
-$(obj)/$(libmacros_name): $(src)/macros/lib.rs $(obj)/libproc_macro2.rlib FORCE
+$(obj)/$(libmacros_name): $(src)/macros/lib.rs $(obj)/libproc_macro2.rlib \
+    $(obj)/libquote.rlib FORCE
 	+$(call if_changed_dep,rustc_procmacro)
 
 $(obj)/$(libpin_init_internal_name): private rustc_target_flags = --cfg kernel
@@ -493,6 +524,7 @@ rust-analyzer:
 	$(Q)MAKEFLAGS= $(srctree)/scripts/generate_rust_analyzer.py \
 		--cfgs='core=$(core-cfgs)' $(core-edition) \
 		--cfgs='proc_macro2=$(proc_macro2-cfgs)' \
+		--cfgs='quote=$(quote-cfgs)' \
 		$(realpath $(srctree)) $(realpath $(objtree)) \
 		$(rustc_sysroot) $(RUST_LIB_SRC) $(if $(KBUILD_EXTMOD),$(srcroot)) \
 		> rust-project.json
diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 00c6b7cc94b7..4faf153ed2ee 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -93,6 +93,13 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
         cfg=crates_cfgs["proc_macro2"],
     )
 
+    append_crate(
+        "quote",
+        srctree / "rust" / "quote" / "lib.rs",
+        ["alloc", "proc_macro", "proc_macro2"],
+        cfg=crates_cfgs["quote"],
+    )
+
     append_crate(
         "macros",
         srctree / "rust" / "macros" / "lib.rs",
-- 
2.52.0


