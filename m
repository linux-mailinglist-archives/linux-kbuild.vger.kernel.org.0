Return-Path: <linux-kbuild+bounces-1117-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C86486F880
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 03:21:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48C50281085
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 02:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6AB4138A;
	Mon,  4 Mar 2024 02:21:13 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC57515B7
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 02:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709518873; cv=none; b=avXOof0ohJ61eOo8/P+SC03HWH14YmvVA0feoHGBddHlHa44ziJZkUwzbaoJlHEJ7GvtbqWW2oCE2SYbRlM6SlgLQ5Qu2qMmM76yhamlclFgqsUFJNlA2WBfWp8vXVb2ZaP7u/sId6OMPkcDd6hKHnRSMICcXAW2NudU8ecnSBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709518873; c=relaxed/simple;
	bh=EJm9dbquYyGQ5C0R2xbbXwoqAvLg06YH/AMTZLKqVx4=;
	h=Message-Id:In-Reply-To:References:From:Date:Subject:To:Cc; b=D974IraChsJJcdWzMf++o0C2QmrfXQAoQR7fN7VloG9rmycFjadTEPXmW+pkJcibz5697aVF/2oZlp81b59hYm3Mxg800l7y/YaXjhzY8AQOmbdv3S1Jn9aDA5TzMMeW50e2CJ6HVEECfL8dksjz77biniSjjvlr9IvkorOZ5aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 4242HJib021878
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 3 Mar 2024 21:17:25 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 4242HJfp021877;
	Sun, 3 Mar 2024 18:17:19 -0800 (PST)
	(envelope-from ehem)
Message-Id: <7a3e76f00e4a21d2f09aaa7307c18fb71edc1bd3.1709508290.git.ehem+linux@m5p.com>
In-Reply-To: <cover.1709508290.git.ehem+linux@m5p.com>
References: <cover.1709508290.git.ehem+linux@m5p.com>
From: Elliott Mitchell <ehem+linux@m5p.com>
Date: Fri, 1 Mar 2024 12:03:01 -0800
Subject: [WIP PATCH 08/30] build: modify uses of $(srctree) to assume trailing
 slash
To: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu
Cc: linux-kbuild@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

This isn't much more than `find | sed` to adjust all uses of $(srctree).
This is split into a separate commit to highlight the actual changes to
the build machinery.

Signed-off-by: Elliott Mitchell <ehem+linux@m5p.com>
---
`grep` was also used to locate things which needed other actions
(notably the non-toplevel Makefile adjustments), but this is roughly:

find . -name Kconfig\* -print0 | xargs -0 sed -i -e's,$(srctree)$,$(srctree:%/=%),' -e's,$(srctree)\([^,/]\),$(srctree:%/=%)\1,g' -es',$(srctree)/,$(srctree),g'

There could be goofs in here or missed bits.  I hope not, but...
---
 arch/powerpc/Kconfig |  8 ++++----
 arch/s390/Kconfig    |  2 +-
 arch/x86/Kconfig     |  4 ++--
 init/Kconfig         | 14 +++++++-------
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index b9fc064d38d2..1014602784bc 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -557,15 +557,15 @@ config LD_HEAD_STUB_CATCH
 
 config MPROFILE_KERNEL
 	depends on PPC64_ELF_ABI_V2 && FUNCTION_TRACER
-	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-mprofile-kernel.sh $(CC) -mlittle-endian) if CPU_LITTLE_ENDIAN
-	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-mprofile-kernel.sh $(CC) -mbig-endian) if CPU_BIG_ENDIAN
+	def_bool $(success,$(srctree)arch/powerpc/tools/gcc-check-mprofile-kernel.sh $(CC) -mlittle-endian) if CPU_LITTLE_ENDIAN
+	def_bool $(success,$(srctree)arch/powerpc/tools/gcc-check-mprofile-kernel.sh $(CC) -mbig-endian) if CPU_BIG_ENDIAN
 
 config ARCH_USING_PATCHABLE_FUNCTION_ENTRY
 	depends on FUNCTION_TRACER && (PPC32 || PPC64_ELF_ABI_V2)
 	depends on $(cc-option,-fpatchable-function-entry=2)
 	def_bool y if PPC32
-	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh $(CC) -mlittle-endian) if PPC64 && CPU_LITTLE_ENDIAN
-	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh $(CC) -mbig-endian) if PPC64 && CPU_BIG_ENDIAN
+	def_bool $(success,$(srctree)arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh $(CC) -mlittle-endian) if PPC64 && CPU_LITTLE_ENDIAN
+	def_bool $(success,$(srctree)arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh $(CC) -mbig-endian) if PPC64 && CPU_BIG_ENDIAN
 
 config HOTPLUG_CPU
 	bool "Support for enabling/disabling CPUs"
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index fe565f3a3a91..d3ec24732a25 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -552,7 +552,7 @@ config EXPOLINE_EXTERN
 	def_bool n
 	depends on EXPOLINE
 	depends on CC_IS_GCC && GCC_VERSION >= 110200
-	depends on $(success,$(srctree)/arch/s390/tools/gcc-thunk-extern.sh $(CC))
+	depends on $(success,$(srctree)arch/s390/tools/gcc-thunk-extern.sh $(CC))
 	prompt "Generate expolines as extern functions."
 	help
 	  This option is required for some tooling like kpatch. The kernel is
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 5edec175b9bf..d4da96542044 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -410,8 +410,8 @@ config PGTABLE_LEVELS
 
 config CC_HAS_SANE_STACKPROTECTOR
 	bool
-	default $(success,$(srctree)/scripts/gcc-x86_64-has-stack-protector.sh $(CC) $(CLANG_FLAGS)) if 64BIT
-	default $(success,$(srctree)/scripts/gcc-x86_32-has-stack-protector.sh $(CC) $(CLANG_FLAGS))
+	default $(success,$(srctree)scripts/gcc-x86_64-has-stack-protector.sh $(CC) $(CLANG_FLAGS)) if 64BIT
+	default $(success,$(srctree)scripts/gcc-x86_32-has-stack-protector.sh $(CC) $(CLANG_FLAGS))
 	help
 	  We have to make sure stack protector is unconditionally disabled if
 	  the compiler produces broken code or if it does not let us control
diff --git a/init/Kconfig b/init/Kconfig
index 8426d59cc634..210fede7314c 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -61,7 +61,7 @@ config LLD_VERSION
 	default 0
 
 config RUST_IS_AVAILABLE
-	def_bool $(success,$(srctree)/scripts/rust_is_available.sh)
+	def_bool $(success,$(srctree)scripts/rust_is_available.sh)
 	help
 	  This shows whether a suitable Rust toolchain is available (found).
 
@@ -73,13 +73,13 @@ config RUST_IS_AVAILABLE
 
 config CC_CAN_LINK
 	bool
-	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m64-flag)) if 64BIT
-	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m32-flag))
+	default $(success,$(srctree)scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m64-flag)) if 64BIT
+	default $(success,$(srctree)scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m32-flag))
 
 config CC_CAN_LINK_STATIC
 	bool
-	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m64-flag) -static) if 64BIT
-	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m32-flag) -static)
+	default $(success,$(srctree)scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m64-flag) -static) if 64BIT
+	default $(success,$(srctree)scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(USERCFLAGS) $(USERLDFLAGS) $(m32-flag) -static)
 
 config CC_HAS_ASM_GOTO_OUTPUT
 	def_bool $(success,echo 'int foo(int x) { asm goto ("": "=r"(x) ::: bar); return x; bar: return 0; }' | $(CC) -x c - -c -o /dev/null)
@@ -99,7 +99,7 @@ config GCC_ASM_GOTO_OUTPUT_WORKAROUND
 	default y if GCC_VERSION >= 130000 && GCC_VERSION < 130300
 
 config TOOLS_SUPPORT_RELR
-	def_bool $(success,env "CC=$(CC)" "LD=$(LD)" "NM=$(NM)" "OBJCOPY=$(OBJCOPY)" $(srctree)/scripts/tools-support-relr.sh)
+	def_bool $(success,env "CC=$(CC)" "LD=$(LD)" "NM=$(NM)" "OBJCOPY=$(OBJCOPY)" $(srctree)scripts/tools-support-relr.sh)
 
 config CC_HAS_ASM_INLINE
 	def_bool $(success,echo 'void foo(void) { asm inline (""); }' | $(CC) -x c - -c -o /dev/null)
@@ -109,7 +109,7 @@ config CC_HAS_NO_PROFILE_FN_ATTR
 
 config PAHOLE_VERSION
 	int
-	default $(shell,$(srctree)/scripts/pahole-version.sh $(PAHOLE))
+	default $(shell,$(srctree)scripts/pahole-version.sh $(PAHOLE))
 
 config CONSTRUCTORS
 	bool
-- 
2.39.2


