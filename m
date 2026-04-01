Return-Path: <linux-kbuild+bounces-12474-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOIMEQUIzWl/ZgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12474-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 13:56:53 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E10379F75
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 13:56:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2AADA3132ACB
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 11:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D883DCDA8;
	Wed,  1 Apr 2026 11:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hL4sHbvE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC59346ADE;
	Wed,  1 Apr 2026 11:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043987; cv=none; b=RTDRlFU+Fc4wfrL1cT+HECNcxgj+NPQ59P1t+UHQGGV747eYcXCF1zv/tU5ICifALKBHvgoDNHllKr9TI4V0w7iOaJ+SRLUx7mZ9JVoRpG7DfpsSuyyN4vo3OvsvUnq945wv9iEnt8+WRyKZdnSqqd3KjqJGLmc55Ugdbn/9Xoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043987; c=relaxed/simple;
	bh=bANzQfGdC4IAbhvKXuBQNZWwfHWEIkonTSD/l3eSFWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t/k/rfH0kBJqnxDHZkufsDt/BKzcvNRsG1DqMebejY/fr7YKBHv9AoEGmePKLGJIcNOWnL37kw3h/MGfSYBzgrTzD1gjEA0p8yge1eGMl8Elt1BtmBrwPs51ueoqmiZAGQQpkLVJBPsYl20Km4aoNUNhnmRCj6rhWVwk0+lSaoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hL4sHbvE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 065A7C4CEF7;
	Wed,  1 Apr 2026 11:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775043987;
	bh=bANzQfGdC4IAbhvKXuBQNZWwfHWEIkonTSD/l3eSFWo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hL4sHbvEsNWJiay38u1aNlo7H43VBJ1sQkn95Zz3Zvo78hQs4urrxoY3PVbkzKt0l
	 lwmTMIaJi+qiU2KMGU6vLKoGsiBAHAkiLOEOtbt9u9OHlSIILM04QabgoVY8JAqGM2
	 ktOh+LvLdSPlD4TAGMErsb3sfuWdamUxchSdksVBIJ38zHPuP7Z3j73xQdW7tKiEjL
	 3P1B2oMo9xQQOERf8nSXdYHlAeXuO4SJJzjQaIXxzPUJD3XBzD1RAtErQhOQJcGTnV
	 k195Z2x0u87K/wOQvxUzbhoRq0DOWDo6GjE0Ys09MiK0M4d5vrYQEjsZvmtaKni/FB
	 Nn2gr6YtVmP8w==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <christian@brauner.io>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	linux-block@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers),
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH 02/33] rust: bump Clippy's MSRV and clean `incompatible_msrv` allows
Date: Wed,  1 Apr 2026 13:45:09 +0200
Message-ID: <20260401114540.30108-3-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,gmail.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,google.com,lists.linux.dev,linuxfoundation.org];
	TAGGED_FROM(0.00)[bounces-12474-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ojeda@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B0E10379F75
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Following the Rust compiler bump, we can now update Clippy's MSRV we
set in the configuration, which will improve the diagnostics it generates.

Thus do so and clean a few of the `allow`s that are not needed anymore.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 .clippy.toml                      | 2 +-
 drivers/gpu/nova-core/gsp/cmdq.rs | 6 +-----
 rust/kernel/ptr.rs                | 1 -
 rust/kernel/transmute.rs          | 2 --
 4 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/.clippy.toml b/.clippy.toml
index a51de9a46380..b0a78cc8be20 100644
--- a/.clippy.toml
+++ b/.clippy.toml
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-msrv = "1.78.0"
+msrv = "1.85.0"
 
 check-private-items = true
 
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 46819a82a51a..d9f69366642a 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -281,7 +281,6 @@ fn allocate_command(&mut self, size: usize) -> Result<GspCommand<'_>> {
         let (slice_1, slice_2) = {
             let (slice_1, slice_2) = self.driver_write_area();
 
-            #[allow(clippy::incompatible_msrv)]
             (slice_1.as_flattened_mut(), slice_2.as_flattened_mut())
         };
 
@@ -572,10 +571,7 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
             Delta::from_millis(1),
             timeout,
         )
-        .map(|(slice_1, slice_2)| {
-            #[allow(clippy::incompatible_msrv)]
-            (slice_1.as_flattened(), slice_2.as_flattened())
-        })?;
+        .map(|(slice_1, slice_2)| (slice_1.as_flattened(), slice_2.as_flattened()))?;
 
         // Extract the `GspMsgElement`.
         let (header, slice_1) = GspMsgElement::from_bytes_prefix(slice_1).ok_or(EIO)?;
diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
index 512e2eabe3ad..bd669e74e1cc 100644
--- a/rust/kernel/ptr.rs
+++ b/rust/kernel/ptr.rs
@@ -81,7 +81,6 @@ pub const fn new_checked(align: usize) -> Option<Self> {
     /// This is equivalent to [`align_of`], but with the return value provided as an [`Alignment`].
     #[inline(always)]
     pub const fn of<T>() -> Self {
-        #![allow(clippy::incompatible_msrv)]
         // This cannot panic since alignments are always powers of two.
         //
         // We unfortunately cannot use `new` as it would require the `generic_const_exprs` feature.
diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
index 5711580c9f9b..b9e6eadc08f5 100644
--- a/rust/kernel/transmute.rs
+++ b/rust/kernel/transmute.rs
@@ -49,7 +49,6 @@ fn from_bytes(bytes: &[u8]) -> Option<&Self>
         let slice_ptr = bytes.as_ptr().cast::<Self>();
         let size = size_of::<Self>();
 
-        #[allow(clippy::incompatible_msrv)]
         if bytes.len() == size && slice_ptr.is_aligned() {
             // SAFETY: Size and alignment were just checked.
             unsafe { Some(&*slice_ptr) }
@@ -92,7 +91,6 @@ fn from_bytes_mut(bytes: &mut [u8]) -> Option<&mut Self>
         let slice_ptr = bytes.as_mut_ptr().cast::<Self>();
         let size = size_of::<Self>();
 
-        #[allow(clippy::incompatible_msrv)]
         if bytes.len() == size && slice_ptr.is_aligned() {
             // SAFETY: Size and alignment were just checked.
             unsafe { Some(&mut *slice_ptr) }
-- 
2.53.0


