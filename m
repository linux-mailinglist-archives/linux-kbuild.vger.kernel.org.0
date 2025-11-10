Return-Path: <linux-kbuild+bounces-9478-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB08C45BD5
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 10:52:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 649CA34069E
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 09:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC30303A30;
	Mon, 10 Nov 2025 09:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QK4o4fqH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4F4301025;
	Mon, 10 Nov 2025 09:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762768290; cv=none; b=MsRE2M4jaYlcj60phlsafOPK9CPkZYA604TwHRKVXOKaQnwdz9YJSr9q5HCIPpBM9SqhUo6Zls1rQRIAANXrqmXC/e9twNQ0/+63l1dXGSXCxcN9zF8hizi4/325y1vMSFgFqBFLdEcLeobCuOX9Q3V03r/N+tWDG3c4IvtuLSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762768290; c=relaxed/simple;
	bh=tWfkCbupFVNsryHxEbfKiWzO8HQ7q9nn1fdIpeR+2mY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iBrnw0da/BAoHkbTcK2AinF86PiQ7YXybakMqWATgar4wnILYZVVgdhDM+RjUa/ZK+c+SdGuufu3AsxeH7Xh9h9JRLtUSHTtGB3sbgZHHpbwRWP8FpcHV4POPMXolBTA2vUXgr83oGr2ftWaB9xxZkYu6fwA5GtGLRNiWPUqWaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QK4o4fqH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F64C16AAE;
	Mon, 10 Nov 2025 09:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762768290;
	bh=tWfkCbupFVNsryHxEbfKiWzO8HQ7q9nn1fdIpeR+2mY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QK4o4fqHORPgpcQLm8NTIsIuSlQ8zMd+Pj+GE080eY4YSXlIJcDaWL3FeRPIWAjAr
	 7uYWYk42WlaMkOc9kpGDrkcOVZ/dqqHm6ozbnTRqHmq6QACXyOueZMjuP6ZxhLEJ4c
	 MGsSRzBzhV/t1h5+NgYb31YE3WBf65TD1y8Ysuau4L66jdbLzZPggm0cqv8Z+sLkoK
	 Shns7E/+jTtFFoob7HZnaTe8PY8yo8BmuoKCxpkZ9H5N/JbQRWZWOidDzCN4MTSm/2
	 H1kcvj42uPQPBINUZWRuu4xt+yELe4qgPDLQAGtbLf0y4S1aASu4FpO/TRpSwthKlZ
	 XnxKrCQ23ze9w==
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
Subject: [PATCH 07/18] rust: proc-macro2: remove `unicode_ident` dependency
Date: Mon, 10 Nov 2025 10:50:12 +0100
Message-ID: <20251110095025.1475896-8-ojeda@kernel.org>
In-Reply-To: <20251110095025.1475896-1-ojeda@kernel.org>
References: <20251110095025.1475896-1-ojeda@kernel.org>
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
2.51.2


