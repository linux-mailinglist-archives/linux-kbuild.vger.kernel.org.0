Return-Path: <linux-kbuild+bounces-8949-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04808B99E62
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Sep 2025 14:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CFC14C71EE
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Sep 2025 12:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D62304BDF;
	Wed, 24 Sep 2025 12:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PNXfbk7X"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4647304BC5;
	Wed, 24 Sep 2025 12:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758717656; cv=none; b=ky1i3k8FmqalmXcm5xYqZyf1MjYsD0ZHiCwLlQq1thlhMIPL+m4D0aTq+q+2gINYDjXJU/N1SLQHoc1m6F6d/318vtVjTm+ty/JuKyFZ7jl4NGgflhtosMM4+rUiv57WrlMJxs8PjKkOZcjNl6Q8+sGDEx80vOg1UdDe86Nm8ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758717656; c=relaxed/simple;
	bh=Pb8ap8QGaO6wH5qrd6PDiOf6/mTWyw1xHoJQ58CimIo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W2Liuv7IkXmYn37zlsj3d7khDmdc0I2fmPBgWDDzinc/CAm5/vg6KyDEYosdeOBK0IwrchRgmdOhsUnds9QGZkDb3iHNnqQTygzccv/J8VA/tMePxTs19ZGvtoeeBfIZ0ZrCtByRnnGoJbaWwtOz3H21mwLTmpGX+K7tJ3c0Nyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PNXfbk7X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 176D4C4CEF7;
	Wed, 24 Sep 2025 12:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758717653;
	bh=Pb8ap8QGaO6wH5qrd6PDiOf6/mTWyw1xHoJQ58CimIo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PNXfbk7XxgWHtthB5Go8gJcgX7hdHZQzqrvsrBvw/BkKNR1NTPj8cPhm+r23Ojz7g
	 5PShhw5ZNKEP7wXdeUPeUR+jzjJ1qNhZUkGcT+gKgj7hBqQRiEIWFEoDKtgF8gJSQa
	 sF8aebmYKrm9i+WiZOef+OSXHfLXy29bLQTn6YedS+lKW5JcKP6Z5YHdk561wJ6goD
	 quZtLicnur0PaaOlQ9oV5KHXk/WXYp7dbkjYfhVc14qL4frjZR0UqbX9zNz5i5ycTk
	 6ThWDu213xwDs4OfzN/kvus8k3EJAiQlOZJglgB6T2WuAIGJSVslCPjZ4ETaOm8mVe
	 LAMsO6p5E6qzQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 24 Sep 2025 14:39:27 +0200
Subject: [PATCH v18 4/7] rust: module: use a reference in
 macros::module::module
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-module-params-v3-v18-4-bf512c35d910@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1881; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=Pb8ap8QGaO6wH5qrd6PDiOf6/mTWyw1xHoJQ58CimIo=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBo0+ajvkInFRzIac1I/YET1HASfp2sVjEOtKmcs
 4gQI0Q1KfuJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaNPmowAKCRDhuBo+eShj
 dy5VEACv/PPyPlCuSJhbz4c+w4awb+FCGt2u72DDNduf9av+v/r3Mk3gsMZ59jEzZbCPzSylKPY
 5GJSMFn1DCfeKAv1W1hGF0yfX05mezZxCSpNSTnARjs1R3t5zcXevsz5J88KttI+TyZkL9j8Qw7
 gFT/7VQeKGvJji7bnEGqKdv8x6KEktp/DtBeU/pxncIWaGh9gPc/KN+K9ax3AkE93UxcUBCEKNN
 gkAvvxf1TWXtnCSADaaIYRsSfO9fMRhXiO4OSJ5qs9xQP7UEOPoE6VhOVfZxjVf011TdlkA3++1
 QKHpsE5yQXz2eIhvJ/N3uXP/gIYoQPoyNqYhuCVA4DmRRWU2jHF0Le1h+kxc4fuKS9fKxUs1QSE
 cOp7G9qyC3ivEF3+HHLB4ME0CJsrAYijdthm5guNyhRrJowM2FI5Xv6LTuMcoaqLAjbG8ijclsS
 u79wBUXOS2amCR6PL+pYpqWsn8l60dP9xUOI1fujWk9Ygnie5i2tSd8z19izoj5QheSWUWHsnVg
 omzd/0FUFR5Wm1LuXvACLo4DN8nWmduGD5knXaMXvfcnZKOWn0CRyu2q36DDCA8qFl0DG2oPhwp
 ogfa83V9r7LVmcA79jbFayJEKCoNEMye8C++vxE7fG3A5phxprEfFyZfvDPNasygpO4xrrRNcdB
 U+w94dMd38uaLqw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

When we add parameter support to the module macro, we want to be able to
pass a reference to `ModuleInfo` to a helper function. That is not possible
when we move out of the local `modinfo`. So change the function to access
the local via reference rather than value.

Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/macros/module.rs | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index 5ee54a00c0b65..cbf3ac0a8f7ba 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -176,23 +176,23 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
     // Rust does not allow hyphens in identifiers, use underscore instead.
     let ident = info.name.replace('-', "_");
     let mut modinfo = ModInfoBuilder::new(ident.as_ref());
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



