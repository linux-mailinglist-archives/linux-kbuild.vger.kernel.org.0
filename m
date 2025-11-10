Return-Path: <linux-kbuild+bounces-9477-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DADC45BEA
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 10:53:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B1D284EA68E
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 09:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87BD4301037;
	Mon, 10 Nov 2025 09:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J9+mX7mZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B3C301025;
	Mon, 10 Nov 2025 09:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762768286; cv=none; b=G8WtmLHtmqIG9mdfnJlTIr4LzIBpr1CkFUPHxNLsQ1b+E29aTM/lWaLQKpmj5Gg9MHtIh14ruK+SzUqOElJbfm7iATkUXEIFvQ0FLc0blL/H0CNIlOYX90B+0cgxr3YNJBkBsAyYipY/U4nPnh65llybLNdhyEeNDtKeN4RoVzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762768286; c=relaxed/simple;
	bh=lw/+uvThnriU44LMlr1D3JY/NUDrz+SVvNDWtarsKEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mmb5noKZ8OHDUiJ19LQng4DcxMnAsjHlQpirK8MVSeYrR2kjEae6isZY61rKH975k9cZM0664+VK8dR1JW2YUL2fgjb0CflSyDSdQhE81Vj+obB0xMDGG2SeYbFpk+QAFjUEkKqKWi31mntsSfFMefD6jNPs+vFiMc+xyvZTAuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J9+mX7mZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0720EC116B1;
	Mon, 10 Nov 2025 09:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762768285;
	bh=lw/+uvThnriU44LMlr1D3JY/NUDrz+SVvNDWtarsKEw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J9+mX7mZnIvt5XQFmVDCDJEz8qaPASFWGq3pFdnYGoS4R4Iyhkcbu37mZXhmyl5vv
	 Ji8B5d1xxI8LJFx5IhyZfrUo2hpURVKPiSRopfBma5ArVh1kOFC1LecHc5vWoVOrLI
	 OLvQGcLqiPSRpdQy5m0swAxZ9VryddrkFZFYAAWiw8FhQ9ASh7MtSSsYhE9F248u0r
	 kI8z+UkvuxQ78IfPaRROnyDIPiNIFtnmebnTymA9Offye5HpRvUCo9/LlAD3anCjnZ
	 4KgkN404PXh7/mz8J9Zy4Cm65L+9PHNqbvLXaW5lmXu79PROaDqyfFwORMlqTQoy3Q
	 0P0B2nYinX/Uw==
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
Subject: [PATCH 06/18] rust: proc-macro2: add SPDX License Identifiers
Date: Mon, 10 Nov 2025 10:50:11 +0100
Message-ID: <20251110095025.1475896-7-ojeda@kernel.org>
In-Reply-To: <20251110095025.1475896-1-ojeda@kernel.org>
References: <20251110095025.1475896-1-ojeda@kernel.org>
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
2.51.2


