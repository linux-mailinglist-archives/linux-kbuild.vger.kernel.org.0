Return-Path: <linux-kbuild+bounces-13502-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O99fHXP7HmqPbgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13502-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 17:49:07 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 95ECD62FF25
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 17:49:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Ee88oKRG;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13502-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13502-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F58E30AFA86
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jun 2026 15:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A6A3630B9;
	Tue,  2 Jun 2026 15:17:10 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007D51DE4FB;
	Tue,  2 Jun 2026 15:17:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780413430; cv=none; b=px5dnLNHc4m0kBHs3jMYEQZhRdfBu6zu/mdRYzK/PMi5bnHn1IwCiEHkpQhmlWRuELU86hE3i68NUh6LymRzNDK/YGeF2Hy4hnTpyNZVYC0d4uxflLUFZpW5WdneUdL54THDTo+cR4kAVl02H43he6LgoJgXYN79BSw44SMs8kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780413430; c=relaxed/simple;
	bh=nQTltwh9fUa/xyYjIk1zzY/ReEq4pAQ2zyCKz1loiKE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ERdVeN09FQOwVjBB+9ZPScCyzDZItnDVChDmtHZo3MxUR/1t/jdtfz2iR6J3NqtpnjTsxr3yGj84OFZXB8KI6y/KjfxLDLZ+Eyi82gWyZAtdeTWL6SbFqvkqL46nvaGVwQBpCw58V8X5Qgrax2zb/TNmzVMLeFZz1dqeCv8so+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ee88oKRG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF721F00893;
	Tue,  2 Jun 2026 15:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780413429;
	bh=GKtr47eSpQvznDz/neQt1Z8aJ4k0LQqb6m7YdRTw4gw=;
	h=From:To:Cc:Subject:Date;
	b=Ee88oKRGb7DtMv9xu43c8zsVH52a6RTqJpMFPy/9m43glqchgSOMqpzrUlTYDKlJt
	 yst4QjBOWnZPa34/hZ0q13aUuKBdJr/du2nWMx+1AuDTZudxXBiQhkCUdPCjVY/DSw
	 iGwEInX8WEB3rC9FQOH2BubGYLP9kwGEebzsoaVT68jWx+JWpeXSefODIlUMeVK+PE
	 ZAly1B6Jm9wkfexgvkIOjkVkSRYGpof3dRRJFOkk1PXlMO0cMaNE98LMQ48QYjpO6a
	 YMO/W2kHDnCs7VdvWPSPYLqoWNYFfPabaDXZkF0MiBCS+0WmTzIBmxZQ9r8qVUTltz
	 nB2p60VMrWn0w==
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
	linux-kbuild@vger.kernel.org
Subject: [PATCH] kbuild: rust: rename flag to `-Zdebuginfo-for-profiling` for Rust >= 1.98
Date: Tue,  2 Jun 2026 17:16:38 +0200
Message-ID: <20260602151638.14358-1-ojeda@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13502-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 95ECD62FF25

Starting with Rust 1.98.0 (expected 2026-08-20), the
`-Zdebug-info-for-profiling` flag has been renamed to
`-Zdebuginfo-for-profiling` (i.e. one less dash, to match `debuginfo`s
in other flags) [1].

Without this change, one gets in the latest nightlies:

    error: unknown unstable option: `debug-info-for-profiling`

Thus pass the right name.

Link: https://github.com/rust-lang/rust/pull/156887 [1]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 scripts/Makefile.autofdo | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
index 3f08acab4549..1442043da139 100644
--- a/scripts/Makefile.autofdo
+++ b/scripts/Makefile.autofdo
@@ -3,7 +3,7 @@
 # Enable available and selected Clang AutoFDO features.
 
 CFLAGS_AUTOFDO_CLANG := -fdebug-info-for-profiling -mllvm -enable-fs-discriminator=true -mllvm -improved-fs-discriminator=true
-RUSTFLAGS_AUTOFDO_CLANG := -Zdebug-info-for-profiling -Cllvm-args=-enable-fs-discriminator=true -Cllvm-args=-improved-fs-discriminator=true
+RUSTFLAGS_AUTOFDO_CLANG := $(if $(call rustc-min-version,109800),-Zdebuginfo-for-profiling,-Zdebug-info-for-profiling) -Cllvm-args=-enable-fs-discriminator=true -Cllvm-args=-improved-fs-discriminator=true
 
 ifndef CONFIG_DEBUG_INFO
   CFLAGS_AUTOFDO_CLANG += -gmlt

base-commit: 025fd4b4fd382112bd4489e5b4437a295934fc19
-- 
2.54.0


