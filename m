Return-Path: <linux-kbuild+bounces-5114-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 442B09F0B50
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 12:35:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 058CD282B6E
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2024 11:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E141E0B70;
	Fri, 13 Dec 2024 11:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KuGf84i/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661FE1E048D;
	Fri, 13 Dec 2024 11:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734089633; cv=none; b=QgstcbtfQq51snyOg3PjqrUhIh7PMJFGbS0v5WCSnwAreMYlh0hRvcM7xdM864MP1GtbM5ynPoEIHYb/SmBT/ZndpMRcWY0jrRoibEYuowA4vX2MwZnJ2JdWJPsWB905LF8Xg4U/6lhzh/zo+ADRtXAGBEuk9KJHf1hK5nHCkgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734089633; c=relaxed/simple;
	bh=Dp/gvFkmxNIBlKIq3RmiSi90pByj3YD8mMLxDJjtVnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FpJKm+Jth/xhGrNZkNBhIMB+S3b4khb/rVA4W7TRLJAbCYF4WFbkxkvUAti+bBH2nw8IbmAAfkavwKAYdIMUx+I18rSBeJYA3UIOU1qYGHQQzPkO8pbZ/JGqtMMpWVSxEhB89kVVkVdbCiY1DrS/X8bTQOOxXRGmrXyycJ/nOqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KuGf84i/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 528DBC4CED4;
	Fri, 13 Dec 2024 11:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734089632;
	bh=Dp/gvFkmxNIBlKIq3RmiSi90pByj3YD8mMLxDJjtVnA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KuGf84i/zqzGXLb5aqHVMi+DUU8yOau/WsWefGXPQsXvFG98Gzx88A/qrmhWByrZH
	 3/FjPWGiCKQvHSG8mON2U2Zr1OdET9HWaMrdyyjkHQgI6w65Tit9OLmGsW3E6HzzOp
	 vhRFqAC2DjfAbqx/g5hRxHZAHiiylF9PwnFvq4SmHdzNB3DFVU45wHDDqK7KyaY2Dj
	 BbVEGSd53me778lXOJKZ1FVmtFXsC6d/oQD6j6/CbPwnii5m9BqNe3uqgvhDQjr9x6
	 z9sR7sFfSKLbJ903hPI3EsNJ3zxI4jeE0NCOx3KbRnCTI9X+bX9h8a9HXsEaveVSBh
	 1FaoArAKNbHvg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 13 Dec 2024 12:30:46 +0100
Subject: [PATCH v3 1/4] rust: str: implement `PartialEq` for `BStr`
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-module-params-v3-v3-1-485a015ac2cf@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=759; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=Dp/gvFkmxNIBlKIq3RmiSi90pByj3YD8mMLxDJjtVnA=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnXBr2G0ntAv+d0j0ttUW0UUxngyHE0apK9EFII
 uYYoYZKEkSJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ1wa9gAKCRDhuBo+eShj
 dz30EACk4jCKHOR8AcbS+h2DduFfzrAbyuIOHuGDx4183ktSBE3ziP9Fd9CgcTOrDJ3imGcSmC4
 zymjNKdttsGe+1KzPTJCgKKxAoF+/hdAmAfKj0eX2vf2hkkSv3fazu5X2oXyuJUtqUxhnlCM8h0
 kC9/H3vCvFOa0+vtpXpFXwc+cyFpSe98aqsREW25w3/s57Z9vb8Ud7x5QHwgQ9saeWgNrTXlx1f
 RYHuDvePU19JZvo7nAAb9rajqC0+BxwYadcMa42X7TpQgS1aakHnZi2Rhuluj14gB6Z/E9rPOHO
 Z5o/qvA3hLOBjZ02N0qhKiWD3/9/oU8/O1wAG9GazXjJev6JPuQ2YwbfILwNTp9HwfyWo6r8St3
 bP2W+j2HZN0oqlOmxClCB+fML0ICvOw1Z3BGVDrxzNsbZWBif/0erLnZFE5RNzuFcDxmdINU3ZO
 6Lj4VHS0HxYXUM9I1WT89yq/xrCw1zT/8QqNrqneOM4w5Bk+aiMkLP6RmpCAUFx2VGLJ2+qq7GX
 3sYEcerqs7+rvCGIw1qC3k9Ve3AQP54w2qMUDZ9xCAoX2owbsziuKSsdwuSM4LvHQeiOfE1VzFm
 EYvDerRBzQ8eo6246Q0GMfBtQzONVN1q1jDZWRSvHhkZ4DUK5LQUA90ldGxyFZ8tdxP/9pYDUKy
 V2081pHk+kx2vGQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Implement `PartialEq` for `BStr` by comparing underlying byte slices.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/str.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index d04c12a1426d1c1edeb88325bcd9c63bf45f9b60..c441acf76ebd1f14919b6d233edffbbbbf944619 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -106,6 +106,12 @@ fn deref(&self) -> &Self::Target {
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



