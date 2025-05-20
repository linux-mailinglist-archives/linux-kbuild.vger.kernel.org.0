Return-Path: <linux-kbuild+bounces-7182-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BB7ABE428
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 21:54:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7637D8A4EDC
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 19:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 027B528369D;
	Tue, 20 May 2025 19:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FKeIdF3Z"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F45283FF3;
	Tue, 20 May 2025 19:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747770837; cv=none; b=qmPbxzerUkEFutczKGznU0wYZkGO9YmuE35KdzKoGS7Fd5Y0X0tyECZeSGNrBBr8vyZWQ4J7acDWypGc6j7OJNZokaAPpsbLfKLVlvNXEGYupxNJRsr1jfYv0VMoYhW9Th2wSUrGOO0SKZjGhAW5uZ1zNvdkJNwXTlgONxW5JEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747770837; c=relaxed/simple;
	bh=VxB9dZNjaO/CQfaln8AMXdGqbympMTXUc6XWHCuYKIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RDL4PSL50X8QG1DARaqPouxu+DQlOzFmIEFStyIh4+bjH7+cjmhGgZtlUh4hDYEooax2sG239MQxt0jwvGQZYXC5NR62d1FdhslZUeBBRdqzp2MvS96/2L6MSt0cUrWdpwphHIODqSHvBqVPvLELHU88CPaUT/7XNhh1FPd7gbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FKeIdF3Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5113C4CEE9;
	Tue, 20 May 2025 19:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747770837;
	bh=VxB9dZNjaO/CQfaln8AMXdGqbympMTXUc6XWHCuYKIo=;
	h=From:To:Cc:Subject:Date:From;
	b=FKeIdF3ZRzsVCO7fCWbmyehAqD4H8nwF7AXfcoNX2CIpI+5dS558KzCVHoS+9flwY
	 McSy+OMqElInL4SHyicS9HDd/Z2VR0IQNVyAzSw0LPmXbe3aASgtm+vXG5ve8tqpN3
	 7f4ndOHqQS5m2ZMkzL51hnPaUjxguPxlActqXboDDJZ8tltmodnCyrOPYWeQZCvmzR
	 gZ0iBz9D3RoGLQ4bKK+i2eSUzx7eeJw9YY8vM3Du3UOn2vz0l1Z8Jpto31z/MpABsR
	 r8a40qeqmTdK89Ey2RZiqtgX62Yex82z1SUrgra7WxWa/N/6aEDXcvgaQviYbcFPU+
	 6mmOYnYGv29kA==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	stable@vger.kernel.org,
	Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v2] rust: kbuild: rebuild if `.clippy.toml` changes
Date: Tue, 20 May 2025 21:53:45 +0200
Message-ID: <20250520195345.905374-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We rarely modify `.clippy.toml`, but currently we do not rebuild if that
happens, thus it is easy to miss possible changes in lints.

Thus rebuild in case of changes.

Cc: stable@vger.kernel.org
Reported-by: Tamir Duberstein <tamird@gmail.com>
Closes: https://github.com/Rust-for-Linux/linux/issues/1151
Fixes: 7d56786edcbd ("rust: introduce `.clippy.toml`")
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 3aca903a7d08..107299c32065 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -57,6 +57,10 @@ rustdoc_test_quiet=--test-args -q
 rustdoc_test_kernel_quiet=>/dev/null
 endif
 
+ifeq ($(KBUILD_CLIPPY),1)
+	clippy_toml := $(srctree)/.clippy.toml
+endif
+
 core-cfgs = \
     --cfg no_fp_fmt_parse
 
@@ -405,11 +409,12 @@ quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
 		--crate-name $(patsubst lib%.$(libmacros_extension),%,$(notdir $@)) $<
 
 # Procedural macros can only be used with the `rustc` that compiled it.
-$(obj)/$(libmacros_name): $(src)/macros/lib.rs FORCE
+$(obj)/$(libmacros_name): $(src)/macros/lib.rs $(clippy_toml) FORCE
 	+$(call if_changed_dep,rustc_procmacro)
 
 $(obj)/$(libpin_init_internal_name): private rustc_target_flags = --cfg kernel
-$(obj)/$(libpin_init_internal_name): $(src)/pin-init/internal/src/lib.rs FORCE
+$(obj)/$(libpin_init_internal_name): $(src)/pin-init/internal/src/lib.rs \
+    $(clippy_toml) FORCE
 	+$(call if_changed_dep,rustc_procmacro)
 
 quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L $@
@@ -495,7 +500,8 @@ endif
 
 $(obj)/compiler_builtins.o: private skip_gendwarfksyms = 1
 $(obj)/compiler_builtins.o: private rustc_objcopy = -w -W '__*'
-$(obj)/compiler_builtins.o: $(src)/compiler_builtins.rs $(obj)/core.o FORCE
+$(obj)/compiler_builtins.o: $(src)/compiler_builtins.rs $(obj)/core.o \
+    $(clippy_toml) FORCE
 	+$(call if_changed_rule,rustc_library)
 
 $(obj)/pin_init.o: private skip_gendwarfksyms = 1

base-commit: 22c3335c5dcd33063fe1894676a3a6ff1008d506
-- 
2.49.0


