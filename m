Return-Path: <linux-kbuild+bounces-7473-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D6CAD727E
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 15:47:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB831189AA41
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 13:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12D5B246327;
	Thu, 12 Jun 2025 13:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YCiqbO8P"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF7D245003;
	Thu, 12 Jun 2025 13:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749735692; cv=none; b=r1lQi9/AwGjlwjxKGgEDB5m45xKEq8stkoCcW+e5MHK8trNg/uFJbb7etg4wRRLvIUFvv4uSbOl+3h0oxQ4ZhkFh3HTJZ9+sG6RuFDkb27T3U8snRLKUhmgs384BQw5YY1fiTHuyGApq2fVi2wmPWm5Sdihzhl/SK25N4w4RYvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749735692; c=relaxed/simple;
	bh=FcJDCcrrHUp9gsLIJbqgqqM6grbEO+rX6m8nZneNa9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AmSU92JqyppIGILrjktc02qqgHlRBg7+gB9U2Ph+saznUwUnf+gTf2wpHusJMqpoGsEgnnThG9nC67c12YshWyUDwazZBNzmV9IE6y7MyBii0NvcupAKcSoJcryorerUVtoW58xcVWK0mb3ljFXmMGoKXBF8i2Fp7ok70cAYk+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YCiqbO8P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B095BC4CEF3;
	Thu, 12 Jun 2025 13:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749735692;
	bh=FcJDCcrrHUp9gsLIJbqgqqM6grbEO+rX6m8nZneNa9k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YCiqbO8PLveVBqUFcYoyGAEepEYbrgPCpWH4ycE+WCBSYfgzHFrF6YNmNgr0WNRiX
	 XKm/GNb3+vFHexghEbAgkxs8sukhA+VcmUecuSsYRbCHlY1rXJeeVd/1L/duUobUk7
	 fNJAmTqWjGQivzTopTbgeoxZbfEe89zqubJfOw8gO96GS4ewdur3N+yy/E3tk2SyQ4
	 8lA5OKdlEnTqHDIZjpjxrfc6QxdANMMfjF4LC4E949dv7PGUVnGO04+mUHaTW3XHMv
	 piG5b8DS1Vo3y1XjEZodZ4Z/pwz2obG+X0ZhlTKwwxrqFwSeo2ldVWVcu6bpTdGA0r
	 FrDZlpKKJpyGA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 12 Jun 2025 15:40:04 +0200
Subject: [PATCH v13 3/6] rust: module: use a reference in
 macros::module::module
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-module-params-v3-v13-3-bc219cd1a3f8@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2016; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=FcJDCcrrHUp9gsLIJbqgqqM6grbEO+rX6m8nZneNa9k=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoSti4FZoE261+TPEL6dSCS8pxoGIx98Evgi/az
 snBlhPfm42JAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaErYuAAKCRDhuBo+eShj
 dwfLD/9/TiGg/g1XSoPWG0udbcnt/WvOWr4IYXnnUFJvjHWcUiwYQo9IhaKXkUPQQybhCL6gFX0
 hMBUWknuUVNE328JVeYsBsZtQSs6FWLTyXTywaQeD9UYDH/mqAH8x9CmR8nIH72tiDyq8TqHBG+
 7Yb7w0FcPJKlRpidw5j/YkkU/F3bSs/3l0Et/yEC9FuGlGk8+yp4dnhxVwT9CtSZ/Hiu3+oeBJF
 QQTTBAIWavwsU4l7hsgWEW8v3ImzZc9JVA/hyiCWuBjMlwP+4K6eyL+MaIK1t8n3JWeQgcAhuIh
 aSZoo+rlVlh+XSrjPE2/ONyWh0u0JPbm+9HHojYCDMc6fO2NpT6opdqqeVPRHxCg6hRLwTJqfTd
 q175Hhu2mqToqFyF/5OatMZKk5Ga8A8P020gDVPhySltbEF/bos2OrbP8V4sRPCjxbzPAIINbKL
 lC4h/u22gQWQUZPjHekzRpCOKA2/n+HZEET54XZdUdudu/5io11RcURbz77Wg7WOU/UfIiaSlWh
 oYomrfIQLKh/F13rTTAd2RszkU3dC53NuxlVS92RzierfnQSlz9S5+7eE1TgPEaTQ0U8zvoaaKW
 y8jR9YyWFJXtKZewAPenFeQYuNYWL2yQilimEITOFfmN8Xk++hXNHkp/1Ec9JA/YXRUsF1zQ/G0
 wMEL5qBiDs7MnbQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

When we add parameter support to the module macro, we want to be able to
pass a reference to `ModuleInfo` to a helper function. That is not possible
when we move out of the local `modinfo`. So change the function to access
the local via reference rather than value.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/macros/module.rs | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index 2ddd2eeb2852..1a867a1e787e 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -179,26 +179,26 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
     // Rust does not allow hyphens in identifiers, use underscore instead.
     let ident = info.name.replace('-', "_");
     let mut modinfo = ModInfoBuilder::new(ident.as_ref());
-    if let Some(author) = info.author {
-        modinfo.emit("author", &author);
+    if let Some(author) = &info.author {
+        modinfo.emit("author", author);
     }
-    if let Some(authors) = info.authors {
+    if let Some(authors) = &info.authors {
         for author in authors {
-            modinfo.emit("author", &author);
+            modinfo.emit("author", author);
         }
     }
-    if let Some(description) = info.description {
-        modinfo.emit("description", &description);
+    if let Some(description) = &info.description {
+        modinfo.emit("description", description);
     }
     modinfo.emit("license", &info.license);
-    if let Some(aliases) = info.alias {
+    if let Some(aliases) = &info.alias {
         for alias in aliases {
-            modinfo.emit("alias", &alias);
+            modinfo.emit("alias", alias);
         }
     }
-    if let Some(firmware) = info.firmware {
+    if let Some(firmware) = &info.firmware {
         for fw in firmware {
-            modinfo.emit("firmware", &fw);
+            modinfo.emit("firmware", fw);
         }
     }
 

-- 
2.47.2



