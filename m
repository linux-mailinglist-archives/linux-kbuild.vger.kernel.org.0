Return-Path: <linux-kbuild+bounces-7831-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7B7AF5879
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 15:21:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B363C188FCE2
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jul 2025 13:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD0927FB3F;
	Wed,  2 Jul 2025 13:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EsDXQ60/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429FB27F736;
	Wed,  2 Jul 2025 13:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462353; cv=none; b=ljiG6qQmThM63PpJXpQ4/W8h5nkWJBFn7DBbSlwmJ1/ZoEFQIjWhlAzjN2bFCxImCLh0YZVEfoXeDF5+BAYFmnaokBFMJrX8XaPcG5yeiKWZc8Hv43rDx9Hr7iLiXRzcjyj2k/Umb/foH0E4j2AZlHyynygMOnzDANn36ffp+I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462353; c=relaxed/simple;
	bh=6Qq3JEPyfCyEUyFmISVDX2MQupJGcEbRE4c1O1T+mok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VZZDcI6it+QMaJZL2bLnAs8C/Nskey8ypk7k87jiLxX4keB/9abJuLEya+a8yzHhKHJ+rPo9Q9oTKWcC3KYo3YYt0VUV2CCV5QBpbC1q9SJKByk3qD9XQrJ/lpGWYxvms+dLD3wbrOllDeXFsfveZv9rzo92rHgXPBY7tdZphFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EsDXQ60/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4527C4CEF1;
	Wed,  2 Jul 2025 13:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751462352;
	bh=6Qq3JEPyfCyEUyFmISVDX2MQupJGcEbRE4c1O1T+mok=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EsDXQ60/qp406117PPHHmCxHqj+D+cVO4P+hdBG1wp96pFPSwvIjEYKUMbsYXeI9c
	 a7e4RQNMYGf56rIltX9YXR1qiXrzNB2baeMMBbaUVkZG81f0PjrY+EQz78E7qNzACP
	 ouRga63SgTjdLlOMNgkUfUxggDAPOPP/kyvXBlxwNTZuMOs3DQG+x/6CEqXccYGmHR
	 XbIFVrH7qNIb6MFufAknP4u2HJdbKI0L9Fm3IIj10/r6+NMdUu5f71/sPemN6YzQIJ
	 lOzlQZOpSSdcl97zwuvT/YBkwRfiWNkP9enrWfmDfhWMDo1uw/jJC7uoHbZb3iSL2b
	 uvJzeu9d1czeg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 02 Jul 2025 15:18:36 +0200
Subject: [PATCH v14 4/7] rust: module: use a reference in
 macros::module::module
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-module-params-v3-v14-4-5b1cc32311af@kernel.org>
References: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
In-Reply-To: <20250702-module-params-v3-v14-0-5b1cc32311af@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2063; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=6Qq3JEPyfCyEUyFmISVDX2MQupJGcEbRE4c1O1T+mok=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoZTG1q7BWJyAZsiU8AbktVyBccUl9DhqyCQrwA
 st3PLRMCqaJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaGUxtQAKCRDhuBo+eShj
 d8ZaEAC93JQofnKZzaTP3AHtWLUIkIXhJ2c216bYIl/vCIhs9QXEv6pnYfc11CNpjudmWFmQwIb
 0vvpPsTeoGyt7pmGXLZhGez1Y8nfZMeDjU/yGQq5iIgxayKNQXPtYaYktoz+m9WEq8dLY5+f31R
 yIKJK4FRwENvQ6bqeJ3/SdpKV64FZbvEQtXTvXdXuBV2fQhPZ05UeATLUp6Ws683WwBZ2A0JKz9
 wPwdllGt83lJwTTuPC0S5Zs8Z/aK8x3ogKjDcHAHCXFE889kO0R8YgY885ltKB2w4EFksWvZLrk
 ML+wpnZFvmv4IHrdwZ2lDsPEeIbsZIcnUdu7BlauQAJgvM8x1zZ8pGTYrc9a4nFDtY9FoWxDGz4
 2GBMhZF+r9OYw1TGZPmp9B6Lr0/Axd8pC4T8YPBFrkpXHOr5KJEQ6xPdn8Qm2R+Mc2F/jAhwiSj
 FlW4ZMfZ8kRIv6tI8rxW6ogiyk8wfLjf3/UOKQsMT2FP8Ie5GaijdQoSJq3RRkTvw7/h66s2mzD
 Wx9P0o3SJ6z+xv0rofQRL0WUOe1exH9LoYiKtP30xzkBxJVHDlVmrSwwRywaJ81qg8SkbEtgy2F
 XzvXiq+Kmlgbcoy21q+Po6qJ0/qn9JNNHu3F6yK159oerKiJdmb3bcBLEFRyW5y2b0u1mD+AZd2
 pQmYBO8zQZ3KnlQ==
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



