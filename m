Return-Path: <linux-kbuild+bounces-9822-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F106C8154F
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 16:28:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6CFF93496ED
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 15:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86DD931A7E4;
	Mon, 24 Nov 2025 15:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JGkzC+EU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A69531A570;
	Mon, 24 Nov 2025 15:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763997625; cv=none; b=jFRB90KmODQuBrD+eMDLjQndavXyQufuGmAtQS9NODK/AtQK86K79vrD3bajLbK2EkfbKmIFuBbSP2kl8cl65X1lgaUiDKSrjS6ARsIBDZw8gg8ZHo9K8fOjs4qYBG0y84ItCL6yzvp1tXGcrWQ4hA52EG9hfn/221O2uUpQhdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763997625; c=relaxed/simple;
	bh=fvRz5CMHImEce37FTzr6xUC2/FPATI5K1NWVCsbVhiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a73ykhUs1+pB8+k6xe+ntYVSmJn51WsMKudQa8g7Eh7aUiOgyvR1mmj73+KNA10ChZ61q6rFzII4oCEAo8jVNNakuCBf6puBLp5pwBYq9dn0I6UQQghLY2uKWoU/iXf7gcB7oGPTkx4fMCZLWC+BYPcw6quM3MhSoPWn2Dwy6Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JGkzC+EU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EEC4C4CEF1;
	Mon, 24 Nov 2025 15:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763997624;
	bh=fvRz5CMHImEce37FTzr6xUC2/FPATI5K1NWVCsbVhiQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JGkzC+EU5FRH4M9wK7roYJGwXmwgXRIQOCB2K6qSjm6jUyhsutiix3A7h2kNe3E0z
	 Xo4pvbcLFk4kx0oOa6l4BmkpEWQYLEUqkIHlWoHUmZE0Rs5rHd6AmOumYjfzCBklGm
	 Rw/XOOMxSeN5tx5O+Iuwn/sKQi4FyS8dbMOlt7cjK4eEGR4DDfus8dPgSaLlkpvIRC
	 vAMK//Ac1qTDqR0XQy1scKGRaSYIbOuuxU6A3TtFnNQYQBJLkUhCLnOEoFAqbeUWUM
	 eRjrcW8ELNAHlX66EFe+rzxv0oSAqr4v2RCwHAgqCAAsrMda+J/5nPI5YjxyTCJN6X
	 iCLjRSLyPRsiA==
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
Subject: [PATCH v2 20/20] rust: macros: support `proc-macro2`, `quote` and `syn`
Date: Mon, 24 Nov 2025 16:18:32 +0100
Message-ID: <20251124151837.2184382-21-ojeda@kernel.org>
In-Reply-To: <20251124151837.2184382-1-ojeda@kernel.org>
References: <20251124151837.2184382-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

One of the two main uses cases for adding `proc-macro2`, `quote` and
`syn` is the `macros` crates (and the other `pin-init`).

Thus add the support for the crates in `macros` already.

Tested-by: Jesung Yang <y.j3ms.n@gmail.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile                     | 13 +++++++++----
 scripts/generate_rust_analyzer.py |  2 +-
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 8988ecf32531..d7d19c21b671 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -184,7 +184,7 @@ rustdoc-syn: $(src)/syn/lib.rs rustdoc-clean rustdoc-quote FORCE
 
 rustdoc-macros: private rustdoc_host = yes
 rustdoc-macros: private rustc_target_flags = --crate-type proc-macro \
-    --extern proc_macro
+    --extern proc_macro --extern proc_macro2 --extern quote --extern syn
 rustdoc-macros: $(src)/macros/lib.rs rustdoc-clean rustdoc-proc_macro2 \
     rustdoc-quote rustdoc-syn FORCE
 	+$(call if_changed,rustdoc)
@@ -256,9 +256,11 @@ rusttestlib-syn: private rustc_target_flags = $(syn-flags)
 rusttestlib-syn: $(src)/syn/lib.rs rusttestlib-quote FORCE
 	+$(call if_changed,rustc_test_library)
 
-rusttestlib-macros: private rustc_target_flags = --extern proc_macro
+rusttestlib-macros: private rustc_target_flags = --extern proc_macro \
+    --extern proc_macro2 --extern quote --extern syn
 rusttestlib-macros: private rustc_test_library_proc = yes
-rusttestlib-macros: $(src)/macros/lib.rs FORCE
+rusttestlib-macros: $(src)/macros/lib.rs \
+    rusttestlib-proc_macro2 rusttestlib-quote rusttestlib-syn FORCE
 	+$(call if_changed,rustc_test_library)
 
 rusttestlib-pin_init_internal: private rustc_target_flags = --cfg kernel \
@@ -339,7 +341,8 @@ quiet_cmd_rustc_test = $(RUSTC_OR_CLIPPY_QUIET) T  $<
 rusttest: rusttest-macros
 
 rusttest-macros: private rustc_target_flags = --extern proc_macro \
-	--extern macros --extern kernel --extern pin_init
+    --extern macros --extern kernel --extern pin_init \
+    --extern proc_macro2 --extern quote --extern syn
 rusttest-macros: private rustdoc_test_target_flags = --crate-type proc-macro
 rusttest-macros: $(src)/macros/lib.rs \
     rusttestlib-macros rusttestlib-kernel rusttestlib-pin_init FORCE
@@ -529,6 +532,8 @@ quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
 		@$(objtree)/include/generated/rustc_cfg $<
 
 # Procedural macros can only be used with the `rustc` that compiled it.
+$(obj)/$(libmacros_name): private rustc_target_flags = \
+    --extern proc_macro2 --extern quote --extern syn
 $(obj)/$(libmacros_name): $(src)/macros/lib.rs $(obj)/libproc_macro2.rlib \
     $(obj)/libquote.rlib $(obj)/libsyn.rlib FORCE
 	+$(call if_changed_dep,rustc_procmacro)
diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 5b6f7b8d6918..147d0cc94068 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -110,7 +110,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
     append_crate(
         "macros",
         srctree / "rust" / "macros" / "lib.rs",
-        ["std", "proc_macro"],
+        ["std", "proc_macro", "proc_macro2", "quote", "syn"],
         is_proc_macro=True,
     )
 
-- 
2.52.0


