Return-Path: <linux-kbuild+bounces-7477-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 952F6AD729D
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 15:49:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1D841C208C9
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 13:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 327AE25A2DE;
	Thu, 12 Jun 2025 13:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UgUR1uNB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037D4246BD6;
	Thu, 12 Jun 2025 13:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749735715; cv=none; b=ua0gIJX0Ewhb7IQH2eAg4Fdov4CHJiOqOmHNG8v5R/1alZ6OJ/ozBuu+Mk33AxPk0OABLLZ9xjdNbKfkQIeOAuHve+ifC9H5hcQ9QT6mdghX+smnKP2imKYdgCLsXucfWCNeYBIi9uj5nQdJdMBbHG2KdXpOWQcZENQnTiLV4WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749735715; c=relaxed/simple;
	bh=93O4r+kmKDFCOxEuHQOYGOvJph9EXJLBbFPup2aAaiw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pJpaRwpK7bnouCAV+T7pG+QNyjUmO9ZZdBAadiVFcvY/KRphOZI2g2OwAGHrY8GmHqoR9RH7wtN7bQG7R2JiQWcbxfBGslzu5JMecWLTauj7h5OnOipxN2JoBKYF6eIMd8n7Ln2ACeB8aTlzNghhmENLdfL6ktjB4/PITl5e85k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UgUR1uNB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6608C4CEEA;
	Thu, 12 Jun 2025 13:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749735714;
	bh=93O4r+kmKDFCOxEuHQOYGOvJph9EXJLBbFPup2aAaiw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UgUR1uNBDrsb0LYLj6wKDMtlcK9go+5fkWHxGNZrGWWcmVxhmGb4PBQGQEWDzQwf9
	 TMfpEY4ugwSp5GiWEvNCHrXPP9TgTlfqfaS1b77xFXE3JAny+rBfCF9VTpJgHj6MiO
	 cmER3CsQpJavQxyLCUYucOGLgDzMFX2B0xz1MDI7PKwLoybRZUsqvwOdgsWM/VqzHD
	 hynjsTUVz8ghHnrpftwUDcq3vT4//3bB3OnX4QNYQyrvpNStu3JPMMmFrJggBQKGqC
	 FeJLi7JPCeuxLGEcC5Lv9vqbmOYBuELhi8UUzxihvSIzrnFUhdayMBq/XJZ8SNrBB/
	 pERZD/fZkylSQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 12 Jun 2025 15:40:06 +0200
Subject: [PATCH v13 5/6] rust: samples: add a module parameter to the
 rust_minimal sample
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-module-params-v3-v13-5-bc219cd1a3f8@kernel.org>
References: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
In-Reply-To: <20250612-module-params-v3-v13-0-bc219cd1a3f8@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1217; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=93O4r+kmKDFCOxEuHQOYGOvJph9EXJLBbFPup2aAaiw=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoSti6KC9qPLWJ8930ZgrcjFzngIpyDLpikU0UG
 vLM3onGBEyJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaErYugAKCRDhuBo+eShj
 d0B9EACrkqVn40B92a0VhRagql+NDwZY5jE8WoFDiLVLlnJa9t5rb3HCpnYqZFng/dfgUtKWC2M
 6SbzbVuaWw/DxtgLGNfiJ2MGzBg6yy1ekiAJbeXhAiIeVkjmAxp8NPgvMPyypK6DAGlnZQ4lRcy
 2ngi7ek7CNnASahd3mDl7O4F/n8bgEiJ1XX58iU5nvLSReUiA78I7pEV0c+P+Lwl7fWPwxx40jS
 QMVOnrmI1/wQiEN+PaEym+l2dAu4P1W89/4sYhJ4Mp7+szLcV50yTPFu6H0AjKdGp56yOuE7F9d
 ziPEJ67RZhQ1RyTyzV47YxyaItyT8S3lbv9t7+macjEUA/GLv7bzl9CmsP+7eKtN6lpfs0Cdec/
 iFqw0/d8YyvhC+HYgMx/3p+K43PlEoNpEqDRdWeeHOgSW0qfGsSd1gm1YAJJMNVPoYQTBsHetCc
 sPKwfqBcaj5+tOurY0xZJMBF+e8KXD6PYcN1JvklizYTNNVxPY4GDu4ekoECKpvKIMaUJkOVtVn
 3MsRxN5xykmQyx859tWDGyYsOIsAdZVicg7p7xN1hAHRd8WqqAhAqzODwpU0HXXnGc6quC6e3q/
 +ljVzeoaiSYJz5ntE033FYJFgek6Ff/W6zcXNiMH0duuPvRCOrukDLsHtSgxQql/C7Azm5xDk6y
 hJ7LvHpnKYyk87g==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Showcase the rust module parameter support by adding a module parameter to
the `rust_minimal` sample.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 samples/rust/rust_minimal.rs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/samples/rust/rust_minimal.rs b/samples/rust/rust_minimal.rs
index 1fc7a1be6b6d..c04cc07b3249 100644
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
+            *module_parameters::test_parameter.get()
+        );
 
         let mut numbers = KVec::new();
         numbers.push(72, GFP_KERNEL)?;

-- 
2.47.2



