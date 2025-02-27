Return-Path: <linux-kbuild+bounces-5927-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9771A481BF
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Feb 2025 15:42:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AD9B3B01F2
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Feb 2025 14:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5391623BF99;
	Thu, 27 Feb 2025 14:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FOlhyc63"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEEC23BCE3;
	Thu, 27 Feb 2025 14:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740667188; cv=none; b=FeTceNZnDbkYL50WuYJ1gAT4ljR0R5JIzLthKIa7sj2p4MA70Alagek+7+Kot+7aoE/YphjRIhN4JV9WbSFjVdkU2Bw4JRIvgu7KuuD8IC1AYzlA1DZ2XoBM4jX3xBUcgKWxbTeoKsE3Yxs81tr0tWiQFapjFCpMKTcuEZqokQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740667188; c=relaxed/simple;
	bh=9xEh8xnuonl+Y4DJJTe3psqTruSkTcctIO2KOz8LZ3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dV0G8Y+DpZ2DMkI0C37cVOuuwBt0iC+lJ6nHqWC5IiGLNQ2+uKiLZ+CvGiHnCrYP14h8G86tAvyhWeSNGujzT5xv9s1X1iU01ZcCxyxQ3Zi81s0Q/b7vMq7J+lzZGlxXxJvVx6kQUT+iLCCHO3ytjwUJerFg30AlqQcwmdKlB2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FOlhyc63; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF35C4CEE9;
	Thu, 27 Feb 2025 14:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740667187;
	bh=9xEh8xnuonl+Y4DJJTe3psqTruSkTcctIO2KOz8LZ3U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FOlhyc63NdTvMRnEoTKfKrBjtuf99xMXITmk8vn+5L376KocYDLukN+HFCaX/rgCW
	 5t2SXyNf33h8lnRwWXJtKYi+MoEISMK5U1gz1qhIQyFT1n/W1feor0njQzmJoQcXbm
	 NaOa3YGBuD445tb6MWpt0vdHH03bHSJUdQh8SrO/g3/+Ae5sqfxqpLICah9V4gUWry
	 XjtHd3n6ttmWwh5tvrdMLHF1gnmmfokMfoofsTlMk9dG5sNiCQb/Sygd0d0OdeVEwl
	 /dokBoIy1QHi71WM47bpJKxw4KRPnQz6303E1H20AllBPux82NP5zk4R1Adc5MnrE1
	 KT7coRs5T1jAw==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 27 Feb 2025 15:38:07 +0100
Subject: [PATCH v8 1/7] rust: str: implement `PartialEq` for `BStr`
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-module-params-v3-v8-1-ceeee85d9347@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=911; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=9xEh8xnuonl+Y4DJJTe3psqTruSkTcctIO2KOz8LZ3U=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnwHjQmudfccCCA3TVrg15lT/He0OPHIxRmsZZ+
 L7YWtBKcOSJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ8B40AAKCRDhuBo+eShj
 d0rpD/wMpVT+8AVIxXiBvtFG3pZADIaZoJ24E0rNtHqYQypZA7B2alFifWZZw4ddWAxdFX0qeYq
 5YrOQSx/euZCaVbHbOPTGmzY2S4zItr2Dp6BOElkXL1LshFw5uE9yOkwVCPymSy2dFqjqTHavyK
 +ZlA0w4tViBL6WZbk3zvAqxqtig5Q6YbkClnP0UJQbtW35GUcaYrdotmPXPLQb9Z/cIkWO9LJFQ
 d21DzzNLrBmhXe0J2fuxG6d/5JzqBOi0UnZCLz2u1rOVZ4oqcr44h2ajLMPf26BLhYNkRoupi9f
 TzHZ2SdpVgzoMOd3B+1RH4bCSZcnY7xggFIx3s/R4KVuigmNe2TMSyBIWzW6VYka/Wne6Xpd2Ql
 gQBjCcgzm7ciiOwuaP3XIe3FBglnT4QG9A68+E7MjIzWmW/7CxH86soDQP563Brgevm0+KXFPu3
 T9DnDklxvccRZNQQp9OJ8IzXGZKfVkD3nELOSYyjJKxz+QmrQqn84yXICTSliBnYAqw6YTwMfzX
 MdHy2I2zGPf/D1k/+BtWEDxSWXlglNsi+xD95cnKmD6D352Ms4/BwRUtyk5HeJppn7o073Cv+IH
 g1hQPdxSx5o1vGEw1O2kTME/nuMzlLrjt5snEaykkrNNglkoRKY4n4jbOepR4L7DjEXnyyvV1In
 0AT3Y7F66VjQAOQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Implement `PartialEq` for `BStr` by comparing underlying byte slices.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/str.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 28e2201604d6..002dcddf7c76 100644
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



