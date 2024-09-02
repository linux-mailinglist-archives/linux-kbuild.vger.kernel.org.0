Return-Path: <linux-kbuild+bounces-3325-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 229F4968C84
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Sep 2024 18:57:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C22301F22F84
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Sep 2024 16:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B8092139BF;
	Mon,  2 Sep 2024 16:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S2MkbGFW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFE92139C7;
	Mon,  2 Sep 2024 16:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725296177; cv=none; b=D1UhlHN792o/hqJY1QPR794PXwhDRBcpBSBj6uByrzmTqnB08wEGCyhOU9UKl3g9HEdqYltNS9DuO628reOcJW8D4osKdAYZywgi/qx2GFL5rBm9PjWxR02EZC+0jEeC1MShHSm0M71zPsHryM98m8Oo7Pyb5YLTbHlwh44yjlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725296177; c=relaxed/simple;
	bh=6U2O9UkpXcwVcGaoZPhOeZwiwv01xDuO6fgQ9kL3ZIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GpdT82pwkGgGrlCTODceHVclPZEDij9hhUZ4QEgFejeVcUxuKA7Oiim3JT+JfpF2bpZw8L0k4OD1S4wu/2ujlsZaWjMmoxrJs3yOSiPd6SR33KMuVcdQjTyBP3wfNAuhXk/2VOpOCqk+mXpClAtnpgIZAeC/lMgDI5IEb3tN6Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S2MkbGFW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80433C4CEC4;
	Mon,  2 Sep 2024 16:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725296176;
	bh=6U2O9UkpXcwVcGaoZPhOeZwiwv01xDuO6fgQ9kL3ZIY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S2MkbGFWV/b1bWzstYhJ+FETznpvRzt/sLOetwFtCLTACYyp1JrcXVevUKh5hyEXc
	 XYRxcAOe0BunBJOzHmWGPMjIFxr+RUOR6opb0WENAMbkt0en2GKFTskWvO33qBcprr
	 8dz33LEuL5TDZn7YZ6gtUF4JhbT4F8+OFc0FBpfIcl8LcZ8prvP4fg5ntwwLMNXg8C
	 GhqiqLESM2elgnEhRde6u6CPD8fFA+aJMYzUW6vZcBJ9rmevnCBUBt7xrpBhGUy5Yz
	 oRcfqKO0Pc7fLRjBEEX2ANESDliOcnclj3AJ9IcQa7djoicn0UtWD2XyOC+EmP6Pdi
	 8DhDB3OLYj6gw==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH v2 4/6] kbuild: rust: replace proc macros dependency on `core.o` with the version text
Date: Mon,  2 Sep 2024 18:55:31 +0200
Message-ID: <20240902165535.1101978-5-ojeda@kernel.org>
In-Reply-To: <20240902165535.1101978-1-ojeda@kernel.org>
References: <20240902165535.1101978-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the `RUSTC_VERSION_TEXT` rebuild support in place, now proc macros
can depend on that instead of `core.o`.

This means that both the `core` and `macros` crates can be built in
parallel, and that touching `core.o` does not trigger a rebuild of the
proc macros.

This could be accomplished using the same approach as for `core`
(i.e. depending directly on `include/config/RUSTC_VERSION_TEXT`). However,
that is considered an implementation detail [1], and thus it is best
to avoid it. Instead, let fixdep find a string that we explicitly
write down in the source code for this purpose (like it is done for
`include/linux/compiler-version.h`), which we can easily do (unlike for
`core`) since this is our own source code.

Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Link: https://lore.kernel.org/rust-for-linux/CAK7LNAQBG0nDupXSgAAk-6nOqeqGVkr3H1RjYaqRJ1OxmLm6xA@mail.gmail.com/ [1]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile      | 4 +---
 rust/macros/lib.rs | 4 ++++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index bb57a7c30f1a..4eae318f36ff 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -342,9 +342,7 @@ quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
 		--crate-name $(patsubst lib%.so,%,$(notdir $@)) $<
 
 # Procedural macros can only be used with the `rustc` that compiled it.
-# Therefore, to get `libmacros.so` automatically recompiled when the compiler
-# version changes, we add `core.o` as a dependency (even if it is not needed).
-$(obj)/libmacros.so: $(src)/macros/lib.rs $(obj)/core.o FORCE
+$(obj)/libmacros.so: $(src)/macros/lib.rs FORCE
 	+$(call if_changed_dep,rustc_procmacro)
 
 quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L $@
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 5be0cb9db3ee..a626b1145e5c 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -2,6 +2,10 @@
 
 //! Crate for all kernel procedural macros.
 
+// When fixdep scans this, it will find this string `CONFIG_RUSTC_VERSION_TEXT`
+// and thus add a dependency on `include/config/RUSTC_VERSION_TEXT`, which is
+// touched by Kconfig when the version string from the compiler changes.
+
 #[macro_use]
 mod quote;
 mod concat_idents;
-- 
2.46.0


