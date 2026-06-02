Return-Path: <linux-kbuild+bounces-13520-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CT9zKakWH2pefQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13520-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 19:45:13 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 26949630CE2
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 19:45:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Ly1YHzBo;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13520-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13520-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C0C5C30A0457
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jun 2026 17:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2714B3F4DC2;
	Tue,  2 Jun 2026 17:30:48 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232183F54AD;
	Tue,  2 Jun 2026 17:30:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780421448; cv=none; b=WOmySiAphyC9lIksKnVN5XqV5H6aIaq5wfAFqi5DCI0yXqZp9CF/60VUWnHmpoGz99O5mQkoqs3cboYbtGDZQcAsTHihoA6syYHCAsFE8ntp/McwNWWX7Vinb1051vmTyNeJ7GVYCY7k9mx16+gKlOj0QBG+OOWEC+EquS7FBlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780421448; c=relaxed/simple;
	bh=QwekvpZm6oTmPT/1kWTAqW9r7MSVKMJQhY1CEW53Zt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BVhPxVx4iCSBmWr9ODD/kBFhEKNgGSSVE0r30/doHpebKliDx2YAXpkbf8eHntUVJIzHtJXv1Lzz5UbG5p1NSjUmXiVzh90YROtrj+0SRPlfBX2oPblbK8ZesTBmAnX4UsoREelD2RNJx8pGqbgtGDBDL4QRAlc+Hc2JBtBLZkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ly1YHzBo; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B42E01F00898;
	Tue,  2 Jun 2026 17:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780421447;
	bh=pRNU9rIWop1B1l0mz/Maer2Jv2/JYps5u3f72AL+xwo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ly1YHzBoCyv76DFGFlps78U0BB8aNzjLtJbqtmjEBQHvtIU3yGJHZUKB2lW8BZ/LU
	 kFwEdM658CSB5y5gXX+c6ZXqP3/vX+r2Vgbcd5VVQoY6K/P7NQEM7LE+70uiVQu4Zu
	 fTuDD9xk7mIn9UfKlVHq52PCW7+A4oR7a6XobMjjpAuLz7Xlpu4zAWqNzq+lj3GFA8
	 8YLSxBmjcOtvnIA2bH4JaDtsy6cOHHZYujUzrdnRHc2j1tXk5+SffhcM5lVIepGEUj
	 hPkKyn1Qiee7oQIYN+/FDhw2G5XHIJgX5Zc85Lfdn45kEf4aklnuZYQvSEDcahAWw8
	 jA7UOKOxjbP+w==
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
Subject: [PATCH 16/18] rust: zerocopy-derive: add `README.md`
Date: Tue,  2 Jun 2026 19:29:17 +0200
Message-ID: <20260602172920.30342-17-ojeda@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,amazon.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13520-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ojeda@kernel.org,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:joshlf@google.com,m:jswrenn@amazon.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 26949630CE2

Originally, when the Rust upstream `alloc` standard library crate was
vendored in commit 057b8d257107 ("rust: adapt `alloc` crate to the
kernel"), a `README.md` file was added to explain the provenance and
licensing of the source files.

Thus do the same for the `zerocopy-derive` crate.

Cc: Joshua Liebow-Feeser <joshlf@google.com>
Cc: Jack Wrenn <jswrenn@amazon.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/zerocopy-derive/README.md | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 rust/zerocopy-derive/README.md

diff --git a/rust/zerocopy-derive/README.md b/rust/zerocopy-derive/README.md
new file mode 100644
index 000000000000..110f4a401778
--- /dev/null
+++ b/rust/zerocopy-derive/README.md
@@ -0,0 +1,14 @@
+# `zerocopy-derive`
+
+These source files come from the Rust `zerocopy-derive` crate, version v0.8.50
+(released 2026-05-31), hosted in the <https://github.com/google/zerocopy>
+repository, licensed under "BSD-2-Clause OR Apache-2.0 OR MIT" and only
+modified to add the SPDX license identifiers and to remove the generation of
+non-ASCII identifiers.
+
+For copyright details, please see:
+
+    https://github.com/google/zerocopy/blob/v0.8.50/README.md?plain=1
+    https://github.com/google/zerocopy/blob/v0.8.50/LICENSE-BSD
+    https://github.com/google/zerocopy/blob/v0.8.50/LICENSE-APACHE
+    https://github.com/google/zerocopy/blob/v0.8.50/LICENSE-MIT
-- 
2.54.0


