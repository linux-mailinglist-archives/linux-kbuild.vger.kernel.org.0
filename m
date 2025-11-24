Return-Path: <linux-kbuild+bounces-9805-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EC5C814A9
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 16:20:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B9C4C4E122B
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 15:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88B753148BA;
	Mon, 24 Nov 2025 15:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EN8mRtu0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5915231355A;
	Mon, 24 Nov 2025 15:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763997554; cv=none; b=pPQ8Jj97As9zVFTf+iaNY/B5+S3HvLSoHqFUu/ZYDGtTLvXMe2Ma1YbKs/OVBqI8IymF5i6pFNU66NLX3tq83p65mXxe1Zj2CL0sb8Nu8oKpsUG7i6MKSGHjWJaYF2HFRzNql3EUOoa+vEr6vblPufQNKNDXLXH61T51Z+a+jR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763997554; c=relaxed/simple;
	bh=2rKN1/YUZ7uLwEL6BZnfvfhRWHuJSYRLW4VPV/aKGc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kCWi1CfniKYkhGWABbaCEMzOg10M/1HAF66CePoX421wN49Mho0Cm5n/uoFpMaV7txSSs/iRgpHCj+LHaA8ZvXiPTrRTZUPJXdblmD6U7a/S1pWer5tUU2FCCkUlb2qSOosp8CeHtq706V8vBMOP9DS4p8iQCjmdl6fgm54d6Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EN8mRtu0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21400C116C6;
	Mon, 24 Nov 2025 15:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763997552;
	bh=2rKN1/YUZ7uLwEL6BZnfvfhRWHuJSYRLW4VPV/aKGc8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EN8mRtu0ItyWhuV7lVKp+N8BjQtjfGAWr2JcN2TSqODxPS4FvE6TpOhtB9W276j5V
	 TWLEBZqc4kRiciyL3gGLXipwiHCwZJDZ5YZ0d1ZvRWN1DEnr/srOW2KT3Isif4wBb9
	 E7+4+6GtKocqGINJYOy4thb3a+C/sZR6RUjCdvqLQQMAeRaRaMlyYM4dnothJ040Z6
	 yaKaAUYniA70rfzog14HTeZmVsSvYf8Hg8ekrn1LnjjbJ4N9optv5Dpyrr+o3nlaj8
	 ULU23ypnODG9oBubWqwBZmqsul44lYL3kayxJcwNTsFB3A6NoxBYaJg/2OBCDXhZsw
	 CwVYDavfPcb4A==
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
Subject: [PATCH v2 03/20] rust: kbuild: add proc macro library support
Date: Mon, 24 Nov 2025 16:18:15 +0100
Message-ID: <20251124151837.2184382-4-ojeda@kernel.org>
In-Reply-To: <20251124151837.2184382-1-ojeda@kernel.org>
References: <20251124151837.2184382-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the proc macro library rule that produces `.rlib` files to be used
by proc macros such as the `macros` crate.

Reviewed-by: Gary Guo <gary@garyguo.net>
Tested-by: Gary Guo <gary@garyguo.net>
Tested-by: Jesung Yang <y.j3ms.n@gmail.com>
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
index 9967f3457d44..45ef84513b6c 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -421,6 +421,16 @@ $(obj)/exports_bindings_generated.h: $(obj)/bindings.o FORCE
 $(obj)/exports_kernel_generated.h: $(obj)/kernel.o FORCE
 	$(call if_changed,exports)
 
+quiet_cmd_rustc_procmacrolibrary = $(RUSTC_OR_CLIPPY_QUIET) PL $@
+      cmd_rustc_procmacrolibrary = \
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
2.52.0


