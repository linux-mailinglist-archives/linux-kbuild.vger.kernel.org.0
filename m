Return-Path: <linux-kbuild+bounces-7957-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37158AFF043
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jul 2025 19:55:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EE305C0A2E
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jul 2025 17:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD79F24293B;
	Wed,  9 Jul 2025 17:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mq4ARsVn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C01E2343C7;
	Wed,  9 Jul 2025 17:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752083622; cv=none; b=LVlKx29jf0QtYXdENL9Nmbj8KGDmxjeD7AuJBUIaOpPQHcSnIvqI7KYTLc9Yths+KD7Wg/6ZHo6FmRBaX8MMVFhwXCAEujJJyy/hDneYsSHlQisi8YpbkE/l4Ea/Ji1+/xGHMBGRwznIa7VWRNSibnLFcort5yw0fsUvsdtCjhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752083622; c=relaxed/simple;
	bh=4Rj9VzFcMjV2b2FKGGXgH+pSxDEnRIoZbc9nYVS6Nl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YjD7vDTa8zDi3C49rsUx3WJouufOlpngwSsKxzqX42LBGBN85jS+i04t6eD6f4iyVieX7c4fNhvnMtUIv3q4XWxG+bMQPDYhlX1QRz/dWJydv1k2/lTpbZBWFYL5QKoJnJQPVkzuhCoOU22Qox0ZRDHSvBOl76P6XPSuj3RxbXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mq4ARsVn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB4FFC4CEF0;
	Wed,  9 Jul 2025 17:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752083622;
	bh=4Rj9VzFcMjV2b2FKGGXgH+pSxDEnRIoZbc9nYVS6Nl0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mq4ARsVnKCc4ZTvmu6DgC1jdknoJqJmnMQuFWrcBEj8L9zCK6Lrreo8Jf0HrmFh8N
	 VPCNozWMBR36KBo6+LeFz4rrOltl+PAAKo8PqwY5JULy+j0bPGu4HYPdepztOzacPf
	 NrG9sEC5MLhhBkEaGSAwP8n7WRB/LmndSYF9wTTSCFZZmhToebp5ypCgs37RztDd4O
	 iPzxRg3GatC0YgCHwtpwktiTz8oLg3/p/yve2bseYPBmiElwGaN5oJB1hCB338xD/7
	 GgcFzVkDP0JmDFlh3yzrgqpQGXiCXNhPAZU+GdKUcVrzJSDn7v8+DBg/qfjGndEJG0
	 lidilXLpoPXNQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 09 Jul 2025 19:52:20 +0200
Subject: [PATCH v16 6/7] rust: samples: add a module parameter to the
 rust_minimal sample
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-module-params-v3-v16-6-4f926bcccb50@kernel.org>
References: <20250709-module-params-v3-v16-0-4f926bcccb50@kernel.org>
In-Reply-To: <20250709-module-params-v3-v16-0-4f926bcccb50@kernel.org>
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
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBobqxeKwvg9OxdRiD78ZWUFs4K0qRoKrC9WULjZ
 GgzlqjrEp+JAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaG6sXgAKCRDhuBo+eShj
 dyEHD/oDwHl342wS3vJSfmkcJ8x7dmzi66aQHpRZ66n3S1suxUPTLjkqaemVpUdMCF2VjaQtH7g
 53Y0DrLT9+gy16qXnzFx4A/XSBVkZgUaeRtrvxhr49/NhU9/UhMGVwSOAdvxul/fRM52RJevCA3
 5Hh2XcmfzvewlgnRneLUiHqAqxtsNRPbyVvbix0L6l957nrZvT0jc1Tfgg/7uyJ+UwhZ4ThIZru
 yWbm9m4vY/kEV2fa788npb9QVFAsanCGfp4+cnKSWJU8RT5tuKLK2IKqiz7NykEinLM+54mXSYT
 CgCqddGWk5DBXzvojCRV00EZIR0J9zhHCCIt3Ut7w8z3FS0MTY64fUDjZ+PNas8YI5P2EXz7YR/
 Goj7KDHWYnKzEdW4jILPS9JfX29VwZ/7yH89Wr1Z76qedt6Z56DqpAoeWVALcB2TYleXg493FR3
 ABcK9MMuB5XUEhosHcbMP8A3P0K1InGGe7ULvn0+mUklGb5lpl2YPu/8FKdk+OaN+3iF19Ei3qR
 s1CgOyp9YSx9nXbLSPcVBUXX4yhLvSd770pZy872zPKZ4sxoMhKurwBIJVuNS+tDJAswG/uWKvO
 G+30ZwDTTrEDAvk+5ImvVAod4IAyH+xIZ6K1ccfSIFVwaBqs7Q+3ZxYsTLsvw7BSDmChG/4WeGO
 7kS8ZxnrIjHCBkQ==
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



