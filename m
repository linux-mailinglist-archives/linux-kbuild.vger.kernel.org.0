Return-Path: <linux-kbuild+bounces-9487-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 991E2C45C4D
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 10:57:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1B38A4E7E3D
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 09:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D7D303A3C;
	Mon, 10 Nov 2025 09:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XZN1A7XW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738B0301701;
	Mon, 10 Nov 2025 09:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762768333; cv=none; b=J4iYR2P+UIbZLLA5Xs1FtrxL9Uq50kKNCNFL0Y9eArNp3uD1NJv67hPeaZaj+HxAHnngtqHrxtz5vpR3BiE7yzkeyDbANHbKYI2Jt44bPGFMg4oU6cJotMZytwmdA1LXtFNss4AhL7xDDHa5SQO1PH3OPkN3nQ1nai3jvX3Jork=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762768333; c=relaxed/simple;
	bh=o3btvzeHxMVgM0hJBQCMjEDCxNjsxB0EcAR+QZ0CiSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gIEO96psPeGxbOHyfNI9VXL9oD0rujIQCcOA3dd8KS1D3gzsRpD1TqrMHPAzp2vTeUrCbug4LpWgyoa0qqX6FEa1ogW4IZf6RIGQKelEvsO6qQ8K3BoZZkRjtJsWMtUf7MFuYZf0OWeiPVaQMvaG6Y3FLYv6jLgvDjx17bbcI5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XZN1A7XW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B9DFC4CEFB;
	Mon, 10 Nov 2025 09:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762768330;
	bh=o3btvzeHxMVgM0hJBQCMjEDCxNjsxB0EcAR+QZ0CiSM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XZN1A7XWFj23G7vnIdrtcEZkjpE6UwpoBu24VYxZPUUYhw4UEkTzMxqHa02hLDSxG
	 vQ3MBQItq3irA2UMEmeIBgRX5iiQzTRKqdW++6jFFoHoXNuGhvtuPNcBwbEqFCeoHs
	 ssL01MrWxHMBcxfz06XQwxXsH9Htv47x4hfU5PrgyLTTYg1iWlXZrNo7sgfwKBYM5U
	 qeTMWUneP9UiwhNlcRk4cFR5mDi+hJm4l2IhailTUf7MRtl5jUbeKR5/KZGhEbjCmJ
	 gnwrpKaCcWuKObrJcuKhqO+fRsKgKZnk1kK2fFxedcPaSgVuPbn58LRQmAbwHSCY9T
	 Z4D0Ufzu48w7g==
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
Subject: [PATCH 16/18] rust: syn: remove `unicode-ident` dependency
Date: Mon, 10 Nov 2025 10:50:21 +0100
Message-ID: <20251110095025.1475896-17-ojeda@kernel.org>
In-Reply-To: <20251110095025.1475896-1-ojeda@kernel.org>
References: <20251110095025.1475896-1-ojeda@kernel.org>
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
2.51.2


