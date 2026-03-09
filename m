Return-Path: <linux-kbuild+bounces-11715-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNbDMQr3rmnZKgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11715-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 17:36:26 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FE523CD01
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 17:36:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 58CAE3010747
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 16:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4208C3BD628;
	Mon,  9 Mar 2026 16:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nE9CPFES"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1354B3A9D8A;
	Mon,  9 Mar 2026 16:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773074119; cv=none; b=FpW3ftCdADHUfVRi1txs5H3AK134YjI/m8rumOZGFcYAjPqKufkkaFlV1ZP+QFVvchKdZNJHNQzcxwMYbi++09d+0Jc1UQHLM5svao4epYV5CYI4cXPEvKLWWvw6W7XVwlS88DMGk5UtFBQWJzXuUEmK0DoCQuvV1ZlEfbi7R3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773074119; c=relaxed/simple;
	bh=fssZhaE39h8/ifGb5lyKDHlx9SyrHqGfVID8VjmY0ME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AaVgx4Wp8NeWhrHizVG7oGkejqq7M2iawmhG7jQj6PwZRwFp6ImLy+4buVtI6oJCsNjNb/f24TlbS95M/MUN8263SU/wGsq0MGix9uMBHR0GY4P7lQeWQk8DtioD7bv6H1IrySEFt45Z/lfv6OD0XsiU4wXn3/pt8e9uZC43OOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nE9CPFES; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C224BC2BCB7;
	Mon,  9 Mar 2026 16:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773074118;
	bh=fssZhaE39h8/ifGb5lyKDHlx9SyrHqGfVID8VjmY0ME=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nE9CPFESeIElYpdFRVFYi/eDY9RoazP12jcTKXLiS3P7dRa9zphKtGh1pPAm0qMUf
	 Si1w3fT84m6mtNoKkiABeBnJPXnSSW1pcCw5+SieCJkAQsC0XZRTZbvXQhkysdgEm9
	 B56/DvoqOv6oxIeGkLvbO/i/fL6vA8SyOZbjKIf6Ub6oMWmKpiG3trmrmtJGoc+9ut
	 oISHSJI+QPG7Oi1wFCM0b/vDyzjppoceO75Z3Y3wZExWRhgsBxLQdEUmL3sEVDuhK9
	 Xmb/yGfDEC15+YoOym7ExlwwmTmLi825LE4F0VxIHZet28u3jXNL+ZEPYjOhdEi7rC
	 oLdNDkjd3nh2g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1174F41812;
	Mon,  9 Mar 2026 16:35:18 +0000 (UTC)
From: Tim Kovalenko via B4 Relay <devnull+tim.kovalenko.proton.me@kernel.org>
Date: Mon, 09 Mar 2026 12:34:21 -0400
Subject: [PATCH v4 4/4] gpu: nova-core: fix stack overflow in GSP memory
 allocation
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-drm-rust-next-v4-4-4ef485b19a4c@proton.me>
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
 linux-kbuild@vger.kernel.org, driver-core@lists.linux.dev, 
 Tim Kovalenko <tim.kovalenko@proton.me>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773074117; l=3986;
 i=tim.kovalenko@proton.me; s=20260212; h=from:subject:message-id;
 bh=02lIiBKVUWPZgiHflont6ppBx+2QAZbO4PzXiivsIkE=;
 b=pE0ZKAo+0q+3X2PamEznSFPbbQiSdIw7Xy/EgQG+Zfy/iiwn0Rb6Om2UKZsCeEXyeudQjTtkF
 +jL/j8+uX6ICxdDQJsEfm++qZt+CwLBc7cGDTtVkdNtnXo/EFKH2KKd
X-Developer-Key: i=tim.kovalenko@proton.me; a=ed25519;
 pk=/+OiulEpgeZifgP4mDE4e5YlV6nMeY+frze/lY/xiHI=
X-Endpoint-Received: by B4 Relay for tim.kovalenko@proton.me/20260212 with
 auth_id=635
X-Original-From: Tim Kovalenko <tim.kovalenko@proton.me>
Reply-To: tim.kovalenko@proton.me
X-Rspamd-Queue-Id: 22FE523CD01
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11715-lists,linux-kbuild=lfdr.de,tim.kovalenko.proton.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu,collabora.com,arm.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-kbuild@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.979];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	HAS_REPLYTO(0.00)[tim.kovalenko@proton.me];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,proton.me:replyto,proton.me:email,proton.me:mid]
X-Rspamd-Action: no action

From: Tim Kovalenko <tim.kovalenko@proton.me>

The `Cmdq::new` function was allocating a `PteArray` struct on the stack
and was causing a stack overflow with 8216 bytes.

Modify the `PteArray` to calculate and write the Page Table Entries
directly into the coherent DMA buffer one-by-one. This reduces the stack
usage quite a lot.

Signed-off-by: Tim Kovalenko <tim.kovalenko@proton.me>
---
 drivers/gpu/nova-core/gsp.rs      | 34 +++++++++++++++++++---------------
 drivers/gpu/nova-core/gsp/cmdq.rs | 15 ++++++++++++++-
 2 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 25cd48514c777cb405a2af0acf57196b2e2e7837..20170e483e04c476efce8997b3916b0ad829ed38 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -47,16 +47,11 @@
 unsafe impl<const NUM_ENTRIES: usize> AsBytes for PteArray<NUM_ENTRIES> {}
 
 impl<const NUM_PAGES: usize> PteArray<NUM_PAGES> {
-    /// Creates a new page table array mapping `NUM_PAGES` GSP pages starting at address `start`.
-    fn new(start: DmaAddress) -> Result<Self> {
-        let mut ptes = [0u64; NUM_PAGES];
-        for (i, pte) in ptes.iter_mut().enumerate() {
-            *pte = start
-                .checked_add(num::usize_as_u64(i) << GSP_PAGE_SHIFT)
-                .ok_or(EOVERFLOW)?;
-        }
-
-        Ok(Self(ptes))
+    /// Returns the page table entry for `index`, for a mapping starting at `start` DmaAddress.
+    fn entry(start: DmaAddress, index: usize) -> Result<u64> {
+        start
+            .checked_add(num::usize_as_u64(index) << GSP_PAGE_SHIFT)
+            .ok_or(EOVERFLOW)
     }
 }
 
@@ -86,16 +81,25 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
             NUM_PAGES * GSP_PAGE_SIZE,
             GFP_KERNEL | __GFP_ZERO,
         )?);
-        let ptes = PteArray::<NUM_PAGES>::new(obj.0.dma_handle())?;
+
+        let start_addr = obj.0.dma_handle();
 
         // SAFETY: `obj` has just been created and we are its sole user.
-        unsafe {
-            // Copy the self-mapping PTE at the expected location.
+        let pte_region = unsafe {
             obj.0
-                .as_slice_mut(size_of::<u64>(), size_of_val(&ptes))?
-                .copy_from_slice(ptes.as_bytes())
+                .as_slice_mut(size_of::<u64>(), NUM_PAGES * size_of::<u64>())?
         };
 
+        // This is a  one by one GSP Page write to the memory
+        // to avoid stack overflow when allocating the whole array at once.
+        for (i, chunk) in pte_region.chunks_exact_mut(size_of::<u64>()).enumerate() {
+            let pte_value = start_addr
+                .checked_add(num::usize_as_u64(i) << GSP_PAGE_SHIFT)
+                .ok_or(EOVERFLOW)?;
+
+            chunk.copy_from_slice(&pte_value.to_ne_bytes());
+        }
+
         Ok(obj)
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 0056bfbf0a44cfbc5a0ca08d069f881b877e1edc..c8327d3098f73f9b880eee99038ad10a16e1e32d 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -202,7 +202,20 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
 
         let gsp_mem =
             CoherentAllocation::<GspMem>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
-        dma_write!(gsp_mem, [0]?.ptes, PteArray::new(gsp_mem.dma_handle())?);
+
+        const NUM_PTES: usize = GSP_PAGE_SIZE / size_of::<u64>();
+
+        let start = gsp_mem.dma_handle();
+        // One by one GSP Page write to the memory to avoid stack overflow when allocating
+        // the whole array at once.
+        for i in 0..NUM_PTES {
+            dma_write!(
+                gsp_mem,
+                [0]?.ptes.0[i],
+                PteArray::<NUM_PTES>::entry(start, i)?
+            );
+        }
+
         dma_write!(
             gsp_mem,
             [0]?.cpuq.tx,

-- 
2.53.0



