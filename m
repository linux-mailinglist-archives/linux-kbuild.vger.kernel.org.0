Return-Path: <linux-kbuild+bounces-8696-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81207B4297C
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Sep 2025 21:09:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34C2F3BE9C3
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Sep 2025 19:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68F69320CB6;
	Wed,  3 Sep 2025 19:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NA8MV0u4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DB22D8798;
	Wed,  3 Sep 2025 19:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756926532; cv=none; b=X0alenFh4R2kOp2foVlmfNe/0pyoW/tzfeAllQI9a1Z15IAA69UNxnu0Z41td/5phPuY24YaKrlZ14/X6EG2sjnqhe1OwTKj15YoTjaKvw5GvabY5cEwhbpo1nWKiLc/MzIdOsKKr5qxBfQpghmwliF9aREV4LbJ21d0BjHjugs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756926532; c=relaxed/simple;
	bh=i0SnpOsh+zDbQqTgyRxh9UmVSO026PbogswX8txBdDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SV0c/xrVMcbAdyS0+m4On4mAk3kXMzArrv5snnCSFaXJlNKQzI3z0UC8mSpTc3b5Sj6xKTGFRSsDad/ku7LzKKjs0LKM/D4uKPQ0/hn5k9EYwch1S7BuvJbkE25acF6a9It+Dj6v/ZtrvREnvwRqjDV1Y29eXwsbaDJYJM2m39g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NA8MV0u4; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55f720ffe34so239471e87.1;
        Wed, 03 Sep 2025 12:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756926527; x=1757531327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YuqW8s/GrQuCxdo+FagO/ZJ3gDLQBEgzobOP4r3w3ko=;
        b=NA8MV0u41dVTn7qCWtcaXliE0gqQLnZ3y2jEUFGKDRo48lADLjiyzf/mMaB4wiDrQB
         x/BhvesR1XEzwHBEXcUPmlkGbBarIoH4NC4fxmXT2cOblGIKRCjBf+MdDABdRUymxJZ3
         hqhRFWE2haDCTEt+lNzErWvtBmNdGwuJ5oqiU7YBkfN2msUHuLN02T8gKfrrtHry7h8F
         HqwmF+T1egEBgm+SpYMMJdlDzyeNS4qSY+AnutMq0l/B2/inqAhImBVC8yNT81jWI2JM
         Cf+b8UhWZ1Y2uQkKm7dcuAbL+eQnVDqaYanE8eq6C+g6IRQysvs/AglR3TRPJG20aRTl
         wv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756926527; x=1757531327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YuqW8s/GrQuCxdo+FagO/ZJ3gDLQBEgzobOP4r3w3ko=;
        b=f9ZvcO9ptC9q+MSG6TN0a3fa6XPNWuhlP9JSDAUN6F4SjvAzg7h4Ve7/id3CPnsq2v
         YbZXdYGvpUYQa9A2WUWM3Y+mqzVRfrQO5Fxn0HCCG491hZFJ1bkHFvmJMrDVgZUEzf25
         VehSSVk33KI1DRQD7lNZYCETMwW0TypOxRfdbBv76TzrkueTahGBqKAuKGXC/2Y58DiD
         Ps4uJ/w3sKMTnJnQjZ5H/tMAZznr53gF4jFLxCgCWuyl9N+1ZZagq/1p5OzQcK0EoBIf
         9Vj5pZOVpQmUskhwFCCQzzy5OFCXeOfdlCcqhbDyma2fl5YSv0qZbzM2QWOPSiK054zn
         6VJA==
X-Forwarded-Encrypted: i=1; AJvYcCWi45uS6NulXaCYP5xwR0+emleZGQbRNWji4d3IlyaTba/CsBlVq2TuHWDNeDrNAQODWKfY4odDEGTU12o=@vger.kernel.org, AJvYcCXXkvvb3zy3XEgt1GySVdVRPbQyqfqUIxDY7+c9fbXVFcBsKTdzTsQ93o5GcAviESjvhBdfvcWbEErpiDjz@vger.kernel.org
X-Gm-Message-State: AOJu0YyWI23wtNoUH0pnf1tYa+uTEwt6J3CI9aIrjj1X4KSYG268ft9c
	mUmXz1U3HcA5vscsVmOin8bMC90mOuiPcUsddLO/r402vwJtbOp/tAEP
X-Gm-Gg: ASbGncsPrEzKRyvl6z6C+OISddZLMGka/f1ZbYBd5X84ETThvS7qDqb/pqA3+jcMu0G
	dEw6+j5Ik689NqJEdfllPRDgbfhQ/EmvWm3NNfJRrbX5ukXmCdJAXZhuJWg9Gs9lzdAGt9mZxxJ
	Lalic/39HM2s/c3nHYumSCFJv6sYpGyNOy2cIItAoD/r15ImHYLqOO86Do+4OCsG4CEk3RjWRuO
	CiwTH8tdBo8JwBK+tW0G9oDPO17aH1KTKAzJJm5WtPZGJGvk3ZlZMZauVi3NqR9Vu8DtpDMxWGk
	dPvnbYAbusKQZD5cy0MrmDnZqE6icfisfRRRgkBePHmAcf7olzgxNStnxQR/uXtmgdFPkNOGU23
	lIzQdSDZgeShDhYc=
X-Google-Smtp-Source: AGHT+IGeLOsgTzLKAVqJ8opF2BGock8RjsxhwYT3ip3FdcviWEaHSKrolQW6jrN3tbOJ9N1o46sMgQ==
X-Received: by 2002:ac2:5f72:0:b0:55f:552c:f731 with SMTP id 2adb3069b0e04-55f6f6b4c11mr3572097e87.7.1756926526560;
        Wed, 03 Sep 2025 12:08:46 -0700 (PDT)
Received: from minun.felixc.at ([2a01:4f9:6b:1cc4::2])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-5608abccc75sm704484e87.62.2025.09.03.12.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 12:08:46 -0700 (PDT)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
To: Conor Dooley <conor@kernel.org>,
	Jason Montleon <jmontleo@redhat.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Tejun Heo <tj@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Matthew Maurer <mmaurer@google.com>,
	Jeff Xu <jeffxu@chromium.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Jan Hendrik Farr <kernel@jfarr.cc>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Christian Brauner <brauner@kernel.org>,
	Brian Gerst <brgerst@gmail.com>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	Asuna Yang <SpriteOvO@gmail.com>
Subject: [PATCH 2/2] RISC-V: re-enable gcc + rust builds
Date: Wed,  3 Sep 2025 21:07:57 +0200
Message-ID: <20250903190806.2604757-2-SpriteOvO@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903190806.2604757-1-SpriteOvO@gmail.com>
References: <20250830-cheesy-prone-ee5fae406c22@spud>
 <20250903190806.2604757-1-SpriteOvO@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 33549fcf37ec ("RISC-V: disallow gcc + rust builds") disabled GCC
+ Rust builds for RISC-V due to differences in extension handling
compared to LLVM.

Add a Kconfig non-visible symbol to ensure that all important RISC-V
specific flags that will be used by GCC can be correctly recognized by
Rust bindgen's libclang, otherwise config HAVE_RUST will not be
selected.

Signed-off-by: Asuna Yang <SpriteOvO@gmail.com>
---
 Documentation/rust/arch-support.rst |  2 +-
 arch/riscv/Kconfig                  | 62 ++++++++++++++++++++++++++++-
 rust/Makefile                       |  7 +++-
 3 files changed, 68 insertions(+), 3 deletions(-)

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
index 1c5544401530..d7f421e0f429 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -195,7 +195,7 @@ config RISCV
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RETHOOK if !XIP_KERNEL
 	select HAVE_RSEQ
-	select HAVE_RUST if RUSTC_SUPPORTS_RISCV && CC_IS_CLANG
+	select HAVE_RUST if RUSTC_SUPPORTS_RISCV && RUST_BINDGEN_LIBCLANG_RECOGNIZES_FLAGS
 	select HAVE_SAMPLE_FTRACE_DIRECT
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
 	select HAVE_STACKPROTECTOR
@@ -236,6 +236,27 @@ config RUSTC_SUPPORTS_RISCV
 	# -Zsanitizer=shadow-call-stack flag.
 	depends on !SHADOW_CALL_STACK || RUSTC_VERSION >= 108200
 
+config RUST_BINDGEN_LIBCLANG_RECOGNIZES_FLAGS
+	def_bool y
+	depends on RUST_BINDGEN_LIBCLANG_RECOGNIZES_V
+	depends on RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZABHA
+	depends on RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZACAS
+	depends on RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZBA
+	depends on RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZBB
+	depends on RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZBC
+	depends on RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZBKB
+	depends on RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZICSR_ZIFENCEI
+	help
+	  Rust bindgen currently relies on libclang as backend. When a mixed build is
+	  performed (building C code with GCC), GCC flags will be passed to libclang.
+	  However, not all GCC flags are recognized by Clang, so most of the
+	  incompatible flags have been filtered out in rust/Makefile.
+
+	  For RISC-V, GCC and Clang are not at the same pace of implementing extensions.
+	  This config ensures that all important RISC-V specific flags that will be
+	  used by GCC can be correctly recognized by Rust bindgen's libclang, otherwise
+	  config HAVE_RUST will not be selected.
+
 config CLANG_SUPPORTS_DYNAMIC_FTRACE
 	def_bool CC_IS_CLANG
 	# https://github.com/ClangBuiltLinux/linux/issues/1817
@@ -634,6 +655,11 @@ config TOOLCHAIN_HAS_V
 	depends on LLD_VERSION >= 140000 || LD_VERSION >= 23800
 	depends on AS_HAS_OPTION_ARCH
 
+config RUST_BINDGEN_LIBCLANG_RECOGNIZES_V
+	def_bool y
+	# https://github.com/llvm/llvm-project/commit/e6de53b4de4aecca4ac892500a0907805896ed27
+	depends on !TOOLCHAIN_HAS_V || RUST_BINDGEN_LIBCLANG_VERSION >= 140000
+
 config RISCV_ISA_V
 	bool "Vector extension support"
 	depends on TOOLCHAIN_HAS_V
@@ -698,6 +724,11 @@ config TOOLCHAIN_HAS_ZABHA
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zabha)
 	depends on AS_HAS_OPTION_ARCH
 
+config RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZABHA
+	def_bool y
+	# https://github.com/llvm/llvm-project/commit/6b7444964a8d028989beee554a1f5c61d16a1cac
+	depends on !TOOLCHAIN_HAS_ZABHA || RUST_BINDGEN_LIBCLANG_VERSION >= 190100
+
 config RISCV_ISA_ZABHA
 	bool "Zabha extension support for atomic byte/halfword operations"
 	depends on TOOLCHAIN_HAS_ZABHA
@@ -716,6 +747,11 @@ config TOOLCHAIN_HAS_ZACAS
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zacas)
 	depends on AS_HAS_OPTION_ARCH
 
+config RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZACAS
+	def_bool y
+	# https://github.com/llvm/llvm-project/commit/614aeda93b2225c6eb42b00ba189ba7ca2585c60
+	depends on !TOOLCHAIN_HAS_ZACAS || RUST_BINDGEN_LIBCLANG_VERSION >= 200100
+
 config RISCV_ISA_ZACAS
 	bool "Zacas extension support for atomic CAS"
 	depends on TOOLCHAIN_HAS_ZACAS
@@ -735,6 +771,11 @@ config TOOLCHAIN_HAS_ZBB
 	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
 	depends on AS_HAS_OPTION_ARCH
 
+config RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZBB
+	def_bool y
+	# https://github.com/llvm/llvm-project/commit/33d008b169f3c813a4a45da220d0952f795ac477
+	depends on !TOOLCHAIN_HAS_ZBB || RUST_BINDGEN_LIBCLANG_VERSION >= 140000
+
 # This symbol indicates that the toolchain supports all v1.0 vector crypto
 # extensions, including Zvk*, Zvbb, and Zvbc.  LLVM added all of these at once.
 # binutils added all except Zvkb, then added Zvkb.  So we just check for Zvkb.
@@ -750,6 +791,11 @@ config TOOLCHAIN_HAS_ZBA
 	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
 	depends on AS_HAS_OPTION_ARCH
 
+config RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZBA
+	def_bool y
+	# https://github.com/llvm/llvm-project/commit/33d008b169f3c813a4a45da220d0952f795ac477
+	depends on !TOOLCHAIN_HAS_ZBA || RUST_BINDGEN_LIBCLANG_VERSION >= 140000
+
 config RISCV_ISA_ZBA
 	bool "Zba extension support for bit manipulation instructions"
 	default y
@@ -785,6 +831,11 @@ config TOOLCHAIN_HAS_ZBC
 	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
 	depends on AS_HAS_OPTION_ARCH
 
+config RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZBC
+	def_bool y
+	# https://github.com/llvm/llvm-project/commit/33d008b169f3c813a4a45da220d0952f795ac477
+	depends on !TOOLCHAIN_HAS_ZBC || RUST_BINDGEN_LIBCLANG_VERSION >= 140000
+
 config RISCV_ISA_ZBC
 	bool "Zbc extension support for carry-less multiplication instructions"
 	depends on TOOLCHAIN_HAS_ZBC
@@ -808,6 +859,11 @@ config TOOLCHAIN_HAS_ZBKB
 	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
 	depends on AS_HAS_OPTION_ARCH
 
+config RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZBKB
+	def_bool y
+	# https://github.com/llvm/llvm-project/commit/7ee1c162cc53d37f717f9a138276ad64fa6863bc
+	depends on !TOOLCHAIN_HAS_ZBKB || RUST_BINDGEN_LIBCLANG_VERSION >= 140000
+
 config RISCV_ISA_ZBKB
 	bool "Zbkb extension support for bit manipulation instructions"
 	depends on TOOLCHAIN_HAS_ZBKB
@@ -894,6 +950,10 @@ config TOOLCHAIN_NEEDS_OLD_ISA_SPEC
 	  versions of clang and GCC to be passed to GAS, which has the same result
 	  as passing zicsr and zifencei to -march.
 
+config RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZICSR_ZIFENCEI
+	def_bool y
+	depends on TOOLCHAIN_NEEDS_OLD_ISA_SPEC || (TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI && RUST_BINDGEN_LIBCLANG_VERSION >= 170000)
+
 config FPU
 	bool "FPU support"
 	default y
diff --git a/rust/Makefile b/rust/Makefile
index 34d0429d50fd..7b1055c98146 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -277,20 +277,25 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 -mpreferred-stack-boundary=% \
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
-- 
2.51.0


