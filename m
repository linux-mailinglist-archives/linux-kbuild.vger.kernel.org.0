Return-Path: <linux-kbuild+bounces-13625-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w4GkNT/RJmotlAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13625-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 16:27:11 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4384A657296
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 16:27:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=F5kvLWRc;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13625-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13625-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CDD81306EB24
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jun 2026 14:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 281F63CC7F1;
	Mon,  8 Jun 2026 14:15:38 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118EC3C9EF3;
	Mon,  8 Jun 2026 14:15:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928138; cv=none; b=cEGfRtT6OBoI9lvlp3Dlj662jxEbQp3gKkyL7zaH0vQ1Eyz4X3oKmRSxfNPaN4JZMuwM8uXhXJLXahFCxlzPLKKDC51cXF7eS3KMDdmhMXJwA3ihS6afx0dW+qnj1K5uM7PKyMuS4YixMvCxqMA82ItPvYSdX7sPvw6AHy/MWcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928138; c=relaxed/simple;
	bh=aSZOhhf3vRUE2phGwbM7KMo2jgdh2KIfQTZ392atU24=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XS3jZZjt9aDbSXSltBylHDPk+Qfe50NDxI+nMoWsXzNvcW2xmwsy3S2Lnpmz/LYLCCLBQSxOJz0/gad6MClB3ZAQ37MhatsUIb8rNYfZa2H8Eu8HnUuZHy3Kzp3lEIIiIbCtDJrxV1+XuY5C1BwPuH7sdp3EjMKCwaB7YfeJytw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5kvLWRc; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 865181F00898;
	Mon,  8 Jun 2026 14:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780928136;
	bh=w9fLc5LKmMvg2+YhAypjTcFLcL6vS7llS/CAJ/v+X/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=F5kvLWRc+5nnyhZGlZrab/inyaCX2QhIbIJi45NmJnxspkWH+aXovygx0hei0JMDQ
	 r2fuZ7qJyDlX+T6JHKDj6jvzoozRSPCKIZ2VMLSgGEQpLE5q3AzRw6SZj1r3STqp/O
	 /BeCrZ6qr19NEjRQWLq++FhKbX+f3nFCHTJgYnaQWNJLSAHl0J8OQOQqzRrkXwub3c
	 GdbDRxPZDbkJG/setdYumpjQD6/d6cbyQZROxywxnTbdS7V8UYtWtrD3HzfDVZAB+P
	 X6r+aU8G6m+0IV0jCLthRBPDFdotMDZMg0nNI2hYVWd7JsLz8bGe58rWFea7cI/yh6
	 /uin+XfKUPG8w==
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
Subject: [PATCH v2 05/19] rust: kbuild: define `procmacro-extension` variable
Date: Mon,  8 Jun 2026 16:14:24 +0200
Message-ID: <20260608141439.182634-6-ojeda@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13625-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4384A657296

Since we are adding one more proc macro crate (`zerocopy-derive`),
we are refactoring their handling.

Thus, instead of using `libmacros_extension` as the common variable to
hold the extension for all of them, use a dedicated variable with a more
generic name (including for its implementation).

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 8dfccf7399d9..df90fabefb70 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -48,10 +48,9 @@ endif
 ifdef CONFIG_RUST
 
 procmacro-name = $(shell MAKEFLAGS= $(RUSTC) --print file-names --crate-name $(1) --crate-type proc-macro - </dev/null)
+procmacro-extension := $(patsubst libname.%,%,$(call procmacro-name,name))
 
 libmacros_name := $(call procmacro-name,macros)
-libmacros_extension := $(patsubst libmacros.%,%,$(libmacros_name))
-
 libpin_init_internal_name := $(call procmacro-name,pin_init_internal)
 
 always-$(CONFIG_RUST) += $(libmacros_name) $(libpin_init_internal_name)
@@ -549,7 +548,7 @@ quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
 		-Clink-args='$(call escsq,$(KBUILD_PROCMACROLDFLAGS))' \
 		--emit=dep-info=$(depfile) --emit=link=$@ --extern proc_macro \
 		--crate-type proc-macro -L$(objtree)/$(obj) \
-		--crate-name $(patsubst lib%.$(libmacros_extension),%,$(notdir $@)) \
+		--crate-name $(patsubst lib%.$(procmacro-extension),%,$(notdir $@)) \
 		@$(objtree)/include/generated/rustc_cfg $<
 
 # Procedural macros can only be used with the `rustc` that compiled it.
-- 
2.54.0


