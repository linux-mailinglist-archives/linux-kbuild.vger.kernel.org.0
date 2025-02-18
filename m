Return-Path: <linux-kbuild+bounces-5821-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6CDA39CE8
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2025 14:08:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8682C176411
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2025 13:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3625269D1D;
	Tue, 18 Feb 2025 13:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hc8jpvEj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE86F2690C6;
	Tue, 18 Feb 2025 13:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739883747; cv=none; b=otXaeZIIJrllOHYRvQ3afXYAOphpnrcqA70GYsZa/AX3/lj2Xvhl6lEWPfnfEPMmHPHWoB/lSAl4Hf1YHY2nFQHB/avAcBmHDD2w/7PXLMql3jm74NBaG3Xlgow1U0ggdC3qkk3ObA5F35FPgpMnBRa+riSGASI8sNnMzoDQzi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739883747; c=relaxed/simple;
	bh=ZCtD1w7YciQFFZSg9uxP+oTq2EUuClmnZ/gBWrvvPTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PGG8KBTsQG8rLrPm07YA3BmTsAfxrQUJwMJdjZbU91bUhsP82qTBp9aU23DXatwxdtzGhw9EBpVWUymJuV7s6bQqcK9wjCIFYHpI86wwFSGV4Xn2XpL6V8Iy99wW5CJMqQAWingQ9IqJV7iDPIaYBQkdJgqXzO5zo5nLF0tTamA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hc8jpvEj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65444C4CEE2;
	Tue, 18 Feb 2025 13:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739883747;
	bh=ZCtD1w7YciQFFZSg9uxP+oTq2EUuClmnZ/gBWrvvPTg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Hc8jpvEjOzvH8zofHL/NU33O3IiAeILQb254yZjp8AGR44Yq6AQxgudANZg300XtK
	 VAw6oSxZzE/iE+Z3m1pUWVrx5td+Dyj2/EUgDhutWc5roNmZ/WaahQdJeKJ7P+14HZ
	 Otyobahlz/sLDoiHcQYWm1fJ5Kvja1OWDABOvGaV59ccykLUQ4MKI9x5mw6479ikJR
	 gJftQPfAzcZZu/IM+bIFixjykQorP2n9VV65aigQnv+VMg6u6tlGOPL5VtT2jxakhw
	 JKsr3gOuqwEm2JT66zFafLSF6KyZVyTRjq+6wCqzFRsU1e1wdZ7K0s8Hc5JLYF84HQ
	 LzUGH98l4dskA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Tue, 18 Feb 2025 14:00:44 +0100
Subject: [PATCH v7 2/6] rust: str: implement `Index` for `BStr`
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-module-params-v3-v7-2-5e1afabcac1b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=965; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=ZCtD1w7YciQFFZSg9uxP+oTq2EUuClmnZ/gBWrvvPTg=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBntISElCXiUpM+MmkbzANn72kRTg4AcuhWu3gZZ
 rFV245EChqJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ7SEhAAKCRDhuBo+eShj
 d1yPD/9E9Yw2ABuGs7zFFraasCJGLy4+kM5T/AA9gZkGY1miE7AcgIHPm0nG64h1pyZ75vLNBDL
 WrSl8XT9KTq6XOi7GixZRVAMvIh2zqTcCZE6FFp21Yrf7sbxTriFPKcRZk/Po2WuxNlC1wfcbBU
 wyp9UmMf6aAAABSDijVStgtWfN/OoT9HGaH+XroHO1oOaM8YSstv7oim6IYUtT/U7+KVtWeXpyU
 HzQh2SWDJSNi9LEG2VxcoDznC7GeuH4ixu9qVmNosjDV1DTqWFkOIE7XAbrfM0DqHcQpAfXDvZN
 /B4WHCSNsq/+lpqyXjAEqu5JkcbXsf0jQby8Ct4webRgNoJzwJFnSXWSfdUDnZ14bmkZht7zjZX
 IbABfRGrPeD3glM1CuZcwqAP5/ulpfPiMvM8/5/km5bJ/+U+JOcMLuotp0JjAJzQLY6vA6mOKtK
 k1V786i+RQwB91qHDDZqmRRVsFDdcE56BuhYOq19cIEz/93VKvTAFHSBHvxFiryV8Mg52n1MG1t
 ZmdICxzxAPiqFjzxXnoX4NHGZw5Pl+pnS05UGtItAu9TQgS55c74PJyEBit8Hlc6McqBQNRZ3Ch
 5N9NSLx3ywDxRxbu287G3I+Jlo+bFH015MLEY/+5jizF1hhhzx5bcpUAaVJmM7yHSWyEWJX0dds
 NrZcjW+WWvpiTWg==
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
index 002dcddf7c768..ba6b1a5c4f99d 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -114,6 +114,17 @@ fn eq(&self, other: &Self) -> bool {
     }
 }
 
+impl<Idx> Index<Idx> for BStr
+where
+    [u8]: Index<Idx, Output = [u8]>,
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



