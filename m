Return-Path: <linux-kbuild+bounces-11711-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOxaIlz5rmliLAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11711-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 17:46:20 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 031E923CF88
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 17:46:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B47733036758
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 16:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC963AEF22;
	Mon,  9 Mar 2026 16:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UyLYSwNI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBE138F255;
	Mon,  9 Mar 2026 16:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773074119; cv=none; b=iXrekU/BkYo76paR/xntra21/TjNsHoOa4eWjS1vtlzAt8mkSVaGWrZ3WgChNqXBQ1j6h2eNtk4MVb4J2VAub5JQb0MCbkNrTF52M95O3b1eI7b+UfmRknwU+2UPLo6SrSZDSqdlBsS2S3AotShEMTa9EhdJzN/Esci/MZwic9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773074119; c=relaxed/simple;
	bh=gvPoHfp4kILjun0x+PiFZTGPIwNfY5nP6rl8dO323WQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B0r2KSo/8H2bUWzwX2CJQTvUclYFRCR7MetNW0HwqguMy1WtL6mjNNYmXprUTK9/HhVjBpGKmZ8IHDiLPNfxZ8Knanu+2vqGT1aeGatVMTiaQ1WIRZl4wmCTmaTaxk0ZIwKYAySPjJ7KvQIKiJqnjPXIcmRdSayPK1o4F94oPMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UyLYSwNI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D450C2BCAF;
	Mon,  9 Mar 2026 16:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773074118;
	bh=gvPoHfp4kILjun0x+PiFZTGPIwNfY5nP6rl8dO323WQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UyLYSwNI19v9fIU/UbWQcc5LMvSlHh2m1+TmiGF9bUNaACjOvtlccovTSWh9MZjOu
	 FRjSnf/V5MzFcFzJlOXhxossZXZYcvi2ULR2U0DcU7BvOSd5AQpdYQPftTVApp3LeC
	 DdaoRbnIqtjX4kzODRi7OISkxtYKvCjqe9aamimi8IykwcmXBq2K5mA2e11fF6XfOn
	 EEeJuwI3Ay0TEzU5vsUR9rWGgBJg7hT6fDYWpRsSC+GxxkGgxEvGNnAp+yZhvtLemF
	 NYfDCOQgK3qCxuv5q0owT3xbZkd9kfsFebgC6HOpEZN3r68PQgLWV5vsPmBJr3pMkD
	 rNvIeysjpvkKw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F83BF41810;
	Mon,  9 Mar 2026 16:35:18 +0000 (UTC)
From: Tim Kovalenko via B4 Relay <devnull+tim.kovalenko.proton.me@kernel.org>
Date: Mon, 09 Mar 2026 12:34:18 -0400
Subject: [PATCH v4 1/4] rust: ptr: add `KnownSize` trait to support DST
 size info extraction
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-drm-rust-next-v4-1-4ef485b19a4c@proton.me>
References: <20260309-drm-rust-next-v4-0-4ef485b19a4c@proton.me>
In-Reply-To: <20260309-drm-rust-next-v4-0-4ef485b19a4c@proton.me>
To: Alexandre Courbot <acourbot@nvidia.com>, 
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, Boqun Feng <boqun@kernel.org>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, driver-core@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773074117; l=2158;
 i=tim.kovalenko@proton.me; s=20260212; h=from:subject:message-id;
 bh=FheLpAl87yI4UaHfqa3k20aJCUg9ixwJ8DWS/cDgRg4=;
 b=45N81LFvbnZxj7EBp15VjpGQhHombjwrqodP4FxEVsCd0JDjLKei5FWNCjy3jFam1BlfUrrI7
 tx8XLpQNe94AjeTcEcFGAGgbnHF9RBdYUogAKI4RUMXskNkIfccBCVr
X-Developer-Key: i=tim.kovalenko@proton.me; a=ed25519;
 pk=/+OiulEpgeZifgP4mDE4e5YlV6nMeY+frze/lY/xiHI=
X-Endpoint-Received: by B4 Relay for tim.kovalenko@proton.me/20260212 with
 auth_id=635
X-Original-From: Tim Kovalenko <tim.kovalenko@proton.me>
Reply-To: tim.kovalenko@proton.me
X-Rspamd-Queue-Id: 031E923CF88
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11711-lists,linux-kbuild=lfdr.de,tim.kovalenko.proton.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu,collabora.com,arm.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-kbuild@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.977];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	HAS_REPLYTO(0.00)[tim.kovalenko@proton.me];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,proton.me:replyto,proton.me:mid]
X-Rspamd-Action: no action

From: Gary Guo <gary@garyguo.net>

Add a `KnownSize` trait which is used obtain a size from a raw pointer's
metadata. This makes it possible to obtain size information on a raw slice
pointer. This is similar to Rust `core::mem::size_of_val_raw` which is not
yet stable.

Signed-off-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/lib.rs |  1 +
 rust/kernel/ptr.rs | 27 ++++++++++++++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 3da92f18f4eed16335c3c251e6bff68dcf7e781e..510cc7fe496113f85c34f420b1c4be95596297ad 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -20,6 +20,7 @@
 #![feature(generic_nonzero)]
 #![feature(inline_const)]
 #![feature(pointer_is_aligned)]
+#![feature(slice_ptr_len)]
 //
 // Stable since Rust 1.80.0.
 #![feature(slice_flatten)]
diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
index 5b6a382637fef11e9c0ae9122906422a970d7fcd..cf980a103acf19ee3bd17bb1dfdbcadfe30467ae 100644
--- a/rust/kernel/ptr.rs
+++ b/rust/kernel/ptr.rs
@@ -2,7 +2,10 @@
 
 //! Types and functions to work with pointers and addresses.
 
-use core::mem::align_of;
+use core::mem::{
+    align_of,
+    size_of, //
+};
 use core::num::NonZero;
 
 /// Type representing an alignment, which is always a power of two.
@@ -225,3 +228,25 @@ fn align_up(self, alignment: Alignment) -> Option<Self> {
 }
 
 impl_alignable_uint!(u8, u16, u32, u64, usize);
+
+/// Trait to represent compile-time known size information.
+///
+/// This is a generalization of what [`size_of`] which works for dynamically sized types.
+pub trait KnownSize {
+    /// Get the size of an object of this type in bytes, with the metadata of the given pointer.
+    fn size(p: *const Self) -> usize;
+}
+
+impl<T> KnownSize for T {
+    #[inline(always)]
+    fn size(_: *const Self) -> usize {
+        size_of::<T>()
+    }
+}
+
+impl<T> KnownSize for [T] {
+    #[inline(always)]
+    fn size(p: *const Self) -> usize {
+        p.len() * size_of::<T>()
+    }
+}

-- 
2.53.0



