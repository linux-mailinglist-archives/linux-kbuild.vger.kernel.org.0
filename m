Return-Path: <linux-kbuild+bounces-2914-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F6294C6D8
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Aug 2024 00:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C88D11C21AB2
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Aug 2024 22:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBFE716728B;
	Thu,  8 Aug 2024 22:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YzwuFsCb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E71115DBB6;
	Thu,  8 Aug 2024 22:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723155134; cv=none; b=cfq0pStkjV5U/igHJvR3kzGwy1Nw2ch9TI3Rli2FmUK8D24+YRUkrZdyQtfXLAGgH/H65+GnOF9l0OGFY0ZB8tHPT0ulHXzlv+SaijGIFOBxdAQj3Sd+86DxNF6LLuX9+5iUmNbgZzYnftiEPvVK066LFMLZJh1uBeeim7kBbYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723155134; c=relaxed/simple;
	bh=a07yMugK1+zuRaVA+o2s+/N2A/1oN9fyVOt7k3dxEq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bwz1jmj1VHaVMwJdT2r9TdBn0+pxGbIdfBZKq74w7PwzZNk666WdrzJgVLfYRPHREouwmoB892WfkZJiowcvrhArtqpw8sGjepEvcFHTqdoA1Di4Q5cqOmy5CKBql2qrfJdWH+LBjtuc20syd+W0IZj/eD1ILQeTSYWLtDjB6+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YzwuFsCb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CA86C4AF0D;
	Thu,  8 Aug 2024 22:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723155134;
	bh=a07yMugK1+zuRaVA+o2s+/N2A/1oN9fyVOt7k3dxEq4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YzwuFsCbLdyYLszA5900E5UeebrPPMkIEPhaZLrGLtvD2m7WRoBvWvBDZ0rXDXf9k
	 3ujDeoP0vBUFdIopTBlIad+Mu3YlbdFM+1m/CHMWmmQD4vc3hplY6UVmttEYKhr9jV
	 uFOtdh1gFFaBXupt/sA8GDQoysoErvvkofL2y98qlNiOkYlHcU4EKWTwdycVeWRm92
	 EQSnrgTlEkHkq5Q70gm2eQLRfnHaWCDGmbu/yBmAJ5Il+yQO4gXbAKAqN5MAqMaJzs
	 z+dKg6imBF06+EqLJ4QYrjbegjVVhXGwIpxETNcZWovIz6H1pN8vgZpDJOYe2MIwug
	 e0/F94/R11XNQ==
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
Subject: [PATCH 4/6] kbuild: rust: rebuild if the version text changes
Date: Fri,  9 Aug 2024 00:11:36 +0200
Message-ID: <20240808221138.873750-5-ojeda@kernel.org>
In-Reply-To: <20240808221138.873750-1-ojeda@kernel.org>
References: <20240808221138.873750-1-ojeda@kernel.org>
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

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
Masahiro: I used `$(objtree)` here since we still use it in the rest of
this `Makefile`, but please let me know if you prefer otherwise. Thanks!

 rust/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/rust/Makefile b/rust/Makefile
index 6c0644b6090c..966743a9ee25 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -370,7 +370,8 @@ $(obj)/core.o: private skip_clippy = 1
 $(obj)/core.o: private skip_flags = -Wunreachable_pub
 $(obj)/core.o: private rustc_objcopy = $(foreach sym,$(redirect-intrinsics),--redefine-sym $(sym)=__rust$(sym))
 $(obj)/core.o: private rustc_target_flags = $(core-cfgs)
-$(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs FORCE
+$(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs \
+    $(wildcard $(objtree)/include/config/RUSTC_VERSION_TEXT) FORCE
 	+$(call if_changed_dep,rustc_library)
 ifneq ($(or $(CONFIG_X86_64),$(CONFIG_X86_32)),)
 $(obj)/core.o: scripts/target.json
--
2.46.0

