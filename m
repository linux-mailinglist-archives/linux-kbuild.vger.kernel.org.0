Return-Path: <linux-kbuild+bounces-9480-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C131C45BED
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 10:53:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D54263ACA77
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 09:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79FF1302CB3;
	Mon, 10 Nov 2025 09:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EfLHwQDV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44223301701;
	Mon, 10 Nov 2025 09:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762768299; cv=none; b=ImdzHSJxkPttXTcsapycl86xx5e4kl/YYud9bDjkl+1tHk8HVP4smaN1ydnva/NM56PIhBqxSLWNsCxyH9DbICEGYSFN3SLya1v9wm/XYnSCLd9Pb6WfkNRdAdiBy3tbg21gq0LDhMFNBV2VmEDije3+yob3jdEam9fQxXASr2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762768299; c=relaxed/simple;
	bh=n1hgl0Uoc9H+eAdGwoEvtOa7fabsoGd2HG03Go3YtEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AUYiiAxXnSlGAcDBX/YagKNIY9evJsrpapjJyPml7xFIFvxmAKf85wJlJmgHURujbGXI2NJ8uRS9hAkbqQpkgf+s5Vpk+utZxOXyz2aAfd6mQhgUFf2oBytiZ4DN/anA79odaLEG9oR4HwTopZQIvbv2RK01QxJVgN9wIVCtwuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EfLHwQDV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A8A8C19421;
	Mon, 10 Nov 2025 09:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762768298;
	bh=n1hgl0Uoc9H+eAdGwoEvtOa7fabsoGd2HG03Go3YtEU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EfLHwQDV8H4LJwwxILOBDpbmLBdi3LgtLXupB/3ynAkjEZsJ0Zch7QkFF/+kPW91K
	 RqIn5LauLwSnWszC2pp9FKkljqgQbYcdz2QBLVKh/DF8S1Jd4tG8lbKZJwiuC9rC4K
	 RESuK7RSYdo6tQPhDAZjpFZZv43gVS+k3hducR70XvmbOBDQj1lbRJG4GsspNHf5GP
	 ode5OCaPa6/eJh9sygxOtYk8+KfiC37l/WKaiEL+WtbgLoXXZoyjkxq7DKeNHIUjla
	 eQ8L5/JYTAYCcSmxqI38pB1BiKc5ThWj/FOdvV5w82sMefVGXULPGjdKwgnZbuF+Pl
	 xiFTjLQ2YSurA==
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
Subject: [PATCH 09/18] rust: proc-macro2: enable support in kbuild
Date: Mon, 10 Nov 2025 10:50:14 +0100
Message-ID: <20251110095025.1475896-10-ojeda@kernel.org>
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

`proc_macro_byte_character` and `proc_macro_c_str_literals` were
stabilized in Rust 1.79.0 [1] and were implemented earlier than our
minimum Rust version (1.78) [2][3]. Thus just enable them instead of using
the `cfg` that `proc-macro2` uses to emulate them in older compilers.

Link: https://github.com/rust-lang/rust/pull/123431 [1]
Link: https://github.com/rust-lang/rust/pull/112711 [2]
Link: https://github.com/rust-lang/rust/pull/119651 [3]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Makefile                          |  3 +++
 rust/Makefile                     | 32 +++++++++++++++++++++++++++++--
 scripts/generate_rust_analyzer.py |  7 +++++++
 3 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index fb4389aa5d5f..6ff887523eee 100644
--- a/Makefile
+++ b/Makefile
@@ -1830,6 +1830,9 @@ PHONY += rustfmt rustfmtcheck
 
 rustfmt:
 	$(Q)find $(srctree) $(RCS_FIND_IGNORE) \
+		\( \
+			-path $(srctree)/rust/proc-macro2 \
+		\) -prune -o \
 		-type f -a -name '*.rs' -a ! -name '*generated*' -print \
 		| xargs $(RUSTFMT) $(rustfmt_flags)
 
diff --git a/rust/Makefile b/rust/Makefile
index 9eea6563ef35..a614a23023cb 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -27,6 +27,8 @@ endif
 
 obj-$(CONFIG_RUST) += exports.o
 
+always-$(CONFIG_RUST) += libproc_macro2.rlib
+
 always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.rs
 always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.c
 
@@ -76,6 +78,17 @@ core-flags := \
     --edition=$(core-edition) \
     $(call cfgs-to-flags,$(core-cfgs))
 
+proc_macro2-cfgs := \
+    feature="proc-macro" \
+    wrap_proc_macro \
+    $(if $(call rustc-min-version,108800),proc_macro_span_file proc_macro_span_location)
+
+# Stable since Rust 1.79.0: `feature(proc_macro_byte_character,proc_macro_c_str_literals)`.
+proc_macro2-flags := \
+    --cap-lints=allow \
+    -Zcrate-attr='feature(proc_macro_byte_character,proc_macro_c_str_literals)' \
+    $(call cfgs-to-flags,$(proc_macro2-cfgs))
+
 # `rustdoc` did not save the target modifiers, thus workaround for
 # the time being (https://github.com/rust-lang/rust/issues/144521).
 rustdoc_modifiers_workaround := $(if $(call rustc-min-version,108800),-Cunsafe-allow-abi-mismatch=fixed-x18)
@@ -128,10 +141,15 @@ rustdoc: rustdoc-core rustdoc-macros rustdoc-compiler_builtins \
 	$(Q)for f in $(rustdoc_output)/static.files/rustdoc-*.css; do \
 		echo ".logo-container > img { object-fit: contain; }" >> $$f; done
 
+rustdoc-proc_macro2: private rustdoc_host = yes
+rustdoc-proc_macro2: private rustc_target_flags = $(proc_macro2-flags)
+rustdoc-proc_macro2: $(src)/proc-macro2/lib.rs rustdoc-clean FORCE
+	+$(call if_changed,rustdoc)
+
 rustdoc-macros: private rustdoc_host = yes
 rustdoc-macros: private rustc_target_flags = --crate-type proc-macro \
     --extern proc_macro
-rustdoc-macros: $(src)/macros/lib.rs rustdoc-clean FORCE
+rustdoc-macros: $(src)/macros/lib.rs rustdoc-clean rustdoc-proc_macro2 FORCE
 	+$(call if_changed,rustdoc)
 
 # Starting with Rust 1.82.0, skipping `-Wrustdoc::unescaped_backticks` should
@@ -194,6 +212,10 @@ rusttestlib-build_error: $(src)/build_error.rs FORCE
 rusttestlib-ffi: $(src)/ffi.rs FORCE
 	+$(call if_changed,rustc_test_library)
 
+rusttestlib-proc_macro2: private rustc_target_flags = $(proc_macro2-flags)
+rusttestlib-proc_macro2: $(src)/proc-macro2/lib.rs FORCE
+	+$(call if_changed,rustc_test_library)
+
 rusttestlib-macros: private rustc_target_flags = --extern proc_macro
 rusttestlib-macros: private rustc_test_library_proc = yes
 rusttestlib-macros: $(src)/macros/lib.rs FORCE
@@ -440,6 +462,11 @@ quiet_cmd_rustc_hostlibrary = $(RUSTC_OR_CLIPPY_QUIET) H $@
 	mv $(objtree)/$(obj)/$(patsubst lib%.rlib,%,$(notdir $@)).d $(depfile); \
 	sed -i '/^\#/d' $(depfile)
 
+$(obj)/libproc_macro2.rlib: private skip_clippy = 1
+$(obj)/libproc_macro2.rlib: private rustc_target_flags = $(proc_macro2-flags)
+$(obj)/libproc_macro2.rlib: $(src)/proc-macro2/lib.rs FORCE
+	+$(call if_changed_dep,rustc_hostlibrary)
+
 quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
       cmd_rustc_procmacro = \
 	$(RUSTC_OR_CLIPPY) $(rust_common_flags) $(rustc_target_flags) \
@@ -451,7 +478,7 @@ quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
 		@$(objtree)/include/generated/rustc_cfg $<
 
 # Procedural macros can only be used with the `rustc` that compiled it.
-$(obj)/$(libmacros_name): $(src)/macros/lib.rs FORCE
+$(obj)/$(libmacros_name): $(src)/macros/lib.rs $(obj)/libproc_macro2.rlib FORCE
 	+$(call if_changed_dep,rustc_procmacro)
 
 $(obj)/$(libpin_init_internal_name): private rustc_target_flags = --cfg kernel
@@ -474,6 +501,7 @@ quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L
 rust-analyzer:
 	$(Q)MAKEFLAGS= $(srctree)/scripts/generate_rust_analyzer.py \
 		--cfgs='core=$(core-cfgs)' $(core-edition) \
+		--cfgs='proc_macro2=$(proc_macro2-cfgs)' \
 		$(realpath $(srctree)) $(realpath $(objtree)) \
 		$(rustc_sysroot) $(RUST_LIB_SRC) $(if $(KBUILD_EXTMOD),$(srcroot)) \
 		> rust-project.json
diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index dedca470adc1..00c6b7cc94b7 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -86,6 +86,13 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
         [],
     )
 
+    append_crate(
+        "proc_macro2",
+        srctree / "rust" / "proc-macro2" / "lib.rs",
+        ["core", "alloc", "std", "proc_macro"],
+        cfg=crates_cfgs["proc_macro2"],
+    )
+
     append_crate(
         "macros",
         srctree / "rust" / "macros" / "lib.rs",
-- 
2.51.2


