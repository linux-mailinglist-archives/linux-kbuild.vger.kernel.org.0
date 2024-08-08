Return-Path: <linux-kbuild+bounces-2915-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9263E94C6DA
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Aug 2024 00:13:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 401781C217C2
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Aug 2024 22:13:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73AEC1684AE;
	Thu,  8 Aug 2024 22:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EBlbva0V"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4818C15EFA3;
	Thu,  8 Aug 2024 22:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723155139; cv=none; b=iOhLNYY/zL4kFUfq24ucRsMXjErAKKXN5bK89PsFrqfXST5EeRPfT2WO2xs3kenIiKK7ZRlsOlTG53/r1pj9hEQaObbIVyzXbxlSJJ6AN1hxnlz7giQCjfySoDIcBw1PgMtTewT2FdhrUVkauQAoGOEGCLu7x679ZZ+tFihu+Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723155139; c=relaxed/simple;
	bh=qASlKvmzFWrXL4Fx7wsh+J7JNlB35sjrOi18fXWXpKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=duxsWx2YspTynfGl+snSoOW1qFFzrIUDYNcu7I/SU5i8NEcpMFvvTG/oN5Zn0pLweRBoR35TZSh18Buo+aEPjtUg9rT8yju45OmNY5rKaHkXSb+VEw8O86eoo7Tw2Fjow+unaWlmmPW0tCh42hihF6hz9XhKLRpiuxEVbz9OVIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EBlbva0V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C184C32782;
	Thu,  8 Aug 2024 22:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723155138;
	bh=qASlKvmzFWrXL4Fx7wsh+J7JNlB35sjrOi18fXWXpKk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EBlbva0VzqiGmBnX/N5DCgSE/4V2oNfC065MEbyoRR/Dr9UW/sUCmOy9NSOnhG2Gr
	 ztq5/yEtIeX4x0p3VA0mjzAZHPF4c5vvni5IiPutosVplg1t1Y7Ywk+xYyPuFGt6v0
	 tQzUVl3XRD86txFwxJHVWHYIEsJf4LEKRJW2HB4HpxKFjPG5k5J3RfoHpzJxXZzwfT
	 kWz2Zz+grKK+vmYtwc37VgZbiT0WYJSis0lohQBuOgNB/JTBamnNczanOnEdwZT+OM
	 BtQjNvslnOAoNo381aBWXLz3hv0Uw2fuo/ivpKFZM6BNtmoblFIq05CHAe7+muscy2
	 Ur71DpNQlnwBA==
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
Subject: [PATCH 5/6] kbuild: rust: replace proc macros dependency on `core.o` with the version text
Date: Fri,  9 Aug 2024 00:11:37 +0200
Message-ID: <20240808221138.873750-6-ojeda@kernel.org>
In-Reply-To: <20240808221138.873750-1-ojeda@kernel.org>
References: <20240808221138.873750-1-ojeda@kernel.org>
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

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 966743a9ee25..40c8d2c57024 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -329,9 +329,8 @@ quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
 		--crate-name $(patsubst lib%.so,%,$(notdir $@)) $<
 
 # Procedural macros can only be used with the `rustc` that compiled it.
-# Therefore, to get `libmacros.so` automatically recompiled when the compiler
-# version changes, we add `core.o` as a dependency (even if it is not needed).
-$(obj)/libmacros.so: $(src)/macros/lib.rs $(obj)/core.o FORCE
+$(obj)/libmacros.so: $(src)/macros/lib.rs \
+    $(wildcard $(objtree)/include/config/RUSTC_VERSION_TEXT) FORCE
 	+$(call if_changed_dep,rustc_procmacro)
 
 quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L $@
-- 
2.46.0


