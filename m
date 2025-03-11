Return-Path: <linux-kbuild+bounces-6051-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4FBA5BE7F
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 12:07:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B6F616DAEF
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 11:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A681254859;
	Tue, 11 Mar 2025 11:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GAblWpas"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B50253B6A
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Mar 2025 11:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741691196; cv=none; b=f3WzIAcD0xmv4cAGe6Hl+ctxbdv7hOhdLPJzSTthG3GpnxJTjwjQcSmvw3mjW0byovAWDrz9qbsvS03oGJr8QrNumZDoZeFpJXe1/6ob0C5JKMMIyimhLlKOk2k2OTeV8VfZbBnrgEjXFd1chsxbayVz0yZNeNz05O3Ba5mKsXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741691196; c=relaxed/simple;
	bh=NSvLUGEJgrKoqVUvg8LwrQglJlxafOeNF7jb3TYBQww=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HnQqiYeukmlS9mG2lLgNHBUEwpS+ayaf+1c7jtoUx5AQXR3NroBqGQsq8Ht6g2D2DjrMEf8r0zQ44GahrLq/mCi3+x8xV/9QX2T8nGwSNFmHoqq51jR3cbxulQlQxbt+/uobcsEbEUm8UG2TK5HEqV9a1lDb7BOVF/HHugFBmaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GAblWpas; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-391425471ddso1723702f8f.0
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Mar 2025 04:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741691192; x=1742295992; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Yf0bN3uKuHsi0gbwB2yWwKhMf1YwUtCAITC2D3AG+o=;
        b=GAblWpasHr/0+qvUJeHvvP37qu2yqiSbOUVNRxlhFdlubfb3PCn1N65zATRvWbuqPg
         I0ey+6gdN+W+IhtXJ56AJexcV61RyOYhP37sIn+36JR6udRuoUz5/T2NSJT9pxMffrIT
         LCLwRdbB8FuwP5ikxKLyJLCBpWI7i7ASN5l4wDbr7q/hVz/rmxQdXkETFFnEhsIOthkv
         pUZf/WR06A6RNkoxYW0oMABIyUHcCRLL/BjebgiQHPv5HUNkWQoXqhfAeGJM7Fbuz1Ee
         fl/C+PJz1jutzgUPzLQq4cEMHnf62v463eBgiX8OfDjVuZG2k4kCAoyrQ9mQbUScQ9bU
         GVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741691192; x=1742295992;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Yf0bN3uKuHsi0gbwB2yWwKhMf1YwUtCAITC2D3AG+o=;
        b=EQNJD3n2JnCCEORj8CeGhx3ZrSEk8JfiXVLjXTWDO3zYAOqiFHjkHXTwbC9SnIgZQv
         2HUPdE0QJnxjB+3AF9z4tVLIdO9/iAmqnSp+zjXw7EdqZb+BpAPvul3v70EwFyVDiggf
         w8DQkVptr/FUdGr7TStsf/ruOpF3A2YC1exYeKeGXJBdGDxZtxtff8ErfRpoxljKjvSf
         gbJ0nWXMWlvZMA7j7ehiK1sKHiBWIdqvMlvWZfk8u8X6zpYVlFsMocZUQ40RB13F0VX8
         Cf4eeMi89eZauvCgP3PwEEHpq6896T7HmW3mui+JD7LBxLNrpJKIv/EQHKY/HNr27j5j
         K/8A==
X-Gm-Message-State: AOJu0YwDt6rzT8F5FcfN5lRmzgGKP5UnX7oYFPWcGIXFa4gP7WoQ+gBb
	IE35vH7+sAXKEyRxjxObxqGwQlo81vZM8oNvj6b86jool4FBukBLWtohJeXPkGXwgsWxtg==
X-Google-Smtp-Source: AGHT+IH6q7l27zc7WjLkXADMZQsNPbgoWxbj8l31SeRAG5v7pCZB84Qs/sK/o+dml/OyzZBZUfJ8MxWb
X-Received: from wmrn34.prod.google.com ([2002:a05:600c:5022:b0:43c:fe82:3a43])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b92:b0:43d:45a:8fc1
 with SMTP id 5b1f17b1804b1-43d045a9163mr26861955e9.4.1741691192658; Tue, 11
 Mar 2025 04:06:32 -0700 (PDT)
Date: Tue, 11 Mar 2025 12:06:19 +0100
In-Reply-To: <20250311110616.148682-6-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250311110616.148682-6-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5907; i=ardb@kernel.org;
 h=from:subject; bh=VQ+GQCTas1Zo3mtujHD75cbccTwWsmh8GGh8MvIAve8=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIf2CpNZ/j5JMGZOffc6NUwzyk1R1Dxavs9xTbsA95cGNh
 xcOl/F2lLIwiHEwyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgInc2czI8KHt2K6wfXMYqm5+
 Whi+ZGP6ahv+n3dXbJ3Tkrda2mtR3FFGhg1/W++bVjS8tXLN8kvOafNar+u1tfDOzuOziuuf6rI YcwIA
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250311110616.148682-8-ardb+git@google.com>
Subject: [PATCH v2 2/4] Kbuild: Introduce Kconfig symbol for linking vmlinux
 with relocations
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, x86@kernel.org, 
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
2.49.0.rc0.332.g42c0ae87b1-goog


