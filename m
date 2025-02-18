Return-Path: <linux-kbuild+bounces-5819-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD2BA39CBF
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2025 14:03:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D7A17A05AF
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2025 13:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B08C269AE2;
	Tue, 18 Feb 2025 13:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D5Ie2UPL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEC2267384;
	Tue, 18 Feb 2025 13:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883725; cv=none; b=p5iUbll8NK77+v01K0tUme3SNSmbJ2+Yf41LLESx5C0d7AnZFHPdR4a1M8E0zfR6T1pNO0dsNZLAG7wJAPzqRg1UN8+UgSsdbyNoMbCthPX8GdoU6shM8w3a3eT9ukyoEEILr0Om+QkR/EY91+2neGbJhQPEwyv6MStGM7826aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883725; c=relaxed/simple;
	bh=kvGbpK9kXJddOYZoiGF2djCA1EY8EEWP9GNQBrdAngE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bFGNIShWNqiBA0YfsOYhCs8euA07MO8w3gwxq1AUS6o/1f3KRhC4+JEAi35ylQOrNxpYh/Xm5snIpFQjDU4kAPITMLxC+q2JXygSfnc7BHqeQIzABX02NNCd3Ko2yMA5DSUMne375DzgCWDv9H6IQl5VE8ox2pY+zxz8clCNwS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D5Ie2UPL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A968C4CEE2;
	Tue, 18 Feb 2025 13:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739883725;
	bh=kvGbpK9kXJddOYZoiGF2djCA1EY8EEWP9GNQBrdAngE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=D5Ie2UPLiPm48/it8g6AvmzcXhTWyR8yEwmD/nAM6fyxJvxdkKUrn8XOSOu+2Bb25
	 oxBA3b+SXz/5ZwvOmsH8k/ahIX0BPQ7sm69fDVnE1eyVoxMx2XIfVFyDxsXcmJl28f
	 KaydLtAJan2g8LOOg3OCViaEZNw9U6Q1op8GF1sLNYBt7gFeFXpJHs+yjN26HyIR/z
	 OzVPNnugcfcTGFqFFd4ZxkVuaCrrLzVKr49ILbq6DeHm5+lecKFsYXtWY3IB4V4KF7
	 kF3phVtiJhlF94m17q469/VlZ2/hhE0HGwito842HH/jfWhkwVsOCwB1jSdwBi6IUY
	 ecGOqy5ICTRUA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Tue, 18 Feb 2025 14:00:45 +0100
Subject: [PATCH v7 3/6] rust: str: implement `AsRef<BStr>` for `[u8]` and
 `BStr`
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-module-params-v3-v7-3-5e1afabcac1b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=844; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=kvGbpK9kXJddOYZoiGF2djCA1EY8EEWP9GNQBrdAngE=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBntISFZJsHCDQ/fYrSsdwC6D0joyKK16I5hZxcv
 1WrTIW05g2JAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ7SEhQAKCRDhuBo+eShj
 d9LlD/9AXD7x+fgK0eDF7+5eqzztOc9cyUmJRsa9caJUaZMK20kNv9/Wu8gi72DfGynreTyx1Am
 M+PywlvqQmQmf5njTmNkD0zRuDyCH/vJYmPKdHoe8Qt5CLVc0eKfLwQC0/A34I5l3GQB9YknLxt
 T7Psf5O5u/mNbckCCLOv8JAjzXBRQL9XV0pZsXBKG9IHaen/bk93lREws+biXEh2Y2RTJ8VEteF
 ZjxncX+FoFH5btwW1Viu/LrFYfOs/ufFvHhyHX4umcf0CH5cLqWsOoqzEWNtnqLk8StgT2cTwG0
 B3HSXpmfNfy19yK3PFnvbmlMeFIO2pYcgqZ72n0IksJwiJJXLyOmz6/8sDqHYskpCoIx0flB1Wa
 Oe1owSXt2JotwiKJqnU3Ta3CX9zWTo5IgyRhlId8i5bT3rIwbv18vWPixwn13S6GvhPoec0VM1g
 iIvJ6xAOBipHc7vytgV/D0fNQ+6Mkzumseoq4uLYmZXMboAAyxai/QKf5zZExQh4453ie/tHViV
 eKB9m2dIIgkJ9t/1JXq1B0VVVtdcpnGqcOAzLGynE8HCMWcxLtHHZQce/SXWFDdObg2oLO7EVEN
 GLqrVTLoo5HUu23PDTZelJ0ZBO+BJoWLUIqT89n80pnJjmu9wxixM/IuO4Hdtiq32vZaKmBokZ4
 sLbGNo0ugaCCgCw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Implement `AsRef<BStr>` for `[u8]` and `BStr` so these can be used
interchangeably for operations on `BStr`.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/str.rs | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index ba6b1a5c4f99d..c6bd2c69543dc 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -125,6 +125,18 @@ fn index(&self, index: Idx) -> &Self::Output {
     }
 }
 
+impl AsRef<BStr> for [u8] {
+    fn as_ref(&self) -> &BStr {
+        BStr::from_bytes(self)
+    }
+}
+
+impl AsRef<BStr> for BStr {
+    fn as_ref(&self) -> &BStr {
+        self
+    }
+}
+
 /// Creates a new [`BStr`] from a string literal.
 ///
 /// `b_str!` converts the supplied string literal to byte string, so non-ASCII

-- 
2.47.0



