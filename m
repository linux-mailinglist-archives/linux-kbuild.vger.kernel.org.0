Return-Path: <linux-kbuild+bounces-13435-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCaCAjfPGmo59AgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13435-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 May 2026 13:51:19 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCBC60CA46
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 May 2026 13:51:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C03930356D9
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 May 2026 11:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 637D33ACA57;
	Sat, 30 May 2026 11:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="idO0gdBv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B9B3AB293;
	Sat, 30 May 2026 11:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780141781; cv=none; b=lnn9F3Mz1ShiPc5bkYai+0OVMyJMf3G00nx4NoYkD5GmqcZpn/FdsY2AP5QpxZgJ2+zBppHvk34vah+ArsMn4q1ZSaEj1YWzq3bbWzNU65kJsIpRJSQgyZQWrsLjbLDqeY2sLemy+81+IdlYnGcG2ZhZ4+FrULPpFMtgHvkLy9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780141781; c=relaxed/simple;
	bh=LHDo+ZhBJKQohA9UlEU+BNm59Al6T7BX8YhX8vLBYts=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j4NOzpHGvrmzNLmw1d22tllYSejewST/lW9cOrUfPOJvZz0S4fw9Up/Ge2cpsNNu7fUhSuQOkEz1JlKcwFhjoSlYBpGKp6u7DaKRudbj3icub9aLTCliS+v3Y8hWy7OTRiI1QtML8dsK7HZb/npOEpwhrxSz4/4ZycIAHa/WXbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=idO0gdBv; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E18681F00893;
	Sat, 30 May 2026 11:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780141780;
	bh=UgQLCX5R4nUTVcEi2+T6tAoqT0LEeC2bEEWFpQZ3VRM=;
	h=From:To:Cc:Subject:Date;
	b=idO0gdBvUzHIqOartjFJn5iybYT5M8IdwYQXmhNfarLE20B0g01gnLCXzr28h0yTw
	 RWe1xddBsaSPtjIznFN6+AFA8uQT/P1+8aYgEj7/53yy1j2K394e7nLcchMySjKtw2
	 fvFzH+pNYqUmvQjf6cQhyP2k4pufCCJwm1b9pEoaLM3QQ5RUQqIj5+lZnVDssqQHXQ
	 5lrgA+l8oUImrWELNgrdAVOAzbu9Et6cJJdE3CbKFKfroWoDOBghS1gZjCvvAOreW7
	 WGP8LJKxrrJaQr1jLrWFGBzS4HDLPZHUZ+HW2jcPi83ITM2jQFauZ1noGMklcHfOQs
	 pamAWUs2nwiSg==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
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
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org,
	Ralf Jung <post@ralfj.de>,
	stable@vger.kernel.org
Subject: [PATCH] rust: x86: support Rust >= 1.98.0 target spec
Date: Sat, 30 May 2026 13:49:25 +0200
Message-ID: <20260530114925.260754-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,zytor.com,ralfj.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13435-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ojeda@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ralfj.de:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5FCBC60CA46
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Starting with Rust 1.98.0 (expected 2026-08-20), the target spec will not
support `x86-softfloat` anymore [1]. Instead, `softfloat` should be used,
which is an alias. Otherwise, one gets:

    error: error loading target specification: rustc-abi: invalid rustc abi: 'x86-softfloat'. allowed values: 'x86-sse2', 'softfloat' at line 3 column 32
      |
      = help: run `rustc --print target-list` for a list of built-in targets

Thus conditionally use one or the other depending on the version.

The alias has existed since Rust 1.95.0 (released 2026-04-16) [2], but
use the newer version instead to avoid changing how the build works for
existing compilers, at least until more testing takes place.

Cc: Ralf Jung <post@ralfj.de>
Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned in older LTSs).
Link: https://github.com/rust-lang/rust/pull/157151 [1]
Link: https://github.com/rust-lang/rust/pull/151154 [2]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 scripts/generate_rust_target.rs | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
index 38b3416bb979..02bc45d15484 100644
--- a/scripts/generate_rust_target.rs
+++ b/scripts/generate_rust_target.rs
@@ -196,7 +196,9 @@ fn main() {
         }
     } else if cfg.has("X86_64") {
         ts.push("arch", "x86_64");
-        if cfg.rustc_version_atleast(1, 86, 0) {
+        if cfg.rustc_version_atleast(1, 98, 0) {
+            ts.push("rustc-abi", "softfloat");
+        } else if cfg.rustc_version_atleast(1, 86, 0) {
             ts.push("rustc-abi", "x86-softfloat");
         }
         ts.push(

base-commit: ac35b5580ace12e5d0a0b5e61e36d2c4e1ffa29c
-- 
2.54.0


