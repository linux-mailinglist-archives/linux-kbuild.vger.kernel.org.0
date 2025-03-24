Return-Path: <linux-kbuild+bounces-6311-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E5AA6E54B
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Mar 2025 22:15:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 304ED3BADCC
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Mar 2025 21:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4216C1F709E;
	Mon, 24 Mar 2025 21:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AtatxKBw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E011F63EA;
	Mon, 24 Mar 2025 21:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742850294; cv=none; b=JO8dImo6/M/jdY0Vb/HDzAiSqset0Ps44ghf2RIGQyEqAMaYNAfO1inM8Q7zsgs9g/HlQ5zx1Pu6/enWFbcpxOVAA6uGkaxWhxxNJPudlNBiTlrZmW25R5/h1qm/2x+uhMxCqj9HzUGrTnO16Ff7wNZTU6a8rdITQ/kwDs9pRQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742850294; c=relaxed/simple;
	bh=IoWE258jBNh0ra+jL8hEbT1/vCRHyQAdmsEh1LGLEZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PCznK+hMQNdD0seNT4mDCGXBDJUX5pDp76fwTiAgbJ/OYgzM7MKa9NXGElFcSvFsrAZk690Szr3KUg1x7gQ01kctYyxfPdy34JO1mDvlPJ+tPNfnW1v5R8mS49uPc9SKokDJAQkv+fSptqepPJObp9LUdvTugW+iVQPQayizrjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AtatxKBw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19F2CC4CEDD;
	Mon, 24 Mar 2025 21:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742850293;
	bh=IoWE258jBNh0ra+jL8hEbT1/vCRHyQAdmsEh1LGLEZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AtatxKBwUWEFzs9NFsD5TDKT/oTA8vvrlwxDxjjAe5HH2OYZVu2NlD6SdKVLlPgLE
	 JP3rBeBRHA+CL9XJZKzKdtMO/yVGmm8lS4yU2T14kTBc/IxbWM1IZ+B5Z4IaZcxb47
	 MqBRNREidIjBaJZKGgD1sWMLa0RyxVIKYQJhOmfcmCwotJxhf5s4wyxxvHYoN7qS7i
	 ETfXt7id9HDNhCAhqkaZinlZarQdNG3gu+4gc3n8vQ+x8CEdo//KVCAGu5OTzSWkHj
	 +XTJpHJj9z3tbWqZB6gL94P254qID2RYsr9DVk5IemZku4cAxKdsjFQ7F58x3nNNEf
	 yjDS4NIBVCvmQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org
Subject: [RFC PATCH 10/10] rust: kbuild: enable `doc_markdown` Clippy lint
Date: Mon, 24 Mar 2025 22:03:57 +0100
Message-ID: <20250324210359.1199574-11-ojeda@kernel.org>
In-Reply-To: <20250324210359.1199574-1-ojeda@kernel.org>
References: <20250324210359.1199574-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clippy supports the `doc_markdown` lint [1] since 2016 [2]:

    Checks for the presence of _, :: or camel-case words outside ticks
    in documentation.

It is a very common note in Linux kernel reviews to mention that
documentation is missing a Markdown code span, e.g.:

    /// Length of the data must be less than data_size.

should have been:

    /// Length of the data must be less than `data_size`.

This lint can identify some of those cases automatically for us.

It also caught for us other typos or mis-documentation, such as a missing
code block.

Thus enable it, now that the tree is sufficiently clean.

Relatedly, it would be nice to have something similar [3] even for
comments (not just documentation), as well as for possible intra-doc links
(which should also have less false positives).

Link: https://rust-lang.github.io/rust-clippy/master/index.html#doc_markdown [1]
Link: https://github.com/rust-lang/rust-clippy/commit/42bf37f49f49829507be4f2dfd6c5db9b8234b66 [2]
Link: https://github.com/rust-lang/rust/issues/131510 [3]
Link: https://lore.kernel.org/rust-for-linux/CANiq72=aVRMvOaU48DBLL=p+VoG3RvHK+K48XQhvHw3ARc0BNg@mail.gmail.com/
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 .clippy.toml | 4 ++++
 Makefile     | 1 +
 2 files changed, 5 insertions(+)

diff --git a/.clippy.toml b/.clippy.toml
index 815c94732ed7..adc32c88176c 100644
--- a/.clippy.toml
+++ b/.clippy.toml
@@ -9,3 +9,7 @@ disallowed-macros = [
     # it here, see: https://github.com/rust-lang/rust-clippy/issues/11303.
     { path = "kernel::dbg", reason = "the `dbg!` macro is intended as a debugging tool" },
 ]
+
+doc-valid-idents = [
+    "KUnit",
+]
diff --git a/Makefile b/Makefile
index 70bdbf2218fc..5d6baedc097f 100644
--- a/Makefile
+++ b/Makefile
@@ -477,6 +477,7 @@ export rust_common_flags := --edition=2021 \
 			    -Wrust_2018_idioms \
 			    -Wunreachable_pub \
 			    -Wclippy::all \
+			    -Wclippy::doc_markdown \
 			    -Wclippy::ignored_unit_patterns \
 			    -Wclippy::mut_mut \
 			    -Wclippy::needless_bitwise_bool \
--
2.49.0

