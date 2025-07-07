Return-Path: <linux-kbuild+bounces-7897-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3D3AFB490
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jul 2025 15:31:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FCA24A02EE
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jul 2025 13:31:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54883194124;
	Mon,  7 Jul 2025 13:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vBTiuLAL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D467E9;
	Mon,  7 Jul 2025 13:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751895112; cv=none; b=azJoY+04A8X6siEdH13flZA3+V7lrv7uG5+dgFOZxYOr4cxIQG+D2rxyNFIJ96aIi/fO+ZJVThd6k8CLzhme4Nzd4LYoa/rDvPQxxthLyQi+hyy6zw8Nz2kCvMKL8GxtyNxxxA8J9flxu7QmZnq39f3oDgdGz23thY8FdgH6gIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751895112; c=relaxed/simple;
	bh=4Rj9VzFcMjV2b2FKGGXgH+pSxDEnRIoZbc9nYVS6Nl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BXoAbdQfNijCvlcYwPkELvpt06KkCbTu60/xM9AL4vCLBuNshw87zw0H23DsZvYrXTSZxiej8/kJXvHBBfgGXNHskvoRLf5jSM63O/bJx8t+BGj/ylRRUVlLuZQfUY7dGAaycjTCh/av4E4UShrP8mEYBNa7sCpVwK6l+rb2Q78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vBTiuLAL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1683C4CEE3;
	Mon,  7 Jul 2025 13:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751895110;
	bh=4Rj9VzFcMjV2b2FKGGXgH+pSxDEnRIoZbc9nYVS6Nl0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vBTiuLALarVF0Dt1NF2pO9KbF2zrU1dKcEeY7MLjPwarJS7TpzSVEvJBOcssY60m1
	 MaAoF5M0Pjcu1or+17Uho/JG7lKFgAdpdnK0uWXh0dvzw0yPzQ1vBd/zsCXedIyvYq
	 TlEjJnaIWEpvFG+sY7puPE2h3r5yGPwlg3BJVA+WLdtH98pj7dM2TDfBUt59T1K/s+
	 F4d4efCocsPrK2Gcsz7ms0GghVvys1GjidWhDJY+TjgcB5od9ipizCYT1WSWKK3jl+
	 DLzLiUrAdJFivBtIxTu0IOxoqdGqbVzN+PvwwD+BnlUhXfefNuCt/aAHf1CqGzgOU9
	 R6yJ65dWDUzZg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Mon, 07 Jul 2025 15:29:10 +0200
Subject: [PATCH v15 6/7] rust: samples: add a module parameter to the
 rust_minimal sample
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-module-params-v3-v15-6-c1f4269a57b9@kernel.org>
References: <20250707-module-params-v3-v15-0-c1f4269a57b9@kernel.org>
In-Reply-To: <20250707-module-params-v3-v15-0-c1f4269a57b9@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
 Benno Lossin <lossin@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>
Cc: Trevor Gross <tmgross@umich.edu>, 
 Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 linux-modules@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1268; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=4Rj9VzFcMjV2b2FKGGXgH+pSxDEnRIoZbc9nYVS6Nl0=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoa8u4LFemyRPjAmVKu3zSjovuiQLeEyy8Yu++T
 kDM3pzk4AeJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaGvLuAAKCRDhuBo+eShj
 d2gVEACuKT0KcPyN2Jwv1F3/qNbhhCQ9WHRJqZcOa50EQzdxQ5VyYAAPlAiJIPNBAPP3Ksmjfwn
 4cGn0X9PVIosA95n8rkqrOJQdnbqBmfQdTQugVuOLRs0huNINSa/HTFw1b28ncXRhWR1eJ4McMN
 YxIut2wR6FoIxnvkgI1Zyd2OLXYsgBPmpD0ccKZAwGlTQa9BF+TIX+baKoB5FeYc32ZsOErrLTB
 SJbLbrq8nKPR0POCN4Sl3YKdVmZA+RGCWM8agn/VbFFSaU3+Gaphq0/VM+/tgYaK9fZARQpivK6
 rv28Nd3danlAx2f2xLJQ/m3za0GboZVlLltUhlU2l/HNrJTpZYHxEo1oAT1NrGEEGv6V6E2lFbM
 r5vaBYbNK9yzJMbX0Lv6/IQllxNJD8M6O2/RklhYKHZ1J4CPQd59dX4gObAKkNglaxGKOA3TlL2
 jlDGQru09k+38Djr4x75axmGPVxlCQHEyVsjitwWeIenp9SYW5nZdu6MLQrBsUp2UnGmw04pXsP
 f7wlpyEYdTjFm7Pa2g7fWpvxgrLzbj+X5oRDC4BXzsea9Kx+YnB7tIAGzcd2X6S32OM5VIV9lzW
 eaYRN9UEIBnKdTHhypS2ZaUTkf4rZz8I78Oai/wrkOcUnMDpfkK+mikU+fSzcGeUbTubljilHHF
 nqNavY1zff/ri1A==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Showcase the rust module parameter support by adding a module parameter to
the `rust_minimal` sample.

Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 samples/rust/rust_minimal.rs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/samples/rust/rust_minimal.rs b/samples/rust/rust_minimal.rs
index 1fc7a1be6b6d7..8eb9583571d72 100644
--- a/samples/rust/rust_minimal.rs
+++ b/samples/rust/rust_minimal.rs
@@ -10,6 +10,12 @@
     authors: ["Rust for Linux Contributors"],
     description: "Rust minimal sample",
     license: "GPL",
+    params: {
+        test_parameter: i64 {
+            default: 1,
+            description: "This parameter has a default of 1",
+        },
+    },
 }
 
 struct RustMinimal {
@@ -20,6 +26,10 @@ impl kernel::Module for RustMinimal {
     fn init(_module: &'static ThisModule) -> Result<Self> {
         pr_info!("Rust minimal sample (init)\n");
         pr_info!("Am I built-in? {}\n", !cfg!(MODULE));
+        pr_info!(
+            "test_parameter: {}\n",
+            *module_parameters::test_parameter.value()
+        );
 
         let mut numbers = KVec::new();
         numbers.push(72, GFP_KERNEL)?;

-- 
2.47.2



