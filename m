Return-Path: <linux-kbuild+bounces-5871-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8732A4206C
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 14:22:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2952216FFCD
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 13:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21F3124EF7B;
	Mon, 24 Feb 2025 13:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EkhPRMmM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DA824EF6F
	for <linux-kbuild@vger.kernel.org>; Mon, 24 Feb 2025 13:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740403318; cv=none; b=qeNtOR+Pl02cP0KHjBDXCJaWGYkn3X06RFUjqekD4+5gTMYDG8wvw4jUfJhFAO9U0csBjxHMEN/YUYIjAr58ijoHVjU0knsPSbAy1UQUq8AjLBbSccZBaLdS2Zae110rFRhJ4Al+lLXoi9C8tywZJW+vqdnY4q+lOvl6DO0CNKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740403318; c=relaxed/simple;
	bh=4JX+l3Lgbl+ZEiHLxUH/SYwEcP5mDlrM6p749Og3ZPk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Dope1tBRUzxZz4kNnJYawY7qXTpAvzNmfJFip90o9ghdlfNQzHV9m7zgdaDx61wrjG2SMctH3UWeq+l+vW2NCqiIAmWUMFYh3+rzD35y+yAqF7xhfse7RVwjzfdV5+9bN8x3C0ceWtIuy2lj2iMBbCgAKMUG3So2Ve5OUnom4kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EkhPRMmM; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-38f62a0ec3fso3374652f8f.2
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Feb 2025 05:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740403314; x=1741008114; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PgCkMehe7p3mehBNoMC8WFS/X7xwPD6PvbsrOWzFSqw=;
        b=EkhPRMmMsv2b8KIlYCEMfe3BnsX7f6FEXFUIkivxxq8ZWpiYW5nF5o4A1PMy3/WWzY
         IrCjH9Iw7yRVh+mgpvHlv/TgK5mTq1KP5bG7HWfMqUHQ/tC9IuhwdgYa0C/Z3ZYmAzhm
         zWhHNUvqNBuqZPJuGAilmQbI04Hotw1yBquiw+BnU4JogsuN/i/IEaEqJGviNoQxygm4
         7WrnLdf4zS4rQK9/iEQvpPUlof67imQeSuYDg2/wu+pxzH/UmQki4t79I32qSOuvuknW
         HfbXh2qmKxUoCG4sgp+WeDr1njBeekHMMeApwpkp6X/phK3MpanSWtZmbEGHG/+/uxYi
         TZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740403314; x=1741008114;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PgCkMehe7p3mehBNoMC8WFS/X7xwPD6PvbsrOWzFSqw=;
        b=gOTLru2RT78Vs62HYpZYD2avhkHdYTgkAkoWABX+wT0rQCbp59k2crkylenm0AEOOY
         LkVorBEHe1iH35YMtmOjldbgmfz6oiW702B5mZPWTpOAB9AotT5lzu1HjecF4LmevaWZ
         Hph0/uPhSPW1lnyTwywKu6AqS7psAHEcMbIc0a2cmXUN/+L6CsTjpyvp74ESXHHtyt9F
         ZhjOpvVPB/CCve2u4UIbgs+Ab3l1KZimipLll4WMMvXfiVfl07TykCOq73v69Y/8bX9x
         5ntcM9XnY1kpo6agsLNBECfya0GAMvmR8SWUJ3rs4nKjg2uiV7HgHH0Jtq+KkTHoyw/d
         pFNA==
X-Forwarded-Encrypted: i=1; AJvYcCUxvMKoeiQMTazpZD6Gg2T/l9v1wi/9+WeyIy30phuv6YTQNYUvXrURb899FTFnIXGoRzDA18c26ZFRkdE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUeR+hXWMpEdkBOSJRrQgU0xg0R4xE6Fj69209Uo5Rgnp6QAdB
	Q1f1lPCMB7HmPgrBOoDfcpDbFjsLAxjmNVWa3lHB5BraX1v0Qg5AxNXNYWjDQ3NY/8Tw/Q==
X-Google-Smtp-Source: AGHT+IEyH2XmBvCzg2ijOwcjrIaoCy2e3N1FgVWpa9pBlwZWSeWw3cgu90bvQVoFAh+RzYhSFVTp0joX
X-Received: from wmbep9.prod.google.com ([2002:a05:600c:8409:b0:439:65f0:b039])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:154a:b0:38f:50fd:55a8
 with SMTP id ffacd0b85a97d-38f70783eeamr9304935f8f.6.1740403314458; Mon, 24
 Feb 2025 05:21:54 -0800 (PST)
Date: Mon, 24 Feb 2025 14:21:35 +0100
In-Reply-To: <20250224132132.1765115-6-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250224132132.1765115-6-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5903; i=ardb@kernel.org;
 h=from:subject; bh=l0XPdsqmrGbazu6TBBLLKaLD6j8WwrwleHZjQt9SLHk=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIX1PUcLlhUx3xDe9fZG2eUvuX8l1N7u/t61Zu09hbvnm5
 VkJE6bM7ihlYRDjYJAVU2QRmP333c7TE6VqnWfJwsxhZQIZwsDFKQATEd3OyLBD/LmTf+jMnyLa
 wnnnIkwtXQ9dPf8+9m3Mn5nJX5ZPWx/N8L/006XoyoLw1k/r1p669uDYOd9KFY5fBTtbvYLnrdq kz8AEAA==
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250224132132.1765115-8-ardb+git@google.com>
Subject: [RFC PATCH 2/4] Kbuild: Introduce Kconfig symbol for linking vmlinux
 with relocations
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Some architectures build vmlinux with static relocations preserved, but
strip them again from the final vmlinux image. Arch specific tools
consume these static relocations in order to construct relocation tables
for KASLR.

The fact that vmlinux is created, consumed and subsequently updated goes
against the typical, declarative paradigm used by Make, which is based
on rules and dependencies. So as a first step towards cleaning this up,
introduce a Kconfig symbol to declare that the arch wants to consume the
static relocations emitted into vmlinux. This will be wired up further
in subsequent patches.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 Makefile            | 4 ++++
 arch/Kconfig        | 7 +++++++
 arch/mips/Kconfig   | 1 +
 arch/mips/Makefile  | 4 ----
 arch/riscv/Kconfig  | 1 +
 arch/riscv/Makefile | 2 +-
 arch/s390/Kconfig   | 1 +
 arch/s390/Makefile  | 2 +-
 arch/x86/Kconfig    | 1 +
 arch/x86/Makefile   | 6 ------
 10 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/Makefile b/Makefile
index 30dab4c8b012..a3302dce56de 100644
--- a/Makefile
+++ b/Makefile
@@ -1119,6 +1119,10 @@ ifdef CONFIG_LD_ORPHAN_WARN
 LDFLAGS_vmlinux += --orphan-handling=$(CONFIG_LD_ORPHAN_WARN_LEVEL)
 endif
 
+ifneq ($(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS),)
+LDFLAGS_vmlinux	+= --emit-relocs --discard-none
+endif
+
 # Align the bit size of userspace programs with the kernel
 KBUILD_USERCFLAGS  += $(filter -m32 -m64 --target=%, $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
 KBUILD_USERLDFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
diff --git a/arch/Kconfig b/arch/Kconfig
index b8a4ff365582..101a13fcde8e 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1695,6 +1695,13 @@ config ARCH_HAS_KERNEL_FPU_SUPPORT
 	  Architectures that select this option can run floating-point code in
 	  the kernel, as described in Documentation/core-api/floating-point.rst.
 
+config ARCH_VMLINUX_NEEDS_RELOCS
+	bool
+	help
+	  Whether the architecture needs vmlinux to be built with static
+	  relocations preserved. This is used by some architectures to
+	  construct bespoke relocation tables for KASLR.
+
 source "kernel/gcov/Kconfig"
 
 source "scripts/gcc-plugins/Kconfig"
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 1924f2d83932..5aedbd7afadb 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2617,6 +2617,7 @@ config RELOCATABLE
 		   CPU_MIPS32_R6 || CPU_MIPS64_R6 || \
 		   CPU_P5600 || CAVIUM_OCTEON_SOC || \
 		   CPU_LOONGSON64
+	select ARCH_VMLINUX_NEEDS_RELOCS
 	help
 	  This builds a kernel image that retains relocation information
 	  so it can be loaded someplace besides the default 1MB.
diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index be8cb44a89fd..d9057e29bc62 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -100,10 +100,6 @@ LDFLAGS_vmlinux			+= -G 0 -static -n -nostdlib
 KBUILD_AFLAGS_MODULE		+= -mlong-calls
 KBUILD_CFLAGS_MODULE		+= -mlong-calls
 
-ifeq ($(CONFIG_RELOCATABLE),y)
-LDFLAGS_vmlinux			+= --emit-relocs
-endif
-
 cflags-y += -ffreestanding
 
 cflags-$(CONFIG_CPU_BIG_ENDIAN)		+= -EB
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7612c52e9b1e..6f5800114416 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -1077,6 +1077,7 @@ config RELOCATABLE
 	bool "Build a relocatable kernel"
 	depends on MMU && 64BIT && !XIP_KERNEL
 	select MODULE_SECTIONS if MODULES
+	select ARCH_VMLINUX_NEEDS_RELOCS
 	help
           This builds a kernel as a Position Independent Executable (PIE),
           which retains all relocation metadata required to relocate the
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 13fbc0f94238..6ef0d10e0c50 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -8,7 +8,7 @@
 
 LDFLAGS_vmlinux := -z norelro
 ifeq ($(CONFIG_RELOCATABLE),y)
-	LDFLAGS_vmlinux += -shared -Bsymbolic -z notext --emit-relocs
+	LDFLAGS_vmlinux += -shared -Bsymbolic -z notext
 	KBUILD_CFLAGS += -fPIE
 endif
 ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 9c9ec08d78c7..ea67b7317138 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -630,6 +630,7 @@ endchoice
 
 config RELOCATABLE
 	def_bool y
+	select ARCH_VMLINUX_NEEDS_RELOCS
 	help
 	  This builds a kernel image that retains relocation information
 	  so it can be loaded at an arbitrary address.
diff --git a/arch/s390/Makefile b/arch/s390/Makefile
index 5fae311203c2..d5f4be440879 100644
--- a/arch/s390/Makefile
+++ b/arch/s390/Makefile
@@ -15,7 +15,7 @@ KBUILD_CFLAGS_MODULE += -fPIC
 KBUILD_AFLAGS	+= -m64
 KBUILD_CFLAGS	+= -m64
 KBUILD_CFLAGS	+= -fPIC
-LDFLAGS_vmlinux	:= -no-pie --emit-relocs --discard-none
+LDFLAGS_vmlinux	:= -no-pie
 extra_tools	:= relocs
 aflags_dwarf	:= -Wa,-gdwarf-2
 KBUILD_AFLAGS_DECOMPRESSOR := $(CLANG_FLAGS) -m64 -D__ASSEMBLY__
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index be2c311f5118..2005d80ff8d1 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2199,6 +2199,7 @@ config RANDOMIZE_BASE
 config X86_NEED_RELOCS
 	def_bool y
 	depends on RANDOMIZE_BASE || (X86_32 && RELOCATABLE)
+	select ARCH_VMLINUX_NEEDS_RELOCS
 
 config PHYSICAL_ALIGN
 	hex "Alignment value to which kernel should be aligned"
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 5b773b34768d..f65ed6dcd6fb 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -251,12 +251,6 @@ endif
 
 KBUILD_LDFLAGS += -m elf_$(UTS_MACHINE)
 
-ifdef CONFIG_X86_NEED_RELOCS
-LDFLAGS_vmlinux := --emit-relocs --discard-none
-else
-LDFLAGS_vmlinux :=
-endif
-
 #
 # The 64-bit kernel must be aligned to 2MB.  Pass -z max-page-size=0x200000 to
 # the linker to force 2MB page size regardless of the default page size used
-- 
2.48.1.601.g30ceb7b040-goog


