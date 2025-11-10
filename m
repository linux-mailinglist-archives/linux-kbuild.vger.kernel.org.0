Return-Path: <linux-kbuild+bounces-9479-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF929C45BE7
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 10:53:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D70B3A88D6
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 09:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C8D30215F;
	Mon, 10 Nov 2025 09:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XriU2UyP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACA03016F6;
	Mon, 10 Nov 2025 09:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762768294; cv=none; b=KbmQbsFphttG7dPh2PSYREFyxmN2+QKXgZj6OjBxOhdHC1+2D4clo+/b4wmhPbrIMckR+71UCBwuuExc2VmoDO5DTLlUEK1JyrWtJlXrnd4uerZkZeXgYVGlqwCPRflIc5SwWVNfXosjVwTRieK+gdrIXBNBs8P8bS88xv/XUp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762768294; c=relaxed/simple;
	bh=/d/Golsn+vj2wO4z4RHpAwz66UEMqeTdDyBLTUGDdEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bI6BRTpQ2/hXEzbfd6UlVH92aJxzvUo0iOrEXtlDKyvju8HtdUkd3MH4FXiRBHpsNWqdTRjL26yZAHQO5n3oHe3B4Q23lTawVSe/WafFOtyb4HfMuUsHe1q64/ATyzISqzydeJ4Ih02dW1hJ6hLG8IxmWiD8xNVCzlWs0gI7ukM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XriU2UyP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8AFBC4CEFB;
	Mon, 10 Nov 2025 09:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762768294;
	bh=/d/Golsn+vj2wO4z4RHpAwz66UEMqeTdDyBLTUGDdEk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XriU2UyPqV8WYMBiJsAa0B2WK5Wj8iRLK73nfmEO41hczL++YREftIbr+eWCUBzZ0
	 icTlZjd8UpJ6OmUAZeCYH4YeA5hhmasz9XlD7wjJFZs7lq6CiS4mkIowOjOdZQ8pBO
	 FPVWzYXrMLK6/Vw/0Tn5UE60u9sJwseigDDpTCZPhoJy2JvgSaukHPFY8QHqb5/vL+
	 1Co/zXgP0KhUazTrZrP5tpye5IMQ0GOuBWTlIfircuBY7p0yEmpW+xs4UWV+1k/j9F
	 GGua3mkzjiRKbBuDST+cigkqJLB2r0MMrnoWHYwcARw2KWWSpCiIC10kUkPS3ZP/8k
	 97Bm40C8UUnig==
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
	patches@lists.linux.dev
Subject: [PATCH 08/18] rust: proc-macro2: add `README.md`
Date: Mon, 10 Nov 2025 10:50:13 +0100
Message-ID: <20251110095025.1475896-9-ojeda@kernel.org>
In-Reply-To: <20251110095025.1475896-1-ojeda@kernel.org>
References: <20251110095025.1475896-1-ojeda@kernel.org>
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

Thus do the same for the `proc-macro2` crate.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/proc-macro2/README.md | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 rust/proc-macro2/README.md

diff --git a/rust/proc-macro2/README.md b/rust/proc-macro2/README.md
new file mode 100644
index 000000000000..af044fee4f59
--- /dev/null
+++ b/rust/proc-macro2/README.md
@@ -0,0 +1,13 @@
+# `proc-macro2`
+
+These source files come from the Rust `proc-macro2` crate, version
+1.0.101 (released 2025-08-16), hosted in the
+<https://github.com/dtolnay/proc-macro2> repository, licensed under
+"Apache-2.0 OR MIT" and only modified to add the SPDX license
+identifiers and to remove the `unicode-ident` dependency.
+
+For copyright details, please see:
+
+    https://github.com/dtolnay/proc-macro2/blob/1.0.101/README.md#license
+    https://github.com/dtolnay/proc-macro2/blob/1.0.101/LICENSE-APACHE
+    https://github.com/dtolnay/proc-macro2/blob/1.0.101/LICENSE-MIT
-- 
2.51.2


