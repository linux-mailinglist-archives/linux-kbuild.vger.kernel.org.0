Return-Path: <linux-kbuild+bounces-8197-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2835DB12AB8
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Jul 2025 15:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 144CB1C2639A
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Jul 2025 13:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 522EF246BD3;
	Sat, 26 Jul 2025 13:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gq6sgy5D"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C20242D68;
	Sat, 26 Jul 2025 13:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753536892; cv=none; b=Iy1EWiPe3Q8M4nkuLBzh6hdiOoOxut6NlLDumj/zyWLhoUqhESVYgg4s7qqb27RxTjCiDi3cjNCZKRRxuLWZ4OEg7LM9sLoRip+weU5/SBIDoxAvK/kzdplZCss89FFIrSW8JG7k3liScGjDCFYOfHfL9qrZB5gCw+vLFS44j+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753536892; c=relaxed/simple;
	bh=+XbzViTfrt1TfYbQ9nIGtTF251tWEMyhnVpl9OCmyHI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CjM0Aqt30XJy8oNYSSBhUZDv61o98bsrdZl5L0lozQODH3NfaYtr4et4UJAf+GnMrrp0TE9FPxMx+dz5AB/FQX7ngLEzM+sPdoc6dTOtCJlWEzMoXiUy7bFkmY2MnSKszvrCDI4Lc0kpxa4zpbv1s6xz/pU7Qcg9f5iuc/z1GEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gq6sgy5D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F25BC4CEED;
	Sat, 26 Jul 2025 13:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753536891;
	bh=+XbzViTfrt1TfYbQ9nIGtTF251tWEMyhnVpl9OCmyHI=;
	h=From:To:Cc:Subject:Date:From;
	b=Gq6sgy5DYh2FVWjdUx+aTU477fJ4QZuCrcqepppTBOcvVUzJGXTicrEheTNeGiZgx
	 K1O5NNqTZqgCAGhD7qIkLmAC+kITA8xilBwz00jbmV2tKWqrvRLTmn1o/JD+VOEMMK
	 Z7aGI1a2wEU1c67jje1Z/TtsJIFzXhVQuW/43mDKHUIu0g63pOV7mllI1gJGc3Qxn0
	 xoFvUlx9oYgglbsJ9s4cavJ3hyihHxn4vqpaG3NgZuEfmpS2uSaiMVxNnN0FLX+sf7
	 TSYq4uf23p9BAI3910uCuBpKnXJ/2bYnU/U1lGB+JZtMo0oawiLRFd3+4Rw8NZLVGJ
	 RPiS+AA2KNQPA==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	stable@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH] rust: kbuild: clean output before running `rustdoc`
Date: Sat, 26 Jul 2025 15:34:35 +0200
Message-ID: <20250726133435.2460085-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`rustdoc` can get confused when generating documentation into a folder
that contains generated files from other `rustdoc` versions.

For instance, running something like:

    rustup default 1.78.0
    make LLVM=1 rustdoc
    rustup default 1.88.0
    make LLVM=1 rustdoc

may generate errors like:

    error: couldn't generate documentation: invalid template: last line expected to start with a comment
      |
      = note: failed to create or modify "./Documentation/output/rust/rustdoc/src-files.js"

Thus just always clean the output folder before generating the
documentation -- we are anyway regenerating it every time the `rustdoc`
target gets called, at least for the time being.

Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned in older LTSs).
Reported-by: Daniel Almeida <daniel.almeida@collabora.com>
Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/288089/topic/x/near/527201113
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 115b63b7d1e3..771246bc7ae6 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -103,14 +103,14 @@ rustdoc: rustdoc-core rustdoc-macros rustdoc-compiler_builtins \
 rustdoc-macros: private rustdoc_host = yes
 rustdoc-macros: private rustc_target_flags = --crate-type proc-macro \
     --extern proc_macro
-rustdoc-macros: $(src)/macros/lib.rs FORCE
+rustdoc-macros: $(src)/macros/lib.rs rustdoc-clean FORCE
 	+$(call if_changed,rustdoc)
 
 # Starting with Rust 1.82.0, skipping `-Wrustdoc::unescaped_backticks` should
 # not be needed -- see https://github.com/rust-lang/rust/pull/128307.
 rustdoc-core: private skip_flags = --edition=2021 -Wrustdoc::unescaped_backticks
 rustdoc-core: private rustc_target_flags = --edition=$(core-edition) $(core-cfgs)
-rustdoc-core: $(RUST_LIB_SRC)/core/src/lib.rs FORCE
+rustdoc-core: $(RUST_LIB_SRC)/core/src/lib.rs rustdoc-clean FORCE
 	+$(call if_changed,rustdoc)
 
 rustdoc-compiler_builtins: $(src)/compiler_builtins.rs rustdoc-core FORCE
@@ -122,7 +122,8 @@ rustdoc-ffi: $(src)/ffi.rs rustdoc-core FORCE
 rustdoc-pin_init_internal: private rustdoc_host = yes
 rustdoc-pin_init_internal: private rustc_target_flags = --cfg kernel \
     --extern proc_macro --crate-type proc-macro
-rustdoc-pin_init_internal: $(src)/pin-init/internal/src/lib.rs FORCE
+rustdoc-pin_init_internal: $(src)/pin-init/internal/src/lib.rs \
+    rustdoc-clean FORCE
 	+$(call if_changed,rustdoc)
 
 rustdoc-pin_init: private rustdoc_host = yes
@@ -140,6 +141,9 @@ rustdoc-kernel: $(src)/kernel/lib.rs rustdoc-core rustdoc-ffi rustdoc-macros \
     $(obj)/bindings.o FORCE
 	+$(call if_changed,rustdoc)
 
+rustdoc-clean: FORCE
+	$(Q)rm -rf $(rustdoc_output)
+
 quiet_cmd_rustc_test_library = $(RUSTC_OR_CLIPPY_QUIET) TL $<
       cmd_rustc_test_library = \
 	OBJTREE=$(abspath $(objtree)) \

base-commit: 89be9a83ccf1f88522317ce02f854f30d6115c41
-- 
2.50.1


