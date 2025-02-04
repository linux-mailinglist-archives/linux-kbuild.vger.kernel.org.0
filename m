Return-Path: <linux-kbuild+bounces-5619-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 813B7A270FB
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Feb 2025 13:06:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B59191886EF6
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Feb 2025 12:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6796B211A26;
	Tue,  4 Feb 2025 12:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z6pao0g4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3499920D4FC;
	Tue,  4 Feb 2025 12:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738670689; cv=none; b=FZFsqZKZOi+zuY0COWsX7F7OC1QLj8JQ09Do+XmYwTuB/7kJPsxgHEXbA3SiGUUWq/IzLUz90TqDP86FSPD0Dsdyd5SheB3AKDxtvumTScdCgkC4oYUsZX6UIUSDBgnWGHYKFDIE/cbuEpTRW5523NCqOCSUbUXG+hNxbkYmiqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738670689; c=relaxed/simple;
	bh=9vPDXVCZikkxMhidQOZWaazwuq2iUI09NMwF0gUW9wg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C2599r7yKr1a7PFIW6BplcNGf650hNrUFc0XVUYVF+VWkKZtpshmpIoHocxjfSSFWkhYsKVv0O+aQNjsuEplr63z/umTlO1FeLbxwtAT91T3gIz/lUOH5naZeLv4TMMbNN6puRJ9jxnIegtg/iPW1L7gQUXiHvxVwo+LnSRrkjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z6pao0g4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 310EEC4CEE2;
	Tue,  4 Feb 2025 12:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738670688;
	bh=9vPDXVCZikkxMhidQOZWaazwuq2iUI09NMwF0gUW9wg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z6pao0g4daPzRa6LJBDNuC7MDm1Th2cwvfOc1o6NClkaA1oD/nkZ4dNMtNFnWguXx
	 s9Utn79EwmG6fXmz7ZsbZYjCwOiRooCzHNYz6hSX8mWUA/KvsE2SO2WNsS3lzDH2EO
	 TiOciZuzgbvFTLJgO/iCOlDaANnJSMjwOqy3YixP5K4i7gKmhul+86y6nEPRrY2y4h
	 //WhYDY8USbuzbWhTRo7q6WxPWi++b4ZB+zqZuhlEi/kdOzBCB9EJWRoTbLSI8h6an
	 pWOSFiOfcgfLXfqDxpI5vR4TiAWSbe9wrgYUQooqjrmElNUlqLqNDZwuziwmIHyT5R
	 nCf3jveALtZqA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Tue, 04 Feb 2025 13:02:09 +0100
Subject: [PATCH v5 2/5] rust: str: implement `Index` for `BStr`
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-module-params-v3-v5-2-bf5ec2041625@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=9vPDXVCZikkxMhidQOZWaazwuq2iUI09NMwF0gUW9wg=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnogHYtdTSaVz/dqlQ5RrubPDCr5mbmsMF4q4ti
 GgEmSdim+aJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ6IB2AAKCRDhuBo+eShj
 d0y+EACFCOFREKetB1YvSS7kZ4bSlsoV4btfPADQcByqGyDyST6KsA+Zu1ECm2txVUKtLSZVt89
 1Qa2nbUOSujvLJMoB9fFhYVLfZf6zX2o2KfpQopZ1i0CTi8KWeYzMk1ZQWTkCA4Q9gJmBr3uANj
 LL3rG3hdzdL6unTPibplFpHqEQUe6Yk1Mx7ATJQNM5xChgckhkq/Dpy+zBPRscQJZc6qQFPFYEJ
 Itc4wCc/b+wH+fIlVdwRSbtnaa6IY3tnGiSbfaE3qVjVT8fjLGwsZjWsqgqCe9wbKagQPhmrAP5
 rHmdBDvG6ex3zqH+WUXPgvcZDyeaxP8MmO8urqS2nzGuCQ83XcNdt75xMnrZzdQsmLX1S9TBRvx
 IlEDKj8SlUTXlCMbGj1csu1vVk3n0opJ6zmX2h9VV9mIUIKgkp8vuBdTJrjntDisIi1RwanDc7k
 X3F0/dfR/tk4kN11l83BKHU1cw/9AsDHowB0SD8omHgxr/lj7KmIYXRBl2LFuNThqnn/pM9wI0+
 xVInRDeiwO122+xOxFEKYKYi+3hmPQahaDY5TXS8oZki9lK/RNLNZcKgcG33JXK/KBzmEVqE396
 nFaz9/7A8QIsUMCMpLoWQZ0GtxYya98ZjoPvDJ+/+0XPQa+Qj3OsTw4ou6wEMgmpciTwqC5Sy0H
 6SBtY/8Uut6i9ig==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

The `Index` implementation on `BStr` was lost when we switched `BStr` from
a type alias of `[u8]` to a newtype. This patch adds back `Index` by
implementing `Index` for `BStr` when `Index` would be implemented for
`[u8]`.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/str.rs | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 002dcddf7c7687522a0acbff3ce6f65fa890e216..1eb945bed77d6592216cf30678fcca70d4c0b3b3 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -114,6 +114,17 @@ fn eq(&self, other: &Self) -> bool {
     }
 }
 
+impl<Idx> Index<Idx> for BStr
+where
+    Idx: core::slice::SliceIndex<[u8], Output = [u8]>,
+{
+    type Output = Self;
+
+    fn index(&self, index: Idx) -> &Self::Output {
+        BStr::from_bytes(&self.0[index])
+    }
+}
+
 /// Creates a new [`BStr`] from a string literal.
 ///
 /// `b_str!` converts the supplied string literal to byte string, so non-ASCII

-- 
2.47.0



