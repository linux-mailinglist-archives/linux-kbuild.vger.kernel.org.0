Return-Path: <linux-kbuild+bounces-9815-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 592CFC814FF
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 16:24:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 78E6F34862B
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 15:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A83093176F2;
	Mon, 24 Nov 2025 15:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WoLkt/iA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79507313E0C;
	Mon, 24 Nov 2025 15:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763997595; cv=none; b=Ay9hDKvOTak8B/xqMmcgZ686nskDDcZlNddrA7cJxgEkMXRi5QZsIdY1sZjS+Wvu2Ht7RbQfu+YI0qm+v4fm/X651nicIlVvbKwSnmqH6Q1eGGuBee4yIJMXrsv9XlII1wvNMX1wYREguywaZxGVRdMYCsHaSJbBXZaIokc+jKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763997595; c=relaxed/simple;
	bh=wRcdRtTXxPKRHOS3E56w6Kk4IiSME0GgcnJ2nXkKYL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X2AU5kIvMA7xrJQVYzVVoa5bUzSiHl8rrQJBo9ibIE9dE2YHI4ETnmkyjXQOP/l4P8+YCqowg7FVfZceSFt+mozdn6ua5yp88h2odi59P4XrewXeG4TwNm7hTf+afyitXPTMhjUr3GUIImHV+ZJXIWxAVbanx0FWobUXytTUTag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WoLkt/iA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C44C4CEF1;
	Mon, 24 Nov 2025 15:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763997595;
	bh=wRcdRtTXxPKRHOS3E56w6Kk4IiSME0GgcnJ2nXkKYL8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WoLkt/iAdGrSFMnzhd6xzYsEhnpv18k066He9lyuudcnRMEFo4bRL51k4KKjMj7Cq
	 aTyTht3GGEw7EAgsv4PY7tCFn3qV15ZIT6G6DCPB3lwMytefd3XJjnKuESb3Zv+0RZ
	 erObp6FcneaEn8kG8IuC+r5JJs4bkVN32y08o7F7DUlb4XmuQj6BKWifHEynr3LsX4
	 0EoDi5sye5lqAl8BtuFVoG0/VhUdl2eUTxVe6iEQVFc2sPSmNHGP3KIAmwX1CKGxkg
	 SXO4x8sqpxulhYTfGeIIxzMv+2eQ73qlLTE3FIXQUyCMhqurHV7au30n2lYzu7p7y0
	 PmPVajmASUjhQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Jesung Yang <y.j3ms.n@gmail.com>
Subject: [PATCH v2 13/20] rust: quote: add `README.md`
Date: Mon, 24 Nov 2025 16:18:25 +0100
Message-ID: <20251124151837.2184382-14-ojeda@kernel.org>
In-Reply-To: <20251124151837.2184382-1-ojeda@kernel.org>
References: <20251124151837.2184382-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Originally, when the Rust upstream `alloc` standard library crate was
vendored in commit 057b8d257107 ("rust: adapt `alloc` crate to the
kernel"), a `README.md` file was added to explain the provenance and
licensing of the source files.

Thus do the same for the `quote` crate.

Reviewed-by: Gary Guo <gary@garyguo.net>
Tested-by: Gary Guo <gary@garyguo.net>
Tested-by: Jesung Yang <y.j3ms.n@gmail.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/quote/README.md | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 rust/quote/README.md

diff --git a/rust/quote/README.md b/rust/quote/README.md
new file mode 100644
index 000000000000..186123eff1cb
--- /dev/null
+++ b/rust/quote/README.md
@@ -0,0 +1,12 @@
+# `quote`
+
+These source files come from the Rust `quote` crate, version 1.0.40
+(released 2025-03-12), hosted in the <https://github.com/dtolnay/quote>
+repository, licensed under "Apache-2.0 OR MIT" and only modified to add
+the SPDX license identifiers.
+
+For copyright details, please see:
+
+    https://github.com/dtolnay/quote/blob/1.0.40/README.md#license
+    https://github.com/dtolnay/quote/blob/1.0.40/LICENSE-APACHE
+    https://github.com/dtolnay/quote/blob/1.0.40/LICENSE-MIT
-- 
2.52.0


