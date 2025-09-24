Return-Path: <linux-kbuild+bounces-8950-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE96CB99E71
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Sep 2025 14:43:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 567064C753A
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Sep 2025 12:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB98C30AD18;
	Wed, 24 Sep 2025 12:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wc7KqvJw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A2930AD14;
	Wed, 24 Sep 2025 12:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758717659; cv=none; b=P0ZtCI1+/91KKzqAzwPScupMcC+Ik5uT3ytxx+7K8OBf68qgxBpnylItd+cMVxDBUuq2RpykP5872PDpUonvgX9ZGKs6RGo9GNY387k4NegwYP8x2QqjDdvqYbawMzcZYqaTb6NAEqwUW9WDa4QHP6pTjnwAWeBHkPrHZSB+D98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758717659; c=relaxed/simple;
	bh=4Rj9VzFcMjV2b2FKGGXgH+pSxDEnRIoZbc9nYVS6Nl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mfch3YoFVZzU1dFLA15Dlb4wZSH7k1qtiiKmbLvztLsyfR7tneBknon1URNpi4Rny7h4g+JiTSh6+m6n9kkTmad829S1ps1f/KEp0SPJgfspjZs786g0q+5aEo9Jpbp93tUA//J7b3RiLG6M24xM1c1woREqSnhxkS0k43GJ+CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wc7KqvJw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B1FC116B1;
	Wed, 24 Sep 2025 12:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758717659;
	bh=4Rj9VzFcMjV2b2FKGGXgH+pSxDEnRIoZbc9nYVS6Nl0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Wc7KqvJw3OV4yZ17T1MeouXrudZYg3zb2g1XG0HLPsWuCACupIp1gTe32Lbx/YG/l
	 qayJM991xfQ3Wn1RcMNIZjYHiQ4Djhm0VkXLohTnOgdM6c0E90dUBpeeyK919YccEn
	 lfr3oTlZsN3psTrPnWNRztB8RAVtV5N/lBzYytFRpBkuQCYlVIA8R9JQyJGcCaLZfB
	 yGL1TfobWQvz3pv/3B5aEbxVCQEbcxPCl4UdHBCYfRSBl77hXHxDyH5DE9yZeBQt9D
	 6/wmeSBKx0XVtIuOe7kI4IjxeXZLLBffQhWZPOuTmuYkKbzPOPov7s8Xg04wv1oWvP
	 lXyXoEaSIsIrw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 24 Sep 2025 14:39:29 +0200
Subject: [PATCH v18 6/7] rust: samples: add a module parameter to the
 rust_minimal sample
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-module-params-v3-v18-6-bf512c35d910@kernel.org>
References: <20250924-module-params-v3-v18-0-bf512c35d910@kernel.org>
In-Reply-To: <20250924-module-params-v3-v18-0-bf512c35d910@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
 Daniel Gomez <da.gomez@kernel.org>, Benno Lossin <lossin@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
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
 b=kA0DAAgB4bgaPnkoY3cByyZiAGjT5qWieA70bPcE9KwDstNTPzEDSqzNcW/KKwEfNGGe5zFzV
 okCMwQAAQgAHRYhBBLB+UdWv3wqFdbAEuG4Gj55KGN3BQJo0+alAAoJEOG4Gj55KGN3du8P/0Pz
 1Kg4YJN2UBkSyiK13tR68CAr4cpX+mwTzvmnuAGDUnngm/RrQ/54iq6RFCTbBh0PpW6YN0zpdA2
 31RzISgK9Z6DIwtJUzCI7MLFApHjtUXlDtRJuDKWjxTkdjYTpNDOfBfSJwxy1vmSoSZVf/vgzqa
 qh5d8pkUcN999Qqb29QusALvf+hMpdSlPmTaOFtK0CEiDxGbfI4OzBRpxpf6c4OnUYj/ltpzpH6
 sMHi1T1PrIH/M50+gpDEAWWsFbkmLg/ES3UrRB+Mjtio1eBwAa0lw4wYkps9D+1ykJQe70Effcg
 KluCHFvRXsSsmGcltm0dbP52SpQQqiQRvUV2AJI3y7AMADVcYNqZ2cL5ZnBpbrsNtfa/EaIUsLM
 uIOTmkI4BBvdEfUugmClc3I9gmD4vPE7X3vpPgfaFTlI6DsmYQ4BLYOf3LKz6FDZNz/0vvS2M5h
 l7mmUPO/8uXD/+QLNb7avJDq8KZ4/M8tNvMmL8mTmXxUVpJ9tg1PCmyOrD//QxBJ9P5gLwGlMv3
 cqp12y9kG80eNfYDabzhORc1ZCv6DzeRaZ1PkA/szPVRHsXO+T9BHZs9z90IVn0CqagstoLQcKN
 golZ/To4KZwWowNGAsQRLqT+F3q5DmWkUV8dYD8Q5XlUipvKzfjRA+9u5lwQr+0XhlD8vbb1QBa
 e/dR1
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



