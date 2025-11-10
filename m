Return-Path: <linux-kbuild+bounces-9489-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1F6C45C34
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 10:56:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 795703B8115
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 09:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B65303CB2;
	Mon, 10 Nov 2025 09:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ao0rH2kS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFD2303A30;
	Mon, 10 Nov 2025 09:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762768339; cv=none; b=lm3xvSknORRb/D/I58wrIeAlwdbUVGTk89UBY7FQsj9+TzM4y3oK/OnNnuI1Yw9Bo0/AKF68L/lYaw6df1IwKnHg7j9W7m6E+R0OY40+IYFZhiHFDRWDiw4P0rmNwOWT4bpncyhrwwlhZjCd/EidAhnOZ6OKJIGPhove3AD/f08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762768339; c=relaxed/simple;
	bh=sJxHoJvbFU1LMibajb8bXzGcqPfSp1Etmu7xj9wrwPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hCSlsB9FNMLVE/qswCePmvrMVvirOmNHLC+lGCInhneGq+79VjsSszPOa+K2O8RTJxRJobI8l+3unBSw0gX/B+7/L24pKmT7DTpC+dy+ZrlY2WJWbWya08NannKHZ4MvG5L+Okqx8F+m8MauWIzEQ9Smla7B/NvQscojLFHyT3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ao0rH2kS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1499C4CEF5;
	Mon, 10 Nov 2025 09:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762768338;
	bh=sJxHoJvbFU1LMibajb8bXzGcqPfSp1Etmu7xj9wrwPw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ao0rH2kSETu9RiyqlWjrIq5CEj8dkZS7z4t40W3Z9Dct7N2HvjikDvNP0hGgjoE1G
	 dZzYdNDlXrOq3Oa1SxygeDCfhIlV+tHkf2qGkdrdF0s0nwL2XphMs/K34R+rP4ZnJP
	 ZohMMWKLj6oUIVDszvj1O5FV0sE6WnX4CPmMzF1rqLftP/YolNSTecI1aEekYukBlV
	 B4PnwjFvSyOYMazLBvEuegC81CqbnoGYO3vBrjQn3zdi7mh25fI3FWVW76VDfGDJK4
	 2Ly5imRC3dnwjZ3wX+9OG1lSmvJI3veqlQfCg9GG/UaYSygJPgbonSYypwDeQeH0/2
	 ve4eqvStkwaxg==
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
Subject: [PATCH 18/18] rust: syn: enable support in kbuild
Date: Mon, 10 Nov 2025 10:50:23 +0100
Message-ID: <20251110095025.1475896-19-ojeda@kernel.org>
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
 rust/Makefile                     | 39 +++++++++++++++++++++++++++----
 scripts/generate_rust_analyzer.py |  7 ++++++
 3 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index f1b38b7fed1e..5364b3ad3600 100644
--- a/Makefile
+++ b/Makefile
@@ -1833,6 +1833,7 @@ rustfmt:
 		\( \
 			-path $(srctree)/rust/proc-macro2 \
 			-o -path $(srctree)/rust/quote \
+			-o -path $(srctree)/rust/syn \
 		\) -prune -o \
 		-type f -a -name '*.rs' -a ! -name '*generated*' -print \
 		| xargs $(RUSTFMT) $(rustfmt_flags)
diff --git a/rust/Makefile b/rust/Makefile
index 801a8cbf3bdd..984aec608c27 100644
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
@@ -164,11 +180,16 @@ rustdoc-quote: private skip_flags = $(quote-skip_flags)
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
@@ -240,6 +261,10 @@ rusttestlib-quote: private rustc_target_flags = $(quote-flags)
 rusttestlib-quote: $(src)/quote/lib.rs rusttestlib-proc_macro2 FORCE
 	+$(call if_changed,rustc_test_library)
 
+rusttestlib-syn: private rustc_target_flags = $(syn-flags)
+rusttestlib-syn: $(src)/syn/lib.rs rusttestlib-quote FORCE
+	+$(call if_changed,rustc_test_library)
+
 rusttestlib-macros: private rustc_target_flags = --extern proc_macro
 rusttestlib-macros: private rustc_test_library_proc = yes
 rusttestlib-macros: $(src)/macros/lib.rs FORCE
@@ -497,19 +522,24 @@ $(obj)/libquote.rlib: private rustc_target_flags = $(quote-flags)
 $(obj)/libquote.rlib: $(src)/quote/lib.rs $(obj)/libproc_macro2.rlib FORCE
 	+$(call if_changed_dep,rustc_hostlibrary)
 
+$(obj)/libsyn.rlib: private skip_clippy = 1
+$(obj)/libsyn.rlib: private rustc_target_flags = $(syn-flags)
+$(obj)/libsyn.rlib: $(src)/syn/lib.rs $(obj)/libquote.rlib FORCE
+	+$(call if_changed_dep,rustc_hostlibrary)
+
 quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
       cmd_rustc_procmacro = \
 	$(RUSTC_OR_CLIPPY) $(rust_common_flags) $(rustc_target_flags) \
 		-Clinker-flavor=gcc -Clinker=$(HOSTCC) \
 		-Clink-args='$(call escsq,$(KBUILD_PROCMACROLDFLAGS))' \
 		--emit=dep-info=$(depfile) --emit=link=$@ --extern proc_macro \
-		--crate-type proc-macro \
+		--crate-type proc-macro -L$(objtree)/$(obj) \
 		--crate-name $(patsubst lib%.$(libmacros_extension),%,$(notdir $@)) \
 		@$(objtree)/include/generated/rustc_cfg $<
 
 # Procedural macros can only be used with the `rustc` that compiled it.
 $(obj)/$(libmacros_name): $(src)/macros/lib.rs $(obj)/libproc_macro2.rlib \
-    $(obj)/libquote.rlib FORCE
+    $(obj)/libquote.rlib $(obj)/libsyn.rlib FORCE
 	+$(call if_changed_dep,rustc_procmacro)
 
 $(obj)/$(libpin_init_internal_name): private rustc_target_flags = --cfg kernel
@@ -534,6 +564,7 @@ rust-analyzer:
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
2.51.2


