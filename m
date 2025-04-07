Return-Path: <linux-kbuild+bounces-6489-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5C7A7DA04
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Apr 2025 11:43:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBCB53AF4E2
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Apr 2025 09:42:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F7D235347;
	Mon,  7 Apr 2025 09:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hXYscoHh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88107234979;
	Mon,  7 Apr 2025 09:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744018908; cv=none; b=tV/1MVj//4dwaIroYC27K5EXG+mKc0L6fhKO4bV9OfD7n1p1SFB9GGTFbk6QUcktWXORDAQ9N9nPxnhPuYQJFNy7/RF+XlwEHYYXLkcp4NzsL8+UKYiocQLcaY34xHOoJdqcZk/lti527jp/MGuhiQQ2pPthotVn2MCIP/31t1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744018908; c=relaxed/simple;
	bh=CLC2nkOo15jpV+Zy8Oy8eCAFMjjNOSil3+44E+NE3T4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R+8FpgKUoTugFVEgG91Y/ofonMna1AlsFnEUOb3jgHT1TdvnS3RhMtT9hCw0y8UGOMwtYTxuhWTOpQvNC+d4o45No+zZTdqTRT8SI2DZZI+FyEEES63kBBZ2/JwZnrKAg2KhVxJeCO03MyQZY7/qMV7tYMXqWwKHe9gNH+ihE/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hXYscoHh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C61DC4CEEF;
	Mon,  7 Apr 2025 09:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744018908;
	bh=CLC2nkOo15jpV+Zy8Oy8eCAFMjjNOSil3+44E+NE3T4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hXYscoHhZMlBIvarqz8rvhcNQGXllf7zVxAHVkbOz4whbTP4OqS/UAJEbMvwrBaTG
	 +xgcyB15+n0ovzO/wHvS8ZUh9Trn4+8QS5oiDxGkcbeLFOvPodJoM8DXZC/csEyd3g
	 tf44OoZd1MMh+CpE2DM9fxXPTZAHewy6sT/h0kwv14nmIQXQg7ivA2Ab4rS5WLnrvE
	 ruWg6rtEvREfrE49LS5Ilg/cbLwf3w5zQaGsWBRI/xIyRvH6Xe6vZR9q0Uq+jJVbI9
	 gbj8OD+lrPDnchEYXL+eEEfgyPhLQ3AD7hobnm193avZqWiLHRFtwoqsNW4APLu0/J
	 33fEUAQnR2+qQ==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Brian Gerst <brgerst@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ingo Molnar <mingo@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uros Bizjak <ubizjak@gmail.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-raid@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 4/4] arm64: drop binutils version checks
Date: Mon,  7 Apr 2025 11:41:16 +0200
Message-Id: <20250407094116.1339199-5-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407094116.1339199-1-arnd@kernel.org>
References: <20250407094116.1339199-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Now that gcc-8 and binutils-2.30 are the minimum versions, a lot of
the individual feature checks can go away for simplification.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm64/Kconfig              | 37 ++-------------------------------
 arch/arm64/Makefile             | 21 ++-----------------
 arch/arm64/include/asm/rwonce.h |  4 ----
 arch/arm64/kvm/Kconfig          |  1 -
 arch/arm64/lib/xor-neon.c       |  2 +-
 5 files changed, 5 insertions(+), 60 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a182295e6f08..d33e3955566d 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -642,9 +642,6 @@ config ARM64_ERRATUM_843419
 
 	  If unsure, say Y.
 
-config ARM64_LD_HAS_FIX_ERRATUM_843419
-	def_bool $(ld-option,--fix-cortex-a53-843419)
-
 config ARM64_ERRATUM_1024718
 	bool "Cortex-A55: 1024718: Update of DBM/AP bits without break before make might result in incorrect update"
 	default y
@@ -1890,13 +1887,9 @@ config ARM64_PAN
 	  The feature is detected at runtime, and will remain as a 'nop'
 	  instruction if the cpu does not implement the feature.
 
-config AS_HAS_LSE_ATOMICS
-	def_bool $(as-instr,.arch_extension lse)
-
 config ARM64_LSE_ATOMICS
 	bool
 	default ARM64_USE_LSE_ATOMICS
-	depends on AS_HAS_LSE_ATOMICS
 
 config ARM64_USE_LSE_ATOMICS
 	bool "Atomic instructions"
@@ -1908,20 +1901,12 @@ config ARM64_USE_LSE_ATOMICS
 
 	  Say Y here to make use of these instructions for the in-kernel
 	  atomic routines. This incurs a small overhead on CPUs that do
-	  not support these instructions and requires the kernel to be
-	  built with binutils >= 2.25 in order for the new instructions
-	  to be used.
+	  not support these instructions.
 
 endmenu # "ARMv8.1 architectural features"
 
 menu "ARMv8.2 architectural features"
 
-config AS_HAS_ARMV8_2
-	def_bool $(cc-option,-Wa$(comma)-march=armv8.2-a)
-
-config AS_HAS_SHA3
-	def_bool $(as-instr,.arch armv8.2-a+sha3)
-
 config ARM64_PMEM
 	bool "Enable support for persistent memory"
 	select ARCH_HAS_PMEM_API
@@ -1995,7 +1980,6 @@ config ARM64_PTR_AUTH_KERNEL
 	bool "Use pointer authentication for kernel"
 	default y
 	depends on ARM64_PTR_AUTH
-	depends on (CC_HAS_SIGN_RETURN_ADDRESS || CC_HAS_BRANCH_PROT_PAC_RET) && AS_HAS_ARMV8_3
 	# Modern compilers insert a .note.gnu.property section note for PAC
 	# which is only understood by binutils starting with version 2.33.1.
 	depends on LD_IS_LLD || LD_VERSION >= 23301 || (CC_IS_GCC && GCC_VERSION < 90100)
@@ -2016,19 +2000,10 @@ config CC_HAS_BRANCH_PROT_PAC_RET
 	# GCC 9 or later, clang 8 or later
 	def_bool $(cc-option,-mbranch-protection=pac-ret+leaf)
 
-config CC_HAS_SIGN_RETURN_ADDRESS
-	# GCC 7, 8
-	def_bool $(cc-option,-msign-return-address=all)
-
-config AS_HAS_ARMV8_3
-	def_bool $(cc-option,-Wa$(comma)-march=armv8.3-a)
-
 config AS_HAS_CFI_NEGATE_RA_STATE
+	# binutils 2.34+
 	def_bool $(as-instr,.cfi_startproc\n.cfi_negate_ra_state\n.cfi_endproc\n)
 
-config AS_HAS_LDAPR
-	def_bool $(as-instr,.arch_extension rcpc)
-
 endmenu # "ARMv8.3 architectural features"
 
 menu "ARMv8.4 architectural features"
@@ -2056,20 +2031,13 @@ config ARM64_AMU_EXTN
 	  correctly reflect reality. Most commonly, the value read will be 0,
 	  indicating that the counter is not enabled.
 
-config AS_HAS_ARMV8_4
-	def_bool $(cc-option,-Wa$(comma)-march=armv8.4-a)
-
 config ARM64_TLB_RANGE
 	bool "Enable support for tlbi range feature"
 	default y
-	depends on AS_HAS_ARMV8_4
 	help
 	  ARMv8.4-TLBI provides TLBI invalidation instruction that apply to a
 	  range of input addresses.
 
-	  The feature introduces new assembly instructions, and they were
-	  support when binutils >= 2.30.
-
 endmenu # "ARMv8.4 architectural features"
 
 menu "ARMv8.5 architectural features"
@@ -2145,7 +2113,6 @@ config ARM64_MTE
 	default y
 	depends on ARM64_AS_HAS_MTE && ARM64_TAGGED_ADDR_ABI
 	depends on AS_HAS_ARMV8_5
-	depends on AS_HAS_LSE_ATOMICS
 	# Required for tag checking in the uaccess routines
 	select ARM64_PAN
 	select ARCH_HAS_SUBPAGE_FAULTS
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 1d5dfcd1c13e..73a10f65ce8b 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -16,14 +16,11 @@ ifeq ($(CONFIG_RELOCATABLE), y)
 # Pass --no-apply-dynamic-relocs to restore pre-binutils-2.27 behaviour
 # for relative relocs, since this leads to better Image compression
 # with the relocation offsets always being zero.
-LDFLAGS_vmlinux		+= -shared -Bsymbolic -z notext \
-			$(call ld-option, --no-apply-dynamic-relocs)
+LDFLAGS_vmlinux	+= -shared -Bsymbolic -z notext --no-apply-dynamic-relocs
 endif
 
 ifeq ($(CONFIG_ARM64_ERRATUM_843419),y)
-  ifeq ($(CONFIG_ARM64_LD_HAS_FIX_ERRATUM_843419),y)
 LDFLAGS_vmlinux	+= --fix-cortex-a53-843419
-  endif
 endif
 
 cc_has_k_constraint := $(call try-run,echo				\
@@ -105,12 +102,8 @@ endif
 # hardware.
 ifeq ($(CONFIG_AS_HAS_ARMV8_5), y)
   asm-arch := armv8.5-a
-else ifeq ($(CONFIG_AS_HAS_ARMV8_4), y)
+else
   asm-arch := armv8.4-a
-else ifeq ($(CONFIG_AS_HAS_ARMV8_3), y)
-  asm-arch := armv8.3-a
-else ifeq ($(CONFIG_AS_HAS_ARMV8_2), y)
-  asm-arch := armv8.2-a
 endif
 
 ifdef asm-arch
@@ -201,16 +194,6 @@ install zinstall:
 
 archprepare:
 	$(Q)$(MAKE) $(build)=arch/arm64/tools kapi
-ifeq ($(CONFIG_ARM64_ERRATUM_843419),y)
-  ifneq ($(CONFIG_ARM64_LD_HAS_FIX_ERRATUM_843419),y)
-	@echo "warning: ld does not support --fix-cortex-a53-843419; kernel may be susceptible to erratum" >&2
-  endif
-endif
-ifeq ($(CONFIG_ARM64_USE_LSE_ATOMICS),y)
-  ifneq ($(CONFIG_ARM64_LSE_ATOMICS),y)
-	@echo "warning: LSE atomics not supported by binutils" >&2
-  endif
-endif
 
 ifeq ($(KBUILD_EXTMOD),)
 # We need to generate vdso-offsets.h before compiling certain files in kernel/.
diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
index 56f7b1d4d54b..97d9256d33c9 100644
--- a/arch/arm64/include/asm/rwonce.h
+++ b/arch/arm64/include/asm/rwonce.h
@@ -12,16 +12,12 @@
 
 #ifndef BUILD_VDSO
 
-#ifdef CONFIG_AS_HAS_LDAPR
 #define __LOAD_RCPC(sfx, regs...)					\
 	ALTERNATIVE(							\
 		"ldar"	#sfx "\t" #regs,				\
 		".arch_extension rcpc\n"				\
 		"ldapr"	#sfx "\t" #regs,				\
 	ARM64_HAS_LDAPR)
-#else
-#define __LOAD_RCPC(sfx, regs...)	"ldar" #sfx "\t" #regs
-#endif /* CONFIG_AS_HAS_LDAPR */
 
 /*
  * When building with LTO, there is an increased risk of the compiler
diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 096e45acadb2..713248f240e0 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -19,7 +19,6 @@ if VIRTUALIZATION
 
 menuconfig KVM
 	bool "Kernel-based Virtual Machine (KVM) support"
-	depends on AS_HAS_ARMV8_4
 	select KVM_COMMON
 	select KVM_GENERIC_HARDWARE_ENABLING
 	select KVM_GENERIC_MMU_NOTIFIER
diff --git a/arch/arm64/lib/xor-neon.c b/arch/arm64/lib/xor-neon.c
index f9a53b7f9842..8fffebfa17b2 100644
--- a/arch/arm64/lib/xor-neon.c
+++ b/arch/arm64/lib/xor-neon.c
@@ -319,7 +319,7 @@ static void xor_arm64_eor3_5(unsigned long bytes,
 
 static int __init xor_neon_init(void)
 {
-	if (IS_ENABLED(CONFIG_AS_HAS_SHA3) && cpu_have_named_feature(SHA3)) {
+	if (cpu_have_named_feature(SHA3)) {
 		xor_block_inner_neon.do_3 = xor_arm64_eor3_3;
 		xor_block_inner_neon.do_4 = xor_arm64_eor3_4;
 		xor_block_inner_neon.do_5 = xor_arm64_eor3_5;
-- 
2.39.5


