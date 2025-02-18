Return-Path: <linux-kbuild+bounces-5818-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F24A8A39CD1
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2025 14:05:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 968F4165506
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2025 13:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AF082673A9;
	Tue, 18 Feb 2025 13:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GlY7DYCE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E058C267384;
	Tue, 18 Feb 2025 13:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883720; cv=none; b=GdjXfJnutD5JklMOojjRUoQBGtYr7i3wB94GRk7RlfzjQMniTOK+tPBtOdbTY9bDJQxgznp3mHRvfQxSzpXkBL3+GXqMDzFf4kcuE/G1BKjdUBbrr9M05r9ul4bTI+IOs/QuRoDhquIBmv3gxto+QjQuhe0fw7uJpFRPwtpey7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883720; c=relaxed/simple;
	bh=lS6k9hPNj5ZHeaqOmPt5Xc0PPaJv+8aNNMGM3N8QSTo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uC3zbTFdWr3zKrbRUJ0AH2vddn59oCJxf9M031MPnColRI8VzdHry8f/jLjLwqedfO6F3cn4oICzUMNCiq8xiDdGhTGY5yRffcO3ZFJRRQK2X4f5AqeCsMdKioIGXBI6KJAcm5Dkd7frxvjGfOUyFRaxp7z1lt9JLiYC50QjIuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GlY7DYCE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6ABAC4CEE9;
	Tue, 18 Feb 2025 13:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739883719;
	bh=lS6k9hPNj5ZHeaqOmPt5Xc0PPaJv+8aNNMGM3N8QSTo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GlY7DYCElFeSE1cGN+qJy3aHo2lXVcV3vYt9isJq5UYFfMBOiwU5o1OXDyB1N3IaJ
	 ujCrmOZEACDWmi3FfdgJBpfJWxk/gJRR+z7pJ9PoevcMSLTTWQpoJr2wqE0hmXoXok
	 jNCo2XaQkJ1rOfagFkWXU91jqnva/nX9o4/dzKb0iiW7qsllbLjt8+LZbh0Wu1ny42
	 jRPo+WO/cyeBk998BJuR39efH0xc3/J8dXZGfnXRcNdF4mlwbfsiFcioqqDmcUMIJY
	 rOQ7bmuFpHAAi+8K7TQ0OdN2Ua2PDepeayW2FOBGl2YMunv/w6k1PW09iLPPiiIP95
	 MF20q7+v0iGMw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Tue, 18 Feb 2025 14:00:43 +0100
Subject: [PATCH v7 1/6] rust: str: implement `PartialEq` for `BStr`
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-module-params-v3-v7-1-5e1afabcac1b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=795; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=lS6k9hPNj5ZHeaqOmPt5Xc0PPaJv+8aNNMGM3N8QSTo=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBntISDe/g9sj0qtbt2WFCID4SSMJX3DYZyfuuUT
 QXZjQuPOWuJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ7SEgwAKCRDhuBo+eShj
 d2XPD/93ewjgG8o4eD29rjq3tsl1YoF8jH9rHpZbfe05bazj9tds5lmeyJ6Bx0JvpxG3fNNg7Bj
 7hdIZXOxLtU+WOVZOlVwBMu55xyITFaGmpbLdsUSNJR3ddVXElRCCaRQxVYfUDwW7TTVAa/w9Mm
 BzxU4cW/+bEUe9ASbVsjLdomSufSpE6VC1kWAjfTooCNhoSnUUEZtYmFtksMUQM0KDFi861Pw+S
 LmIBgzSYJ1Q0RGNzHi11cf3qY7uOfK1pdYLlG5C6DJG5B1E53rV2JoBjRVJto3C3SN16SYg2AW3
 SkSvBHhvnbk0Ri4PRFNUeiJ3U6E7oxnQwfTSrr63cVgJXEY6L1W0cf0UQwKdY+cVtRUgc79Opwz
 3vcS3NApeTkWd9OBvn1fDbO6ATBiHZlYllYK2eSJgx9UKjFa4gjnWQs8tMmUcmOV17qsy71cvZI
 01PpGc9Egw5whajMUyzRrFf19bsUrlH1zS4pW8yrXxJ3ZzqRQuWczTl3nWqeJdRdr34Yldjg6Ih
 NCRB/LIrHT/cAKnPD0wQhAgqlImLD0p+aOe5bhuwumldbVG5v9js5+w213C4tidw9IRyGDEfGjp
 mWAOkWW8zUa89pOpXPXSUvwSXbrpsJwCSCf8paYbS5fAGiNDP9PuimTG7OCIp9+ViZmRVK7w7Aj
 bvPCObLyp8Q5dig==
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



