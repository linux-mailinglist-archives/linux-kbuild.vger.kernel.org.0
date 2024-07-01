Return-Path: <linux-kbuild+bounces-2294-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E21891E7BE
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jul 2024 20:37:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B78DB222C2
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jul 2024 18:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D3FB16EB70;
	Mon,  1 Jul 2024 18:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kIUprjZO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105BB16FF47;
	Mon,  1 Jul 2024 18:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719859024; cv=none; b=n1vZQBq8qU4pBWkqRRWqMcekkMSa7q2vjvsjPbGrLt7Odd9PvDVzOM1Y++bN9oi6ylrstJTUKrf0i26tmKJxIW+P6JjJXssVBCW8NIWD65Vh1NePU5/PO8DFwd1Au1mc9i89WJHtlrdKYDtXIWWoz9qRYEb315XT26xn90IbsCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719859024; c=relaxed/simple;
	bh=tP2HDN4TTaXAnnWUMMPiix526ZI8EAisK4CECsr1ppc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gioZYe8ZG7WsoucDmlpZX94ORTuINsdGm3BE2oxV/E9BNloq7CBB3M4P//Ben0mGq5w7l1ImYugIOkadm8LqcxGPVyipfJ2Bcsb8si6i7xEoTQqacyb5fuKh2DtjpOvknEum6Hzg1roc6sBu6CWSJIm4wjlgPLZ3vRedn1RORQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kIUprjZO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B17C4AF0A;
	Mon,  1 Jul 2024 18:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719859023;
	bh=tP2HDN4TTaXAnnWUMMPiix526ZI8EAisK4CECsr1ppc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kIUprjZO8piOWDu2TFZ1/ng5KmWLRXlQTziabtx1lcJ/Qax6DeJlUTcj6POglNAnH
	 r+aJEwf/rXbwfzHJL+5tMi9QxnAVetsqvyaQU0mwvHYy9DO2fpzBm+DKzCFZ6PM/D6
	 A7enPIRZOzpUMDqc4Ojur9hdIITkzutXGhkcWAoCmzBqh1uKwT5KB987K+796qlTW4
	 ISHVn6334vZB8wSUfMbmW8cE8mOcu8MrDtHXikoWMZrHij0hjaMliPKUGT8O1lj7kD
	 FkXUhQ4YfwZlG0cuyMrJEKfl612CGUD35n5On6jViAgFvJEyoGAlt1C6p4uHTQa9x6
	 tBIY9dPBiDggA==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH 04/13] rust: relax most deny-level lints to warnings
Date: Mon,  1 Jul 2024 20:36:14 +0200
Message-ID: <20240701183625.665574-5-ojeda@kernel.org>
In-Reply-To: <20240701183625.665574-1-ojeda@kernel.org>
References: <20240701183625.665574-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since we are starting to support several Rust toolchains, lints (including
Clippy ones) now may behave differently and lint groups may include
new lints.

Therefore, to maximize the chances a given version works, relax some
deny-level lints to warnings. It may also make our lives a bit easier
while developing new code or refactoring.

To be clear, the requirements for in-tree code are still the same, since
Rust code still needs to be warning-free (patches should be clean under
`WERROR=y`) and the set of lints is not changed.

`unsafe_op_in_unsafe_fn` is left unmodified, i.e. as an error, since
1) it is simple enough that it should not have false positives (unlike
e.g. `rust_2018_idioms`'s `explicit_outlives_requirements`) and 2) it is
becoming the default in the language (warn-by-default in Rust 2024 [1] and
ideally an error later on) and thus it should also be very well tested.

Link: https://github.com/rust-lang/rust/pull/112038 [1]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Makefile      | 22 +++++++++++-----------
 rust/Makefile |  4 ++--
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/Makefile b/Makefile
index 4d36f943b3b1..056176a55d63 100644
--- a/Makefile
+++ b/Makefile
@@ -461,17 +461,17 @@ KBUILD_USERLDFLAGS := $(USERLDFLAGS)
 # host programs.
 export rust_common_flags := --edition=2021 \
 			    -Zbinary_dep_depinfo=y \
-			    -Dunsafe_op_in_unsafe_fn -Drust_2018_idioms \
-			    -Dunreachable_pub -Dnon_ascii_idents \
+			    -Dunsafe_op_in_unsafe_fn -Wrust_2018_idioms \
+			    -Wunreachable_pub -Wnon_ascii_idents \
 			    -Wmissing_docs \
-			    -Drustdoc::missing_crate_level_docs \
-			    -Dclippy::correctness -Dclippy::style \
-			    -Dclippy::suspicious -Dclippy::complexity \
-			    -Dclippy::perf \
-			    -Dclippy::let_unit_value -Dclippy::mut_mut \
-			    -Dclippy::needless_bitwise_bool \
-			    -Dclippy::needless_continue \
-			    -Dclippy::no_mangle_with_rust_abi \
+			    -Wrustdoc::missing_crate_level_docs \
+			    -Wclippy::correctness -Wclippy::style \
+			    -Wclippy::suspicious -Wclippy::complexity \
+			    -Wclippy::perf \
+			    -Wclippy::let_unit_value -Wclippy::mut_mut \
+			    -Wclippy::needless_bitwise_bool \
+			    -Wclippy::needless_continue \
+			    -Wclippy::no_mangle_with_rust_abi \
 			    -Wclippy::dbg_macro
 
 KBUILD_HOSTCFLAGS   := $(KBUILD_USERHOSTCFLAGS) $(HOST_LFS_CFLAGS) $(HOSTCFLAGS)
@@ -573,7 +573,7 @@ KBUILD_RUSTFLAGS := $(rust_common_flags) \
 		    -Csymbol-mangling-version=v0 \
 		    -Crelocation-model=static \
 		    -Zfunction-sections=n \
-		    -Dclippy::float_arithmetic
+		    -Wclippy::float_arithmetic
 
 KBUILD_AFLAGS_KERNEL :=
 KBUILD_CFLAGS_KERNEL :=
diff --git a/rust/Makefile b/rust/Makefile
index f70d5e244fee..4c03e53d3084 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -421,7 +421,7 @@ ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$(CONFIG_64BIT))),)
 endif
 
 $(obj)/core.o: private skip_clippy = 1
-$(obj)/core.o: private skip_flags = -Dunreachable_pub
+$(obj)/core.o: private skip_flags = -Wunreachable_pub
 $(obj)/core.o: private rustc_objcopy = $(foreach sym,$(redirect-intrinsics),--redefine-sym $(sym)=__rust$(sym))
 $(obj)/core.o: private rustc_target_flags = $(core-cfgs)
 $(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs FORCE
@@ -435,7 +435,7 @@ $(obj)/compiler_builtins.o: $(src)/compiler_builtins.rs $(obj)/core.o FORCE
 	+$(call if_changed_dep,rustc_library)
 
 $(obj)/alloc.o: private skip_clippy = 1
-$(obj)/alloc.o: private skip_flags = -Dunreachable_pub
+$(obj)/alloc.o: private skip_flags = -Wunreachable_pub
 $(obj)/alloc.o: private rustc_target_flags = $(alloc-cfgs)
 $(obj)/alloc.o: $(RUST_LIB_SRC)/alloc/src/lib.rs $(obj)/compiler_builtins.o FORCE
 	+$(call if_changed_dep,rustc_library)
-- 
2.45.2


