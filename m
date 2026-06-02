Return-Path: <linux-kbuild+bounces-13517-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ATwvHRsUH2qafAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13517-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 19:34:19 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2D1630BFA
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 19:34:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Jp3r5Vi9;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13517-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13517-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9E3AD30610D4
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jun 2026 17:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580A73BB668;
	Tue,  2 Jun 2026 17:30:42 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA91F37104A;
	Tue,  2 Jun 2026 17:30:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780421442; cv=none; b=EttuuD8HJccjVZr/CvP54R50bEIfdTtZbNC2opHx3cqCw4XHzcIdNIR1SB+UHRf5IUErEY9ytFOiu+Lc64iF+ul0COaEWEynCxrKQTcxopThWDxZOukM2xX7XbIijdBG1vq1btd/AWKgFXz9/KE2fbYCt4MdXFtiHc+bSC+zTOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780421442; c=relaxed/simple;
	bh=cmjeuWNn9f3SccDQB0f8pTCSw4L09ZLwNWuS9nwOsD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s0q9mb2QLlf+R1LHtZfrzBQhnAKfpJb3Ny74rTB6EmoCIx7fCDrraW9zzYw3xBJjR6BETq9ytgfWeUyHLq2YUcIWyfZO8n1wRVYCeRS9ZCgZPJ8InQ39xyzKUm75MFnf/ynpKQcX3ZA+v/Bg2GIh/xER1QSeZSs10iXCHz0UzdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jp3r5Vi9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 194281F00898;
	Tue,  2 Jun 2026 17:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780421439;
	bh=7E1IqLvuxjvA6RVBUiEVKsy9wveKCVfeMz5CZt4zdk8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Jp3r5Vi9bNlletZ6r8tCnwzpD8qRw4PcYo9Dmzd1HNUC+C3U9hpBXBXvsEbOVNE/f
	 aS2N6ZfLoAhNTL0N8HFgMtx3rGorRHPUsQH2Nz6E5xJjUnaGzplmBBbRPBYDyloZ3f
	 SxSTWNh45oWO3C2i7ABjqdAxPLWrXPcGL6yqz/Zb+sCUJtjDDnWzsJQmCSxnTeHHH3
	 Wg9elrYe/9w2Nnzdt7mg3in4gY/tavb0Z7jIkJfHaxbE75c8DfOP1AKWh0kpppNG18
	 1tUzCVZnRap2jwaw9+URQhn6AN9Dy3dVf29eRT/HY3DgFBXOkgGmzUxW6DJuRxQg1l
	 goMZ8H98IsEJA==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Joshua Liebow-Feeser <joshlf@google.com>,
	Jack Wrenn <jswrenn@amazon.com>
Subject: [PATCH 14/18] rust: zerocopy-derive: add SPDX License Identifiers
Date: Tue,  2 Jun 2026 19:29:15 +0200
Message-ID: <20260602172920.30342-15-ojeda@kernel.org>
In-Reply-To: <20260602172920.30342-1-ojeda@kernel.org>
References: <20260602172920.30342-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,amazon.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13517-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:joshlf@google.com,m:jswrenn@amazon.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ojeda@kernel.org,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ojeda@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,spdxcheck.py:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A2D1630BFA

Originally, when the Rust upstream `alloc` standard library crate was
vendored, the SPDX License Identifiers were added to every file so that
the license on those was clear. The same happened with the vendoring of
`proc_macro2`, `quote` and `syn`. Please see:

  commit 057b8d257107 ("rust: adapt `alloc` crate to the kernel")
  commit 69942c0a8965 ("rust: syn: add SPDX License Identifiers")
  commit ddfa1b279d08 ("rust: quote: add SPDX License Identifiers")
  commit a9acfceb9614 ("rust: proc-macro2: add SPDX License Identifiers")

Thus do the same for the `zerocopy-derive` crate.

This makes `scripts/spdxcheck.py` pass: use parentheses like commit
06e9bfc1e57d ("ionic: make spdxcheck.py happy") did since we have two
`OR` operators in the expression (three licenses).

Cc: Joshua Liebow-Feeser <joshlf@google.com>
Cc: Jack Wrenn <jswrenn@amazon.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/zerocopy-derive/derive/from_bytes.rs     | 2 ++
 rust/zerocopy-derive/derive/into_bytes.rs     | 2 ++
 rust/zerocopy-derive/derive/known_layout.rs   | 2 ++
 rust/zerocopy-derive/derive/mod.rs            | 2 ++
 rust/zerocopy-derive/derive/try_from_bytes.rs | 2 ++
 rust/zerocopy-derive/derive/unaligned.rs      | 2 ++
 rust/zerocopy-derive/lib.rs                   | 2 ++
 rust/zerocopy-derive/repr.rs                  | 2 ++
 rust/zerocopy-derive/util.rs                  | 2 ++
 9 files changed, 18 insertions(+)

diff --git a/rust/zerocopy-derive/derive/from_bytes.rs b/rust/zerocopy-derive/derive/from_bytes.rs
index ad8b6233fe54..d693a63b7645 100644
--- a/rust/zerocopy-derive/derive/from_bytes.rs
+++ b/rust/zerocopy-derive/derive/from_bytes.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 use proc_macro2::{Span, TokenStream};
 use syn::{
     parse_quote, Data, DataEnum, DataStruct, DataUnion, Error, Expr, ExprLit, ExprUnary, Lit, UnOp,
diff --git a/rust/zerocopy-derive/derive/into_bytes.rs b/rust/zerocopy-derive/derive/into_bytes.rs
index 8c1e1009dd91..ad52a6b45d28 100644
--- a/rust/zerocopy-derive/derive/into_bytes.rs
+++ b/rust/zerocopy-derive/derive/into_bytes.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 use proc_macro2::{Span, TokenStream};
 use quote::quote;
 use syn::{Data, DataEnum, DataStruct, DataUnion, Error, Type};
diff --git a/rust/zerocopy-derive/derive/known_layout.rs b/rust/zerocopy-derive/derive/known_layout.rs
index b91b4de0098c..fddffd167c82 100644
--- a/rust/zerocopy-derive/derive/known_layout.rs
+++ b/rust/zerocopy-derive/derive/known_layout.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 use proc_macro2::TokenStream;
 use quote::quote;
 use syn::{parse_quote, Data, Error, Type};
diff --git a/rust/zerocopy-derive/derive/mod.rs b/rust/zerocopy-derive/derive/mod.rs
index a3d066ed2b4d..665ba7da55a8 100644
--- a/rust/zerocopy-derive/derive/mod.rs
+++ b/rust/zerocopy-derive/derive/mod.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 pub mod from_bytes;
 pub mod into_bytes;
 pub mod known_layout;
diff --git a/rust/zerocopy-derive/derive/try_from_bytes.rs b/rust/zerocopy-derive/derive/try_from_bytes.rs
index 4e36ab40bcf8..ce9c926d5b8e 100644
--- a/rust/zerocopy-derive/derive/try_from_bytes.rs
+++ b/rust/zerocopy-derive/derive/try_from_bytes.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 use proc_macro2::TokenStream;
 use quote::quote;
 use syn::{
diff --git a/rust/zerocopy-derive/derive/unaligned.rs b/rust/zerocopy-derive/derive/unaligned.rs
index 819d84984a03..d6dea0a11f1e 100644
--- a/rust/zerocopy-derive/derive/unaligned.rs
+++ b/rust/zerocopy-derive/derive/unaligned.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 use proc_macro2::{Span, TokenStream};
 use syn::{Data, DataEnum, DataStruct, DataUnion, Error};
 
diff --git a/rust/zerocopy-derive/lib.rs b/rust/zerocopy-derive/lib.rs
index a1d10a2ada27..c517ea7db1eb 100644
--- a/rust/zerocopy-derive/lib.rs
+++ b/rust/zerocopy-derive/lib.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2019 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
diff --git a/rust/zerocopy-derive/repr.rs b/rust/zerocopy-derive/repr.rs
index 57014b38b2da..74fd376d9fda 100644
--- a/rust/zerocopy-derive/repr.rs
+++ b/rust/zerocopy-derive/repr.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2019 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
diff --git a/rust/zerocopy-derive/util.rs b/rust/zerocopy-derive/util.rs
index 4ec28bf95758..5ba5228e2a44 100644
--- a/rust/zerocopy-derive/util.rs
+++ b/rust/zerocopy-derive/util.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2019 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
-- 
2.54.0


