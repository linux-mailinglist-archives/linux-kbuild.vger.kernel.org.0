Return-Path: <linux-kbuild+bounces-7980-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53335B013B5
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Jul 2025 08:37:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3C635A2AF9
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Jul 2025 06:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D9FA1E51FA;
	Fri, 11 Jul 2025 06:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pCYD6jFY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDD51DE4FC;
	Fri, 11 Jul 2025 06:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752215804; cv=none; b=MPZn9mcm3Hkerzig0QEj2VPBBcuGpf49+msR/Q8EgCgY9kk1pVTD4gpz4OqXhXlFkpxEzbRRIWg5hk9M1Hxck6FttTVUmVL2eoe1s/QaHly6sCpfnNiZoHp8ilx8RvWO5YTw/YuQhDU6S2egMsS35mi+z0iJJ5dRkXf+HFtRImQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752215804; c=relaxed/simple;
	bh=V3Syysdg1+r38yUWEjRYdLrE6Oqk8+rE/hUE2L4F6lk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PhbEYHPdrVoSSB/QHK1XVbfy1JzeV8G/G3qPmduDRy7AwUtN54YwojrZZRgc1vWUG7+eQTDcr3G6TWmYA7MEo7RkEO7Rr+IntOsyZcY14CyNBRfky5n4ChFgLulv+MxilQ9/jbrjyoFaDOi2kFy/lxbV5P9oECWkhRAb5CqDww4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pCYD6jFY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4130BC4CEED;
	Fri, 11 Jul 2025 06:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752215803;
	bh=V3Syysdg1+r38yUWEjRYdLrE6Oqk8+rE/hUE2L4F6lk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pCYD6jFYQo7VoP12Dho4Y2u6XvVzdRvhtBtB+EN4AjFbORyIFPiIYg4TuyCu22LzP
	 5ZBZuEjoLJSTbSFm+pDay+5ZNC6mQJeIAjqnNskIIOrhSwH5j2QFPm+cO6/OjqOxRV
	 cGRd+IHxWXEpaq/77y4JBBv31nurRn4000qCGfoWgD/r036sKpsLqWuWlVGkremjJs
	 l+e55IgTv2gkutheH/ktXy3v3FcBQupK/0NdjVaFVda+hwHfwx0dilZ6m0prU3zQUx
	 ytNaNHrR9vM3wqphmhN8ShwPinZMMqCr/1gakFjr6DR/i4EpZ3oort/MD8Qggyz7mS
	 7R1F01CkMpYdA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 11 Jul 2025 08:35:48 +0200
Subject: [PATCH v17 6/7] rust: samples: add a module parameter to the
 rust_minimal sample
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-module-params-v3-v17-6-cf9b10d4923d@kernel.org>
References: <20250711-module-params-v3-v17-0-cf9b10d4923d@kernel.org>
In-Reply-To: <20250711-module-params-v3-v17-0-cf9b10d4923d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1266; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=V3Syysdg1+r38yUWEjRYdLrE6Oqk8+rE/hUE2L4F6lk=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBocLDZAI0U5EDlUuUeiwl0fVL1i+GcMauDOIlt7
 guS6Mx4tBqJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaHCw2QAKCRDhuBo+eShj
 d+XcD/9duMSjKY3CePRlBL1BTPPAdGifwU8sISRZniAXdGNREpLemAwsoTjdXsfLwkWGavO8jbT
 NQGC3uTAts7woBNwHkp8yugVw2M8mFA/u/oEcrF8dW1T6tUnHRKPDHWizXlCk5fLNKTnFSTmkpX
 QuuSJIzBHe8nvjSu9L982aaj7B0xXByMP/dm8zIuYyyXCrDym5cQdyPuMvKBCo6SB0Ycjs8ZUo+
 jAcIp2X5dhM+9MDgwS6l66A7y8W3nQ/79x95ZxtyQ+IB1qadKRqxa2PRprMx8736EST3PsTVR7I
 ajkJV4sVC2iMB9CccZ4Yr8ewH68A91tEngZAnfpJSLDQh5FocWXoo6T66R6aHxF8aFZCHL54f5v
 jOe3Q/C+lcNUci5l+D09uIOZCecDqhq33+GJpjycwG3uDA9kDvb89octXbEUXZVtvllsd8u69hk
 1NK+hDl6f3C+rV12ZCu86nhN7qMJ9BrtVznCkFiBzRHvq+BY9j8rqBA0TbE5Mdkj0uxVMXI35UV
 eTPnaBc/6siwT+L2Vb26+/3h+1nGvDGPhgSHDeH5Qya3cpD7k8N9kBf/8JYZyZcxHT97htskNf3
 IuK3SL7ZhmHu0UVtaaB12Ke/j8l9zkd8yZZtgRYAuQUQtNHpthGt5I4JdC/k/4jH7eWPce+ixFn
 WPlrDZl9ULpBcXA==
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
index 1fc7a1be6b6d..8eb9583571d7 100644
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



