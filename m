Return-Path: <linux-kbuild+bounces-5408-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5BDA073DE
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Jan 2025 11:56:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A9431889B11
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Jan 2025 10:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98C362165FB;
	Thu,  9 Jan 2025 10:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T4qnPb6v"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693B02165F8;
	Thu,  9 Jan 2025 10:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736420177; cv=none; b=jJ/2EZCAZnu1uZChYafxptBlCHaCw3ibmA5f2hu/GMIqaASxAHOPwTvBqUeLttBClgNr4e+DQ8W5ypLsVaYC+G4oCuY61aaWG6xojQ7HZ1cack/eXJUDhc1Lbge2qO5NScFqRjqX9hJsi5rgJgLHtSHRRZK1zdJhClK12P9CT3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736420177; c=relaxed/simple;
	bh=W1dON2DXJk8wtFufY6Ee10/Ghnqv3HpHBRkp7n4UJys=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PQmexMnp9vRMY1LyH48vcSbqdaUGuXuXGPhQGMWKLhXC0r/3nef8Vd2IViwtfPSTd2ypW1ueYPryI5to6DhCohIDEwYqnZPW4t7ioMAT+984t9gEZNi3PgcqqVtauB2lxvsg2geP5Az+N6nxbw8ebaE/V9UAVbIXdenZASF2RFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T4qnPb6v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0550CC4CED2;
	Thu,  9 Jan 2025 10:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736420177;
	bh=W1dON2DXJk8wtFufY6Ee10/Ghnqv3HpHBRkp7n4UJys=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=T4qnPb6vB/g1dsmadqbnLZhAItE155FvmUe5rcVZhNVhj4Tw8q2S00nADb4yD0DOY
	 vDip/XWXBTT4M98afS6yccHYaR1bQTJlHkUaKnujJ2jCxKB12dC9leLXuwSau+joVT
	 GVLogd8OnxRKvn5qosmjAW0aqt6yUnGT6IMSq/QS1jB61ZIjhb0FQqJVTaDeet2bcv
	 SUNH5xbJIh1kTVxFAJ1tGSfgP/3pJ3eHuZYFt1dD07hPdUuk8X4KNERKshIlpmJLm3
	 0k3cEUzYHyiHM79xPrYoSTWbXo047sE8J3pA+LgBQBadNwVD3CfswQRXUjtVpY6eps
	 ojt1zlzC8cHDA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 09 Jan 2025 11:54:57 +0100
Subject: [PATCH v4 2/4] rust: str: implement `strip_prefix` for `BStr`
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-module-params-v3-v4-2-c208bcfbe11f@kernel.org>
References: <20250109-module-params-v3-v4-0-c208bcfbe11f@kernel.org>
In-Reply-To: <20250109-module-params-v3-v4-0-c208bcfbe11f@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1549; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=W1dON2DXJk8wtFufY6Ee10/Ghnqv3HpHBRkp7n4UJys=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnf6scMkN4yyIsQKfHYtE7Al2bfHy2wfNu9D8ai
 +9Xuiiwk0SJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ3+rHAAKCRDhuBo+eShj
 d6D5D/sGR3bbD9c3YL8rsKzAGrmOoApL8g450ceqj5RihPxAEICAWXQKJY82B4RxcmLMSVoIYue
 SYsgzGIP4Mb5llS5wE5vUj8Ljhfd4GYyVKshNgXua1Hb4cQnib8EEKRaNR18gFCAS7q6yYbpjKl
 W6X6X++BSNZKj1DPEogwBwSguRXyykWtGs94NxLAwQax5kInqfNrkbjWk2c8dl62GybHpdKyaiU
 iP3PUxhgJhzr4ZQYVERzjCbHOA5xU6kOoXgaqtymfZGEigZHgsVgMwFjG8iL0w8ZsITGtvb6fuK
 jQQlyOkJv37q0b2bZVL+8axUnDc4Z8lapm3Ziz+uBinsqC5W2j/zE5b2f8iQ6klW6nBGIlvhP1S
 4h0FslaOZvdAMFF06vbHeUmqepS6rJtVt9WgzRT09ethVrEX/hW2duf7O3EI1CU8JrT0Zkp/PiO
 mi7PKMXkzVtxgBgXhBxN8bsfVH1Q1QaPTOsBKbE3RpE9jtagCMAxEI4r+iToQyNQROqGl/LfCmE
 5kBKw5VDFREBXAIh/NG1yoyyRh2SzcAO1QLX6TitdfGPbe2jNOE2LV00DYrTldZjNiaM3ppvEqn
 pxwSUPPi7ossxIHh6YV1eNxbmyLbg5m6oObq5WwZNrNK2T6z/HTi646tvh+vocxr/lZCiRaBgbv
 fDlwfrlVHd6Jc+w==
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



