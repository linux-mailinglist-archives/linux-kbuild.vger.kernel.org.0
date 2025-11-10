Return-Path: <linux-kbuild+bounces-9475-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB72C45BDE
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 10:52:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3228B4EC202
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 09:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 372DF302CB5;
	Mon, 10 Nov 2025 09:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JrXxmSva"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A82B301716;
	Mon, 10 Nov 2025 09:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762768278; cv=none; b=CJeIpntMH64i17oZLXnJKTUB7/18Ty2UQRFbYCc4FXrDyzAuUDdvrIMXuNFU6ePVauxwrvz6NrrmjgqTPj4U++Dpw8aIIjefdUatKRf+vTilO1YgGFiKh8jBwh+lt3C4VauosLDdz7If6BvXt6mDCq0pcBcVjP9CZwci7+XFTtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762768278; c=relaxed/simple;
	bh=vWzASr40oPMKpybQrqtVKlDHI8DOPT0mdIbwpVgZlV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IB0gUzZOAIdhqLjChyL2jtZmoZKd34BqCoyZzwC+j5dj2DNlWmaHN6D7AXpLdIvycJCtrt4XYoSQruxPldgcBHIwMUKyqDkp2GTuA6kgS28fYWbqKm+gpO/SgzGPS3iRgYGiXosZgkDWVrd6oyME2QHm4zWs2KlWAk34qARy7lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JrXxmSva; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFCD2C4CEF5;
	Mon, 10 Nov 2025 09:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762768276;
	bh=vWzASr40oPMKpybQrqtVKlDHI8DOPT0mdIbwpVgZlV4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JrXxmSvaggSYEnc1eCNhKSwsYzrKVV3oF+fEFa0Redo1MNybvKfzX43SaQV/nEbo3
	 DLAJZdpNe13r2ITrTMtqQuccwMeVJ5gLO8FAtF353Y/6f6HuOtds/esDeO+U2+U2C8
	 dcMO5ZW4X4BQwA6aXO/GXMU9RHK3iCSkLEaXmFNk7z9FUquXNfoSUxuEE9rwxlGEQ3
	 BSBlFnp2DTgRrG9SqWeWlG6q/sHZVT6AuvFPPaAz8XajLjLb5ghhArbI01D+coFXq+
	 XqnnsBqhEKaICJSvKeJ9HY9M2NlBoQqtYyJeT4HZfPPqldY8w4RiyZAQ8QnKM3QGzu
	 0edsiHQYREQpw==
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
Subject: [PATCH 04/18] rust: kbuild: add host library support
Date: Mon, 10 Nov 2025 10:50:09 +0100
Message-ID: <20251110095025.1475896-5-ojeda@kernel.org>
In-Reply-To: <20251110095025.1475896-1-ojeda@kernel.org>
References: <20251110095025.1475896-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the a host library rule that produces `.rlib` files to be used by the
`macros` crate.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 .gitignore    |  1 +
 rust/Makefile | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/.gitignore b/.gitignore
index 86a1ba0d9035..3a7241c941f5 100644
--- a/.gitignore
+++ b/.gitignore
@@ -41,6 +41,7 @@
 *.o.*
 *.patch
 *.pyc
+*.rlib
 *.rmeta
 *.rpm
 *.rsi
diff --git a/rust/Makefile b/rust/Makefile
index 7efed88d032c..9eea6563ef35 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -430,6 +430,16 @@ $(obj)/exports_bindings_generated.h: $(obj)/bindings.o FORCE
 $(obj)/exports_kernel_generated.h: $(obj)/kernel.o FORCE
 	$(call if_changed,exports)
 
+quiet_cmd_rustc_hostlibrary = $(RUSTC_OR_CLIPPY_QUIET) H $@
+      cmd_rustc_hostlibrary = \
+	$(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
+		$(filter-out $(skip_flags),$(rust_common_flags) $(rustc_target_flags)) \
+		--emit=dep-info,link --crate-type rlib -O \
+		--out-dir $(objtree)/$(obj) -L$(objtree)/$(obj) \
+		--crate-name $(patsubst lib%.rlib,%,$(notdir $@)) $<; \
+	mv $(objtree)/$(obj)/$(patsubst lib%.rlib,%,$(notdir $@)).d $(depfile); \
+	sed -i '/^\#/d' $(depfile)
+
 quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
       cmd_rustc_procmacro = \
 	$(RUSTC_OR_CLIPPY) $(rust_common_flags) $(rustc_target_flags) \
-- 
2.51.2


