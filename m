Return-Path: <linux-kbuild+bounces-9821-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3ABC8153D
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 16:28:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8D3FF34944E
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 15:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52EAF314B8A;
	Mon, 24 Nov 2025 15:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aNSgnAbI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254E1314A9E;
	Mon, 24 Nov 2025 15:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763997622; cv=none; b=vDJJ4iCGtB0Cbz0gge23BheXEGceniH0t991hep84k8ogXdflJkPlmoUdRXbNfLshIuWIlpoP6Q+XRUNZ6OfKdeHAaXIYxNEkx6Z3VZkyJrMwphDpqfMnHrmXGY5N86MxD6W+hSZLd1AHXrmdhBWkRG4+YakfzYilxmwIadNugQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763997622; c=relaxed/simple;
	bh=OzDI8phusLazM7MugvoFPBPmiOKcsuraaGbS0v+sees=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RgOIYZ4O9UmPs7KzXlI+oSZtUs5L1ImR2iBegHlNRl/2IKH7O10CXGAO6jdGX26lA/ArzNBMqFQHa68gw97YohfObo58pWylKUOA5iDchcBavIL6/g84KxkLqn2M0Kgtjnvqe7Czh6qICIsxRFP6mz309JeG3euP4grhlTwJDIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aNSgnAbI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B6CC116C6;
	Mon, 24 Nov 2025 15:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763997620;
	bh=OzDI8phusLazM7MugvoFPBPmiOKcsuraaGbS0v+sees=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aNSgnAbI4lOyRv/M2/xXlbHj/vITGfgnhTTkxcVtoa8IJ1+BU6W2kAV3sV2ssyeQD
	 2pEMDpgH5VY8Cuu9NlGvOJjauawxS7xUl+d+4kUigKik30u8Huzh8LlP2IQutCQszm
	 YbGz+hgVfBPoCufUOn32IeisccvpbgNZwNcsWi8Pj13UrhhhRvIQfqLYvVHjlCopOC
	 u638MJM4CnObRyTX32pVN9u0n9PUe1xTJFxHzTzj9DHq2ICSo/c5LLK2OXE3m9BBFp
	 5mUw71BEd4duv2O0EKwWXoGe+zlJFUQNHl/jj7On9yj12jQD1sj/0GO/P4VrF5GtO/
	 vSLmuX8HwGlXA==
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
Subject: [PATCH v2 19/20] rust: syn: enable support in kbuild
Date: Mon, 24 Nov 2025 16:18:31 +0100
Message-ID: <20251124151837.2184382-20-ojeda@kernel.org>
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
 rust/Makefile                     | 37 ++++++++++++++++++++++++++++---
 scripts/generate_rust_analyzer.py |  7 ++++++
 3 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 85da055e4f00..96ddbaae7e12 100644
--- a/Makefile
+++ b/Makefile
@@ -1835,6 +1835,7 @@ rustfmt:
 		\( \
 			-path $(srctree)/rust/proc-macro2 \
 			-o -path $(srctree)/rust/quote \
+			-o -path $(srctree)/rust/syn \
 		\) -prune -o \
 		-type f -a -name '*.rs' -a ! -name '*generated*' -print \
 		| xargs $(RUSTFMT) $(rustfmt_flags)
diff --git a/rust/Makefile b/rust/Makefile
index 4f4a00594142..8988ecf32531 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -27,7 +27,7 @@ endif
 
 obj-$(CONFIG_RUST) += exports.o
 
-always-$(CONFIG_RUST) += libproc_macro2.rlib libquote.rlib
+always-$(CONFIG_RUST) += libproc_macro2.rlib libquote.rlib libsyn.rlib
 
 always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.rs
 always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.c
@@ -101,6 +101,22 @@ quote-flags := \
     --extern proc_macro2 \
     $(call cfgs-to-flags,$(quote-cfgs))
 
+# `extra-traits`, `fold` and `visit` may be enabled if needed.
+syn-cfgs := \
+    feature="clone-impls" \
+    feature="derive" \
+    feature="full" \
+    feature="parsing" \
+    feature="printing" \
+    feature="proc-macro" \
+    feature="visit-mut"
+
+syn-flags := \
+    --cap-lints=allow \
+    --extern proc_macro2 \
+    --extern quote \
+    $(call cfgs-to-flags,$(syn-cfgs))
+
 # `rustdoc` did not save the target modifiers, thus workaround for
 # the time being (https://github.com/rust-lang/rust/issues/144521).
 rustdoc_modifiers_workaround := $(if $(call rustc-min-version,108800),-Cunsafe-allow-abi-mismatch=fixed-x18)
@@ -161,11 +177,16 @@ rustdoc-quote: private skip_flags = $(quote-skip_flags)
 rustdoc-quote: $(src)/quote/lib.rs rustdoc-clean rustdoc-proc_macro2 FORCE
 	+$(call if_changed,rustdoc)
 
+rustdoc-syn: private rustdoc_host = yes
+rustdoc-syn: private rustc_target_flags = $(syn-flags)
+rustdoc-syn: $(src)/syn/lib.rs rustdoc-clean rustdoc-quote FORCE
+	+$(call if_changed,rustdoc)
+
 rustdoc-macros: private rustdoc_host = yes
 rustdoc-macros: private rustc_target_flags = --crate-type proc-macro \
     --extern proc_macro
 rustdoc-macros: $(src)/macros/lib.rs rustdoc-clean rustdoc-proc_macro2 \
-    rustdoc-quote FORCE
+    rustdoc-quote rustdoc-syn FORCE
 	+$(call if_changed,rustdoc)
 
 # Starting with Rust 1.82.0, skipping `-Wrustdoc::unescaped_backticks` should
@@ -231,6 +252,10 @@ rusttestlib-quote: private rustc_target_flags = $(quote-flags)
 rusttestlib-quote: $(src)/quote/lib.rs rusttestlib-proc_macro2 FORCE
 	+$(call if_changed,rustc_test_library)
 
+rusttestlib-syn: private rustc_target_flags = $(syn-flags)
+rusttestlib-syn: $(src)/syn/lib.rs rusttestlib-quote FORCE
+	+$(call if_changed,rustc_test_library)
+
 rusttestlib-macros: private rustc_target_flags = --extern proc_macro
 rusttestlib-macros: private rustc_test_library_proc = yes
 rusttestlib-macros: $(src)/macros/lib.rs FORCE
@@ -488,6 +513,11 @@ $(obj)/libquote.rlib: private rustc_target_flags = $(quote-flags)
 $(obj)/libquote.rlib: $(src)/quote/lib.rs $(obj)/libproc_macro2.rlib FORCE
 	+$(call if_changed_dep,rustc_procmacrolibrary)
 
+$(obj)/libsyn.rlib: private skip_clippy = 1
+$(obj)/libsyn.rlib: private rustc_target_flags = $(syn-flags)
+$(obj)/libsyn.rlib: $(src)/syn/lib.rs $(obj)/libquote.rlib FORCE
+	+$(call if_changed_dep,rustc_procmacrolibrary)
+
 quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
       cmd_rustc_procmacro = \
 	$(RUSTC_OR_CLIPPY) $(rust_common_flags) $(rustc_target_flags) \
@@ -500,7 +530,7 @@ quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
 
 # Procedural macros can only be used with the `rustc` that compiled it.
 $(obj)/$(libmacros_name): $(src)/macros/lib.rs $(obj)/libproc_macro2.rlib \
-    $(obj)/libquote.rlib FORCE
+    $(obj)/libquote.rlib $(obj)/libsyn.rlib FORCE
 	+$(call if_changed_dep,rustc_procmacro)
 
 $(obj)/$(libpin_init_internal_name): private rustc_target_flags = --cfg kernel
@@ -525,6 +555,7 @@ rust-analyzer:
 		--cfgs='core=$(core-cfgs)' $(core-edition) \
 		--cfgs='proc_macro2=$(proc_macro2-cfgs)' \
 		--cfgs='quote=$(quote-cfgs)' \
+		--cfgs='syn=$(syn-cfgs)' \
 		$(realpath $(srctree)) $(realpath $(objtree)) \
 		$(rustc_sysroot) $(RUST_LIB_SRC) $(if $(KBUILD_EXTMOD),$(srcroot)) \
 		> rust-project.json
diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 4faf153ed2ee..5b6f7b8d6918 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -100,6 +100,13 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
         cfg=crates_cfgs["quote"],
     )
 
+    append_crate(
+        "syn",
+        srctree / "rust" / "syn" / "lib.rs",
+        ["proc_macro", "proc_macro2", "quote"],
+        cfg=crates_cfgs["syn"],
+    )
+
     append_crate(
         "macros",
         srctree / "rust" / "macros" / "lib.rs",
-- 
2.52.0


