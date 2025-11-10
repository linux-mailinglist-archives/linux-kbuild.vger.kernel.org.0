Return-Path: <linux-kbuild+bounces-9488-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 003A8C45C2B
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 10:55:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7D063B49BF
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 09:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A15EE306B39;
	Mon, 10 Nov 2025 09:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qapKnB7r"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72785305E2B;
	Mon, 10 Nov 2025 09:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762768334; cv=none; b=bsabRmvp8DPxcmfTF+fhho31gDXNGLL931Kij8REkkeYkKyE2sb4wZXfYcO44eIAsqSm7epgwYIeyWlNWriEIIGgwA3a4NqA+11oXIqFd6R44Zi4aZej7fMtmW2skLx4Q77UvNc38IWuxgDPMXmLZB4jpdoMRp2zZEV8S8s4GhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762768334; c=relaxed/simple;
	bh=DTF8yarDbQf1fMGwrVCjWLkS/7OIg2XBmftIbWHMux4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=STcdPtu5Cbds+HM7ySTklKWKSK5npXXIbei3NtqiOaUowCeIcLj/4cCouxevMXrs9k++EiIhzBEOSolET7ZPmXSL1Kg/WsrTtnFCpN4iyN0m7qiaLRd34fhY2vqbpQMGOO1nhqpQ8RQN+UYIERBg/mb24DypRjTKYSQ5f3RRQHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qapKnB7r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84E9CC4CEF5;
	Mon, 10 Nov 2025 09:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762768334;
	bh=DTF8yarDbQf1fMGwrVCjWLkS/7OIg2XBmftIbWHMux4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qapKnB7r/kbRSb/2SbwUcp88yrOQ4+wbxvNdmwyzeOAmVVA5Vf2WBkWormaQ21rjT
	 Sjf37rg3F1N1GfRLTkcGpZHIdkzPpxR3XBPb6VBK8DavzNUP/QJ2If4mT80d+Ju9DQ
	 kobLsz+6J/WB4d6U7i2D2w6+sDHkd7abQaAUNKB7OWgIlTwGwNqXD2CzbMNhdV5fwr
	 o6GPPsYjkueOhxOuel3OVjn+6znU24muEMRb7DBWf6tEX8IvgtTRyejvbogZ1CFI7h
	 61ED7LiuaWlhHFxCq9FHqrTy7QSCDj2NpbAXKehe8Fpgl7ocDNHyfJEs8cnblM3Rku
	 BOH4TKu0i+6Yg==
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
Subject: [PATCH 17/18] rust: syn: add `README.md`
Date: Mon, 10 Nov 2025 10:50:22 +0100
Message-ID: <20251110095025.1475896-18-ojeda@kernel.org>
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

Thus do the same for the `syn` crate.

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
2.51.2


