Return-Path: <linux-kbuild+bounces-9482-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CDFC45C16
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 10:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 153E94EC263
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 09:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F83F3019C4;
	Mon, 10 Nov 2025 09:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hMd1xu6H"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045E3301475;
	Mon, 10 Nov 2025 09:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762768310; cv=none; b=s4zWw21sRKioePimplIu5j3dx4I8NKnMKA8je8qPZrozA8qdRssrPGqCIPzpJJHAtz8Xvh4SA+Xp4HXTR2uUAYt+37GF3WH4xFYfIAou3dzbL+ydtXWwxKFJHcG/ZKEztRPNukOgxSkxdOBX79k0zAx7I6Zd0aTArkc4kD0iNHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762768310; c=relaxed/simple;
	bh=a091rDrioPUu1A0A3HzdOiV0DI5hZR3ZfvJMFGOchCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rx/9vyIXLjKRE8mkuIytbjc5WJuEE5ytItPRbCSOZMwS6jB0AoftQd2IJuqIulq7Fnif3tUp3lrRS4Yv9GVBIkamHx2jPTEX/mYeQq9siUIb46IdH+PFx5gqm3LxLp+t3TWQwNfDHIhF4YcA6uBv9d1x0PZFCdnaNiJr1BMRX2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hMd1xu6H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D391EC4CEF5;
	Mon, 10 Nov 2025 09:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762768307;
	bh=a091rDrioPUu1A0A3HzdOiV0DI5hZR3ZfvJMFGOchCA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hMd1xu6HZv7RBz35Z+LqL1U+Mlhn4jacVYZK02q+qu7V2XWfyx3JTJPEyu4QoWnPI
	 0cdRGy3nLiHM/cZxeAIKxt5jRGX6ZyD6VFcK010W386inY7qKbrJLljWUV0N1z19x6
	 ubPRGfwF9Ya3klej2MaF8fjGbZlt1hbpy8AtKUp1ocCHA+iWyNIky6bYS3ibmk9v0j
	 b+HhUoWsuU3G64GtsQKyavFp/5GXCNaPIM8a8u1Tq3gRVEi9ee7wKHh07Q7eeouI32
	 b3A2N/SYPNNeUQBEe2QYAN0n5JUrSbY/ferHiWg2Hu6xLgRlHCA+WG4/hZB9OMDXOh
	 AvRDyVwU2AT+g==
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
Subject: [PATCH 11/18] rust: quote: add SPDX License Identifiers
Date: Mon, 10 Nov 2025 10:50:16 +0100
Message-ID: <20251110095025.1475896-12-ojeda@kernel.org>
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

Thus do the same for the `quote` crate.

This makes `scripts/spdxcheck.py` pass.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/quote/ext.rs            | 2 ++
 rust/quote/format.rs         | 2 ++
 rust/quote/ident_fragment.rs | 2 ++
 rust/quote/lib.rs            | 2 ++
 rust/quote/runtime.rs        | 2 ++
 rust/quote/spanned.rs        | 2 ++
 rust/quote/to_tokens.rs      | 2 ++
 7 files changed, 14 insertions(+)

diff --git a/rust/quote/ext.rs b/rust/quote/ext.rs
index 92c2315b182d..977d2f0c5919 100644
--- a/rust/quote/ext.rs
+++ b/rust/quote/ext.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use super::ToTokens;
 use core::iter;
 use proc_macro2::{TokenStream, TokenTree};
diff --git a/rust/quote/format.rs b/rust/quote/format.rs
index ec0bbf38ba37..6e3d55b6e427 100644
--- a/rust/quote/format.rs
+++ b/rust/quote/format.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 /// Formatting macro for constructing `Ident`s.
 ///
 /// <br>
diff --git a/rust/quote/ident_fragment.rs b/rust/quote/ident_fragment.rs
index 6c2a9a87acb4..d98106f17666 100644
--- a/rust/quote/ident_fragment.rs
+++ b/rust/quote/ident_fragment.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use alloc::borrow::Cow;
 use core::fmt;
 use proc_macro2::{Ident, Span};
diff --git a/rust/quote/lib.rs b/rust/quote/lib.rs
index 0a12d607f279..cc1637660a75 100644
--- a/rust/quote/lib.rs
+++ b/rust/quote/lib.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 //! [![github]](https://github.com/dtolnay/quote)&ensp;[![crates-io]](https://crates.io/crates/quote)&ensp;[![docs-rs]](https://docs.rs/quote)
 //!
 //! [github]: https://img.shields.io/badge/github-8da0cb?style=for-the-badge&labelColor=555555&logo=github
diff --git a/rust/quote/runtime.rs b/rust/quote/runtime.rs
index c704ca89411f..09a94f5dd4fe 100644
--- a/rust/quote/runtime.rs
+++ b/rust/quote/runtime.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use self::get_span::{GetSpan, GetSpanBase, GetSpanInner};
 use crate::{IdentFragment, ToTokens, TokenStreamExt};
 use core::fmt;
diff --git a/rust/quote/spanned.rs b/rust/quote/spanned.rs
index 6eba64445d89..54ce9177f45e 100644
--- a/rust/quote/spanned.rs
+++ b/rust/quote/spanned.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use crate::ToTokens;
 use proc_macro2::extra::DelimSpan;
 use proc_macro2::{Span, TokenStream};
diff --git a/rust/quote/to_tokens.rs b/rust/quote/to_tokens.rs
index f373092b650f..1af1089e1423 100644
--- a/rust/quote/to_tokens.rs
+++ b/rust/quote/to_tokens.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
 use super::TokenStreamExt;
 use alloc::borrow::Cow;
 use alloc::rc::Rc;
-- 
2.51.2


