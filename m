Return-Path: <linux-kbuild+bounces-5928-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4483DA481C2
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Feb 2025 15:43:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB8A13A5FAA
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Feb 2025 14:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AAE8238D5A;
	Thu, 27 Feb 2025 14:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W8Qa5Wd2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2D3238D34;
	Thu, 27 Feb 2025 14:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740667194; cv=none; b=gyfqWNRGaeLA2Ri//WD0r/Rh5yy1XpzuWsrb9cYSOMYDBbCzjTnkf+xuzVo/X5PrLnIVbJUvYbd6HDmRg2IdRoDGTMcZ+p/2C2fkUfE13FurYCmcp/sxGE1ac/ULAsJywKWf4jbFITFhJCf4v+njTHtdYqRwSTemvrnqgz9jwoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740667194; c=relaxed/simple;
	bh=K318bV0GaEBm1LLBOaM7D6mMUZFcC9BNiYbR/qpbYnw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a2mmP6u0l2KK/0fdww5y4Kqkh5k7PQzfwHh4Y1iQq/ybHhGTXlZ5OhsTYjKgDLyvtSbvyD7J3gNIihYsBx7oBBvKkYZq1/Ax3hlq8HXmYQTFZh0rt/Y0gZFDzmPU7rG4z82UyVWL4OdVLwUvocW7iaemHuZCKK8Q8FKCH98QwNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W8Qa5Wd2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DA55C4CEDD;
	Thu, 27 Feb 2025 14:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740667193;
	bh=K318bV0GaEBm1LLBOaM7D6mMUZFcC9BNiYbR/qpbYnw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=W8Qa5Wd2dvUlpzK3EzbqyGoeIYK0Wu/gk9f2fs1FwZYmbJPnY1ST66O0fKK38lJVw
	 mo9aNWKASJy9NX/Db0nJD6vXYKZFsWnMSipjPAl8VUJ7lKcAJkUgYCTjnMbv61pWJQ
	 GAVfk6XlWk2FsIBIM/UkUWCcAr0ABvgI0Vk03ZRyRMTnQXtz8Hs/1isDlPf4kxUooG
	 +R8Sde37o/WGLqywkgRuwvcrxo4DtzVwybr9DRIAncNMKfAvsdardMtYCLy8jZR0Ur
	 nudSb5e0uxG1uZqQHI02U34elc8kzCvpE6583kva8v6lnO6nloUuMZBzK+a2RDmNpX
	 oIvP8GldpoDfw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 27 Feb 2025 15:38:10 +0100
Subject: [PATCH v8 4/7] rust: str: implement `strip_prefix` for `BStr`
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-module-params-v3-v8-4-ceeee85d9347@kernel.org>
References: <20250227-module-params-v3-v8-0-ceeee85d9347@kernel.org>
In-Reply-To: <20250227-module-params-v3-v8-0-ceeee85d9347@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Luis Chamberlain <mcgrof@kernel.org>
Cc: Trevor Gross <tmgross@umich.edu>, 
 Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 linux-modules@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1719; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=K318bV0GaEBm1LLBOaM7D6mMUZFcC9BNiYbR/qpbYnw=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnwHjTVMvjPqeTRD5th5GEu03/Xwxi8SJ2/Zi0r
 wVlKT5/bK+JAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ8B40wAKCRDhuBo+eShj
 dwJAEACx/RHG4m20bbfs0jUSPCZ7+sbyD47sY3x7apz9kc//edLA7IkDUEltGLb7TWh9yCG7KA8
 BgHt+MdnLDJOGgwDAaUwE1XDh1p0lygvUaJDmygfQGsvLuhK+uyCOjQdPgY74ozjUsQweBhgnIL
 H+mekQ+0w21YdItK+EZvOJhkwhSWdq2D8rJpvR7C0/K5k1cS61aBmJuocaog3SZUZlHOobLVtLD
 GQUhw95rLOEOmejVzONC80GDqa4uLN0FuGUd1S2OLDDQkfVb24s+/9387QwE6PxzafJ/i+3xBRl
 k29iGWekEe5E9hqBJv9twO6J444wwE7xGdVEYvjK+ctUFg2qd274BUeBHpi2BQyW+VIXuBhyRzj
 tM6tXTIkddZ0+Xjr1QSGGRHfgO3u0LhsP9zjwi9Tk+1OGYYhKbg1UrRNTYNRri9s8LNjlJWbc/f
 cLxyrBUgNXKJwW1gyepiDY4lf5gyts4QKw/S1r/0lnrmNzjDLqd8hb5yE3JSe6PIses8udO+Nw9
 MLTDQRUQh//zP/v3IHEHNE15u8yu3r8wvll9JVk2eWvw4ufDSVvqHyySUyCs1cFNOQ45VlvSC7B
 8agJPgR/Or3KtoxhU2SIk0nRm9D4Zfjq4xBYg3NFs6GDYiCXXZ/SHn62hM2O5KuvdFmvfC3nRW4
 HUrGvsfrKxxPc2A==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Implement `strip_prefix` for `BStr` by deferring to `slice::strip_prefix`
on the underlying `&[u8]`.

Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---

It is also possible to get this method by implementing
`core::slice::SlicePattern` for `BStr`. `SlicePattern` is unstable, so this
seems more reasonable.
---
 rust/kernel/str.rs | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index c6bd2c69543d..db272d2198fc 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -31,6 +31,22 @@ pub const fn from_bytes(bytes: &[u8]) -> &Self {
         // SAFETY: `BStr` is transparent to `[u8]`.
         unsafe { &*(bytes as *const [u8] as *const BStr) }
     }
+
+    /// Strip a prefix from `self`. Delegates to [`slice::strip_prefix`].
+    ///
+    /// # Example
+    /// ```
+    /// use kernel::b_str;
+    /// assert_eq!(Some(b_str!("bar")), b_str!("foobar").strip_prefix(b_str!("foo")));
+    /// assert_eq!(None, b_str!("foobar").strip_prefix(b_str!("bar")));
+    /// assert_eq!(Some(b_str!("foobar")), b_str!("foobar").strip_prefix(b_str!("")));
+    /// assert_eq!(Some(b_str!("")), b_str!("foobar").strip_prefix(b_str!("foobar")));
+    /// ```
+    pub fn strip_prefix(&self, pattern: impl AsRef<Self>) -> Option<&BStr> {
+        self.deref()
+            .strip_prefix(pattern.as_ref().deref())
+            .map(Self::from_bytes)
+    }
 }
 
 impl fmt::Display for BStr {

-- 
2.47.0



