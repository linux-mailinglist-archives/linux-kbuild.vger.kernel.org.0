Return-Path: <linux-kbuild+bounces-10789-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLfRM8S4cWnTLgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10789-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 06:42:28 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6565C620AF
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 06:42:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 13BFD4F7BE0
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 05:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41A9D47A0BA;
	Thu, 22 Jan 2026 05:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rVMKwzoc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5EF3358B6;
	Thu, 22 Jan 2026 05:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769060520; cv=none; b=CrZgDMQfBK1B66foRhm30w9zeq9Ow5dxIajOjVR8pfz2TYYIaJWPX1uLj/HowfA1fNUYm0J5oeGfxOY2yHwiYiHEqrqj7Kr9KkVU3iKiYslPJskrOWuhTC/DoNIeiZDmXuO6AfGwACdoIKQDmLK4pVLjnP5L9OyHTTPjc3K8q/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769060520; c=relaxed/simple;
	bh=FcTYOiInuHB2m2SKM3ysyNet7XNDwjoS38aBTAf2EPg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fGD/hRrP3vaPpjkvs0Mq5lSJjRV2WTcaHG2yRK1FDMoDo+ljntSYsR2elS1IIQfetasayriBFwAFe8wSwrkXtttj8YXm/chdKpJcyJKh05qw5PqpfUUfFZ5wGZjSOdz5uhgw7c03HLdIX7gDst0tqEoTujN2lbFqCIXi1SE2Pw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rVMKwzoc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 267C3C116C6;
	Thu, 22 Jan 2026 05:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769060519;
	bh=FcTYOiInuHB2m2SKM3ysyNet7XNDwjoS38aBTAf2EPg=;
	h=From:To:Cc:Subject:Date:From;
	b=rVMKwzoc/dNY5kUrVYCObK3adlLSJrwZAbIGegDkfPjA+rH0AKIq9ocOb8axKYmKg
	 32NECmEZ/En9etlnfgIzSSXwSgroV2y/qWBNtSBdNNRJXFWlA8JJ9CFQ5RwjhYx7EW
	 dlb1V6NcpBDVsrbaL8i3eSmOaWkdY/WqNISY4ZUVEioiEGf/mWZXjDakdkhzknvBOi
	 DsLQ/zxAv4/xyxr998qrvFhek4dDyF0yZwWvnoXFJWx+hy2L+r/flXhMC6EWa17anh
	 utKCXBpnRNftQZM1/wkqmugUk1Ag0/Q/dPUp2rukRGcJdibe8k9AoLG5zxkrK3mdMe
	 eSWab1X19DZOA==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH] rust: proc-macro2: rebuild if the version text changes
Date: Thu, 22 Jan 2026 06:41:35 +0100
Message-ID: <20260122054135.138445-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,garyguo.net,protonmail.com,kernel.org,google.com,umich.edu,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-10789-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ojeda@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,shields.io:url]
X-Rspamd-Queue-Id: 6565C620AF
X-Rspamd-Action: no action

The Rust compiler cannot use dependencies built by other versions, e.g.:

    error[E0514]: found crate `proc_macro2` compiled by an incompatible version of rustc
     --> rust/quote/ext.rs:5:5
      |
    5 | use proc_macro2::{TokenStream, TokenTree};
      |     ^^^^^^^^^^^
      |
      = note: the following crate versions were found:
              crate `proc_macro2` compiled by rustc 1.92.0 (ded5c06cf 2025-12-08): ./rust/libproc_macro2.rlib
      = help: please recompile that crate using this compiler (rustc 1.93.0 (254b59607 2026-01-19)) (consider running `cargo clean` first)

Thus trigger a rebuild if the version text changes like we do in other
top-level cases (e.g. see commit aeb0e24abbeb ("kbuild: rust: replace
proc macros dependency on `core.o` with the version text")).

The build errors for now are hard to trigger, since we do not yet use
the new crates we just introduced (the use cases are coming in the next
merge window), but they can still be seen if e.g. one manually removes
one of the targets, so fix it already.

Fixes: 158a3b72118a ("rust: proc-macro2: enable support in kbuild")
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/proc-macro2/lib.rs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/rust/proc-macro2/lib.rs b/rust/proc-macro2/lib.rs
index 7b78d065d51c..5d408943fa0d 100644
--- a/rust/proc-macro2/lib.rs
+++ b/rust/proc-macro2/lib.rs
@@ -1,5 +1,9 @@
 // SPDX-License-Identifier: Apache-2.0 OR MIT
 
+// When fixdep scans this, it will find this string `CONFIG_RUSTC_VERSION_TEXT`
+// and thus add a dependency on `include/config/RUSTC_VERSION_TEXT`, which is
+// touched by Kconfig when the version string from the compiler changes.
+
 //! [![github]](https://github.com/dtolnay/proc-macro2)&ensp;[![crates-io]](https://crates.io/crates/proc-macro2)&ensp;[![docs-rs]](crate)
 //!
 //! [github]: https://img.shields.io/badge/github-8da0cb?style=for-the-badge&labelColor=555555&logo=github

base-commit: 2af6ad09fc7dfe9b3610100983cccf16998bf34d
-- 
2.52.0


