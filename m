Return-Path: <linux-kbuild+bounces-7955-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C85AFF03C
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jul 2025 19:54:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8159C1889DA1
	for <lists+linux-kbuild@lfdr.de>; Wed,  9 Jul 2025 17:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A19EB241670;
	Wed,  9 Jul 2025 17:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gDByGWqy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744722367D5;
	Wed,  9 Jul 2025 17:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752083608; cv=none; b=UQyMNfCX84FRSzh3uftv5Ol0Emgt1Arb3rNu9DDiNloWlUQ/VB9u0gLUff21+kkWhPuN8TgCStdnOVtGYo4UiAteBZdG2J8Dl9cweP2x7SosMy2Y9uteZTU6HRkau+NjefUjQ4EOB2fmAPU+cfzSF1MBIFa5sNXmykc/1rWXFX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752083608; c=relaxed/simple;
	bh=K4Z3grvB4L1O4ywtrXjL9L/tEi3YiQY6qMjemNcyFag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K/mI/zvMbU+oh9tL7njq9HTWBWYoyzaTny0r6X4xwy9Jh2RckUwSXIYMs75HiQt7AF1KN6P/exhTjtz2cAj9cqepACLs6cbkCkEPtkL1yFXYWE+23SVEICRRpF2dWHQZh4vISmVlkDUwFW26PeoBgiNAPUbl+rVnO3t+TZo+zFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gDByGWqy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C5AC4CEEF;
	Wed,  9 Jul 2025 17:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752083608;
	bh=K4Z3grvB4L1O4ywtrXjL9L/tEi3YiQY6qMjemNcyFag=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gDByGWqy4Pd2AbRVXbGO82Kx1MATnECI4uKMSPzF8as/7VPHFeF+qw81IgYtPgNf4
	 6HgUNqQb77vsvVoMPFjCtUF9YaIRIS6fgZWPmTKbmsTdZGqtEfVbqGTFUCz/8XVk3T
	 65cuN3VRHXWidp034CaAfAUpGd0YzcCwRWCYkTp6Bf7y+GO2gRRJxgoIM0P5PM/q3k
	 6IEjc5TOEbZXptVhvlucWDhG6lgMjZXyJhGOIgUKIu3E4uS0gtpP0cmwQHco0UfR9Y
	 ZJTLm0ONZGSg7c9XOoRTR9695aiY1K79Ch5Rr19sDHpbPVnNZIpxyqk0TkbB1axm4Z
	 5bZ0WHGkUcUyQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 09 Jul 2025 19:52:18 +0200
Subject: [PATCH v16 4/7] rust: module: use a reference in
 macros::module::module
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-module-params-v3-v16-4-4f926bcccb50@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2065; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=K4Z3grvB4L1O4ywtrXjL9L/tEi3YiQY6qMjemNcyFag=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBobqxcHy/kWWAyrw6ui9lv70j5vOxZSf0ftzrFP
 CmvplqqarCJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaG6sXAAKCRDhuBo+eShj
 d8mcD/4uWd0BkILOPTqHaLscHwXCRKmJ4jOFwmBxxR54Ns7ekwJjyMekCM4VPq76OEBklcX0/Y9
 rEPWWSytfV4uLPwdXiPFJhz0zfgD4zxXLgpFGFGRahEWDJfcZc5tD6vzghSSoujXIxPt8RK1/Q2
 iMxg2HK61PHf92bUA7QhXyNjjBx69aM/Vfzidf7O4/QoDRLCZ+5OGu2cL8CSWYf2cX7OoD8yI1+
 waGp4faguOXnBpRmy/On4ON37Lnm99d1JAXEHHAmcYN3ZgdN3CsmKyUzjSGeE4NC+yEBvKMweWP
 nFjzWWeku+hPAEqtCGOnQveSuVStTDXxDUOa9WQ8A26B1AFHC1C03sfdeROkZb5SQnaN4/yfmGa
 0LE3aGEq4eRJ/Pz1EZsssXKuyXUvIpNGDw3EPHA2mxqUHOy/nzRg5NJ0IAUBwP8pc6lX5TCg643
 NZNnALWQ9D/hqYZapNJCgXx6DrxpINYw86Ic10A7UEuxZfsiViNiYeDdCYMdlyhLOdPWutYvKuy
 371CnvkJEvQ4RFQEFSqrP3GqPD/f9TlmEJVF2GRPKimNkOUaFUL/f1n4BACjzIV4Y2UT4uuC/Y9
 kTM57ZHg6E/2LRwmkjcZy3ou/+0v0YGtYC/VjAjvjw8KxjDkuI4d244hV4ERsIMQ+D7UXXOX/AG
 vPRXPv7F3VThMMQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

When we add parameter support to the module macro, we want to be able to
pass a reference to `ModuleInfo` to a helper function. That is not possible
when we move out of the local `modinfo`. So change the function to access
the local via reference rather than value.

Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/macros/module.rs | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index 2ddd2eeb28521..1a867a1e787ed 100644
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



