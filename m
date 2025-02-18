Return-Path: <linux-kbuild+bounces-5816-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A24A39CC2
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2025 14:03:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E263B3AE881
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2025 13:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB24C267F4D;
	Tue, 18 Feb 2025 13:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XFX7qWlO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D98B267F4C;
	Tue, 18 Feb 2025 13:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883707; cv=none; b=TMAfGVPkWwzPCSTR1Uej9p6qkf+NNdp1CChPLarfzADxTB/IRMejazgAPrwxr5/NQ+lJtacdm/RjUiK3LN/9tbpMEz0pgPxL/GWSUmZKpVgclZ+9LzUuXW+ZqmsixIldmTQ5zZLjTcI8jOTUqOpiitp3ebWNBrInHsXQ+x0i2Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883707; c=relaxed/simple;
	bh=i8wDoobO6bpiZd26u4+7TLx2QrCQIwRboF1OHEy8KdY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O22Iq07kt3h1nhZTIshr8cnw6uqwR3IUCABIdKnRs5oCp+58KIEyYMg5lx45x7EOBlynxn6WXfaViNHwbUpdEqSJX5euVFtJmYqVEmhD81W7OYZMTU2vdh92VCKDJ8MPiS3+yNWraQZOioifGB2JU1JsdzKwE7jqrkdwe3I68w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XFX7qWlO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 292E2C4CEE8;
	Tue, 18 Feb 2025 13:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739883707;
	bh=i8wDoobO6bpiZd26u4+7TLx2QrCQIwRboF1OHEy8KdY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XFX7qWlO9SUhgdW7HQvoaB6iK2So0vYTIgDQgJigmZ4atQd8fb6YUkM/O+VYkCoxT
	 99imA0eFR3aLJ7MSKEwlGENFBHo5yCTm+AI3I4YJwG366dG2VE+qmQm5ojMZORU+gC
	 Tbu3ntTK+vJMC2G68mAhr2osdQ7jvs0XaCv/xy0GSsImf3K7W0tmFGsEFRs4F3CHwe
	 0P2+Dzry/7Te69G/W82cuLeGVyuSVQYsfS1/a6WqytcUh04CCzKRhW1extSTgbtSKQ
	 M54+LxM+DV0qhIwvI00jieyFNKh4c6OArERHykjfcIh5ae4wr87DFYqJ0JEhoS2CZ6
	 4XaDLDVnVdp3w==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Tue, 18 Feb 2025 14:00:46 +0100
Subject: [PATCH v7 4/6] rust: str: implement `strip_prefix` for `BStr`
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-module-params-v3-v7-4-5e1afabcac1b@kernel.org>
References: <20250218-module-params-v3-v7-0-5e1afabcac1b@kernel.org>
In-Reply-To: <20250218-module-params-v3-v7-0-5e1afabcac1b@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Luis Chamberlain <mcgrof@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Adam Bratschi-Kaye <ark.email@gmail.com>, linux-kbuild@vger.kernel.org, 
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Greg KH <gregkh@linuxfoundation.org>, linux-modules@vger.kernel.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1603; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=i8wDoobO6bpiZd26u4+7TLx2QrCQIwRboF1OHEy8KdY=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBntISGYFVJJPsX7afbpIBc/fwF692CI7LF5379D
 BeVodH8mNWJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ7SEhgAKCRDhuBo+eShj
 dwpjD/wO5E4AFgGZvg4pqp74C2eRjkj1DWNc72uyZ+T2yS5yAgyl9ZOchb1IACBZLwg7dtQvmCc
 gfH4v39sOzJzGGEY5Tfq2U9T5Jhziobh/tmqZw9x3rJcaG6GK/HSx4pHnGCvN7km58JxjFUDHBg
 XUNzh8AkiNejZlZv+HfcHunUClrF1b9CGxJfJbo/LhctHNf+fjO5eFOuEB9nvQV4gqO+rt9OrxO
 btfk0PP2yRZY1mgAAOt0DathpcbA2VKtImhEYxqjKo4R7coK+Q6tW6DHhxHX4naInpmopCylCey
 tVxd86SYh4OEQwXF2TV1bC3cQsm9wy273n/gwoSCMr/OiimCJcwXBiEUvLDeLvG/PbEZ8Xbm/mc
 UdwKb/gvQmaP1atypWFjq7I95uNXKVPt0xfUHCXOp5bhnWnn8n1UteJRYvG8eNSE2KFBHhR+kLE
 OW0aomSHQ8zDON8DsGYVWF3DjxLDq3DOvcN84qYWYzcrEwfpjdMwfQ5zzHw8Vqwt0ZW41zorraZ
 c7ZlYZpDwRoPezfDIMBCwJsv5QxMMQlDQ1dkgth5yVaVSpiraBrU2+gMrQLaCjjVre9uQ1csmJb
 DC5lWWs9EmF4eu9itqmEOEKr5DEgRsqsQ7vLiA/zEKUCPZyTLGShCUbPaubgs3aOOUnXE+ZPac5
 N3RPiD1pNP1nhpA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Implement `strip_prefix` for `BStr` by deferring to `slice::strip_prefix`
on the underlying `&[u8]`.

Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---

It is also possible to get this method by implementing
`core::slice::SlicePattern` for `BStr`. `SlicePattern` is unstable, so this
seems more reasonable.
---
 rust/kernel/str.rs | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index c6bd2c69543dc..db272d2198fcc 100644
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



