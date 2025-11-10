Return-Path: <linux-kbuild+bounces-9483-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DACC45C22
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 10:55:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0992C4ED6F8
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 09:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 956D13054CC;
	Mon, 10 Nov 2025 09:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MaRbf9TH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48426305066;
	Mon, 10 Nov 2025 09:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762768312; cv=none; b=VSehuc2E1nJup8UrP4Sqbc6qwt5d4vNwQys98RwQBcDf2INJkgS1ZlixPJNB+x7lgry829LoMP4dG3a+9S16DibQHPB5Hoauc85hpMfBbFCIaF3mwL+r6DK8Ur47w+UAqgbdv7pSjneV0bSVdioLSLhLSCT6i/9V8saKwLgyxRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762768312; c=relaxed/simple;
	bh=LLfvj6izedow/s0Vpg/NtksqMr3Iwp70wHryYY4a3fI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XxhlvNB+s/ZwdF2Gn+s5n/uruhGMFm+GI3FusJWg2Mr8WaZviedPi5zLjbe9kaZZmpjUfIOdOSquWUSw+kh5ikElt+Bq6sQFCqH2i1oHMKyVwB57SMTIu9xdWJYPQuUKwezryT5gGavHV+cnU/NkavT9y7anWonyYX+pNoZiL6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MaRbf9TH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 322DCC19423;
	Mon, 10 Nov 2025 09:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762768312;
	bh=LLfvj6izedow/s0Vpg/NtksqMr3Iwp70wHryYY4a3fI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MaRbf9TH6j2t2zMJRTF/HbOqL+lOmkPTVIin7Ly9atiivN6MLwoH8Xe/oH+iR2ory
	 Mu0FMBqqJrLZJLJJUVGCmgkUFcAP6CN/wXXQVYm91XsmylUIIdnRFfy2gJ1dh1mfeV
	 qqJSeDuK1P8RouuvkwDGADKzyp4+EcOuNvaePjSynLzHHskbs9pwYm2nSpTymY9zwv
	 mvVRp+2FZwhhFdt/ea7loguV/VJ/R9cEWDYeKcqAZkLR4hcLdcgEUpG4sr4rXpJZVr
	 TSdZ1MI9an230G4Qo3BFLChgobBw6lrkfpi9mDetjEpe3q6uHINgTyWRL1qCTUa93b
	 +r46ppbCxL7rg==
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
Subject: [PATCH 12/18] rust: quote: add `README.md`
Date: Mon, 10 Nov 2025 10:50:17 +0100
Message-ID: <20251110095025.1475896-13-ojeda@kernel.org>
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

Thus do the same for the `quote` crate.

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
2.51.2


