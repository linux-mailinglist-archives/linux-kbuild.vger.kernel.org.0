Return-Path: <linux-kbuild+bounces-11712-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJOyIF/5rmnZKgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11712-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 17:46:23 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE2823CFA1
	for <lists+linux-kbuild@lfdr.de>; Mon, 09 Mar 2026 17:46:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 377DE3064D87
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Mar 2026 16:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 262263B5842;
	Mon,  9 Mar 2026 16:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qJypnZvq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECDC39B48D;
	Mon,  9 Mar 2026 16:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773074119; cv=none; b=H/euVHdITrZBXjKLO/zrnqemFIJ7hJ2ErSKCkVcd+9WtJroYTiDCbEPAZAQjZXUdnNnJ2UsMNZBUyITVf+5liLZ0NWFjQunMuYGp1P9Ne9RgLMMH/hA0mkXMRHS7aBH6fL9sowX76yaErbHq1VEKMyz/fzXCM2wUpNqcJwl9+mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773074119; c=relaxed/simple;
	bh=Lf/tjBPdlKcD7jrxP5eEotYbP1CD88GOp7ffo4qPdl4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jY5gNuZVTqkf2yyHwDHK3iyaG//DcqapQFBT6dhahB0iUkPlvM6DcVKTtL6i1HqSCJHocZ5vjcgoHyoflD9QpqLk3H4hyC+orzpbOkcRm8w4FTl8z6/ZqWEy03HEhWefKqjhLuMO3fJS/gFCtKBLDgmfSj9GZ2KIQ/Ni2id8Oj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qJypnZvq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A517C2BCB1;
	Mon,  9 Mar 2026 16:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773074118;
	bh=Lf/tjBPdlKcD7jrxP5eEotYbP1CD88GOp7ffo4qPdl4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=qJypnZvqDuuvPI/9HNKX96yrIj5W8JOHoDnuKraZ5hTnn+VfEmTiPbv0ojNT4/B59
	 JW23FjLhK83UL3OuvvkIvqIQLmlOW+fo7xere/D4Byy2R2FsNQithXuEo/8/3zBVpB
	 Zm+/eABRZJw5giIvS8QhAf9BYlO9lwjoTjx4mu8SEAX68qPDqDImKJD+oD2jl12vzG
	 ZPdf4pdCGvfVPm3fOkuBcWMgm9PNPjOdSe/QyvYtr1sdLrb4+pHyOHHvAeguu2VvLL
	 kShyRrDjBVsoHe8sadvaBULOq3XPKaZWTtH8NJ/nHZc0+9evQ8+0DpdsIUr6bgQ3Gf
	 Z0VtBq0C8/2jA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E316F41811;
	Mon,  9 Mar 2026 16:35:18 +0000 (UTC)
From: Tim Kovalenko via B4 Relay <devnull+tim.kovalenko.proton.me@kernel.org>
Subject: [PATCH v4 0/4] Fixes the stack overflow
Date: Mon, 09 Mar 2026 12:34:17 -0400
Message-Id: <20260309-drm-rust-next-v4-0-4ef485b19a4c@proton.me>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XMsQ6DIBSF4VcxzKWBi0rp1PdoOqBcK4NogBIb4
 7sXnYxJx3OS719IQG8xkHuxEI/JBju6PMpLQdpeuzdSa/ImwKBmwIEaP1D/CZE6nCNtsFGgEZW
 RFclm8tjZee89X3n3NsTRf/d84tv7r5Q45bRkSqhbwwFr/pj8GEd3HZBspQRHLc4astaaqbKTN
 wlcn7U4annWImuFElXVVkqa9qjXdf0BSCj97iYBAAA=
X-Change-ID: 20260212-drm-rust-next-beb92aee9d75
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773074117; l=1907;
 i=tim.kovalenko@proton.me; s=20260212; h=from:subject:message-id;
 bh=ur3mma4izM+B5GojZDmfk652EPp1d2EJADISR8mbwE0=;
 b=H3g4pztXItI93AFUT5bJEqqHh4yK27wA5nyBvGNWYTZ5xmzc0yEOXNpfRQ0CgA/5ymjpVGqFG
 fbcO1cz35oUA5sAonNIeYEaK47bnSFhPuWvMK5hzWiftvd8WbwGMrlU
X-Developer-Key: i=tim.kovalenko@proton.me; a=ed25519;
 pk=/+OiulEpgeZifgP4mDE4e5YlV6nMeY+frze/lY/xiHI=
X-Endpoint-Received: by B4 Relay for tim.kovalenko@proton.me/20260212 with
 auth_id=635
X-Original-From: Tim Kovalenko <tim.kovalenko@proton.me>
Reply-To: tim.kovalenko@proton.me
X-Rspamd-Queue-Id: 1EE2823CFA1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11712-lists,linux-kbuild=lfdr.de,tim.kovalenko.proton.me];
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
	NEURAL_HAM(-0.00)[-0.976];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	HAS_REPLYTO(0.00)[tim.kovalenko@proton.me];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[proton.me:replyto,proton.me:email,proton.me:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action


---
Changes in v4:
- Rebase on top of projection changes
- Use index projection when writing PTEs
- Keep PteArray, as discussed in V2, and move entry calculation there
- Avoid stack allocation by writing PTEs directly to DMA memory

- Link to v3: https://lore.kernel.org/r/20260217-drm-rust-next-v3-1-9e7e95c597dc@proton.me

Changes in v3:
- Addressed the comments and re-instated the PteArray type.
- PteArray now uses `init` instead of `new` where it writes to `self`
  page by page.
- PteArray just needs a pte pointer obtained from the `gsp_mem.as_slice_mut`.

I hope I understood everything in the V2 email chain and implemented it correctly :)

- Link to v2: https://lore.kernel.org/r/20260213-drm-rust-next-v2-1-aa094f78721a@proton.me

Changes in v2:
- Missed a code formatting issue.
- Link to v1: https://lore.kernel.org/r/20260212-drm-rust-next-v1-1-409398b12e61@proton.me

---
Gary Guo (3):
      rust: ptr: add `KnownSize` trait to support DST size info extraction
      rust: ptr: add projection infrastructure
      rust: dma: use pointer projection infra for `dma_{read,write}` macro

Tim Kovalenko (1):
      gpu: nova-core: fix stack overflow in GSP memory allocation

 drivers/gpu/nova-core/gsp.rs      |  48 ++++---
 drivers/gpu/nova-core/gsp/boot.rs |   2 +-
 drivers/gpu/nova-core/gsp/cmdq.rs |  23 ++-
 rust/kernel/dma.rs                | 114 +++++++--------
 rust/kernel/lib.rs                |   4 +
 rust/kernel/ptr.rs                |  30 +++-
 rust/kernel/ptr/projection.rs     | 294 ++++++++++++++++++++++++++++++++++++++
 samples/rust/rust_dma.rs          |  30 ++--
 scripts/Makefile.build            |   4 +-
 9 files changed, 443 insertions(+), 106 deletions(-)
---
base-commit: dd8a93dafe6ef50b49d2a7b44862264d74a7aafa
change-id: 20260212-drm-rust-next-beb92aee9d75

Best regards,
-- 
Tim Kovalenko <tim.kovalenko@proton.me>



