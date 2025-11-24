Return-Path: <linux-kbuild+bounces-9820-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D07FC8150B
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 16:24:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DBAE94E3A1F
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 15:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DBDE31984E;
	Mon, 24 Nov 2025 15:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PV4MTUNz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B8B314B81;
	Mon, 24 Nov 2025 15:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763997617; cv=none; b=T4ELyBmnpVO/Nw9pgsUAPhcdM1gSIZByztkchRBggUG/981WiEyC1EIPbrZsKKOGOgtBp9wW0WsI/Mi53PoCCKX9WJMB3qf+Yh/k9PapDwUdRJNrsROw4j2hckEpE9clX7d6WE61n9IZzD2txep7ntmgIvIKD09/CjwZja9PH3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763997617; c=relaxed/simple;
	bh=1Pdo6IOs6T5QXobTwiFgUvJZ0saqeTmeyGjci3d39EI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EXwY1QlyA5EYySP9HsARwWu1ynzB3KLxGxiEjXFOn+sk7UUsJWr5H54HUGFER//+0jFKFyLCcZixPuVHv707iXVTAW3Sesb3cM7oCyK6i7VPGFK7w0nA6qAOY4c5e1nRzX+6RtWvEr8PSb3oEPoTs4Yv3gZi99JyPucAlYx/P6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PV4MTUNz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E58FAC4CEF1;
	Mon, 24 Nov 2025 15:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763997616;
	bh=1Pdo6IOs6T5QXobTwiFgUvJZ0saqeTmeyGjci3d39EI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PV4MTUNzXvRdigpGRfTjUgsgqFOim08VL0J5NHDXTcdqcX+VFynhSoU1yaQqX4yP7
	 Mm+N23fmnaDFjTPWSKJ++poQ7hbFqpm5rrCzsGEVVZSfIIapxMPbPUdXdvAQBVTz90
	 nO5dxshPCW+kZ15JX4G6LJfucUBWCBInqu+CTHNLhbtrnanGbCdIHcpxCeVZ5Llnmi
	 jVoZ2tdPbvTXASjpV3rSFK9zpQDz32ByAncCp25NBwbsRofVfmVjBfSzKbfDiEYP/W
	 XXAmyG8uoQyI1qdKFgsyV/XPZECjmirMxwMlGB3ysNU7O7/Bv71X4dArOyuWhMuHrO
	 9xYACpoGwy0jQ==
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
Subject: [PATCH v2 18/20] rust: syn: add `README.md`
Date: Mon, 24 Nov 2025 16:18:30 +0100
Message-ID: <20251124151837.2184382-19-ojeda@kernel.org>
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

Thus do the same for the `syn` crate.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Tested-by: Gary Guo <gary@garyguo.net>
Tested-by: Jesung Yang <y.j3ms.n@gmail.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/syn/README.md | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 rust/syn/README.md

diff --git a/rust/syn/README.md b/rust/syn/README.md
new file mode 100644
index 000000000000..d3e3981da2fe
--- /dev/null
+++ b/rust/syn/README.md
@@ -0,0 +1,13 @@
+# `syn`
+
+These source files come from the Rust `syn` crate, version 2.0.106
+(released 2025-08-16), hosted in the <https://github.com/dtolnay/syn>
+repository, licensed under "Apache-2.0 OR MIT" and only modified to add
+the SPDX license identifiers and to remove the `unicode-ident`
+dependency.
+
+For copyright details, please see:
+
+    https://github.com/dtolnay/syn/blob/2.0.106/README.md#license
+    https://github.com/dtolnay/syn/blob/2.0.106/LICENSE-APACHE
+    https://github.com/dtolnay/syn/blob/2.0.106/LICENSE-MIT
-- 
2.52.0


