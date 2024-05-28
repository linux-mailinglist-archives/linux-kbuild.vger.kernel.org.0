Return-Path: <linux-kbuild+bounces-1947-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B028D21B3
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 May 2024 18:35:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5FB928436E
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 May 2024 16:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F348716F0E0;
	Tue, 28 May 2024 16:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TDinzG4Z"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F9525779;
	Tue, 28 May 2024 16:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716914119; cv=none; b=UksfJNZYWojIAZtKOOoUYULvFadfYKqsrYm/CKlZJNZc+50Fq70l/axNnFEcPpnHOzWm0DxAk0oOYzPpBoSZi0chAyL7/DMIrgtHPc4uCugLE/9WErLXyfzIDgzFc3VWGwcgAwNYcOzaDo5YjgdvzB4NAlaZPdpeEGf1QHLwOR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716914119; c=relaxed/simple;
	bh=x9GxzSEQyS9faufytQQHuiv461rRXwkNf2zahJ08E7g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rDA5vEbwgLm6vHroPi+eTypHFbRTKbP5R0Iw1+dMrKm9X4e2jjoqX/lcDYn/jx0Rxip4umfHY/kl1ZuFHLfWR7yZtu485im1aAOZr1/8LNGe1fzJvR0LNqnuRPbBfU4TcFRSnbVChdcEuwWFmqIHbfi7zjpDS+hQvD4IUwdMDK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TDinzG4Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB3BC3277B;
	Tue, 28 May 2024 16:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716914119;
	bh=x9GxzSEQyS9faufytQQHuiv461rRXwkNf2zahJ08E7g=;
	h=From:To:Cc:Subject:Date:From;
	b=TDinzG4ZCGlBSi4sinMjD1nUT24MMHz/OcEsSsdF4e11EMdzSMnCG87lmG+ORgyvo
	 ISer6YT715Ypdm7zLjg39xLCyIVHlTVQ+lV46I3juFs5P0cUj5ihvYO6Wk4oWyTZM1
	 lI0wodXlIy0owdTGvartCA2wEnYNHlQWVz8PvV6H5D9u/b8JbsFqPhhWdgU1kXcG6C
	 mbAS08KwxjnVJL86P6RCyTmOlxQ3CdIGBvweEAegI/DqoghlXEkHXbbgX36/3czSzK
	 C4PPcwoI7QLOZUQ5gBKNt7/f4CmByoKp4URwkqNXNOedyJeXKnqKcqjf3ncOOjaUtM
	 DtYNtkdgY8uWA==
From: Miguel Ojeda <ojeda@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH] kbuild: rust: remove now-unneeded `rusttest` custom sysroot handling
Date: Tue, 28 May 2024 18:35:02 +0200
Message-ID: <20240528163502.411600-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since we dropped our custom `alloc` in commit 9d0441bab775 ("rust: alloc:
remove our fork of the `alloc` crate"), there is no need anymore to keep
the custom sysroot hack.

Thus delete it, which makes the target way simpler and faster too.

This also means we are not using Cargo for anything at the moment,
and that no download is required anymore, so update the main `Makefile`
and the documentation accordingly.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Documentation/rust/quick-start.rst | 14 ------
 Documentation/rust/testing.rst     |  5 +--
 Makefile                           |  3 +-
 rust/Makefile                      | 70 ++++--------------------------
 4 files changed, 11 insertions(+), 81 deletions(-)

diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
index cc3f11e0d441..5ca13be451f5 100644
--- a/Documentation/rust/quick-start.rst
+++ b/Documentation/rust/quick-start.rst
@@ -164,20 +164,6 @@ can be installed manually::
 The standalone installers also come with ``clippy``.
 
 
-cargo
-*****
-
-``cargo`` is the Rust native build system. It is currently required to run
-the tests since it is used to build a custom standard library that contains
-the facilities provided by the custom ``alloc`` in the kernel. The tests can
-be run using the ``rusttest`` Make target.
-
-If ``rustup`` is being used, all the profiles already install the tool,
-thus nothing needs to be done.
-
-The standalone installers also come with ``cargo``.
-
-
 rustdoc
 *******
 
diff --git a/Documentation/rust/testing.rst b/Documentation/rust/testing.rst
index acfd0c2be48d..568b71b415a4 100644
--- a/Documentation/rust/testing.rst
+++ b/Documentation/rust/testing.rst
@@ -131,9 +131,8 @@ Additionally, there are the ``#[test]`` tests. These can be run using the
 
 	make LLVM=1 rusttest
 
-This requires the kernel ``.config`` and downloads external repositories. It
-runs the ``#[test]`` tests on the host (currently) and thus is fairly limited in
-what these tests can test.
+This requires the kernel ``.config``. It runs the ``#[test]`` tests on the host
+(currently) and thus is fairly limited in what these tests can test.
 
 The Kselftests
 --------------
diff --git a/Makefile b/Makefile
index f975b6396328..f368a9167de8 100644
--- a/Makefile
+++ b/Makefile
@@ -507,7 +507,6 @@ RUSTDOC		= rustdoc
 RUSTFMT		= rustfmt
 CLIPPY_DRIVER	= clippy-driver
 BINDGEN		= bindgen
-CARGO		= cargo
 PAHOLE		= pahole
 RESOLVE_BTFIDS	= $(objtree)/tools/bpf/resolve_btfids/resolve_btfids
 LEX		= flex
@@ -601,7 +600,7 @@ endif
 export RUSTC_BOOTSTRAP := 1
 
 export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC HOSTPKG_CONFIG
-export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDGEN CARGO
+export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDGEN
 export HOSTRUSTC KBUILD_HOSTRUSTFLAGS
 export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
 export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
diff --git a/rust/Makefile b/rust/Makefile
index f70d5e244fee..385378311322 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -44,17 +44,10 @@ rustc_sysroot := $(shell MAKEFLAGS= $(RUSTC) $(rust_flags) --print sysroot)
 rustc_host_target := $(shell $(RUSTC) --version --verbose | grep -F 'host: ' | cut -d' ' -f2)
 RUST_LIB_SRC ?= $(rustc_sysroot)/lib/rustlib/src/rust/library
 
-ifeq ($(quiet),silent_)
-cargo_quiet=-q
+ifneq ($(quiet),)
 rust_test_quiet=-q
 rustdoc_test_quiet=--test-args -q
 rustdoc_test_kernel_quiet=>/dev/null
-else ifeq ($(quiet),quiet_)
-rust_test_quiet=-q
-rustdoc_test_quiet=--test-args -q
-rustdoc_test_kernel_quiet=>/dev/null
-else
-cargo_quiet=--verbose
 endif
 
 core-cfgs = \
@@ -135,22 +128,21 @@ quiet_cmd_rustc_test_library = RUSTC TL $<
 		@$(objtree)/include/generated/rustc_cfg $(rustc_target_flags) \
 		--crate-type $(if $(rustc_test_library_proc),proc-macro,rlib) \
 		--out-dir $(objtree)/$(obj)/test --cfg testlib \
-		--sysroot $(objtree)/$(obj)/test/sysroot \
 		-L$(objtree)/$(obj)/test \
 		--crate-name $(subst rusttest-,,$(subst rusttestlib-,,$@)) $<
 
-rusttestlib-build_error: $(src)/build_error.rs rusttest-prepare FORCE
+rusttestlib-build_error: $(src)/build_error.rs FORCE
 	+$(call if_changed,rustc_test_library)
 
 rusttestlib-macros: private rustc_target_flags = --extern proc_macro
 rusttestlib-macros: private rustc_test_library_proc = yes
-rusttestlib-macros: $(src)/macros/lib.rs rusttest-prepare FORCE
+rusttestlib-macros: $(src)/macros/lib.rs FORCE
 	+$(call if_changed,rustc_test_library)
 
-rusttestlib-bindings: $(src)/bindings/lib.rs rusttest-prepare FORCE
+rusttestlib-bindings: $(src)/bindings/lib.rs FORCE
 	+$(call if_changed,rustc_test_library)
 
-rusttestlib-uapi: $(src)/uapi/lib.rs rusttest-prepare FORCE
+rusttestlib-uapi: $(src)/uapi/lib.rs FORCE
 	+$(call if_changed,rustc_test_library)
 
 quiet_cmd_rustdoc_test = RUSTDOC T $<
@@ -159,7 +151,7 @@ quiet_cmd_rustdoc_test = RUSTDOC T $<
 	$(RUSTDOC) --test $(rust_common_flags) \
 		@$(objtree)/include/generated/rustc_cfg \
 		$(rustc_target_flags) $(rustdoc_test_target_flags) \
-		--sysroot $(objtree)/$(obj)/test/sysroot $(rustdoc_test_quiet) \
+		$(rustdoc_test_quiet) \
 		-L$(objtree)/$(obj)/test --output $(rustdoc_output) \
 		--crate-name $(subst rusttest-,,$@) $<
 
@@ -192,7 +184,6 @@ quiet_cmd_rustc_test = RUSTC T  $<
 	$(RUSTC) --test $(rust_common_flags) \
 		@$(objtree)/include/generated/rustc_cfg \
 		$(rustc_target_flags) --out-dir $(objtree)/$(obj)/test \
-		--sysroot $(objtree)/$(obj)/test/sysroot \
 		-L$(objtree)/$(obj)/test \
 		--crate-name $(subst rusttest-,,$@) $<; \
 	$(objtree)/$(obj)/test/$(subst rusttest-,,$@) $(rust_test_quiet) \
@@ -200,60 +191,15 @@ quiet_cmd_rustc_test = RUSTC T  $<
 
 rusttest: rusttest-macros rusttest-kernel
 
-# This prepares a custom sysroot with our custom `alloc` instead of
-# the standard one.
-#
-# This requires several hacks:
-#   - Unlike `core` and `alloc`, `std` depends on more than a dozen crates,
-#     including third-party crates that need to be downloaded, plus custom
-#     `build.rs` steps. Thus hardcoding things here is not maintainable.
-#   - `cargo` knows how to build the standard library, but it is an unstable
-#     feature so far (`-Zbuild-std`).
-#   - `cargo` only considers the use case of building the standard library
-#     to use it in a given package. Thus we need to create a dummy package
-#     and pick the generated libraries from there.
-#   - The usual ways of modifying the dependency graph in `cargo` do not seem
-#     to apply for the `-Zbuild-std` steps, thus we have to mislead it
-#     by modifying the sources in the sysroot.
-#   - To avoid messing with the user's Rust installation, we create a clone
-#     of the sysroot. However, `cargo` ignores `RUSTFLAGS` in the `-Zbuild-std`
-#     steps, thus we use a wrapper binary passed via `RUSTC` to pass the flag.
-#
-# In the future, we hope to avoid the whole ordeal by either:
-#   - Making the `test` crate not depend on `std` (either improving upstream
-#     or having our own custom crate).
-#   - Making the tests run in kernel space (requires the previous point).
-#   - Making `std` and friends be more like a "normal" crate, so that
-#     `-Zbuild-std` and related hacks are not needed.
-quiet_cmd_rustsysroot = RUSTSYSROOT
-      cmd_rustsysroot = \
-	rm -rf $(objtree)/$(obj)/test; \
-	mkdir -p $(objtree)/$(obj)/test; \
-	cp -a $(rustc_sysroot) $(objtree)/$(obj)/test/sysroot; \
-	echo '\#!/bin/sh' > $(objtree)/$(obj)/test/rustc_sysroot; \
-	echo "$(RUSTC) --sysroot=$(abspath $(objtree)/$(obj)/test/sysroot) \"\$$@\"" \
-		>> $(objtree)/$(obj)/test/rustc_sysroot; \
-	chmod u+x $(objtree)/$(obj)/test/rustc_sysroot; \
-	$(CARGO) -q new $(objtree)/$(obj)/test/dummy; \
-	RUSTC=$(objtree)/$(obj)/test/rustc_sysroot $(CARGO) $(cargo_quiet) \
-		test -Zbuild-std --target $(rustc_host_target) \
-		--manifest-path $(objtree)/$(obj)/test/dummy/Cargo.toml; \
-	rm $(objtree)/$(obj)/test/sysroot/lib/rustlib/$(rustc_host_target)/lib/*; \
-	cp $(objtree)/$(obj)/test/dummy/target/$(rustc_host_target)/debug/deps/* \
-		$(objtree)/$(obj)/test/sysroot/lib/rustlib/$(rustc_host_target)/lib
-
-rusttest-prepare: FORCE
-	+$(call if_changed,rustsysroot)
-
 rusttest-macros: private rustc_target_flags = --extern proc_macro
 rusttest-macros: private rustdoc_test_target_flags = --crate-type proc-macro
-rusttest-macros: $(src)/macros/lib.rs rusttest-prepare FORCE
+rusttest-macros: $(src)/macros/lib.rs FORCE
 	+$(call if_changed,rustc_test)
 	+$(call if_changed,rustdoc_test)
 
 rusttest-kernel: private rustc_target_flags = --extern alloc \
     --extern build_error --extern macros --extern bindings --extern uapi
-rusttest-kernel: $(src)/kernel/lib.rs rusttest-prepare \
+rusttest-kernel: $(src)/kernel/lib.rs \
     rusttestlib-build_error rusttestlib-macros rusttestlib-bindings \
     rusttestlib-uapi FORCE
 	+$(call if_changed,rustc_test)

base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
-- 
2.45.1


