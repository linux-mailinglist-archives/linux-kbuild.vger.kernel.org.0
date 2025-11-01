Return-Path: <linux-kbuild+bounces-9347-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F74C27AEE
	for <lists+linux-kbuild@lfdr.de>; Sat, 01 Nov 2025 10:40:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B86E3B8C0A
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Nov 2025 09:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08382C21D0;
	Sat,  1 Nov 2025 09:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X4nu1emX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEA12C15B8;
	Sat,  1 Nov 2025 09:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761990031; cv=none; b=gvCAvLdwIwNyEodnrzD7P8kdr0/2v+l7BVk8OEu3j8JMUaENKv0DafrOnYcARJz74Gi5ksSofGCzxCdCGIJ+uJoGVDr9Mobcv67TRTWGSEG199kIyWoGOkMedrxQcl62ybhedEdIEZOgnnA9ASvwimH1a33EWXEobNm0A8sfOXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761990031; c=relaxed/simple;
	bh=KEyjwC/3ZixttteNhE28UtTrJX6xHVbizD+fICju5HQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jU7wbaixaq37QKMxPfLDz6yf7ZBHQuTyt5rLPEkOyxDbHZbuW49+ICOlouG1TvGwUi76gbpFwlps1eG9VU1E2DVAFWJvBH8E6jUPIJXA/Ti+6wz+vw8wNI7ihBjU3s7URuPk0CNZk69Jelr794Rko28Tap5/r3QOLy/PlDsj83k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X4nu1emX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A056EC4CEF1;
	Sat,  1 Nov 2025 09:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761990031;
	bh=KEyjwC/3ZixttteNhE28UtTrJX6xHVbizD+fICju5HQ=;
	h=From:To:Cc:Subject:Date:From;
	b=X4nu1emXFZUXSucv1dsi/I9LyoXD3yBy1scLkXVz0y0+zJaWdGWWzc5nFl/suDVGH
	 9qLovUiIHNnQUwrpqTcj6KLr3B7CHrb6VrgoQVjr7MYTdqOVYKGF2k3bLkOmheIkVN
	 pMR/rteY6XfnrH3eWoX8p4r5gWRlVZdqBoEhvq5DxUGEU2NQFM/I5x2mOqiMD8+EeE
	 YmWUCugkhOHutuBNZ6Npz1v2NohxC7/zve+pCywq8huv9MGIT62UAG9DxqZzE0Q8w8
	 ZxctAQ5osq+FNf9OLrRrqH/r0ltT1GkebJo2bMja7MMbtjpSjhF5wdoifpYx7OfIk6
	 d+w+LEFGvwohQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
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
	WANG Xuerui <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH] rust: kbuild: support `-Cjump-tables=n` for Rust 1.93.0
Date: Sat,  1 Nov 2025 10:40:11 +0100
Message-ID: <20251101094011.1024534-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rust 1.93.0 (expected 2026-01-22) is stabilizing `-Zno-jump-tables`
[1][2] as `-Cjump-tables=n` [3].

Without this change, one would eventually see:

      RUSTC L rust/core.o
    error: unknown unstable option: `no-jump-tables`

Thus support the upcoming version.

Link: https://github.com/rust-lang/rust/issues/116592 [1]
Link: https://github.com/rust-lang/rust/pull/105812 [2]
Link: https://github.com/rust-lang/rust/pull/145974 [3]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 arch/loongarch/Makefile | 2 +-
 arch/x86/Makefile       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index dc5bd3f1b8d2..96ca1a688984 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -109,7 +109,7 @@ endif
 ifdef CONFIG_RUSTC_HAS_ANNOTATE_TABLEJUMP
 KBUILD_RUSTFLAGS		+= -Cllvm-args=--loongarch-annotate-tablejump
 else
-KBUILD_RUSTFLAGS		+= -Zno-jump-tables # keep compatibility with older compilers
+KBUILD_RUSTFLAGS		+= $(if $(call rustc-min-version,109300),-Cjump-tables=n,-Zno-jump-tables) # keep compatibility with older compilers
 endif
 ifdef CONFIG_LTO_CLANG
 # The annotate-tablejump option can not be passed to LLVM backend when LTO is enabled.
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 4db7e4bf69f5..c60371db49d9 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -98,7 +98,7 @@ ifeq ($(CONFIG_X86_KERNEL_IBT),y)
 #   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104816
 #
 KBUILD_CFLAGS += $(call cc-option,-fcf-protection=branch -fno-jump-tables)
-KBUILD_RUSTFLAGS += -Zcf-protection=branch -Zno-jump-tables
+KBUILD_RUSTFLAGS += -Zcf-protection=branch $(if $(call rustc-min-version,109300),-Cjump-tables=n,-Zno-jump-tables)
 else
 KBUILD_CFLAGS += $(call cc-option,-fcf-protection=none)
 endif

base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
-- 
2.51.2


