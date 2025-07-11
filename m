Return-Path: <linux-kbuild+bounces-7985-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1B9B013C4
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Jul 2025 08:38:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8527F1C272E8
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Jul 2025 06:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 306311F30A4;
	Fri, 11 Jul 2025 06:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j7XVrsgu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011E51F03D7;
	Fri, 11 Jul 2025 06:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752215835; cv=none; b=M1jGrJA6SwXXDqKGn+yeXb7T89YWQH2tyq+S0esapVaabVLcy/PywaQ7EX1IYlvP9PWzVITBzOOqHu94kOONc+zp7m82SnFFSN2utnNSHJCP+ogtdLsUOSW2W8pBp8z8gXmwSZi83A3+AliBXLWC338blWlYZ0mc+i8rrfrgoh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752215835; c=relaxed/simple;
	bh=6Qq3JEPyfCyEUyFmISVDX2MQupJGcEbRE4c1O1T+mok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PEkSddzQDwG8prTnqg94+jk5/3TFi142nqEoNqQtqqjuZoaBiMr4mE+tY3PGBKsn/YmAPsinHJFpFWnYNvI2MBIzTNzyh/5sPZB1QP0k2WDar25TwPBGGjDGUe4iVJGz6hJBoWkd2SAeVyRjgEBmfq8QSUb5DFrAc7/qcV9IwWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j7XVrsgu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE872C4CEED;
	Fri, 11 Jul 2025 06:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752215834;
	bh=6Qq3JEPyfCyEUyFmISVDX2MQupJGcEbRE4c1O1T+mok=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=j7XVrsguwepmw8ZjfASZccTjN6QZkNUIznz3wLK9S/8jEI+UNrFG0r874OCRZRUbS
	 2Dy8HCnoTc4IgsI7lbvndC8vBd1Evkm2ANMMYU2tSL4OkTFy0GVAvb3P0p/pIUrS63
	 j2a990ngwqXsp9PIc0UnWdH2GKhS2B1F4cKiu1ns+0svwYbYZOfeY3Dsod7XCLHp4u
	 kwqFo/l+1kaaZp88rlny6gyysN9PY8mMq5xa+UA897gl/rV/ejBjdi9vkbfFr/04ip
	 L78cGG0+sxpg7opQi3NpifgNg+8mt9BgRJ8Q7RPHnBntsRsaNG34u0+8JWzIQvOPy5
	 XUfOn9KpOaUww==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 11 Jul 2025 08:35:46 +0200
Subject: [PATCH v17 4/7] rust: module: use a reference in
 macros::module::module
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-module-params-v3-v17-4-cf9b10d4923d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2063; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=6Qq3JEPyfCyEUyFmISVDX2MQupJGcEbRE4c1O1T+mok=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBocLDXTwiKgisxAT1UbAUOHYJRwdFdGswVZLInN
 PH6b2B5QW2JAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaHCw1wAKCRDhuBo+eShj
 d+AkD/9MBoT2PmyzLR/lq2CJYH+uXNw3liZLoSpKh1/Wgz3PSYbnyvn67EFFkaqYOihsmhpuL0d
 BzNvvHIAksNrDWvn73MuabTRpvI1yn7/O4Fc6E4mZdWIIxvFLqJCfzWfrDI6/hXeQ8y6pcSuLOg
 s1UKKYu1MNHMPhBOvC7i9disi4AST34uKSrFFEfgKAut6b0ZJbYkb2NFRpsIoaQ3T1OZX2J6uFh
 CMqVAozelLfna40h3YMC8Zenjhb+hmL1JfOXTKUn/xPuWJCa+JlAGwGtCbkwrWvkP70iAmPAcAO
 f3YTDQ5cOqD8JGVOWQT8pXZxv2/tZ7PXhaGNdP0HEINoM6Dq9WEYSxIHUrBb7gHk51ZXM4wbMA3
 2ZaI5NFp7uQ9TfSBhCwRoit4xWGDEbsN+YuRYpwD9Cbgt2aM6jQdJy2TzrjOm5L6iYRty+FxnL2
 cWCtdOuO2W8MI1QmihBSY7H0Ibn3q0OKPOEv3U9EoM7zlffnRzJgRRNBY68TrFn/t5IY+HoLp0A
 uJZLyNssXpT5cKoXCTh3ZOH4FwdQTXDTIPrMLD20bICVCz8L7aGScliWeP9ub/7zgJqXMudtCtd
 NYYrJiPIq9sLUPediDkALiQzFozsMmAT7w4erisv2TJ18OiRZDgB3KxmNTHDq/o/+xzNoUiPkHX
 mduuJWeA59+Ex6w==
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



