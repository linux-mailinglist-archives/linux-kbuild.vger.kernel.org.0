Return-Path: <linux-kbuild+bounces-5715-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BA9A31077
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2025 16:59:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD159188287F
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2025 15:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6519253B57;
	Tue, 11 Feb 2025 15:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k8DYuahm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A2225332A;
	Tue, 11 Feb 2025 15:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739289522; cv=none; b=uiJZ6CrSVl6UUzc1JEsu7cSeQ/ppPj6TjebleIeZ610hIQpuf3IqxxNKtZKqFdSASBNCt462GI71UwwKNkgld0GwkQJwdE78hGDYTbQCG+w6kppS6kkamHlEhwiS7yTCjmXgIAmyFceHQNoAcuy8yJc6c2L3tvUnu0DzTY/YBSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739289522; c=relaxed/simple;
	bh=Xz+5d+IiM2MkTzUVhpWZQYb4mXaS8mDDiRO4o00oaDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qZCF2VTFaJzc79sA+tVg/Di8owZY10i4Fqywe13ea5P0SjM7d8OdWlnpXbzX1sJupMT0TBTqpjcONMITdnW0DAvpT6sGs6WS/5g/d3XzYiIDJf7SY50PIbHeJ6jplOv9wjPPKzAXoP4rPsZqCGaoMqUfxxMH7a0BzqsDvrLP1EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k8DYuahm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE01C4CEDD;
	Tue, 11 Feb 2025 15:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739289522;
	bh=Xz+5d+IiM2MkTzUVhpWZQYb4mXaS8mDDiRO4o00oaDY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=k8DYuahm1ns8l7X3utNH+QQDjoTZ8StYyELgqzDIEsw/dvyzX05UZHkFGPkab9/rV
	 IGxs/PH5JpvHBlVkY//Am37mJPCHga1dQMNlUIddfS1+19HqPWvsKSJxyqkzm4LaNt
	 Kg+RtgfUctBrcF7144d698gPSrctU6T1TvRs5bR/cX8vcvsmHwSoTbggl4ZJ+ICh1p
	 Vs9aRn52LYltDQVHuRVzcVqlXLimVXZ4M2WBaxEYg2W9yhweOZYdQJIaBXaV/NGyZJ
	 RDY7d2A1SwLdDKQJPd3bj5Pz5zfj2aXupRDwwnagXAmfbIP3QjsPNRXryRdbrCOMz8
	 4ZQkhwiTao34g==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Tue, 11 Feb 2025 16:57:37 +0100
Subject: [PATCH v6 3/6] rust: str: implement `AsRef<BStr>` for `[u8]` and
 `BStr`
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-module-params-v3-v6-3-24b297ddc43d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=844; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=Xz+5d+IiM2MkTzUVhpWZQYb4mXaS8mDDiRO4o00oaDY=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnq3NzkuMPzfvD9jbWSliaEZmU5g5Etpdx4wRDz
 rYJlZhSIVuJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ6tzcwAKCRDhuBo+eShj
 d9aGEADEFlDXKp5Zha9XktLTlkP8VgWwhhQcMfZGoHmp8R7LszzfgdLaxOHZvy8DvC0Qn0O7V82
 38csrbjptQvDjoDZXZa3j7vlp3cc2KXG4TL1fsVmoxeW2Jht3eJEhx4LPDA0VDKbns1jbdfXXJq
 X/wFYuOFtnPouSrjZeFZ0MoexWSdt30bhosdeczkAN6vEWPCeoN1oDJkyiuODCrwk446qA/94Z0
 +kkjDTaP5dkQSa1sUZiriJZiRQ1uyaCwus5xVgntCDftS70mm+OT/JTOp9yIC1nnHwWYhknw7Ap
 axic9JOcio8E0bt9v/8xZTjWDtn4jsRCFb001jRFxbzkLburBFvprm8ZvC+SM51RkzMfGK3QBio
 xf4Amz9eCs9opxZvZkVvRpnEPbPhXthKYSqNy8UdKKJCMjWe3C5kssnmf9MgcBJZtIvoJUsa6Be
 qw0TCNShpzQ+6NgZYN1KQKnHtz+9dnFTzKaDiyFguYH7fot3YkhniejgtT0JGnZun8inE6aC2ET
 +1mxL94gN2wLlttbc+zeIIcX4deJeuB4BEwlgcc1mq9iTuDCoAnk3bgPZFaIb0M5xrRfPQpHA3s
 PF+MX8EYHh8WtU0WuZvNX65tVdGoFCKV9RqGT38GDADCFOBbW9P8J7MNHt83z4flqiI3qBS/1Lk
 814OS3Xmxreo+WA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Implement `AsRef<BStr>` for `[u8]` and `BStr` so these can be used
interchangeably for operations on `BStr`.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/str.rs | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 1eb945bed77d6..389341455b962 100644
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



