Return-Path: <linux-kbuild+bounces-3216-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCA095F3BD
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Aug 2024 16:23:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68E051F21113
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Aug 2024 14:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E2B9189503;
	Mon, 26 Aug 2024 14:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V5/ZpZoO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC1B188914
	for <linux-kbuild@vger.kernel.org>; Mon, 26 Aug 2024 14:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724682219; cv=none; b=DO5uAjH5LE2slm2sYPGtZH0e9ntHRvIgI4PoN1eCV+dZXr1WVWxC3c5EgrjvTkVEDg2C0NMjmst4jvCALgFH7jfpTdOUyYM/2nbOiV9T6qp5x/0txyVT1ruJoaEiFe0Nmk1X2p3sAO6lmHR4gc62jVsYpaFE2TfH07mjFCyPncI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724682219; c=relaxed/simple;
	bh=uNIGBGso885sgOwNAeYYgHStA0nEfCTH+EOqhcdH59s=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Mp/x03q74oLlNfkjukZ143VqUgjZMUbeCRy4NZbD73KB+T+emghNdFeb//ro6PuKh0RJZKrLaMfPzwG8CviQCQzIQ7E7KjzDOuth468EUwn9QkEQypI6gHuLUrSqVdwaq54rXiX/895Bh9U4BujJtMMZkJv1UVz8bcfp6yyan7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V5/ZpZoO; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6b8d96aa5ebso90993487b3.1
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Aug 2024 07:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724682216; x=1725287016; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HcboO1A3MI6m5KMCRr+YPbAr/cyeINNu4stoU8u59qc=;
        b=V5/ZpZoOdVZrXICbqWTqy+Nd2yrvIEWKVtyf8e+qa0M62KwJF4XWQCK070dAiw4+Nd
         01b2fX90DJo5EWUvIc6KA0kJbEGt8kHS2IR7N85YikyFfSdj/hPQqK/hvTw6NINbv4y+
         HohgMAS7g6jlsALXaTnJblv3u273i+zWzsvMQJ+RTLg+7g4ijEGI1PmbiXBrbd/iWYab
         C1/+1+A+wCv3VVROzM21cvDGzoIHy2Bh5UkFc32f1Zvf3xVbQbqkaDaacXVdOpb0Q6da
         lul7TMC1sw/t6yaaiiQXFdxq6seIo+rbYk7lXX6clrNECectXSs0E2KlaDWVEfOLXrTc
         9moA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724682216; x=1725287016;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HcboO1A3MI6m5KMCRr+YPbAr/cyeINNu4stoU8u59qc=;
        b=B29+itnTzoKfsRm7Izc2ODh32AVzEq0GZDdF/ex6rCkieUqE+Ck9eM7QpoHOhLm3VM
         vSAO2GF8XPmE5k+Ok1/9QikOblKXle8VWKoSarDYZpwihHTtJbD+JZ7bgQPoGeoJdUDX
         X+ESMmYaIlQINaaBXXIFF5HHE+ljPkQopF/v0obbdz3OrPxwbZW0onqLP/g1Uo8nDu5f
         OBJ0kE8LCJbGcgs5jWBS/sWSVkpuqLgML+tfkt2HGw+EORhOVf+DuY6AWYKFLzWyE7bp
         3pIXb7Ip2x1Mqh5Y5S4EDaRoPrkl6ghvou9yOzJ07mGZ7uLbRbeZ5ZsnMEa1GQ6Up+yv
         BHTQ==
X-Forwarded-Encrypted: i=1; AJvYcCW08QbQ3N62OGe6l+wes1s9N9MmXkFZwkT0eAOdMZFtU+2qIUovVgfwZPLgBNQAU8hB49yfBn4LfImJfYY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx78LqE6djseHUOJYALWsG90rhHHdq4TQ91wG0sDhR06602t0Pr
	TMbcMUfhK7d5C7Gb2ppC7dY39M6nagtP5/dgt20+lUwIw9PrjvoaVaRPj284IqfxvBUYi0CLHA8
	vhVPnZCHkE4conw==
X-Google-Smtp-Source: AGHT+IHl5kKUJXD/nE7kgbhMkIaAeFFbg9NCHX/TBOwWbqnPCJBOP0amcy/pxb65aOf0bZUR4EdJGTHIC02FlbY=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a81:ff08:0:b0:64a:8aec:617c with SMTP id
 00721157ae682-6c61e8fcf4dmr4251197b3.0.1724682216593; Mon, 26 Aug 2024
 07:23:36 -0700 (PDT)
Date: Mon, 26 Aug 2024 14:22:52 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALuPzGYC/33Pz07DMAwG8FeZciYof5y02Yn3QBxcx20jyoKaq
 YCmvjvZLhtqxfGz5N9nX0ThOXERx8NFzLykkvKpBv90EDTiaWCZYs3CKAPKKpBlxJi/JOE0yXJ
 GepeBdGgQrNcxiLr3OXOfvm/m61vNYyrnPP/cKhZ9nf6nLVpq2SvnGHtQaOhlyHmY+Jnyh7hyi
 3kk3B5hKkFNB2h7iF77DWHvRLN/hZVKRq2pQc8dW7Uh4IEwYY+AShj0HjrVGkbYEO5OtMrvEa4 +Ynwk6loTtPtLrOv6CzH0aAq/AQAA
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=6594; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=uNIGBGso885sgOwNAeYYgHStA0nEfCTH+EOqhcdH59s=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmzI/Omc0CmOU3AZ9YFD3d5kXaNhvLZ4DWsIZdU
 oJ2hj4FH9eJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZsyPzgAKCRAEWL7uWMY5
 Ro7IEACciJR0dfBowoH/wZreKokHz1mqTcLRIxWkicDSjvI7EK0OoZuy+6+wBMvJtTQV+MKTmCc
 k0jFyd5yVIQLtwPy5pUU94vAyPptnLauc3MM+UJlG4xUcr8/IqIvbjiXbonlpn4Z6pEQPvumPZB
 IUTPj73xlyZqy6i/ZIEzm8mMJ7mbtOB7bcydglBC3O5KITVdZNWytk6EK9xNJ3mco+zkaAsUhVk
 CY/ZJtH3UDyRN5+KUFB57TnYreIUm3xVn/LPRGA/kRdo4llmqCjtOeP8qfYjQw2+tf26cWPatQx
 lQi8vu6NP8FBCiFksbi85Tv+k/cw7yTp+RPilRZjfLHNZkqE/8xk5RRj2gRII2SBY5E2siQpRIw
 CBayGgwj1ELJEeAo5OmHgPkhtO0PQOZ1qrZHGKWTzBEbRMXBQJJ2oHV/WdRz9dmkq1KsldlpMUV
 Jmd8fmVLADQmdeZuJe1Ewfg/tw4BhnL5T4IOFuN/P07QacVPKB61eGmv0N8EjPPnkqemTewz6/H
 JVBGQbGbvpdfamM9cv/tXB/FcYZAazMdb4+JD2nE5tYEBGuUf1esKQrwXiLwmVzAcY3H34/C2H0
 xpjJUicVDerim7FAV2zgYhx3GmCahOEmNVZ7EIU1F49RgTzpzWKvm1O4iwlZABOo71WDTkaozFC 6GlZFtn8zOoYeNQ==
X-Mailer: b4 0.13.0
Message-ID: <20240826-shadow-call-stack-v6-1-495a7e3eb0ef@google.com>
Subject: [PATCH v6] rust: support for shadow call stack sanitizer
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
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This patch adds all of the flags that are needed to support the shadow
call stack (SCS) sanitizer with Rust, and updates Kconfig to allow only
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

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Link: https://lore.kernel.org/rust-for-linux/20240808221138.873750-1-ojeda@kernel.org/ [1]
---
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
 Makefile            | 1 +
 arch/arm64/Kconfig  | 7 ++++++-
 arch/arm64/Makefile | 3 +++
 arch/riscv/Kconfig  | 7 ++++++-
 init/Kconfig        | 1 -
 5 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 44c02a6f60a1..eb01a26d8354 100644
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
index a2f8ff354ca6..28c4a3035331 100644
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
@@ -265,6 +265,11 @@ config ARM64
 	help
 	  ARM 64-bit (AArch64) Linux support.
 
+config RUSTC_SUPPORTS_ARM64
+       def_bool y
+       depends on CPU_LITTLE_ENDIAN
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
index 0f3cd7c3a436..476e38ed9c00 100644
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
@@ -202,6 +202,11 @@ config RISCV
 	select UACCESS_MEMCPY if !MMU
 	select ZONE_DMA32 if 64BIT
 
+config RUSTC_SUPPORTS_RISCV
+       def_bool y
+       depends on 64BIT
+       depends on !SHADOW_CALL_STACK || RUSTC_VERSION >= 108200
+
 config CLANG_SUPPORTS_DYNAMIC_FTRACE
 	def_bool CC_IS_CLANG
 	# https://github.com/ClangBuiltLinux/linux/issues/1817
diff --git a/init/Kconfig b/init/Kconfig
index fe76c5d0a72e..e095e94eb9db 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1909,7 +1909,6 @@ config RUST
 	depends on !MODVERSIONS
 	depends on !GCC_PLUGINS
 	depends on !RANDSTRUCT
-	depends on !SHADOW_CALL_STACK
 	depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
 	help
 	  Enables Rust support in the kernel.

---
base-commit: 5953fd808fca8116a91678ee5fac00fc198ad93d
change-id: 20240304-shadow-call-stack-9c197a4361d9

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


