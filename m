Return-Path: <linux-kbuild+bounces-9484-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9DCC45C2E
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 10:55:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3B5A44EA1D7
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 09:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E87F130596A;
	Mon, 10 Nov 2025 09:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bynr8r0X"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F09301037;
	Mon, 10 Nov 2025 09:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762768316; cv=none; b=k6SkMz8Wg32knHCtctb/y9RjtTtXo+x9qvNlx+CKbQyOZNYhnVmu52TSTlwGMUgG3i8r0SVbbFBvfycyH/Ehms6OESTSR++tRgK6LtmjpSW0IgoYoxAnQq81liQB8q21oA/WS3TYBbmnblTxwt/cZoE3KKsndpaD3RshUy1nNhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762768316; c=relaxed/simple;
	bh=pB2YcpO7mkvhWYHxcDqMjevvuBFpsr01nThAfGanOsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YIqvz1Inpik9dwBpvxfed4pYeA+vQUdH3KT1G+lhLYC0ZMZm9ymUegXN4v6ZuX+obrP30SONTroJKiO51hTeKa5JF66xJl9CYFWrb2Be3sHzRGxhKDtpBHfjCMK3fKZw1QojGlyztuhuOojcV65QSFkWgW9mc62GvcPCdPf/uho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bynr8r0X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A6B4C19422;
	Mon, 10 Nov 2025 09:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762768316;
	bh=pB2YcpO7mkvhWYHxcDqMjevvuBFpsr01nThAfGanOsI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bynr8r0XcKaB2VIGojnYM/NZK9qSoBzPTz7qJPPHM/Qd8S+GJTAksW+nfn2QDvRX3
	 LkaUWZXoor5x9nVSz4L6jWa5qjjeuMXD+KxFvHg4ztVXJqEVo5TYQgc8z15N16miql
	 sxZJGujZ69aBow9Q2OQ7lI6FujdK33tZBSq7inoo8XkL/r6Pj9eeOj8itKx8kTOLXJ
	 jZ6rdGwHMBEoWzN4WnCIvp//lD6P668qZ0t3EuqYD5DUdxmute0SfwpIVjYFXiypC3
	 UqI80qRYB5TNxj9efBnAqXIDusTHeDewRufZZHF8+O+AksDZ/ZvzCGndVFCgP1ext2
	 5x/0gjyN0eMqw==
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
	patches@lists.linux.dev
Subject: [PATCH 13/18] rust: quote: enable support in kbuild
Date: Mon, 10 Nov 2025 10:50:18 +0100
Message-ID: <20251110095025.1475896-14-ojeda@kernel.org>
In-Reply-To: <20251110095025.1475896-1-ojeda@kernel.org>
References: <20251110095025.1475896-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With all the new files in place and ready from the new crate, enable
the support for it in the build system.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Makefile                          |  1 +
 rust/Makefile                     | 42 +++++++++++++++++++++++++++----
 scripts/generate_rust_analyzer.py |  7 ++++++
 3 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 6ff887523eee..f1b38b7fed1e 100644
--- a/Makefile
+++ b/Makefile
@@ -1832,6 +1832,7 @@ rustfmt:
 	$(Q)find $(srctree) $(RCS_FIND_IGNORE) \
 		\( \
 			-path $(srctree)/rust/proc-macro2 \
+			-o -path $(srctree)/rust/quote \
 		\) -prune -o \
 		-type f -a -name '*.rs' -a ! -name '*generated*' -print \
 		| xargs $(RUSTFMT) $(rustfmt_flags)
diff --git a/rust/Makefile b/rust/Makefile
index a614a23023cb..801a8cbf3bdd 100644
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
@@ -146,10 +158,17 @@ rustdoc-proc_macro2: private rustc_target_flags = $(proc_macro2-flags)
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
@@ -199,8 +218,8 @@ rustdoc-clean: FORCE
 quiet_cmd_rustc_test_library = $(RUSTC_OR_CLIPPY_QUIET) TL $<
       cmd_rustc_test_library = \
 	OBJTREE=$(abspath $(objtree)) \
-	$(RUSTC_OR_CLIPPY) $(rust_common_flags) \
-		@$(objtree)/include/generated/rustc_cfg $(rustc_target_flags) \
+	$(RUSTC_OR_CLIPPY) $(filter-out $(skip_flags),$(rust_common_flags) $(rustc_target_flags)) \
+		@$(objtree)/include/generated/rustc_cfg \
 		--crate-type $(if $(rustc_test_library_proc),proc-macro,rlib) \
 		--out-dir $(objtree)/$(obj)/test --cfg testlib \
 		-L$(objtree)/$(obj)/test \
@@ -216,6 +235,11 @@ rusttestlib-proc_macro2: private rustc_target_flags = $(proc_macro2-flags)
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
@@ -467,6 +491,12 @@ $(obj)/libproc_macro2.rlib: private rustc_target_flags = $(proc_macro2-flags)
 $(obj)/libproc_macro2.rlib: $(src)/proc-macro2/lib.rs FORCE
 	+$(call if_changed_dep,rustc_hostlibrary)
 
+$(obj)/libquote.rlib: private skip_clippy = 1
+$(obj)/libquote.rlib: private skip_flags = $(quote-skip_flags)
+$(obj)/libquote.rlib: private rustc_target_flags = $(quote-flags)
+$(obj)/libquote.rlib: $(src)/quote/lib.rs $(obj)/libproc_macro2.rlib FORCE
+	+$(call if_changed_dep,rustc_hostlibrary)
+
 quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
       cmd_rustc_procmacro = \
 	$(RUSTC_OR_CLIPPY) $(rust_common_flags) $(rustc_target_flags) \
@@ -478,7 +508,8 @@ quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
 		@$(objtree)/include/generated/rustc_cfg $<
 
 # Procedural macros can only be used with the `rustc` that compiled it.
-$(obj)/$(libmacros_name): $(src)/macros/lib.rs $(obj)/libproc_macro2.rlib FORCE
+$(obj)/$(libmacros_name): $(src)/macros/lib.rs $(obj)/libproc_macro2.rlib \
+    $(obj)/libquote.rlib FORCE
 	+$(call if_changed_dep,rustc_procmacro)
 
 $(obj)/$(libpin_init_internal_name): private rustc_target_flags = --cfg kernel
@@ -502,6 +533,7 @@ rust-analyzer:
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
2.51.2


