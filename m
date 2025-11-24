Return-Path: <linux-kbuild+bounces-9809-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D6EC814C2
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 16:21:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5012F347C08
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 15:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48650314D3A;
	Mon, 24 Nov 2025 15:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="suMwj0PS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180F8313E3A;
	Mon, 24 Nov 2025 15:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763997570; cv=none; b=N4xnb+O26h0Tb0Zoe0l80fUalvxsrLLkCwXt5nExcuNY7k85Km/oxeQoL/0ktPpD61ND9cGlryH2qhNp23MFWD/eB2MN75/uu/GWSr5kBMlpHUcQqsMOqlneElQqR2tjsbSgCfe6f7d1d+dW+YNefRX292g1z3l0tYH8Xmznto0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763997570; c=relaxed/simple;
	bh=2eCN8ceP2/4PN0nBj+y8o269rR90z5C7yVZUfrjfyU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LL2+H73HcFARTrOKD9bOw8iMfIuyCP6IqQZ49e13y1MoPEOW2n/UWfUzxAlOlmTIDl1+HTAGpybB0LV0RUb5QHpFL0BUu4LY8pItddQms3s4xOXDg2aUkBq5K7fNmKxDG0jrUyOQed7Pv+IVBDwBdzgvvAxKOtQIZG+LF1oiUyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=suMwj0PS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CF31C116C6;
	Mon, 24 Nov 2025 15:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763997569;
	bh=2eCN8ceP2/4PN0nBj+y8o269rR90z5C7yVZUfrjfyU8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=suMwj0PSxVMoyT8OA0JXcywHCq8GfvPlgfFub9K67yyK2pXTqkFwITvTmQaKwc+XW
	 oVPi3t6Pbo8QLpBZLtAb+uCmQkb6h0laz/3FkzHR4hu8CsmtsGTYa1wa96kaJpSrfj
	 1+IjyTy0ojWFKmC3IyuKU7ruHM7kZqWGpJl0Oi1L0RpyScb9TRvCILmisNv5NsirmO
	 ftmKLNX/MDCk9P004SBlKUD/upnOufr6dXWXc4IegB6cKBt2IGGuG6zga9hYaPAEE+
	 OlarJUXf97jtVa+lR5o6HEKMd96c4/TsJKdAfreg3Qx9reTi3hR6DB2BKm4flB5Nxi
	 lS/a2weLnWf+Q==
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
Subject: [PATCH v2 07/20] rust: proc-macro2: add SPDX License Identifiers
Date: Mon, 24 Nov 2025 16:18:19 +0100
Message-ID: <20251124151837.2184382-8-ojeda@kernel.org>
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

Thus do the same for the `proc-macro2` crate.

This makes `scripts/spdxcheck.py` pass.

Reviewed-by: Gary Guo <gary@garyguo.net>
Tested-by: Gary Guo <gary@garyguo.net>
Tested-by: Jesung Yang <y.j3ms.n@gmail.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/proc-macro2/detection.rs                      | 2 ++
 rust/proc-macro2/extra.rs                          | 2 ++
 rust/proc-macro2/fallback.rs                       | 2 ++
 rust/proc-macro2/lib.rs                            | 2 ++
 rust/proc-macro2/location.rs                       | 2 ++
 rust/proc-macro2/marker.rs                         | 2 ++
 rust/proc-macro2/parse.rs                          | 2 ++
 rust/proc-macro2/probe.rs                          | 2 ++
 rust/proc-macro2/probe/proc_macro_span.rs          | 2 ++
 rust/proc-macro2/probe/proc_macro_span_file.rs     | 2 ++
 rust/proc-macro2/probe/proc_macro_span_location.rs | 2 ++
 rust/proc-macro2/rcvec.rs                          | 2 ++
 rust/proc-macro2/wrapper.rs                        | 2 ++
 13 files changed, 26 insertions(+)

diff --git a/rust/proc-macro2/detection.rs b/rust/proc-macro2/detection.rs
index beba7b237395..3de448cb2dde 100644
--- a/rust/proc-macro2/detection.rs
+++ b/rust/proc-macro2/detection.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use core::sync::atomic::{AtomicUsize, Ordering};
 use std::sync::Once;
 
diff --git a/rust/proc-macro2/extra.rs b/rust/proc-macro2/extra.rs
index 522a90e136be..55feb5ec7526 100644
--- a/rust/proc-macro2/extra.rs
+++ b/rust/proc-macro2/extra.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! Items which do not have a correspondence to any API in the proc_macro crate,
 //! but are necessary to include in proc-macro2.
 
diff --git a/rust/proc-macro2/fallback.rs b/rust/proc-macro2/fallback.rs
index 1560105cfd25..9e005d67f7f5 100644
--- a/rust/proc-macro2/fallback.rs
+++ b/rust/proc-macro2/fallback.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 #[cfg(wrap_proc_macro)]
 use crate::imp;
 #[cfg(span_locations)]
diff --git a/rust/proc-macro2/lib.rs b/rust/proc-macro2/lib.rs
index 2984af335adc..7b78d065d51c 100644
--- a/rust/proc-macro2/lib.rs
+++ b/rust/proc-macro2/lib.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! [![github]](https://github.com/dtolnay/proc-macro2)&ensp;[![crates-io]](https://crates.io/crates/proc-macro2)&ensp;[![docs-rs]](crate)
 //!
 //! [github]: https://img.shields.io/badge/github-8da0cb?style=for-the-badge&labelColor=555555&logo=github
diff --git a/rust/proc-macro2/location.rs b/rust/proc-macro2/location.rs
index 7190e2d05255..3a11871e2943 100644
--- a/rust/proc-macro2/location.rs
+++ b/rust/proc-macro2/location.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use core::cmp::Ordering;
 
 /// A line-column pair representing the start or end of a `Span`.
diff --git a/rust/proc-macro2/marker.rs b/rust/proc-macro2/marker.rs
index 23b94ce6fa85..6f322424808c 100644
--- a/rust/proc-macro2/marker.rs
+++ b/rust/proc-macro2/marker.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use alloc::rc::Rc;
 use core::marker::PhantomData;
 use core::panic::{RefUnwindSafe, UnwindSafe};
diff --git a/rust/proc-macro2/parse.rs b/rust/proc-macro2/parse.rs
index b8be403f842f..a005dea1fe88 100644
--- a/rust/proc-macro2/parse.rs
+++ b/rust/proc-macro2/parse.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use crate::fallback::{
     self, is_ident_continue, is_ident_start, Group, Ident, LexError, Literal, Span, TokenStream,
     TokenStreamBuilder,
diff --git a/rust/proc-macro2/probe.rs b/rust/proc-macro2/probe.rs
index b67f52036218..d68aa8cfd85e 100644
--- a/rust/proc-macro2/probe.rs
+++ b/rust/proc-macro2/probe.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 #![allow(dead_code)]
 
 #[cfg(proc_macro_span)]
diff --git a/rust/proc-macro2/probe/proc_macro_span.rs b/rust/proc-macro2/probe/proc_macro_span.rs
index 2d7d44e07708..892a7eb3e5a0 100644
--- a/rust/proc-macro2/probe/proc_macro_span.rs
+++ b/rust/proc-macro2/probe/proc_macro_span.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 // This code exercises the surface area that we expect of Span's unstable API.
 // If the current toolchain is able to compile it, then proc-macro2 is able to
 // offer these APIs too.
diff --git a/rust/proc-macro2/probe/proc_macro_span_file.rs b/rust/proc-macro2/probe/proc_macro_span_file.rs
index 8b76bdf5007b..f2dbc4056ebe 100644
--- a/rust/proc-macro2/probe/proc_macro_span_file.rs
+++ b/rust/proc-macro2/probe/proc_macro_span_file.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 // The subset of Span's API stabilized in Rust 1.88.
 
 extern crate proc_macro;
diff --git a/rust/proc-macro2/probe/proc_macro_span_location.rs b/rust/proc-macro2/probe/proc_macro_span_location.rs
index 79da34af54af..ae19c93394fa 100644
--- a/rust/proc-macro2/probe/proc_macro_span_location.rs
+++ b/rust/proc-macro2/probe/proc_macro_span_location.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 // The subset of Span's API stabilized in Rust 1.88.
 
 extern crate proc_macro;
diff --git a/rust/proc-macro2/rcvec.rs b/rust/proc-macro2/rcvec.rs
index 23edc77d597f..e224ebe277ef 100644
--- a/rust/proc-macro2/rcvec.rs
+++ b/rust/proc-macro2/rcvec.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use alloc::rc::Rc;
 use alloc::vec;
 use core::mem;
diff --git a/rust/proc-macro2/wrapper.rs b/rust/proc-macro2/wrapper.rs
index 2e3eb5b4d04e..6792e9834111 100644
--- a/rust/proc-macro2/wrapper.rs
+++ b/rust/proc-macro2/wrapper.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use crate::detection::inside_proc_macro;
 use crate::fallback::{self, FromStr2 as _};
 #[cfg(span_locations)]
-- 
2.52.0


