Return-Path: <linux-kbuild+bounces-13622-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MEoPGtDQJmoOlAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13622-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 16:25:20 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C9137657241
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 16:25:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=V4DcH1Ju;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13622-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13622-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F6A730621F8
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jun 2026 14:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A54853B7757;
	Mon,  8 Jun 2026 14:15:26 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A987A3C9897;
	Mon,  8 Jun 2026 14:15:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928126; cv=none; b=eMZj6tlE0n29+mnCXH5D+IYIuOLRindILJ6dCln0jSRy2rDeVwiitQJVJkzRWafpwHbmNTpn7D/aAo8TmCW/XS/4Gd9GDfs5xHzY+yEEMu6uiN8ktXUmgX9AwQcNoCwHAJSG61crBdl7gxTVIkD/ySXZhC7d4cxKkt23i+OnHBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928126; c=relaxed/simple;
	bh=gZ3fHfA1zzON52FG6o42/Q8+wMPRGLsUjolNCzwR+Bk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TXbI+YTs8ovIgmZslJmZaOi2LFGowhIZM9c9+2gwWFtqBQvvXFY5F0g3f46NwCeT95wNtcWXYnZEOJLrGWbwStVeoTZf5SQLTeSsDkCQh7AaCMwCfkxlxW75hhGMl27sXv83R/WCSEtw2CbQvWNKtFHGsdBHRyn1pf6Qmcf6exQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V4DcH1Ju; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC9AA1F00893;
	Mon,  8 Jun 2026 14:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780928125;
	bh=2uG3FKb0s6ezwWXghk4oUFjVKybtZr6VwEdUksNei7Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=V4DcH1JumYUfA30Nls1B5D/yVNyYxldcY+HFuIcsqhsp+6YlDu9bfzh3NmT5gOUGG
	 ZUaAhy1eOQ/slmFmArvV/Q4R6dL+FgC9e8cGj1FSyQWSDKCcYHEi64+yyUyGo/6uKi
	 kyy54frT53llSyfnH573zVJUbL6oqwgj9nbYxBG6rkAzcCUiCVm34ZTVme0HTRmt1T
	 U4au/iB7XRAd+bUOK83Z/445mr1KU5w7wxwooIWKrJmbdK4xWvjShZIiSR3/YjVWAq
	 jeVCnNMBUhZlpYNZlmB3/rsq7V3JRA9KQTcrSJlAe7J82pJX5GrJHUma6dnsT7vjsW
	 Nkkam97p41S2A==
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
Subject: [PATCH v2 02/19] rust: kbuild: show the right `quiet_cmd_rustc_procmacrolibrary`
Date: Mon,  8 Jun 2026 16:14:21 +0200
Message-ID: <20260608141439.182634-3-ojeda@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13622-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C9137657241

When Clippy is skipped, `RUSTC` should be shown in `quiet` instead of
`CLIPPY` to be accurate and to avoid confusion.

Thus do so, matching what we do in `quiet_cmd_rustc_library`.

Fixes: 7dbe46c0b11d ("rust: kbuild: add proc macro library support")
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/Makefile b/rust/Makefile
index b9e9f512cec3..bec9726f256c 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -517,7 +517,7 @@ $(obj)/exports_bindings_generated.h: $(obj)/bindings.o FORCE
 $(obj)/exports_kernel_generated.h: $(obj)/kernel.o FORCE
 	$(call if_changed,exports)
 
-quiet_cmd_rustc_procmacrolibrary = $(RUSTC_OR_CLIPPY_QUIET) PL $@
+quiet_cmd_rustc_procmacrolibrary = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) PL $@
       cmd_rustc_procmacrolibrary = \
 	$(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
 		$(filter-out $(skip_flags),$(rust_common_flags) $(rustc_target_flags)) \
-- 
2.54.0


