Return-Path: <linux-kbuild+bounces-5717-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE04A31075
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2025 16:59:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBA273A7C6B
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2025 15:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88922253B7E;
	Tue, 11 Feb 2025 15:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P26YLJDQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5853B253B71;
	Tue, 11 Feb 2025 15:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739289535; cv=none; b=mkzpdX9rXSUF4hse6vKe/MwQv5cJYVkLqyHLza4E1J2ajt4xyUGSPcBrEjFUMpm4vpO7iSyLQOZ9VUfKzPlEyPRM4AxTj6ttTzQCWQ2MQWgKqy6JPutBL7EM0czfeK2mQ6y3UWEGOfsNTQLy107TrHfzTGMYoeK2uXUQ9OZE4XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739289535; c=relaxed/simple;
	bh=+uIy7BR1x85ogRbzllORPBppY/EGsUDcto8p+IOopDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OamDJ1eAvd0KDVK9tOwy824fmXZK4c9ka8Ov48S1hSPg+yXF+EzA05VHiL3n8Yo6s319B3GW6YudoTE+rCVRkXJOdAAZ7xG2mJe/ftbRF6ZjsLDxIuW2AseTOWufzXfW2MCNBRy09ss8az0H0PaEibCnriCdDU3QZGgpJRFTqk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P26YLJDQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DF87C4CEDD;
	Tue, 11 Feb 2025 15:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739289534;
	bh=+uIy7BR1x85ogRbzllORPBppY/EGsUDcto8p+IOopDY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=P26YLJDQCFPqyJJEiIKyjWxWumuwksNEim7zIlMRx3/iW4D2tpG/A8PlGkFJKcV5x
	 MnOooWiyWgSE3/Di+DWQUwILD6Kh1ONyOTIbmjHc832wpzLqphBTrJR53kY4/dg+zG
	 Z5clhmpp5u6h7QR/YoIjHIVb1pDIWNMLwvPy9A+7pDCExYn0hUg4553r54bqOEZmAl
	 ZzJm9n0yOrLmzasJIyN2aSk58oQE+cOOpGooZDaHPS+58Brp2IlBUT+fJ4qwxyKdNy
	 IfnftzAbsgkv3foPdyt3i/z+Kk88LmDoOIoL/ky1dYHSWemgP9ieFN6YTLtZAUryOo
	 Bt8NM2ERWLxxA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Tue, 11 Feb 2025 16:57:38 +0100
Subject: [PATCH v6 4/6] rust: str: implement `strip_prefix` for `BStr`
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-module-params-v3-v6-4-24b297ddc43d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1603; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=+uIy7BR1x85ogRbzllORPBppY/EGsUDcto8p+IOopDY=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnq3N0+VK1vMqJKMsR66k6TYqa/4dOKJ+Tud6jC
 brxn3LYGriJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ6tzdAAKCRDhuBo+eShj
 d8k/D/9+n6N/CxDdIs+azmilRQ898rHMZJQqLVNALHRIaWeHgWem5IpgJFnELyv3olInE3BBkFR
 iFzXkM6zviowcdlzL0fSJMXF9/2IxWDueDTmOB1JkQY+26mRPouZmmEYvB0K3Oew5Ls94xP0IJD
 q26UWIE70giD/1DEA9Grf7eTy/LWO3/DQxyigyvr2w6Z7qzF58Sk6/ImijEadG3fbdTaH3Fwimm
 6ompGRma0ZwPayDROHYS4N+i1BtFBI69a9Pggd+EYKHOKRe839UPOx1qalXl0zEdlpjd+wpgmFz
 ifaU+uSWFSw3gJlru13AiZ5bnfUoQ7JGXLTPZDXRAe3e6BX3rhSebrqQ5KQdOv/tOaqNDnMhG5R
 NnNUIR0sWZMb7vrzpFUbKVhKtMiOYlRxGGf1FoclFRDl6PL674iqpCNRTay9rNf8yjIUfrxRTAL
 RwXiM20Cpg7KElx2zv6RYlI9TwCEhJBzb7Zq6gXBkvOMQcPAg6qvEhBXIR2Bau/hXi86mGD5Le/
 9oD0i717TPW2cvpo62hsIkSKlGxT4kDSe6jqmXBkxSV9c4DPqVdREeAsRs2fc/uGDb4SIOZlkZI
 Zf80KqlNUjhJCFCV21LPy1ZtekJlGOiAqik3ycrruSrgqkiy3HV+ex3FW5fNb/w9HRKz17mTujd
 vsFG6HZaIoj0wVA==
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
index 389341455b962..c102adac32757 100644
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



