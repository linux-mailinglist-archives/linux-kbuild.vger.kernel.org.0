Return-Path: <linux-kbuild+bounces-2437-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D527292BF1B
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2024 18:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 807E91F24371
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2024 16:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A5219D8BF;
	Tue,  9 Jul 2024 16:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Glsumsql"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44AF19D076;
	Tue,  9 Jul 2024 16:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720541202; cv=none; b=mP4j/Pc0ct7fQDpSFouFoRp1ncNUuLs/Qy00rutrqVYHcCAnIK3CyBkHhvyQ8yPnm76BaPvkmmatwrTyonb2KNCYKkV6B+M5OGhWbXHaaetnFytesHiN6GTFQ/t9YmP5UZ0GlImUXe4tzt8q3bQBeFPPpftnWbFg2xXKgdl/VdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720541202; c=relaxed/simple;
	bh=87ryJx7ZGIPxiVj7ZhWT3AKYThcfaUwoUvDdB5EI3Mo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sneFH/TVERjA96SLhZ8FNsdUeuL471k4f/BFCKmwC73uNVZ7MrJXN1QpE/UL+qPSXXgCp+2QpbLCAqEfyI3sF4mPqEchBT7Mb1DVk1uWeFZSVm4B1cfPxLhL+7RWh5rFltF0j+o3wsYtmMZkdA5DvWD008ZQZF6vhnVam5040VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Glsumsql; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC9DEC3277B;
	Tue,  9 Jul 2024 16:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720541202;
	bh=87ryJx7ZGIPxiVj7ZhWT3AKYThcfaUwoUvDdB5EI3Mo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Glsumsql4QoDnJCzAN4/HsASRkloOYyTlIYukEwsGS09jafPAQQ6cDaLbOeVeCM3D
	 hDx/39aHpwfvAZSnuQkwcvh3VYqqww9xp/OImDh7Xk6y8Fo5HM4cNP6Lo8sVLVsYTz
	 u2XcjUPgGEmpFAwvjagTVGoPFcy0T6yXPQVymZfty4vSB5z5lzBAOaXIc5tgh0gt4b
	 ma7dLvi4z6Tfo7XpHO3Mf9a2V9SbqDDC/oo6FQw+VNrR4tanWDP19J9JWEh2qpFc4U
	 8E/FQjMA73cgxV/cnaORpVueKKR13+R9iRPow8NNdWowOsPAvXGSB3YtYi1tQVTZM9
	 MPTuy3DlqCYGw==
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
	Finn Behrens <me@kloenk.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v2 04/13] rust: relax most deny-level lints to warnings
Date: Tue,  9 Jul 2024 18:05:59 +0200
Message-ID: <20240709160615.998336-5-ojeda@kernel.org>
In-Reply-To: <20240709160615.998336-1-ojeda@kernel.org>
References: <20240709160615.998336-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

`unsafe_op_in_unsafe_fn` is left unmodified, i.e. as an error, since it is
becoming the default in the language (warn-by-default in Rust 2024 [1] and
ideally an error later on) and thus it should also be very well tested. In
addition, it is simple enough that it should not have false positives
(unlike e.g. `rust_2018_idioms`'s `explicit_outlives_requirements`).

`non_ascii_idents` is left unmodified as well, i.e. as an error, since
it is unlikely one gains any productivity during development if it
were a warning (in fact, it may be worse, since it is likely one made
a typo). In addition, it should not have false positives.

Finally, put the two `-D` ones at the top and take the chance to do one
per line.

Link: https://github.com/rust-lang/rust/pull/112038 [1]
Reviewed-by: Finn Behrens <me@kloenk.dev>
Tested-by: Benno Lossin <benno.lossin@proton.me>
Tested-by: Andreas Hindborg <a.hindborg@samsung.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
v2:
  - Kept `non_ascii_idents` as an error. (Björn, Finn)

 Makefile      | 24 +++++++++++++-----------
 rust/Makefile |  4 ++--
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/Makefile b/Makefile
index fea263aaa492..7ea526814fdb 100644
--- a/Makefile
+++ b/Makefile
@@ -461,17 +461,19 @@ KBUILD_USERLDFLAGS := $(USERLDFLAGS)
 # host programs.
 export rust_common_flags := --edition=2021 \
 			    -Zbinary_dep_depinfo=y \
-			    -Dunsafe_op_in_unsafe_fn -Drust_2018_idioms \
-			    -Dunreachable_pub -Dnon_ascii_idents \
+			    -Dunsafe_op_in_unsafe_fn \
+			    -Dnon_ascii_idents \
+			    -Wrust_2018_idioms \
+			    -Wunreachable_pub \
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
@@ -572,7 +574,7 @@ KBUILD_RUSTFLAGS := $(rust_common_flags) \
 		    -Csymbol-mangling-version=v0 \
 		    -Crelocation-model=static \
 		    -Zfunction-sections=n \
-		    -Dclippy::float_arithmetic
+		    -Wclippy::float_arithmetic

 KBUILD_AFLAGS_KERNEL :=
 KBUILD_CFLAGS_KERNEL :=
diff --git a/rust/Makefile b/rust/Makefile
index 385378311322..bf05e65365da 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -367,7 +367,7 @@ ifneq ($(or $(CONFIG_ARM64),$(and $(CONFIG_RISCV),$(CONFIG_64BIT))),)
 endif

 $(obj)/core.o: private skip_clippy = 1
-$(obj)/core.o: private skip_flags = -Dunreachable_pub
+$(obj)/core.o: private skip_flags = -Wunreachable_pub
 $(obj)/core.o: private rustc_objcopy = $(foreach sym,$(redirect-intrinsics),--redefine-sym $(sym)=__rust$(sym))
 $(obj)/core.o: private rustc_target_flags = $(core-cfgs)
 $(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs FORCE
@@ -381,7 +381,7 @@ $(obj)/compiler_builtins.o: $(src)/compiler_builtins.rs $(obj)/core.o FORCE
 	+$(call if_changed_dep,rustc_library)

 $(obj)/alloc.o: private skip_clippy = 1
-$(obj)/alloc.o: private skip_flags = -Dunreachable_pub
+$(obj)/alloc.o: private skip_flags = -Wunreachable_pub
 $(obj)/alloc.o: private rustc_target_flags = $(alloc-cfgs)
 $(obj)/alloc.o: $(RUST_LIB_SRC)/alloc/src/lib.rs $(obj)/compiler_builtins.o FORCE
 	+$(call if_changed_dep,rustc_library)
--
2.45.2

