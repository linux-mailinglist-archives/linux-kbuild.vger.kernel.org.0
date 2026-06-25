Return-Path: <linux-kbuild+bounces-13886-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pNtFNZG3PWq65wgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13886-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jun 2026 01:19:45 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF236C91F9
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jun 2026 01:19:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=a0hwFgqO;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13886-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13886-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D83A3019445
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jun 2026 23:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8BF72D7393;
	Thu, 25 Jun 2026 23:19:41 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCA11F1513;
	Thu, 25 Jun 2026 23:19:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782429581; cv=none; b=s80d3R57+WkMmZyhd3ZjDBSBK23ZpsuJKvrmO36STQJH80AKuUlrR1hgRkwJvNozddwXAJZ6a+Ijy88eOilKCUmBJBBMk8KgQPAQfJMktf3lJTRAI8Yr7yJjtKWU8Bpenma6Q+zV1IJxmzyV0m6WruAevljfnXf5VqmpH9TcDO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782429581; c=relaxed/simple;
	bh=4ZdQF5PaWIAJH2NU4yp5CTGILnX2pt563pzW29Kgrx4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MWvelmkmra1VgZxQ/zsa/YUyPJAITpiNM2ETq+IdeVrC0o+Ib1rIJMx0mlq7Z8VlgZLgx+Rf5dJjnJEa4b7v0EcBvHHuUqFZe6x8uZ+WkvOTcykzrIDnLT9iuQcYQ/10JNC9CYbdfA1QMst8YBdtQN6Uto6bTsuE8+r62bVPHeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a0hwFgqO; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A8DD1F000E9;
	Thu, 25 Jun 2026 23:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782429579;
	bh=oQ54RLDWHFZcxYWugghhJdyNuIy5ideEiGksPNVPvyI=;
	h=From:To:Cc:Subject:Date;
	b=a0hwFgqONo3+KElDgr2HR3jR+tZkLodJP7/Lw4lmws4orpXyt3cBXvoJfERXJSP0G
	 2pTBAavy3SPYQSiArxKG9dw6Fy+CJzgJOedC7Ao7FV2kF0ox8q5VppsS0e4ULLJB3Z
	 U+7hhtyzFu3R4davl5W3ZHwDJfTSVQUeRR6VHYP5MvTthOWCH4n31lPJN4fe6T8pqx
	 ctuEO/AJR7ZqexcthZnZ4Q8vOW3VMpRRbNVbTpCl51oCvMvBtPbjyjWfwJLi/d7u4Q
	 pY5yHuBJag5/bisALFrOTlvZaX6rVyUbLEdCXGCV0NHJhvqOLE1ycgknWUya0Dg966
	 LbAHJeGsv3iHQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
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
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org,
	Jesung Yang <y.j3ms.n@gmail.com>,
	linux-kbuild@vger.kernel.org,
	Joshua Liebow-Feeser <joshlf@google.com>,
	Jack Wrenn <jswrenn@google.com>
Subject: [PATCH] rust: zerocopy: update to v0.8.52
Date: Fri, 26 Jun 2026 01:19:19 +0200
Message-ID: <20260625231919.692444-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13886-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:tamird@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:daniel.almeida@collabora.com,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:rust-for-linux@vger.kernel.org,m:y.j3ms.n@gmail.com,m:linux-kbuild@vger.kernel.org,m:joshlf@google.com,m:jswrenn@google.com,m:yj3msn@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ojeda@kernel.org,linux-kbuild@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,collabora.com,nvidia.com,onurozkan.dev,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ojeda@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,readme.md:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3CF236C91F9

Update our vendored copy of `zerocopy` (and `zerocopy-derive`) to v0.8.52.

Most SPDX identifiers have been added upstream at our request [1]
(without parentheses -- supporting them is an issue on the kernel side,
but it does already reduce our differences). The CSS one for `rustdoc`
was added too [2], but will be picked up in a later version.

For `zerocopy`, enable `--cfg no_fp_fmt_parse`, which was added at our
request to avoid our local workaround [3]. This means one less difference,
thus indicate so in our `README.md`.

For `zerocopy-derive`, enable `--cfg zerocopy_unstable_linux`. This
allows us to use `#[derive(zerocopy_derive::most_traits)]`, a new feature
upstream added for us [4]. We noticed a minor doc render bug [5], which
will be fixed for a future version too.

The following script may be used to check for the remaining differences:

    for path in $(cd rust/zerocopy-derive/ && find . -type f ! -name README.md); do
        curl --silent --show-error --location \
            https://github.com/google/zerocopy/raw/v0.8.52/zerocopy/zerocopy-derive/src/$path |
            git diff --no-index - rust/zerocopy-derive/$path &&
            echo $path: OK
    done

    for path in $(cd rust/zerocopy/ && find . -type f ! -name README.md); do
        curl --silent --show-error --location \
            https://github.com/google/zerocopy/raw/v0.8.52/zerocopy/$path |
            git diff --no-index - rust/zerocopy/$path &&
            echo $path: OK
    done

Cc: Joshua Liebow-Feeser <joshlf@google.com>
Cc: Jack Wrenn <jswrenn@google.com>
Link: https://github.com/google/zerocopy/issues/3428 [1]
Link: https://github.com/google/zerocopy/issues/3457 [2]
Link: https://github.com/google/zerocopy/issues/3426 [3]
Link: https://github.com/google/zerocopy/pull/3416 [4]
Link: https://github.com/google/zerocopy/issues/3466 [5]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile                                 | 16 ++++--
 rust/zerocopy-derive/README.md                | 14 +++---
 rust/zerocopy-derive/derive/from_bytes.rs     |  2 +-
 rust/zerocopy-derive/derive/into_bytes.rs     |  2 +-
 rust/zerocopy-derive/derive/known_layout.rs   |  3 +-
 rust/zerocopy-derive/derive/mod.rs            | 20 +++++---
 rust/zerocopy-derive/derive/try_from_bytes.rs |  6 +--
 rust/zerocopy-derive/derive/unaligned.rs      |  2 +-
 rust/zerocopy-derive/lib.rs                   | 36 +++++++++++++-
 rust/zerocopy-derive/repr.rs                  |  2 +-
 rust/zerocopy-derive/util.rs                  | 34 ++++++++++---
 rust/zerocopy/README.md                       | 15 +++---
 rust/zerocopy/src/byte_slice.rs               |  2 +-
 rust/zerocopy/src/byteorder.rs                | 49 +++++++++++++++----
 rust/zerocopy/src/deprecated.rs               |  2 +-
 rust/zerocopy/src/error.rs                    |  2 +-
 rust/zerocopy/src/impls.rs                    |  4 +-
 rust/zerocopy/src/layout.rs                   |  2 +-
 rust/zerocopy/src/lib.rs                      | 13 +++--
 rust/zerocopy/src/macros.rs                   |  2 +-
 rust/zerocopy/src/pointer/inner.rs            |  2 +-
 rust/zerocopy/src/pointer/invariant.rs        |  2 +-
 rust/zerocopy/src/pointer/mod.rs              |  2 +-
 rust/zerocopy/src/pointer/ptr.rs              |  2 +-
 rust/zerocopy/src/pointer/transmute.rs        |  2 +-
 rust/zerocopy/src/ref.rs                      |  2 +-
 rust/zerocopy/src/split_at.rs                 |  2 +-
 rust/zerocopy/src/util/macro_util.rs          |  2 +-
 rust/zerocopy/src/util/macros.rs              |  2 +-
 rust/zerocopy/src/util/mod.rs                 |  2 +-
 rust/zerocopy/src/wrappers.rs                 |  2 +-
 31 files changed, 174 insertions(+), 76 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index a870d1616c71..835cf10e1c0b 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -84,11 +84,15 @@ core-flags := \
     --edition=$(core-edition) \
     $(call cfgs-to-flags,$(core-cfgs))
 
+zerocopy-cfgs := \
+    no_fp_fmt_parse
+
 zerocopy-flags := \
-    --cap-lints=allow
+    --cap-lints=allow \
+    $(call cfgs-to-flags,$(zerocopy-cfgs))
 
 zerocopy-envs := \
-    CARGO_PKG_VERSION=0.8.50
+    CARGO_PKG_VERSION=0.8.52
 
 proc_macro2-cfgs := \
     feature="proc-macro" \
@@ -128,11 +132,15 @@ syn-flags := \
     --extern quote \
     $(call cfgs-to-flags,$(syn-cfgs))
 
+zerocopy_derive-cfgs := \
+    zerocopy_unstable_linux
+
 zerocopy_derive-flags := \
     --cap-lints=allow \
     --extern proc_macro2 \
     --extern quote \
-    --extern syn
+    --extern syn \
+    $(call cfgs-to-flags,$(zerocopy_derive-cfgs))
 
 pin_init_internal-cfgs := \
     kernel USE_RUSTC_FEATURES
@@ -644,9 +652,11 @@ quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L
 rust-analyzer:
 	$(Q)MAKEFLAGS= $(srctree)/scripts/generate_rust_analyzer.py \
 		--cfgs='core=$(core-cfgs)' $(core-edition) \
+		--cfgs='zerocopy=$(zerocopy-cfgs)' \
 		--cfgs='proc_macro2=$(proc_macro2-cfgs)' \
 		--cfgs='quote=$(quote-cfgs)' \
 		--cfgs='syn=$(syn-cfgs)' \
+		--cfgs='zerocopy_derive=$(zerocopy_derive-cfgs)' \
 		--cfgs='pin_init_internal=$(pin_init_internal-cfgs)' \
 		--cfgs='pin_init=$(pin_init-cfgs)' \
 		--envs='zerocopy=$(zerocopy-envs)' \
diff --git a/rust/zerocopy-derive/README.md b/rust/zerocopy-derive/README.md
index 110f4a401778..2a3dcf1212af 100644
--- a/rust/zerocopy-derive/README.md
+++ b/rust/zerocopy-derive/README.md
@@ -1,14 +1,14 @@
 # `zerocopy-derive`
 
-These source files come from the Rust `zerocopy-derive` crate, version v0.8.50
-(released 2026-05-31), hosted in the <https://github.com/google/zerocopy>
+These source files come from the Rust `zerocopy-derive` crate, version v0.8.52
+(released 2026-06-09), hosted in the <https://github.com/google/zerocopy>
 repository, licensed under "BSD-2-Clause OR Apache-2.0 OR MIT" and only
-modified to add the SPDX license identifiers and to remove the generation of
+modified to tweak the SPDX license identifiers and to remove the generation of
 non-ASCII identifiers.
 
 For copyright details, please see:
 
-    https://github.com/google/zerocopy/blob/v0.8.50/README.md?plain=1
-    https://github.com/google/zerocopy/blob/v0.8.50/LICENSE-BSD
-    https://github.com/google/zerocopy/blob/v0.8.50/LICENSE-APACHE
-    https://github.com/google/zerocopy/blob/v0.8.50/LICENSE-MIT
+    https://github.com/google/zerocopy/blob/v0.8.52/README.md?plain=1
+    https://github.com/google/zerocopy/blob/v0.8.52/LICENSE-BSD
+    https://github.com/google/zerocopy/blob/v0.8.52/LICENSE-APACHE
+    https://github.com/google/zerocopy/blob/v0.8.52/LICENSE-MIT
diff --git a/rust/zerocopy-derive/derive/from_bytes.rs b/rust/zerocopy-derive/derive/from_bytes.rs
index d693a63b7645..66d820f6ad4c 100644
--- a/rust/zerocopy-derive/derive/from_bytes.rs
+++ b/rust/zerocopy-derive/derive/from_bytes.rs
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
-
+//
 use proc_macro2::{Span, TokenStream};
 use syn::{
     parse_quote, Data, DataEnum, DataStruct, DataUnion, Error, Expr, ExprLit, ExprUnary, Lit, UnOp,
diff --git a/rust/zerocopy-derive/derive/into_bytes.rs b/rust/zerocopy-derive/derive/into_bytes.rs
index ad52a6b45d28..0103a78d087f 100644
--- a/rust/zerocopy-derive/derive/into_bytes.rs
+++ b/rust/zerocopy-derive/derive/into_bytes.rs
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
-
+//
 use proc_macro2::{Span, TokenStream};
 use quote::quote;
 use syn::{Data, DataEnum, DataStruct, DataUnion, Error, Type};
diff --git a/rust/zerocopy-derive/derive/known_layout.rs b/rust/zerocopy-derive/derive/known_layout.rs
index fddffd167c82..d0c4cecfff15 100644
--- a/rust/zerocopy-derive/derive/known_layout.rs
+++ b/rust/zerocopy-derive/derive/known_layout.rs
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
-
+//
 use proc_macro2::TokenStream;
 use quote::quote;
 use syn::{parse_quote, Data, Error, Type};
@@ -87,7 +87,6 @@ fn pointer_to_metadata(ptr: *mut Self) -> <Self as #zerocopy_crate::KnownLayout>
     };
 
     let inner_extras = {
-        let leading_fields_tys = leading_fields_tys.clone();
         let methods = make_methods(*trailing_field_ty);
         let (_, ty_generics, _) = ctx.ast.generics.split_for_impl();
 
diff --git a/rust/zerocopy-derive/derive/mod.rs b/rust/zerocopy-derive/derive/mod.rs
index 665ba7da55a8..b3839fcf73c9 100644
--- a/rust/zerocopy-derive/derive/mod.rs
+++ b/rust/zerocopy-derive/derive/mod.rs
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
-
+//
 pub mod from_bytes;
 pub mod into_bytes;
 pub mod known_layout;
@@ -15,8 +15,8 @@
     util::{Ctx, DataExt, FieldBounds, ImplBlockBuilder, Trait},
 };
 
-pub(crate) fn derive_immutable(ctx: &Ctx, _top_level: Trait) -> TokenStream {
-    match &ctx.ast.data {
+pub(crate) fn derive_immutable(ctx: &Ctx, _top_level: Trait) -> Result<TokenStream, Error> {
+    Ok(match &ctx.ast.data {
         Data::Struct(strct) => {
             ImplBlockBuilder::new(ctx, strct, Trait::Immutable, FieldBounds::ALL_SELF).build()
         }
@@ -26,7 +26,7 @@ pub(crate) fn derive_immutable(ctx: &Ctx, _top_level: Trait) -> TokenStream {
         Data::Union(unn) => {
             ImplBlockBuilder::new(ctx, unn, Trait::Immutable, FieldBounds::ALL_SELF).build()
         }
-    }
+    })
 }
 
 pub(crate) fn derive_hash(ctx: &Ctx, _top_level: Trait) -> Result<TokenStream, Error> {
@@ -97,16 +97,20 @@ pub(crate) fn derive_split_at(ctx: &Ctx, _top_level: Trait) -> Result<TokenStrea
     match &ctx.ast.data {
         Data::Struct(_) => {}
         Data::Enum(_) | Data::Union(_) => {
-            return Err(Error::new(Span::call_site(), "can only be applied to structs"));
+            return ctx
+                .error_or_skip(Error::new(Span::call_site(), "can only be applied to structs"));
         }
     };
 
     if repr.get_packed().is_some() {
-        return Err(Error::new(Span::call_site(), "must not have #[repr(packed)] attribute"));
+        return ctx.error_or_skip(Error::new(
+            Span::call_site(),
+            "must not have #[repr(packed)] attribute",
+        ));
     }
 
     if !(repr.is_c() || repr.is_transparent()) {
-        return Err(Error::new(
+        return ctx.error_or_skip(Error::new(
             Span::call_site(),
             "must have #[repr(C)] or #[repr(transparent)] in order to guarantee this type's layout is splitable",
         ));
@@ -116,7 +120,7 @@ pub(crate) fn derive_split_at(ctx: &Ctx, _top_level: Trait) -> Result<TokenStrea
     let trailing_field = if let Some(((_, _, trailing_field), _)) = fields.split_last() {
         trailing_field
     } else {
-        return Err(Error::new(Span::call_site(), "must at least one field"));
+        return ctx.error_or_skip(Error::new(Span::call_site(), "must at least one field"));
     };
 
     let zerocopy_crate = &ctx.zerocopy_crate;
diff --git a/rust/zerocopy-derive/derive/try_from_bytes.rs b/rust/zerocopy-derive/derive/try_from_bytes.rs
index a3e4a75631a5..44f083328786 100644
--- a/rust/zerocopy-derive/derive/try_from_bytes.rs
+++ b/rust/zerocopy-derive/derive/try_from_bytes.rs
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
-
+//
 use proc_macro2::TokenStream;
 use quote::quote;
 use syn::{
@@ -531,8 +531,8 @@ fn project(slf: #zerocopy_crate::pointer::PtrInner<'_, Self>) -> *mut <Self as #
                 data,
                 Trait::ProjectField {
                     variant_id: variant_id.clone(),
-                    field: field.clone(),
-                    field_id: field_id.clone(),
+                    field,
+                    field_id,
                     invariants: parse_quote!((Aliasing, Alignment, #zerocopy_crate::invariant::Initialized)),
                 },
                 FieldBounds::None,
diff --git a/rust/zerocopy-derive/derive/unaligned.rs b/rust/zerocopy-derive/derive/unaligned.rs
index d6dea0a11f1e..7c97d62e2dcb 100644
--- a/rust/zerocopy-derive/derive/unaligned.rs
+++ b/rust/zerocopy-derive/derive/unaligned.rs
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
-
+//
 use proc_macro2::{Span, TokenStream};
 use syn::{Data, DataEnum, DataStruct, DataUnion, Error};
 
diff --git a/rust/zerocopy-derive/lib.rs b/rust/zerocopy-derive/lib.rs
index c517ea7db1eb..88599e750894 100644
--- a/rust/zerocopy-derive/lib.rs
+++ b/rust/zerocopy-derive/lib.rs
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
-
+//
 // Copyright 2019 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
@@ -129,6 +129,40 @@ fn into_ts(self) -> proc_macro2::TokenStream {
 derive!(ByteEq => derive_eq => crate::derive::derive_eq);
 derive!(SplitAt => derive_split_at => crate::derive::derive_split_at);
 
+#[cfg_attr(zerocopy_unstable_linux, doc(hidden))]
+#[proc_macro_derive(most_traits, attributes(zerocopy))]
+pub fn most_traits(ts: proc_macro::TokenStream) -> proc_macro::TokenStream {
+    let ast = syn::parse_macro_input!(ts as DeriveInput);
+    let ctx = match Ctx::try_from_derive_input(ast) {
+        Ok(ctx) => ctx,
+        Err(e) => return e.into_compile_error().into(),
+    }
+    .skip_on_error();
+
+    // top-level traits for which to attempt a derive
+    let derives: [(fn(&Ctx, Trait) -> _, _); 6] = [
+        (crate::derive::known_layout::derive, Trait::KnownLayout),
+        (crate::derive::derive_immutable, Trait::Immutable),
+        (crate::derive::from_bytes::derive_from_bytes, Trait::FromBytes),
+        (crate::derive::into_bytes::derive_into_bytes, Trait::IntoBytes),
+        (crate::derive::derive_split_at, Trait::SplitAt),
+        (crate::derive::unaligned::derive_unaligned, Trait::Unaligned),
+    ];
+
+    let mut tokens = proc_macro2::TokenStream::new();
+    for (derive, t) in derives {
+        tokens.extend(derive(&ctx, t))
+    }
+
+    // We wrap in `const_block` as a backstop in case any derive fails
+    // to wrap its output in `const_block` (and thus fails to annotate)
+    // with the full set of `#[allow(...)]` attributes).
+    let ts = const_block([Some(tokens)]);
+    #[cfg(test)]
+    crate::util::testutil::check_hygiene(ts.clone());
+    ts.into()
+}
+
 /// Deprecated: prefer [`FromZeros`] instead.
 #[deprecated(since = "0.8.0", note = "`FromZeroes` was renamed to `FromZeros`")]
 #[doc(hidden)]
diff --git a/rust/zerocopy-derive/repr.rs b/rust/zerocopy-derive/repr.rs
index 74fd376d9fda..1525e94302d1 100644
--- a/rust/zerocopy-derive/repr.rs
+++ b/rust/zerocopy-derive/repr.rs
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
-
+//
 // Copyright 2019 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
diff --git a/rust/zerocopy-derive/util.rs b/rust/zerocopy-derive/util.rs
index 5ba5228e2a44..5c5e9d3bdcb8 100644
--- a/rust/zerocopy-derive/util.rs
+++ b/rust/zerocopy-derive/util.rs
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
-
+//
 // Copyright 2019 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
@@ -98,6 +98,11 @@ pub(crate) fn with_input(&self, input: &DeriveInput) -> Self {
         }
     }
 
+    pub(crate) fn skip_on_error(mut self) -> Self {
+        self.skip_on_error = true;
+        self
+    }
+
     pub(crate) fn core_path(&self) -> TokenStream {
         let zerocopy_crate = &self.zerocopy_crate;
         quote!(#zerocopy_crate::util::macro_util::core_reexport)
@@ -106,20 +111,21 @@ pub(crate) fn core_path(&self) -> TokenStream {
     pub(crate) fn cfg_compile_error(&self) -> TokenStream {
         // By checking both during the compilation of the proc macro *and* in
         // the generated code, we ensure that `--cfg
-        // zerocopy_unstable_derive_on_error` need only be passed *either* when
+        // zerocopy_unstable_linux` need only be passed *either* when
         // compiling this crate *or* when compiling the user's crate. The former
         // is preferable, but in some situations (such as when cross-compiling
         // using `cargo build --target`), it doesn't get propagated to this
         // crate's build by default.
-        if cfg!(zerocopy_unstable_derive_on_error) {
+        if cfg!(zerocopy_unstable_linux) {
             quote!()
         } else if let Some(span) = self.on_error_span {
             let core = self.core_path();
-            let error_message = "`on_error` is experimental; pass '--cfg zerocopy_unstable_derive_on_error' to enable";
+            let error_message =
+                "`on_error` is experimental; pass '--cfg zerocopy_unstable_linux' to enable";
             quote::quote_spanned! {span=>
                 #[allow(unused_attributes, unexpected_cfgs)]
                 const _: () = {
-                    #[cfg(not(zerocopy_unstable_derive_on_error))]
+                    #[cfg(not(zerocopy_unstable_linux))]
                     #core::compile_error!(#error_message);
                 };
             }
@@ -612,6 +618,20 @@ fn bound_tt(ty: &Type, traits: impl Iterator<Item = Trait>, ctx: &Ctx) -> WhereP
             }
         };
 
+        let zerocopy_bounds =
+            field_type_bounds
+                .into_iter()
+                .chain(padding_check_bound)
+                .chain(self_bounds)
+                .map(|bound| {
+                    if self.ctx.skip_on_error {
+                        parse_quote!(for<'zc> #bound)
+                    } else {
+                        bound.clone()
+                    }
+                })
+                .collect::<Vec<_>>();
+
         let bounds = self
             .ctx
             .ast
@@ -621,9 +641,7 @@ fn bound_tt(ty: &Type, traits: impl Iterator<Item = Trait>, ctx: &Ctx) -> WhereP
             .map(|where_clause| where_clause.predicates.iter())
             .into_iter()
             .flatten()
-            .chain(field_type_bounds.iter())
-            .chain(padding_check_bound.iter())
-            .chain(self_bounds.iter());
+            .chain(zerocopy_bounds.iter());
 
         // The parameters with trait bounds, but without type defaults.
         let mut params: Vec<_> = self
diff --git a/rust/zerocopy/README.md b/rust/zerocopy/README.md
index 99e6cad0e26c..712b0317df25 100644
--- a/rust/zerocopy/README.md
+++ b/rust/zerocopy/README.md
@@ -1,14 +1,13 @@
 # `zerocopy`
 
-These source files come from the Rust `zerocopy` crate, version v0.8.50
-(released 2026-05-31), hosted in the <https://github.com/google/zerocopy>
+These source files come from the Rust `zerocopy` crate, version v0.8.52
+(released 2026-06-09), hosted in the <https://github.com/google/zerocopy>
 repository, licensed under "BSD-2-Clause OR Apache-2.0 OR MIT" and only
-modified to add the SPDX license identifiers and to remove `Display`
-for `f32` and `f64`.
+modified to tweak the SPDX license identifiers.
 
 For copyright details, please see:
 
-    https://github.com/google/zerocopy/blob/v0.8.50/README.md?plain=1
-    https://github.com/google/zerocopy/blob/v0.8.50/LICENSE-BSD
-    https://github.com/google/zerocopy/blob/v0.8.50/LICENSE-APACHE
-    https://github.com/google/zerocopy/blob/v0.8.50/LICENSE-MIT
+    https://github.com/google/zerocopy/blob/v0.8.52/README.md?plain=1
+    https://github.com/google/zerocopy/blob/v0.8.52/LICENSE-BSD
+    https://github.com/google/zerocopy/blob/v0.8.52/LICENSE-APACHE
+    https://github.com/google/zerocopy/blob/v0.8.52/LICENSE-MIT
diff --git a/rust/zerocopy/src/byte_slice.rs b/rust/zerocopy/src/byte_slice.rs
index a5ded4a18b39..b7f85098dbc4 100644
--- a/rust/zerocopy/src/byte_slice.rs
+++ b/rust/zerocopy/src/byte_slice.rs
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
-
+//
 // Copyright 2024 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
diff --git a/rust/zerocopy/src/byteorder.rs b/rust/zerocopy/src/byteorder.rs
index 8f70048f1eb0..ecf95e38eebd 100644
--- a/rust/zerocopy/src/byteorder.rs
+++ b/rust/zerocopy/src/byteorder.rs
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
-
+//
 // Copyright 2019 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
@@ -164,6 +164,42 @@ fn fmt(&self, _: &mut Formatter<'_>) -> fmt::Result {
 /// A type alias for [`LittleEndian`].
 pub type LE = LittleEndian;
 
+macro_rules! impl_dbg_trait {
+    ($name:ident, $native:ident) => {
+        impl<O: ByteOrder> Debug for $name<O> {
+            #[inline]
+            fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
+                // This results in a format like "U16(42)".
+                f.debug_tuple(stringify!($name)).field(&self.get()).finish()
+            }
+        }
+    };
+}
+
+macro_rules! impl_dbg_traits {
+    ($name:ident, $native:ident, "floating point number") => {
+        #[cfg(not(no_fp_fmt_parse))]
+        impl_dbg_trait!($name, $native);
+
+        #[cfg(no_fp_fmt_parse)]
+        impl<O: ByteOrder> Debug for $name<O> {
+            #[inline]
+            fn fmt(&self, _f: &mut Formatter<'_>) -> fmt::Result {
+                panic!("floating point support is turned off");
+            }
+        }
+    };
+    ($name:ident, $native:ident, "unsigned integer") => {
+        impl_dbg_traits!($name, $native, @all_types);
+    };
+    ($name:ident, $native:ident, "signed integer") => {
+        impl_dbg_traits!($name, $native, @all_types);
+    };
+    ($name:ident, $native:ident, @all_types) => {
+        impl_dbg_trait!($name, $native);
+    };
+}
+
 macro_rules! impl_fmt_trait {
     ($name:ident, $native:ident, $trait:ident) => {
         impl<O: ByteOrder> $trait for $name<O> {
@@ -177,6 +213,8 @@ fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
 
 macro_rules! impl_fmt_traits {
     ($name:ident, $native:ident, "floating point number") => {
+        #[cfg(not(no_fp_fmt_parse))]
+        impl_fmt_trait!($name, $native, Display);
     };
     ($name:ident, $native:ident, "unsigned integer") => {
         impl_fmt_traits!($name, $native, @all_types);
@@ -687,16 +725,9 @@ fn eq(&self, other: &$native) -> bool {
             }
         }
 
+        impl_dbg_traits!($name, $native, $number_kind);
         impl_fmt_traits!($name, $native, $number_kind);
         impl_ops_traits!($name, $native, $number_kind);
-
-        impl<O: ByteOrder> Debug for $name<O> {
-            #[inline]
-            fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
-                // This results in a format like "U16(42)".
-                f.debug_tuple(stringify!($name)).field(&self.get()).finish()
-            }
-        }
     };
 }
 
diff --git a/rust/zerocopy/src/deprecated.rs b/rust/zerocopy/src/deprecated.rs
index 24bafbf9adeb..59ddd35c77c6 100644
--- a/rust/zerocopy/src/deprecated.rs
+++ b/rust/zerocopy/src/deprecated.rs
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
-
+//
 // Copyright 2024 The Fuchsia Authors
 //
 // Licensed under the 2-Clause BSD License <LICENSE-BSD or
diff --git a/rust/zerocopy/src/error.rs b/rust/zerocopy/src/error.rs
index 7cb08c31d452..5eb30de934f3 100644
--- a/rust/zerocopy/src/error.rs
+++ b/rust/zerocopy/src/error.rs
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
-
+//
 // Copyright 2024 The Fuchsia Authors
 //
 // Licensed under the 2-Clause BSD License <LICENSE-BSD or
diff --git a/rust/zerocopy/src/impls.rs b/rust/zerocopy/src/impls.rs
index 22fd6c3d5d94..62e234c5202b 100644
--- a/rust/zerocopy/src/impls.rs
+++ b/rust/zerocopy/src/impls.rs
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
-
+//
 // Copyright 2024 The Fuchsia Authors
 //
 // Licensed under the 2-Clause BSD License <LICENSE-BSD or
@@ -1359,7 +1359,7 @@ mod $mod {
         #[cfg(not(no_zerocopy_aarch64_simd_1_59_0))]
         simd_arch_mod!(
             #[cfg(all(
-                target_arch = "aarch64", 
+                target_arch = "aarch64",
                 any(
                     target_endian = "little",
                     not(no_zerocopy_aarch64_simd_be_1_87_0)
diff --git a/rust/zerocopy/src/layout.rs b/rust/zerocopy/src/layout.rs
index 6015d0f2de52..942d35db8957 100644
--- a/rust/zerocopy/src/layout.rs
+++ b/rust/zerocopy/src/layout.rs
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
-
+//
 // Copyright 2024 The Fuchsia Authors
 //
 // Licensed under the 2-Clause BSD License <LICENSE-BSD or
diff --git a/rust/zerocopy/src/lib.rs b/rust/zerocopy/src/lib.rs
index 3302d67602ab..700fece1b728 100644
--- a/rust/zerocopy/src/lib.rs
+++ b/rust/zerocopy/src/lib.rs
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
-
+//
 // Copyright 2018 The Fuchsia Authors
 //
 // Licensed under the 2-Clause BSD License <LICENSE-BSD or
@@ -12,7 +12,7 @@
 // After updating the following doc comment, make sure to run the following
 // command to update `README.md` based on its contents:
 //
-//   cargo -q run --manifest-path tools/Cargo.toml -p generate-readme > README.md
+//   (cd .. && cargo -q run --manifest-path tools/Cargo.toml -p generate-readme) > README.md
 
 //! ***<span style="font-size: 140%">Fast, safe, <span
 //! style="color:red;">compile error</span>. Pick two.</span>***
@@ -174,7 +174,7 @@
 //!
 //! [Miri]: https://github.com/rust-lang/miri
 //! [Kani]: https://github.com/model-checking/kani
-//! [soundness policy]: https://github.com/google/zerocopy/blob/main/POLICIES.md#soundness
+//! [soundness policy]: https://github.com/google/zerocopy/blob/main/zerocopy/POLICIES.md#soundness
 //!
 //! # Relationship to Project Safe Transmute
 //!
@@ -203,7 +203,7 @@
 //!
 //! See our [MSRV policy].
 //!
-//! [MSRV policy]: https://github.com/google/zerocopy/blob/main/POLICIES.md#msrv
+//! [MSRV policy]: https://github.com/google/zerocopy/blob/main/zerocopy/POLICIES.md#msrv
 //!
 //! # Changelog
 //!
@@ -435,6 +435,9 @@
     WARNING
 };
 
+#[doc(hidden)]
+#[cfg(all(any(feature = "derive", test), zerocopy_unstable_linux))]
+pub use zerocopy_derive::most_traits;
 /// Implements [`KnownLayout`].
 ///
 /// This derive analyzes various aspects of a type's layout that are needed for
@@ -2832,7 +2835,7 @@ fn try_ref_from_suffix_with_elems(
     /// ```
     ///
     /// [`try_mut_from_bytes`]: TryFromBytes::try_mut_from_bytes
-    ///  
+    ///
     #[doc = codegen_header!("h5", "try_mut_from_bytes_with_elems")]
     ///
     /// See [`TryFromBytes::try_ref_from_bytes_with_elems`](#method.try_ref_from_bytes_with_elems.codegen).
diff --git a/rust/zerocopy/src/macros.rs b/rust/zerocopy/src/macros.rs
index b801d86a8fa6..ec67c03a44fc 100644
--- a/rust/zerocopy/src/macros.rs
+++ b/rust/zerocopy/src/macros.rs
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
-
+//
 // Copyright 2024 The Fuchsia Authors
 //
 // Licensed under the 2-Clause BSD License <LICENSE-BSD or
diff --git a/rust/zerocopy/src/pointer/inner.rs b/rust/zerocopy/src/pointer/inner.rs
index 5db08080141f..949b60a3f83e 100644
--- a/rust/zerocopy/src/pointer/inner.rs
+++ b/rust/zerocopy/src/pointer/inner.rs
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
-
+//
 // Copyright 2024 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
diff --git a/rust/zerocopy/src/pointer/invariant.rs b/rust/zerocopy/src/pointer/invariant.rs
index 1802d23563db..7ff0d43dad5e 100644
--- a/rust/zerocopy/src/pointer/invariant.rs
+++ b/rust/zerocopy/src/pointer/invariant.rs
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
-
+//
 // Copyright 2024 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
diff --git a/rust/zerocopy/src/pointer/mod.rs b/rust/zerocopy/src/pointer/mod.rs
index 3461f7f5ca80..d6eacc52febe 100644
--- a/rust/zerocopy/src/pointer/mod.rs
+++ b/rust/zerocopy/src/pointer/mod.rs
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
-
+//
 // Copyright 2023 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
diff --git a/rust/zerocopy/src/pointer/ptr.rs b/rust/zerocopy/src/pointer/ptr.rs
index b7c4ea56d2b2..7213f6f4a04e 100644
--- a/rust/zerocopy/src/pointer/ptr.rs
+++ b/rust/zerocopy/src/pointer/ptr.rs
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
-
+//
 // Copyright 2023 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
diff --git a/rust/zerocopy/src/pointer/transmute.rs b/rust/zerocopy/src/pointer/transmute.rs
index a534984b70d3..ef9836698203 100644
--- a/rust/zerocopy/src/pointer/transmute.rs
+++ b/rust/zerocopy/src/pointer/transmute.rs
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
-
+//
 // Copyright 2025 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
diff --git a/rust/zerocopy/src/ref.rs b/rust/zerocopy/src/ref.rs
index 860066d75196..e49f2a887ffa 100644
--- a/rust/zerocopy/src/ref.rs
+++ b/rust/zerocopy/src/ref.rs
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
-
+//
 // Copyright 2024 The Fuchsia Authors
 //
 // Licensed under the 2-Clause BSD License <LICENSE-BSD or
diff --git a/rust/zerocopy/src/split_at.rs b/rust/zerocopy/src/split_at.rs
index 9a67d5acbb0d..d7778425a31d 100644
--- a/rust/zerocopy/src/split_at.rs
+++ b/rust/zerocopy/src/split_at.rs
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
-
+//
 // Copyright 2025 The Fuchsia Authors
 //
 // Licensed under the 2-Clause BSD License <LICENSE-BSD or
diff --git a/rust/zerocopy/src/util/macro_util.rs b/rust/zerocopy/src/util/macro_util.rs
index 1abb0fbeb46e..ceeb80432b0b 100644
--- a/rust/zerocopy/src/util/macro_util.rs
+++ b/rust/zerocopy/src/util/macro_util.rs
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
-
+//
 // Copyright 2022 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
diff --git a/rust/zerocopy/src/util/macros.rs b/rust/zerocopy/src/util/macros.rs
index 43e4fd64ee15..7e63e3a54fc4 100644
--- a/rust/zerocopy/src/util/macros.rs
+++ b/rust/zerocopy/src/util/macros.rs
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
-
+//
 // Copyright 2023 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
diff --git a/rust/zerocopy/src/util/mod.rs b/rust/zerocopy/src/util/mod.rs
index d6d4c6c2fcd9..f8affbbd336c 100644
--- a/rust/zerocopy/src/util/mod.rs
+++ b/rust/zerocopy/src/util/mod.rs
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
-
+//
 // Copyright 2023 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
diff --git a/rust/zerocopy/src/wrappers.rs b/rust/zerocopy/src/wrappers.rs
index 266aec25fa58..1a8cf2b41d55 100644
--- a/rust/zerocopy/src/wrappers.rs
+++ b/rust/zerocopy/src/wrappers.rs
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: (BSD-2-Clause OR Apache-2.0) OR MIT
-
+//
 // Copyright 2023 The Fuchsia Authors
 //
 // Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0

base-commit: 4edcdefd4083ae04b1a5656f4be6cd83ae919ef4
-- 
2.54.0


