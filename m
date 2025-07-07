Return-Path: <linux-kbuild+bounces-7903-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E88AFB4AA
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jul 2025 15:34:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4AC8172F91
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Jul 2025 13:33:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C160E2BE043;
	Mon,  7 Jul 2025 13:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l1M1QsEl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D212BE040;
	Mon,  7 Jul 2025 13:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751895144; cv=none; b=JSfSXuoOGoMBvA1lcrxbNMZNrKpaP1lwrefnyU4aC+o7CwTuQIhHofXYK2rDK9WLvHsmYaD6NKVv0soX/PSEruhYw1s7UuQWUBXfWa1BfCe//eOj+Fb0KiPJ9+9o8tqktp1BRTE4Gt9svuIxkDmQRrYTe+NnLGA9JFGKt/KPIV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751895144; c=relaxed/simple;
	bh=K4Z3grvB4L1O4ywtrXjL9L/tEi3YiQY6qMjemNcyFag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZXacgac4hMnPLjFnKfT7VVYMuy30HgOm+sFHPopXwZ9Sh6fJUPvqFZeQIt3Hx+xSCQB2bGEFffvqI8XVnoGad6LCCcV2jDbaAsHhLHMcZF8PU/t3ntdkNzP1ALkSLiSvsqLyCN05JnsDkI3j4aWYTI05jzP56t1/eZVDEHudE1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l1M1QsEl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5628EC4CEF4;
	Mon,  7 Jul 2025 13:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751895144;
	bh=K4Z3grvB4L1O4ywtrXjL9L/tEi3YiQY6qMjemNcyFag=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l1M1QsElj1rPW6jMlIh3sGwhN5SxBfnnyGzuewvpLIjivXNpOL4QRl2XRlhP8jBF5
	 cwCRONh7u7fTN4cwVDejoJBSvLVJpxPUOfcGnFpWHd6Gl406Kf6Oyg3m2JulXRsvvU
	 Rftohr/HsZ4KKDk2Rc9QtgPTvUOmBehAcTPUR6zJ3sFTilp9amSr20/FcaPF+F/3o0
	 eIjQjGvaVbhB3T/nwd1Tdiupt4w11CVXKbpbwZuC+ImhFObCua1GASo3yj9osksBdN
	 AFDvP1w7eowJf4iXGvXtY9WZyCo6p8SUpDPeVqZDwAPZWlrKMqC0oEUnbanQA7L6RB
	 /HGdvCyfSDtJQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Mon, 07 Jul 2025 15:29:08 +0200
Subject: [PATCH v15 4/7] rust: module: use a reference in
 macros::module::module
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-module-params-v3-v15-4-c1f4269a57b9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2065; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=K4Z3grvB4L1O4ywtrXjL9L/tEi3YiQY6qMjemNcyFag=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoa8u26QT6k4TYweeunaG0ffSARQJFEd+K26YXc
 DtehNvVllyJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaGvLtgAKCRDhuBo+eShj
 d2ZZD/9MjlHI0Kidi/nqGDLQpApOrjM30pa9+dUCYMTpbNmdJgjxYrOJMeALAdh7+QMD76V+OrS
 eDjQ3BvavJBBgLTa30pM/P1hgM2dzJFhNa2Li92mRLoaB1HMJ5rbyFnf7IJSqMs1lfZmGcDpURk
 zJHhW3Y7mxPmvRM8M50Ohffz9jR721uAZnJYRQjeDomaUw9FlwFuG2BKfHPRmfTaxi7Dq7StvUv
 3y46oGGsyoc5/WnkoJFSfGpNppSRYekN8GQZK+0rh6pPyC8A5KbT0LGdtmtvOMraSgJvw5BGKPf
 +Rj1zxlZj13NWBF9dPALjgcJfn04tfyPqEkmQSOJEtqrK/AcjyGakfTuWStV1vF+ZJxnTGP8NKi
 LrB/y63JluNKtksIKJgQQ0Wt/D1FcgEr+yMOXJn8C8lV4rfjO9k0YdTuQSsHZ1RSFT9XU6kK8H4
 V0NtDqX1DeIxhpw1GH2Ok1uEqENqTxZVLuIq4ijXs7KkMGoI1ehfMWoALvYU+vbI1d2kbmT/eT0
 2GZy27QxpxKZjI70mPlLATpDeJzKO6WV8sOFbTQxhumAEAJTH/e4Elw8ri0q/v4MhiPpQQUd+6M
 fdUKrCT60mMXK6OS8XoV5/Dn4ibxNaffpO7kB9NlzwtqtQza21UTG9FnkqliPITW68ShvxEb0gD
 WkXFsdWSxJjrO5A==
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



