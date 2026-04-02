Return-Path: <linux-kbuild+bounces-12595-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GA+mCnpLzmmjmgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12595-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 12:56:58 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 760B2387FC8
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 12:56:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E878305D1E2
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2026 10:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B00039934A;
	Thu,  2 Apr 2026 10:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kpjTivnE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF15392802
	for <linux-kbuild@vger.kernel.org>; Thu,  2 Apr 2026 10:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775127344; cv=none; b=pKTU229zFR6VvLEzwzu1Bvn3SwvD6HSqBYzwRZtylLq6wCnDHXC5a2hnYgC7+ewEGIGziLV61n5gHGe/4ZnRw/vBg9Ee8rc82B8GJAQp78F8wdDkB343+/DZq97F2uE4Mliv9vkSlpTxxMDk/dZ0jHIvntteMOAjxHehmMMoDgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775127344; c=relaxed/simple;
	bh=3C8yINRWAEj0nve0gryqGP17JYD2qMc1E0piCXIuo6s=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=OyuiXc+WNH4cJF3q55WsIg2P602IV73qFl/r6hrXagBE9pTgGPP0xSD0pxnQ+PbmJD8wJlFuy1rnjm6KgEdWkGwL8rXECF27f1sd3HSMJ0EJDDQt0bNN7gnAaif+n1xYqYuEVRHZyWN6OaddwHrXqX/MUSq/L0o6i5T9ckYzl4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kpjTivnE; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-66beb377f5aso751598a12.0
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Apr 2026 03:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775127340; x=1775732140; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wL5rs1axZ+axUbPkhURUD+Cgb0mm20Ivquvok8vwQYs=;
        b=kpjTivnEnVByxj512YtjnJFGt4g1tpTHCVePs67Cn3sn2hx52u+JOF8YU9YLEUTvms
         WNCfPoNC/ddFTMls+91t0nwj24u2D2TN/579QiyAcVjdECJhilMVdUsbLjD+dRTK+fy5
         HZjY8EZdD+vxcs6ciY1Qoabdhc5lTH9d5AJIlUWwNXxXceKG2D9xcbs+uSCTK61J7b6e
         E9B0AQvPVfu2voXkhbRBqJ7nVfkHbEjnbE4/F6DVHKYCbX/XBf/PIZpK4QtxbRtKjt++
         kulMZoxHVU+CVMHiBXWB7gE3ATsrn/T2dVs5qFSrNc37yPAfj9h1ExQnXKr4/tgVpIDe
         XxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775127340; x=1775732140;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wL5rs1axZ+axUbPkhURUD+Cgb0mm20Ivquvok8vwQYs=;
        b=DWI0K/UAxTY3YUYOD0+wFXpJDcu0DXS5nLM9N9bCCS30LF2+a6MNE392qbBvXFMXKK
         G2qXRMmN1agxbqF9qVXA2QvpEjvIJA4i/9IgDRrfcAhz7YEt4oPEuRAzuPimVnzIxJPm
         skKtoNM3hhDsUXu5pLX1OvrcOVJT/q2B5ksqw28/YJ9BPnVvyPjqt+pdup3nsfxqQSr+
         wTL7mJ/wICcUUR5T4pjwPoXFXycrF3dK9nHac7zjYtNPDnAbLf81GtrB/iFJ9e1v2ZJR
         RaJs6HjTt3tBpNF1oFJ3XkGgxKywiZhgJw8TEKh2PyVp3wOi/EjphHpWBlMMFnwFlkOe
         Nuvw==
X-Forwarded-Encrypted: i=1; AJvYcCU0q54CqK4j3Qf6aBsCC4RQu963hgD+GhTKGvWenhwOUE+tgbONDb9HNPYmSvanm5FIXDATTGf/9XUZg9s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyDw7hejCxjeuPtoRMRRcmsZS7X5y2H9ZcG/dGOwCwrkOCNXIS
	U4pg6PDr5kqvj2KIEgKp69Pdm+ySDmDYgpsA2ey3edDPQPLGKT5dO9Y33Lzagp4qdHj4jpL8Gb+
	SffpS00aYIQYVZMUACg==
X-Received: from edcm6.prod.google.com ([2002:a05:6402:4306:b0:660:a3a7:7a05])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:3485:b0:66c:7ab:1430 with SMTP id 4fb4d7f45d1cf-66db09f00cbmr4756351a12.13.1775127340441;
 Thu, 02 Apr 2026 03:55:40 -0700 (PDT)
Date: Thu, 02 Apr 2026 10:55:32 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACRLzmkC/33NQQ6CMBCF4auQrq2ZThHElfcwLko7hSZCTUuIh
 nB3Cxs1Epf/S+abiUUKjiI7ZRMLNLrofJ8i32VMt6pviDuTmiFgAYg5r11vKHAd1EC8Vx1xcbA
 iJyFzqxVLd/dA1j1W83JN3bo4+PBcX4xiWf9po+DAS2O1wGOl6tqcG++bG+2179jCjfgmpIAtA hMBttRVWQEYWfwQ8oNAuUXIROiCACzKytbii5jn+QVLSX+SOQEAAA==
X-Change-Id: 20260224-binder-crate-name-15f14e134fca
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1803; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=3C8yINRWAEj0nve0gryqGP17JYD2qMc1E0piCXIuo6s=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpzksmJ2ehMbP07T2urveGbP+DxwIxwdZFz4/T2
 0D+E5rprSyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCac5LJgAKCRAEWL7uWMY5
 RhMnD/4+YV+hBtdf580uQF/Futj+KbL0ArbzYZyr6dKP0BKkMBKe1IF9QnXgzG/MGLePra1vXaI
 pNlpPmCmYm68G9dIYx5YEB2SkXtH2u8hdEMXS6Fpyj7aJas4DBxRPUMm9vrMDYbjLSPivhBFf6e
 uQQjZB/7Iq3KrRL8ds56X1hIOzFSsVxvFgGzk5JNTbkduuDa5ZmpPOtTfveclraOP5S3iEqAjFn
 3FEJaBE6ZxL7HJ77wMD7dRWqry9EeQmNMD56yARE1iNMJbUPkGf62G/CfkNZquaIFWmfNlxiUZC
 eelE3AALDL552BtpycrcwNmDG2Wd8swcXaEJ+c1hZK7ltzjz7/PDkd+b4/tFMM/3xnLDhmSidi1
 Ps8Zo6kuDiJ03qyrALaljI8Cfc5y8I7bdXYHzPR4e2L8vCkjSGFfnivnIapU6NPeK3Ypv4BGLmC
 BLUbQw0XK/HVciOJteJ/NkNu0FzhdhblLSTq1hd1Ee8NiUWfWO6XsNNKa1vWbydw7e7V0Kpx72l
 qa/UJvo0P1vHoOnO6bpZcWSQ9Zp/3Rurkw3mr8FdHeepCa/5Jest+PcnROHb3ro6ZosqEvjcfoB
 jHDeh5c8NvvVA0t9Net7WymhRsKac2eFAmaBvKlIrDD0RZCxRbDCCOIKpZtAwbTaj9DKQUY2vss B5Qtws3BCWDp/YQ==
X-Mailer: b4 0.14.3
Message-ID: <20260402-binder-crate-name-v4-0-ec3919b87909@google.com>
Subject: [PATCH v4 0/2] Change Rust Binder crate name to rust_binder
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Tamir Duberstein <tamird@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12595-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,gmail.com,linuxfoundation.org,google.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 760B2387FC8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently the crate name of the Rust Binder driver is rust_binder_main,
but I'd like it to be called rust_binder instead, matching the .ko file.
This affects e.g. symbol names in stack traces.

Thus, allow use of the #![crate_name] annotation, and set it for Rust
Binder.

I tried just using RUSTFLAGS_stem.o and RUSTFLAGS_REMOVE_stem.o, but
RUSTFLAGS_REMOVE_ is incapable of removing the --crate-name argument.
(Even after changing --crate-name to be passed with = instead of space
as the separator to the name.)

This cross-subsystem series is intended to be merged via rust-next.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v4:
- Rebase on rust-next.
- Link to v3: https://lore.kernel.org/r/20260323-binder-crate-name-v3-0-c6e00f239fb1@google.com

Changes in v3:
- Move #![crate_name = "rust_binder] a few lines down.
- Expand on file names not changing in commit message.
- Make rust analyzer python script a bit cleaner.
- Link to v2: https://lore.kernel.org/r/20260310-binder-crate-name-v2-0-0f7c97900d36@google.com

Changes in v2:
- Do not pass --crate-name and specify crate name using annotation
  inside .rs file.
- Link to v1: https://lore.kernel.org/r/20260224-binder-crate-name-v1-0-7dfc1289abbd@google.com

---
Alice Ryhl (2):
      rust: support overriding crate_name
      rust_binder: override crate name to rust_binder

 drivers/android/binder/rust_binder_main.rs |  2 ++
 scripts/Makefile.build                     |  1 -
 scripts/generate_rust_analyzer.py          | 46 ++++++++++++++++--------------
 3 files changed, 26 insertions(+), 23 deletions(-)
---
base-commit: 3418d862679ac6da0b6bd681b18b3189c4fad20d
change-id: 20260224-binder-crate-name-15f14e134fca

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


