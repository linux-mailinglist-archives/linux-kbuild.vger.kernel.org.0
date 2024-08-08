Return-Path: <linux-kbuild+bounces-2912-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F04DD94C6D4
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Aug 2024 00:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC48E2870EA
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Aug 2024 22:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42BDB16132F;
	Thu,  8 Aug 2024 22:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CZSNj4E8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0372615DBB6;
	Thu,  8 Aug 2024 22:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723155126; cv=none; b=BBWyp3anI9Iz3EjYX7tFrFjbTFZUX0iPSFQzdogsVWAnGQzQjz2H26gpFJw5TttqmXgWDUWaYE98TaU3zIxlfDkdha7mOai3BPWDPUzmZKCsPHLbuxITi42F2C5O3iI6xy/BjhV9NI1DBSV9f0xyv0i8MLD3Olr/TybGDUa5sFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723155126; c=relaxed/simple;
	bh=O4Sm2YagEseSl4nGQCa4p4TK8SrCAz9AxT6GFG1stRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SqlsQMlI3Dylo65bzg1FJw0rWSDQn/PpU/LfOeTwaOnlfi8xS8MejL6vBGNzQ4L9Mc8uitF/yiofhqtO8LTSOgOWLFYv2pCO+dAWk+jcpGVnRZgRF2sW5ZW2yQk0wf0O0o5vi4vY7jtIORtkleK4ao/UwFGbbDHqs+jL8MIL3Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CZSNj4E8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3AFCC32782;
	Thu,  8 Aug 2024 22:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723155125;
	bh=O4Sm2YagEseSl4nGQCa4p4TK8SrCAz9AxT6GFG1stRw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CZSNj4E8cKyHA0M4BmAqRq5dL4M22Jm906xGP8Qqqo7IEXPpIEWYWRbP+imLtPbC+
	 TYyQ+07kG+rOQ8b8uzqRH1E/k1i/7aEIBmky8nDJu7D7z53LvUx+oJ7qsCD+/1FGsC
	 uW2JB2MuQCI7I85hEDgjBo/i7HWDLJ9nEChV61mM5o7w/E60tcDYtIqm1ScLLf35n+
	 w4yQiZpGRn5qv4Dgy1ZkkcbihtSbwS5UVq/Kl9XG1rqtohXZgJrnRVcvRTZXrDPUsk
	 zzUqBL+irqZgp9eDCZT1V2wGiKs3kjPGyndUvjWMqvBqsW+mrQYq10e3apGekYeyTn
	 b+17TwDiRQyhw==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH 2/6] kbuild: rust: make command for `RUSTC_VERSION_TEXT` closer to the `CC` one
Date: Fri,  9 Aug 2024 00:11:34 +0200
Message-ID: <20240808221138.873750-3-ojeda@kernel.org>
In-Reply-To: <20240808221138.873750-1-ojeda@kernel.org>
References: <20240808221138.873750-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`CC_VERSION_TEXT` is defined as:

    CC_VERSION_TEXT = $(subst $(pound),,$(shell LC_ALL=C $(CC) --version 2>/dev/null | head -n 1))

Make `RUSTC_VERSION_TEXT` closer to that, i.e. add `LC_ALL=C` and `|
head -n 1` in case it matters in the future, and for consistency.

This reduces the difference in the next commit.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 init/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index 47e2c3227b99..2f974f412374 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1926,7 +1926,7 @@ config RUST
 config RUSTC_VERSION_TEXT
 	string
 	depends on RUST
-	default "$(shell,$(RUSTC) --version 2>/dev/null)"
+	default "$(shell,LC_ALL=C $(RUSTC) --version 2>/dev/null | head -n 1)"
 
 config BINDGEN_VERSION_TEXT
 	string
-- 
2.46.0


