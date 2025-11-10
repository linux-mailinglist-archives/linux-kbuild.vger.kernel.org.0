Return-Path: <linux-kbuild+bounces-9472-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBA7C45BBF
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 10:51:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BF36E347BB1
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 09:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 196393016F0;
	Mon, 10 Nov 2025 09:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ux22aoaS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEEB2FD1C1;
	Mon, 10 Nov 2025 09:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762768264; cv=none; b=j4cQ9n/TRXWttyPPKPxogR3VrDmN1Y2jeLXJ5oHZaGDHzk/nTEFv8dj2OzggnbdCm21bfKSspHmpGhG7ZW/elaTTZUe1P8kZOeLgDPLxouR8/O9DabJuE2PXDvCrdXxYX2GsOm6CY7NwcXo/izFmVVPNkABhLGK4Ry5MjO1R2J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762768264; c=relaxed/simple;
	bh=2uSW557qk19ay+6J3wkBhz9NRcZp4GtFhvWznt7cnJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eKktWSDTRxLdJDmrKWC69WsfUVi4f4kpO5UTnSRaxKxRggLV0VWTXi8/Tn80Zs67FfJaFPqa4Otdl/bb1vFKpYsuKyVqM8uy1iU9nd3YEhgermZjk/M5N0sUdkgQUznFCNLqswGDtVb77sEMtyOPd4LJxsy6YvcI7MMLNiwOUG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ux22aoaS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82BBDC116D0;
	Mon, 10 Nov 2025 09:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762768263;
	bh=2uSW557qk19ay+6J3wkBhz9NRcZp4GtFhvWznt7cnJ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ux22aoaS/j0rfu26bnUzZ9d9iWSVDDieW/7ElS7X1adVJCDZRUOUuosCqb1055SBE
	 WuluEcLLPkIgdclzZ/eHDIYWJKjgSIo9JBNaMRt1ZxtZnUExsCyJ5VAmitI0N30Ok+
	 p+KM3LJKLVQ3H5khpEuS6/xUZUqw3l/5XKQxgUfggMn8FIVAKwXr7YO4x006uJMZWX
	 gNk51qSnoLB6xsohQelCh6mxN75qgM7dI8cb5nEDsZzqZqS3mJkSuSnTCRdug4XmGT
	 myYavHqVBQ0bXeuXviZZqcaIohRa0aYqxKKjM35ZlP/myjdSnEv19a2hXUc53AsCM7
	 0Fdvbj4dYKSBA==
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
Subject: [PATCH 01/18] rust: condvar: avoid `pub` in example
Date: Mon, 10 Nov 2025 10:50:06 +0100
Message-ID: <20251110095025.1475896-2-ojeda@kernel.org>
In-Reply-To: <20251110095025.1475896-1-ojeda@kernel.org>
References: <20251110095025.1475896-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The future move of pin-init to `syn` uncovers the following unreachable
public item in an example:

    error: unreachable `pub` item
         --> rust/doctests_kernel_generated.rs:14683:1
          |
    14683 | pub struct Example {
          | ---^^^^^^^^^^^^^^^
          | |
          | help: consider restricting its visibility: `pub(crate)`
          |
          = help: or consider exporting it for use by other crates
          = note: `-D unreachable-pub` implied by `-D warnings`
          = help: to override `-D warnings` add `#[allow(unreachable_pub)]`

There is no real downside of keeping the example as-is until the
`syn`-based pin-init is introduced, so there is no need to treat it as
a fix nor to backport it. However, we still need to change it before
introducing the new pin-init.

Thus do so.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/sync/condvar.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/sync/condvar.rs b/rust/kernel/sync/condvar.rs
index aa5b9a7a726d..1e66e9f548a3 100644
--- a/rust/kernel/sync/condvar.rs
+++ b/rust/kernel/sync/condvar.rs
@@ -46,7 +46,7 @@ macro_rules! new_condvar {
 /// use kernel::sync::{new_condvar, new_mutex, CondVar, Mutex};
 ///
 /// #[pin_data]
-/// pub struct Example {
+/// struct Example {
 ///     #[pin]
 ///     value: Mutex<u32>,
 ///
-- 
2.51.2


