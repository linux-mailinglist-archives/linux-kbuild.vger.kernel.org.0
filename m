Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A62B570AA8
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jul 2019 22:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730418AbfGVU1l (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 22 Jul 2019 16:27:41 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43577 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727868AbfGVU1l (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 Jul 2019 16:27:41 -0400
Received: by mail-wr1-f65.google.com with SMTP id p13so40713091wru.10;
        Mon, 22 Jul 2019 13:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NOGW/IVGqsa+iMtHEoLvY2TRGYYlPNOEPkyNhSrlJ+E=;
        b=b5mRcHLi7lLmkc4imKkbtuN7t4F+Uo/YY1hCFfszWQqec5junsbRxy/h9PfQrzMcTb
         /PeXXth5H2x/7V9vmpdk4k1dDfpgprpBbFfif181yLxnwAPTvdnaIkQlcVQBtY8n8fhR
         5VEbaqUypWIc4OQB8n6iLq+SfeRzCWDRQzPjlDbn4P53GDA3ujcLxxTqEethpRPoqp3b
         oq7gRvcwQy3W5I43DEgNenCp2m0hWzEgnJ9DMPI0cNnKIbjnpy0egzD6WPyWPcd13ljo
         eDo77o2hBJA1G0jkzzKZqxivhk2hZKslK/r1lI6G9EAKmr8kBQpLYwFqQyOUCSmUR+Yt
         DOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NOGW/IVGqsa+iMtHEoLvY2TRGYYlPNOEPkyNhSrlJ+E=;
        b=jMhMFmBqCloB8/ZkawfcHl1+t85N5H7SZDdZwsTQVff3e+9Dct4ZUAEwxaoDC8E1Uq
         VBBZ6nmPYD2EsaBIE+0yyK9EKwp+TNT2NR59WArSer7XudZz1664DeYWLMOyyMTNjxJo
         HQnErOkUbN+CY+2EVzsk8pQ3UjJXsLzWGa95fsRY8l38qvQsogtGNJRWh7BUinYoucs1
         C7lZu3cpCL1GOOUUCMBEz/HcH46op7xFmBvvvSasdFMtjIO47JNVOWbXWg96LX8lP8iq
         MFra7TZLqVYKEEMzl3JvImQ7U973E6y2H2xzV+EYj/fWkrIHcgp43ORiYBf76szaufKS
         Y2oA==
X-Gm-Message-State: APjAAAVn90CLrdomMhM26NL87q1zQCaIBM0muXm5SkdPb0avhgSMyFVN
        9fsAknfNYXmuweKMJx+uCg==
X-Google-Smtp-Source: APXvYqzCmStbOQ9xRTnZUYEJqeYnBjL/1BPSPuFR2cN1GxC+3lypBg5iq4GBEFTsKAVW0Amlif70gw==
X-Received: by 2002:adf:e552:: with SMTP id z18mr78342167wrm.45.1563827258353;
        Mon, 22 Jul 2019 13:27:38 -0700 (PDT)
Received: from localhost.localdomain ([46.53.253.254])
        by smtp.gmail.com with ESMTPSA id f1sm28028413wml.28.2019.07.22.13.27.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 13:27:37 -0700 (PDT)
From:   Alexey Dobriyan <adobriyan@gmail.com>
To:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com
Cc:     linux-kernel@vger.kernel.org, x86@kernel.org, adobriyan@gmail.com,
        linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com,
        michal.lkml@markovi.net
Subject: [PATCH 2/5] x86_64, -march=native: POPCNT support
Date:   Mon, 22 Jul 2019 23:27:20 +0300
Message-Id: <20190722202723.13408-2-adobriyan@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190722202723.13408-1-adobriyan@gmail.com>
References: <20190722202723.13408-1-adobriyan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Detect POPCNT instruction support and inline hweigth*() functions
if it is supported by CPU.

Detect POPCNT at boot time and conditionally refuse to boot.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---
 arch/x86/include/asm/arch_hweight.h           | 24 +++++++++++++++++++
 arch/x86/include/asm/segment.h                |  1 +
 arch/x86/kernel/verify_cpu.S                  |  8 +++++++
 arch/x86/lib/Makefile                         |  5 +++-
 .../drm/i915/display/intel_display_power.c    |  2 +-
 drivers/misc/sgi-gru/grumain.c                |  2 +-
 fs/btrfs/tree-checker.c                       |  4 ++--
 include/linux/bitops.h                        |  2 ++
 lib/Makefile                                  |  2 ++
 scripts/kconfig/cpuid.c                       |  7 ++++++
 scripts/march-native.sh                       |  2 ++
 11 files changed, 54 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/arch_hweight.h b/arch/x86/include/asm/arch_hweight.h
index ba88edd0d58b..3797aa57baa5 100644
--- a/arch/x86/include/asm/arch_hweight.h
+++ b/arch/x86/include/asm/arch_hweight.h
@@ -2,6 +2,28 @@
 #ifndef _ASM_X86_HWEIGHT_H
 #define _ASM_X86_HWEIGHT_H
 
+#ifdef CONFIG_MARCH_NATIVE_POPCNT
+static inline unsigned int __arch_hweight64(uint64_t x)
+{
+	return __builtin_popcountll(x);
+}
+
+static inline unsigned int __arch_hweight32(uint32_t x)
+{
+	return __builtin_popcount(x);
+}
+
+static inline unsigned int __arch_hweight16(uint16_t x)
+{
+	return __builtin_popcount(x);
+}
+
+static inline unsigned int __arch_hweight8(uint8_t x)
+{
+	return __builtin_popcount(x);
+}
+#else
+
 #include <asm/cpufeatures.h>
 
 #ifdef CONFIG_64BIT
@@ -53,3 +75,5 @@ static __always_inline unsigned long __arch_hweight64(__u64 w)
 #endif /* CONFIG_X86_32 */
 
 #endif
+
+#endif
diff --git a/arch/x86/include/asm/segment.h b/arch/x86/include/asm/segment.h
index ac3892920419..d314c6b9b632 100644
--- a/arch/x86/include/asm/segment.h
+++ b/arch/x86/include/asm/segment.h
@@ -4,6 +4,7 @@
 
 #include <linux/const.h>
 #include <asm/alternative.h>
+#include <asm/cpufeatures.h>
 
 /*
  * Constructor for a conventional segment GDT (or LDT) entry.
diff --git a/arch/x86/kernel/verify_cpu.S b/arch/x86/kernel/verify_cpu.S
index a024c4f7ba56..a9be8904faa3 100644
--- a/arch/x86/kernel/verify_cpu.S
+++ b/arch/x86/kernel/verify_cpu.S
@@ -134,6 +134,14 @@ ENTRY(verify_cpu)
 	movl $1,%eax
 	ret
 .Lverify_cpu_sse_ok:
+
+#ifdef CONFIG_MARCH_NATIVE_POPCNT
+	mov	$1, %eax
+	cpuid
+	bt	$23, %ecx
+	jnc	.Lverify_cpu_no_longmode
+#endif
+
 	popf				# Restore caller passed flags
 	xorl %eax, %eax
 	ret
diff --git a/arch/x86/lib/Makefile b/arch/x86/lib/Makefile
index 5246db42de45..7dc0e71b0ef3 100644
--- a/arch/x86/lib/Makefile
+++ b/arch/x86/lib/Makefile
@@ -40,7 +40,10 @@ lib-$(CONFIG_RANDOMIZE_BASE) += kaslr.o
 lib-$(CONFIG_FUNCTION_ERROR_INJECTION)	+= error-inject.o
 lib-$(CONFIG_RETPOLINE) += retpoline.o
 
-obj-y += msr.o msr-reg.o msr-reg-export.o hweight.o
+obj-y += msr.o msr-reg.o msr-reg-export.o
+ifneq ($(CONFIG_MARCH_NATIVE_POPCNT),y)
+	obj-y += hweight.o
+endif
 obj-y += iomem.o
 
 ifeq ($(CONFIG_X86_32),y)
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index c93ad512014c..9066105f2fea 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -1570,7 +1570,7 @@ static void print_power_domains(struct i915_power_domains *power_domains,
 {
 	enum intel_display_power_domain domain;
 
-	DRM_DEBUG_DRIVER("%s (%lu):\n", prefix, hweight64(mask));
+	DRM_DEBUG_DRIVER("%s (%u):\n", prefix, hweight64(mask));
 	for_each_power_domain(domain, mask)
 		DRM_DEBUG_DRIVER("%s use_count %d\n",
 				 intel_display_power_domain_str(domain),
diff --git a/drivers/misc/sgi-gru/grumain.c b/drivers/misc/sgi-gru/grumain.c
index 40ac59dd018c..30cfeeb28e74 100644
--- a/drivers/misc/sgi-gru/grumain.c
+++ b/drivers/misc/sgi-gru/grumain.c
@@ -833,7 +833,7 @@ void gru_steal_context(struct gru_thread_state *gts)
 	}
 	gru_dbg(grudev,
 		"stole gid %d, ctxnum %d from gts %p. Need cb %d, ds %d;"
-		" avail cb %ld, ds %ld\n",
+		" avail cb %u, ds %u\n",
 		gru->gs_gid, ctxnum, ngts, cbr, dsr, hweight64(gru->gs_cbr_map),
 		hweight64(gru->gs_dsr_map));
 }
diff --git a/fs/btrfs/tree-checker.c b/fs/btrfs/tree-checker.c
index ccd5706199d7..2d33c6ae0e61 100644
--- a/fs/btrfs/tree-checker.c
+++ b/fs/btrfs/tree-checker.c
@@ -478,7 +478,7 @@ static int check_block_group_item(struct extent_buffer *leaf,
 	flags = btrfs_block_group_flags(&bgi);
 	if (hweight64(flags & BTRFS_BLOCK_GROUP_PROFILE_MASK) > 1) {
 		block_group_err(leaf, slot,
-"invalid profile flags, have 0x%llx (%lu bits set) expect no more than 1 bit set",
+"invalid profile flags, have 0x%llx (%u bits set) expect no more than 1 bit set",
 			flags & BTRFS_BLOCK_GROUP_PROFILE_MASK,
 			hweight64(flags & BTRFS_BLOCK_GROUP_PROFILE_MASK));
 		return -EUCLEAN;
@@ -491,7 +491,7 @@ static int check_block_group_item(struct extent_buffer *leaf,
 	    type != (BTRFS_BLOCK_GROUP_METADATA |
 			   BTRFS_BLOCK_GROUP_DATA)) {
 		block_group_err(leaf, slot,
-"invalid type, have 0x%llx (%lu bits set) expect either 0x%llx, 0x%llx, 0x%llx or 0x%llx",
+"invalid type, have 0x%llx (%u bits set) expect either 0x%llx, 0x%llx, 0x%llx or 0x%llx",
 			type, hweight64(type),
 			BTRFS_BLOCK_GROUP_DATA, BTRFS_BLOCK_GROUP_METADATA,
 			BTRFS_BLOCK_GROUP_SYSTEM,
diff --git a/include/linux/bitops.h b/include/linux/bitops.h
index cf074bce3eb3..655b120bba66 100644
--- a/include/linux/bitops.h
+++ b/include/linux/bitops.h
@@ -7,10 +7,12 @@
 #define BITS_PER_TYPE(type) (sizeof(type) * BITS_PER_BYTE)
 #define BITS_TO_LONGS(nr)	DIV_ROUND_UP(nr, BITS_PER_TYPE(long))
 
+#ifndef CONFIG_MARCH_NATIVE_POPCNT
 extern unsigned int __sw_hweight8(unsigned int w);
 extern unsigned int __sw_hweight16(unsigned int w);
 extern unsigned int __sw_hweight32(unsigned int w);
 extern unsigned long __sw_hweight64(__u64 w);
+#endif
 
 /*
  * Include this here because some architectures need generic_ffs/fls in
diff --git a/lib/Makefile b/lib/Makefile
index 095601ce371d..32400f3a3328 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -114,7 +114,9 @@ obj-$(CONFIG_DEBUG_LOCKING_API_SELFTESTS) += locking-selftest.o
 
 obj-y += logic_pio.o
 
+ifneq ($(CONFIG_MARCH_NATIVE_POPCNT),y)
 obj-$(CONFIG_GENERIC_HWEIGHT) += hweight.o
+endif
 
 obj-$(CONFIG_BTREE) += btree.o
 obj-$(CONFIG_INTERVAL_TREE) += interval_tree.o
diff --git a/scripts/kconfig/cpuid.c b/scripts/kconfig/cpuid.c
index 81b292382e26..9efc0d9464d8 100644
--- a/scripts/kconfig/cpuid.c
+++ b/scripts/kconfig/cpuid.c
@@ -43,6 +43,8 @@ static inline void cpuid2(uint32_t eax0, uint32_t ecx0, uint32_t *eax, uint32_t
 	);
 }
 
+static bool popcnt	= false;
+
 static uint32_t eax0_max;
 
 static void intel(void)
@@ -52,6 +54,10 @@ static void intel(void)
 	if (eax0_max >= 1) {
 		cpuid(1, &eax, &ecx, &edx, &ebx);
 //		printf("%08x %08x %08x %08x\n", eax, ecx, edx, ebx);
+
+		if (ecx & (1 << 23)) {
+			popcnt = true;
+		}
 	}
 }
 
@@ -72,6 +78,7 @@ int main(int argc, char *argv[])
 	}
 
 #define _(x)	if (streq(opt, #x)) return x ? EXIT_SUCCESS : EXIT_FAILURE
+	_(popcnt);
 #undef _
 
 	return EXIT_FAILURE;
diff --git a/scripts/march-native.sh b/scripts/march-native.sh
index 29a33c80b62b..c3059f93ed2b 100755
--- a/scripts/march-native.sh
+++ b/scripts/march-native.sh
@@ -41,6 +41,8 @@ COLLECT_GCC_OPTIONS=$(
 )
 echo "-march=native: $COLLECT_GCC_OPTIONS"
 
+"$CPUID" popcnt		&& option "CONFIG_MARCH_NATIVE_POPCNT"
+
 for i in $COLLECT_GCC_OPTIONS; do
 	case $i in
 		*/cc1|-E|-quiet|-v|/dev/null|--param|-fstack-protector*)
-- 
2.21.0

