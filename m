Return-Path: <linux-kbuild+bounces-13629-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ysFIATbRJmorlAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13629-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 16:27:02 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CACA65728E
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 16:27:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=D1uhQS6e;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13629-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13629-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D134305B11A
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jun 2026 14:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE01C3C9897;
	Mon,  8 Jun 2026 14:15:58 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D082D3C3BFE;
	Mon,  8 Jun 2026 14:15:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928158; cv=none; b=syvpLffP3F+Megy+wNFCWUMo8jGLxSzpXh9FqxDM09bdi54T1UNY8aORp8PNbe6C8Q3BwaDG+0TxPnNfK2jRwzCr9VuEaIHAfxCHZlGdM8OVN8RRX63gQN5TBclE4ufPn26mxyX2xs3c7S2flz7BlJEqtN4AA6uyT+8CbggIqao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928158; c=relaxed/simple;
	bh=MfLV+kTlIQ0BeC6GkQ48yFGsm83IP5CdNE3O1XneOVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=to6B/zO0DvSHfGSOWb1bl/SMK3+QPRfrZpqpIT5UTHrJDyX4fgsr5DuiKnnm1eUmSU4atszB6zgT8aoCEo+PeuBy0sfAi/NGabGwGJQsj4S8SOke0rXMyafsE1W0YasA88lFpzROghOcbgId7Ct8EEVI/YMgx1YWOml/epMJNLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D1uhQS6e; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D2C1F00898;
	Mon,  8 Jun 2026 14:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780928157;
	bh=5B1FBLVcAoN72DzWUuQf30bELwV8iq6xOUGrzsBm6HM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=D1uhQS6edfiv3C/ZPVouNv6aDzk5VGET/3b6lsGRH63GzpKAz4V3C8/otjCPasul4
	 u9+84QAFj/GSpEDkProljMpBCWkVuNRhobh1aWOtS21YxYaQHvnXtP43eiX2L4W+8X
	 orFMbw65vkzvJOY1A9A8RxquYH0Vtyngd+c0WTdAPnC/L2MZpFhJFRi1k6Qu4o7270
	 RvB1iIXc37CGu3Ewq9s+cWgK1f3qylWUJLGq1c36SWOVsWzODp3vXMnp5+Pnyewrpy
	 a3VUqvrNc50MczG7xgxCyCRHqB59Jva0+P8/39UZ13QQZeSZpc0xS8Abnj1rJCYwOP
	 GCksx1UyGH5TQ==
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
Subject: [PATCH v2 10/19] rust: zerocopy: remove float `Display` support
Date: Mon,  8 Jun 2026 16:14:29 +0200
Message-ID: <20260608141439.182634-11-ojeda@kernel.org>
In-Reply-To: <20260608141439.182634-1-ojeda@kernel.org>
References: <20260608141439.182634-1-ojeda@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13629-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:joshlf@google.com,m:jswrenn@google.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6CACA65728E

The kernel builds `core` with the `no_fp_fmt_parse` `--cfg`, which means
we do not have support for formatting floating point primitives. However,
`zerocopy` expects those implementations to exist:

    error[E0277]: `f32` doesn't implement `core::fmt::Display`
       --> rust/zerocopy/src/byteorder.rs:172:29
        |
    172 |                   $trait::fmt(&self.get(), f)
        |                   ----------- ^^^^^^^^^^^ the trait `core::fmt::Display` is not implemented for `f32`
        |                   |
        |                   required by a bound introduced by this call
    ...
    907 | / define_type!(
    908 | |     An,
    909 | |     "A 32-bit floating point number",
    910 | |     F32,
    ...   |
    922 | |     []
    923 | | );
        | |_- in this macro invocation
        |
        = help: the following other types implement trait `core::fmt::Display`:
                  i128
                  i16
                  i32
                  i64
                  i8
                  isize
                  u128
                  u16
                and 4 others
        = note: this error originates in the macro `impl_fmt_trait` which comes from the expansion of the macro `define_type` (in Nightly builds, run with -Z macro-backtrace for more info)

Thus work around it by skipping those implementations in `zerocopy`.

Ideally, `zerocopy` would have the equivalent of `no_fp_fmt_parse`;
and, indeed, upstream just added it [1] after I filed an issue [2]
about it as requested. We can try it in a future update of our
vendored copy.

Cc: Joshua Liebow-Feeser <joshlf@google.com>
Cc: Jack Wrenn <jswrenn@google.com>
Link: https://github.com/google/zerocopy/pull/3429 [1]
Link: https://github.com/google/zerocopy/issues/3426 [2]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/zerocopy/src/byteorder.rs | 1 -
 1 file changed, 1 deletion(-)

diff --git a/rust/zerocopy/src/byteorder.rs b/rust/zerocopy/src/byteorder.rs
index 36ca4c0c88b0..8f70048f1eb0 100644
--- a/rust/zerocopy/src/byteorder.rs
+++ b/rust/zerocopy/src/byteorder.rs
@@ -177,7 +177,6 @@ fn fmt(&self, f: &mut Formatter<'_>) -> fmt::Result {
 
 macro_rules! impl_fmt_traits {
     ($name:ident, $native:ident, "floating point number") => {
-        impl_fmt_trait!($name, $native, Display);
     };
     ($name:ident, $native:ident, "unsigned integer") => {
         impl_fmt_traits!($name, $native, @all_types);
-- 
2.54.0


