Return-Path: <linux-kbuild+bounces-11741-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEaaLHQjr2n6OQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11741-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 20:45:56 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CB22404A0
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 20:45:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19D9430FD71D
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 19:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E9F43EDAD2;
	Mon,  9 Mar 2026 19:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rd3ms1Qk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3213451CC;
	Mon,  9 Mar 2026 19:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773085243; cv=none; b=QDQaohMYB9vt71bK6fG9gkeomlbWC3bOtDDmWv0olfkMqxTAR8D9czeM+FylphJEBWMqzwVzu2yG2VFK9T54RrWk19uFg4ppDpfSH8sckYGFcqA/rIxWRiQdc+fdzM2CUgfxmgbGG0rxUJjZbuZ7RfiOuuCuPwCvmlXuuish8DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773085243; c=relaxed/simple;
	bh=ykEDyFWqy0dWXj89fHrjAyafwdENidwWPunnvZCcBsE=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=JlkGHeu6ar/LXcmevgmrm5Rv7ek1o91ZS4K4HDdrVD4J7ESpee50FGqmvsdiLIWhYrGwPQLknvppSV8FdMblsczt1amFmNlZg5v55a/QdYHnFy5fj70wMU52S+6o5VusDweMZDP0nv7/M8/hqoc4l3LWjWmFfAG4Fxu0RFfw+vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rd3ms1Qk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9822BC4CEF7;
	Mon,  9 Mar 2026 19:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773085242;
	bh=ykEDyFWqy0dWXj89fHrjAyafwdENidwWPunnvZCcBsE=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=rd3ms1QkWISKBK/kda8ZvCMUc8dUM6BDjqWnDSwTxnHEVTaJxsnj62YNmUcrNsZUq
	 rHhBNMVYVbSmOttFJlipiFCze2aX20rShfa5uF+O9peJ1GHMIKJsLMHuKfTPXRk4Eo
	 3l4lrQ0ld6HuU8dspVmvmzIGmm14LjkHh5gdY8srnZzNwA+MUXLAlBgTv+IjKJLRo0
	 8efqtIGgwtJCi2MmWvchNg7hYj1Xao8rHPKiawOJw4WOtKMMptErwMy2V5xq9nfzk6
	 Taf1FbV6N2ZnYNldwgYDZaIcdg6GduReD+VDwF+cF16DdBWOT/+q8FHnmM5VfpZvMQ
	 qvNg5IvGuvBdg==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 20:40:36 +0100
Message-Id: <DGYI9CQRWXU3.XNDVWJE0DP6H@kernel.org>
To: "Tim Kovalenko via B4 Relay"
 <devnull+tim.kovalenko.proton.me@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 4/4] gpu: nova-core: fix stack overflow in GSP memory
 allocation
Cc: <tim.kovalenko@proton.me>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Boqun Feng" <boqun@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nsc@kernel.org>, "Abdiel Janulgue"
 <abdiel.janulgue@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Robin Murphy" <robin.murphy@arm.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, <driver-core@lists.linux.dev>
References: <20260309-drm-rust-next-v4-0-4ef485b19a4c@proton.me>
 <20260309-drm-rust-next-v4-4-4ef485b19a4c@proton.me>
In-Reply-To: <20260309-drm-rust-next-v4-4-4ef485b19a4c@proton.me>
X-Rspamd-Queue-Id: 06CB22404A0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11741-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[proton.me,nvidia.com,google.com,gmail.com,ffwll.ch,kernel.org,garyguo.net,protonmail.com,umich.edu,collabora.com,arm.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,tim.kovalenko.proton.me];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,zulipchat.com:url,garyguo.net:email,proton.me:email]
X-Rspamd-Action: no action

On Mon Mar 9, 2026 at 5:34 PM CET, Tim Kovalenko via B4 Relay wrote:
> From: Tim Kovalenko <tim.kovalenko@proton.me>
>
> The `Cmdq::new` function was allocating a `PteArray` struct on the stack
> and was causing a stack overflow with 8216 bytes.
>
> Modify the `PteArray` to calculate and write the Page Table Entries
> directly into the coherent DMA buffer one-by-one. This reduces the stack
> usage quite a lot.
>

Reported-by: Gary Guo <gary@garyguo.net>
Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/509436-Nova/to=
pic/.60Cmdq.3A.3Anew.60.20uses.20excessive.20stack.20size/near/570375549
Fixes: f38b4f105cfc ("gpu: nova-core: Create initial Gsp")

> Signed-off-by: Tim Kovalenko <tim.kovalenko@proton.me>

A few nits below, but I can fix them up [1] on apply.

> +        for (i, chunk) in pte_region.chunks_exact_mut(size_of::<u64>()).=
enumerate() {
> +            let pte_value =3D start_addr
> +                .checked_add(num::usize_as_u64(i) << GSP_PAGE_SHIFT)
> +                .ok_or(EOVERFLOW)?;

This should use PteArray::entry().

It would also be nice to get rid of the unsafe {} and use dma_write!() inst=
ead,
but this can be a follow-up patch.

> +
> +            chunk.copy_from_slice(&pte_value.to_ne_bytes());
> +        }
> +
>          Ok(obj)
>      }
>  }
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index 0056bfbf0a44cfbc5a0ca08d069f881b877e1edc..c8327d3098f73f9b880eee990=
38ad10a16e1e32d 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -202,7 +202,20 @@ fn new(dev: &device::Device<device::Bound>) -> Resul=
t<Self> {
> =20
>          let gsp_mem =3D
>              CoherentAllocation::<GspMem>::alloc_coherent(dev, 1, GFP_KER=
NEL | __GFP_ZERO)?;
> -        dma_write!(gsp_mem, [0]?.ptes, PteArray::new(gsp_mem.dma_handle(=
))?);
> +
> +        const NUM_PTES: usize =3D GSP_PAGE_SIZE / size_of::<u64>();

We can avoid duplicating this by making it a constant of GspMem.

> +        let start =3D gsp_mem.dma_handle();
> +        // One by one GSP Page write to the memory to avoid stack overfl=
ow when allocating
> +        // the whole array at once.
> +        for i in 0..NUM_PTES {
> +            dma_write!(
> +                gsp_mem,
> +                [0]?.ptes.0[i],
> +                PteArray::<NUM_PTES>::entry(start, i)?
> +            );
> +        }

-- [1] --

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 20170e483e04..b5ea14b7dad7 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -48,6 +48,7 @@ unsafe impl<const NUM_ENTRIES: usize> AsBytes for PteArra=
y<NUM_ENTRIES> {}
=20
 impl<const NUM_PAGES: usize> PteArray<NUM_PAGES> {
     /// Returns the page table entry for `index`, for a mapping starting a=
t `start` DmaAddress.
+    // TODO: Replace with `IoView` projection once available.
     fn entry(start: DmaAddress, index: usize) -> Result<u64> {
         start
             .checked_add(num::usize_as_u64(index) << GSP_PAGE_SHIFT)
@@ -90,12 +91,9 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Se=
lf> {
                 .as_slice_mut(size_of::<u64>(), NUM_PAGES * size_of::<u64>=
())?
         };
=20
-        // This is a  one by one GSP Page write to the memory
-        // to avoid stack overflow when allocating the whole array at once=
.
+        // Write values one by one to avoid an on-stack instance of `PteAr=
ray`.
         for (i, chunk) in pte_region.chunks_exact_mut(size_of::<u64>()).en=
umerate() {
-            let pte_value =3D start_addr
-                .checked_add(num::usize_as_u64(i) << GSP_PAGE_SHIFT)
-                .ok_or(EOVERFLOW)?;
+            let pte_value =3D PteArray::<NUM_PAGES>::entry(start_addr, i)?=
;
=20
             chunk.copy_from_slice(&pte_value.to_ne_bytes());
         }
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/=
cmdq.rs
index 9107a1473797..aa42d180f0d5 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -159,7 +159,7 @@ struct Msgq {
 #[repr(C)]
 struct GspMem {
     /// Self-mapping page table entries.
-    ptes: PteArray<{ GSP_PAGE_SIZE / size_of::<u64>() }>,
+    ptes: PteArray<{ Self::PTE_ARRAY_SIZE }>,
     /// CPU queue: the driver writes commands here, and the GSP reads them=
. It also contains the
     /// write and read pointers that the CPU updates.
     ///
@@ -172,6 +172,10 @@ struct GspMem {
     gspq: Msgq,
 }
=20
+impl GspMem {
+    const PTE_ARRAY_SIZE: usize =3D GSP_PAGE_SIZE / size_of::<u64>();
+}
+
 // SAFETY: These structs don't meet the no-padding requirements of AsBytes=
 but
 // that is not a problem because they are not used outside the kernel.
 unsafe impl AsBytes for GspMem {}
@@ -202,16 +206,14 @@ fn new(dev: &device::Device<device::Bound>) -> Result=
<Self> {
         let gsp_mem =3D
             CoherentAllocation::<GspMem>::alloc_coherent(dev, 1, GFP_KERNE=
L | __GFP_ZERO)?;
=20
-        const NUM_PTES: usize =3D GSP_PAGE_SIZE / size_of::<u64>();
-
         let start =3D gsp_mem.dma_handle();
         // One by one GSP Page write to the memory to avoid stack overflow=
 when allocating
         // the whole array at once.
-        for i in 0..NUM_PTES {
+        for i in 0..GspMem::PTE_ARRAY_SIZE {
             dma_write!(
                 gsp_mem,
                 [0]?.ptes.0[i],
-                PteArray::<NUM_PTES>::entry(start, i)?
+                PteArray::<{ GspMem::PTE_ARRAY_SIZE }>::entry(start, i)?
             );
         }
=20


