Return-Path: <linux-kbuild+bounces-1889-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BE38C96B0
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 May 2024 23:12:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F4291C204F6
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 May 2024 21:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75671495E5;
	Sun, 19 May 2024 21:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Js1yFGSO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412FC26AEC;
	Sun, 19 May 2024 21:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716153168; cv=none; b=hU1MWqiGgK6EN2hyhG6k0nTihu3jlmNv+r4icmw0nd+0B+Upqu1668tmwoPCRyEyPjp6T2HspnQa9HyLoUbjZCu5LCrlwLiC/p/SJ0JppB6YE1yceeRjNzG9a6hZeJoo5YqxhIXxrWnubGeuOArYFUqTpADMUXlkEI/6epn+zkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716153168; c=relaxed/simple;
	bh=e2u0UG0wuyw4TbBEmJFcpe0xCx60m/GShz0PKNVG8As=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EWmmWp34yJWpAkxNrSEYFJql6DX9ZLCoXZaM3AGl5B4hhADUE1h4W5RK+YBRU1Np0aj3kVD1J7aRjQZLwPbEbk9/PuC2hW0LoAzeSiOMPgF5UWMM2F2RgSt0JrJ5bBc5Z3cPiDku8zTL2pWNJDzRrNebTdLSy/mIhpP7Q21gJEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Js1yFGSO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 408B0C32781;
	Sun, 19 May 2024 21:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716153167;
	bh=e2u0UG0wuyw4TbBEmJFcpe0xCx60m/GShz0PKNVG8As=;
	h=From:To:Cc:Subject:Date:From;
	b=Js1yFGSOqbapVHh1Hmmi9E6X5MWNAr7fD6efIWps0bj+fs2rQMPjHOOrc6AOQkiDm
	 x7kh2+QW70OTH4gySqsQi51cKf6yXscbi+oefcNO36VDGEMDzxZhNUV7hUHDAmGmaf
	 d6w1f3qkbIC1pk3Zzztw14BG95JhBhmAafxXEroBS6hUuL5P/oix6q1QCHZpfMyyka
	 kqj1YPJbyVW1PB7fcvgm/TrIIViBWZ0h0txMTmaZXmteHDIpvZNUtkXdzEEKauqYA7
	 qn+k9vNMhX8xVvqoN2yd+uhnuLnWjOwCmLgZWUevazxkv92U+MADIbKy4KVzdG+cx7
	 jfoPN2GLNQHmQ==
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
Subject: [PATCH 1/3] kbuild: rust: move `-Dwarnings` handling to `Makefile.extrawarn`
Date: Sun, 19 May 2024 23:12:33 +0200
Message-ID: <20240519211235.589325-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following commit e88ca24319e4 ("kbuild: consolidate warning flags
in scripts/Makefile.extrawarn"), move `-Dwarnings` handling into
`Makefile.extrawarn` like C's `-Werror`.

No functional change intended.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Makefile                   | 3 ---
 scripts/Makefile.extrawarn | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 763b6792d3d5..fba567a55607 100644
--- a/Makefile
+++ b/Makefile
@@ -842,9 +842,6 @@ stackp-flags-$(CONFIG_STACKPROTECTOR_STRONG)      := -fstack-protector-strong
 
 KBUILD_CFLAGS += $(stackp-flags-y)
 
-KBUILD_RUSTFLAGS-$(CONFIG_WERROR) += -Dwarnings
-KBUILD_RUSTFLAGS += $(KBUILD_RUSTFLAGS-y)
-
 ifdef CONFIG_FRAME_POINTER
 KBUILD_CFLAGS	+= -fno-omit-frame-pointer -fno-optimize-sibling-calls
 KBUILD_RUSTFLAGS += -Cforce-frame-pointers=y
diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 3ce5d503a6da..48114e91c386 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -26,6 +26,9 @@ endif
 
 KBUILD_CPPFLAGS-$(CONFIG_WERROR) += -Werror
 KBUILD_CPPFLAGS += $(KBUILD_CPPFLAGS-y)
+KBUILD_RUSTFLAGS-$(CONFIG_WERROR) += -Dwarnings
+KBUILD_RUSTFLAGS += $(KBUILD_RUSTFLAGS-y)
+
 KBUILD_CFLAGS-$(CONFIG_CC_NO_ARRAY_BOUNDS) += -Wno-array-bounds
 
 ifdef CONFIG_CC_IS_CLANG
-- 
2.45.1


