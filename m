Return-Path: <linux-kbuild+bounces-9819-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C33E5C81521
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 16:26:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8378F3476B2
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 15:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A7331960B;
	Mon, 24 Nov 2025 15:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G55L7r56"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8943195FD;
	Mon, 24 Nov 2025 15:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763997612; cv=none; b=huPimCicfCapmG5CpVg6HhdUnG1D3DMxZewrC1xpstbEkj2mosGI/uRhrJRDL7mSaSUgoJA/ozw6Alop5EFR9Dyv/jlUXKmZgGyPs5h1j7hkAAIn0cFb9Jx2bTh3bzaOR4VC8fWPlOd45UWSiDRApJ/b/TSo3/oPheFHVJK/Jdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763997612; c=relaxed/simple;
	bh=D2S0ouWH849R7NOGN8xKYNqOgZEgmjueqlA2ePRmjxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R5Iq/NGZE5dOr76xW5CdmdbkD0LOgOwNz7mUqD1kYJvZykDTss6WTmDwzKBdLj9Ni5IMu6+yviyKB/3FPerDrfcBA00UQAi8H+h1DnI7SNY71JStSDC19eOysfQivo0X0dqXxH5ZkxxIxEeTnIth9guxyVpNWRWQPqU92NbxnE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G55L7r56; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFC92C116D0;
	Mon, 24 Nov 2025 15:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763997612;
	bh=D2S0ouWH849R7NOGN8xKYNqOgZEgmjueqlA2ePRmjxw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G55L7r56BbRvdRee0/lCAhYLQuCgL1wdptQ2bgKH5NiugUqj0wXOhjEEF4GZvDl46
	 2pkufAsA6na/vC33lVjTe+w0+zj3wUVdkpEu42HmLmyHlWzvLMcatAPpFxQjZ4f7MG
	 6R9seQf3kLFxFqQrMfCSWduHR50odTh3AGf6bDM4pQR7ZP3TQ3uLw5OJbhdTXqUqwN
	 x97925yIVL6eU5p23CV1NnT3dfUD80kNQP72RQbpcdpJOUb6qKXMjJMjpB0mojJ8rO
	 oBPhNCua8RJsCHX7PBOs2YxHdFGYY2ZY3dd6wZvSSKGJkOPMi4rB8s28z77xB3X+un
	 QUdTlK9jx44Tw==
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
Subject: [PATCH v2 17/20] rust: syn: remove `unicode-ident` dependency
Date: Mon, 24 Nov 2025 16:18:29 +0100
Message-ID: <20251124151837.2184382-18-ojeda@kernel.org>
In-Reply-To: <20251124151837.2184382-1-ojeda@kernel.org>
References: <20251124151837.2184382-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `syn` crate depends on the `unicode-ident` crate to determine whether
characters have the XID_Start or XID_Continue properties according to
Unicode Standard Annex #31.

However, we only need ASCII identifiers in the kernel, thus we can
simplify the check and remove completely that dependency.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Tested-by: Gary Guo <gary@garyguo.net>
Tested-by: Jesung Yang <y.j3ms.n@gmail.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/syn/ident.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/syn/ident.rs b/rust/syn/ident.rs
index 2c4b56505bec..03ccebf9c022 100644
--- a/rust/syn/ident.rs
+++ b/rust/syn/ident.rs
@@ -39,11 +39,11 @@ fn from(token: Token![_]) -> Ident {
 pub(crate) fn xid_ok(symbol: &str) -> bool {
     let mut chars = symbol.chars();
     let first = chars.next().unwrap();
-    if !(first == '_' || unicode_ident::is_xid_start(first)) {
+    if !(first == '_' || first.is_ascii_alphabetic()) {
         return false;
     }
     for ch in chars {
-        if !unicode_ident::is_xid_continue(ch) {
+        if !(ch == '_' || ch.is_ascii_alphanumeric()) {
             return false;
         }
     }
-- 
2.52.0


