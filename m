Return-Path: <linux-kbuild+bounces-9791-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AC93FC7EAC0
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 01:24:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 92AE64E07C9
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 00:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84C211AAA1C;
	Mon, 24 Nov 2025 00:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U7VhOt9C"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1AB13D521
	for <linux-kbuild@vger.kernel.org>; Mon, 24 Nov 2025 00:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763943813; cv=none; b=KM20uMEVtmBp9AZ52dd+oZ1xhFzNEXwbf3xD8oWwdC6EM9GRPj4o7WmGd1dEVNxLed6+bU4EPxs3WC2GL2oL5PsQ9iPphVZyANAAeGG/z/qkD1o6cPMb9lA6oJqXDlSrCQUGMwX7nEXldtvf637nY9t4Q+H0M3kwb1cpIn4rz1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763943813; c=relaxed/simple;
	bh=IyyJ7rVmhgm+QGwk2c2H4lH2MEPDT6fLbCPXeII+ASw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kY4K6LpHBcFLILS09uNYhG/LpoJRUXrJR4WIcOMCCem3Q67a3GkuWi4wIkei0ViNmE0WDIiT6syXmIbEO7mNN6IwlFSB8HJR6iWFBrncVwVWf2kvFNRyINZuehk6U4mVJxy0ZnY6Mv56w/Y/n4URRq03bMS5cjJAUxWbd1MELAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U7VhOt9C; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5957e017378so3886957e87.3
        for <linux-kbuild@vger.kernel.org>; Sun, 23 Nov 2025 16:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763943808; x=1764548608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WvP3pAsY86kZPj7yXGlDI1ekuH0t13w7nIB3BO3NZ8U=;
        b=U7VhOt9Cq8qXaLZAAjvmpKvIZI0k01jpabW8ZUEOfOhz6A7351BpfFVDONzVpEIfcW
         755O7+b8dPATX/pWV0Et3Be/ZzGvEeBJjJgiyJRN1EbHGlOoB9MFR+bpvUVDa9J237Rd
         yxAp8L4GbGSKGwzD3eDgSJnhBgRVkjXqb84LmjXCJkzElPowgVzRUrQTaAsb+v4YA7Qi
         kDIdC5MWLJC5xj69gk6FU7v3dlafyAEbocAfQzZvNcASAfYfh8EpXXwxQdZeBgDzvO/s
         DDfjf07vetqRhMTY6BW3FT0koJ1CAY8e8BysFnxQzE9FUbUUXXkBFyjPruaZRF/zqIFS
         1oog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763943808; x=1764548608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WvP3pAsY86kZPj7yXGlDI1ekuH0t13w7nIB3BO3NZ8U=;
        b=LFc70qOMkthAPIo7H1E6gcuwF63PlVFZYXNuqgmoliv/umWG2WCTcwKLBP3x54h/KK
         iDAVaz/oDQX7q5fQGkihNC099qImXacj8EHelptySkms/HqcQY6VZHEvDukMYXHNmT6/
         cR5vv9RaMy02zZkBZdZszqJnK6Xr0rI/j+OR6A/aAvBzLMKAjBHIMNWPVfKFImcSCqVQ
         HInMD4k/6mG5qETGgWU89MQNZp3D2OIlc/dX82h6sisdwavFmZ6IcBn3yhcw8K+qB3dZ
         cIBQ0uR9QqqH0wk9usYkqzOQBJtfkTPgFGl2FQwpNCdkEvva+74yutGRlwBDzF2+cCPg
         nkkA==
X-Gm-Message-State: AOJu0YwuejRE96NyjdU0kb6RRFhxH/9dmpAoXorwPV0lPyaVCOjoegO0
	G0o5Icuv+8lb6cdm06IYhoH2isQGVGWTgmnuPEocTTRkV28qcxdl1oqb
X-Gm-Gg: ASbGncuqDuSzcNGYU8nk1M0ZcFE/BWU1VxaE/GbI1vrhBZ0BG8AS6SJhg1arWmApgqk
	uE2IvoTRjuPLHTlicpte/QmUu1lAt0RaMy2iKVOz/meKZZzFdkVL70Oq6AOoFoAPTWuEWjeLQ3H
	7w0YU4wVfxgUHuqnLQT0ooLorFSXXKm8AM/rlVhzf7tPyx2Hc45rXjce8Ww3Q9gBv7lzlYidHAn
	Frj1yPUJu1GS20br3DIfK1ifEPSh+o2nqfhke4s+LcwRg2Lz++a8HgYLrPIzjwC/+D6isqpiOSE
	p/AqSZ3kzDslZBrBzmyRCAE/uiAlY3z3sj814uQttsiiV2vGm3xthZ4qXmsqTHYC+f4Qgxkm4wj
	inJmSvMVPpX5aGx3aqQMoveUeobnr7Boayq/XsU5TmBowYDtY9VbY8d19123Y3VdWygMbwA==
X-Google-Smtp-Source: AGHT+IH+0QfjZBw1sWNIlTTbH1LlvraSWUBJu/TmQUXItAjl9hQUPyPKxxy1pqyLmhU5s/uWuaOPiQ==
X-Received: by 2002:a05:6512:e98:b0:595:91dc:72a5 with SMTP id 2adb3069b0e04-596a3eefdffmr3405623e87.40.1763943807138;
        Sun, 23 Nov 2025 16:23:27 -0800 (PST)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-5969dbd095dsm3708266e87.97.2025.11.23.16.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 16:23:26 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Date: Mon, 24 Nov 2025 01:23:24 +0100
Subject: [PATCH v4 4/4] RISC-V: fix gcc + rust builds
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-gcc-rust-v4-v4-4-4e06e07421ae@gmail.com>
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com>
In-Reply-To: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, 
 Jason Montleon <jmontleo@redhat.com>, Conor Dooley <conor@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Asuna Yang <SpriteOvO@gmail.com>
X-Mailer: b4 0.14.3

Commit 33549fcf37ec ("RISC-V: disallow gcc + rust builds") disabled GCC
+ Rust builds for RISC-V due to differences in extension handling
compared to LLVM.

Add `rust-bindgen-option` conditions for the availability of libclang to
the RISC-V extension Kconfig symbols that depend on the `cc-option`
function.

For Zicsr/Zifencei special handling, since LLVM/Clang always enables
these two extensions, either don't pass them to `-march`, or pass them
explicitly and Rust bindgen libclang must recognize them.

Clang does not support `-mno-riscv-attribute` flag, filter it out to
resolve error: unknown argument: '-mno-riscv-attribute'.

Define `BINDGEN_TARGET_riscv` to pass the target triplet to Rust bindgen
libclang for RISC-V to resolve error: unsupported argument 'medany' to
option '-mcmodel=' for target 'unknown'.

Update the documentation, GCC + Rust builds for RISC-V are now
supported.

Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
---
 Documentation/rust/arch-support.rst |  2 +-
 arch/riscv/Kconfig                  | 35 ++++++++++++++++++++++++++++++++++-
 rust/Makefile                       |  3 ++-
 scripts/Makefile.rust               |  1 +
 4 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index 6e6a515d0899..5282e0e174e8 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -18,7 +18,7 @@ Architecture   Level of support  Constraints
 ``arm``        Maintained        ARMv7 Little Endian only.
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
-``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
+``riscv``      Maintained        ``riscv64`` only.
 ``um``         Maintained        \-
 ``x86``        Maintained        ``x86_64`` only.
 =============  ================  ==============================================
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index fadec20b87a8..e3ea132191d1 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -193,7 +193,7 @@ config RISCV
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RETHOOK if !XIP_KERNEL
 	select HAVE_RSEQ
-	select HAVE_RUST if RUSTC_SUPPORTS_RISCV && CC_IS_CLANG
+	select HAVE_RUST if RUSTC_SUPPORTS_RISCV && TOOLCHAIN_MATCHES_ZICSR_ZIFENCEI
 	select HAVE_SAMPLE_FTRACE_DIRECT
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
 	select HAVE_STACKPROTECTOR
@@ -617,6 +617,8 @@ config TOOLCHAIN_HAS_V
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32imv)
 	depends on LD_IS_LLD || LD_VERSION >= 23800
 	depends on AS_HAS_OPTION_ARCH
+	depends on !RUST || !64BIT || $(rust-bindgen-option,-- -mabi=lp64 -march=rv64imv)
+	depends on !RUST || !32BIT || $(rust-bindgen-option,-- -mabi=ilp32 -march=rv32imv)
 
 config RISCV_ISA_V
 	bool "Vector extension support"
@@ -681,6 +683,8 @@ config TOOLCHAIN_HAS_ZABHA
 	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zabha)
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zabha)
 	depends on AS_HAS_OPTION_ARCH
+	depends on !RUST || !64BIT || $(rust-bindgen-option,-- -mabi=lp64 -march=rv64ima_zabha)
+	depends on !RUST || !32BIT || $(rust-bindgen-option,-- -mabi=ilp32 -march=rv32ima_zabha)
 
 config RISCV_ISA_ZABHA
 	bool "Zabha extension support for atomic byte/halfword operations"
@@ -699,6 +703,8 @@ config TOOLCHAIN_HAS_ZACAS
 	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zacas)
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zacas)
 	depends on AS_HAS_OPTION_ARCH
+	depends on !RUST || !64BIT || $(rust-bindgen-option,-- -mabi=lp64 -march=rv64ima_zacas)
+	depends on !RUST || !32BIT || $(rust-bindgen-option,-- -mabi=ilp32 -march=rv32ima_zacas)
 
 config RISCV_ISA_ZACAS
 	bool "Zacas extension support for atomic CAS"
@@ -717,6 +723,8 @@ config TOOLCHAIN_HAS_ZBB
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbb)
 	depends on LD_IS_LLD || LD_VERSION >= 23900
 	depends on AS_HAS_OPTION_ARCH
+	depends on !RUST || !64BIT || $(rust-bindgen-option,-- -mabi=lp64 -march=rv64ima_zbb)
+	depends on !RUST || !32BIT || $(rust-bindgen-option,-- -mabi=ilp32 -march=rv32ima_zbb)
 
 # This symbol indicates that the toolchain supports all v1.0 vector crypto
 # extensions, including Zvk*, Zvbb, and Zvbc.  LLVM added all of these at once.
@@ -732,6 +740,8 @@ config TOOLCHAIN_HAS_ZBA
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zba)
 	depends on LD_IS_LLD || LD_VERSION >= 23900
 	depends on AS_HAS_OPTION_ARCH
+	depends on !RUST || !64BIT || $(rust-bindgen-option,-- -mabi=lp64 -march=rv64ima_zba)
+	depends on !RUST || !32BIT || $(rust-bindgen-option,-- -mabi=ilp32 -march=rv32ima_zba)
 
 config RISCV_ISA_ZBA
 	bool "Zba extension support for bit manipulation instructions"
@@ -767,6 +777,8 @@ config TOOLCHAIN_HAS_ZBC
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbc)
 	depends on LD_IS_LLD || LD_VERSION >= 23900
 	depends on AS_HAS_OPTION_ARCH
+	depends on !RUST || !64BIT || $(rust-bindgen-option,-- -mabi=lp64 -march=rv64ima_zbc)
+	depends on !RUST || !32BIT || $(rust-bindgen-option,-- -mabi=ilp32 -march=rv32ima_zbc)
 
 config RISCV_ISA_ZBC
 	bool "Zbc extension support for carry-less multiplication instructions"
@@ -790,6 +802,8 @@ config TOOLCHAIN_HAS_ZBKB
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbkb)
 	depends on LD_IS_LLD || LD_VERSION >= 23900
 	depends on AS_HAS_OPTION_ARCH
+	depends on !RUST || !64BIT || $(rust-bindgen-option,-- -mabi=lp64 -march=rv64ima_zbkb)
+	depends on !RUST || !32BIT || $(rust-bindgen-option,-- -mabi=ilp32 -march=rv32ima_zbkb)
 
 config RISCV_ISA_ZBKB
 	bool "Zbkb extension support for bit manipulation instructions"
@@ -877,6 +891,25 @@ config TOOLCHAIN_NEEDS_OLD_ISA_SPEC
 	  versions of clang and GCC to be passed to GAS, which has the same result
 	  as passing zicsr and zifencei to -march.
 
+config RUST_BINDGEN_HAS_ZICSR_ZIFENCEI
+	def_bool y
+	depends on !64BIT || $(rust-bindgen-option,-- -mabi=lp64 -march=rv64ima_zicsr_zifencei)
+	depends on !32BIT || $(rust-bindgen-option,-- -mabi=ilp32 -march=rv32ima_zicsr_zifencei)
+
+config TOOLCHAIN_MATCHES_ZICSR_ZIFENCEI
+	def_bool y
+	# https://github.com/llvm/llvm-project/commit/22e199e6afb1263c943c0c0d4498694e15bf8a16
+	depends on TOOLCHAIN_NEEDS_OLD_ISA_SPEC || !TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI || RUST_BINDGEN_HAS_ZICSR_ZIFENCEI
+	help
+	  LLVM/Clang >= 17.0.0 starts recognizing Zicsr/Zifencei in -march, passing
+	  them to -march doesn't generate an error anymore, and passing them or not
+	  doesn't have any real difference, it still follows ISA before version
+	  20190608 - Zicsr/Zifencei are included in base ISA.
+
+	  The current latest version of LLVM/Clang still does not require explicit
+	  Zicsr/Zifencei to enable these two extensions, Clang just accepts them in
+	  -march and then silently ignores them.
+
 config FPU
 	bool "FPU support"
 	default y
diff --git a/rust/Makefile b/rust/Makefile
index ae7cbbd89da3..1f209e6025e4 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -298,7 +298,8 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 	-fno-inline-functions-called-once -fsanitize=bounds-strict \
 	-fstrict-flex-arrays=% -fmin-function-alignment=% \
 	-fzero-init-padding-bits=% -mno-fdpic \
-	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference
+	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference \
+	-mno-riscv-attribute
 
 # All warnings are inhibited since GCC builds are very experimental,
 # many GCC warnings are not supported by Clang, they may only appear in
diff --git a/scripts/Makefile.rust b/scripts/Makefile.rust
index b219244cd051..cee28a604830 100644
--- a/scripts/Makefile.rust
+++ b/scripts/Makefile.rust
@@ -3,6 +3,7 @@ BINDGEN_TARGET_x86	:= x86_64-linux-gnu
 BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
 BINDGEN_TARGET_arm	:= arm-linux-gnueabi
 BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
+BINDGEN_TARGET_riscv	:= riscv64-linux-gnu
 BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 

-- 
2.51.1


