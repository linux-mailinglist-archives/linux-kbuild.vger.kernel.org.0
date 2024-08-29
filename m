Return-Path: <linux-kbuild+bounces-3282-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F85F963E45
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Aug 2024 10:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6FB53B22AE5
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Aug 2024 08:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ADBB18C029;
	Thu, 29 Aug 2024 08:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z4T8T6D6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EAA18B492
	for <linux-kbuild@vger.kernel.org>; Thu, 29 Aug 2024 08:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724919801; cv=none; b=hovwyfrW893gw9LkAinkpk/U50//5Kx6e/eDB6Txk1Bzs6t7X/ZWnokTTL84e5/UdngknmXthZOf+yZYN95y9T/LhD6cjfn3TRFxLtRBLiweNG8RcntxmV/2Aruoj7215iymYrRgh41T1AwM6VL4LUAVZ3G8ApNK9BcotsPTfYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724919801; c=relaxed/simple;
	bh=VLdwL20LiNzTUaWtt93FFxTZ648rvn76IDWLN5/vv4Q=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=bWB3mgw9uOB5y1B/aZcIQJDe+W3hVqjde5cS/oyOPHWJWk7/m6WqYy5ett5MnIU3UM795Wj4lX9023SOkg9rNRuEEZB2EE0XRyv3M0K3uw7Vw1xLW1SN0jkFP2fNYeoPgg6ztwPHCKUbyBRctCm7R5IiSloOYU9PWiZSj2vvCOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=z4T8T6D6; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e11796af1d0so598660276.3
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Aug 2024 01:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724919798; x=1725524598; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9RdvbeG3hnzyWF9MND8CckF4Y5Hzjn0WZIgh7L/jyIU=;
        b=z4T8T6D6KC13PPDfmjB7neTCdgeqwD9FwvSPoKagXvtKa6BjOLVnSvUiKfjCP0P3SV
         ypJOa3LBZp0c1KaEf+FXz+fwF9h+Pi2FG+a+WCdqYIuXbPSVUXxZxQwiGOje9e5edFST
         2uKa8ZnUadl+CQEfoo9FPzpby3Fu3eciLW+bz4ZTKVYRzNv6ZtOovTGHMcJdYNR+JhEp
         yP9AOghkhKqwb5rMBu92LIEMGehW498jROFd/6WA0qxWpbMvT7uFzVzCkOuTWcfwKI7G
         PFDJFON/4Sd99R4tkbCuoElp6O7xYmn82HHbIYbjBsP8ZvgL7YCgKRkw7D3DH4sycYGD
         hZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724919798; x=1725524598;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9RdvbeG3hnzyWF9MND8CckF4Y5Hzjn0WZIgh7L/jyIU=;
        b=TzNH0VxD5eJOm0Ghj+HLxqbmc980maayb1c0UvPsgWrHw9e83ThAEJJ21CC7WxNsmt
         +1kGVwTBEMaPM6frmjcw51rdpcvR4Kyu4WCvLX/sfKJ0W5hZLol/MWHVsUZSkr7nHOo+
         UWkXktPIp6MtmSxjT8c5OpEO87CTySzrQq47tz9TiOjWGshkbIm4FLLEpMudVeK/4ZoC
         5LISn0ujYwBGw+hOFzkJjuD17yIWoRL5V2DcSZYdkj8PThBprPnhpgSMnAcrOq76fEhp
         m//N5+Gs3vg8CdiBNG1A/s/RbAAdA4VIauKBJidTPrPamGdA4tLe0HPcOS4x5+ZVHo8p
         X7NA==
X-Forwarded-Encrypted: i=1; AJvYcCVlk55OxBYXVdq5pNYzSUIu7MfdYomxWRmZOEMTXtDN8ijsB5sovwvBflQYcl6LC8OLF+pmgprtcDkcSsA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyABX2klztucqzDuASP+KxNvvHBy0GfuHDUtOptyVNSnzqmx3XL
	MDibdZG/j1R7bM02uTTHhzOxaApEFgc3PGlYngOxzMa5mY8tTw5fKAzjimoO9kXkOCp1AYfX/Ao
	/K3I8H+CAp73nnw==
X-Google-Smtp-Source: AGHT+IFokD/yVvPfvQHwIqtYzdfKDhst22uRMPQK2UkcQgpj0CXoQ3GfhlgIXYvGU9+Xsj5TZTk5fiV0WBwvs3w=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a25:c54f:0:b0:e11:5f9f:f069 with SMTP id
 3f1490d57ef6-e1a5adf5550mr10086276.8.1724919798172; Thu, 29 Aug 2024 01:23:18
 -0700 (PDT)
Date: Thu, 29 Aug 2024 08:22:45 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANUv0GYC/33PTW7DIBAF4KtErEvFzwAmq94j6mIMYxvVDZWJn
 FaR716STVzZ6vKNNN+bubFCU6LCjocbm2hOJeVzDe7lwMKA5554ijUzJRQILYCXAWO+8oDjyMs
 Fwwf3QXqHoK2MntW9r4m69P0wT+81D6lc8vTzqJjlffqfNksueSeMIexAoApvfc79SK8hf7I7N
 6s1YfYIVYngWkDdQbTSbgj9JNz+FZoLHqUMDi21pMWGgBWh/B4BlVBoLbSiUYSwIcyTaITdI0x 9RNkYQtsoL82WsCtC7RK2EuANOtLUCur+EMuy/ALYkZ/hAgIAAA==
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=7498; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=VLdwL20LiNzTUaWtt93FFxTZ648rvn76IDWLN5/vv4Q=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBm0C/g26QBldwF4R1q5+2D0JMs4Ht23FBu5pV6l
 uyQHbWnFZGJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZtAv4AAKCRAEWL7uWMY5
 RlULEACXdQc0K9R587GDlUGJswtbNuo3QR+1aYblBU+3AtdqidLh+s8iLwdgJBfj3406ogldHQA
 Nx+FfEa0P0zLSDzKyvlqTuHP1LC0N9OsB91bdYBUGvZxxQwLWhXd8ZFnflmHrCZuiPpzEwfSYWG
 RnIFUctqaLrWG2l1hgX/vPPgamUrwtTx3lJGEwvpKjhIddol6WStWONtUyVHDZvSBgQZq2uKd2v
 Y6lRRlEY45oMxj5xOu5LcfOZ4WQWCaKKkSZ/W+RyxLhf2WUzYTrBH0XqfXtB80Q6nRxFkyWjzUB
 k4/4YRxL8b07XYi0x7yjXx37fUmQf0kiUBSrnzzUA616le7RTI4g7Esz2rWYVMew35/j5dPue3R
 9p/mk+UVbOysEcOCvaWp5Jsf3qhesQMmHWlOgaSKf21ByeGxVilaUDt401PmClMAvuVqe4Psh6K
 Hm6hpkKmtoCyKilxgqPHG2OY9LU1+YsFEZiBh+6AY4BvAKwK3n8YdhjwyM8JEZ4XhojHj0WQVp2
 DYffxzTOac0CYc+LqsAGdUJ/6nlL/ndyyT/PXariyjX0/pqgcDWF4yT/qTivSAHy8XlhH9tEqMm
 mYf0MDOIaoFh86FhXUGZ9I2SN6PCrB1xChyw19cMSZw6zTPY8l+3aNalTpi6B1/PtqRmMFB7L4I lXuvSdLH+/IJPrw==
X-Mailer: b4 0.13.0
Message-ID: <20240829-shadow-call-stack-v7-1-2f62a4432abf@google.com>
Subject: [PATCH v7] rust: support for shadow call stack sanitizer
From: Alice Ryhl <aliceryhl@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Kees Cook <kees@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Valentin Obst <kernel@valentinobst.de>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Add all of the flags that are needed to support the shadow call stack
(SCS) sanitizer with Rust, and updates Kconfig to allow only
configurations that work.

The -Zfixed-x18 flag is required to use SCS on arm64, and requires rustc
version 1.80.0 or greater. This restriction is reflected in Kconfig.

When CONFIG_DYNAMIC_SCS is enabled, the build will be configured to
include unwind tables in the build artifacts. Dynamic SCS uses the
unwind tables at boot to find all places that need to be patched. The
-Cforce-unwind-tables=y flag ensures that unwind tables are available
for Rust code.

In non-dynamic mode, the -Zsanitizer=shadow-call-stack flag is what
enables the SCS sanitizer. Using this flag requires rustc version 1.82.0
or greater on the targets used by Rust in the kernel. This restriction
is reflected in Kconfig.

It is possible to avoid the requirement of rustc 1.80.0 by using
-Ctarget-feature=+reserve-x18 instead of -Zfixed-x18. However, this flag
emits a warning during the build, so this patch does not add support for
using it and instead requires 1.80.0 or greater.

The dependency is placed on `select HAVE_RUST` to avoid a situation
where enabling Rust silently turns off the sanitizer. Instead, turning
on the sanitizer results in Rust being disabled. We generally do not
want changes to CONFIG_RUST to result in any mitigations being changed
or turned off.

At the time of writing, rustc 1.82.0 only exists via the nightly release
channel. There is a chance that the -Zsanitizer=shadow-call-stack flag
will end up needing 1.83.0 instead, but I think it is small.

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Reviewed-by: Kees Cook <kees@kernel.org>
Acked-by: Will Deacon <will@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
This patch depends on RUSTC_VERSION:
https://lore.kernel.org/rust-for-linux/20240808221138.873750-1-ojeda@kernel.org/
---
Changes in v7:
- Add comment to `config RUSTC_SUPPORTS_[ARM64|RISCV]`
- Pick up tags from reviewers.
- Link to v6: https://lore.kernel.org/r/20240826-shadow-call-stack-v6-1-495a7e3eb0ef@google.com

Changes in v6:
- Move Kconfig requirements into arch/*/Kconfig.
- List non-dynamic SCS as supported on 1.82. This reflects newly added
  things in rustc.
- Link to v5: https://lore.kernel.org/r/20240806-shadow-call-stack-v5-1-26dccb829154@google.com

Changes in v5:
- Rebase series on v6.11-rc2.
- The first patch is no longer included as it was merged in v6.11-rc2.
- The commit message is rewritten from scratch.
- Link to v4: https://lore.kernel.org/r/20240729-shadow-call-stack-v4-0-2a664b082ea4@google.com

Changes in v4:
- Move `depends on` to CONFIG_RUST.
- Rewrite commit messages to include more context.
- Link to v3: https://lore.kernel.org/r/20240704-shadow-call-stack-v3-0-d11c7a6ebe30@google.com

Changes in v3:
- Use -Zfixed-x18.
- Add logic to reject unsupported rustc versions.
- Also include a fix to be backported.
- Link to v2: https://lore.kernel.org/rust-for-linux/20240305-shadow-call-stack-v2-1-c7b4a3f4d616@google.com/

Changes in v2:
- Add -Cforce-unwind-tables flag.
- Link to v1: https://lore.kernel.org/rust-for-linux/20240304-shadow-call-stack-v1-1-f055eaf40a2c@google.com/
---
 Makefile            |  1 +
 arch/arm64/Kconfig  | 14 +++++++++++++-
 arch/arm64/Makefile |  3 +++
 arch/riscv/Kconfig  |  9 ++++++++-
 init/Kconfig        |  1 -
 5 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 68ebd6d6b444..2b384a72ff39 100644
--- a/Makefile
+++ b/Makefile
@@ -927,6 +927,7 @@ ifdef CONFIG_SHADOW_CALL_STACK
 ifndef CONFIG_DYNAMIC_SCS
 CC_FLAGS_SCS	:= -fsanitize=shadow-call-stack
 KBUILD_CFLAGS	+= $(CC_FLAGS_SCS)
+KBUILD_RUSTFLAGS += -Zsanitizer=shadow-call-stack
 endif
 export CC_FLAGS_SCS
 endif
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a2f8ff354ca6..827497df6fa3 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -231,7 +231,7 @@ config ARM64
 	select HAVE_FUNCTION_ARG_ACCESS_API
 	select MMU_GATHER_RCU_TABLE_FREE
 	select HAVE_RSEQ
-	select HAVE_RUST if CPU_LITTLE_ENDIAN
+	select HAVE_RUST if RUSTC_SUPPORTS_ARM64
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_KPROBES
@@ -265,6 +265,18 @@ config ARM64
 	help
 	  ARM 64-bit (AArch64) Linux support.
 
+config RUSTC_SUPPORTS_ARM64
+       def_bool y
+       depends on CPU_LITTLE_ENDIAN
+       # Shadow call stack is only supported on certain rustc versions.
+       #
+       # When using the UNWIND_PATCH_PAC_INTO_SCS option, rustc version 1.80+ is
+       # required due to use of the -Zfixed-x18 flag.
+       #
+       # Otherwise, rustc version 1.82+ is required due to use of the
+       # -Zsanitizer=shadow-call-stack flag.
+       depends on !SHADOW_CALL_STACK || RUSTC_VERSION >= 108200 || RUSTC_VERSION >= 108000 && UNWIND_PATCH_PAC_INTO_SCS
+
 config CLANG_SUPPORTS_DYNAMIC_FTRACE_WITH_ARGS
 	def_bool CC_IS_CLANG
 	# https://github.com/ClangBuiltLinux/linux/issues/1507
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index f6bc3da1ef11..b058c4803efb 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -57,9 +57,11 @@ KBUILD_AFLAGS	+= $(call cc-option,-mabi=lp64)
 ifneq ($(CONFIG_UNWIND_TABLES),y)
 KBUILD_CFLAGS	+= -fno-asynchronous-unwind-tables -fno-unwind-tables
 KBUILD_AFLAGS	+= -fno-asynchronous-unwind-tables -fno-unwind-tables
+KBUILD_RUSTFLAGS += -Cforce-unwind-tables=n
 else
 KBUILD_CFLAGS	+= -fasynchronous-unwind-tables
 KBUILD_AFLAGS	+= -fasynchronous-unwind-tables
+KBUILD_RUSTFLAGS += -Cforce-unwind-tables=y -Zuse-sync-unwind=n
 endif
 
 ifeq ($(CONFIG_STACKPROTECTOR_PER_TASK),y)
@@ -114,6 +116,7 @@ endif
 
 ifeq ($(CONFIG_SHADOW_CALL_STACK), y)
 KBUILD_CFLAGS	+= -ffixed-x18
+KBUILD_RUSTFLAGS += -Zfixed-x18
 endif
 
 ifeq ($(CONFIG_CPU_BIG_ENDIAN), y)
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0f3cd7c3a436..7ffdb3bdfd3f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -172,7 +172,7 @@ config RISCV
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RETHOOK if !XIP_KERNEL
 	select HAVE_RSEQ
-	select HAVE_RUST if 64BIT
+	select HAVE_RUST if RUSTC_SUPPORTS_RISCV
 	select HAVE_SAMPLE_FTRACE_DIRECT
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
 	select HAVE_STACKPROTECTOR
@@ -202,6 +202,13 @@ config RISCV
 	select UACCESS_MEMCPY if !MMU
 	select ZONE_DMA32 if 64BIT
 
+config RUSTC_SUPPORTS_RISCV
+       def_bool y
+       depends on 64BIT
+       # Shadow call stack requires rustc version 1.82+ due to use of the
+       # -Zsanitizer=shadow-call-stack flag.
+       depends on !SHADOW_CALL_STACK || RUSTC_VERSION >= 108200
+
 config CLANG_SUPPORTS_DYNAMIC_FTRACE
 	def_bool CC_IS_CLANG
 	# https://github.com/ClangBuiltLinux/linux/issues/1817
diff --git a/init/Kconfig b/init/Kconfig
index 38c1cfcce821..2d3d5caee1e0 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1909,7 +1909,6 @@ config RUST
 	depends on !MODVERSIONS
 	depends on !GCC_PLUGIN_RANDSTRUCT
 	depends on !RANDSTRUCT
-	depends on !SHADOW_CALL_STACK
 	depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
 	help
 	  Enables Rust support in the kernel.

---
base-commit: 12f2c9d5c2bef419700514ca627e3a5c27f380d9
change-id: 20240304-shadow-call-stack-9c197a4361d9

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


