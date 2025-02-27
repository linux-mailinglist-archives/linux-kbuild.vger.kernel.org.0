Return-Path: <linux-kbuild+bounces-5923-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C89A481F0
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Feb 2025 15:48:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 846D9422CB7
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Feb 2025 14:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AFAE238D2E;
	Thu, 27 Feb 2025 14:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QA4tL/L0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE86A236425;
	Thu, 27 Feb 2025 14:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740667163; cv=none; b=CPb57hDYZXacbj0aGQScNrCUPmA3v47jztV3VHmBrUktmnCCxcoHk2QzbuE2QNt1aN1+6T5P8jJNiEVizIMZCTUVAjhNF6Vn2sFxvboDoUbRMf/VV2v7x0+p0M98vCY7Wr8UYEbUXMqi1yZz0Tvo8Tur6hrDnHSKRYHrUp2OwOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740667163; c=relaxed/simple;
	bh=y61tYQBOzvQT13se+wj4PsD5CpV5viHok2MH3MQVUsw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DbmHjTtLAcTmJb0wwZH6CeRQQ6uV8TjnVV6qkpNyqOdWpnX+LEc1WkmAhlM4ZCr1GhJ3pj+9NYwW0+TCv3CtJUSH4/Lpr2U8PHVcykCCo/E20NPJxwatNr4Dsz6/fPnml5DCPwrk0koHqyNA2iBDZ75O7eStxRIzO9UctCzIJjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QA4tL/L0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05250C4CEDD;
	Thu, 27 Feb 2025 14:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740667162;
	bh=y61tYQBOzvQT13se+wj4PsD5CpV5viHok2MH3MQVUsw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QA4tL/L05Yy3kZT2LhyG/ajf57qo2SGAErx034vB89DrdQ4SNakcQHhwfbQ3we90J
	 Bxtk9YOLY8J0lEg76YFeD/vUh0ZnBESTIKiizf5La3cAUHITehNNp5LXOmovrMSlxh
	 3IIbqqohDh9LoFpjENxLJcD3lpNuELsSukWgsfzqArTokkwZb0M1mvWgHz/t32nbGl
	 zJ3JPZdabVE3IPobp/oQONZ7DQxHhggkUUjKmPamKqP3emW/vdvHSEbVkHMuDgTgeR
	 5FaYqp5n+yPb+GlsF23mWzIIVDjVOA/Bkl4yiCMALkvwrRo2zJeQf0AD0COClIqOGq
	 pL+gqqawbPzTQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 27 Feb 2025 15:38:09 +0100
Subject: [PATCH v8 3/7] rust: str: implement `AsRef<BStr>` for `[u8]` and
 `BStr`
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-module-params-v3-v8-3-ceeee85d9347@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=y61tYQBOzvQT13se+wj4PsD5CpV5viHok2MH3MQVUsw=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnwHjSLiqwqmIm6F5SfrtT7rO15l7n0S0sY1Fne
 wmWAtG2mhSJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ8B40gAKCRDhuBo+eShj
 dyKhEACm1VAvi9EwhBdVdbF6jykLLlxpF5TrA52pr63Q0BUvMrammDD+I+zpzRp5OOkrtVRsk1o
 G28P+Waxuj+uup1uu21fB8qgRPUvVzGy97g9zUgzxkRXsBRVnbEXR73AzUHpXXaFmwIcdM8HdMH
 KSCiR7zZtVLUtQJw00ThsViULXCRjq4ygmFtjXYj/WKfjSFz57i1sRO6HpUTOKcA4tku/1wVw1X
 juJEZEfqziyE4ktlx3zh1/raTWFp+sW4IN/kJMunrT3J9HiokyAeZ2WU/EY7O0wQPl5N3Z0Eh7r
 sk48w01w5pkivKNr3S2MQ//LmhdnrIymlsbSku/6+yVpEwLRAkh9q32RK/wH+F0sSHnoMMVZgNG
 soin67nssp5Q7nBPOt/DGhpCWnvJWiLN81BwtLPDY7jUnjeihM4t1bekga8V5XGBk672B0cvidT
 XxRfgc20xjn2DtJRZE7XdEUTDKjq2iNQ8UTWhuymjLw5yWqCqw8MYIu52nb/90lUQwWX3uESVel
 LF/KQRupGqVfqGI1z9YIoG+yfvi3V72R/8zPXqQ9Bywr8DjDwEy1HXChaw8k9h+hiztFgfX65C+
 JwIlwR92VkoinrYGv0dugRU64Fe7AdZ6dM7DAo8kqUeEx+jC1aPqYiXgFIUBhZJ3zOAmDxX7EW6
 ezjZ8a5tkRN2ThA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Implement `AsRef<BStr>` for `[u8]` and `BStr` so these can be used
interchangeably for operations on `BStr`.

Reviewed-by: Gary Guo <gary@garyguo.net>
Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/str.rs | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index ba6b1a5c4f99..c6bd2c69543d 100644
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



