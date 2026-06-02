Return-Path: <linux-kbuild+bounces-13508-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZqHHGtATH2qDfAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13508-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 19:33:04 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 054E3630BD1
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 19:33:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Rx9moAvC;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13508-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13508-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 28E4C305618E
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jun 2026 17:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 027B43FBEA7;
	Tue,  2 Jun 2026 17:29:57 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0759E3FBB79;
	Tue,  2 Jun 2026 17:29:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780421396; cv=none; b=cdL+LQ9cVolJmkjkJ7MoXlYUZShbWPtwqsUxAoh4HIOKuYr6Twkmdkjl4Ib9lzMwrsnJvhoxqKT6ABSYqajPLSPkeDRznAYIj9C5fMiwe0wGFemRd1wc1rzTCpqib6GQkY/dI6YwbbUQQHsnq3/ient4XONOqTycLkRtrgT3Vdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780421396; c=relaxed/simple;
	bh=Xy0xOTtc+1RX8y9mj8nFOgnfzNokpWGgTIbU2b9Lmtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g3fGy0uD+R3I/ggw2tRVbRJsS/yXwq3UaLunV5I73iZwMRbihAAMBUr3S+or/9uAT9FALAe0nwvkZET2fTDihySzF2Au6fzon10F/Ow81rrt24cRVkxokVlYgwE9CzsostHup6TlfTBvx3d6ujcSdhsNl4F792Kp59NMHo8HNkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rx9moAvC; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A6821F00898;
	Tue,  2 Jun 2026 17:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780421395;
	bh=dR7Y70JCFc/8Bb+Uo9FH+FnemFVCaKGZvOzrfjzZnBw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Rx9moAvCgfrvlfcQOmfETGMv3xyg8M8giwvmepPhfp7nQD6KOCBaNs7yrfiAA6CNN
	 bqo1nPMsqf4YxIVS6+lfHZZ5V3A85/6oNu3hoq5DvNR/K3oQ5RqzoSZuqsFC9HYH6V
	 d6IS2kEj/dvwdQwHwEOQJgmBrwJe4vDD4YxEJmRtRxyhxNAM4eb5X5jDGJHiEMBwfe
	 rPxClFHPSmQKSSLuVDKj4Cv1ieCW7wUei2h3R25km2W6MQbHaq3jPizb+5sei1y88q
	 Jl+yc6mRqFdicvezVk6RxdBmO+niBLEZ/7CMq1PsWw89sS9IBUr2x3YV53szb3V8ft
	 Y1pT1suiHcsog==
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
Subject: [PATCH 03/18] rust: kbuild: remove unused variable
Date: Tue,  2 Jun 2026 19:29:04 +0200
Message-ID: <20260602172920.30342-4-ojeda@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-13508-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 054E3630BD1

Since we are adding one more proc macro crate (`zerocopy-derive`),
we are refactoring their handling.

`libpin_init_internal_extension` was added to mimic the setup for
`macros`, but it is not used, since the extension is expected to be
the same.

Thus remove it.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/rust/Makefile b/rust/Makefile
index bec9726f256c..2b4a3983bb1e 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -51,7 +51,6 @@ libmacros_name := $(shell MAKEFLAGS= $(RUSTC) --print file-names --crate-name ma
 libmacros_extension := $(patsubst libmacros.%,%,$(libmacros_name))
 
 libpin_init_internal_name := $(shell MAKEFLAGS= $(RUSTC) --print file-names --crate-name pin_init_internal --crate-type proc-macro - </dev/null)
-libpin_init_internal_extension := $(patsubst libpin_init_internal.%,%,$(libpin_init_internal_name))
 
 always-$(CONFIG_RUST) += $(libmacros_name) $(libpin_init_internal_name)
 
-- 
2.54.0


