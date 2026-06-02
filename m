Return-Path: <linux-kbuild+bounces-13509-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3pHFFdkTH2qGfAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13509-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 19:33:13 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C99FE630BD4
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 19:33:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=dIs3+Hgg;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13509-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13509-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 60D99305683C
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jun 2026 17:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA7E73FBEBC;
	Tue,  2 Jun 2026 17:30:00 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAAD3FB7FC;
	Tue,  2 Jun 2026 17:29:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780421400; cv=none; b=jbyYwkx4vo3IJz+omzdadGgSiH0BmUgBptEpWVgTixDCM1muwLO8OHfBjZ56sFNQ1r/j53Jq2eKwV0OIcaoYphTRXElmxOfA5GYouypWmAuoIlV+75hnT/CcJ0zHaxHEiiHAghljGr0SnHg4i++btSL9wnXd8TBrvWJ9ASqVnww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780421400; c=relaxed/simple;
	bh=FmbNu6MvuM2r8ZR2TjKNbwoI6YDijBRwrWaQmb5OmEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z7DflR62DpH7Os0dX1DT50v9vtjZdSE9eqcW0T3nIhfvM2DEPfNtDSpBmwCS2Kr5hhlVpHPJ67u3Te89nRUzo8JaOvoi6rqoT0V3mJuqAkOlnxcHADK44pGN1rM+RxRupkeG+tWQEhRuJf46wcW8/xIrHivOypdJ/wmU7FAQc9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dIs3+Hgg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F76D1F00893;
	Tue,  2 Jun 2026 17:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780421399;
	bh=u1oX+1ZZ1kaVjVIAORP4nw7V0HqG2cEXq1IWi72B6ag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dIs3+HggH7HtpXm95korbRxeqWXkO6RGttwFzJzS8J1iB5d6FJ8+qu9HNqp1OPOPe
	 AA52HvvE2WSElrPjAcPF5isf5DqsWxBbyhMwA8gTC2avvqwKq5powtrNIgaSuP6abG
	 y6i+XVuPrIU+G0B2CUN0fgahnzFR5XbjZGjBFxf8rMfkALU1oJJn2B8Gz5+XNnEESh
	 VV3V84UlnT2Akaol5l0BG2c6qSonqqcM0WezLvQX+A7dEZFfRnmdc6cQma7UhsvHds
	 6Cvn8f3K/j+hFZjMKBe/Pk+4TGIKAmR/j3OQ1EbFbIr3UKwfl5hiGZ7TdvgHkMLZ6F
	 17MLQObdFWruw==
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
Subject: [PATCH 04/18] rust: kbuild: define `procmacro-name` function
Date: Tue,  2 Jun 2026 19:29:05 +0200
Message-ID: <20260602172920.30342-5-ojeda@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-13509-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C99FE630BD4

Since we are adding one more proc macro crate (`zerocopy-derive`),
we are refactoring their handling.

Thus define a `procmacro-name` function and use it to fill the existing
variables' values.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 2b4a3983bb1e..8dfccf7399d9 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -47,10 +47,12 @@ endif
 # Avoids running `$(RUSTC)` when it may not be available.
 ifdef CONFIG_RUST
 
-libmacros_name := $(shell MAKEFLAGS= $(RUSTC) --print file-names --crate-name macros --crate-type proc-macro - </dev/null)
+procmacro-name = $(shell MAKEFLAGS= $(RUSTC) --print file-names --crate-name $(1) --crate-type proc-macro - </dev/null)
+
+libmacros_name := $(call procmacro-name,macros)
 libmacros_extension := $(patsubst libmacros.%,%,$(libmacros_name))
 
-libpin_init_internal_name := $(shell MAKEFLAGS= $(RUSTC) --print file-names --crate-name pin_init_internal --crate-type proc-macro - </dev/null)
+libpin_init_internal_name := $(call procmacro-name,pin_init_internal)
 
 always-$(CONFIG_RUST) += $(libmacros_name) $(libpin_init_internal_name)
 
-- 
2.54.0


