Return-Path: <linux-kbuild+bounces-1890-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C598C96B2
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 May 2024 23:13:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DDA91F21044
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 May 2024 21:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90AE271753;
	Sun, 19 May 2024 21:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qg8iqhW1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B89F26AEC;
	Sun, 19 May 2024 21:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716153172; cv=none; b=QJIgu/yRdg4VHRqnnmb9TnaPrmdKsJGLtTqMx3BY7T/yDJKdURftdFx6ZgwkNVA+1INh2sdariCkJWoNE1lqKAEf15/Ezg8n+wIASJBWbKCHNLjdI2TC/LP/vIZjOTgU5X5S9Oy3NMqxwbwLz+tRwp48yFjHx5Azy0amV0BZTdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716153172; c=relaxed/simple;
	bh=uz3qaXVHS+S2eSkdqp8UHPcIOILSeq1SMRGGBFONyUA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kDRF2/akiS6OTAKDmWgbBe/FCf/SYXWhN6xDpmlTQKH7QwRZ9nxVTEYYGxuwtrCgtAoFyr3ohdzt8G5DRsmSysbXQLPxFSlCxJYRXWz51r3MipRCY/dwD+EXasVdUzhchH63Y5Wgu5FJUm2kKzy3Y+HxqYbauZuo5/f+dszKizg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qg8iqhW1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A31C32786;
	Sun, 19 May 2024 21:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716153171;
	bh=uz3qaXVHS+S2eSkdqp8UHPcIOILSeq1SMRGGBFONyUA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qg8iqhW1axS5SGiECrbyxZuMhDzlCRjHLg7oz/T9K9K9IHMz60zyHGWJ7cmDnKoie
	 +vOj34a6+AlIOn5FLdtlivuXs8ZklavC4fLCk4FY/9i6YYgYfRXkOF8mp9QE/Aoxpu
	 jukOfQmn6Gi2d3ouys3ZqQ/VZ2KtnqHLkvlLvzztk2BNc0WS457rPsgEk65M2SomKC
	 cf8RU/05aWKIza0jHwvffitUKpxSlYV5aCVJFHD6rWjUPiISXtXuVLMrYYn6sJKYKi
	 U9X8tF5ctq2bTKQ9AdRRqRcDhh77HJ41N02422Q8bEVs4y8P3Ox5HXFIrx3mZjXC0U
	 Sj94m85oDHWeA==
From: Miguel Ojeda <ojeda@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH 2/3] kbuild: rust: apply `CONFIG_WERROR` to all Rust targets
Date: Sun, 19 May 2024 23:12:34 +0200
Message-ID: <20240519211235.589325-2-ojeda@kernel.org>
In-Reply-To: <20240519211235.589325-1-ojeda@kernel.org>
References: <20240519211235.589325-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make all Rust code (i.e. not just kernel code) respect `CONFIG_WERROR`,
so that we keep everything warning clean.

In particular, this affects targets in `rust/` (`RUSTDOC H`, `RUSTC TL`,
`RUSTDOC T`, `RUSTC T` and `RUSTC P`), plus host programs and any others
we may add later.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
This one requires the `rusttest` warning cleanup at
https://lore.kernel.org/rust-for-linux/20240519210735.587323-1-ojeda@kernel.org/

 Makefile                   | 4 ++--
 scripts/Makefile.extrawarn | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index fba567a55607..2d0ea441cb9c 100644
--- a/Makefile
+++ b/Makefile
@@ -469,7 +469,7 @@ export rust_common_flags := --edition=2021 \

 KBUILD_HOSTCFLAGS   := $(KBUILD_USERHOSTCFLAGS) $(HOST_LFS_CFLAGS) $(HOSTCFLAGS)
 KBUILD_HOSTCXXFLAGS := -Wall -O2 $(HOST_LFS_CFLAGS) $(HOSTCXXFLAGS)
-KBUILD_HOSTRUSTFLAGS := $(rust_common_flags) -O -Cstrip=debuginfo \
+KBUILD_HOSTRUSTFLAGS = $(rust_common_flags) -O -Cstrip=debuginfo \
 			-Zallow-features= $(HOSTRUSTFLAGS)
 KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
 KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS) $(HOSTLDLIBS)
@@ -560,7 +560,7 @@ KBUILD_CFLAGS += -fno-PIE
 KBUILD_CFLAGS += -fno-strict-aliasing

 KBUILD_CPPFLAGS := -D__KERNEL__
-KBUILD_RUSTFLAGS := $(rust_common_flags) \
+KBUILD_RUSTFLAGS = $(rust_common_flags) \
 		    -Cpanic=abort -Cembed-bitcode=n -Clto=n \
 		    -Cforce-unwind-tables=n -Ccodegen-units=1 \
 		    -Csymbol-mangling-version=v0 \
diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 48114e91c386..990890821889 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -26,8 +26,8 @@ endif

 KBUILD_CPPFLAGS-$(CONFIG_WERROR) += -Werror
 KBUILD_CPPFLAGS += $(KBUILD_CPPFLAGS-y)
-KBUILD_RUSTFLAGS-$(CONFIG_WERROR) += -Dwarnings
-KBUILD_RUSTFLAGS += $(KBUILD_RUSTFLAGS-y)
+rust_common_flags-$(CONFIG_WERROR) += -Dwarnings
+rust_common_flags += $(rust_common_flags-y)

 KBUILD_CFLAGS-$(CONFIG_CC_NO_ARRAY_BOUNDS) += -Wno-array-bounds

--
2.45.1

