Return-Path: <linux-kbuild+bounces-9364-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E72C29724
	for <lists+linux-kbuild@lfdr.de>; Sun, 02 Nov 2025 22:30:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 732AD3AD72B
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Nov 2025 21:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BE232376FC;
	Sun,  2 Nov 2025 21:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mnhr2b3e"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DDE225791;
	Sun,  2 Nov 2025 21:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762119002; cv=none; b=BfThHVq+jHzjHvh7NCR7IYnCUREJZ2ldKA8m5pMiNAiadRufMEHrsy4JSKYExFYgCeGsAjuJvPs+RZ1Znxv12PJ1gOFiOg6uwka1dDfnyH5i8iwzPCZcK9/I2+8ojIyGmFmFvZnrRrR+HpZZwWZSdcZ7gL6FJ2afuaKLcX06/yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762119002; c=relaxed/simple;
	bh=Iw13zHgZThn7lQVt8FQ6YD6tJgqTn5cgsMoeYx1qZVg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mG4w4VWQQpPzmcfYcVd1g083pQfy7GArhd9O42NkEJohIQCC7K3oZnNT+B9eQkrxEeaFeprfHG90hRwZvvGqMhGlHgzc6Xwnms37Y2HMvpulP0snCiqknAysfePAaIIbvU27Mfh0HPbYjK02/nlRlWc7gjKzjX7DWCTHJDlAg/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mnhr2b3e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77954C116D0;
	Sun,  2 Nov 2025 21:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762119000;
	bh=Iw13zHgZThn7lQVt8FQ6YD6tJgqTn5cgsMoeYx1qZVg=;
	h=From:To:Cc:Subject:Date:From;
	b=Mnhr2b3eRrWFT9heoUctNj5wRsVdIi50eAjQlk3qeByU5MXcM0GOmDaUDlaq4CZCC
	 JbLHBHwp5wOkKae5Bx5OxD4MsFTsMw+m4hsU7D93VrkIhRXuYMSDsiTxClzvwxA662
	 JTjkYDMlbOQ7aDyugcYAXcrZI72CaSHN5fPwK8iN0u5LbzxMQSLX5KrZpVuLC5+d+B
	 f6VD2P8hA7EGMuFZIyajOaPldHrKauOt7MkFvgMXd9X2P28UkbrrhflBZSMXPmeo6i
	 3mzTNVNJKbMs3UPHDxzYU8tBIHfAqPx6fqavieo/xLjxu/A4XQb7dKwXcuGCs7Tvf3
	 XG0Mb5JZAfdGQ==
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
	stable@vger.kernel.org
Subject: [PATCH 1/2] rust: kbuild: treat `build_error` and `rustdoc` as kernel objects
Date: Sun,  2 Nov 2025 22:28:52 +0100
Message-ID: <20251102212853.1505384-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Even if normally `build_error` isn't a kernel object, it should still
be treated as such so that we pass the same flags. Similarly, `rustdoc`
targets are never kernel objects, but we need to treat them as such.

Otherwise, starting with Rust 1.91.0 (released 2025-10-30), `rustc`
will complain about missing sanitizer flags since `-Zsanitizer` is a
target modifier too [1]:

    error: mixing `-Zsanitizer` will cause an ABI mismatch in crate `build_error`
     --> rust/build_error.rs:3:1
      |
    3 | //! Build-time error.
      | ^
      |
      = help: the `-Zsanitizer` flag modifies the ABI so Rust crates compiled with different values of this flag cannot be used together safely
      = note: unset `-Zsanitizer` in this crate is incompatible with `-Zsanitizer=kernel-address` in dependency `core`
      = help: set `-Zsanitizer=kernel-address` in this crate or unset `-Zsanitizer` in `core`
      = help: if you are sure this will not cause problems, you may use `-Cunsafe-allow-abi-mismatch=sanitizer` to silence this error

Thus explicitly mark them as kernel objects.

Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned in older LTSs).
Link: https://github.com/rust-lang/rust/pull/138736 [1]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/Makefile b/rust/Makefile
index 23c7ae905bd2..5de103e20841 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -127,9 +127,14 @@ rustdoc-core: private rustc_target_flags = --edition=$(core-edition) $(core-cfgs
 rustdoc-core: $(RUST_LIB_SRC)/core/src/lib.rs rustdoc-clean FORCE
 	+$(call if_changed,rustdoc)
 
+# Even if `rustdoc` targets are not kernel objects, they should still be
+# treated as such so that we pass the same flags. Otherwise, for instance,
+# `rustc` will complain about missing sanitizer flags causing an ABI mismatch.
+rustdoc-compiler_builtins: private is-kernel-object := y
 rustdoc-compiler_builtins: $(src)/compiler_builtins.rs rustdoc-core FORCE
 	+$(call if_changed,rustdoc)
 
+rustdoc-ffi: private is-kernel-object := y
 rustdoc-ffi: $(src)/ffi.rs rustdoc-core FORCE
 	+$(call if_changed,rustdoc)
 
@@ -147,6 +152,7 @@ rustdoc-pin_init: $(src)/pin-init/src/lib.rs rustdoc-pin_init_internal \
     rustdoc-macros FORCE
 	+$(call if_changed,rustdoc)
 
+rustdoc-kernel: private is-kernel-object := y
 rustdoc-kernel: private rustc_target_flags = --extern ffi --extern pin_init \
     --extern build_error --extern macros \
     --extern bindings --extern uapi
@@ -522,6 +528,10 @@ $(obj)/pin_init.o: $(src)/pin-init/src/lib.rs $(obj)/compiler_builtins.o \
     $(obj)/$(libpin_init_internal_name) $(obj)/$(libmacros_name) FORCE
 	+$(call if_changed_rule,rustc_library)
 
+# Even if normally `build_error` is not a kernel object, it should still be
+# treated as such so that we pass the same flags. Otherwise, for instance,
+# `rustc` will complain about missing sanitizer flags causing an ABI mismatch.
+$(obj)/build_error.o: private is-kernel-object := y
 $(obj)/build_error.o: private skip_gendwarfksyms = 1
 $(obj)/build_error.o: $(src)/build_error.rs $(obj)/compiler_builtins.o FORCE
 	+$(call if_changed_rule,rustc_library)
-- 
2.51.2


