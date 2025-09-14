Return-Path: <linux-kbuild+bounces-8818-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97457B56727
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Sep 2025 09:17:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A08443BE428
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Sep 2025 07:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E919A220F5C;
	Sun, 14 Sep 2025 07:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVEriKaV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76C420DD51
	for <linux-kbuild@vger.kernel.org>; Sun, 14 Sep 2025 07:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757834244; cv=none; b=MevcgMTJsMmObuiXr2GhwnYDIuuG3qkHBKMP/xZ8sS0PUs9vPo1LCa5BAclGykZEfmkcjgI25OUggThwvRucW5K2+Kf8/X9aKw6HtJW0Whl22WWMAt8qFuHHGj54bGPCO+sgEWSnXtm57Ipgg/B+A8p2UKTg5fRm5ryUfwbR000=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757834244; c=relaxed/simple;
	bh=G9zdYvr6zoyBaWWF4RcGMv4hY9mXUIz9lI5ZVt3JFEQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GU7ksKdwvrsh9rK0X21jer8FixnIN/Fcr1sMO+QzItjWvinhukW5sbPBVgvq5bIpfhFALMMyG07Ibbx1FSxOjfS2zxo+0U7LUCgLBMJme95GYVCkK+TvBtYRfW2RxVy/xTft4jLZcd7i7COly63N2n6ultF+KCpax8B4pqVT4Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVEriKaV; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55f74c6d316so3416894e87.0
        for <linux-kbuild@vger.kernel.org>; Sun, 14 Sep 2025 00:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757834240; x=1758439040; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bG3IzL2LjXVOtESbexoXtNfTjZZg9on0erahEnGwuyw=;
        b=eVEriKaVPaysWMyRbjl8ZUI5bzFQm1cn/14TVjDuK2a0JC3/VS69knkyOamMemHhsm
         QOc8DV83dDPGJzsib3pAnzu+UPWXSWBPqs4Q9MaRjY7RuzCyBNmw7kVL8nq8DwkqJ+o1
         6NFHNMe65GXZUpeNJp5KqG//KQWjiYSgNKldGop6OZJ7ZODL/Z6jr5zBOjjQobwZ2XZc
         5JrDKWs4frjNxHCMwJ4EecbkEbPdsvGBcdtsMuLVvNOQODdXUNaT3mrzqtYeJsJVUuga
         7rBU/VhSSb1HqaulWUgTYYFJIK8P2NLhLnMO1IwdbaZ7uuxr5gFX1zlbsgHPZh39m/qT
         IRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757834240; x=1758439040;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bG3IzL2LjXVOtESbexoXtNfTjZZg9on0erahEnGwuyw=;
        b=X3Fm93g6vKbG6Hy95uXPaE6nLoCMl2hsVPwigVaMZvklo9a2ZepV5IJLEvUttvS4MU
         hM9T9QxPXB4XpX4BohEfI9SjGjU/15lgEviyiitxo8aO8ZSrZK9El1J6sOGWFIlDKS0Q
         /aublDE2X62w5oX2RKFnwhcXV5POYq+qWlSITqTmQdxTqfkGJHzcYxz0pnstYwvZfumo
         ET8K8nIr8GaG2xzAdeThiJePhqej/uxYOkUh8LWBvSLnVSJQKXFauexB0RF4C4skZ3zQ
         ph2pJu8w6J1xtnHJqGNFQhSQQf/TFhVwFaproPpTpZXuz0zypxosY58EWDrBNGIdDJr0
         IpKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtJT46jhWg4iFhtV5hha3ztIaEtQWyMZnNXL3oBoYJmYNzheresh+ahQ6Ob208iG/karTFeaYdEXOsHo0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyna2p08S/L4yMxWgSpo6PiVwbk3gmWlFLTfe9TtmFnItwsfO2B
	cN/E3/cAe0eCWhJZQEhoK9q1lloQ7ZSA5MfxitZ+Y0HctHB+pkdpdoRg
X-Gm-Gg: ASbGncsRCRYzc46ovoAompwdmz/fM1wOoYk5BM9YsEpOvUJgTmWEuyI4L/Wr9J1ng/s
	0WwIAuhKLGO2V5Y3QD/j0KccMRElafXCZMph9EYV0TG46JNyu4P8x0JCghEXCqoTl6tYKXzaJZ9
	mKArTmzGBfzhU5TXJSgkm17/m5qX4EA9Vmqewt1JYl2N0Lue0VDeiigYT3qg7oJNeRBzuUSaLtc
	IRaW8z8o6R6op+GEjQWx+est3ImPabepTKxEV1QtCzmCpO8vTvN3EkLAdP72pHkbUa52Y86gSUw
	MHOgOyw1c/LYeWlvCZccDyCeiPhVGQRfCD0o1JBM+Vn6mzfu9e1QL7hLtNRfk5OCGmiHVXRU9zQ
	Ocvrl
X-Google-Smtp-Source: AGHT+IGuqlVGw+pNXypOYIGLs5ZdoCHzOKrf3n1RDu4cLKNgN6KSPHqq382i7oXWa1WvUEscJbrQ1g==
X-Received: by 2002:a05:6512:3043:b0:560:956e:4392 with SMTP id 2adb3069b0e04-570489fca64mr2505069e87.9.1757834239309;
        Sun, 14 Sep 2025 00:17:19 -0700 (PDT)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-56e5c3b62c9sm2572478e87.27.2025.09.14.00.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 00:17:18 -0700 (PDT)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Date: Sun, 14 Sep 2025 15:16:40 +0800
Subject: [PATCH v3] RISC-V: re-enable gcc + rust builds
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250914-gcc-rust-v3-v3-1-34d4d5864144@gmail.com>
X-B4-Tracking: v=1; b=H4sIANdrxmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDI1MDS0MT3fTkZN2i0uIS3TJj3UQTQ1OTRAsjMwMTUyWgjoKi1LTMCrBp0bG
 1tQBGHRiyXQAAAA==
X-Change-ID: 20250914-gcc-rust-v3-a4154a826045
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Han Gao <rabenda.cn@gmail.com>, Jason Montleon <jmontleo@redhat.com>, 
 Conor Dooley <conor@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
 Asuna Yang <SpriteOvO@gmail.com>
X-Mailer: b4 0.14.2

Commit 33549fcf37ec ("RISC-V: disallow gcc + rust builds") disabled GCC
+ Rust builds for RISC-V due to differences in extension handling
compared to LLVM.

Add a Kconfig symbol to indicate the version of libclang used by Rust
bindgen and add conditions for the availability of libclang to the
RISC-V extension Kconfig symbols that depend on the cc-option function.

For Zicsr/Zifencei special handling, since LLVM/Clang always enables
these two extensions, either don't pass them to -march, or pass them
explicitly and Rust bindgen libclang must recognize them.

Clang does not support -mno-riscv-attribute flag, filter it out to
resolve error: unknown argument: '-mno-riscv-attribute'.

Define BINDGEN_TARGET_riscv to pass the target triplet to Rust bindgen
libclang for RISC-V to resolve error: unsupported argument 'medany' to
option '-mcmodel=' for target 'unknown'. Improve to output a clearer
error message if the target triplet is undefined for Rust bindgen
libclang.

Update the documentation, GCC + Rust builds are now supported.

Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
---
 Documentation/rust/arch-support.rst |  2 +-
 arch/riscv/Kconfig                  | 30 +++++++++++++++++++++++++++++-
 init/Kconfig                        |  6 ++++++
 rust/Makefile                       |  7 ++++++-
 scripts/Kconfig.include             |  1 +
 5 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index 6e6a515d08991a130a8e79dc4ad7ad09da244020..5282e0e174e8de66b4c6fec354cf329fd2aec873 100644
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
index 51dcd8eaa24356d947ebe0f1c4a701a3cfc6b757..3e892864f930778218073e8ee5980eb8f4e1594a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -191,7 +191,7 @@ config RISCV
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RETHOOK if !XIP_KERNEL
 	select HAVE_RSEQ
-	select HAVE_RUST if RUSTC_SUPPORTS_RISCV && CC_IS_CLANG
+	select HAVE_RUST if RUSTC_SUPPORTS_RISCV && TOOLCHAIN_MATCHES_ZICSR_ZIFENCEI
 	select HAVE_SAMPLE_FTRACE_DIRECT
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
 	select HAVE_STACKPROTECTOR
@@ -629,6 +629,8 @@ config TOOLCHAIN_HAS_V
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32imv)
 	depends on LLD_VERSION >= 140000 || LD_VERSION >= 23800
 	depends on AS_HAS_OPTION_ARCH
+	# https://github.com/llvm/llvm-project/commit/e6de53b4de4aecca4ac892500a0907805896ed27
+	depends on !RUST || RUST_BINDGEN_LIBCLANG_VERSION >= 140000
 
 config RISCV_ISA_V
 	bool "Vector extension support"
@@ -693,6 +695,8 @@ config TOOLCHAIN_HAS_ZABHA
 	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zabha)
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zabha)
 	depends on AS_HAS_OPTION_ARCH
+	# https://github.com/llvm/llvm-project/commit/6b7444964a8d028989beee554a1f5c61d16a1cac
+	depends on !RUST || RUST_BINDGEN_LIBCLANG_VERSION >= 190100
 
 config RISCV_ISA_ZABHA
 	bool "Zabha extension support for atomic byte/halfword operations"
@@ -711,6 +715,8 @@ config TOOLCHAIN_HAS_ZACAS
 	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zacas)
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zacas)
 	depends on AS_HAS_OPTION_ARCH
+	# https://github.com/llvm/llvm-project/commit/614aeda93b2225c6eb42b00ba189ba7ca2585c60
+	depends on !RUST || RUST_BINDGEN_LIBCLANG_VERSION >= 200100
 
 config RISCV_ISA_ZACAS
 	bool "Zacas extension support for atomic CAS"
@@ -730,6 +736,8 @@ config TOOLCHAIN_HAS_ZBB
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbb)
 	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
 	depends on AS_HAS_OPTION_ARCH
+	# https://github.com/llvm/llvm-project/commit/33d008b169f3c813a4a45da220d0952f795ac477
+	depends on !RUST || RUST_BINDGEN_LIBCLANG_VERSION >= 140000
 
 # This symbol indicates that the toolchain supports all v1.0 vector crypto
 # extensions, including Zvk*, Zvbb, and Zvbc.  LLVM added all of these at once.
@@ -745,6 +753,8 @@ config TOOLCHAIN_HAS_ZBA
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zba)
 	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
 	depends on AS_HAS_OPTION_ARCH
+	# https://github.com/llvm/llvm-project/commit/33d008b169f3c813a4a45da220d0952f795ac477
+	depends on !RUST || RUST_BINDGEN_LIBCLANG_VERSION >= 140000
 
 config RISCV_ISA_ZBA
 	bool "Zba extension support for bit manipulation instructions"
@@ -780,6 +790,8 @@ config TOOLCHAIN_HAS_ZBC
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbc)
 	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
 	depends on AS_HAS_OPTION_ARCH
+	# https://github.com/llvm/llvm-project/commit/33d008b169f3c813a4a45da220d0952f795ac477
+	depends on !RUST || RUST_BINDGEN_LIBCLANG_VERSION >= 140000
 
 config RISCV_ISA_ZBC
 	bool "Zbc extension support for carry-less multiplication instructions"
@@ -803,6 +815,8 @@ config TOOLCHAIN_HAS_ZBKB
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbkb)
 	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
 	depends on AS_HAS_OPTION_ARCH
+	# https://github.com/llvm/llvm-project/commit/7ee1c162cc53d37f717f9a138276ad64fa6863bc
+	depends on !RUST || RUST_BINDGEN_LIBCLANG_VERSION >= 140000
 
 config RISCV_ISA_ZBKB
 	bool "Zbkb extension support for bit manipulation instructions"
@@ -890,6 +904,20 @@ config TOOLCHAIN_NEEDS_OLD_ISA_SPEC
 	  versions of clang and GCC to be passed to GAS, which has the same result
 	  as passing zicsr and zifencei to -march.
 
+config TOOLCHAIN_MATCHES_ZICSR_ZIFENCEI
+	def_bool y
+	# https://github.com/llvm/llvm-project/commit/22e199e6afb1263c943c0c0d4498694e15bf8a16
+	depends on TOOLCHAIN_NEEDS_OLD_ISA_SPEC || !TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI || RUST_BINDGEN_LIBCLANG_VERSION >= 170000
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
diff --git a/init/Kconfig b/init/Kconfig
index e3eb63eadc8757a10b091c74bbee8008278c0521..0859d308a48591df769c7dbaef6f035324892bd3 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -82,6 +82,12 @@ config RUSTC_LLVM_VERSION
 	int
 	default $(rustc-llvm-version)
 
+config RUST_BINDGEN_LIBCLANG_VERSION
+	int
+	default $(rustc-bindgen-libclang-version)
+	help
+	  This is the version of `libclang` used by the Rust bindings generator.
+
 config CC_CAN_LINK
 	bool
 	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m64-flag)) if 64BIT
diff --git a/rust/Makefile b/rust/Makefile
index bfa915b0e58854045b367557342727fee4fe2808..8c6f84487c41880816d1e55ba4c0df0e5af4e8fd 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -290,20 +290,25 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
 	-fno-inline-functions-called-once -fsanitize=bounds-strict \
 	-fstrict-flex-arrays=% -fmin-function-alignment=% \
 	-fzero-init-padding-bits=% -mno-fdpic \
-	--param=% --param asan-%
+	--param=% --param asan-% -mno-riscv-attribute
 
 # Derived from `scripts/Makefile.clang`.
 BINDGEN_TARGET_x86	:= x86_64-linux-gnu
 BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
 BINDGEN_TARGET_arm	:= arm-linux-gnueabi
 BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
+BINDGEN_TARGET_riscv	:= riscv64-linux-gnu
 BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
 BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))
 
+ifeq ($(BINDGEN_TARGET),)
+$(error add '--target=' option to rust/Makefile)
+else
 # All warnings are inhibited since GCC builds are very experimental,
 # many GCC warnings are not supported by Clang, they may only appear in
 # some configurations, with new GCC versions, etc.
 bindgen_extra_c_flags = -w --target=$(BINDGEN_TARGET)
+endif
 
 # Auto variable zero-initialization requires an additional special option with
 # clang that is going to be removed sometime in the future (likely in
diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 33193ca6e8030e659d6b321acaea1acd42c387a4..b893bbc130f774bdca831893fed9b76d42bf540a 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -67,6 +67,7 @@ m64-flag := $(cc-option-bit,-m64)
 
 rustc-version := $(shell,$(srctree)/scripts/rustc-version.sh $(RUSTC))
 rustc-llvm-version := $(shell,$(srctree)/scripts/rustc-llvm-version.sh $(RUSTC))
+rustc-bindgen-libclang-version := $(shell,trap 'echo 0' EXIT; $(BINDGEN) $(srctree)/scripts/rust_is_available_bindgen_libclang.h 2>&1 | sed -nE 's:.*clang version ([0-9]+\.[0-9]+\.[0-9]+).*:\1:p' | awk -F'.' '{print $1 * 10000 + $2 * 100 + $3}')
 
 # $(rustc-option,<flag>)
 # Return y if the Rust compiler supports <flag>, n otherwise

---
base-commit: f777d1112ee597d7f7dd3ca232220873a34ad0c8
change-id: 20250914-gcc-rust-v3-a4154a826045

Best regards,
-- 
Asuna Yang <SpriteOvO@gmail.com>


