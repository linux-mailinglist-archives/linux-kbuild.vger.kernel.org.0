Return-Path: <linux-kbuild+bounces-5721-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B81AA31091
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2025 17:03:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B44D1885248
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2025 16:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 523CC257446;
	Tue, 11 Feb 2025 15:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KNcOrv+t"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2253F25744C;
	Tue, 11 Feb 2025 15:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739289558; cv=none; b=C3uqsBItli3dcuNgeG8AG+oeEt0TgIh53WOaNmvGegCrVQ4HcZYECJZ5xUq8Ejghyvs716DCDGGVFk6lZgD+AKiUXsCoXp++1BW2g2rB9VgNiXIilm1ubh3Kk0Ospwfni9gvD3dsdbJI5uj9LdZCP+0unAyahX5X9OiZhmsUjJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739289558; c=relaxed/simple;
	bh=lS6k9hPNj5ZHeaqOmPt5Xc0PPaJv+8aNNMGM3N8QSTo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I3zOm2Tmoi8ecCJ3LVGorqEEeDySSCnATV1wH19k2d19ItLsBG//dax/UVP0qUpMIGW1edcBdesTaliJr75PJxOeTI4aB5tH0CrYgeKTWCDe0Z3r1+ThYNeRzZL0vXuHaXmudQLCvhixa/mYVcWzfiCZ2v9mEa7TNvnZ54s2Sm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KNcOrv+t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 780D0C4CEE7;
	Tue, 11 Feb 2025 15:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739289557;
	bh=lS6k9hPNj5ZHeaqOmPt5Xc0PPaJv+8aNNMGM3N8QSTo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KNcOrv+t6uuIaD/2Twk9XMX21QMfyf3fQMETL+fuBn/uDQCteiYPxigJGilXDQ/41
	 +r1+sKQ4utNXBauhcRBu7O/6jJbmxNEubafSOKE3JWjrIgsPB8lru6hOZwqHNaIh3y
	 hfj0+D56drj7a8jumnkemX7R8+a68M0OgXNK4S12PWE5CDcFpgNT80H9ekmu8FCHHj
	 Go3OX2AIco6RPXdOHAA8MEdCzXfBx0M0g1JWQNkhwfEjbKE1CIIaPxwjzppe0i0KCS
	 4SJ7rRkkSayBXSSdzq8E5gufZ4LOkfYN4cVgnvdbw6APo+VxN4yn5Jb0V27X1Q4EEO
	 I8LQwg7wDFqzw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Tue, 11 Feb 2025 16:57:35 +0100
Subject: [PATCH v6 1/6] rust: str: implement `PartialEq` for `BStr`
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-module-params-v3-v6-1-24b297ddc43d@kernel.org>
References: <20250211-module-params-v3-v6-0-24b297ddc43d@kernel.org>
In-Reply-To: <20250211-module-params-v3-v6-0-24b297ddc43d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=795; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=lS6k9hPNj5ZHeaqOmPt5Xc0PPaJv+8aNNMGM3N8QSTo=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnq3NxpEdKrw7VKvsqeaNLYuaq6LndyZHC8+5+n
 pRRlmpKaz2JAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ6tzcQAKCRDhuBo+eShj
 dw+pEAC6/QVtAg4A3oBQ7z4Ku8vzlRNdoim0qKw//6tc+D8C3OBz2nSKfW0Il//zkukqBz91Z5I
 q7+qAwa2b4fFpuYZ88s0rfucUNmRNE+R2XxEv9r8wGF+aI1cUusSVNy3Ax40lhyWigYKJEC2lwu
 SDA0bBbHDiOIsLQV4EaRrCp5XlSHkjrlnHi7bxDhWOHm4WfywC/C+EOE4ktjrHqMKXohqA5g70I
 FipxpmuB2DDiY52b6D+es0f95S5n9PWcRxx4PGlEfvU3mex+QSNMCZ/lIDTzGyrCIOz2b9Ws7nh
 39fi4Xre1Qq4vZHQdT+r6RksFygoYovNpPqL9oI6CUheGrPi+a0rWwSSEClivOw76AVxZSfFwL+
 HhDDHJUDHSA53NM2nls9Xy0K98Rzerr7hL6gQMt1271aQO5VAOT/AV+gvi4wzBBRfY+h32TO0F4
 qO8DRRd5ks58PIgl7XNVWKWXY46zpvSGofVvqwOxg7oLRc/jnd6UaCQbnth1k2tkndk1vZ9Kdk9
 en6/m6iwuCdt+S0awo0F7xG6dTfAUQhQK7l0FB/hWeUJDMs8frlVJB1KBgISs+663aJvlDLH0Fc
 6kVaL/iD78+pIZe/UQXOq320KB10GW2yGxK81KEd4Y+1oKwQyBdRb0xP4v0qXJw/kGEZrTyij6p
 YzM4u95IGZs3H3A==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Implement `PartialEq` for `BStr` by comparing underlying byte slices.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/str.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 28e2201604d67..002dcddf7c768 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -108,6 +108,12 @@ fn deref(&self) -> &Self::Target {
     }
 }
 
+impl PartialEq for BStr {
+    fn eq(&self, other: &Self) -> bool {
+        self.deref().eq(other.deref())
+    }
+}
+
 /// Creates a new [`BStr`] from a string literal.
 ///
 /// `b_str!` converts the supplied string literal to byte string, so non-ASCII

-- 
2.47.0



