Return-Path: <linux-kbuild+bounces-13634-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6VmxMRbRJmonlAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13634-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 16:26:30 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F45065727B
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 16:26:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LV0Fkgfz;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13634-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13634-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4AAC33081EA8
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jun 2026 14:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6927C3CB2C7;
	Mon,  8 Jun 2026 14:16:18 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5241829D294;
	Mon,  8 Jun 2026 14:16:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928178; cv=none; b=e128ddtdw35KXW8L/qMIlsLcOzdYKUOvGEE1dszYakspRzbgRYzKuCvHz4/W3rCsltsLP+qKghZADYT1jEEyZaXCOtFWBaXFCwysjOY1ck4iU45zJtV0pPHIpx29O8/kZJvk1t6APPVk5b0gK0q8pWH9luIV997JE2eNrnRelGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928178; c=relaxed/simple;
	bh=79+wVygRz8kxthL8f8NLi5+HlmeDqGWpZt0sixJKgnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u2lw0FgliI3jiLbsfXNu5wFqIm9QpNsKavbaWsB+os8V54a66zQbbsMtXpilguqysgMKhsJ1R2mbPaK5vQFPOVobMsspBmxz0ixe+yUuFGRishl/0YbAtvqxJKFFuaORjbVPWziCUxgbN3V333rl34Ze8LBjiX0zBWG7cnVcqfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LV0Fkgfz; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB901F00899;
	Mon,  8 Jun 2026 14:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780928177;
	bh=m/mAdoA3TVzFqmIRKiVaBYYF7SrUT7vzLc7ae5JPMJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LV0FkgfzRjIoJYF3h8APSKrSZszBdihp4nIU4o0iUkGFO6zBJ6v3aLl/DKS8tdItr
	 7Nao64FpLX4pnwz8xIpKhe11ZdUZkq/u+WO0kIKkhJU3/Jxw4lhOJTjl1Wm3nJRNjO
	 4cL30GZdSd4xe871wkFyy7P285RWn7tZkOGBi+P02AOU3ygeszprkH7d3O2iXJhfAv
	 zkaLP2GdIBM2l8BKI0d62ut6dlJvpNJz2rxxhN4YoSbsyl6GAGWlHEk7Zkqd0INDJR
	 j29f2OxXWmpqxLcDiH9Ov0yYVQLU6fA+tc1VGB6SEJBLt7hb0yrNzdjaTRLNKgVurV
	 2Y4nEmYzSIp4g==
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
	Jack Wrenn <jswrenn@google.com>
Subject: [PATCH v2 15/19] rust: zerocopy-derive: avoid generating non-ASCII identifiers
Date: Mon,  8 Jun 2026 16:14:34 +0200
Message-ID: <20260608141439.182634-16-ojeda@kernel.org>
In-Reply-To: <20260608141439.182634-1-ojeda@kernel.org>
References: <20260608141439.182634-1-ojeda@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13634-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:joshlf@google.com,m:jswrenn@google.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4F45065727B

Linux is built with `-Dnon_ascii_idents`. However, `zerocopy-derive`
uses a non-ASCII character (`ẕ`) internally, which in turn triggers
the lint when attempting to use derives like `FromBytes`:

    error: identifier contains non-ASCII characters
       --> rust/kernel/lib.rs:153:9
        |
    153 |         a: u32,
        |         ^
        |
        = note: requested on the command line with `-D non-ascii-idents`

This was already noticed by another project using
`#![deny(non_ascii_idents)]` [1]. `zerocopy` added an
`#[allow(non_ascii_idents)]` [2], but it does not work since, at the
moment, the `non_ascii_idents` lint is a `crate_level_only` one, and thus
`allow`s only work at the crate root level.

Due to this, an issue about relaxing this restriction was created in
upstream Rust [3] some months ago.

Thus work around it here by using another prefix. The likelihood of a
collision is very small for us, since we control the callers, and this
will hopefully be fixed soon at either the `zerocopy` or the Rust level.

I filed an issue [4] about it with upstream `zerocopy` as requested
and we discussed this with upstream Rust and `zerocopy`: the Rust issue
got nominated and a PR [5] to relax the restriction was submitted by
Joshua. Upstream `zerocopy` prefers that approach, so if Rust merges it,
then it means we will be able to remove the workaround when we bump the
MSRV, thus likely late 2027, since we follow Debian Stable.

Cc: Joshua Liebow-Feeser <joshlf@google.com>
Cc: Jack Wrenn <jswrenn@google.com>
Link: https://github.com/google/zerocopy/issues/2880 [1]
Link: https://github.com/google/zerocopy/pull/2882 [2]
Link: https://github.com/rust-lang/rust/issues/151025 [3]
Link: https://github.com/google/zerocopy/issues/3427 [4]
Link: https://github.com/rust-lang/rust/pull/157497 [5]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/zerocopy-derive/derive/try_from_bytes.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/zerocopy-derive/derive/try_from_bytes.rs b/rust/zerocopy-derive/derive/try_from_bytes.rs
index ce9c926d5b8e..a3e4a75631a5 100644
--- a/rust/zerocopy-derive/derive/try_from_bytes.rs
+++ b/rust/zerocopy-derive/derive/try_from_bytes.rs
@@ -457,7 +457,7 @@ fn derive_has_field_struct_union(ctx: &Ctx, data: &dyn DataExt) -> TokenStream {
     }
 
     let field_tokens = fields.iter().map(|(vis, ident, _)| {
-        let ident = ident!(("ẕ{}", ident), ident.span());
+        let ident = ident!(("__z{}", ident), ident.span());
         quote!(
             #vis enum #ident {}
         )
@@ -487,7 +487,7 @@ fn derive_has_field_struct_union(ctx: &Ctx, data: &dyn DataExt) -> TokenStream {
         })
         .build();
     let has_fields = fields.iter().map(move |(_, ident, ty)| {
-        let field_token = ident!(("ẕ{}", ident), ident.span());
+        let field_token = ident!(("__z{}", ident), ident.span());
         let field: Box<Type> = parse_quote!(#field_token);
         let field_id: Box<Expr> = parse_quote!({ #zerocopy_crate::ident_id!(#ident) });
         let has_field_trait = Trait::HasField {
-- 
2.54.0


