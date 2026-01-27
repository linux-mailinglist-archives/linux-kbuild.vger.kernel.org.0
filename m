Return-Path: <linux-kbuild+bounces-10901-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIbvOsL0eGnYuAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10901-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 18:24:18 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F979864E
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 18:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6F4AD301A155
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 17:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554A22E7BD9;
	Tue, 27 Jan 2026 17:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pc3RThJN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B472E5B32;
	Tue, 27 Jan 2026 17:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769534640; cv=none; b=C5ndM8I/ejpw2MEQfsdPOiyO5AVf+54EDKoq1MYICo84ytkF8AU5+LpFmyWjaEgSsMJgxH0SeKuy4fZU+aClQIQdXeLiRlDln3WLPTsGLqTwPZJbC/RJSth26d/+MMHp2i9k3qUjooQMrO2p6HoV3CG5x40NZtP4Ad5VsdwKt0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769534640; c=relaxed/simple;
	bh=oVTrhKECMO+Hvk2Prs5pf0XviWq2oEJmauWSB4Hf77c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b7z5APDW7m2kr4zg/6V8cGJrYfV8/d2GL7iXrR1DgaADy/4zn+u60THrz233IcvkAII6slnlVwfcEmGYlKlwDT6x37yLLQQyTap7y/K2KangDLUEioyjj6PPZ6PYzjB74/Op0wFNKTf7qBtkQXuHWTQsQIGUELpqO2DkZJFkm24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pc3RThJN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C36ABC16AAE;
	Tue, 27 Jan 2026 17:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769534639;
	bh=oVTrhKECMO+Hvk2Prs5pf0XviWq2oEJmauWSB4Hf77c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pc3RThJNC3S9pHULnNoj4E8Z9ltDeFno2mEisbw+K7t/RpBsZWrKOtqPNTdN1/+dj
	 Q6Pb2MgjzckLxRSphwjDXrn4tkAW64QX7l+oVKCKKhKPxtkRxLVIrxYxtSJviUJIUo
	 MGVb1GbNFs5tA0y25jw2MaD8YhpBfRKBwA3OHg7dj8k83MI2pKmvmeOwXaClFSlB3g
	 zEGiYleQMSNPOyGkKAZK5dgcmtFcGScpVpA6p+NutlLVucHyfSO9cbtcWcFHkuk5Wx
	 t+fbHBXnvpGeafAvMC8sMwiexifyh0COhYYc83FZGHz7kL6K+iRQHwWnajtp3fTxdY
	 S85wbqFkVcfBw==
From: Gary Guo <gary@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Kees Cook <kees@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/2] kbuild: rust: use klint to provide CONFIG_FRAME_WARN
Date: Tue, 27 Jan 2026 17:11:04 +0000
Message-ID: <20260127172330.1492107-3-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260127172330.1492107-1-gary@kernel.org>
References: <20260127172330.1492107-1-gary@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,weissschuh.net];
	TAGGED_FROM(0.00)[bounces-10901-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 67F979864E
X-Rspamd-Action: no action

From: Gary Guo <gary@garyguo.net>

klint is able to analyze frame size and warn on frames that are too big.

With `register_tool(klint)` support, we can simply instruct rust to turn on
`klint::stack_frame_too_large`. This is a no-op if normal rustc (or Clippy)
is invoked, but will perform the check if klint is used.

This is an example of a bug caught using this option:

warning: stack size of `gsp::cmdq::Cmdq::new` is 8216 bytes, exceeds the 2048-byte limit
   --> drivers/gpu/nova-core/gsp/cmdq.rs:453:5
    |
453 |     pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<Cmdq> {
    |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    |
    = note: the stack size is inferred from instruction `sub $0x2018,%rsp` at .text+32778

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 scripts/Makefile.warn | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/Makefile.warn b/scripts/Makefile.warn
index 5567da6c7dfe..254a4d53f8f3 100644
--- a/scripts/Makefile.warn
+++ b/scripts/Makefile.warn
@@ -23,6 +23,7 @@ KBUILD_CFLAGS += -Wmissing-prototypes
 
 ifneq ($(CONFIG_FRAME_WARN),0)
 KBUILD_CFLAGS += -Wframe-larger-than=$(CONFIG_FRAME_WARN)
+KBUILD_RUSTFLAGS += -Wklint::stack-frame-too-large
 endif
 
 KBUILD_CFLAGS-$(CONFIG_CC_NO_ARRAY_BOUNDS) += -Wno-array-bounds
-- 
2.51.2


