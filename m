Return-Path: <linux-kbuild+bounces-3327-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 179D6968C88
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Sep 2024 18:57:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B737D1F22EA2
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Sep 2024 16:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CABB021C16C;
	Mon,  2 Sep 2024 16:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DhV9QAuM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949051C62C2;
	Mon,  2 Sep 2024 16:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725296187; cv=none; b=m0gtRNK3r8lLwQZWxKvAi4YOY3P9tTc+EKiNmYw/OrbApifg/aU3HzdD2C+CsDWWqx8D9X00DqSNpNXDT5e5jp+ZxNtxQ3pVrGC4/P5Rxxi8yfYvfNSR4ZuBww8NDoM8pT49h0DYfbdrfnCnp1+WAp2CYYo+L1hXRfQMRNConrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725296187; c=relaxed/simple;
	bh=EQDbaMna4Ean8/5H5hVqMKDCp1htA8sUKuu5IvS7JnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KN1fImQui454O3OkW/D8e0hRsw/woJ/MXGo9CwKVva2Pmn/f5VKxD8/IsMaMwo11Ql3kydlHY99+6efn+yuIavZc5X7l1Uqbhcat3GmCJCwYKl/W7ucrLeLtHORwsrBpZq2YA30tn8xBWP8+pTlCf4M2gaob52x8lphY0jpCBrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DhV9QAuM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0759AC4CECB;
	Mon,  2 Sep 2024 16:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725296186;
	bh=EQDbaMna4Ean8/5H5hVqMKDCp1htA8sUKuu5IvS7JnA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DhV9QAuMAexluc+NmF+GNVpPnho0V4yVjEBbQP44bHXYuV8p8nfcsLPSMtJ8exhvR
	 XJR+KbFetLZ3mDiw+jAy3amRt2hFasj/17i38HhDP1bmn2/9oqICsqEkSWSHMjl2HJ
	 NiQ1EJUgu3O2IQrWQBJ4lBrMxYvaVzCvrBIfbjngLHWidWo4NinTl7CCJhZRB0lbYY
	 tlg2A8PbLsdUiVutJHgDJEWiWgTF8EYUQ9gbSFhCFZzTVXe16++SRxd0v27tii/A6q
	 LBe6n2HS0bS+9gpnt8WMh+qtk6+fbZMPa+DjDjugRCDAgRpcuZAAsbf2KtbjnZtRES
	 znOLWbwPw88Yw==
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
Subject: [PATCH v2 6/6] docs: rust: include other expressions in conditional compilation section
Date: Mon,  2 Sep 2024 18:55:33 +0200
Message-ID: <20240902165535.1101978-7-ojeda@kernel.org>
In-Reply-To: <20240902165535.1101978-1-ojeda@kernel.org>
References: <20240902165535.1101978-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expand the conditional compilation section to explain how to support
other expressions, such as testing whether `RUSTC_VERSION` is at least
a given version, which requires a numerical comparison that Rust's `cfg`
predicates do not support (yet?).

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Documentation/rust/general-information.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/rust/general-information.rst b/Documentation/rust/general-information.rst
index 2d76e09da121..6146b49b6a98 100644
--- a/Documentation/rust/general-information.rst
+++ b/Documentation/rust/general-information.rst
@@ -151,3 +151,11 @@ configuration:
 	#[cfg(CONFIG_X="y")]   // Enabled as a built-in (`y`)
 	#[cfg(CONFIG_X="m")]   // Enabled as a module   (`m`)
 	#[cfg(not(CONFIG_X))]  // Disabled
+
+For other predicates that Rust's ``cfg`` does not support, e.g. expressions with
+numerical comparisons, one may define a new Kconfig symbol:
+
+.. code-block:: kconfig
+
+	config RUSTC_VERSION_MIN_107900
+		def_bool y if RUSTC_VERSION >= 107900
-- 
2.46.0


