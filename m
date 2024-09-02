Return-Path: <linux-kbuild+bounces-3324-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67955968C7D
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Sep 2024 18:56:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B8261C21690
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Sep 2024 16:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98154200116;
	Mon,  2 Sep 2024 16:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kKxBx91f"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638951AB6E8;
	Mon,  2 Sep 2024 16:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725296172; cv=none; b=NERD7RQ48gEfXigxdrJiuDA7s63RzEIzEUtStl7rcHkyVRiVFn5yJnIKPdGEGKfZuVrqgrNpRixthfVMrPbHlFfxG7ldwOn1A3cJj0TrXD4G2GpNCnF2VmZ0uiijrw8uq6L3/io2sDGx34UNH6PcMQD6VKuIgCURsWDvze25vjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725296172; c=relaxed/simple;
	bh=Py8aXDwihPSg2fJ40DevYcamcRTgb64eTsUQY/xmr6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WdF/f/xxBeWvGKFD0cM8vs1dGGXxJlLKMiG/LOsuaOBCx0zdYrltVv8c80Kk55lJ/9lNnchixKHJGRzCn0HamGLK3JIJ10XjMoQAWPrgy3sr2jaBe8mEwe+qq7toXWMjH88hbq1kPU9VX9Q9lZ+ZTsgFGkfOzdK5msDZrFdwOAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kKxBx91f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF4ADC4CEC7;
	Mon,  2 Sep 2024 16:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725296171;
	bh=Py8aXDwihPSg2fJ40DevYcamcRTgb64eTsUQY/xmr6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kKxBx91flDChNZo/qI/zDXN+iFkvr4fJ38taaQ0lsNqxzBu4XVZh/Fscl59ttHewm
	 Tb99CuciXKvLjFLFjQuDjJ7urgDIlPJYItr9sEFCysJbqTSnbYnS+CNWpOZCK4NTlS
	 u0Z5ez9jvwULsDfIfkQjiJ2M7AwdQMeskeX+bWsO8o6FeoRQKdDAdSq/81r4V9g4vT
	 nkm4yZg5xw/kRJEpgp+pnvW4GMLRHft4mBl5SWHrxm8Xth5kD7Pw0IcaPchRW1MpQA
	 obNDnaxA6nrAfhWRgH4ydA6gAF93FsgLRLDer1Cz2TChwanGYmqvk1C+mYajtnEC9Q
	 B5o5CgfO64iZQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH v2 3/6] kbuild: rust: rebuild if the version text changes
Date: Mon,  2 Sep 2024 18:55:30 +0200
Message-ID: <20240902165535.1101978-4-ojeda@kernel.org>
In-Reply-To: <20240902165535.1101978-1-ojeda@kernel.org>
References: <20240902165535.1101978-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that `RUSTC_VERSION_TEXT` exists, use it to rebuild `core` when the
version text changes (which in turn will trigger a rebuild of all the
kernel Rust code).

This also applies to proc macros (which only work with the `rustc` that
compiled them), via the already existing dependency on `core.o`. That
is cleaned up in the next commit.

However, this does not cover host programs written in Rust, which is
the same case in the C side.

This is accomplished by referencing directly the generated file, instead
of using the `fixdep` header trick, since we cannot change the Rust
standard library sources. This is not too much of a burden, since it
only needs to be done for `core`.

Tested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/Makefile b/rust/Makefile
index e13d14ec5fe7..bb57a7c30f1a 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -389,7 +389,8 @@ $(obj)/core.o: private skip_clippy = 1
 $(obj)/core.o: private skip_flags = -Wunreachable_pub
 $(obj)/core.o: private rustc_objcopy = $(foreach sym,$(redirect-intrinsics),--redefine-sym $(sym)=__rust$(sym))
 $(obj)/core.o: private rustc_target_flags = $(core-cfgs)
-$(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs FORCE
+$(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs \
+    $(wildcard $(objtree)/include/config/RUSTC_VERSION_TEXT) FORCE
 	+$(call if_changed_rule,rustc_library)
 ifneq ($(or $(CONFIG_X86_64),$(CONFIG_X86_32)),)
 $(obj)/core.o: scripts/target.json
-- 
2.46.0


