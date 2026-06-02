Return-Path: <linux-kbuild+bounces-13515-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w0RnNaUWH2pcfQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13515-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 19:45:09 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF71630CDD
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 19:45:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Bd1AiZsO;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13515-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13515-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8911D306FAC4
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jun 2026 17:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693563FBECE;
	Tue,  2 Jun 2026 17:30:33 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4C42F8EB7;
	Tue,  2 Jun 2026 17:30:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780421433; cv=none; b=PuxK2Ygp6Cw9NOnYbsbd5yLrrn2ut6BdfCNq5IXQ4HD19aj8xlA/IbquUpx+JN0ysoPbb4lt6Br1UxBfVZKgoJKetwYel/91S650a/3gGhL7Idcl8gjwv6gyYz144K/fJmDsYz+/vWNB3+OnRAq3dup2vzVk5w3SmX0NBF2AK3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780421433; c=relaxed/simple;
	bh=/DeCXnzsBdAajIfGHCv7ryeHKYK4JpSfO1n9y6kHnFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cRP4gvDjSMt+4E80xFtleW2Tzw3nJWw3o7WKKoWRWvqDcK/dE0G9MZp4HQqe0aBSZ18W/kXdE5njkq81uXkDwuZm5QB3K2CHL+Dp8W2C0uZRndR0QMlRwSSUj/FWzmJr+KxQerWU9elO1tYj1E59ePcRhOU1VG/n9xGo3ZvRvWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bd1AiZsO; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E16C1F00898;
	Tue,  2 Jun 2026 17:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780421427;
	bh=guz624vMtIhicIznqQB0MsnhiQWz9qy/+XnxVVJ8xeg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Bd1AiZsO+3x7ICJ7/lJqPuk2bnlJgnfLzI2ZSEUja1PdQY7dLain7dVRxituxrNsq
	 HN75ODr3mzJq8LP8wgBzbMQisiti1jDRek0ZeMXNyEYR4SP7a/G42qgjbJnBKVPOKF
	 4wsUrUkTml7bz2b7xgdidjgZH0/rMDLGvy8a0QEv8mZVoOOgq0sdfG6+sEsQvBVsbO
	 xqmR4/Jz8LYTJ6vTIw6eHK0fy4bi4L4iZrPtGvk18sLzI4/0imAlXmJyc6Mbqur7+K
	 V7f1Ht5YgJNpFjZxU/LLs9MVPymzRhX7Lx1RRg8emAS6Q5b4N1hEZYT5N+JInQLx5Y
	 oVcYn/Yc/eAew==
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
Subject: [PATCH 11/18] rust: zerocopy: add `README.md`
Date: Tue,  2 Jun 2026 19:29:12 +0200
Message-ID: <20260602172920.30342-12-ojeda@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,amazon.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13515-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CDF71630CDD

Originally, when the Rust upstream `alloc` standard library crate was
vendored in commit 057b8d257107 ("rust: adapt `alloc` crate to the
kernel"), a `README.md` file was added to explain the provenance and
licensing of the source files.

Thus do the same for the `zerocopy` crate.

Cc: Joshua Liebow-Feeser <joshlf@google.com>
Cc: Jack Wrenn <jswrenn@amazon.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/zerocopy/README.md | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 rust/zerocopy/README.md

diff --git a/rust/zerocopy/README.md b/rust/zerocopy/README.md
new file mode 100644
index 000000000000..99e6cad0e26c
--- /dev/null
+++ b/rust/zerocopy/README.md
@@ -0,0 +1,14 @@
+# `zerocopy`
+
+These source files come from the Rust `zerocopy` crate, version v0.8.50
+(released 2026-05-31), hosted in the <https://github.com/google/zerocopy>
+repository, licensed under "BSD-2-Clause OR Apache-2.0 OR MIT" and only
+modified to add the SPDX license identifiers and to remove `Display`
+for `f32` and `f64`.
+
+For copyright details, please see:
+
+    https://github.com/google/zerocopy/blob/v0.8.50/README.md?plain=1
+    https://github.com/google/zerocopy/blob/v0.8.50/LICENSE-BSD
+    https://github.com/google/zerocopy/blob/v0.8.50/LICENSE-APACHE
+    https://github.com/google/zerocopy/blob/v0.8.50/LICENSE-MIT
-- 
2.54.0


