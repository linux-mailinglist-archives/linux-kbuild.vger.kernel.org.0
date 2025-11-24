Return-Path: <linux-kbuild+bounces-9811-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF2BC814CE
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 16:22:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 983614E6B4F
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 15:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6595315D44;
	Mon, 24 Nov 2025 15:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AiunD9dZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C30313E29;
	Mon, 24 Nov 2025 15:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763997578; cv=none; b=NudYrb4BxDFR5mhDUiCFzQE6ny2CKTzWNTgMTl88ikR8AR7KGrzPCPeU8QqOCf6pmwViinq2hGT6BiHQkX4rEyQYi98nt19RypoEVJTPDiGyP385fep1BEdgJ+cLL8kQCrTYl6BpRW4CuM61Lq/77gfgChDuIldLMHjFpHYaz0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763997578; c=relaxed/simple;
	bh=QyWf6un0iyXwuZhP/q/B/xBsbhhCsZajTwpxBQ7zkoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Is2IY5202ph+IGQt7Rt36AR2gU0R86EC5I0tf1mb92orbkskKlAG86Romvqu2TjedtrLgCzZFJc9/mLHIVQKxpcn9i1Pp5NGIiEVpDh1+rIqmfePdWzKxG/wByq/96YyxGpFE6Nj68/TImKKgtGGsGhTkkBC9p2afJACbyz2CMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AiunD9dZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95DCAC116D0;
	Mon, 24 Nov 2025 15:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763997578;
	bh=QyWf6un0iyXwuZhP/q/B/xBsbhhCsZajTwpxBQ7zkoE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AiunD9dZAV6vODOPSjFHDCD67itnOpSv/FwyHLi1yETRHs9AJSdRwjvKGTSHOIXRE
	 SXpv9U5ZDFzeK+ED+fEfG0SnLRmlppoyZteYhhdhxPXpPZ0ip9v/9ncm6QyZhjRX79
	 VWJwxExJYUdRIEqSYN3p8pvzKTwIBETIJdLjWJGc+8Qorb32hyVHCIXbuM8JXAbZhK
	 dEPL4ZAK5qr/4kE/KOYgKyfRONcx2MZoq+Fpej7pdCnoCHvIrnIS+dylXx2vNkEqVQ
	 N2rIWxIz6nQRPkn+RsQ0ne4c8aY5lLkjqApNXovaXg3c5opPDufEHuXNJ3tKh/ttUh
	 ZV7nPcemqIEgQ==
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
Subject: [PATCH v2 09/20] rust: proc-macro2: add `README.md`
Date: Mon, 24 Nov 2025 16:18:21 +0100
Message-ID: <20251124151837.2184382-10-ojeda@kernel.org>
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

Thus do the same for the `proc-macro2` crate.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Tested-by: Gary Guo <gary@garyguo.net>
Tested-by: Jesung Yang <y.j3ms.n@gmail.com>
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
2.52.0


