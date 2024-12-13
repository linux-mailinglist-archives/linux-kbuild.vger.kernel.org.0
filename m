Return-Path: <linux-kbuild+bounces-5111-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B609F0B4C
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 12:35:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B95DC168564
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 11:35:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833801DF724;
	Fri, 13 Dec 2024 11:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYgRU3jZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46683175AB;
	Fri, 13 Dec 2024 11:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734089620; cv=none; b=XzPH426bSeW+skDLftDxMNJysbLkTVXGEAximO/y/lISh4/8NfUNwqdF1NwjqecBunn8bK6149TOfCSZ+FfHtgGTRM7DAMgW7fFtrtn3rr2kTKJwEI29VrCWYw4qY7VgWVlHauF0BAHCUqIMHzZbR6+KNjA+orc4xNWoOEmt1Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734089620; c=relaxed/simple;
	bh=W1dON2DXJk8wtFufY6Ee10/Ghnqv3HpHBRkp7n4UJys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m8PtHgMhf2ybcLsniQ+GaqonyBrCJam4uZuM0/mEDwZ75tk4D5BHKzMHP1DM3UVfwQtRaxe6vS61f15HhiawzbtvgFE5TedMkf4j4zUAXUnyF/qPdmO2stLO7fJbfu/6xo8KUkiMlkqzec6bP/8Vtv00EAVLt5S9IWUe5ZTXbsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYgRU3jZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F720C4CED0;
	Fri, 13 Dec 2024 11:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734089620;
	bh=W1dON2DXJk8wtFufY6Ee10/Ghnqv3HpHBRkp7n4UJys=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gYgRU3jZJ7TWQ48ScFxUDqYu44sr4/grgzSwhgqCch4qL61kKeFAyQXpixr7Nrgn4
	 SC/p3YQkCPGUx/rIsWG7FvcRWMoVPuYOnHJFlxtOIztU/W+ZJlnAYeP/9Y66xgK+ZQ
	 5i1udD+TBhOsZbThgSn+aPkz8B2fTpHtnnDCUrDJu285v3xWm3UuEiebf8MMXc3kWJ
	 X4LVz2NKeIwzixSzMcZ3p+jQzHp/1uvgjp3oP3BSnvRzOC5vX8LPjAmzvXbOQPGufG
	 0w5Q/9TR591XpMLlKMoadu8ufn3ynjBvYIMBBCFYwYOgMZgYwEO30CZL2w3L6YZOp0
	 lp+l6yRYKNGqA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 13 Dec 2024 12:30:47 +0100
Subject: [PATCH v3 2/4] rust: str: implement `strip_prefix` for `BStr`
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-module-params-v3-v3-2-485a015ac2cf@kernel.org>
References: <20241213-module-params-v3-v3-0-485a015ac2cf@kernel.org>
In-Reply-To: <20241213-module-params-v3-v3-0-485a015ac2cf@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: Trevor Gross <tmgross@umich.edu>, 
 Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1549; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=W1dON2DXJk8wtFufY6Ee10/Ghnqv3HpHBRkp7n4UJys=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnXBr3TBAVUizS1xdUCu+XmO2/txTPKNdgAyR9X
 z1A8hN9gbSJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ1wa9wAKCRDhuBo+eShj
 d4DFD/9QrT+VmKDUDncGxWzfaL0kcWBVEtqigswAs1ctsX2CZE1no8K6jiFd/BrjL7vj55NRHz9
 fDQ7CQyYwNllhIMgvzTLVa1JoQjK2vgc1dEkqRdokr7tMz8AyDb7W0h5i2oeiOTUuq52IMdlcpq
 CNKBlpJRd3JlOPXrp/j73G55rqcF+WJYAZrSPW6vjenX2cDgCPPr1ItFAgejIB9Gx9AjQKUF51S
 ugsTcKHniOvT7kt8zYBiZuYokK7eUSM1zvqgUsWmsLTtzr71tzp2ZlIQsmaMoKUArqH1fcLIbzK
 C1AGlnfVrA/v6rNuovHe98xBY79Hl+qYXkQ+/mq053DGxMfKBGAtZS829XS2mbSnVZi6kIz10as
 NFXirS+gjM8eGf06toqQIQZMhOpQVdEeccg/5QgUDARAYD3046Nwv0/A20rJ/AYACw/J6+o8kFA
 6xfdC2koARakfGvGLv3Eo0ARqtQpCDmi/nvBGpVw4caRq9PP1AgqINgUqpF2uVpCInHjrcPRjis
 yS9hqxg7RZoa5o5DE28yVcxMhtOd/zwZ9jqYUv52+SstFQgbuiuf28/me3ylRkjQFcdq1FAk6NP
 JBn8LPQgDv1iFk2jOJCysmSPeNcNteGBH0Tlti1mV3g67Xi46tYkoRRb63LkLxSY8cXrVHCnuNG
 l1/btl9t+IeBO9g==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Implement `strip_prefix` for `BStr` by deferring to `slice::strip_prefix`
on the underlying `&[u8]`.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

---

It is also possible to get this method by implementing
`core::slice::SlicePattern` for `BStr`. `SlicePattern` is unstable, so this
seems more reasonable.
---
 rust/kernel/str.rs | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index c441acf76ebd1f14919b6d233edffbbbbf944619..9c446ff1ad7adba7ca09a5ae9df00fd369a32899 100644
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



