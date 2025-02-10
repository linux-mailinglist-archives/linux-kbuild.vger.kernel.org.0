Return-Path: <linux-kbuild+bounces-5698-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0572DA2F3DB
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Feb 2025 17:43:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFCD03A22B3
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Feb 2025 16:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 684681F4632;
	Mon, 10 Feb 2025 16:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k6CRwpAP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B2E2580D8;
	Mon, 10 Feb 2025 16:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739205781; cv=none; b=ISum0pcOsTHB1Mw6u9WS4JPsX+gpSZxJjhCemp/MNa/L0NM4s9Yir7aAvVSf42k1XlrWXHRqsVK1M/gqGFYc+fHoFrGh3C+V7vGzTxxOOwLeG8Z19eDDyQ997bkbSoi51HEHYX/fXfpfIkUdN2HqwbSb2B0bAh54v8IjxKAcTg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739205781; c=relaxed/simple;
	bh=mPMQ/r2tER76Ym5c2/i5WaN/wRM3LmL3waxtdryUaBY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s1zGArRzjdDsczExnk7qp7rjy0klqblReHisY5s1wlO1OLnjMHXl4oXTK2/V8i7TUg6VoczYE9aXkipWqaeQExO8CZ8sbhuDmfrB7ImJdTUOxSElDCXKZ9ozkPDmlJB10rro/VUvSt0S/xPDm4mWxflG8LQpmB9Xy59OkBXrdVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k6CRwpAP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C473DC4CEDF;
	Mon, 10 Feb 2025 16:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739205780;
	bh=mPMQ/r2tER76Ym5c2/i5WaN/wRM3LmL3waxtdryUaBY=;
	h=From:To:Cc:Subject:Date:From;
	b=k6CRwpAPipNwWpQaCTXwPnOf+2w1rmiKX2u5l+E1Q1r5ljg/P/XjX6IS0mX4MhujU
	 5TqJcCFPlfx7GwKz7qhusSce6nnF3jpC9D0EEkZKzMuE+k/Ngn40ywJwpfQjVyGgQF
	 rh5y75r08I3w8BHA+QZwVUrEeJgbF6aLnK6rA73lflq0uRD4QLx2pVn+WQzQwXHvYb
	 c2cLn37NpyS3GcWcpXzexsjK+hL1eXOCVkGjPqBjr8j+3v9cxciV4A6ZmkS45HoEnI
	 hLGd9teilbBneYgcfDlngYP9it6EX+6bY3EkvCWptfgv2mpfeJKk/xW0VB4kTjTPRy
	 I5F/AWrtmlEow==
From: Miguel Ojeda <ojeda@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers),
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH] kbuild: rust: add rustc-min-version support function
Date: Mon, 10 Feb 2025 17:42:45 +0100
Message-ID: <20250210164245.282886-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce `rustc-min-version` support function that mimics
`{gcc,clang}-min-version` ones, following commit 88b61e3bff93
("Makefile.compiler: replace cc-ifversion with compiler-specific macros").

In addition, use it in the first use case we have in the kernel (which
was done independently to minimize the changes needed for the fix).

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
This is based on top of the fix so that the fix remains as simple as
possible:

    https://lore.kernel.org/rust-for-linux/20250210163732.281786-1-ojeda@kernel.org/

 Documentation/kbuild/makefiles.rst | 14 ++++++++++++++
 arch/arm64/Makefile                |  2 +-
 scripts/Makefile.compiler          |  4 ++++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index d36519f194dc..2608aa32c762 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -670,6 +670,20 @@ cc-cross-prefix
             endif
     endif

+$(RUSTC) support functions
+--------------------------
+
+rustc-min-version
+  rustc-min-version tests if the value of $(CONFIG_RUSTC_VERSION) is greater
+  than or equal to the provided value and evaluates to y if so.
+
+  Example::
+
+    rustflags-$(call rustc-min-version, 108500) := -Cfoo
+
+  In this example, rustflags-y will be assigned the value -Cfoo if
+  $(CONFIG_RUSTC_VERSION) is >= 1.85.0.
+
 $(LD) support functions
 -----------------------

diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 2b25d671365f..1d5dfcd1c13e 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -48,7 +48,7 @@ KBUILD_CFLAGS	+= $(CC_FLAGS_NO_FPU) \
 KBUILD_CFLAGS	+= $(call cc-disable-warning, psabi)
 KBUILD_AFLAGS	+= $(compat_vdso)

-ifeq ($(call test-ge, $(CONFIG_RUSTC_VERSION), 108500),y)
+ifeq ($(call rustc-min-version, 108500),y)
 KBUILD_RUSTFLAGS += --target=aarch64-unknown-none-softfloat
 else
 KBUILD_RUSTFLAGS += --target=aarch64-unknown-none -Ctarget-feature="-neon"
diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index 8c1029687e2e..8956587b8547 100644
--- a/scripts/Makefile.compiler
+++ b/scripts/Makefile.compiler
@@ -67,6 +67,10 @@ gcc-min-version = $(call test-ge, $(CONFIG_GCC_VERSION), $1)
 # Usage: cflags-$(call clang-min-version, 110000) += -foo
 clang-min-version = $(call test-ge, $(CONFIG_CLANG_VERSION), $1)

+# rustc-min-version
+# Usage: rustc-$(call rustc-min-version, 108500) += -Cfoo
+rustc-min-version = $(call test-ge, $(CONFIG_RUSTC_VERSION), $1)
+
 # ld-option
 # Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
 ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
--
2.48.1

