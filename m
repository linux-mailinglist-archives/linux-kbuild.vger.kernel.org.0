Return-Path: <linux-kbuild+bounces-13519-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AIYFGisUH2q8fAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13519-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 19:34:35 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAAC630C07
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 19:34:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nDURIsre;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13519-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13519-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A941E3047375
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jun 2026 17:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D9703890E2;
	Tue,  2 Jun 2026 17:30:45 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CC03FCB14;
	Tue,  2 Jun 2026 17:30:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780421445; cv=none; b=feAfnUJYaVNpelIAGcLuPbikPyc3e3sVsoKj/M8kh979EIFP+87CfVO94xQE7yaHUT8od9v17QopGqHTEpTke4/HkwnixbE8tCUeXYtwpIawx38XrcAgb7/qdYEenhxrpKFOoSMx71VL+vTqNGWquqems+UXPuTzTkv4RGZnIpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780421445; c=relaxed/simple;
	bh=1waHN8c6PncOwIRn08/gyUKCwg5jifb91+6WQhHsacM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cESlk6DO3rtRRUSFl2+hj0FK7XsuiCX0AXWhgklOxkqF5RyqS5R64KUwQ5jENwDW3rQ+bbXJi8eO3m26DjmwU6yJg/9CqJhFreAxa+sX9QLjbVz5gWcNGFqmJOPxsqsxqWk0bPpOXm2yZ7Yh6Fsb/GSMJR4XRmbzSNRj/nPlOVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nDURIsre; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C12F1F0089B;
	Tue,  2 Jun 2026 17:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780421435;
	bh=qLpn/0PPYfK5SfM1SzyFfwMf2TkbUL2fyHzRLxtoBac=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nDURIsrerIykUkP92iXysAGvHyo+dPCdyKpFBB8Q4jJa9gJbG7kkYN7f1ifMPAgVQ
	 QgFXByiTrD1qSDkmjJq7LmdgyFG6BRwjgHZ89iY/nbPPJzpKiC7GbHTTdWq+W+XkNE
	 6QoYaN9yqJJSg8I3daDI64i4HnqmhQeBv73QJmNPA4ggZ/iFyxvOndP/rxEOOwMHFA
	 I3bgtp7kWP9ciCvKyZBiP0QbeFzDf61O7qZplLXdTrCOYutFwFbbf8YiessMus2SOd
	 GIyLgMJhxe529aDfXQaHKVHL3ByFcDTVhxvIGiFQoYQ5OZ3JKuP1n4AMtQqwiKz0N5
	 vm2F38S7v/tzg==
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
Subject: [PATCH 13/18] rust: zerocopy-derive: import crate
Date: Tue,  2 Jun 2026 19:29:14 +0200
Message-ID: <20260602172920.30342-14-ojeda@kernel.org>
In-Reply-To: <20260602172920.30342-1-ojeda@kernel.org>
References: <20260602172920.30342-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,amazon.com];
	TAGGED_FROM(0.00)[bounces-13519-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:joshlf@google.com,m:jswrenn@amazon.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[ojeda@kernel.org,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ojeda@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BFAAC630C07

This is a subset of the Rust `zerocopy-derive` crate, version v0.8.50
(released 2026-05-31), licensed under "BSD-2-Clause OR Apache-2.0 OR
MIT", from:

    https://github.com/google/zerocopy/tree/v0.8.50/zerocopy-derive/src

The files are copied as-is, with no modifications whatsoever (not even
adding the SPDX identifiers).

For copyright details, please see:

    https://github.com/google/zerocopy/blob/v0.8.50/README.md?plain=1
    https://github.com/google/zerocopy/blob/v0.8.50/LICENSE-BSD
    https://github.com/google/zerocopy/blob/v0.8.50/LICENSE-APACHE
    https://github.com/google/zerocopy/blob/v0.8.50/LICENSE-MIT

The next two patches modify these files as needed for use within the
kernel. This patch split allows reviewers to double-check the import
and to clearly see the differences introduced.

The following script may be used to verify the contents:

    for path in $(cd rust/zerocopy-derive/ && find . -type f); do
        curl --silent --show-error --location \
            https://github.com/google/zerocopy/raw/v0.8.50/zerocopy-derive/src/$path \
            | diff --unified rust/zerocopy-derive/$path - && echo $path: OK
    done

Cc: Joshua Liebow-Feeser <joshlf@google.com>
Cc: Jack Wrenn <jswrenn@amazon.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/zerocopy-derive/derive/from_bytes.rs     | 190 ++++
 rust/zerocopy-derive/derive/into_bytes.rs     | 162 ++++
 rust/zerocopy-derive/derive/known_layout.rs   | 348 +++++++
 rust/zerocopy-derive/derive/mod.rs            | 130 +++
 rust/zerocopy-derive/derive/try_from_bytes.rs | 763 ++++++++++++++++
 rust/zerocopy-derive/derive/unaligned.rs      |  78 ++
 rust/zerocopy-derive/lib.rs                   | 144 +++
 rust/zerocopy-derive/repr.rs                  | 849 ++++++++++++++++++
 rust/zerocopy-derive/util.rs                  | 843 +++++++++++++++++
 9 files changed, 3507 insertions(+)
 create mode 100644 rust/zerocopy-derive/derive/from_bytes.rs
 create mode 100644 rust/zerocopy-derive/derive/into_bytes.rs
 create mode 100644 rust/zerocopy-derive/derive/known_layout.rs
 create mode 100644 rust/zerocopy-derive/derive/mod.rs
 create mode 100644 rust/zerocopy-derive/derive/try_from_bytes.rs
 create mode 100644 rust/zerocopy-derive/derive/unaligned.rs
 create mode 100644 rust/zerocopy-derive/lib.rs
 create mode 100644 rust/zerocopy-derive/repr.rs
 create mode 100644 rust/zerocopy-derive/util.rs

diff --git a/rust/zerocopy-derive/derive/from_bytes.rs b/rust/zerocopy-derive/derive/from_bytes.rs
new file mode 100644
index 000000000000..ad8b6233fe54
--- /dev/null
+++ b/rust/zerocopy-derive/derive/from_bytes.rs
@@ -0,0 +1,190 @@
+use proc_macro2::{Span, TokenStream};
+use syn::{
+    parse_quote, Data, DataEnum, DataStruct, DataUnion, Error, Expr, ExprLit, ExprUnary, Lit, UnOp,
+    WherePredicate,
+};
+
+use crate::{
+    derive::try_from_bytes::derive_try_from_bytes,
+    repr::{CompoundRepr, EnumRepr, Repr, Spanned},
+    util::{enum_size_from_repr, Ctx, FieldBounds, ImplBlockBuilder, Trait, TraitBound},
+};
+/// Returns `Ok(index)` if variant `index` of the enum has a discriminant of
+/// zero. If `Err(bool)` is returned, the boolean is true if the enum has
+/// unknown discriminants (e.g. discriminants set to const expressions which we
+/// can't evaluate in a proc macro). If the enum has unknown discriminants, then
+/// it might have a zero variant that we just can't detect.
+pub(crate) fn find_zero_variant(enm: &DataEnum) -> Result<usize, bool> {
+    // Discriminants can be anywhere in the range [i128::MIN, u128::MAX] because
+    // the discriminant type may be signed or unsigned. Since we only care about
+    // tracking the discriminant when it's less than or equal to zero, we can
+    // avoid u128 -> i128 conversions and bounds checking by making the "next
+    // discriminant" value implicitly negative.
+    // Technically 64 bits is enough, but 128 is better for future compatibility
+    // with https://github.com/rust-lang/rust/issues/56071
+    let mut next_negative_discriminant = Some(0);
+
+    // Sometimes we encounter explicit discriminants that we can't know the
+    // value of (e.g. a constant expression that requires evaluation). These
+    // could evaluate to zero or a negative number, but we can't assume that
+    // they do (no false positives allowed!). So we treat them like strictly-
+    // positive values that can't result in any zero variants, and track whether
+    // we've encountered any unknown discriminants.
+    let mut has_unknown_discriminants = false;
+
+    for (i, v) in enm.variants.iter().enumerate() {
+        match v.discriminant.as_ref() {
+            // Implicit discriminant
+            None => {
+                match next_negative_discriminant.as_mut() {
+                    Some(0) => return Ok(i),
+                    // n is nonzero so subtraction is always safe
+                    Some(n) => *n -= 1,
+                    None => (),
+                }
+            }
+            // Explicit positive discriminant
+            Some((_, Expr::Lit(ExprLit { lit: Lit::Int(int), .. }))) => {
+                match int.base10_parse::<u128>().ok() {
+                    Some(0) => return Ok(i),
+                    Some(_) => next_negative_discriminant = None,
+                    None => {
+                        // Numbers should never fail to parse, but just in case:
+                        has_unknown_discriminants = true;
+                        next_negative_discriminant = None;
+                    }
+                }
+            }
+            // Explicit negative discriminant
+            Some((_, Expr::Unary(ExprUnary { op: UnOp::Neg(_), expr, .. }))) => match &**expr {
+                Expr::Lit(ExprLit { lit: Lit::Int(int), .. }) => {
+                    match int.base10_parse::<u128>().ok() {
+                        Some(0) => return Ok(i),
+                        // x is nonzero so subtraction is always safe
+                        Some(x) => next_negative_discriminant = Some(x - 1),
+                        None => {
+                            // Numbers should never fail to parse, but just in
+                            // case:
+                            has_unknown_discriminants = true;
+                            next_negative_discriminant = None;
+                        }
+                    }
+                }
+                // Unknown negative discriminant (e.g. const repr)
+                _ => {
+                    has_unknown_discriminants = true;
+                    next_negative_discriminant = None;
+                }
+            },
+            // Unknown discriminant (e.g. const expr)
+            _ => {
+                has_unknown_discriminants = true;
+                next_negative_discriminant = None;
+            }
+        }
+    }
+
+    Err(has_unknown_discriminants)
+}
+pub(crate) fn derive_from_zeros(ctx: &Ctx, top_level: Trait) -> Result<TokenStream, Error> {
+    let try_from_bytes = derive_try_from_bytes(ctx, top_level)?;
+    let from_zeros = match &ctx.ast.data {
+        Data::Struct(strct) => derive_from_zeros_struct(ctx, strct),
+        Data::Enum(enm) => derive_from_zeros_enum(ctx, enm)?,
+        Data::Union(unn) => derive_from_zeros_union(ctx, unn),
+    };
+    Ok(IntoIterator::into_iter([try_from_bytes, from_zeros]).collect())
+}
+pub(crate) fn derive_from_bytes(ctx: &Ctx, top_level: Trait) -> Result<TokenStream, Error> {
+    let from_zeros = derive_from_zeros(ctx, top_level)?;
+    let from_bytes = match &ctx.ast.data {
+        Data::Struct(strct) => derive_from_bytes_struct(ctx, strct),
+        Data::Enum(enm) => derive_from_bytes_enum(ctx, enm)?,
+        Data::Union(unn) => derive_from_bytes_union(ctx, unn),
+    };
+
+    Ok(IntoIterator::into_iter([from_zeros, from_bytes]).collect())
+}
+fn derive_from_zeros_struct(ctx: &Ctx, strct: &DataStruct) -> TokenStream {
+    ImplBlockBuilder::new(ctx, strct, Trait::FromZeros, FieldBounds::ALL_SELF).build()
+}
+fn derive_from_zeros_enum(ctx: &Ctx, enm: &DataEnum) -> Result<TokenStream, Error> {
+    let repr = EnumRepr::from_attrs(&ctx.ast.attrs)?;
+
+    // We don't actually care what the repr is; we just care that it's one of
+    // the allowed ones.
+    match repr {
+        Repr::Compound(Spanned { t: CompoundRepr::C | CompoundRepr::Primitive(_), span: _ }, _) => {
+        }
+        Repr::Transparent(_) | Repr::Compound(Spanned { t: CompoundRepr::Rust, span: _ }, _) => {
+            return ctx.error_or_skip(
+                Error::new(
+                    Span::call_site(),
+                    "must have #[repr(C)] or #[repr(Int)] attribute in order to guarantee this type's memory layout",
+                ),
+            );
+        }
+    }
+
+    let zero_variant = match find_zero_variant(enm) {
+        Ok(index) => enm.variants.iter().nth(index).unwrap(),
+        // Has unknown variants
+        Err(true) => {
+            return ctx.error_or_skip(Error::new_spanned(
+                &ctx.ast,
+                "FromZeros only supported on enums with a variant that has a discriminant of `0`\n\
+                help: This enum has discriminants which are not literal integers. One of those may \
+                define or imply which variant has a discriminant of zero. Use a literal integer to \
+                define or imply the variant with a discriminant of zero.",
+            ));
+        }
+        // Does not have unknown variants
+        Err(false) => {
+            return ctx.error_or_skip(Error::new_spanned(
+                &ctx.ast,
+                "FromZeros only supported on enums with a variant that has a discriminant of `0`",
+            ));
+        }
+    };
+
+    let zerocopy_crate = &ctx.zerocopy_crate;
+    let explicit_bounds = zero_variant
+        .fields
+        .iter()
+        .map(|field| {
+            let ty = &field.ty;
+            parse_quote! { #ty: #zerocopy_crate::FromZeros }
+        })
+        .collect::<Vec<WherePredicate>>();
+
+    Ok(ImplBlockBuilder::new(ctx, enm, Trait::FromZeros, FieldBounds::Explicit(explicit_bounds))
+        .build())
+}
+fn derive_from_zeros_union(ctx: &Ctx, unn: &DataUnion) -> TokenStream {
+    let field_type_trait_bounds = FieldBounds::All(&[TraitBound::Slf]);
+    ImplBlockBuilder::new(ctx, unn, Trait::FromZeros, field_type_trait_bounds).build()
+}
+fn derive_from_bytes_struct(ctx: &Ctx, strct: &DataStruct) -> TokenStream {
+    ImplBlockBuilder::new(ctx, strct, Trait::FromBytes, FieldBounds::ALL_SELF).build()
+}
+fn derive_from_bytes_enum(ctx: &Ctx, enm: &DataEnum) -> Result<TokenStream, Error> {
+    let repr = EnumRepr::from_attrs(&ctx.ast.attrs)?;
+
+    let variants_required = 1usize << enum_size_from_repr(&repr)?;
+    if enm.variants.len() != variants_required {
+        return ctx.error_or_skip(Error::new_spanned(
+            &ctx.ast,
+            format!(
+                "FromBytes only supported on {} enum with {} variants",
+                repr.repr_type_name(),
+                variants_required
+            ),
+        ));
+    }
+
+    Ok(ImplBlockBuilder::new(ctx, enm, Trait::FromBytes, FieldBounds::ALL_SELF).build())
+}
+fn derive_from_bytes_union(ctx: &Ctx, unn: &DataUnion) -> TokenStream {
+    let field_type_trait_bounds = FieldBounds::All(&[TraitBound::Slf]);
+    ImplBlockBuilder::new(ctx, unn, Trait::FromBytes, field_type_trait_bounds).build()
+}
diff --git a/rust/zerocopy-derive/derive/into_bytes.rs b/rust/zerocopy-derive/derive/into_bytes.rs
new file mode 100644
index 000000000000..8c1e1009dd91
--- /dev/null
+++ b/rust/zerocopy-derive/derive/into_bytes.rs
@@ -0,0 +1,162 @@
+use proc_macro2::{Span, TokenStream};
+use quote::quote;
+use syn::{Data, DataEnum, DataStruct, DataUnion, Error, Type};
+
+use crate::{
+    repr::{EnumRepr, StructUnionRepr},
+    util::{
+        generate_tag_enum, Ctx, DataExt, FieldBounds, ImplBlockBuilder, PaddingCheck, Trait,
+        TraitBound,
+    },
+};
+pub(crate) fn derive_into_bytes(ctx: &Ctx, _top_level: Trait) -> Result<TokenStream, Error> {
+    match &ctx.ast.data {
+        Data::Struct(strct) => derive_into_bytes_struct(ctx, strct),
+        Data::Enum(enm) => derive_into_bytes_enum(ctx, enm),
+        Data::Union(unn) => derive_into_bytes_union(ctx, unn),
+    }
+}
+fn derive_into_bytes_struct(ctx: &Ctx, strct: &DataStruct) -> Result<TokenStream, Error> {
+    let repr = StructUnionRepr::from_attrs(&ctx.ast.attrs)?;
+
+    let is_transparent = repr.is_transparent();
+    let is_c = repr.is_c();
+    let is_packed_1 = repr.is_packed_1();
+    let num_fields = strct.fields().len();
+
+    let (padding_check, require_unaligned_fields) = if is_transparent || is_packed_1 {
+        // No padding check needed.
+        // - repr(transparent): The layout and ABI of the whole struct is the
+        //   same as its only non-ZST field (meaning there's no padding outside
+        //   of that field) and we require that field to be `IntoBytes` (meaning
+        //   there's no padding in that field).
+        // - repr(packed): Any inter-field padding bytes are removed, meaning
+        //   that any padding bytes would need to come from the fields, all of
+        //   which we require to be `IntoBytes` (meaning they don't have any
+        //   padding). Note that this holds regardless of other `repr`
+        //   attributes, including `repr(Rust)`. [1]
+        //
+        // [1] Per https://doc.rust-lang.org/1.81.0/reference/type-layout.html#the-alignment-modifiers:
+        //
+        //   An important consequence of these rules is that a type with
+        //   `#[repr(packed(1))]`` (or `#[repr(packed)]``) will have no
+        //   inter-field padding.
+        (None, false)
+    } else if is_c && !repr.is_align_gt_1() && num_fields <= 1 {
+        // No padding check needed. A repr(C) struct with zero or one field has
+        // no padding unless #[repr(align)] explicitly adds padding, which we
+        // check for in this branch's condition.
+        (None, false)
+    } else if ctx.ast.generics.params.is_empty() {
+        // Is the last field a syntactic slice, i.e., `[SomeType]`.
+        let is_syntactic_dst =
+            strct.fields().last().map(|(_, _, ty)| matches!(ty, Type::Slice(_))).unwrap_or(false);
+        // Since there are no generics, we can emit a padding check. All reprs
+        // guarantee that fields won't overlap [1], so the padding check is
+        // sound. This is more permissive than the next case, which requires
+        // that all field types implement `Unaligned`.
+        //
+        // [1] Per https://doc.rust-lang.org/1.81.0/reference/type-layout.html#the-rust-representation:
+        //
+        //   The only data layout guarantees made by [`repr(Rust)`] are those
+        //   required for soundness. They are:
+        //   ...
+        //   2. The fields do not overlap.
+        //   ...
+        if is_c && is_syntactic_dst {
+            (Some(PaddingCheck::ReprCStruct), false)
+        } else {
+            (Some(PaddingCheck::Struct), false)
+        }
+    } else if is_c && !repr.is_align_gt_1() {
+        // We can't use a padding check since there are generic type arguments.
+        // Instead, we require all field types to implement `Unaligned`. This
+        // ensures that the `repr(C)` layout algorithm will not insert any
+        // padding unless #[repr(align)] explicitly adds padding, which we check
+        // for in this branch's condition.
+        //
+        // FIXME(#10): Support type parameters for non-transparent, non-packed
+        // structs without requiring `Unaligned`.
+        (None, true)
+    } else {
+        return ctx.error_or_skip(Error::new(
+            Span::call_site(),
+            "must have a non-align #[repr(...)] attribute in order to guarantee this type's memory layout",
+        ));
+    };
+
+    let field_bounds = if require_unaligned_fields {
+        FieldBounds::All(&[TraitBound::Slf, TraitBound::Other(Trait::Unaligned)])
+    } else {
+        FieldBounds::ALL_SELF
+    };
+
+    Ok(ImplBlockBuilder::new(ctx, strct, Trait::IntoBytes, field_bounds)
+        .padding_check(padding_check)
+        .build())
+}
+
+fn derive_into_bytes_enum(ctx: &Ctx, enm: &DataEnum) -> Result<TokenStream, Error> {
+    let repr = EnumRepr::from_attrs(&ctx.ast.attrs)?;
+    if !repr.is_c() && !repr.is_primitive() {
+        return ctx.error_or_skip(Error::new(
+            Span::call_site(),
+            "must have #[repr(C)] or #[repr(Int)] attribute in order to guarantee this type's memory layout",
+        ));
+    }
+
+    let tag_type_definition = generate_tag_enum(ctx, &repr, enm);
+    Ok(ImplBlockBuilder::new(ctx, enm, Trait::IntoBytes, FieldBounds::ALL_SELF)
+        .padding_check(PaddingCheck::Enum { tag_type_definition })
+        .build())
+}
+
+fn derive_into_bytes_union(ctx: &Ctx, unn: &DataUnion) -> Result<TokenStream, Error> {
+    // See #1792 for more context.
+    //
+    // By checking for `zerocopy_derive_union_into_bytes` both here and in the
+    // generated code, we ensure that `--cfg zerocopy_derive_union_into_bytes`
+    // need only be passed *either* when compiling this crate *or* when
+    // compiling the user's crate. The former is preferable, but in some
+    // situations (such as when cross-compiling using `cargo build --target`),
+    // it doesn't get propagated to this crate's build by default.
+    let cfg_compile_error = if cfg!(zerocopy_derive_union_into_bytes) {
+        quote!()
+    } else {
+        let core = ctx.core_path();
+        let error_message = "requires --cfg zerocopy_derive_union_into_bytes;
+please let us know you use this feature: https://github.com/google/zerocopy/discussions/1802";
+        quote!(
+            #[allow(unused_attributes, unexpected_cfgs)]
+            const _: () = {
+                #[cfg(not(zerocopy_derive_union_into_bytes))]
+                #core::compile_error!(#error_message);
+            };
+        )
+    };
+
+    // FIXME(#10): Support type parameters.
+    if !ctx.ast.generics.params.is_empty() {
+        return ctx.error_or_skip(Error::new(
+            Span::call_site(),
+            "unsupported on types with type parameters",
+        ));
+    }
+
+    // Because we don't support generics, we don't need to worry about
+    // special-casing different reprs. So long as there is *some* repr which
+    // guarantees the layout, our `PaddingCheck::Union` guarantees that there is
+    // no padding.
+    let repr = StructUnionRepr::from_attrs(&ctx.ast.attrs)?;
+    if !repr.is_c() && !repr.is_transparent() && !repr.is_packed_1() {
+        return ctx.error_or_skip(Error::new(
+            Span::call_site(),
+            "must be #[repr(C)], #[repr(packed)], or #[repr(transparent)]",
+        ));
+    }
+
+    let impl_block = ImplBlockBuilder::new(ctx, unn, Trait::IntoBytes, FieldBounds::ALL_SELF)
+        .padding_check(PaddingCheck::Union)
+        .build();
+    Ok(quote!(#cfg_compile_error #impl_block))
+}
diff --git a/rust/zerocopy-derive/derive/known_layout.rs b/rust/zerocopy-derive/derive/known_layout.rs
new file mode 100644
index 000000000000..b91b4de0098c
--- /dev/null
+++ b/rust/zerocopy-derive/derive/known_layout.rs
@@ -0,0 +1,348 @@
+use proc_macro2::TokenStream;
+use quote::quote;
+use syn::{parse_quote, Data, Error, Type};
+
+use crate::{
+    repr::StructUnionRepr,
+    util::{Ctx, DataExt, FieldBounds, ImplBlockBuilder, SelfBounds, Trait},
+};
+
+fn derive_known_layout_for_repr_c_struct<'a>(
+    ctx: &'a Ctx,
+    repr: &StructUnionRepr,
+    fields: &[(&'a syn::Visibility, TokenStream, &'a Type)],
+) -> Option<(SelfBounds<'a>, TokenStream, Option<TokenStream>)> {
+    let (trailing_field, leading_fields) = fields.split_last()?;
+
+    let (_vis, trailing_field_name, trailing_field_ty) = trailing_field;
+    let leading_fields_tys = leading_fields.iter().map(|(_vis, _name, ty)| ty);
+
+    let core = ctx.core_path();
+    let repr_align = repr
+        .get_align()
+        .map(|align| {
+            let align = align.t.get();
+            quote!(#core::num::NonZeroUsize::new(#align as usize))
+        })
+        .unwrap_or_else(|| quote!(#core::option::Option::None));
+    let repr_packed = repr
+        .get_packed()
+        .map(|packed| {
+            let packed = packed.get();
+            quote!(#core::num::NonZeroUsize::new(#packed as usize))
+        })
+        .unwrap_or_else(|| quote!(#core::option::Option::None));
+
+    let zerocopy_crate = &ctx.zerocopy_crate;
+    let make_methods = |trailing_field_ty| {
+        quote! {
+            // SAFETY:
+            // - The returned pointer has the same address and provenance as
+            //   `bytes`:
+            //   - The recursive call to `raw_from_ptr_len` preserves both
+            //     address and provenance.
+            //   - The `as` cast preserves both address and provenance.
+            //   - `NonNull::new_unchecked` preserves both address and
+            //     provenance.
+            // - If `Self` is a slice DST, the returned pointer encodes
+            //   `elems` elements in the trailing slice:
+            //   - This is true of the recursive call to `raw_from_ptr_len`.
+            //   - `trailing.as_ptr() as *mut Self` preserves trailing slice
+            //     element count [1].
+            //   - `NonNull::new_unchecked` preserves trailing slice element
+            //     count.
+            //
+            // [1] Per https://doc.rust-lang.org/reference/expressions/operator-expr.html#pointer-to-pointer-cast:
+            //
+            //   `*const T`` / `*mut T` can be cast to `*const U` / `*mut U`
+            //   with the following behavior:
+            //     ...
+            //     - If `T` and `U` are both unsized, the pointer is also
+            //       returned unchanged. In particular, the metadata is
+            //       preserved exactly.
+            //
+            //       For instance, a cast from `*const [T]` to `*const [U]`
+            //       preserves the number of elements. ... The same holds
+            //       for str and any compound type whose unsized tail is a
+            //       slice type, such as struct `Foo(i32, [u8])` or
+            //       `(u64, Foo)`.
+            #[inline(always)]
+            fn raw_from_ptr_len(
+                bytes: #core::ptr::NonNull<u8>,
+                meta: <Self as #zerocopy_crate::KnownLayout>::PointerMetadata,
+            ) -> #core::ptr::NonNull<Self> {
+                let trailing = <#trailing_field_ty as #zerocopy_crate::KnownLayout>::raw_from_ptr_len(bytes, meta);
+                let slf = trailing.as_ptr() as *mut Self;
+                // SAFETY: Constructed from `trailing`, which is non-null.
+                unsafe { #core::ptr::NonNull::new_unchecked(slf) }
+            }
+
+            #[inline(always)]
+            fn pointer_to_metadata(ptr: *mut Self) -> <Self as #zerocopy_crate::KnownLayout>::PointerMetadata {
+                <#trailing_field_ty>::pointer_to_metadata(ptr as *mut _)
+            }
+        }
+    };
+
+    let inner_extras = {
+        let leading_fields_tys = leading_fields_tys.clone();
+        let methods = make_methods(*trailing_field_ty);
+        let (_, ty_generics, _) = ctx.ast.generics.split_for_impl();
+
+        quote!(
+            type PointerMetadata = <#trailing_field_ty as #zerocopy_crate::KnownLayout>::PointerMetadata;
+
+            type MaybeUninit = __ZerocopyKnownLayoutMaybeUninit #ty_generics;
+
+            // SAFETY: `LAYOUT` accurately describes the layout of `Self`.
+            // The documentation of `DstLayout::for_repr_c_struct` vows that
+            // invocations in this manner will accurately describe a type,
+            // so long as:
+            //
+            //  - that type is `repr(C)`,
+            //  - its fields are enumerated in the order they appear,
+            //  - the presence of `repr_align` and `repr_packed` are
+            //    correctly accounted for.
+            //
+            // We respect all three of these preconditions here. This
+            // expansion is only used if `is_repr_c_struct`, we enumerate
+            // the fields in order, and we extract the values of `align(N)`
+            // and `packed(N)`.
+            const LAYOUT: #zerocopy_crate::DstLayout = #zerocopy_crate::DstLayout::for_repr_c_struct(
+                #repr_align,
+                #repr_packed,
+                &[
+                    #(#zerocopy_crate::DstLayout::for_type::<#leading_fields_tys>(),)*
+                    <#trailing_field_ty as #zerocopy_crate::KnownLayout>::LAYOUT
+                ],
+            );
+
+            #methods
+        )
+    };
+
+    let outer_extras = {
+        let ident = &ctx.ast.ident;
+        let vis = &ctx.ast.vis;
+        let params = &ctx.ast.generics.params;
+        let (impl_generics, ty_generics, where_clause) = ctx.ast.generics.split_for_impl();
+
+        let predicates = if let Some(where_clause) = where_clause {
+            where_clause.predicates.clone()
+        } else {
+            Default::default()
+        };
+
+        // Generate a valid ident for a type-level handle to a field of a
+        // given `name`.
+        let field_index = |name: &TokenStream| ident!(("__Zerocopy_Field_{}", name), ident.span());
+
+        let field_indices: Vec<_> =
+            fields.iter().map(|(_vis, name, _ty)| field_index(name)).collect();
+
+        // Define the collection of type-level field handles.
+        let field_defs = field_indices.iter().zip(fields).map(|(idx, (vis, _, _))| {
+            quote! {
+                #vis struct #idx;
+            }
+        });
+
+        let field_impls = field_indices.iter().zip(fields).map(|(idx, (_, _, ty))| quote! {
+            // SAFETY: `#ty` is the type of `#ident`'s field at `#idx`.
+            //
+            // We implement `Field` for each field of the struct to create a
+            // projection from the field index to its type. This allows us
+            // to refer to the field's type in a way that respects `Self`
+            // hygiene. If we just copy-pasted the tokens of `#ty`, we
+            // would not respect `Self` hygiene, as `Self` would refer to
+            // the helper struct we are generating, not the derive target
+            // type.
+            unsafe impl #impl_generics #zerocopy_crate::util::macro_util::Field<#idx> for #ident #ty_generics
+            where
+                #predicates
+            {
+                type Type = #ty;
+            }
+        });
+
+        let trailing_field_index = field_index(trailing_field_name);
+        let leading_field_indices =
+            leading_fields.iter().map(|(_vis, name, _ty)| field_index(name));
+
+        // We use `Field` to project the type of the trailing field. This is
+        // required to ensure that if the field type uses `Self`, it
+        // resolves to the derive target type, not the helper struct we are
+        // generating.
+        let trailing_field_ty = quote! {
+            <#ident #ty_generics as
+                #zerocopy_crate::util::macro_util::Field<#trailing_field_index>
+            >::Type
+        };
+
+        let methods = make_methods(&parse_quote! {
+            <#trailing_field_ty as #zerocopy_crate::KnownLayout>::MaybeUninit
+        });
+
+        let core = ctx.core_path();
+
+        quote! {
+            #(#field_defs)*
+
+            #(#field_impls)*
+
+            // SAFETY: This has the same layout as the derive target type,
+            // except that it admits uninit bytes. This is ensured by using
+            // the same repr as the target type, and by using field types
+            // which have the same layout as the target type's fields,
+            // except that they admit uninit bytes. We indirect through
+            // `Field` to ensure that occurrences of `Self` resolve to
+            // `#ty`, not `__ZerocopyKnownLayoutMaybeUninit` (see #2116).
+            #repr
+            #[doc(hidden)]
+            #vis struct __ZerocopyKnownLayoutMaybeUninit<#params> (
+                #(#core::mem::MaybeUninit<
+                    <#ident #ty_generics as
+                        #zerocopy_crate::util::macro_util::Field<#leading_field_indices>
+                    >::Type
+                >,)*
+                // NOTE(#2302): We wrap in `ManuallyDrop` here in case the
+                // type we're operating on is both generic and
+                // `repr(packed)`. In that case, Rust needs to know that the
+                // type is *either* `Sized` or has a trivial `Drop`.
+                // `ManuallyDrop` has a trivial `Drop`, and so satisfies
+                // this requirement.
+                #core::mem::ManuallyDrop<
+                    <#trailing_field_ty as #zerocopy_crate::KnownLayout>::MaybeUninit
+                >
+            )
+            where
+                #trailing_field_ty: #zerocopy_crate::KnownLayout,
+                #predicates;
+
+            // SAFETY: We largely defer to the `KnownLayout` implementation
+            // on the derive target type (both by using the same tokens, and
+            // by deferring to impl via type-level indirection). This is
+            // sound, since `__ZerocopyKnownLayoutMaybeUninit` is guaranteed
+            // to have the same layout as the derive target type, except
+            // that `__ZerocopyKnownLayoutMaybeUninit` admits uninit bytes.
+            unsafe impl #impl_generics #zerocopy_crate::KnownLayout for __ZerocopyKnownLayoutMaybeUninit #ty_generics
+            where
+                #trailing_field_ty: #zerocopy_crate::KnownLayout,
+                #predicates
+            {
+                fn only_derive_is_allowed_to_implement_this_trait() {}
+
+                type PointerMetadata = <#ident #ty_generics as #zerocopy_crate::KnownLayout>::PointerMetadata;
+
+                type MaybeUninit = Self;
+
+                const LAYOUT: #zerocopy_crate::DstLayout = <#ident #ty_generics as #zerocopy_crate::KnownLayout>::LAYOUT;
+
+                #methods
+            }
+        }
+    };
+
+    Some((SelfBounds::None, inner_extras, Some(outer_extras)))
+}
+
+pub(crate) fn derive(ctx: &Ctx, _top_level: Trait) -> Result<TokenStream, Error> {
+    // If this is a `repr(C)` struct, then `c_struct_repr` contains the entire
+    // `repr` attribute.
+    let c_struct_repr = match &ctx.ast.data {
+        Data::Struct(..) => {
+            let repr = StructUnionRepr::from_attrs(&ctx.ast.attrs)?;
+            if repr.is_c() {
+                Some(repr)
+            } else {
+                None
+            }
+        }
+        Data::Enum(..) | Data::Union(..) => None,
+    };
+
+    let fields = ctx.ast.data.fields();
+
+    let (self_bounds, inner_extras, outer_extras) = c_struct_repr
+        .as_ref()
+        .and_then(|repr| {
+            derive_known_layout_for_repr_c_struct(ctx, repr, &fields)
+        })
+        .unwrap_or_else(|| {
+            let zerocopy_crate = &ctx.zerocopy_crate;
+            let core = ctx.core_path();
+
+            // For enums, unions, and non-`repr(C)` structs, we require that
+            // `Self` is sized, and as a result don't need to reason about the
+            // internals of the type.
+            (
+                SelfBounds::SIZED,
+                quote!(
+                    type PointerMetadata = ();
+                    type MaybeUninit =
+                        #core::mem::MaybeUninit<Self>;
+
+                    // SAFETY: `LAYOUT` is guaranteed to accurately describe the
+                    // layout of `Self`, because that is the documented safety
+                    // contract of `DstLayout::for_type`.
+                    const LAYOUT: #zerocopy_crate::DstLayout = #zerocopy_crate::DstLayout::for_type::<Self>();
+
+                    // SAFETY: `.cast` preserves address and provenance.
+                    //
+                    // FIXME(#429): Add documentation to `.cast` that promises that
+                    // it preserves provenance.
+                    #[inline(always)]
+                    fn raw_from_ptr_len(bytes: #core::ptr::NonNull<u8>, _meta: ()) -> #core::ptr::NonNull<Self> {
+                        bytes.cast::<Self>()
+                    }
+
+                    #[inline(always)]
+                    fn pointer_to_metadata(_ptr: *mut Self) -> () {}
+                ),
+                None,
+            )
+        });
+    Ok(match &ctx.ast.data {
+        Data::Struct(strct) => {
+            let require_trait_bound_on_field_types =
+                if matches!(self_bounds, SelfBounds::All(&[Trait::Sized])) {
+                    FieldBounds::None
+                } else {
+                    FieldBounds::TRAILING_SELF
+                };
+
+            // A bound on the trailing field is required, since structs are
+            // unsized if their trailing field is unsized. Reflecting the layout
+            // of an usized trailing field requires that the field is
+            // `KnownLayout`.
+            ImplBlockBuilder::new(
+                ctx,
+                strct,
+                Trait::KnownLayout,
+                require_trait_bound_on_field_types,
+            )
+            .self_type_trait_bounds(self_bounds)
+            .inner_extras(inner_extras)
+            .outer_extras(outer_extras)
+            .build()
+        }
+        Data::Enum(enm) => {
+            // A bound on the trailing field is not required, since enums cannot
+            // currently be unsized.
+            ImplBlockBuilder::new(ctx, enm, Trait::KnownLayout, FieldBounds::None)
+                .self_type_trait_bounds(SelfBounds::SIZED)
+                .inner_extras(inner_extras)
+                .outer_extras(outer_extras)
+                .build()
+        }
+        Data::Union(unn) => {
+            // A bound on the trailing field is not required, since unions
+            // cannot currently be unsized.
+            ImplBlockBuilder::new(ctx, unn, Trait::KnownLayout, FieldBounds::None)
+                .self_type_trait_bounds(SelfBounds::SIZED)
+                .inner_extras(inner_extras)
+                .outer_extras(outer_extras)
+                .build()
+        }
+    })
+}
diff --git a/rust/zerocopy-derive/derive/mod.rs b/rust/zerocopy-derive/derive/mod.rs
new file mode 100644
index 000000000000..a3d066ed2b4d
--- /dev/null
+++ b/rust/zerocopy-derive/derive/mod.rs
@@ -0,0 +1,130 @@
+pub mod from_bytes;
+pub mod into_bytes;
+pub mod known_layout;
+pub mod try_from_bytes;
+pub mod unaligned;
+
+use proc_macro2::{Span, TokenStream};
+use quote::quote;
+use syn::{Data, Error};
+
+use crate::{
+    repr::StructUnionRepr,
+    util::{Ctx, DataExt, FieldBounds, ImplBlockBuilder, Trait},
+};
+
+pub(crate) fn derive_immutable(ctx: &Ctx, _top_level: Trait) -> TokenStream {
+    match &ctx.ast.data {
+        Data::Struct(strct) => {
+            ImplBlockBuilder::new(ctx, strct, Trait::Immutable, FieldBounds::ALL_SELF).build()
+        }
+        Data::Enum(enm) => {
+            ImplBlockBuilder::new(ctx, enm, Trait::Immutable, FieldBounds::ALL_SELF).build()
+        }
+        Data::Union(unn) => {
+            ImplBlockBuilder::new(ctx, unn, Trait::Immutable, FieldBounds::ALL_SELF).build()
+        }
+    }
+}
+
+pub(crate) fn derive_hash(ctx: &Ctx, _top_level: Trait) -> Result<TokenStream, Error> {
+    // This doesn't delegate to `impl_block` because `impl_block` assumes it is
+    // deriving a `zerocopy`-defined trait, and these trait impls share a common
+    // shape that `Hash` does not. In particular, `zerocopy` traits contain a
+    // method that only `zerocopy_derive` macros are supposed to implement, and
+    // `impl_block` generating this trait method is incompatible with `Hash`.
+    let type_ident = &ctx.ast.ident;
+    let (impl_generics, ty_generics, where_clause) = ctx.ast.generics.split_for_impl();
+    let where_predicates = where_clause.map(|clause| &clause.predicates);
+    let zerocopy_crate = &ctx.zerocopy_crate;
+    let core = ctx.core_path();
+    Ok(quote! {
+        impl #impl_generics #core::hash::Hash for #type_ident #ty_generics
+        where
+            Self: #zerocopy_crate::IntoBytes + #zerocopy_crate::Immutable,
+            #where_predicates
+        {
+            fn hash<H: #core::hash::Hasher>(&self, state: &mut H) {
+                #core::hash::Hasher::write(state, #zerocopy_crate::IntoBytes::as_bytes(self))
+            }
+
+            fn hash_slice<H: #core::hash::Hasher>(data: &[Self], state: &mut H) {
+                #core::hash::Hasher::write(state, #zerocopy_crate::IntoBytes::as_bytes(data))
+            }
+        }
+    })
+}
+
+pub(crate) fn derive_eq(ctx: &Ctx, _top_level: Trait) -> Result<TokenStream, Error> {
+    // This doesn't delegate to `impl_block` because `impl_block` assumes it is
+    // deriving a `zerocopy`-defined trait, and these trait impls share a common
+    // shape that `Eq` does not. In particular, `zerocopy` traits contain a
+    // method that only `zerocopy_derive` macros are supposed to implement, and
+    // `impl_block` generating this trait method is incompatible with `Eq`.
+    let type_ident = &ctx.ast.ident;
+    let (impl_generics, ty_generics, where_clause) = ctx.ast.generics.split_for_impl();
+    let where_predicates = where_clause.map(|clause| &clause.predicates);
+    let zerocopy_crate = &ctx.zerocopy_crate;
+    let core = ctx.core_path();
+    Ok(quote! {
+        impl #impl_generics #core::cmp::PartialEq for #type_ident #ty_generics
+        where
+            Self: #zerocopy_crate::IntoBytes + #zerocopy_crate::Immutable,
+            #where_predicates
+        {
+            fn eq(&self, other: &Self) -> bool {
+                #core::cmp::PartialEq::eq(
+                    #zerocopy_crate::IntoBytes::as_bytes(self),
+                    #zerocopy_crate::IntoBytes::as_bytes(other),
+                )
+            }
+        }
+
+        impl #impl_generics #core::cmp::Eq for #type_ident #ty_generics
+        where
+            Self: #zerocopy_crate::IntoBytes + #zerocopy_crate::Immutable,
+            #where_predicates
+        {
+        }
+    })
+}
+
+pub(crate) fn derive_split_at(ctx: &Ctx, _top_level: Trait) -> Result<TokenStream, Error> {
+    let repr = StructUnionRepr::from_attrs(&ctx.ast.attrs)?;
+
+    match &ctx.ast.data {
+        Data::Struct(_) => {}
+        Data::Enum(_) | Data::Union(_) => {
+            return Err(Error::new(Span::call_site(), "can only be applied to structs"));
+        }
+    };
+
+    if repr.get_packed().is_some() {
+        return Err(Error::new(Span::call_site(), "must not have #[repr(packed)] attribute"));
+    }
+
+    if !(repr.is_c() || repr.is_transparent()) {
+        return Err(Error::new(
+            Span::call_site(),
+            "must have #[repr(C)] or #[repr(transparent)] in order to guarantee this type's layout is splitable",
+        ));
+    }
+
+    let fields = ctx.ast.data.fields();
+    let trailing_field = if let Some(((_, _, trailing_field), _)) = fields.split_last() {
+        trailing_field
+    } else {
+        return Err(Error::new(Span::call_site(), "must at least one field"));
+    };
+
+    let zerocopy_crate = &ctx.zerocopy_crate;
+    // SAFETY: `#ty`, per the above checks, is `repr(C)` or `repr(transparent)`
+    // and is not packed; its trailing field is guaranteed to be well-aligned
+    // for its type. By invariant on `FieldBounds::TRAILING_SELF`, the trailing
+    // slice of the trailing field is also well-aligned for its type.
+    Ok(ImplBlockBuilder::new(ctx, &ctx.ast.data, Trait::SplitAt, FieldBounds::TRAILING_SELF)
+        .inner_extras(quote! {
+            type Elem = <#trailing_field as #zerocopy_crate::SplitAt>::Elem;
+        })
+        .build())
+}
diff --git a/rust/zerocopy-derive/derive/try_from_bytes.rs b/rust/zerocopy-derive/derive/try_from_bytes.rs
new file mode 100644
index 000000000000..4e36ab40bcf8
--- /dev/null
+++ b/rust/zerocopy-derive/derive/try_from_bytes.rs
@@ -0,0 +1,763 @@
+use proc_macro2::TokenStream;
+use quote::quote;
+use syn::{
+    parse_quote, spanned::Spanned as _, Data, DataEnum, DataStruct, DataUnion, DeriveInput, Error,
+    Expr, Fields, Ident, Index, Type,
+};
+
+use crate::{
+    repr::{EnumRepr, StructUnionRepr},
+    util::{
+        const_block, enum_size_from_repr, generate_tag_enum, Ctx, DataExt, FieldBounds,
+        ImplBlockBuilder, Trait, TraitBound,
+    },
+};
+fn tag_ident(variant_ident: &Ident) -> Ident {
+    ident!(("___ZEROCOPY_TAG_{}", variant_ident), variant_ident.span())
+}
+
+/// Generates a constant for the tag associated with each variant of the enum.
+/// When we match on the enum's tag, each arm matches one of these constants. We
+/// have to use constants here because:
+///
+/// - The type that we're matching on is not the type of the tag, it's an
+///   integer of the same size as the tag type and with the same bit patterns.
+/// - We can't read the enum tag as an enum because the bytes may not represent
+///   a valid variant.
+/// - Patterns do not currently support const expressions, so we have to assign
+///   these constants to names rather than use them inline in the `match`
+///   statement.
+fn generate_tag_consts(data: &DataEnum) -> TokenStream {
+    let tags = data.variants.iter().map(|v| {
+        let variant_ident = &v.ident;
+        let tag_ident = tag_ident(variant_ident);
+
+        quote! {
+            // This casts the enum variant to its discriminant, and then
+            // converts the discriminant to the target integral type via a
+            // numeric cast [1].
+            //
+            // Because these are the same size, this is defined to be a no-op
+            // and therefore is a lossless conversion [2].
+            //
+            // [1] Per https://doc.rust-lang.org/1.81.0/reference/expressions/operator-expr.html#enum-cast:
+            //
+            //   Casts an enum to its discriminant.
+            //
+            // [2] Per https://doc.rust-lang.org/1.81.0/reference/expressions/operator-expr.html#numeric-cast:
+            //
+            //   Casting between two integers of the same size (e.g. i32 -> u32)
+            //   is a no-op.
+            const #tag_ident: ___ZerocopyTagPrimitive =
+                ___ZerocopyTag::#variant_ident as ___ZerocopyTagPrimitive;
+        }
+    });
+
+    quote! {
+        #(#tags)*
+    }
+}
+
+fn variant_struct_ident(variant_ident: &Ident) -> Ident {
+    ident!(("___ZerocopyVariantStruct_{}", variant_ident), variant_ident.span())
+}
+
+/// Generates variant structs for the given enum variant.
+///
+/// These are structs associated with each variant of an enum. They are
+/// `repr(C)` tuple structs with the same fields as the variant after a
+/// `MaybeUninit<___ZerocopyInnerTag>`.
+///
+/// In order to unify the generated types for `repr(C)` and `repr(int)` enums,
+/// we use a "fused" representation with fields for both an inner tag and an
+/// outer tag. Depending on the repr, we will set one of these tags to the tag
+/// type and the other to `()`. This lets us generate the same code but put the
+/// tags in different locations.
+fn generate_variant_structs(ctx: &Ctx, data: &DataEnum) -> TokenStream {
+    let (impl_generics, ty_generics, where_clause) = ctx.ast.generics.split_for_impl();
+
+    let enum_name = &ctx.ast.ident;
+
+    // All variant structs have a `PhantomData<MyEnum<...>>` field because we
+    // don't know which generic parameters each variant will use, and unused
+    // generic parameters are a compile error.
+    let core = ctx.core_path();
+    let phantom_ty = quote! {
+        #core::marker::PhantomData<#enum_name #ty_generics>
+    };
+
+    let variant_structs = data.variants.iter().filter_map(|variant| {
+        // We don't generate variant structs for unit variants because we only
+        // need to check the tag. This helps cut down our generated code a bit.
+        if matches!(variant.fields, Fields::Unit) {
+            return None;
+        }
+
+        let variant_struct_ident = variant_struct_ident(&variant.ident);
+        let field_types = variant.fields.iter().map(|f| &f.ty);
+
+        let variant_struct = parse_quote! {
+            #[repr(C)]
+            struct #variant_struct_ident #impl_generics (
+                #core::mem::MaybeUninit<___ZerocopyInnerTag>,
+                #(#field_types,)*
+                #phantom_ty,
+            ) #where_clause;
+        };
+
+        // We do this rather than emitting `#[derive(::zerocopy::TryFromBytes)]`
+        // because that is not hygienic, and this is also more performant.
+        let try_from_bytes_impl =
+            derive_try_from_bytes(&ctx.with_input(&variant_struct), Trait::TryFromBytes)
+                .expect("derive_try_from_bytes should not fail on synthesized type");
+
+        Some(quote! {
+            #variant_struct
+            #try_from_bytes_impl
+        })
+    });
+
+    quote! {
+        #(#variant_structs)*
+    }
+}
+
+fn variants_union_field_ident(ident: &Ident) -> Ident {
+    // Field names are prefixed with `__field_` to prevent name collision
+    // with the `__nonempty` field.
+    ident!(("__field_{}", ident), ident.span())
+}
+
+fn generate_variants_union(ctx: &Ctx, data: &DataEnum) -> TokenStream {
+    let generics = &ctx.ast.generics;
+    let (_, ty_generics, _) = generics.split_for_impl();
+
+    let fields = data.variants.iter().filter_map(|variant| {
+        // We don't generate variant structs for unit variants because we only
+        // need to check the tag. This helps cut down our generated code a bit.
+        if matches!(variant.fields, Fields::Unit) {
+            return None;
+        }
+
+        let field_name = variants_union_field_ident(&variant.ident);
+        let variant_struct_ident = variant_struct_ident(&variant.ident);
+
+        let core = ctx.core_path();
+        Some(quote! {
+            #field_name: #core::mem::ManuallyDrop<#variant_struct_ident #ty_generics>,
+        })
+    });
+
+    let variants_union = parse_quote! {
+        #[repr(C)]
+        union ___ZerocopyVariants #generics {
+            #(#fields)*
+            // Enums can have variants with no fields, but unions must
+            // have at least one field. So we just add a trailing unit
+            // to ensure that this union always has at least one field.
+            // Because this union is `repr(C)`, this unit type does not
+            // affect the layout.
+            __nonempty: (),
+        }
+    };
+
+    let has_field =
+        derive_has_field_struct_union(&ctx.with_input(&variants_union), &variants_union.data);
+
+    quote! {
+        #variants_union
+        #has_field
+    }
+}
+
+/// Generates an implementation of `is_bit_valid` for an arbitrary enum.
+///
+/// The general process is:
+///
+/// 1. Generate a tag enum. This is an enum with the same repr, variants, and
+///    corresponding discriminants as the original enum, but without any fields
+///    on the variants. This gives us access to an enum where the variants have
+///    the same discriminants as the one we're writing `is_bit_valid` for.
+/// 2. Make constants from the variants of the tag enum. We need these because
+///    we can't put const exprs in match arms.
+/// 3. Generate variant structs. These are structs which have the same fields as
+///    each variant of the enum, and are `#[repr(C)]` with an optional "inner
+///    tag".
+/// 4. Generate a variants union, with one field for each variant struct type.
+/// 5. And finally, our raw enum is a `#[repr(C)]` struct of an "outer tag" and
+///    the variants union.
+///
+/// See these reference links for fully-worked example decompositions.
+///
+/// - `repr(C)`: <https://doc.rust-lang.org/reference/type-layout.html#reprc-enums-with-fields>
+/// - `repr(int)`: <https://doc.rust-lang.org/reference/type-layout.html#primitive-representation-of-enums-with-fields>
+/// - `repr(C, int)`: <https://doc.rust-lang.org/reference/type-layout.html#combining-primitive-representations-of-enums-with-fields-and-reprc>
+pub(crate) fn derive_is_bit_valid(
+    ctx: &Ctx,
+    data: &DataEnum,
+    repr: &EnumRepr,
+) -> Result<TokenStream, Error> {
+    let trait_path = Trait::TryFromBytes.crate_path(ctx);
+    let tag_enum = generate_tag_enum(ctx, repr, data);
+    let tag_consts = generate_tag_consts(data);
+
+    let (outer_tag_type, inner_tag_type) = if repr.is_c() {
+        (quote! { ___ZerocopyTag }, quote! { () })
+    } else if repr.is_primitive() {
+        (quote! { () }, quote! { ___ZerocopyTag })
+    } else {
+        return Err(Error::new(
+            ctx.ast.span(),
+            "must have #[repr(C)] or #[repr(Int)] attribute in order to guarantee this type's memory layout",
+        ));
+    };
+
+    let variant_structs = generate_variant_structs(ctx, data);
+    let variants_union = generate_variants_union(ctx, data);
+
+    let (impl_generics, ty_generics, where_clause) = ctx.ast.generics.split_for_impl();
+
+    let zerocopy_crate = &ctx.zerocopy_crate;
+    let has_tag = ImplBlockBuilder::new(ctx, data, Trait::HasTag, FieldBounds::None)
+        .inner_extras(quote! {
+            type Tag = ___ZerocopyTag;
+            type ProjectToTag = #zerocopy_crate::pointer::cast::CastSized;
+        })
+        .build();
+    let has_fields = data.variants().into_iter().flat_map(|(variant, fields)| {
+        let variant_ident = &variant.unwrap().ident;
+        let variants_union_field_ident = variants_union_field_ident(variant_ident);
+        let field: Box<syn::Type> = parse_quote!(());
+        fields.into_iter().enumerate().map(move |(idx, (vis, ident, ty))| {
+            // Rust does not presently support explicit visibility modifiers on
+            // enum fields, but we guard against the possibility to ensure this
+            // derive remains sound.
+            assert!(matches!(vis, syn::Visibility::Inherited));
+            let variant_struct_field_index = Index::from(idx + 1);
+            let (_, ty_generics, _) = ctx.ast.generics.split_for_impl();
+            let has_field_trait = Trait::HasField {
+                variant_id: parse_quote!({ #zerocopy_crate::ident_id!(#variant_ident) }),
+                // Since Rust does not presently support explicit visibility
+                // modifiers on enum fields, any public type is suitable here;
+                // we use `()`.
+                field: field.clone(),
+                field_id: parse_quote!({ #zerocopy_crate::ident_id!(#ident) }),
+            };
+            let has_field_path = has_field_trait.crate_path(ctx);
+            let has_field = ImplBlockBuilder::new(
+                ctx,
+                data,
+                has_field_trait,
+                FieldBounds::None,
+            )
+            .inner_extras(quote! {
+                type Type = #ty;
+
+                #[inline(always)]
+                fn project(slf: #zerocopy_crate::pointer::PtrInner<'_, Self>) -> *mut <Self as #has_field_path>::Type {
+                    use #zerocopy_crate::pointer::cast::{CastSized, Projection};
+
+                    slf.project::<___ZerocopyRawEnum #ty_generics, CastSized>()
+                        .project::<_, Projection<_, { #zerocopy_crate::STRUCT_VARIANT_ID }, { #zerocopy_crate::ident_id!(variants) }>>()
+                        .project::<_, Projection<_, { #zerocopy_crate::REPR_C_UNION_VARIANT_ID }, { #zerocopy_crate::ident_id!(#variants_union_field_ident) }>>()
+                        .project::<_, Projection<_, { #zerocopy_crate::STRUCT_VARIANT_ID }, { #zerocopy_crate::ident_id!(value) }>>()
+                        .project::<_, Projection<_, { #zerocopy_crate::STRUCT_VARIANT_ID }, { #zerocopy_crate::ident_id!(#variant_struct_field_index) }>>()
+                        .as_ptr()
+                }
+            })
+            .build();
+
+            let project = ImplBlockBuilder::new(
+                ctx,
+                data,
+                Trait::ProjectField {
+                    variant_id: parse_quote!({ #zerocopy_crate::ident_id!(#variant_ident) }),
+                    // Since Rust does not presently support explicit visibility
+                    // modifiers on enum fields, any public type is suitable
+                    // here; we use `()`.
+                    field: field.clone(),
+                    field_id: parse_quote!({ #zerocopy_crate::ident_id!(#ident) }),
+                    invariants: parse_quote!((Aliasing, Alignment, #zerocopy_crate::invariant::Initialized)),
+                },
+                FieldBounds::None,
+            )
+            .param_extras(vec![
+                parse_quote!(Aliasing: #zerocopy_crate::invariant::Aliasing),
+                parse_quote!(Alignment: #zerocopy_crate::invariant::Alignment),
+            ])
+            .inner_extras(quote! {
+                type Error = #zerocopy_crate::util::macro_util::core_reexport::convert::Infallible;
+                type Invariants = (Aliasing, Alignment, #zerocopy_crate::invariant::Initialized);
+            })
+            .build();
+
+            quote! {
+                #has_field
+                #project
+            }
+        })
+    });
+
+    let core = ctx.core_path();
+    let match_arms = data.variants.iter().map(|variant| {
+        let tag_ident = tag_ident(&variant.ident);
+        let variant_struct_ident = variant_struct_ident(&variant.ident);
+        let variants_union_field_ident = variants_union_field_ident(&variant.ident);
+
+        if matches!(variant.fields, Fields::Unit) {
+            // Unit variants don't need any further validation beyond checking
+            // the tag.
+            quote! {
+                #tag_ident => true
+            }
+        } else {
+            quote! {
+                #tag_ident => {
+                    // SAFETY: Since we know that the tag is `#tag_ident`, we
+                    // know that no other `&`s exist which refer to this enum
+                    // as any other variant.
+                    let variant_md = variants.cast::<
+                        _,
+                        #zerocopy_crate::pointer::cast::Projection<
+                            // #zerocopy_crate::ReadOnly<_>,
+                            _,
+                            { #zerocopy_crate::REPR_C_UNION_VARIANT_ID },
+                            { #zerocopy_crate::ident_id!(#variants_union_field_ident) }
+                        >,
+                        _
+                    >();
+                    let variant = variant_md.cast::<
+                        #zerocopy_crate::ReadOnly<#variant_struct_ident #ty_generics>,
+                        #zerocopy_crate::pointer::cast::CastSized,
+                        (#zerocopy_crate::pointer::BecauseRead, _)
+                    >();
+                    <
+                        #variant_struct_ident #ty_generics as #trait_path
+                    >::is_bit_valid(variant)
+                }
+            }
+        }
+    });
+
+    let generics = &ctx.ast.generics;
+    let raw_enum: DeriveInput = parse_quote! {
+        #[repr(C)]
+        struct ___ZerocopyRawEnum #generics {
+            tag: ___ZerocopyOuterTag,
+            variants: ___ZerocopyVariants #ty_generics,
+        }
+    };
+
+    let self_ident = &ctx.ast.ident;
+    let invariants_eq_impl = quote! {
+        // SAFETY: `___ZerocopyRawEnum` is designed to have the same layout,
+        // validity, and invariants as `Self`.
+        unsafe impl #impl_generics #zerocopy_crate::pointer::InvariantsEq<___ZerocopyRawEnum #ty_generics> for #self_ident #ty_generics #where_clause {}
+    };
+
+    let raw_enum_projections =
+        derive_has_field_struct_union(&ctx.with_input(&raw_enum), &raw_enum.data);
+
+    let raw_enum = quote! {
+        #raw_enum
+        #invariants_eq_impl
+        #raw_enum_projections
+    };
+
+    Ok(quote! {
+        // SAFETY: We use `is_bit_valid` to validate that the bit pattern of the
+        // enum's tag corresponds to one of the enum's discriminants. Then, we
+        // check the bit validity of each field of the corresponding variant.
+        // Thus, this is a sound implementation of `is_bit_valid`.
+        #[inline]
+        fn is_bit_valid<___ZcAlignment>(
+            mut candidate: #zerocopy_crate::Maybe<'_, Self, ___ZcAlignment>,
+        ) -> #core::primitive::bool
+        where
+            ___ZcAlignment: #zerocopy_crate::invariant::Alignment,
+        {
+            #tag_enum
+
+            type ___ZerocopyTagPrimitive = #zerocopy_crate::util::macro_util::SizeToTag<
+                { #core::mem::size_of::<___ZerocopyTag>() },
+            >;
+
+            #tag_consts
+
+            type ___ZerocopyOuterTag = #outer_tag_type;
+            type ___ZerocopyInnerTag = #inner_tag_type;
+
+            #variant_structs
+
+            #variants_union
+
+            #raw_enum
+
+            #has_tag
+
+            #(#has_fields)*
+
+            let tag = {
+                // SAFETY:
+                // - The provided cast addresses a subset of the bytes addressed
+                //   by `candidate` because it addresses the starting tag of the
+                //   enum.
+                // - Because the pointer is cast from `candidate`, it has the
+                //   same provenance as it.
+                // - There are no `UnsafeCell`s in the tag because it is a
+                //   primitive integer.
+                // - `tag_ptr` is casted from `candidate`, whose referent is
+                //   `Initialized`. Since we have not written uninitialized
+                //   bytes into the referent, `tag_ptr` is also `Initialized`.
+                //
+                // FIXME(#2874): Revise this to a `cast` once `candidate`
+                // references a `ReadOnly<Self>`.
+                let tag_ptr = unsafe {
+                    candidate.reborrow().project_transmute_unchecked::<
+                        _,
+                        #zerocopy_crate::invariant::Initialized,
+                        #zerocopy_crate::pointer::cast::CastSized
+                    >()
+                };
+                tag_ptr.recall_validity::<_, (_, (_, _))>().read::<#zerocopy_crate::BecauseImmutable>()
+            };
+
+            let mut raw_enum = candidate.cast::<
+                #zerocopy_crate::ReadOnly<___ZerocopyRawEnum #ty_generics>,
+                #zerocopy_crate::pointer::cast::CastSized,
+                (#zerocopy_crate::pointer::BecauseRead, _)
+            >();
+
+            let variants = #zerocopy_crate::into_inner!(raw_enum.project::<
+                _,
+                { #zerocopy_crate::STRUCT_VARIANT_ID },
+                { #zerocopy_crate::ident_id!(variants) }
+            >());
+
+            match tag {
+                #(#match_arms,)*
+                _ => false,
+            }
+        }
+    })
+}
+pub(crate) fn derive_try_from_bytes(ctx: &Ctx, top_level: Trait) -> Result<TokenStream, Error> {
+    match &ctx.ast.data {
+        Data::Struct(strct) => derive_try_from_bytes_struct(ctx, strct, top_level),
+        Data::Enum(enm) => derive_try_from_bytes_enum(ctx, enm, top_level),
+        Data::Union(unn) => Ok(derive_try_from_bytes_union(ctx, unn, top_level)),
+    }
+}
+fn derive_has_field_struct_union(ctx: &Ctx, data: &dyn DataExt) -> TokenStream {
+    let fields = ctx.ast.data.fields();
+    if fields.is_empty() {
+        return quote! {};
+    }
+
+    let field_tokens = fields.iter().map(|(vis, ident, _)| {
+        let ident = ident!(("ẕ{}", ident), ident.span());
+        quote!(
+            #vis enum #ident {}
+        )
+    });
+
+    let zerocopy_crate = &ctx.zerocopy_crate;
+    let variant_id: Box<Expr> = match &ctx.ast.data {
+        Data::Struct(_) => parse_quote!({ #zerocopy_crate::STRUCT_VARIANT_ID }),
+        Data::Union(_) => {
+            let is_repr_c = StructUnionRepr::from_attrs(&ctx.ast.attrs)
+                .map(|repr| repr.is_c())
+                .unwrap_or(false);
+            if is_repr_c {
+                parse_quote!({ #zerocopy_crate::REPR_C_UNION_VARIANT_ID })
+            } else {
+                parse_quote!({ #zerocopy_crate::UNION_VARIANT_ID })
+            }
+        }
+        _ => unreachable!(),
+    };
+
+    let core = ctx.core_path();
+    let has_tag = ImplBlockBuilder::new(ctx, data, Trait::HasTag, FieldBounds::None)
+        .inner_extras(quote! {
+            type Tag = ();
+            type ProjectToTag = #zerocopy_crate::pointer::cast::CastToUnit;
+        })
+        .build();
+    let has_fields = fields.iter().map(move |(_, ident, ty)| {
+        let field_token = ident!(("ẕ{}", ident), ident.span());
+        let field: Box<Type> = parse_quote!(#field_token);
+        let field_id: Box<Expr> = parse_quote!({ #zerocopy_crate::ident_id!(#ident) });
+        let has_field_trait = Trait::HasField {
+                variant_id: variant_id.clone(),
+                field: field.clone(),
+                field_id: field_id.clone(),
+            };
+            let has_field_path = has_field_trait.crate_path(ctx);
+            ImplBlockBuilder::new(
+                ctx,
+                data,
+                has_field_trait,
+                FieldBounds::None,
+            )
+            .inner_extras(quote! {
+                type Type = #ty;
+
+                #[inline(always)]
+                fn project(slf: #zerocopy_crate::pointer::PtrInner<'_, Self>) -> *mut <Self as #has_field_path>::Type {
+                    let slf = slf.as_ptr();
+                    // SAFETY: By invariant on `PtrInner`, `slf` is a non-null
+                    // pointer whose referent is zero-sized or lives in a valid
+                    // allocation. Since `#ident` is a struct or union field of
+                    // `Self`, this projection preserves or shrinks the referent
+                    // size, and so the resulting referent also fits in the same
+                    // allocation.
+                    unsafe { #core::ptr::addr_of_mut!((*slf).#ident) }
+                }
+            }).outer_extras(if matches!(&ctx.ast.data, Data::Struct(..)) {
+            let fields_preserve_alignment = StructUnionRepr::from_attrs(&ctx.ast.attrs)
+                .map(|repr| repr.get_packed().is_none())
+                .unwrap();
+            let alignment = if fields_preserve_alignment {
+                quote! { Alignment }
+            } else {
+                quote! { #zerocopy_crate::invariant::Unaligned }
+            };
+            // SAFETY: See comments on items.
+            ImplBlockBuilder::new(
+                ctx,
+                data,
+                Trait::ProjectField {
+                    variant_id: variant_id.clone(),
+                    field: field.clone(),
+                    field_id: field_id.clone(),
+                    invariants: parse_quote!((Aliasing, Alignment, #zerocopy_crate::invariant::Initialized)),
+                },
+                FieldBounds::None,
+            )
+            .param_extras(vec![
+                parse_quote!(Aliasing: #zerocopy_crate::invariant::Aliasing),
+                parse_quote!(Alignment: #zerocopy_crate::invariant::Alignment),
+            ])
+            .inner_extras(quote! {
+                // SAFETY: Projection into structs is always infallible.
+                type Error = #zerocopy_crate::util::macro_util::core_reexport::convert::Infallible;
+                // SAFETY: The alignment of the projected `Ptr` is `Unaligned`
+                // if the structure is packed; otherwise inherited from the
+                // outer `Ptr`. If the validity of the outer pointer is
+                // `Initialized`, so too is the validity of its fields.
+                type Invariants = (Aliasing, #alignment, #zerocopy_crate::invariant::Initialized);
+            })
+            .build()
+        } else {
+            quote! {}
+        })
+        .build()
+    });
+
+    const_block(field_tokens.into_iter().chain(Some(has_tag)).chain(has_fields).map(Some))
+}
+fn derive_try_from_bytes_struct(
+    ctx: &Ctx,
+    strct: &DataStruct,
+    top_level: Trait,
+) -> Result<TokenStream, Error> {
+    let extras = try_gen_trivial_is_bit_valid(ctx, top_level).unwrap_or_else(|| {
+        let zerocopy_crate = &ctx.zerocopy_crate;
+        let fields = strct.fields();
+        let field_names = fields.iter().map(|(_vis, name, _ty)| name);
+        let field_tys = fields.iter().map(|(_vis, _name, ty)| ty);
+        let core = ctx.core_path();
+        quote!(
+            // SAFETY: We use `is_bit_valid` to validate that each field is
+            // bit-valid, and only return `true` if all of them are. The bit
+            // validity of a struct is just the composition of the bit
+            // validities of its fields, so this is a sound implementation
+            // of `is_bit_valid`.
+            #[inline]
+            fn is_bit_valid<___ZcAlignment>(
+                mut candidate: #zerocopy_crate::Maybe<'_, Self, ___ZcAlignment>,
+            ) -> #core::primitive::bool
+            where
+                ___ZcAlignment: #zerocopy_crate::invariant::Alignment,
+            {
+                true #(&& {
+                    let field_candidate =   #zerocopy_crate::into_inner!(candidate.reborrow().project::<
+                        _,
+                        { #zerocopy_crate::STRUCT_VARIANT_ID },
+                        { #zerocopy_crate::ident_id!(#field_names) }
+                    >());
+                    <#field_tys as #zerocopy_crate::TryFromBytes>::is_bit_valid(field_candidate)
+                })*
+            }
+        )
+    });
+    Ok(ImplBlockBuilder::new(ctx, strct, Trait::TryFromBytes, FieldBounds::ALL_SELF)
+        .inner_extras(extras)
+        .outer_extras(derive_has_field_struct_union(ctx, strct))
+        .build())
+}
+fn derive_try_from_bytes_union(ctx: &Ctx, unn: &DataUnion, top_level: Trait) -> TokenStream {
+    let field_type_trait_bounds = FieldBounds::All(&[TraitBound::Slf]);
+
+    let zerocopy_crate = &ctx.zerocopy_crate;
+    let variant_id: Box<Expr> = {
+        let is_repr_c =
+            StructUnionRepr::from_attrs(&ctx.ast.attrs).map(|repr| repr.is_c()).unwrap_or(false);
+        if is_repr_c {
+            parse_quote!({ #zerocopy_crate::REPR_C_UNION_VARIANT_ID })
+        } else {
+            parse_quote!({ #zerocopy_crate::UNION_VARIANT_ID })
+        }
+    };
+
+    let extras = try_gen_trivial_is_bit_valid(ctx, top_level).unwrap_or_else(|| {
+        let fields = unn.fields();
+        let field_names = fields.iter().map(|(_vis, name, _ty)| name);
+        let field_tys = fields.iter().map(|(_vis, _name, ty)| ty);
+        let core = ctx.core_path();
+        quote!(
+            // SAFETY: We use `is_bit_valid` to validate that any field is
+            // bit-valid; we only return `true` if at least one of them is.
+            // The bit validity of a union is not yet well defined in Rust,
+            // but it is guaranteed to be no more strict than this
+            // definition. See #696 for a more in-depth discussion.
+            #[inline]
+            fn is_bit_valid<___ZcAlignment>(
+                mut candidate: #zerocopy_crate::Maybe<'_, Self, ___ZcAlignment>,
+            ) -> #core::primitive::bool
+            where
+                ___ZcAlignment: #zerocopy_crate::invariant::Alignment,
+            {
+                false #(|| {
+                    // SAFETY:
+                    // - Since `ReadOnly<Self>: Immutable` unconditionally,
+                    //   neither `*slf` nor the returned pointer's referent
+                    //   permit interior mutation.
+                    // - Both source and destination validity are
+                    //   `Initialized`, which is always a sound
+                    //   transmutation.
+                    let field_candidate = unsafe {
+                        candidate.reborrow().project_transmute_unchecked::<
+                            _,
+                            _,
+                            #zerocopy_crate::pointer::cast::Projection<
+                                _,
+                                #variant_id,
+                                { #zerocopy_crate::ident_id!(#field_names) }
+                            >
+                        >()
+                    };
+
+                    <#field_tys as #zerocopy_crate::TryFromBytes>::is_bit_valid(field_candidate)
+                })*
+            }
+        )
+    });
+    ImplBlockBuilder::new(ctx, unn, Trait::TryFromBytes, field_type_trait_bounds)
+        .inner_extras(extras)
+        .outer_extras(derive_has_field_struct_union(ctx, unn))
+        .build()
+}
+fn derive_try_from_bytes_enum(
+    ctx: &Ctx,
+    enm: &DataEnum,
+    top_level: Trait,
+) -> Result<TokenStream, Error> {
+    let repr = EnumRepr::from_attrs(&ctx.ast.attrs)?;
+
+    // If an enum has no fields, it has a well-defined integer representation,
+    // and every possible bit pattern corresponds to a valid discriminant tag,
+    // then it *could* be `FromBytes` (even if the user hasn't derived
+    // `FromBytes`). This holds if, for `repr(uN)` or `repr(iN)`, there are 2^N
+    // variants.
+    let could_be_from_bytes = enum_size_from_repr(&repr)
+        .map(|size| enm.fields().is_empty() && enm.variants.len() == 1usize << size)
+        .unwrap_or(false);
+
+    let trivial_is_bit_valid = try_gen_trivial_is_bit_valid(ctx, top_level);
+    let extra = match (trivial_is_bit_valid, could_be_from_bytes) {
+        (Some(is_bit_valid), _) => is_bit_valid,
+        // SAFETY: It would be sound for the enum to implement `FromBytes`, as
+        // required by `gen_trivial_is_bit_valid_unchecked`.
+        (None, true) => unsafe { gen_trivial_is_bit_valid_unchecked(ctx) },
+        (None, false) => match derive_is_bit_valid(ctx, enm, &repr) {
+            Ok(extra) => extra,
+            Err(_) if ctx.skip_on_error => return Ok(TokenStream::new()),
+            Err(e) => return Err(e),
+        },
+    };
+
+    Ok(ImplBlockBuilder::new(ctx, enm, Trait::TryFromBytes, FieldBounds::ALL_SELF)
+        .inner_extras(extra)
+        .build())
+}
+fn try_gen_trivial_is_bit_valid(ctx: &Ctx, top_level: Trait) -> Option<proc_macro2::TokenStream> {
+    // If the top-level trait is `FromBytes` and `Self` has no type parameters,
+    // then the `FromBytes` derive will fail compilation if `Self` is not
+    // actually soundly `FromBytes`, and so we can rely on that for our
+    // `is_bit_valid` impl. It's plausible that we could make changes - or Rust
+    // could make changes (such as the "trivial bounds" language feature) - that
+    // make this no longer true. To hedge against these, we include an explicit
+    // `Self: FromBytes` check in the generated `is_bit_valid`, which is
+    // bulletproof.
+    //
+    // If `ctx.skip_on_error` is true, we can't rely on the `FromBytes` derive
+    // to fail compilation if `Self` is not actually soundly `FromBytes`.
+    if matches!(top_level, Trait::FromBytes)
+        && ctx.ast.generics.params.is_empty()
+        && !ctx.skip_on_error
+    {
+        let zerocopy_crate = &ctx.zerocopy_crate;
+        let core = ctx.core_path();
+        Some(quote!(
+            // SAFETY: See inline.
+            #[inline(always)]
+            fn is_bit_valid<___ZcAlignment>(
+                _candidate: #zerocopy_crate::Maybe<'_, Self, ___ZcAlignment>,
+            ) -> #core::primitive::bool
+            where
+                ___ZcAlignment: #zerocopy_crate::invariant::Alignment,
+            {
+                if false {
+                    fn assert_is_from_bytes<T>()
+                    where
+                        T: #zerocopy_crate::FromBytes,
+                        T: ?#core::marker::Sized,
+                    {
+                    }
+
+                    assert_is_from_bytes::<Self>();
+                }
+
+                // SAFETY: The preceding code only compiles if `Self:
+                // FromBytes`. Thus, this code only compiles if all initialized
+                // byte sequences represent valid instances of `Self`.
+                true
+            }
+        ))
+    } else {
+        None
+    }
+}
+
+/// # Safety
+///
+/// All initialized bit patterns must be valid for `Self`.
+unsafe fn gen_trivial_is_bit_valid_unchecked(ctx: &Ctx) -> proc_macro2::TokenStream {
+    let zerocopy_crate = &ctx.zerocopy_crate;
+    let core = ctx.core_path();
+    quote!(
+        // SAFETY: The caller of `gen_trivial_is_bit_valid_unchecked` has
+        // promised that all initialized bit patterns are valid for `Self`.
+        #[inline(always)]
+        fn is_bit_valid<___ZcAlignment>(
+            _candidate: #zerocopy_crate::Maybe<'_, Self, ___ZcAlignment>,
+        ) -> #core::primitive::bool
+        where
+            ___ZcAlignment: #zerocopy_crate::invariant::Alignment,
+        {
+            true
+        }
+    )
+}
diff --git a/rust/zerocopy-derive/derive/unaligned.rs b/rust/zerocopy-derive/derive/unaligned.rs
new file mode 100644
index 000000000000..819d84984a03
--- /dev/null
+++ b/rust/zerocopy-derive/derive/unaligned.rs
@@ -0,0 +1,78 @@
+use proc_macro2::{Span, TokenStream};
+use syn::{Data, DataEnum, DataStruct, DataUnion, Error};
+
+use crate::{
+    repr::{EnumRepr, StructUnionRepr},
+    util::{Ctx, FieldBounds, ImplBlockBuilder, Trait},
+};
+
+pub(crate) fn derive_unaligned(ctx: &Ctx, _top_level: Trait) -> Result<TokenStream, Error> {
+    match &ctx.ast.data {
+        Data::Struct(strct) => derive_unaligned_struct(ctx, strct),
+        Data::Enum(enm) => derive_unaligned_enum(ctx, enm),
+        Data::Union(unn) => derive_unaligned_union(ctx, unn),
+    }
+}
+
+/// A struct is `Unaligned` if:
+/// - `repr(align)` is no more than 1 and either
+///   - `repr(C)` or `repr(transparent)` and
+///     - all fields `Unaligned`
+///   - `repr(packed)`
+fn derive_unaligned_struct(ctx: &Ctx, strct: &DataStruct) -> Result<TokenStream, Error> {
+    let repr = StructUnionRepr::from_attrs(&ctx.ast.attrs)?;
+    repr.unaligned_validate_no_align_gt_1()?;
+
+    let field_bounds = if repr.is_packed_1() {
+        FieldBounds::None
+    } else if repr.is_c() || repr.is_transparent() {
+        FieldBounds::ALL_SELF
+    } else {
+        return ctx.error_or_skip(Error::new(
+            Span::call_site(),
+            "must have #[repr(C)], #[repr(transparent)], or #[repr(packed)] attribute in order to guarantee this type's alignment",
+        ));
+    };
+
+    Ok(ImplBlockBuilder::new(ctx, strct, Trait::Unaligned, field_bounds).build())
+}
+
+/// An enum is `Unaligned` if:
+/// - No `repr(align(N > 1))`
+/// - `repr(u8)` or `repr(i8)`
+fn derive_unaligned_enum(ctx: &Ctx, enm: &DataEnum) -> Result<TokenStream, Error> {
+    let repr = EnumRepr::from_attrs(&ctx.ast.attrs)?;
+    repr.unaligned_validate_no_align_gt_1()?;
+
+    if !repr.is_u8() && !repr.is_i8() {
+        return ctx.error_or_skip(Error::new(
+            Span::call_site(),
+            "must have #[repr(u8)] or #[repr(i8)] attribute in order to guarantee this type's alignment",
+        ));
+    }
+
+    Ok(ImplBlockBuilder::new(ctx, enm, Trait::Unaligned, FieldBounds::ALL_SELF).build())
+}
+
+/// Like structs, a union is `Unaligned` if:
+/// - `repr(align)` is no more than 1 and either
+///   - `repr(C)` or `repr(transparent)` and
+///     - all fields `Unaligned`
+///   - `repr(packed)`
+fn derive_unaligned_union(ctx: &Ctx, unn: &DataUnion) -> Result<TokenStream, Error> {
+    let repr = StructUnionRepr::from_attrs(&ctx.ast.attrs)?;
+    repr.unaligned_validate_no_align_gt_1()?;
+
+    let field_type_trait_bounds = if repr.is_packed_1() {
+        FieldBounds::None
+    } else if repr.is_c() || repr.is_transparent() {
+        FieldBounds::ALL_SELF
+    } else {
+        return ctx.error_or_skip(Error::new(
+            Span::call_site(),
+            "must have #[repr(C)], #[repr(transparent)], or #[repr(packed)] attribute in order to guarantee this type's alignment",
+        ));
+    };
+
+    Ok(ImplBlockBuilder::new(ctx, unn, Trait::Unaligned, field_type_trait_bounds).build())
+}
diff --git a/rust/zerocopy-derive/lib.rs b/rust/zerocopy-derive/lib.rs
new file mode 100644
index 000000000000..a1d10a2ada27
--- /dev/null
+++ b/rust/zerocopy-derive/lib.rs
@@ -0,0 +1,144 @@
+// Copyright 2019 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+//! Derive macros for [zerocopy]'s traits.
+//!
+//! [zerocopy]: https://docs.rs/zerocopy
+
+// Sometimes we want to use lints which were added after our MSRV.
+// `unknown_lints` is `warn` by default and we deny warnings in CI, so without
+// this attribute, any unknown lint would cause a CI failure when testing with
+// our MSRV.
+#![allow(unknown_lints)]
+#![deny(renamed_and_removed_lints)]
+#![deny(
+    clippy::all,
+    clippy::missing_safety_doc,
+    clippy::multiple_unsafe_ops_per_block,
+    clippy::undocumented_unsafe_blocks
+)]
+// We defer to own discretion on type complexity.
+#![allow(clippy::type_complexity)]
+// Inlining format args isn't supported on our MSRV.
+#![allow(clippy::uninlined_format_args)]
+#![deny(
+    rustdoc::bare_urls,
+    rustdoc::broken_intra_doc_links,
+    rustdoc::invalid_codeblock_attributes,
+    rustdoc::invalid_html_tags,
+    rustdoc::invalid_rust_codeblocks,
+    rustdoc::missing_crate_level_docs,
+    rustdoc::private_intra_doc_links
+)]
+#![recursion_limit = "128"]
+
+macro_rules! ident {
+    (($fmt:literal $(, $arg:expr)*), $span:expr) => {
+        syn::Ident::new(&format!($fmt $(, crate::util::to_ident_str($arg))*), $span)
+    };
+}
+
+mod derive;
+#[cfg(test)]
+mod output_tests;
+mod repr;
+mod util;
+
+use syn::{DeriveInput, Error};
+
+use crate::util::*;
+
+// FIXME(https://github.com/rust-lang/rust/issues/54140): Some errors could be
+// made better if we could add multiple lines of error output like this:
+//
+// error: unsupported representation
+//   --> enum.rs:28:8
+//    |
+// 28 | #[repr(transparent)]
+//    |
+// help: required by the derive of FromBytes
+//
+// Instead, we have more verbose error messages like "unsupported representation
+// for deriving FromZeros, FromBytes, IntoBytes, or Unaligned on an enum"
+//
+// This will probably require Span::error
+// (https://doc.rust-lang.org/nightly/proc_macro/struct.Span.html#method.error),
+// which is currently unstable. Revisit this once it's stable.
+
+/// Defines a derive function named `$outer` which parses its input
+/// `TokenStream` as a `DeriveInput` and then invokes the `$inner` function.
+///
+/// Note that the separate `$outer` parameter is required - proc macro functions
+/// are currently required to live at the crate root, and so the caller must
+/// specify the name in order to avoid name collisions.
+macro_rules! derive {
+    ($trait:ident => $outer:ident => $inner:path) => {
+        #[proc_macro_derive($trait, attributes(zerocopy))]
+        pub fn $outer(ts: proc_macro::TokenStream) -> proc_macro::TokenStream {
+            let ast = syn::parse_macro_input!(ts as DeriveInput);
+            let ctx = match Ctx::try_from_derive_input(ast) {
+                Ok(ctx) => ctx,
+                Err(e) => return e.into_compile_error().into(),
+            };
+            let ts = $inner(&ctx, Trait::$trait).into_ts();
+            // We wrap in `const_block` as a backstop in case any derive fails
+            // to wrap its output in `const_block` (and thus fails to annotate)
+            // with the full set of `#[allow(...)]` attributes).
+            let ts = const_block([Some(ts)]);
+            #[cfg(test)]
+            crate::util::testutil::check_hygiene(ts.clone());
+            ts.into()
+        }
+    };
+}
+
+trait IntoTokenStream {
+    fn into_ts(self) -> proc_macro2::TokenStream;
+}
+
+impl IntoTokenStream for proc_macro2::TokenStream {
+    fn into_ts(self) -> proc_macro2::TokenStream {
+        self
+    }
+}
+
+impl IntoTokenStream for Result<proc_macro2::TokenStream, Error> {
+    fn into_ts(self) -> proc_macro2::TokenStream {
+        match self {
+            Ok(ts) => ts,
+            Err(err) => err.to_compile_error(),
+        }
+    }
+}
+
+derive!(KnownLayout => derive_known_layout => crate::derive::known_layout::derive);
+derive!(Immutable => derive_immutable => crate::derive::derive_immutable);
+derive!(TryFromBytes => derive_try_from_bytes => crate::derive::try_from_bytes::derive_try_from_bytes);
+derive!(FromZeros => derive_from_zeros => crate::derive::from_bytes::derive_from_zeros);
+derive!(FromBytes => derive_from_bytes => crate::derive::from_bytes::derive_from_bytes);
+derive!(IntoBytes => derive_into_bytes => crate::derive::into_bytes::derive_into_bytes);
+derive!(Unaligned => derive_unaligned => crate::derive::unaligned::derive_unaligned);
+derive!(ByteHash => derive_hash => crate::derive::derive_hash);
+derive!(ByteEq => derive_eq => crate::derive::derive_eq);
+derive!(SplitAt => derive_split_at => crate::derive::derive_split_at);
+
+/// Deprecated: prefer [`FromZeros`] instead.
+#[deprecated(since = "0.8.0", note = "`FromZeroes` was renamed to `FromZeros`")]
+#[doc(hidden)]
+#[proc_macro_derive(FromZeroes)]
+pub fn derive_from_zeroes(ts: proc_macro::TokenStream) -> proc_macro::TokenStream {
+    derive_from_zeros(ts)
+}
+
+/// Deprecated: prefer [`IntoBytes`] instead.
+#[deprecated(since = "0.8.0", note = "`AsBytes` was renamed to `IntoBytes`")]
+#[doc(hidden)]
+#[proc_macro_derive(AsBytes)]
+pub fn derive_as_bytes(ts: proc_macro::TokenStream) -> proc_macro::TokenStream {
+    derive_into_bytes(ts)
+}
diff --git a/rust/zerocopy-derive/repr.rs b/rust/zerocopy-derive/repr.rs
new file mode 100644
index 000000000000..57014b38b2da
--- /dev/null
+++ b/rust/zerocopy-derive/repr.rs
@@ -0,0 +1,849 @@
+// Copyright 2019 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use core::{
+    convert::{Infallible, TryFrom},
+    num::NonZeroU32,
+};
+
+use proc_macro2::{Span, TokenStream};
+use quote::{quote_spanned, ToTokens, TokenStreamExt as _};
+use syn::{
+    punctuated::Punctuated, spanned::Spanned as _, token::Comma, Attribute, Error, LitInt, Meta,
+    MetaList,
+};
+
+/// The computed representation of a type.
+///
+/// This is the result of processing all `#[repr(...)]` attributes on a type, if
+/// any. A `Repr` is only capable of representing legal combinations of
+/// `#[repr(...)]` attributes.
+#[cfg_attr(test, derive(Copy, Clone, Debug))]
+pub(crate) enum Repr<Prim, Packed> {
+    /// `#[repr(transparent)]`
+    Transparent(Span),
+    /// A compound representation: `repr(C)`, `repr(Rust)`, or `repr(Int)`
+    /// optionally combined with `repr(packed(...))` or `repr(align(...))`
+    Compound(Spanned<CompoundRepr<Prim>>, Option<Spanned<AlignRepr<Packed>>>),
+}
+
+/// A compound representation: `repr(C)`, `repr(Rust)`, or `repr(Int)`.
+#[cfg_attr(test, derive(Copy, Clone, Debug, Eq, PartialEq))]
+pub(crate) enum CompoundRepr<Prim> {
+    C,
+    Rust,
+    Primitive(Prim),
+}
+
+/// `repr(Int)`
+#[derive(Copy, Clone)]
+#[cfg_attr(test, derive(Debug, Eq, PartialEq))]
+pub(crate) enum PrimitiveRepr {
+    U8,
+    U16,
+    U32,
+    U64,
+    U128,
+    Usize,
+    I8,
+    I16,
+    I32,
+    I64,
+    I128,
+    Isize,
+}
+
+/// `repr(packed(...))` or `repr(align(...))`
+#[cfg_attr(test, derive(Copy, Clone, Debug, Eq, PartialEq))]
+pub(crate) enum AlignRepr<Packed> {
+    Packed(Packed),
+    Align(NonZeroU32),
+}
+
+/// The representations which can legally appear on a struct or union type.
+pub(crate) type StructUnionRepr = Repr<Infallible, NonZeroU32>;
+
+/// The representations which can legally appear on an enum type.
+pub(crate) type EnumRepr = Repr<PrimitiveRepr, Infallible>;
+
+impl<Prim, Packed> Repr<Prim, Packed> {
+    /// Gets the name of this "repr type" - the non-align `repr(X)` that is used
+    /// in prose to refer to this type.
+    ///
+    /// For example, we would refer to `#[repr(C, align(4))] struct Foo { ... }`
+    /// as a "`repr(C)` struct".
+    pub(crate) fn repr_type_name(&self) -> &str
+    where
+        Prim: Copy + With<PrimitiveRepr>,
+    {
+        use CompoundRepr::*;
+        use PrimitiveRepr::*;
+        use Repr::*;
+        match self {
+            Transparent(_span) => "repr(transparent)",
+            Compound(Spanned { t: repr, span: _ }, _align) => match repr {
+                C => "repr(C)",
+                Rust => "repr(Rust)",
+                Primitive(prim) => prim.with(|prim| match prim {
+                    U8 => "repr(u8)",
+                    U16 => "repr(u16)",
+                    U32 => "repr(u32)",
+                    U64 => "repr(u64)",
+                    U128 => "repr(u128)",
+                    Usize => "repr(usize)",
+                    I8 => "repr(i8)",
+                    I16 => "repr(i16)",
+                    I32 => "repr(i32)",
+                    I64 => "repr(i64)",
+                    I128 => "repr(i128)",
+                    Isize => "repr(isize)",
+                }),
+            },
+        }
+    }
+
+    pub(crate) fn is_transparent(&self) -> bool {
+        matches!(self, Repr::Transparent(_))
+    }
+
+    pub(crate) fn is_c(&self) -> bool {
+        use CompoundRepr::*;
+        matches!(self, Repr::Compound(Spanned { t: C, span: _ }, _align))
+    }
+
+    pub(crate) fn is_primitive(&self) -> bool {
+        use CompoundRepr::*;
+        matches!(self, Repr::Compound(Spanned { t: Primitive(_), span: _ }, _align))
+    }
+
+    pub(crate) fn get_packed(&self) -> Option<&Packed> {
+        use AlignRepr::*;
+        use Repr::*;
+        if let Compound(_, Some(Spanned { t: Packed(p), span: _ })) = self {
+            Some(p)
+        } else {
+            None
+        }
+    }
+
+    pub(crate) fn get_align(&self) -> Option<Spanned<NonZeroU32>> {
+        use AlignRepr::*;
+        use Repr::*;
+        if let Compound(_, Some(Spanned { t: Align(n), span })) = self {
+            Some(Spanned::new(*n, *span))
+        } else {
+            None
+        }
+    }
+
+    pub(crate) fn is_align_gt_1(&self) -> bool {
+        self.get_align().map(|n| n.t.get() > 1).unwrap_or(false)
+    }
+
+    /// When deriving `Unaligned`, validate that the decorated type has no
+    /// `#[repr(align(N))]` attribute where `N > 1`. If no such attribute exists
+    /// (including if `N == 1`), this returns `Ok(())`, and otherwise it returns
+    /// a descriptive error.
+    pub(crate) fn unaligned_validate_no_align_gt_1(&self) -> Result<(), Error> {
+        if let Some(n) = self.get_align().filter(|n| n.t.get() > 1) {
+            Err(Error::new(
+                n.span,
+                "cannot derive `Unaligned` on type with alignment greater than 1",
+            ))
+        } else {
+            Ok(())
+        }
+    }
+}
+
+impl<Prim> Repr<Prim, NonZeroU32> {
+    /// Does `self` describe a `#[repr(packed)]` or `#[repr(packed(1))]` type?
+    pub(crate) fn is_packed_1(&self) -> bool {
+        self.get_packed().map(|n| n.get() == 1).unwrap_or(false)
+    }
+}
+
+impl<Packed> Repr<PrimitiveRepr, Packed> {
+    fn get_primitive(&self) -> Option<&PrimitiveRepr> {
+        use CompoundRepr::*;
+        use Repr::*;
+        if let Compound(Spanned { t: Primitive(p), span: _ }, _align) = self {
+            Some(p)
+        } else {
+            None
+        }
+    }
+
+    /// Does `self` describe a `#[repr(u8)]` type?
+    pub(crate) fn is_u8(&self) -> bool {
+        matches!(self.get_primitive(), Some(PrimitiveRepr::U8))
+    }
+
+    /// Does `self` describe a `#[repr(i8)]` type?
+    pub(crate) fn is_i8(&self) -> bool {
+        matches!(self.get_primitive(), Some(PrimitiveRepr::I8))
+    }
+}
+
+impl<Prim, Packed> ToTokens for Repr<Prim, Packed>
+where
+    Prim: With<PrimitiveRepr> + Copy,
+    Packed: With<NonZeroU32> + Copy,
+{
+    fn to_tokens(&self, ts: &mut TokenStream) {
+        use Repr::*;
+        match self {
+            Transparent(span) => ts.append_all(quote_spanned! { *span=> #[repr(transparent)] }),
+            Compound(repr, align) => {
+                repr.to_tokens(ts);
+                if let Some(align) = align {
+                    align.to_tokens(ts);
+                }
+            }
+        }
+    }
+}
+
+impl<Prim: With<PrimitiveRepr> + Copy> ToTokens for Spanned<CompoundRepr<Prim>> {
+    fn to_tokens(&self, ts: &mut TokenStream) {
+        use CompoundRepr::*;
+        match &self.t {
+            C => ts.append_all(quote_spanned! { self.span=> #[repr(C)] }),
+            Rust => ts.append_all(quote_spanned! { self.span=> #[repr(Rust)] }),
+            Primitive(prim) => prim.with(|prim| Spanned::new(prim, self.span).to_tokens(ts)),
+        }
+    }
+}
+
+impl ToTokens for Spanned<PrimitiveRepr> {
+    fn to_tokens(&self, ts: &mut TokenStream) {
+        use PrimitiveRepr::*;
+        match self.t {
+            U8 => ts.append_all(quote_spanned! { self.span => #[repr(u8)] }),
+            U16 => ts.append_all(quote_spanned! { self.span => #[repr(u16)] }),
+            U32 => ts.append_all(quote_spanned! { self.span => #[repr(u32)] }),
+            U64 => ts.append_all(quote_spanned! { self.span => #[repr(u64)] }),
+            U128 => ts.append_all(quote_spanned! { self.span => #[repr(u128)] }),
+            Usize => ts.append_all(quote_spanned! { self.span => #[repr(usize)] }),
+            I8 => ts.append_all(quote_spanned! { self.span => #[repr(i8)] }),
+            I16 => ts.append_all(quote_spanned! { self.span => #[repr(i16)] }),
+            I32 => ts.append_all(quote_spanned! { self.span => #[repr(i32)] }),
+            I64 => ts.append_all(quote_spanned! { self.span => #[repr(i64)] }),
+            I128 => ts.append_all(quote_spanned! { self.span => #[repr(i128)] }),
+            Isize => ts.append_all(quote_spanned! { self.span => #[repr(isize)] }),
+        }
+    }
+}
+
+impl<Packed: With<NonZeroU32> + Copy> ToTokens for Spanned<AlignRepr<Packed>> {
+    fn to_tokens(&self, ts: &mut TokenStream) {
+        use AlignRepr::*;
+        // We use `syn::Index` instead of `u32` because `quote_spanned!`
+        // serializes `u32` literals as `123u32`, not just `123`. Rust doesn't
+        // recognize that as a valid argument to `#[repr(align(...))]` or
+        // `#[repr(packed(...))]`.
+        let to_index = |n: NonZeroU32| syn::Index { index: n.get(), span: self.span };
+        match self.t {
+            Packed(n) => n.with(|n| {
+                let n = to_index(n);
+                ts.append_all(quote_spanned! { self.span => #[repr(packed(#n))] })
+            }),
+            Align(n) => {
+                let n = to_index(n);
+                ts.append_all(quote_spanned! { self.span => #[repr(align(#n))] })
+            }
+        }
+    }
+}
+
+/// The result of parsing a single `#[repr(...)]` attribute or a single
+/// directive inside a compound `#[repr(..., ...)]` attribute.
+#[derive(Copy, Clone, PartialEq, Eq)]
+#[cfg_attr(test, derive(Debug))]
+pub(crate) enum RawRepr {
+    Transparent,
+    C,
+    Rust,
+    U8,
+    U16,
+    U32,
+    U64,
+    U128,
+    Usize,
+    I8,
+    I16,
+    I32,
+    I64,
+    I128,
+    Isize,
+    Align(NonZeroU32),
+    PackedN(NonZeroU32),
+    Packed,
+}
+
+/// The error from converting from a `RawRepr`.
+#[cfg_attr(test, derive(Debug, Eq, PartialEq))]
+pub(crate) enum FromRawReprError<E> {
+    /// The `RawRepr` doesn't affect the high-level repr we're parsing (e.g.
+    /// it's `align(...)` and we're parsing a `CompoundRepr`).
+    None,
+    /// The `RawRepr` is invalid for the high-level repr we're parsing (e.g.
+    /// it's `packed` repr and we're parsing an `AlignRepr` for an enum type).
+    Err(E),
+}
+
+/// The representation hint is not supported for the decorated type.
+#[cfg_attr(test, derive(Copy, Clone, Debug, Eq, PartialEq))]
+pub(crate) struct UnsupportedReprError;
+
+impl<Prim: With<PrimitiveRepr>> TryFrom<RawRepr> for CompoundRepr<Prim> {
+    type Error = FromRawReprError<UnsupportedReprError>;
+    fn try_from(
+        raw: RawRepr,
+    ) -> Result<CompoundRepr<Prim>, FromRawReprError<UnsupportedReprError>> {
+        use RawRepr::*;
+        match raw {
+            C => Ok(CompoundRepr::C),
+            Rust => Ok(CompoundRepr::Rust),
+            raw @ (U8 | U16 | U32 | U64 | U128 | Usize | I8 | I16 | I32 | I64 | I128 | Isize) => {
+                Prim::try_with_or(
+                    || match raw {
+                        U8 => Ok(PrimitiveRepr::U8),
+                        U16 => Ok(PrimitiveRepr::U16),
+                        U32 => Ok(PrimitiveRepr::U32),
+                        U64 => Ok(PrimitiveRepr::U64),
+                        U128 => Ok(PrimitiveRepr::U128),
+                        Usize => Ok(PrimitiveRepr::Usize),
+                        I8 => Ok(PrimitiveRepr::I8),
+                        I16 => Ok(PrimitiveRepr::I16),
+                        I32 => Ok(PrimitiveRepr::I32),
+                        I64 => Ok(PrimitiveRepr::I64),
+                        I128 => Ok(PrimitiveRepr::I128),
+                        Isize => Ok(PrimitiveRepr::Isize),
+                        Transparent | C | Rust | Align(_) | PackedN(_) | Packed => {
+                            Err(UnsupportedReprError)
+                        }
+                    },
+                    UnsupportedReprError,
+                )
+                .map(CompoundRepr::Primitive)
+                .map_err(FromRawReprError::Err)
+            }
+            Transparent | Align(_) | PackedN(_) | Packed => Err(FromRawReprError::None),
+        }
+    }
+}
+
+impl<Pcked: With<NonZeroU32>> TryFrom<RawRepr> for AlignRepr<Pcked> {
+    type Error = FromRawReprError<UnsupportedReprError>;
+    fn try_from(raw: RawRepr) -> Result<AlignRepr<Pcked>, FromRawReprError<UnsupportedReprError>> {
+        use RawRepr::*;
+        match raw {
+            Packed | PackedN(_) => Pcked::try_with_or(
+                || match raw {
+                    Packed => Ok(NonZeroU32::new(1).unwrap()),
+                    PackedN(n) => Ok(n),
+                    U8 | U16 | U32 | U64 | U128 | Usize | I8 | I16 | I32 | I64 | I128 | Isize
+                    | Transparent | C | Rust | Align(_) => Err(UnsupportedReprError),
+                },
+                UnsupportedReprError,
+            )
+            .map(AlignRepr::Packed)
+            .map_err(FromRawReprError::Err),
+            Align(n) => Ok(AlignRepr::Align(n)),
+            U8 | U16 | U32 | U64 | U128 | Usize | I8 | I16 | I32 | I64 | I128 | Isize
+            | Transparent | C | Rust => Err(FromRawReprError::None),
+        }
+    }
+}
+
+/// The error from extracting a high-level repr type from a list of `RawRepr`s.
+#[cfg_attr(test, derive(Copy, Clone, Debug, Eq, PartialEq))]
+enum FromRawReprsError<E> {
+    /// One of the `RawRepr`s is invalid for the high-level repr we're parsing
+    /// (e.g. there's a `packed` repr and we're parsing an `AlignRepr` for an
+    /// enum type).
+    Single(E),
+    /// Two `RawRepr`s appear which both affect the high-level repr we're
+    /// parsing (e.g., the list is `#[repr(align(2), packed)]`). Note that we
+    /// conservatively treat redundant reprs as conflicting (e.g.
+    /// `#[repr(packed, packed)]`).
+    Conflict,
+}
+
+/// Tries to extract a high-level repr from a list of `RawRepr`s.
+fn try_from_raw_reprs<'a, E, R: TryFrom<RawRepr, Error = FromRawReprError<E>>>(
+    r: impl IntoIterator<Item = &'a Spanned<RawRepr>>,
+) -> Result<Option<Spanned<R>>, Spanned<FromRawReprsError<E>>> {
+    // Walk the list of `RawRepr`s and attempt to convert each to an `R`. Bail
+    // if we find any errors. If we find more than one which converts to an `R`,
+    // bail with a `Conflict` error.
+    r.into_iter().try_fold(None, |found: Option<Spanned<R>>, raw| {
+        let new = match Spanned::<R>::try_from(*raw) {
+            Ok(r) => r,
+            // This `RawRepr` doesn't convert to an `R`, so keep the current
+            // found `R`, if any.
+            Err(FromRawReprError::None) => return Ok(found),
+            // This repr is unsupported for the decorated type (e.g.
+            // `repr(packed)` on an enum).
+            Err(FromRawReprError::Err(Spanned { t: err, span })) => {
+                return Err(Spanned::new(FromRawReprsError::Single(err), span))
+            }
+        };
+
+        if let Some(found) = found {
+            // We already found an `R`, but this `RawRepr` also converts to an
+            // `R`, so that's a conflict.
+            //
+            // `Span::join` returns `None` if the two spans are from different
+            // files or if we're not on the nightly compiler. In that case, just
+            // use `new`'s span.
+            let span = found.span.join(new.span).unwrap_or(new.span);
+            Err(Spanned::new(FromRawReprsError::Conflict, span))
+        } else {
+            Ok(Some(new))
+        }
+    })
+}
+
+/// The error returned from [`Repr::from_attrs`].
+#[cfg_attr(test, derive(Copy, Clone, Debug, Eq, PartialEq))]
+enum FromAttrsError {
+    FromRawReprs(FromRawReprsError<UnsupportedReprError>),
+    Unrecognized,
+}
+
+impl From<FromRawReprsError<UnsupportedReprError>> for FromAttrsError {
+    fn from(err: FromRawReprsError<UnsupportedReprError>) -> FromAttrsError {
+        FromAttrsError::FromRawReprs(err)
+    }
+}
+
+impl From<UnrecognizedReprError> for FromAttrsError {
+    fn from(_err: UnrecognizedReprError) -> FromAttrsError {
+        FromAttrsError::Unrecognized
+    }
+}
+
+impl From<Spanned<FromAttrsError>> for Error {
+    fn from(err: Spanned<FromAttrsError>) -> Error {
+        let Spanned { t: err, span } = err;
+        match err {
+            FromAttrsError::FromRawReprs(FromRawReprsError::Single(
+                _err @ UnsupportedReprError,
+            )) => Error::new(span, "unsupported representation hint for the decorated type"),
+            FromAttrsError::FromRawReprs(FromRawReprsError::Conflict) => {
+                // NOTE: This says "another" rather than "a preceding" because
+                // when one of the reprs involved is `transparent`, we detect
+                // that condition in `Repr::from_attrs`, and at that point we
+                // can't tell which repr came first, so we might report this on
+                // the first involved repr rather than the second, third, etc.
+                Error::new(span, "this conflicts with another representation hint")
+            }
+            FromAttrsError::Unrecognized => Error::new(span, "unrecognized representation hint"),
+        }
+    }
+}
+
+impl<Prim, Packed> Repr<Prim, Packed> {
+    fn from_attrs_inner(attrs: &[Attribute]) -> Result<Repr<Prim, Packed>, Spanned<FromAttrsError>>
+    where
+        Prim: With<PrimitiveRepr>,
+        Packed: With<NonZeroU32>,
+    {
+        let raw_reprs = RawRepr::from_attrs(attrs).map_err(Spanned::from)?;
+
+        let transparent = {
+            let mut transparents = raw_reprs.iter().filter_map(|Spanned { t, span }| match t {
+                RawRepr::Transparent => Some(span),
+                _ => None,
+            });
+            let first = transparents.next();
+            let second = transparents.next();
+            match (first, second) {
+                (None, None) => None,
+                (Some(span), None) => Some(*span),
+                (Some(_), Some(second)) => {
+                    return Err(Spanned::new(
+                        FromAttrsError::FromRawReprs(FromRawReprsError::Conflict),
+                        *second,
+                    ))
+                }
+                // An iterator can't produce a value only on the second call to
+                // `.next()`.
+                (None, Some(_)) => unreachable!(),
+            }
+        };
+
+        let compound: Option<Spanned<CompoundRepr<Prim>>> =
+            try_from_raw_reprs(raw_reprs.iter()).map_err(Spanned::from)?;
+        let align: Option<Spanned<AlignRepr<Packed>>> =
+            try_from_raw_reprs(raw_reprs.iter()).map_err(Spanned::from)?;
+
+        if let Some(span) = transparent {
+            if compound.is_some() || align.is_some() {
+                // Arbitrarily report the problem on the `transparent` span. Any
+                // span will do.
+                return Err(Spanned::new(FromRawReprsError::Conflict.into(), span));
+            }
+
+            Ok(Repr::Transparent(span))
+        } else {
+            Ok(Repr::Compound(
+                compound.unwrap_or(Spanned::new(CompoundRepr::Rust, Span::call_site())),
+                align,
+            ))
+        }
+    }
+}
+
+impl<Prim, Packed> Repr<Prim, Packed> {
+    pub(crate) fn from_attrs(attrs: &[Attribute]) -> Result<Repr<Prim, Packed>, Error>
+    where
+        Prim: With<PrimitiveRepr>,
+        Packed: With<NonZeroU32>,
+    {
+        Repr::from_attrs_inner(attrs).map_err(Into::into)
+    }
+}
+
+/// The representation hint could not be parsed or was unrecognized.
+struct UnrecognizedReprError;
+
+impl RawRepr {
+    fn from_attrs(
+        attrs: &[Attribute],
+    ) -> Result<Vec<Spanned<RawRepr>>, Spanned<UnrecognizedReprError>> {
+        let mut reprs = Vec::new();
+        for attr in attrs {
+            // Ignore documentation attributes.
+            if attr.path().is_ident("doc") {
+                continue;
+            }
+            if let Meta::List(ref meta_list) = attr.meta {
+                if meta_list.path.is_ident("repr") {
+                    let parsed: Punctuated<Meta, Comma> =
+                        match meta_list.parse_args_with(Punctuated::parse_terminated) {
+                            Ok(parsed) => parsed,
+                            Err(_) => {
+                                return Err(Spanned::new(
+                                    UnrecognizedReprError,
+                                    meta_list.tokens.span(),
+                                ))
+                            }
+                        };
+                    for meta in parsed {
+                        let s = meta.span();
+                        reprs.push(
+                            RawRepr::from_meta(&meta)
+                                .map(|r| Spanned::new(r, s))
+                                .map_err(|e| Spanned::new(e, s))?,
+                        );
+                    }
+                }
+            }
+        }
+
+        Ok(reprs)
+    }
+
+    fn from_meta(meta: &Meta) -> Result<RawRepr, UnrecognizedReprError> {
+        let (path, list) = match meta {
+            Meta::Path(path) => (path, None),
+            Meta::List(list) => (&list.path, Some(list)),
+            _ => return Err(UnrecognizedReprError),
+        };
+
+        let ident = path.get_ident().ok_or(UnrecognizedReprError)?;
+
+        // Only returns `Ok` for non-zero power-of-two values.
+        let parse_nzu64 = |list: &MetaList| {
+            list.parse_args::<LitInt>()
+                .and_then(|int| int.base10_parse::<NonZeroU32>())
+                .map_err(|_| UnrecognizedReprError)
+                .and_then(|nz| {
+                    if nz.get().is_power_of_two() {
+                        Ok(nz)
+                    } else {
+                        Err(UnrecognizedReprError)
+                    }
+                })
+        };
+
+        use RawRepr::*;
+        Ok(match (ident.to_string().as_str(), list) {
+            ("u8", None) => U8,
+            ("u16", None) => U16,
+            ("u32", None) => U32,
+            ("u64", None) => U64,
+            ("u128", None) => U128,
+            ("usize", None) => Usize,
+            ("i8", None) => I8,
+            ("i16", None) => I16,
+            ("i32", None) => I32,
+            ("i64", None) => I64,
+            ("i128", None) => I128,
+            ("isize", None) => Isize,
+            ("C", None) => C,
+            ("transparent", None) => Transparent,
+            ("Rust", None) => Rust,
+            ("packed", None) => Packed,
+            ("packed", Some(list)) => PackedN(parse_nzu64(list)?),
+            ("align", Some(list)) => Align(parse_nzu64(list)?),
+            _ => return Err(UnrecognizedReprError),
+        })
+    }
+}
+
+pub(crate) use util::*;
+mod util {
+    use super::*;
+    /// A value with an associated span.
+    #[derive(Copy, Clone)]
+    #[cfg_attr(test, derive(Debug))]
+    pub(crate) struct Spanned<T> {
+        pub(crate) t: T,
+        pub(crate) span: Span,
+    }
+
+    impl<T> Spanned<T> {
+        pub(super) fn new(t: T, span: Span) -> Spanned<T> {
+            Spanned { t, span }
+        }
+
+        pub(super) fn from<U>(s: Spanned<U>) -> Spanned<T>
+        where
+            T: From<U>,
+        {
+            let Spanned { t: u, span } = s;
+            Spanned::new(u.into(), span)
+        }
+
+        /// Delegates to `T: TryFrom`, preserving span information in both the
+        /// success and error cases.
+        pub(super) fn try_from<E, U>(
+            u: Spanned<U>,
+        ) -> Result<Spanned<T>, FromRawReprError<Spanned<E>>>
+        where
+            T: TryFrom<U, Error = FromRawReprError<E>>,
+        {
+            let Spanned { t: u, span } = u;
+            T::try_from(u).map(|t| Spanned { t, span }).map_err(|err| match err {
+                FromRawReprError::None => FromRawReprError::None,
+                FromRawReprError::Err(e) => FromRawReprError::Err(Spanned::new(e, span)),
+            })
+        }
+    }
+
+    // Used to permit implementing `With<T> for T: Inhabited` and for
+    // `Infallible` without a blanket impl conflict.
+    pub(crate) trait Inhabited {}
+    impl Inhabited for PrimitiveRepr {}
+    impl Inhabited for NonZeroU32 {}
+
+    pub(crate) trait With<T> {
+        fn with<O, F: FnOnce(T) -> O>(self, f: F) -> O;
+        fn try_with_or<E, F: FnOnce() -> Result<T, E>>(f: F, err: E) -> Result<Self, E>
+        where
+            Self: Sized;
+    }
+
+    impl<T: Inhabited> With<T> for T {
+        fn with<O, F: FnOnce(T) -> O>(self, f: F) -> O {
+            f(self)
+        }
+
+        fn try_with_or<E, F: FnOnce() -> Result<T, E>>(f: F, _err: E) -> Result<Self, E> {
+            f()
+        }
+    }
+
+    impl<T> With<T> for Infallible {
+        fn with<O, F: FnOnce(T) -> O>(self, _f: F) -> O {
+            match self {}
+        }
+
+        fn try_with_or<E, F: FnOnce() -> Result<T, E>>(_f: F, err: E) -> Result<Self, E> {
+            Err(err)
+        }
+    }
+}
+
+#[cfg(test)]
+mod tests {
+    use syn::parse_quote;
+
+    use super::*;
+
+    impl<T> From<T> for Spanned<T> {
+        fn from(t: T) -> Spanned<T> {
+            Spanned::new(t, Span::call_site())
+        }
+    }
+
+    // We ignore spans for equality in testing since real spans are hard to
+    // synthesize and don't implement `PartialEq`.
+    impl<T: PartialEq> PartialEq for Spanned<T> {
+        fn eq(&self, other: &Spanned<T>) -> bool {
+            self.t.eq(&other.t)
+        }
+    }
+
+    impl<T: Eq> Eq for Spanned<T> {}
+
+    impl<Prim: PartialEq, Packed: PartialEq> PartialEq for Repr<Prim, Packed> {
+        fn eq(&self, other: &Repr<Prim, Packed>) -> bool {
+            match (self, other) {
+                (Repr::Transparent(_), Repr::Transparent(_)) => true,
+                (Repr::Compound(sc, sa), Repr::Compound(oc, oa)) => (sc, sa) == (oc, oa),
+                _ => false,
+            }
+        }
+    }
+
+    fn s() -> Span {
+        Span::call_site()
+    }
+
+    #[test]
+    fn test() {
+        // Test that a given `#[repr(...)]` attribute parses and returns the
+        // given `Repr` or error.
+        macro_rules! test {
+            ($(#[$attr:meta])* => $repr:expr) => {
+                test!(@inner $(#[$attr])* => Repr => Ok($repr));
+            };
+            // In the error case, the caller must explicitly provide the name of
+            // the `Repr` type to assist in type inference.
+            (@error $(#[$attr:meta])* => $typ:ident => $repr:expr) => {
+                test!(@inner $(#[$attr])* => $typ => Err($repr));
+            };
+            (@inner $(#[$attr:meta])* => $typ:ident => $repr:expr) => {
+                let attr: Attribute = parse_quote!($(#[$attr])*);
+                let mut got = $typ::from_attrs_inner(&[attr]);
+                let expect: Result<Repr<_, _>, _> = $repr;
+                if false {
+                    // Force Rust to infer `got` as having the same type as
+                    // `expect`.
+                    got = expect;
+                }
+                assert_eq!(got, expect, stringify!($(#[$attr])*));
+            };
+        }
+
+        use AlignRepr::*;
+        use CompoundRepr::*;
+        use PrimitiveRepr::*;
+        let nz = |n: u32| NonZeroU32::new(n).unwrap();
+
+        test!(#[repr(transparent)] => StructUnionRepr::Transparent(s()));
+        test!(#[repr()] => StructUnionRepr::Compound(Rust.into(), None));
+        test!(#[repr(packed)] => StructUnionRepr::Compound(Rust.into(), Some(Packed(nz(1)).into())));
+        test!(#[repr(packed(2))] => StructUnionRepr::Compound(Rust.into(), Some(Packed(nz(2)).into())));
+        test!(#[repr(align(1))] => StructUnionRepr::Compound(Rust.into(), Some(Align(nz(1)).into())));
+        test!(#[repr(align(2))] => StructUnionRepr::Compound(Rust.into(), Some(Align(nz(2)).into())));
+        test!(#[repr(C)] => StructUnionRepr::Compound(C.into(), None));
+        test!(#[repr(C, packed)] => StructUnionRepr::Compound(C.into(), Some(Packed(nz(1)).into())));
+        test!(#[repr(C, packed(2))] => StructUnionRepr::Compound(C.into(), Some(Packed(nz(2)).into())));
+        test!(#[repr(C, align(1))] => StructUnionRepr::Compound(C.into(), Some(Align(nz(1)).into())));
+        test!(#[repr(C, align(2))] => StructUnionRepr::Compound(C.into(), Some(Align(nz(2)).into())));
+
+        test!(#[repr(transparent)] => EnumRepr::Transparent(s()));
+        test!(#[repr()] => EnumRepr::Compound(Rust.into(), None));
+        test!(#[repr(align(1))] => EnumRepr::Compound(Rust.into(), Some(Align(nz(1)).into())));
+        test!(#[repr(align(2))] => EnumRepr::Compound(Rust.into(), Some(Align(nz(2)).into())));
+
+        macro_rules! for_each_compound_repr {
+            ($($r:tt => $var:expr),*) => {
+                $(
+                    test!(#[repr($r)] => EnumRepr::Compound($var.into(), None));
+                    test!(#[repr($r, align(1))] => EnumRepr::Compound($var.into(), Some(Align(nz(1)).into())));
+                    test!(#[repr($r, align(2))] => EnumRepr::Compound($var.into(), Some(Align(nz(2)).into())));
+                )*
+            }
+        }
+
+        for_each_compound_repr!(
+            C => C,
+            u8 => Primitive(U8),
+            u16 => Primitive(U16),
+            u32 => Primitive(U32),
+            u64 => Primitive(U64),
+            usize => Primitive(Usize),
+            i8 => Primitive(I8),
+            i16 => Primitive(I16),
+            i32 => Primitive(I32),
+            i64 => Primitive(I64),
+            isize => Primitive(Isize)
+        );
+
+        use FromAttrsError::*;
+        use FromRawReprsError::*;
+
+        // Run failure tests which are valid for both `StructUnionRepr` and
+        // `EnumRepr`.
+        macro_rules! for_each_repr_type {
+            ($($repr:ident),*) => {
+                $(
+                    // Invalid packed or align attributes
+                    test!(@error #[repr(packed(0))] => $repr => Unrecognized.into());
+                    test!(@error #[repr(packed(3))] => $repr => Unrecognized.into());
+                    test!(@error #[repr(align(0))] => $repr => Unrecognized.into());
+                    test!(@error #[repr(align(3))] => $repr => Unrecognized.into());
+
+                    // Conflicts
+                    test!(@error #[repr(transparent, transparent)] => $repr => FromRawReprs(Conflict).into());
+                    test!(@error #[repr(transparent, C)] => $repr => FromRawReprs(Conflict).into());
+                    test!(@error #[repr(transparent, Rust)] => $repr => FromRawReprs(Conflict).into());
+
+                    test!(@error #[repr(C, transparent)] => $repr => FromRawReprs(Conflict).into());
+                    test!(@error #[repr(C, C)] => $repr => FromRawReprs(Conflict).into());
+                    test!(@error #[repr(C, Rust)] => $repr => FromRawReprs(Conflict).into());
+
+                    test!(@error #[repr(Rust, transparent)] => $repr => FromRawReprs(Conflict).into());
+                    test!(@error #[repr(Rust, C)] => $repr => FromRawReprs(Conflict).into());
+                    test!(@error #[repr(Rust, Rust)] => $repr => FromRawReprs(Conflict).into());
+                )*
+            }
+        }
+
+        for_each_repr_type!(StructUnionRepr, EnumRepr);
+
+        // Enum-specific conflicts.
+        //
+        // We don't bother to test every combination since that would be a huge
+        // number (enums can have primitive reprs u8, u16, u32, u64, usize, i8,
+        // i16, i32, i64, and isize). Instead, since the conflict logic doesn't
+        // care what specific value of `PrimitiveRepr` is present, we assume
+        // that testing against u8 alone is fine.
+        test!(@error #[repr(transparent, u8)] => EnumRepr => FromRawReprs(Conflict).into());
+        test!(@error #[repr(u8, transparent)] => EnumRepr => FromRawReprs(Conflict).into());
+        test!(@error #[repr(C, u8)] => EnumRepr => FromRawReprs(Conflict).into());
+        test!(@error #[repr(u8, C)] => EnumRepr => FromRawReprs(Conflict).into());
+        test!(@error #[repr(Rust, u8)] => EnumRepr => FromRawReprs(Conflict).into());
+        test!(@error #[repr(u8, Rust)] => EnumRepr => FromRawReprs(Conflict).into());
+        test!(@error #[repr(u8, u8)] => EnumRepr => FromRawReprs(Conflict).into());
+
+        // Illegal struct/union reprs
+        test!(@error #[repr(u8)] => StructUnionRepr => FromRawReprs(Single(UnsupportedReprError)).into());
+        test!(@error #[repr(u16)] => StructUnionRepr => FromRawReprs(Single(UnsupportedReprError)).into());
+        test!(@error #[repr(u32)] => StructUnionRepr => FromRawReprs(Single(UnsupportedReprError)).into());
+        test!(@error #[repr(u64)] => StructUnionRepr => FromRawReprs(Single(UnsupportedReprError)).into());
+        test!(@error #[repr(usize)] => StructUnionRepr => FromRawReprs(Single(UnsupportedReprError)).into());
+        test!(@error #[repr(i8)] => StructUnionRepr => FromRawReprs(Single(UnsupportedReprError)).into());
+        test!(@error #[repr(i16)] => StructUnionRepr => FromRawReprs(Single(UnsupportedReprError)).into());
+        test!(@error #[repr(i32)] => StructUnionRepr => FromRawReprs(Single(UnsupportedReprError)).into());
+        test!(@error #[repr(i64)] => StructUnionRepr => FromRawReprs(Single(UnsupportedReprError)).into());
+        test!(@error #[repr(isize)] => StructUnionRepr => FromRawReprs(Single(UnsupportedReprError)).into());
+
+        // Illegal enum reprs
+        test!(@error #[repr(packed)] => EnumRepr => FromRawReprs(Single(UnsupportedReprError)).into());
+        test!(@error #[repr(packed(1))] => EnumRepr => FromRawReprs(Single(UnsupportedReprError)).into());
+        test!(@error #[repr(packed(2))] => EnumRepr => FromRawReprs(Single(UnsupportedReprError)).into());
+    }
+}
diff --git a/rust/zerocopy-derive/util.rs b/rust/zerocopy-derive/util.rs
new file mode 100644
index 000000000000..4ec28bf95758
--- /dev/null
+++ b/rust/zerocopy-derive/util.rs
@@ -0,0 +1,843 @@
+// Copyright 2019 The Fuchsia Authors
+//
+// Licensed under a BSD-style license <LICENSE-BSD>, Apache License, Version 2.0
+// <LICENSE-APACHE or https://www.apache.org/licenses/LICENSE-2.0>, or the MIT
+// license <LICENSE-MIT or https://opensource.org/licenses/MIT>, at your option.
+// This file may not be copied, modified, or distributed except according to
+// those terms.
+
+use std::num::NonZeroU32;
+
+use proc_macro2::{Span, TokenStream};
+use quote::{quote, quote_spanned, ToTokens};
+use syn::{
+    parse_quote, spanned::Spanned as _, Data, DataEnum, DataStruct, DataUnion, DeriveInput, Error,
+    Expr, ExprLit, Field, GenericParam, Ident, Index, Lit, LitStr, Meta, Path, Type, Variant,
+    Visibility, WherePredicate,
+};
+
+use crate::repr::{CompoundRepr, EnumRepr, PrimitiveRepr, Repr, Spanned};
+
+pub(crate) struct Ctx {
+    pub(crate) ast: DeriveInput,
+    pub(crate) zerocopy_crate: Path,
+
+    // The value of the last `#[zerocopy(on_error = ...)]` attribute, or `false`
+    // if none is provided.
+    pub(crate) skip_on_error: bool,
+
+    // The span of the last `#[zerocopy(on_error = ...)]` attribute, if any.
+    pub(crate) on_error_span: Option<proc_macro2::Span>,
+}
+
+impl Ctx {
+    /// Attempt to extract a crate path from the provided attributes. Defaults to
+    /// `::zerocopy` if not found.
+    pub(crate) fn try_from_derive_input(ast: DeriveInput) -> Result<Self, Error> {
+        let mut path = parse_quote!(::zerocopy);
+        let mut skip_on_error = false;
+        let mut on_error_span = None;
+
+        for attr in &ast.attrs {
+            if let Meta::List(ref meta_list) = attr.meta {
+                if meta_list.path.is_ident("zerocopy") {
+                    attr.parse_nested_meta(|meta| {
+                        if meta.path.is_ident("crate") {
+                            let expr = meta.value().and_then(|value| value.parse());
+                            if let Ok(Expr::Lit(ExprLit { lit: Lit::Str(lit), .. })) = expr {
+                                if let Ok(path_lit) = lit.parse::<Ident>() {
+                                    path = parse_quote!(::#path_lit);
+                                    return Ok(());
+                                }
+                            }
+
+                            return Err(Error::new(
+                                Span::call_site(),
+                                "`crate` attribute requires a path as the value",
+                            ));
+                        }
+
+                        if meta.path.is_ident("on_error") {
+                            on_error_span = Some(meta.path.span());
+                            let value = meta.value()?;
+                            let s: LitStr = value.parse()?;
+                            match s.value().as_str() {
+                                "skip" => skip_on_error = true,
+                                "fail" => skip_on_error = false,
+                                _ => return Err(Error::new(
+                                    s.span(),
+                                    "unrecognized value for `on_error` attribute from `zerocopy`; expected `skip` or `fail`",
+                                )),
+                            }
+                            return Ok(());
+                        }
+
+                        Err(Error::new(
+                            Span::call_site(),
+                            format!(
+                                "unknown attribute encountered: {}",
+                                meta.path.into_token_stream()
+                            ),
+                        ))
+                    })?;
+                }
+            }
+        }
+
+        Ok(Self { ast, zerocopy_crate: path, skip_on_error, on_error_span })
+    }
+
+    pub(crate) fn with_input(&self, input: &DeriveInput) -> Self {
+        Self {
+            ast: input.clone(),
+            zerocopy_crate: self.zerocopy_crate.clone(),
+            skip_on_error: self.skip_on_error,
+            on_error_span: self.on_error_span,
+        }
+    }
+
+    pub(crate) fn core_path(&self) -> TokenStream {
+        let zerocopy_crate = &self.zerocopy_crate;
+        quote!(#zerocopy_crate::util::macro_util::core_reexport)
+    }
+
+    pub(crate) fn cfg_compile_error(&self) -> TokenStream {
+        // By checking both during the compilation of the proc macro *and* in
+        // the generated code, we ensure that `--cfg
+        // zerocopy_unstable_derive_on_error` need only be passed *either* when
+        // compiling this crate *or* when compiling the user's crate. The former
+        // is preferable, but in some situations (such as when cross-compiling
+        // using `cargo build --target`), it doesn't get propagated to this
+        // crate's build by default.
+        if cfg!(zerocopy_unstable_derive_on_error) {
+            quote!()
+        } else if let Some(span) = self.on_error_span {
+            let core = self.core_path();
+            let error_message = "`on_error` is experimental; pass '--cfg zerocopy_unstable_derive_on_error' to enable";
+            quote::quote_spanned! {span=>
+                #[allow(unused_attributes, unexpected_cfgs)]
+                const _: () = {
+                    #[cfg(not(zerocopy_unstable_derive_on_error))]
+                    #core::compile_error!(#error_message);
+                };
+            }
+        } else {
+            quote!()
+        }
+    }
+
+    pub(crate) fn error_or_skip<E>(&self, error: E) -> Result<TokenStream, E> {
+        if self.skip_on_error {
+            Ok(self.cfg_compile_error())
+        } else {
+            Err(error)
+        }
+    }
+}
+
+pub(crate) trait DataExt {
+    /// Extracts the names and types of all fields. For enums, extracts the
+    /// names and types of fields from each variant. For tuple structs, the
+    /// names are the indices used to index into the struct (ie, `0`, `1`, etc).
+    ///
+    /// FIXME: Extracting field names for enums doesn't really make sense. Types
+    /// makes sense because we don't care about where they live - we just care
+    /// about transitive ownership. But for field names, we'd only use them when
+    /// generating is_bit_valid, which cares about where they live.
+    fn fields(&self) -> Vec<(&Visibility, TokenStream, &Type)>;
+
+    fn variants(&self) -> Vec<(Option<&Variant>, Vec<(&Visibility, TokenStream, &Type)>)>;
+
+    fn tag(&self) -> Option<Ident>;
+}
+
+impl DataExt for Data {
+    fn fields(&self) -> Vec<(&Visibility, TokenStream, &Type)> {
+        match self {
+            Data::Struct(strc) => strc.fields(),
+            Data::Enum(enm) => enm.fields(),
+            Data::Union(un) => un.fields(),
+        }
+    }
+
+    fn variants(&self) -> Vec<(Option<&Variant>, Vec<(&Visibility, TokenStream, &Type)>)> {
+        match self {
+            Data::Struct(strc) => strc.variants(),
+            Data::Enum(enm) => enm.variants(),
+            Data::Union(un) => un.variants(),
+        }
+    }
+
+    fn tag(&self) -> Option<Ident> {
+        match self {
+            Data::Struct(strc) => strc.tag(),
+            Data::Enum(enm) => enm.tag(),
+            Data::Union(un) => un.tag(),
+        }
+    }
+}
+
+impl DataExt for DataStruct {
+    fn fields(&self) -> Vec<(&Visibility, TokenStream, &Type)> {
+        map_fields(&self.fields)
+    }
+
+    fn variants(&self) -> Vec<(Option<&Variant>, Vec<(&Visibility, TokenStream, &Type)>)> {
+        vec![(None, self.fields())]
+    }
+
+    fn tag(&self) -> Option<Ident> {
+        None
+    }
+}
+
+impl DataExt for DataEnum {
+    fn fields(&self) -> Vec<(&Visibility, TokenStream, &Type)> {
+        map_fields(self.variants.iter().flat_map(|var| &var.fields))
+    }
+
+    fn variants(&self) -> Vec<(Option<&Variant>, Vec<(&Visibility, TokenStream, &Type)>)> {
+        self.variants.iter().map(|var| (Some(var), map_fields(&var.fields))).collect()
+    }
+
+    fn tag(&self) -> Option<Ident> {
+        Some(Ident::new("___ZerocopyTag", Span::call_site()))
+    }
+}
+
+impl DataExt for DataUnion {
+    fn fields(&self) -> Vec<(&Visibility, TokenStream, &Type)> {
+        map_fields(&self.fields.named)
+    }
+
+    fn variants(&self) -> Vec<(Option<&Variant>, Vec<(&Visibility, TokenStream, &Type)>)> {
+        vec![(None, self.fields())]
+    }
+
+    fn tag(&self) -> Option<Ident> {
+        None
+    }
+}
+
+fn map_fields<'a>(
+    fields: impl 'a + IntoIterator<Item = &'a Field>,
+) -> Vec<(&'a Visibility, TokenStream, &'a Type)> {
+    fields
+        .into_iter()
+        .enumerate()
+        .map(|(idx, f)| {
+            (
+                &f.vis,
+                f.ident
+                    .as_ref()
+                    .map(ToTokens::to_token_stream)
+                    .unwrap_or_else(|| Index::from(idx).to_token_stream()),
+                &f.ty,
+            )
+        })
+        .collect()
+}
+
+pub(crate) fn to_ident_str(t: &impl ToString) -> String {
+    let s = t.to_string();
+    if let Some(stripped) = s.strip_prefix("r#") {
+        stripped.to_string()
+    } else {
+        s
+    }
+}
+
+/// This enum describes what kind of padding check needs to be generated for the
+/// associated impl.
+pub(crate) enum PaddingCheck {
+    /// Check that the sum of the fields' sizes exactly equals the struct's
+    /// size.
+    Struct,
+    /// Check that a `repr(C)` struct has no padding.
+    ReprCStruct,
+    /// Check that the size of each field exactly equals the union's size.
+    Union,
+    /// Check that every variant of the enum contains no padding.
+    ///
+    /// Because doing so requires a tag enum, this padding check requires an
+    /// additional `TokenStream` which defines the tag enum as `___ZerocopyTag`.
+    Enum { tag_type_definition: TokenStream },
+}
+
+impl PaddingCheck {
+    /// Returns the idents of the trait to use and the macro to call in order to
+    /// validate that a type passes the relevant padding check.
+    pub(crate) fn validator_trait_and_macro_idents(&self) -> (Ident, Ident) {
+        let (trt, mcro) = match self {
+            PaddingCheck::Struct => ("PaddingFree", "struct_padding"),
+            PaddingCheck::ReprCStruct => ("DynamicPaddingFree", "repr_c_struct_has_padding"),
+            PaddingCheck::Union => ("PaddingFree", "union_padding"),
+            PaddingCheck::Enum { .. } => ("PaddingFree", "enum_padding"),
+        };
+
+        let trt = Ident::new(trt, Span::call_site());
+        let mcro = Ident::new(mcro, Span::call_site());
+        (trt, mcro)
+    }
+
+    /// Sometimes performing the padding check requires some additional
+    /// "context" code. For enums, this is the definition of the tag enum.
+    pub(crate) fn validator_macro_context(&self) -> Option<&TokenStream> {
+        match self {
+            PaddingCheck::Struct | PaddingCheck::ReprCStruct | PaddingCheck::Union => None,
+            PaddingCheck::Enum { tag_type_definition } => Some(tag_type_definition),
+        }
+    }
+}
+
+#[derive(Clone)]
+pub(crate) enum Trait {
+    KnownLayout,
+    HasTag,
+    HasField {
+        variant_id: Box<Expr>,
+        field: Box<Type>,
+        field_id: Box<Expr>,
+    },
+    ProjectField {
+        variant_id: Box<Expr>,
+        field: Box<Type>,
+        field_id: Box<Expr>,
+        invariants: Box<Type>,
+    },
+    Immutable,
+    TryFromBytes,
+    FromZeros,
+    FromBytes,
+    IntoBytes,
+    Unaligned,
+    Sized,
+    ByteHash,
+    ByteEq,
+    SplitAt,
+}
+
+impl ToTokens for Trait {
+    fn to_tokens(&self, tokens: &mut TokenStream) {
+        // According to [1], the format of the derived `Debug`` output is not
+        // stable and therefore not guaranteed to represent the variant names.
+        // Indeed with the (unstable) `fmt-debug` compiler flag [2], it can
+        // return only a minimalized output or empty string. To make sure this
+        // code will work in the future and independent of the compiler flag, we
+        // translate the variants to their names manually here.
+        //
+        // [1] https://doc.rust-lang.org/1.81.0/std/fmt/trait.Debug.html#stability
+        // [2] https://doc.rust-lang.org/beta/unstable-book/compiler-flags/fmt-debug.html
+        let s = match self {
+            Trait::HasField { .. } => "HasField",
+            Trait::ProjectField { .. } => "ProjectField",
+            Trait::KnownLayout => "KnownLayout",
+            Trait::HasTag => "HasTag",
+            Trait::Immutable => "Immutable",
+            Trait::TryFromBytes => "TryFromBytes",
+            Trait::FromZeros => "FromZeros",
+            Trait::FromBytes => "FromBytes",
+            Trait::IntoBytes => "IntoBytes",
+            Trait::Unaligned => "Unaligned",
+            Trait::Sized => "Sized",
+            Trait::ByteHash => "ByteHash",
+            Trait::ByteEq => "ByteEq",
+            Trait::SplitAt => "SplitAt",
+        };
+        let ident = Ident::new(s, Span::call_site());
+        let arguments: Option<syn::AngleBracketedGenericArguments> = match self {
+            Trait::HasField { variant_id, field, field_id } => {
+                Some(parse_quote!(<#field, #variant_id, #field_id>))
+            }
+            Trait::ProjectField { variant_id, field, field_id, invariants } => {
+                Some(parse_quote!(<#field, #invariants, #variant_id, #field_id>))
+            }
+            Trait::KnownLayout
+            | Trait::HasTag
+            | Trait::Immutable
+            | Trait::TryFromBytes
+            | Trait::FromZeros
+            | Trait::FromBytes
+            | Trait::IntoBytes
+            | Trait::Unaligned
+            | Trait::Sized
+            | Trait::ByteHash
+            | Trait::ByteEq
+            | Trait::SplitAt => None,
+        };
+        tokens.extend(quote!(#ident #arguments));
+    }
+}
+
+impl Trait {
+    pub(crate) fn crate_path(&self, ctx: &Ctx) -> Path {
+        let zerocopy_crate = &ctx.zerocopy_crate;
+        let core = ctx.core_path();
+        match self {
+            Self::Sized => parse_quote!(#core::marker::#self),
+            _ => parse_quote!(#zerocopy_crate::#self),
+        }
+    }
+}
+
+pub(crate) enum TraitBound {
+    Slf,
+    Other(Trait),
+}
+
+pub(crate) enum FieldBounds<'a> {
+    None,
+    All(&'a [TraitBound]),
+    Trailing(&'a [TraitBound]),
+    Explicit(Vec<WherePredicate>),
+}
+
+impl<'a> FieldBounds<'a> {
+    pub(crate) const ALL_SELF: FieldBounds<'a> = FieldBounds::All(&[TraitBound::Slf]);
+    pub(crate) const TRAILING_SELF: FieldBounds<'a> = FieldBounds::Trailing(&[TraitBound::Slf]);
+}
+
+pub(crate) enum SelfBounds<'a> {
+    None,
+    All(&'a [Trait]),
+}
+
+// FIXME(https://github.com/rust-lang/rust-clippy/issues/12908): This is a false
+// positive. Explicit lifetimes are actually necessary here.
+#[allow(clippy::needless_lifetimes)]
+impl<'a> SelfBounds<'a> {
+    pub(crate) const SIZED: Self = Self::All(&[Trait::Sized]);
+}
+
+/// Normalizes a slice of bounds by replacing [`TraitBound::Slf`] with `slf`.
+pub(crate) fn normalize_bounds<'a>(
+    slf: &'a Trait,
+    bounds: &'a [TraitBound],
+) -> impl 'a + Iterator<Item = Trait> {
+    bounds.iter().map(move |bound| match bound {
+        TraitBound::Slf => slf.clone(),
+        TraitBound::Other(trt) => trt.clone(),
+    })
+}
+
+pub(crate) struct ImplBlockBuilder<'a> {
+    ctx: &'a Ctx,
+    data: &'a dyn DataExt,
+    trt: Trait,
+    field_type_trait_bounds: FieldBounds<'a>,
+    self_type_trait_bounds: SelfBounds<'a>,
+    padding_check: Option<PaddingCheck>,
+    param_extras: Vec<GenericParam>,
+    inner_extras: Option<TokenStream>,
+    outer_extras: Option<TokenStream>,
+}
+
+impl<'a> ImplBlockBuilder<'a> {
+    pub(crate) fn new(
+        ctx: &'a Ctx,
+        data: &'a dyn DataExt,
+        trt: Trait,
+        field_type_trait_bounds: FieldBounds<'a>,
+    ) -> Self {
+        Self {
+            ctx,
+            data,
+            trt,
+            field_type_trait_bounds,
+            self_type_trait_bounds: SelfBounds::None,
+            padding_check: None,
+            param_extras: Vec::new(),
+            inner_extras: None,
+            outer_extras: None,
+        }
+    }
+
+    pub(crate) fn self_type_trait_bounds(mut self, self_type_trait_bounds: SelfBounds<'a>) -> Self {
+        self.self_type_trait_bounds = self_type_trait_bounds;
+        self
+    }
+
+    pub(crate) fn padding_check<P: Into<Option<PaddingCheck>>>(mut self, padding_check: P) -> Self {
+        self.padding_check = padding_check.into();
+        self
+    }
+
+    pub(crate) fn param_extras(mut self, param_extras: Vec<GenericParam>) -> Self {
+        self.param_extras.extend(param_extras);
+        self
+    }
+
+    pub(crate) fn inner_extras(mut self, inner_extras: TokenStream) -> Self {
+        self.inner_extras = Some(inner_extras);
+        self
+    }
+
+    pub(crate) fn outer_extras<T: Into<Option<TokenStream>>>(mut self, outer_extras: T) -> Self {
+        self.outer_extras = outer_extras.into();
+        self
+    }
+
+    pub(crate) fn build(self) -> TokenStream {
+        // In this documentation, we will refer to this hypothetical struct:
+        //
+        //   #[derive(FromBytes)]
+        //   struct Foo<T, I: Iterator>
+        //   where
+        //       T: Copy,
+        //       I: Clone,
+        //       I::Item: Clone,
+        //   {
+        //       a: u8,
+        //       b: T,
+        //       c: I::Item,
+        //   }
+        //
+        // We extract the field types, which in this case are `u8`, `T`, and
+        // `I::Item`. We re-use the existing parameters and where clauses. If
+        // `require_trait_bound == true` (as it is for `FromBytes), we add where
+        // bounds for each field's type:
+        //
+        //   impl<T, I: Iterator> FromBytes for Foo<T, I>
+        //   where
+        //       T: Copy,
+        //       I: Clone,
+        //       I::Item: Clone,
+        //       T: FromBytes,
+        //       I::Item: FromBytes,
+        //   {
+        //   }
+        //
+        // NOTE: It is standard practice to only emit bounds for the type
+        // parameters themselves, not for field types based on those parameters
+        // (e.g., `T` vs `T::Foo`). For a discussion of why this is standard
+        // practice, see https://github.com/rust-lang/rust/issues/26925.
+        //
+        // The reason we diverge from this standard is that doing it that way
+        // for us would be unsound. E.g., consider a type, `T` where `T:
+        // FromBytes` but `T::Foo: !FromBytes`. It would not be sound for us to
+        // accept a type with a `T::Foo` field as `FromBytes` simply because `T:
+        // FromBytes`.
+        //
+        // While there's no getting around this requirement for us, it does have
+        // the pretty serious downside that, when lifetimes are involved, the
+        // trait solver ties itself in knots:
+        //
+        //     #[derive(Unaligned)]
+        //     #[repr(C)]
+        //     struct Dup<'a, 'b> {
+        //         a: PhantomData<&'a u8>,
+        //         b: PhantomData<&'b u8>,
+        //     }
+        //
+        //     error[E0283]: type annotations required: cannot resolve `core::marker::PhantomData<&'a u8>: zerocopy::Unaligned`
+        //      --> src/main.rs:6:10
+        //       |
+        //     6 | #[derive(Unaligned)]
+        //       |          ^^^^^^^^^
+        //       |
+        //       = note: required by `zerocopy::Unaligned`
+
+        let type_ident = &self.ctx.ast.ident;
+        let trait_path = self.trt.crate_path(self.ctx);
+        let fields = self.data.fields();
+        let variants = self.data.variants();
+        let tag = self.data.tag();
+        let zerocopy_crate = &self.ctx.zerocopy_crate;
+
+        fn bound_tt(ty: &Type, traits: impl Iterator<Item = Trait>, ctx: &Ctx) -> WherePredicate {
+            let traits = traits.map(|t| t.crate_path(ctx));
+            parse_quote!(#ty: #(#traits)+*)
+        }
+        let field_type_bounds: Vec<_> = match (self.field_type_trait_bounds, &fields[..]) {
+            (FieldBounds::All(traits), _) => fields
+                .iter()
+                .map(|(_vis, _name, ty)| {
+                    bound_tt(ty, normalize_bounds(&self.trt, traits), self.ctx)
+                })
+                .collect(),
+            (FieldBounds::None, _) | (FieldBounds::Trailing(..), []) => vec![],
+            (FieldBounds::Trailing(traits), [.., last]) => {
+                vec![bound_tt(last.2, normalize_bounds(&self.trt, traits), self.ctx)]
+            }
+            (FieldBounds::Explicit(bounds), _) => bounds,
+        };
+
+        let padding_check_bound = self
+            .padding_check
+            .map(|check| {
+                // Parse the repr for `align` and `packed` modifiers. Note that
+                // `Repr::<PrimitiveRepr, NonZeroU32>` is more permissive than
+                // what Rust supports for structs, enums, or unions, and thus
+                // reliably extracts these modifiers for any kind of type.
+                let repr =
+                    Repr::<PrimitiveRepr, NonZeroU32>::from_attrs(&self.ctx.ast.attrs).unwrap();
+                let core = self.ctx.core_path();
+                let option = quote! { #core::option::Option };
+                let nonzero = quote! { #core::num::NonZeroUsize };
+                let none = quote! { #option::None::<#nonzero> };
+                let repr_align =
+                    repr.get_align().map(|spanned| {
+                        let n = spanned.t.get();
+                        quote_spanned! { spanned.span => (#nonzero::new(#n as usize)) }
+                    }).unwrap_or(quote! { (#none) });
+                let repr_packed =
+                    repr.get_packed().map(|packed| {
+                        let n = packed.get();
+                        quote! { (#nonzero::new(#n as usize)) }
+                    }).unwrap_or(quote! { (#none) });
+                let variant_types = variants.iter().map(|(_, fields)| {
+                    let types = fields.iter().map(|(_vis, _name, ty)| ty);
+                    quote!([#((#types)),*])
+                });
+                let validator_context = check.validator_macro_context();
+                let (trt, validator_macro) = check.validator_trait_and_macro_idents();
+                let t = tag.iter();
+                parse_quote! {
+                    (): #zerocopy_crate::util::macro_util::#trt<
+                        Self,
+                        {
+                            #validator_context
+                            #zerocopy_crate::#validator_macro!(Self, #repr_align, #repr_packed, #(#t,)* #(#variant_types),*)
+                        }
+                    >
+                }
+            });
+
+        let self_bounds: Option<WherePredicate> = match self.self_type_trait_bounds {
+            SelfBounds::None => None,
+            SelfBounds::All(traits) => {
+                Some(bound_tt(&parse_quote!(Self), traits.iter().cloned(), self.ctx))
+            }
+        };
+
+        let bounds = self
+            .ctx
+            .ast
+            .generics
+            .where_clause
+            .as_ref()
+            .map(|where_clause| where_clause.predicates.iter())
+            .into_iter()
+            .flatten()
+            .chain(field_type_bounds.iter())
+            .chain(padding_check_bound.iter())
+            .chain(self_bounds.iter());
+
+        // The parameters with trait bounds, but without type defaults.
+        let mut params: Vec<_> = self
+            .ctx
+            .ast
+            .generics
+            .params
+            .clone()
+            .into_iter()
+            .map(|mut param| {
+                match &mut param {
+                    GenericParam::Type(ty) => ty.default = None,
+                    GenericParam::Const(cnst) => cnst.default = None,
+                    GenericParam::Lifetime(_) => {}
+                }
+                parse_quote!(#param)
+            })
+            .chain(self.param_extras)
+            .collect();
+
+        // For MSRV purposes, ensure that lifetimes precede types precede const
+        // generics.
+        params.sort_by_cached_key(|param| match param {
+            GenericParam::Lifetime(_) => 0,
+            GenericParam::Type(_) => 1,
+            GenericParam::Const(_) => 2,
+        });
+
+        // The identifiers of the parameters without trait bounds or type
+        // defaults.
+        let param_idents = self.ctx.ast.generics.params.iter().map(|param| match param {
+            GenericParam::Type(ty) => {
+                let ident = &ty.ident;
+                quote!(#ident)
+            }
+            GenericParam::Lifetime(l) => {
+                let ident = &l.lifetime;
+                quote!(#ident)
+            }
+            GenericParam::Const(cnst) => {
+                let ident = &cnst.ident;
+                quote!({#ident})
+            }
+        });
+
+        let inner_extras = self.inner_extras;
+        let allow_trivial_bounds =
+            if self.ctx.skip_on_error { quote!(#[allow(trivial_bounds)]) } else { quote!() };
+        let impl_tokens = quote! {
+            #allow_trivial_bounds
+            unsafe impl < #(#params),* > #trait_path for #type_ident < #(#param_idents),* >
+            where
+                #(#bounds,)*
+            {
+                fn only_derive_is_allowed_to_implement_this_trait() {}
+
+                #inner_extras
+            }
+        };
+
+        let outer_extras = self.outer_extras.filter(|e| !e.is_empty());
+        let cfg_compile_error = self.ctx.cfg_compile_error();
+        const_block([Some(cfg_compile_error), Some(impl_tokens), outer_extras])
+    }
+}
+
+// A polyfill for `Option::then_some`, which was added after our MSRV.
+//
+// The `#[allow(unused)]` is necessary because, on sufficiently recent toolchain
+// versions, `b.then_some(...)` resolves to the inherent method rather than to
+// this trait, and so this trait is considered unused.
+//
+// FIXME(#67): Remove this once our MSRV is >= 1.62.
+#[allow(unused)]
+trait BoolExt {
+    fn then_some<T>(self, t: T) -> Option<T>;
+}
+
+impl BoolExt for bool {
+    fn then_some<T>(self, t: T) -> Option<T> {
+        if self {
+            Some(t)
+        } else {
+            None
+        }
+    }
+}
+
+pub(crate) fn const_block(items: impl IntoIterator<Item = Option<TokenStream>>) -> TokenStream {
+    let items = items.into_iter().flatten();
+    quote! {
+        #[allow(
+            // FIXME(#553): Add a test that generates a warning when
+            // `#[allow(deprecated)]` isn't present.
+            deprecated,
+            // Required on some rustc versions due to a lint that is only
+            // triggered when `derive(KnownLayout)` is applied to `repr(C)`
+            // structs that are generated by macros. See #2177 for details.
+            private_bounds,
+            non_local_definitions,
+            non_camel_case_types,
+            non_upper_case_globals,
+            non_snake_case,
+            non_ascii_idents,
+            clippy::missing_inline_in_public_items,
+        )]
+        #[deny(ambiguous_associated_items)]
+        // While there are not currently any warnings that this suppresses
+        // (that we're aware of), it's good future-proofing hygiene.
+        #[automatically_derived]
+        const _: () = {
+            #(#items)*
+        };
+    }
+}
+pub(crate) fn generate_tag_enum(ctx: &Ctx, repr: &EnumRepr, data: &DataEnum) -> TokenStream {
+    let zerocopy_crate = &ctx.zerocopy_crate;
+    let variants = data.variants.iter().map(|v| {
+        let ident = &v.ident;
+        if let Some((eq, discriminant)) = &v.discriminant {
+            quote! { #ident #eq #discriminant }
+        } else {
+            quote! { #ident }
+        }
+    });
+
+    // Don't include any `repr(align)` when generating the tag enum, as that
+    // could add padding after the tag but before any variants, which is not the
+    // correct behavior.
+    let repr = match repr {
+        EnumRepr::Transparent(span) => quote::quote_spanned! { *span => #[repr(transparent)] },
+        EnumRepr::Compound(c, _) => quote! { #c },
+    };
+
+    quote! {
+        #repr
+        #[allow(dead_code)]
+        pub enum ___ZerocopyTag {
+            #(#variants,)*
+        }
+
+        // SAFETY: `___ZerocopyTag` has no fields, and so it does not permit
+        // interior mutation.
+        unsafe impl #zerocopy_crate::Immutable for ___ZerocopyTag {
+            fn only_derive_is_allowed_to_implement_this_trait() {}
+        }
+    }
+}
+pub(crate) fn enum_size_from_repr(repr: &EnumRepr) -> Result<usize, Error> {
+    use CompoundRepr::*;
+    use PrimitiveRepr::*;
+    use Repr::*;
+    match repr {
+        Transparent(span)
+        | Compound(
+            Spanned {
+                t: C | Rust | Primitive(U32 | I32 | U64 | I64 | U128 | I128 | Usize | Isize),
+                span,
+            },
+            _,
+        ) => Err(Error::new(
+            *span,
+            "`FromBytes` only supported on enums with `#[repr(...)]` attributes `u8`, `i8`, `u16`, or `i16`",
+        )),
+        Compound(Spanned { t: Primitive(U8 | I8), span: _ }, _align) => Ok(8),
+        Compound(Spanned { t: Primitive(U16 | I16), span: _ }, _align) => Ok(16),
+    }
+}
+
+#[cfg(test)]
+pub(crate) mod testutil {
+    use proc_macro2::TokenStream;
+    use syn::visit::{self, Visit};
+
+    /// Checks for hygiene violations in the generated code.
+    ///
+    /// # Panics
+    ///
+    /// Panics if a hygiene violation is found.
+    pub(crate) fn check_hygiene(ts: TokenStream) {
+        struct AmbiguousItemVisitor;
+
+        impl<'ast> Visit<'ast> for AmbiguousItemVisitor {
+            fn visit_path(&mut self, i: &'ast syn::Path) {
+                if i.segments.len() > 1 && i.segments.first().unwrap().ident == "Self" {
+                    panic!(
+                    "Found ambiguous path `{}` in generated output. \
+                     All associated item access must be fully qualified (e.g., `<Self as Trait>::Item`) \
+                     to prevent hygiene issues.",
+                    quote::quote!(#i)
+                );
+                }
+                visit::visit_path(self, i);
+            }
+        }
+
+        let file = syn::parse2::<syn::File>(ts).expect("failed to parse generated output as File");
+        AmbiguousItemVisitor.visit_file(&file);
+    }
+
+    #[test]
+    fn test_check_hygiene_success() {
+        check_hygiene(quote::quote! {
+            fn foo() {
+                let _ = <Self as Trait>::Item;
+            }
+        });
+    }
+
+    #[test]
+    #[should_panic(expected = "Found ambiguous path `Self :: Ambiguous`")]
+    fn test_check_hygiene_failure() {
+        check_hygiene(quote::quote! {
+            fn foo() {
+                let _ = Self::Ambiguous;
+            }
+        });
+    }
+}
-- 
2.54.0


