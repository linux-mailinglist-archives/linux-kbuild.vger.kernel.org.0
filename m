Return-Path: <linux-kbuild+bounces-13513-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mbLuCvwTH2qVfAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13513-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 19:33:48 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C38630BEF
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 19:33:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=TaoUM4cP;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13513-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13513-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2DD063045B26
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jun 2026 17:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944A63FA5FC;
	Tue,  2 Jun 2026 17:30:24 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72113655DB;
	Tue,  2 Jun 2026 17:30:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780421424; cv=none; b=lL42vtSiUlbEXjTYPdGaLutKT5lHspksZMtBgVugqG5PLymFkXB0hhjfRyBQ1VesHErR+MQ9PGlxqH5ubxSFKsyMOdHzLgW+5bhqsauLx0kHAd0oAvQrW2uxKVlp5uEr7ClbJj+M1rIAV2PIy3qHGdBNfJAZL4CEQAlAYqoQb9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780421424; c=relaxed/simple;
	bh=qUttJ4CY2w9yvfiLoXiOC5ca607p123aWW6zAjASbsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U5XEywH7PSOcEFk8uzdhrP3KHu50u2nK2VxcPpLZu0JmVuP1SwlT1oIe9uml2svjpAeMmtqU60M/9VM0WzmluHjLZkKbUKLbSHNuU8w720AHvvxReJ4MnLy7ORpp+fgJqG9ZPZ4w4DDeowF/nJBg2z1sx4KV8ZARjZTMTl0s+c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TaoUM4cP; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D36381F0089B;
	Tue,  2 Jun 2026 17:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780421420;
	bh=2eU+nJr/cmzE4x0PPcYWH+JhPlVdUcl8Zt/O98CSawk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TaoUM4cPyIRSGQ8iX4aQUY5OfTn+ks754eg5vXVlvp+TRZGCt9D7SMmi4HcTC1PsI
	 X68vIFRipYgWJLAVpYIP1cbQylyEJxOoyTRiGffb5aRPhXI079cshE6NTqnevJqv2a
	 WuFWpjLviV5juUW/Ud3RcCQR3BL8qkD/MJBpIQIHSyTGzIn35DIQFaBjKDzd5uAqCf
	 7lxCQmGzfM+fm7khNjqAM2rr78sepooj3gs+hz1QCpWedJFlDtc0Xnob0bfSIjpxuv
	 K0O+7F8F56U+yEF9BYL55UakXBs4MuqDaO4ARpgQHjVyoRLqk7hhDL4ico4GbdarEI
	 wokPpeA65HsJA==
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
Subject: [PATCH 09/18] rust: zerocopy: add SPDX License Identifiers
Date: Tue,  2 Jun 2026 19:29:10 +0200
Message-ID: <20260602172920.30342-10-ojeda@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,amazon.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13513-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,spdxcheck.py:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B4C38630BEF

Originally, when the Rust upstream `alloc` standard library crate was
vendored, the SPDX License Identifiers were added to every file so that
the license on those was clear. The same happened with the vendoring of
`proc_macro2`, `quote` and `syn`. Please see:

  commit 057b8d257107 ("rust: adapt `alloc` crate to the kernel")
  commit 69942c0a8965 ("rust: syn: add SPDX License Identifiers")
  commit ddfa1b279d08 ("rust: quote: add SPDX License Identifiers")
  commit a9acfceb9614 ("rust: proc-macro2: add SPDX License Identifiers")

Thus do the same for the `zerocopy` crate.

This makes `scripts/spdxcheck.py` pass: use parentheses like commit
06e9bfc1e57d ("ionic: make spdxcheck.py happy") did since we have two
`OR` operators in the expression (three licenses).

SPDX identifiers are not added to the `benches` files because they are
included in rendered documentation. Nevertheless, the `README.md` to be
added by a later commit mentions the license.

Cc: Joshua Liebow-Feeser <joshlf@google.com>
Cc: Jack Wrenn <jswrenn@amazon.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/zerocopy/rustdoc/style.css        | 2 ++
 rust/zerocopy/src/byte_slice.rs        | 2 ++
 rust/zerocopy/src/byteorder.rs         | 2 ++
 rust/zerocopy/src/deprecated.rs        | 2 ++
 rust/zerocopy/src/error.rs             | 2 ++
 rust/zerocopy/src/impls.rs             | 2 ++
 rust/zerocopy/src/layout.rs            | 2 ++
 rust/zerocopy/src/lib.rs               | 2 ++
 rust/zerocopy/src/macros.rs            | 2 ++
 rust/zerocopy/src/pointer/inner.rs     | 2 ++
 rust/zerocopy/src/pointer/invariant.rs | 2 ++
 rust/zerocopy/src/pointer/mod.rs       | 2 ++
 rust/zerocopy/src/pointer/ptr.rs       | 2 ++
 rust/zerocopy/src/pointer/transmute.rs | 2 ++
 rust/zerocopy/src/ref.rs               | 2 ++
 rust/zerocopy/src/split_at.rs          | 2 ++
 rust/zerocopy/src/util/macro_util.rs   | 2 ++
 rust/zerocopy/src/util/macros.rs       | 2 ++
 rust/zerocopy/src/util/mod.rs          | 2 ++
 rust/zerocopy/src/wrappers.rs          | 2 ++
 20 files changed, 40 insertions(+)

diff --git a/rust/zerocopy/rustdoc/style.css b/rust/zerocopy/rustdoc/style.css
index c5c8aeb743a1..414348964af2 100644
--- a/rust/zerocopy/rustdoc/style.css
+++ b/rust/zerocopy/rustdoc/style.css
@@ -1,3 +1,5 @@
+/* SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT */
+
 /*
 Copyright 2026 The Fuchsia Authors
 
diff --git a/rust/zerocopy/src/byte_slice.rs b/rust/zerocopy/src/byte_slice.rs
index 6f9ee9ac3336..a5ded4a18b39 100644
--- a/rust/zerocopy/src/byte_slice.rs
+++ b/rust/zerocopy/src/byte_slice.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2024 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
diff --git a/rust/zerocopy/src/byteorder.rs b/rust/zerocopy/src/byteorder.rs
index 257505203415..36ca4c0c88b0 100644
--- a/rust/zerocopy/src/byteorder.rs
+++ b/rust/zerocopy/src/byteorder.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2019 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
diff --git a/rust/zerocopy/src/deprecated.rs b/rust/zerocopy/src/deprecated.rs
index 61b29aa5f485..24bafbf9adeb 100644
--- a/rust/zerocopy/src/deprecated.rs
+++ b/rust/zerocopy/src/deprecated.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2024 The Fuchsia Authors
 //
 // Licensed under the 2-Clause BSD License <LICENSE-BSD or
diff --git a/rust/zerocopy/src/error.rs b/rust/zerocopy/src/error.rs
index 05fdfe3b91f8..7cb08c31d452 100644
--- a/rust/zerocopy/src/error.rs
+++ b/rust/zerocopy/src/error.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2024 The Fuchsia Authors
 //
 // Licensed under the 2-Clause BSD License <LICENSE-BSD or
diff --git a/rust/zerocopy/src/impls.rs b/rust/zerocopy/src/impls.rs
index 80538bfc8a26..22fd6c3d5d94 100644
--- a/rust/zerocopy/src/impls.rs
+++ b/rust/zerocopy/src/impls.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2024 The Fuchsia Authors
 //
 // Licensed under the 2-Clause BSD License <LICENSE-BSD or
diff --git a/rust/zerocopy/src/layout.rs b/rust/zerocopy/src/layout.rs
index 19ad5ca85f74..6015d0f2de52 100644
--- a/rust/zerocopy/src/layout.rs
+++ b/rust/zerocopy/src/layout.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2024 The Fuchsia Authors
 //
 // Licensed under the 2-Clause BSD License <LICENSE-BSD or
diff --git a/rust/zerocopy/src/lib.rs b/rust/zerocopy/src/lib.rs
index 89a696f732b8..3302d67602ab 100644
--- a/rust/zerocopy/src/lib.rs
+++ b/rust/zerocopy/src/lib.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2018 The Fuchsia Authors
 //
 // Licensed under the 2-Clause BSD License <LICENSE-BSD or
diff --git a/rust/zerocopy/src/macros.rs b/rust/zerocopy/src/macros.rs
index 948f8f912bb7..b801d86a8fa6 100644
--- a/rust/zerocopy/src/macros.rs
+++ b/rust/zerocopy/src/macros.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2024 The Fuchsia Authors
 //
 // Licensed under the 2-Clause BSD License <LICENSE-BSD or
diff --git a/rust/zerocopy/src/pointer/inner.rs b/rust/zerocopy/src/pointer/inner.rs
index c8dd9f01f456..5db08080141f 100644
--- a/rust/zerocopy/src/pointer/inner.rs
+++ b/rust/zerocopy/src/pointer/inner.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2024 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
diff --git a/rust/zerocopy/src/pointer/invariant.rs b/rust/zerocopy/src/pointer/invariant.rs
index 2af211dd9fdd..1802d23563db 100644
--- a/rust/zerocopy/src/pointer/invariant.rs
+++ b/rust/zerocopy/src/pointer/invariant.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2024 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
diff --git a/rust/zerocopy/src/pointer/mod.rs b/rust/zerocopy/src/pointer/mod.rs
index 4c3658679d46..3461f7f5ca80 100644
--- a/rust/zerocopy/src/pointer/mod.rs
+++ b/rust/zerocopy/src/pointer/mod.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2023 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
diff --git a/rust/zerocopy/src/pointer/ptr.rs b/rust/zerocopy/src/pointer/ptr.rs
index 307b2aee63ca..b7c4ea56d2b2 100644
--- a/rust/zerocopy/src/pointer/ptr.rs
+++ b/rust/zerocopy/src/pointer/ptr.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2023 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
diff --git a/rust/zerocopy/src/pointer/transmute.rs b/rust/zerocopy/src/pointer/transmute.rs
index 45b4f727fd0d..a534984b70d3 100644
--- a/rust/zerocopy/src/pointer/transmute.rs
+++ b/rust/zerocopy/src/pointer/transmute.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2025 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
diff --git a/rust/zerocopy/src/ref.rs b/rust/zerocopy/src/ref.rs
index 496afc435c61..860066d75196 100644
--- a/rust/zerocopy/src/ref.rs
+++ b/rust/zerocopy/src/ref.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2024 The Fuchsia Authors
 //
 // Licensed under the 2-Clause BSD License <LICENSE-BSD or
diff --git a/rust/zerocopy/src/split_at.rs b/rust/zerocopy/src/split_at.rs
index 1d7b2c7d6032..9a67d5acbb0d 100644
--- a/rust/zerocopy/src/split_at.rs
+++ b/rust/zerocopy/src/split_at.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2025 The Fuchsia Authors
 //
 // Licensed under the 2-Clause BSD License <LICENSE-BSD or
diff --git a/rust/zerocopy/src/util/macro_util.rs b/rust/zerocopy/src/util/macro_util.rs
index 2235d0b8b49a..1abb0fbeb46e 100644
--- a/rust/zerocopy/src/util/macro_util.rs
+++ b/rust/zerocopy/src/util/macro_util.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2022 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
diff --git a/rust/zerocopy/src/util/macros.rs b/rust/zerocopy/src/util/macros.rs
index 7dca5410c84f..43e4fd64ee15 100644
--- a/rust/zerocopy/src/util/macros.rs
+++ b/rust/zerocopy/src/util/macros.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2023 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
diff --git a/rust/zerocopy/src/util/mod.rs b/rust/zerocopy/src/util/mod.rs
index 1a6c0b22a47b..d6d4c6c2fcd9 100644
--- a/rust/zerocopy/src/util/mod.rs
+++ b/rust/zerocopy/src/util/mod.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2023 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
diff --git a/rust/zerocopy/src/wrappers.rs b/rust/zerocopy/src/wrappers.rs
index f3930eb7ebc0..266aec25fa58 100644
--- a/rust/zerocopy/src/wrappers.rs
+++ b/rust/zerocopy/src/wrappers.rs
@@ -1,3 +1,5 @@
+// SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
+
 // Copyright 2023 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
-- 
2.54.0


