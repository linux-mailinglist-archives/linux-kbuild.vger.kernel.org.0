Return-Path: <linux-kbuild+bounces-9810-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 46531C814C8
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 16:21:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 677B734758B
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 15:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB21E313E3A;
	Mon, 24 Nov 2025 15:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qt03R+Tc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9683148A3;
	Mon, 24 Nov 2025 15:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763997574; cv=none; b=HSq6/1/+x3TmESPn+saBwIUq8FBfp3HIen+GzolfSggvOTxRJ2A01E8af97Bj4PXMpwlZSNtXat+rA3K3E3nCYrhEZMw/0Pa1T39dxEtMjATO5TwkxKZNvP6OvQG/pPwmF6Tnzp0w4GFGlKnNliDt2BFapldVhP3XBCR8011Skg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763997574; c=relaxed/simple;
	bh=qP8H4KbldX4ym0wDH2ARhCFeX0lZaVOw4pNpCrhYCM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CGDzrxac1TrEtatYQZIh91Zgc7zUyxnNDgBmPCQxYI7eq8iy3JfdQMO77cWS5hF7aunFeakbXt3KQui3tptlnykLOJaXd6vyvR7K3uycZToBLBzEy5N8yXz2L4OiE7H7xbYz/uBZAdt30A4g8s8IE3BTgXOSNYnYYCzZeqik1to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qt03R+Tc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F99C116C6;
	Mon, 24 Nov 2025 15:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763997574;
	bh=qP8H4KbldX4ym0wDH2ARhCFeX0lZaVOw4pNpCrhYCM4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qt03R+TcoCq02jXyWc32Z+65gxQd18fX3aF7hJYZI7j+5qw+sIHOSUlP07iUcK1Sd
	 L6FCEvpS18PlsFYPVNfONW5U9JcXnMRFrf6tcyLiyYreQvRSJHQHWlBdrIglCWT/+a
	 SEWIz6BugePvrKsBKVRZwNqkSpRaVQKkn0Xc+Y2XG7WrqEEq1JItr2i003EI0ODMpn
	 PF8GB5jFC4CuUwPkLwVVnki8UW6KMPDLzAF0qvcG5ID3B5ooBQRiuyD99axW/ASEuJ
	 bT3FSCODZ55dtQHVhiWeWOmp9TaDheWf0HAEsHvkeSKxZByQFqaXIEeoChfbMaiiEM
	 COlTzQ0uTq/Rw==
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
Subject: [PATCH v2 08/20] rust: proc-macro2: remove `unicode_ident` dependency
Date: Mon, 24 Nov 2025 16:18:20 +0100
Message-ID: <20251124151837.2184382-9-ojeda@kernel.org>
In-Reply-To: <20251124151837.2184382-1-ojeda@kernel.org>
References: <20251124151837.2184382-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `proc-macro2` crate depends on the `unicode-ident` crate to determine
whether characters have the XID_Start or XID_Continue properties according
to Unicode Standard Annex #31.

However, we only need ASCII identifiers in the kernel, thus we can
simplify the check and remove completely that dependency.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Tested-by: Gary Guo <gary@garyguo.net>
Tested-by: Jesung Yang <y.j3ms.n@gmail.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/proc-macro2/fallback.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/proc-macro2/fallback.rs b/rust/proc-macro2/fallback.rs
index 9e005d67f7f5..9b43c97df97a 100644
--- a/rust/proc-macro2/fallback.rs
+++ b/rust/proc-macro2/fallback.rs
@@ -818,11 +818,11 @@ pub(crate) fn set_span(&mut self, span: Span) {
 }
 
 pub(crate) fn is_ident_start(c: char) -> bool {
-    c == '_' || unicode_ident::is_xid_start(c)
+    c == '_' || c.is_ascii_alphabetic()
 }
 
 pub(crate) fn is_ident_continue(c: char) -> bool {
-    unicode_ident::is_xid_continue(c)
+    c == '_' || c.is_ascii_alphanumeric()
 }
 
 #[track_caller]
-- 
2.52.0


