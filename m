Return-Path: <linux-kbuild+bounces-13638-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bvztHODQJmoTlAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13638-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 16:25:36 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C984365724C
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 16:25:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=dCMWza5e;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13638-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13638-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BD2C3096B7E
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jun 2026 14:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 645E83CC7F3;
	Mon,  8 Jun 2026 14:16:34 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511613B47F5;
	Mon,  8 Jun 2026 14:16:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928194; cv=none; b=et9TLzWmjL/iYNxgFNzlcOChTOSHkYE2e8NIPrWFtzc+5ztpH0PAoJIaS8Pi4YmQ5vKeXcC7xMl3adTNoiiXN+xog+uMo1GQe288ULgUnPfubl8s3b9gKXhSmKoipSQBEhApIlKx8PmwEpwIDxLql0fqReTmWBt1NBTvFbC0rSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928194; c=relaxed/simple;
	bh=Oe9XFqlXuAmsnc6WSWtrpKPtz2M3e8qL4C5vGUFUre0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GkF9alpJ/vk/btuq5t/lgI2I6szePC0j1oO337pgqWqqGui/sIJn3BwyDRKvLg9lc4Yl+ResS0raNQPtpQ9zD2U6XgIOWfb1xg2EqcpgsXgp8N9SkqwhNwuTIBBS1DkBCgh1sRmCNDJLEowgMWIrx/pz0v/covdgBcqho6BjRcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dCMWza5e; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E4DD1F00898;
	Mon,  8 Jun 2026 14:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780928192;
	bh=qXunqcs08Le2F83lp8XKhbK0dsl8SFco1EmodxwwkRw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dCMWza5eLw37sK/D3zwXHzuQM+p4gDAA62j2mnF/lWSfvX0VEzESan5Z3v0/K1L3t
	 kKofaXL0VLCece3MpbixTb1IsEyk12mxcILCxzsJX60E9nZXOQXLU14hSxM6ETG5Mt
	 HIa2l8xcPtgqYMdv/IiaDTwvW7MoewGZPheZEVoXG8FGOiTwp9utUNGwjOwV1ibd6V
	 1OtQ57lKp6cT4AZaMqTth/vOsE1lCP7GZZeaq03igTOBKUOO87d5Ccn/GPmm7saovm
	 Nx0lwV1MPHI/1z2cyjJmPQDP+1B6rgfnwVrMcdbf518yMp9wCGlap6IgND7U927Ot8
	 PRXDnII031b5g==
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
	Jack Wrenn <jswrenn@google.com>,
	Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v2 19/19] gpu: nova-core: firmware: parse `FalconUCodeDescV2` via `zerocopy`
Date: Mon,  8 Jun 2026 16:14:38 +0200
Message-ID: <20260608141439.182634-20-ojeda@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,nvidia.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13638-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:joshlf@google.com,m:jswrenn@google.com,m:acourbot@nvidia.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nvidia.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C984365724C

Now that we have `zerocopy` support, we can avoid some `unsafe` code.

For instance, for `FalconUCodeDescV2`, we can replace the `unsafe impl
FromBytes` by safely deriving `zerocopy`'s `FromBytes` and then calling
`read_from_prefix`.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 drivers/gpu/nova-core/firmware.rs | 5 +----
 drivers/gpu/nova-core/vbios.rs    | 6 ++++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 6c2ab69cb605..ad37994ac15a 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -48,7 +48,7 @@ fn request_firmware(
 
 /// Structure used to describe some firmwares, notably FWSEC-FRTS.
 #[repr(C)]
-#[derive(Debug, Clone)]
+#[derive(Debug, Clone, FromBytes)]
 pub(crate) struct FalconUCodeDescV2 {
     /// Header defined by 'NV_BIT_FALCON_UCODE_DESC_HEADER_VDESC*' in OpenRM.
     hdr: u32,
@@ -84,9 +84,6 @@ pub(crate) struct FalconUCodeDescV2 {
     pub(crate) alt_dmem_load_size: u32,
 }
 
-// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-unsafe impl FromBytes for FalconUCodeDescV2 {}
-
 /// Structure used to describe some firmwares, notably FWSEC-FRTS.
 #[repr(C)]
 #[derive(Debug, Clone)]
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index ebda28e596c5..8b7d17a24660 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -16,6 +16,8 @@
     transmute::FromBytes,
 };
 
+use zerocopy::FromBytes as _;
+
 use crate::{
     driver::Bar0,
     firmware::{
@@ -1011,8 +1013,8 @@ pub(crate) fn header(&self) -> Result<FalconUCodeDesc> {
         let data = self.base.data.get(falcon_ucode_offset..).ok_or(EINVAL)?;
         match ver {
             2 => {
-                let v2 = FalconUCodeDescV2::from_bytes_copy_prefix(data)
-                    .ok_or(EINVAL)?
+                let v2 = FalconUCodeDescV2::read_from_prefix(data)
+                    .map_err(|_| EINVAL)?
                     .0;
                 Ok(FalconUCodeDesc::V2(v2))
             }
-- 
2.54.0


