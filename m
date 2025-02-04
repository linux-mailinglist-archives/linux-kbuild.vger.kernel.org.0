Return-Path: <linux-kbuild+bounces-5623-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFDCA27117
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Feb 2025 13:08:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B499F1887938
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Feb 2025 12:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35456212FB7;
	Tue,  4 Feb 2025 12:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f7u/zWKT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0247A212FAD;
	Tue,  4 Feb 2025 12:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738670712; cv=none; b=Px0eI83m0VzqLtbFTXmmEgZqU7LLCUPQZ1Qrl/zCypKUJ4m3UEu4EA7ajtQ3RPo9KvYBScsbQqjRIlqzKXC0dSnVKn/sv1bztud9C+byBC1E4QUj/E024gXjxRGUwnnwbQcJxFE26FJVk8lRgTL48x9eD85tfa2qTkCdFYvegrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738670712; c=relaxed/simple;
	bh=Uy+G3QIpmMlPaJnwyniXgpOszKcDbT4GdwTwy3kc5ko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qQPgZbnvsGEQ/gA+pNHdYsXg/z17ncCEkgQz1xAnX0C6VfKORdjZTgoCqUbxKlyONfHtBiCAglpvK1MCS1U7BB2MWI+osCNaiv42EOD3Ju/I6UhHqPANn0+8q9i3/ih7Oc1Punlr6Tx+TgeUuhY+NGnOggbQN8LKz0vXsknnki4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f7u/zWKT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85853C4CEE2;
	Tue,  4 Feb 2025 12:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738670711;
	bh=Uy+G3QIpmMlPaJnwyniXgpOszKcDbT4GdwTwy3kc5ko=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f7u/zWKTv2wYsO4h4cbZ/BM8fffCwISDxHkPkYIBgh+wVbprp6Te1RBOlTB4QW/CK
	 vuSV2Tv2d6B8dvd6k2MuO4nyv/gkqxROBKSijthHc0raFV0ckxBatrVxShWIgwjZuz
	 g0Yq/srMyodBAJrjlrbSB/t6bK7Y0AlyRgDk6vh1hQqcV7an4ydVHfcqSiAw95lDOt
	 TJ/hxVLbbGJyWyNKHtDrQkx9EVsxcAWyIsAzezXE7yCwyW3AToFUJfLO82Gy2ZTMIe
	 57B23iPv2zpWT+sJHYFti7w6KoF92xY2HlNH4CNHup01OhuZ0KLGIsLNWruGVVKO3m
	 YDzHExQMyLkbg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Tue, 04 Feb 2025 13:02:10 +0100
Subject: [PATCH v5 3/5] rust: str: implement `strip_prefix` for `BStr`
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-module-params-v3-v5-3-bf5ec2041625@kernel.org>
References: <20250204-module-params-v3-v5-0-bf5ec2041625@kernel.org>
In-Reply-To: <20250204-module-params-v3-v5-0-bf5ec2041625@kernel.org>
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
 Greg KH <gregkh@linuxfoundation.org>, linux-modules@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1637; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=Uy+G3QIpmMlPaJnwyniXgpOszKcDbT4GdwTwy3kc5ko=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnogHYEzdjU6TcJv+L0vohcUEnACY4iii9YnslJ
 UsmC0XNsT2JAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ6IB2AAKCRDhuBo+eShj
 dyUtEAC3NcHKUIuleDVPDoaDJl+J67nBVY5Z+jHNrCUCI4If+fOoreP/q9nXtbFP3EQF6rcujmG
 Y7zId8rOb8JLQBqFn6ga4H79ESsxMYh26+Itvnk/FQh2PvcxKTDItCO/nnrBSo5CCncepLvK2dS
 ahxJgmqjwcTF4Bn5pHCbF+2/nIVJppAJ7XJgEchIMJUp+VCI12C3CF3n/jnNAY6lwYyMhoP4gbT
 ZyrmVL/rox3jGO0DkVcDw8wCeyAQAWQx7ZGEJVQ+FuYRflvWyjOAUcYBBvnBP1pwuVqccW5ksig
 CPuFU2lNbyDSpzwolAZzEnKBOawShLX9cL6/gt++8ITEavRs3OJS9NOeRA0pSANV7it00yClThQ
 fVkEucMRD8m9YCoT9T3Mb32LVQuqrnBdPTf1J1WHuRPoOwTitck+yF/fcfLFNTBfHqu1JCXzrRQ
 1WZnHMmoePu1isAheRhs50tfWAsriv8pyxtWFgBEObtEuJEZuc6BHSOwQT0dEbuMY/iiwvwov29
 udn/q9ZSxPXL78ou6g+z+2IIW3ryPJogBqn2Q4hYOGxvIMjgcfnU6cH6WlpSyLkydjlG9mPm+Ux
 TY9LK11qIkqraPMDus5SHezGzPwgr12iRRNOzoqELcKDkw6Z51+T2ooKOmgz0TNagPm6gaM9MUw
 9WY/RW/2KT8cEEw==
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
index 1eb945bed77d6592216cf30678fcca70d4c0b3b3..80601206961e5b2d682af5f7028434bba1604272 100644
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
+    pub fn strip_prefix(&self, pattern: &Self) -> Option<&BStr> {
+        self.deref()
+            .strip_prefix(pattern.deref())
+            .map(Self::from_bytes)
+    }
 }
 
 impl fmt::Display for BStr {

-- 
2.47.0



