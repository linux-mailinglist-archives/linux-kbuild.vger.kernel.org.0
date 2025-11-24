Return-Path: <linux-kbuild+bounces-9818-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 884ABC8151E
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 16:26:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8F931342D7C
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 15:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D81593195E3;
	Mon, 24 Nov 2025 15:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NO+XK3uO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D39313E14;
	Mon, 24 Nov 2025 15:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763997609; cv=none; b=PbX7k+RfNjw0tQLakeHgWJM0I4NduI+B8eQsepjAwLrNLG2E7S0atuSsridV3s2nbpEfN2Pnex79wDo13QQKC9qBHPVo3tBTxM2DcBP8K2ut6juinh0Pj39390oIThKDAQ3NB3YqgppvEUL+bqNOvSSW7KdVYACWOKQRaIkSH0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763997609; c=relaxed/simple;
	bh=PKWbTj76mN+E7DJy9l3xZ8TC9HeZ6vU+NiB/nfiDqtY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MmUr7/+qIjYZ/Q9WsthNXSizIrqfxq4K5jwuOpNVcpLVuz/AOa3svmpUNjgQ5tcHGh6ZDWyJLUxYE6DykNu66x/fPiHTPGpsVsaHjLkkCcSpE3Rac938QryXEUt7VMU1quJbwHTzrsa/h6GuLMwTYXXtXaTpXa/c/VNd3RKzV+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NO+XK3uO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95BFDC19424;
	Mon, 24 Nov 2025 15:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763997608;
	bh=PKWbTj76mN+E7DJy9l3xZ8TC9HeZ6vU+NiB/nfiDqtY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NO+XK3uO8mDDnY1XFxH1DNcM/NFseleM8y7mQGaE8ITyZmC+YsOrPKsDCy6BkL4ix
	 0pC9tS0wbmaBRKbHacdCXzaGJ2QXUolgodwEWJz/dS6M3W5PWd6ipXXIBgV4/amC2O
	 4mRHpZDZgOZyvUmP+rzxKSkM43y4USaW/qNzzgK/fEGNem9M4bYSHYOOh/m5MMA7gg
	 BuBDYJUXpoPEmT4C/URcCMbd76PesH/0+WjURH+828maL3Y+ThTjbHCT4kLnhJAsNn
	 F8Gc13OFLO0T/cd1P6Ud+Fomq9inIjZqS28gHYeMbwVHEGpT55NZ3Y+f95bw2CfuO2
	 8FBTOmEnE0iAg==
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
Subject: [PATCH v2 16/20] rust: syn: add SPDX License Identifiers
Date: Mon, 24 Nov 2025 16:18:28 +0100
Message-ID: <20251124151837.2184382-17-ojeda@kernel.org>
In-Reply-To: <20251124151837.2184382-1-ojeda@kernel.org>
References: <20251124151837.2184382-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Originally, when the Rust upstream `alloc` standard library crate was
vendored in commit 057b8d257107 ("rust: adapt `alloc` crate to the
kernel"), the SPDX License Identifiers were added to every file so that
the license on those was clear.

Thus do the same for the `syn` crate.

This makes `scripts/spdxcheck.py` pass.

Reviewed-by: Gary Guo <gary@garyguo.net>
Tested-by: Gary Guo <gary@garyguo.net>
Tested-by: Jesung Yang <y.j3ms.n@gmail.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/syn/attr.rs               | 2 ++
 rust/syn/bigint.rs             | 2 ++
 rust/syn/buffer.rs             | 2 ++
 rust/syn/classify.rs           | 2 ++
 rust/syn/custom_keyword.rs     | 2 ++
 rust/syn/custom_punctuation.rs | 2 ++
 rust/syn/data.rs               | 2 ++
 rust/syn/derive.rs             | 2 ++
 rust/syn/discouraged.rs        | 2 ++
 rust/syn/drops.rs              | 2 ++
 rust/syn/error.rs              | 2 ++
 rust/syn/export.rs             | 2 ++
 rust/syn/expr.rs               | 2 ++
 rust/syn/ext.rs                | 2 ++
 rust/syn/file.rs               | 2 ++
 rust/syn/fixup.rs              | 2 ++
 rust/syn/gen/clone.rs          | 2 ++
 rust/syn/gen/debug.rs          | 2 ++
 rust/syn/gen/eq.rs             | 2 ++
 rust/syn/gen/fold.rs           | 2 ++
 rust/syn/gen/hash.rs           | 2 ++
 rust/syn/gen/visit.rs          | 2 ++
 rust/syn/gen/visit_mut.rs      | 2 ++
 rust/syn/generics.rs           | 2 ++
 rust/syn/group.rs              | 2 ++
 rust/syn/ident.rs              | 2 ++
 rust/syn/item.rs               | 2 ++
 rust/syn/lib.rs                | 2 ++
 rust/syn/lifetime.rs           | 2 ++
 rust/syn/lit.rs                | 2 ++
 rust/syn/lookahead.rs          | 2 ++
 rust/syn/mac.rs                | 2 ++
 rust/syn/macros.rs             | 2 ++
 rust/syn/meta.rs               | 2 ++
 rust/syn/op.rs                 | 2 ++
 rust/syn/parse.rs              | 2 ++
 rust/syn/parse_macro_input.rs  | 2 ++
 rust/syn/parse_quote.rs        | 2 ++
 rust/syn/pat.rs                | 2 ++
 rust/syn/path.rs               | 2 ++
 rust/syn/precedence.rs         | 2 ++
 rust/syn/print.rs              | 2 ++
 rust/syn/punctuated.rs         | 2 ++
 rust/syn/restriction.rs        | 2 ++
 rust/syn/scan_expr.rs          | 2 ++
 rust/syn/sealed.rs             | 2 ++
 rust/syn/span.rs               | 2 ++
 rust/syn/spanned.rs            | 2 ++
 rust/syn/stmt.rs               | 2 ++
 rust/syn/thread.rs             | 2 ++
 rust/syn/token.rs              | 2 ++
 rust/syn/tt.rs                 | 2 ++
 rust/syn/ty.rs                 | 2 ++
 rust/syn/verbatim.rs           | 2 ++
 rust/syn/whitespace.rs         | 2 ++
 55 files changed, 110 insertions(+)

diff --git a/rust/syn/attr.rs b/rust/syn/attr.rs
index 2bdf96ee7fa9..020b31f9de22 100644
--- a/rust/syn/attr.rs
+++ b/rust/syn/attr.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 #[cfg(feature = "parsing")]
 use crate::error::Error;
 #[cfg(feature = "parsing")]
diff --git a/rust/syn/bigint.rs b/rust/syn/bigint.rs
index 66aaa9372540..d706f9f515e9 100644
--- a/rust/syn/bigint.rs
+++ b/rust/syn/bigint.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use std::ops::{AddAssign, MulAssign};
 
 // For implementing base10_digits() accessor on LitInt.
diff --git a/rust/syn/buffer.rs b/rust/syn/buffer.rs
index 7b6a504eeb7c..406f70db323c 100644
--- a/rust/syn/buffer.rs
+++ b/rust/syn/buffer.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! A stably addressed token buffer supporting efficient traversal based on a
 //! cheaply copyable cursor.
 
diff --git a/rust/syn/classify.rs b/rust/syn/classify.rs
index 8eab19dbc37c..92a975bfe4aa 100644
--- a/rust/syn/classify.rs
+++ b/rust/syn/classify.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 #[cfg(feature = "full")]
 use crate::expr::Expr;
 #[cfg(any(feature = "printing", feature = "full"))]
diff --git a/rust/syn/custom_keyword.rs b/rust/syn/custom_keyword.rs
index cc4f632c981a..ff2c415f1aab 100644
--- a/rust/syn/custom_keyword.rs
+++ b/rust/syn/custom_keyword.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 /// Define a type that supports parsing and printing a given identifier as if it
 /// were a keyword.
 ///
diff --git a/rust/syn/custom_punctuation.rs b/rust/syn/custom_punctuation.rs
index eef5f5458459..d37c0e9c3a1e 100644
--- a/rust/syn/custom_punctuation.rs
+++ b/rust/syn/custom_punctuation.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 /// Define a type that supports parsing and printing a multi-character symbol
 /// as if it were a punctuation token.
 ///
diff --git a/rust/syn/data.rs b/rust/syn/data.rs
index 96db2a0b7c6f..c32c1366c1db 100644
--- a/rust/syn/data.rs
+++ b/rust/syn/data.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use crate::attr::Attribute;
 use crate::expr::{Expr, Index, Member};
 use crate::ident::Ident;
diff --git a/rust/syn/derive.rs b/rust/syn/derive.rs
index 3443ecfc05cb..27fd9f12c88c 100644
--- a/rust/syn/derive.rs
+++ b/rust/syn/derive.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use crate::attr::Attribute;
 use crate::data::{Fields, FieldsNamed, Variant};
 use crate::generics::Generics;
diff --git a/rust/syn/discouraged.rs b/rust/syn/discouraged.rs
index c8d6bfe89a14..2acd631ece84 100644
--- a/rust/syn/discouraged.rs
+++ b/rust/syn/discouraged.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! Extensions to the parsing API with niche applicability.
 
 use crate::buffer::Cursor;
diff --git a/rust/syn/drops.rs b/rust/syn/drops.rs
index c54308f02c13..2c4ae333dad8 100644
--- a/rust/syn/drops.rs
+++ b/rust/syn/drops.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use std::iter;
 use std::mem::ManuallyDrop;
 use std::ops::{Deref, DerefMut};
diff --git a/rust/syn/error.rs b/rust/syn/error.rs
index 63310543a3b4..6fa0faf7f4e4 100644
--- a/rust/syn/error.rs
+++ b/rust/syn/error.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 #[cfg(feature = "parsing")]
 use crate::buffer::Cursor;
 use crate::thread::ThreadBound;
diff --git a/rust/syn/export.rs b/rust/syn/export.rs
index b9ea5c747b75..05dad324ba51 100644
--- a/rust/syn/export.rs
+++ b/rust/syn/export.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 #[doc(hidden)]
 pub use std::clone::Clone;
 #[doc(hidden)]
diff --git a/rust/syn/expr.rs b/rust/syn/expr.rs
index 1e49d9a6633e..deb918436604 100644
--- a/rust/syn/expr.rs
+++ b/rust/syn/expr.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use crate::attr::Attribute;
 #[cfg(all(feature = "parsing", feature = "full"))]
 use crate::error::Result;
diff --git a/rust/syn/ext.rs b/rust/syn/ext.rs
index 5cd79e863a9d..a9be9af42787 100644
--- a/rust/syn/ext.rs
+++ b/rust/syn/ext.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! Extension traits to provide parsing methods on foreign types.
 
 use crate::buffer::Cursor;
diff --git a/rust/syn/file.rs b/rust/syn/file.rs
index 8956d82eee93..ce2d2680ca9a 100644
--- a/rust/syn/file.rs
+++ b/rust/syn/file.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use crate::attr::Attribute;
 use crate::item::Item;
 
diff --git a/rust/syn/fixup.rs b/rust/syn/fixup.rs
index 6d2c3092d548..79b6d7618bb7 100644
--- a/rust/syn/fixup.rs
+++ b/rust/syn/fixup.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use crate::classify;
 use crate::expr::Expr;
 #[cfg(feature = "full")]
diff --git a/rust/syn/gen/clone.rs b/rust/syn/gen/clone.rs
index be2b698422da..dfb53182e378 100644
--- a/rust/syn/gen/clone.rs
+++ b/rust/syn/gen/clone.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 // This file is @generated by syn-internal-codegen.
 // It is not intended for manual editing.
 
diff --git a/rust/syn/gen/debug.rs b/rust/syn/gen/debug.rs
index aa42e32c60ed..d594e57fcf21 100644
--- a/rust/syn/gen/debug.rs
+++ b/rust/syn/gen/debug.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 // This file is @generated by syn-internal-codegen.
 // It is not intended for manual editing.
 
diff --git a/rust/syn/gen/eq.rs b/rust/syn/gen/eq.rs
index 128e8991eecc..79e9691b8c67 100644
--- a/rust/syn/gen/eq.rs
+++ b/rust/syn/gen/eq.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 // This file is @generated by syn-internal-codegen.
 // It is not intended for manual editing.
 
diff --git a/rust/syn/gen/fold.rs b/rust/syn/gen/fold.rs
index 1f0afd31919d..0643a72f87ca 100644
--- a/rust/syn/gen/fold.rs
+++ b/rust/syn/gen/fold.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 // This file is @generated by syn-internal-codegen.
 // It is not intended for manual editing.
 
diff --git a/rust/syn/gen/hash.rs b/rust/syn/gen/hash.rs
index 04f23453a117..fae2197a5610 100644
--- a/rust/syn/gen/hash.rs
+++ b/rust/syn/gen/hash.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 // This file is @generated by syn-internal-codegen.
 // It is not intended for manual editing.
 
diff --git a/rust/syn/gen/visit.rs b/rust/syn/gen/visit.rs
index cd258fcde120..a82293c053d6 100644
--- a/rust/syn/gen/visit.rs
+++ b/rust/syn/gen/visit.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 // This file is @generated by syn-internal-codegen.
 // It is not intended for manual editing.
 
diff --git a/rust/syn/gen/visit_mut.rs b/rust/syn/gen/visit_mut.rs
index 2bbd6895db75..08e134b43a92 100644
--- a/rust/syn/gen/visit_mut.rs
+++ b/rust/syn/gen/visit_mut.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 // This file is @generated by syn-internal-codegen.
 // It is not intended for manual editing.
 
diff --git a/rust/syn/generics.rs b/rust/syn/generics.rs
index 0c77193da043..9f8df8a155e1 100644
--- a/rust/syn/generics.rs
+++ b/rust/syn/generics.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use crate::attr::Attribute;
 use crate::expr::Expr;
 use crate::ident::Ident;
diff --git a/rust/syn/group.rs b/rust/syn/group.rs
index 1534ae995dd5..57586c58fd92 100644
--- a/rust/syn/group.rs
+++ b/rust/syn/group.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use crate::error::Result;
 use crate::parse::ParseBuffer;
 use crate::token;
diff --git a/rust/syn/ident.rs b/rust/syn/ident.rs
index 8a8e8a50d9b0..2c4b56505bec 100644
--- a/rust/syn/ident.rs
+++ b/rust/syn/ident.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 #[cfg(feature = "parsing")]
 use crate::lookahead;
 
diff --git a/rust/syn/item.rs b/rust/syn/item.rs
index 1716f5137afb..1ab10cf218a6 100644
--- a/rust/syn/item.rs
+++ b/rust/syn/item.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use crate::attr::Attribute;
 use crate::data::{Fields, FieldsNamed, Variant};
 use crate::derive::{Data, DataEnum, DataStruct, DataUnion, DeriveInput};
diff --git a/rust/syn/lib.rs b/rust/syn/lib.rs
index 79dc9e7c3324..b0006fd30b08 100644
--- a/rust/syn/lib.rs
+++ b/rust/syn/lib.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! [![github]](https://github.com/dtolnay/syn)&ensp;[![crates-io]](https://crates.io/crates/syn)&ensp;[![docs-rs]](crate)
 //!
 //! [github]: https://img.shields.io/badge/github-8da0cb?style=for-the-badge&labelColor=555555&logo=github
diff --git a/rust/syn/lifetime.rs b/rust/syn/lifetime.rs
index cc189d1ac91f..24bec7fe969d 100644
--- a/rust/syn/lifetime.rs
+++ b/rust/syn/lifetime.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 #[cfg(feature = "parsing")]
 use crate::lookahead;
 use proc_macro2::{Ident, Span};
diff --git a/rust/syn/lit.rs b/rust/syn/lit.rs
index 45c26d56fed3..1d2d8bdccfb1 100644
--- a/rust/syn/lit.rs
+++ b/rust/syn/lit.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 #[cfg(feature = "parsing")]
 use crate::lookahead;
 #[cfg(feature = "parsing")]
diff --git a/rust/syn/lookahead.rs b/rust/syn/lookahead.rs
index da13ffc47a7a..a7994cb6ae88 100644
--- a/rust/syn/lookahead.rs
+++ b/rust/syn/lookahead.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use crate::buffer::Cursor;
 use crate::error::{self, Error};
 use crate::sealed::lookahead::Sealed;
diff --git a/rust/syn/mac.rs b/rust/syn/mac.rs
index 15107801cfee..ce4b022b4d14 100644
--- a/rust/syn/mac.rs
+++ b/rust/syn/mac.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 #[cfg(feature = "parsing")]
 use crate::error::Result;
 #[cfg(feature = "parsing")]
diff --git a/rust/syn/macros.rs b/rust/syn/macros.rs
index 167f2cf260a7..8676f6492a9c 100644
--- a/rust/syn/macros.rs
+++ b/rust/syn/macros.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 #[cfg_attr(
     not(any(feature = "full", feature = "derive")),
     allow(unknown_lints, unused_macro_rules)
diff --git a/rust/syn/meta.rs b/rust/syn/meta.rs
index ffeeb2629f4f..2dd138e6dd55 100644
--- a/rust/syn/meta.rs
+++ b/rust/syn/meta.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! Facility for interpreting structured content inside of an `Attribute`.
 
 use crate::error::{Error, Result};
diff --git a/rust/syn/op.rs b/rust/syn/op.rs
index 575d9faa1273..73dada3fae2d 100644
--- a/rust/syn/op.rs
+++ b/rust/syn/op.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 ast_enum! {
     /// A binary operator: `+`, `+=`, `&`.
     #[cfg_attr(docsrs, doc(cfg(any(feature = "full", feature = "derive"))))]
diff --git a/rust/syn/parse.rs b/rust/syn/parse.rs
index 57531005ac4e..c6f6c0eece02 100644
--- a/rust/syn/parse.rs
+++ b/rust/syn/parse.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! Parsing interface for parsing a token stream into a syntax tree node.
 //!
 //! Parsing in Syn is built on parser functions that take in a [`ParseStream`]
diff --git a/rust/syn/parse_macro_input.rs b/rust/syn/parse_macro_input.rs
index f0660aedd7df..2f977754d41c 100644
--- a/rust/syn/parse_macro_input.rs
+++ b/rust/syn/parse_macro_input.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 /// Parse the input TokenStream of a macro, triggering a compile error if the
 /// tokens fail to parse.
 ///
diff --git a/rust/syn/parse_quote.rs b/rust/syn/parse_quote.rs
index 2db20597c436..7cc7b9b8fd75 100644
--- a/rust/syn/parse_quote.rs
+++ b/rust/syn/parse_quote.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 /// Quasi-quotation macro that accepts input like the [`quote!`] macro but uses
 /// type inference to figure out a return type for those tokens.
 ///
diff --git a/rust/syn/pat.rs b/rust/syn/pat.rs
index 81a2f183f6b9..46edd63d5ed8 100644
--- a/rust/syn/pat.rs
+++ b/rust/syn/pat.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use crate::attr::Attribute;
 use crate::expr::Member;
 use crate::ident::Ident;
diff --git a/rust/syn/path.rs b/rust/syn/path.rs
index d2fcb9bc5d28..f2453bea4a3c 100644
--- a/rust/syn/path.rs
+++ b/rust/syn/path.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 #[cfg(feature = "parsing")]
 use crate::error::Result;
 use crate::expr::Expr;
diff --git a/rust/syn/precedence.rs b/rust/syn/precedence.rs
index 1891bfc202fd..cc4dba24a433 100644
--- a/rust/syn/precedence.rs
+++ b/rust/syn/precedence.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 #[cfg(all(feature = "printing", feature = "full"))]
 use crate::attr::{AttrStyle, Attribute};
 #[cfg(feature = "printing")]
diff --git a/rust/syn/print.rs b/rust/syn/print.rs
index 07409932677b..d73262cda060 100644
--- a/rust/syn/print.rs
+++ b/rust/syn/print.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use proc_macro2::TokenStream;
 use quote::ToTokens;
 
diff --git a/rust/syn/punctuated.rs b/rust/syn/punctuated.rs
index ebaaa94f9a26..f79152940db6 100644
--- a/rust/syn/punctuated.rs
+++ b/rust/syn/punctuated.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! A punctuated sequence of syntax tree nodes separated by punctuation.
 //!
 //! Lots of things in Rust are punctuated sequences.
diff --git a/rust/syn/restriction.rs b/rust/syn/restriction.rs
index 6e6758f3cd73..b844f64c3a73 100644
--- a/rust/syn/restriction.rs
+++ b/rust/syn/restriction.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use crate::path::Path;
 use crate::token;
 
diff --git a/rust/syn/scan_expr.rs b/rust/syn/scan_expr.rs
index 3d88cf06acea..a5fd1ddc1501 100644
--- a/rust/syn/scan_expr.rs
+++ b/rust/syn/scan_expr.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use self::{Action::*, Input::*};
 use proc_macro2::{Delimiter, Ident, Spacing, TokenTree};
 use syn::parse::{ParseStream, Result};
diff --git a/rust/syn/sealed.rs b/rust/syn/sealed.rs
index dc804742d12d..541df9623755 100644
--- a/rust/syn/sealed.rs
+++ b/rust/syn/sealed.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 #[cfg(feature = "parsing")]
 pub(crate) mod lookahead {
     pub trait Sealed: Copy {}
diff --git a/rust/syn/span.rs b/rust/syn/span.rs
index eb2779479aaa..e6d55b3ccd03 100644
--- a/rust/syn/span.rs
+++ b/rust/syn/span.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use proc_macro2::extra::DelimSpan;
 use proc_macro2::{Delimiter, Group, Span, TokenStream};
 
diff --git a/rust/syn/spanned.rs b/rust/syn/spanned.rs
index 17b69e9f5b28..fcc93699f742 100644
--- a/rust/syn/spanned.rs
+++ b/rust/syn/spanned.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! A trait that can provide the `Span` of the complete contents of a syntax
 //! tree node.
 //!
diff --git a/rust/syn/stmt.rs b/rust/syn/stmt.rs
index 8ea0077f63df..029171a98dca 100644
--- a/rust/syn/stmt.rs
+++ b/rust/syn/stmt.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use crate::attr::Attribute;
 use crate::expr::Expr;
 use crate::item::Item;
diff --git a/rust/syn/thread.rs b/rust/syn/thread.rs
index b33d248afc60..4165a173d9e1 100644
--- a/rust/syn/thread.rs
+++ b/rust/syn/thread.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use std::fmt::{self, Debug};
 use std::thread::{self, ThreadId};
 
diff --git a/rust/syn/token.rs b/rust/syn/token.rs
index 752c188883cb..18345cc5831a 100644
--- a/rust/syn/token.rs
+++ b/rust/syn/token.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! Tokens representing Rust punctuation, keywords, and delimiters.
 //!
 //! The type names in this module can be difficult to keep straight, so we
diff --git a/rust/syn/tt.rs b/rust/syn/tt.rs
index 7d5d6a1ac326..fc7adec3da90 100644
--- a/rust/syn/tt.rs
+++ b/rust/syn/tt.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use proc_macro2::{Delimiter, TokenStream, TokenTree};
 use std::hash::{Hash, Hasher};
 
diff --git a/rust/syn/ty.rs b/rust/syn/ty.rs
index c093f5877b3c..ae660d2d2e74 100644
--- a/rust/syn/ty.rs
+++ b/rust/syn/ty.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use crate::attr::Attribute;
 use crate::expr::Expr;
 use crate::generics::{BoundLifetimes, TypeParamBound};
diff --git a/rust/syn/verbatim.rs b/rust/syn/verbatim.rs
index 54dc1cfa0d82..97bc08f70afe 100644
--- a/rust/syn/verbatim.rs
+++ b/rust/syn/verbatim.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use crate::parse::ParseStream;
 use proc_macro2::{Delimiter, TokenStream};
 use std::cmp::Ordering;
diff --git a/rust/syn/whitespace.rs b/rust/syn/whitespace.rs
index a50b5069a68b..b7319bd7af18 100644
--- a/rust/syn/whitespace.rs
+++ b/rust/syn/whitespace.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 pub(crate) fn skip(mut s: &str) -> &str {
     'skip: while !s.is_empty() {
         let byte = s.as_bytes()[0];
-- 
2.52.0


