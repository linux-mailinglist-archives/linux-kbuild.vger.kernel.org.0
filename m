Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C487570AB2
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jul 2019 22:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732557AbfGVU1o (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 22 Jul 2019 16:27:44 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36706 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730386AbfGVU1n (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 Jul 2019 16:27:43 -0400
Received: by mail-wr1-f66.google.com with SMTP id n4so40822672wrs.3;
        Mon, 22 Jul 2019 13:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A3STR9LrB4Y2S21Z9G6LEIQbITMS2+lubAv3/ulwQPc=;
        b=Ud86Vi9wI8N/br7G+C9cdVT56jRm+V/SJK2hR9KwP5Sg5eHG04UZQTVV6G3ckAMEoZ
         oTccFkjNclMbmfh/EFAVtV+GzTor/FtzJNIcx9Eal1qUJ7GxxhwXllXG6fzVFfJhjCuT
         Jw9e4wtfdHlPz5gjoUN/9wyo6ow2yk2M6F/3t26Ya22skYwNAY/DEvCnUclY3Se428MM
         hWelpdpKxoFOahSgryFi8kwHgNH0PKhmVOXRItAI308uCE3Vc9byT/xY8ndkc+xS7Y7q
         VGEvGd5aDB3xxZ7ZlgT7666g3d/0tcctHbxzBJM2ETZbiimkegMKjeuR9dx/ircsant9
         LjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A3STR9LrB4Y2S21Z9G6LEIQbITMS2+lubAv3/ulwQPc=;
        b=Orf2GCCrNNrNmGtUNxRUJv/BgaWnG0dn9xCWmOV6rBoCYNfdGkDqBhXnlIQap9kzAv
         hCXrh7SdJpwGlk1zEV+g+mYXTa02k7nhTJ5WDzZW8IGPLxq/SPWoSpKlyS4RVBy11pt8
         xbEUojCNxLnBKQg0igVRkExgDE/HGrNfgq4IZ2GD/RNUM8PFjpUqndkYG40CS6bHu5fc
         lRT98GAD1RBO2RNIsYwTQ/6oRS0SR6xPXW/coaqFm0CVv5jE81H0ItEYFOMghoKIF4ee
         xyYFiTRPPWVbPh2zWvB8ba18TUe/PIrPL5GBXzgXE6rXQSVDs6Snur8vR53vEhsLYyNH
         R++Q==
X-Gm-Message-State: APjAAAU1nrR/EqiYsnWGhA/7dPqHh5Cvb4tld+SSUH20t+JxHJLFtp1S
        X0a4eid61vhSfZUoWkXEMA==
X-Google-Smtp-Source: APXvYqy/SvUvjKAeQUZMvvn/kV6j0Hua3Xxo/X0vEAK3iKrHEKaaf7dS1nEfDG15Aqxj3gfsfa0WoA==
X-Received: by 2002:a5d:4284:: with SMTP id k4mr73848415wrq.194.1563827260351;
        Mon, 22 Jul 2019 13:27:40 -0700 (PDT)
Received: from localhost.localdomain ([46.53.253.254])
        by smtp.gmail.com with ESMTPSA id f1sm28028413wml.28.2019.07.22.13.27.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 13:27:39 -0700 (PDT)
From:   Alexey Dobriyan <adobriyan@gmail.com>
To:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com
Cc:     linux-kernel@vger.kernel.org, x86@kernel.org, adobriyan@gmail.com,
        linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com,
        michal.lkml@markovi.net
Subject: [PATCH 4/5] x86_64, -march=native: REP STOSB support
Date:   Mon, 22 Jul 2019 23:27:22 +0300
Message-Id: <20190722202723.13408-4-adobriyan@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190722202723.13408-1-adobriyan@gmail.com>
References: <20190722202723.13408-1-adobriyan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Use REP STOSB everywhere if CPU advertises fast REP STOSB.

Gcc LOVES to unroll memset(), using -mmemset-strategy saves terabytes of
.text.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---
 Makefile                           |  3 +++
 arch/x86/boot/compressed/head_64.S |  4 ++++
 arch/x86/crypto/sha1_ssse3_asm.S   |  7 ++++++-
 arch/x86/include/asm/page_64.h     | 13 +++++++++++++
 arch/x86/kernel/verify_cpu.S       |  2 +-
 arch/x86/lib/Makefile              |  2 ++
 arch/x86/lib/memset_64.S           | 15 +++++++++++++++
 arch/x86/lib/usercopy_64.c         | 16 +++++++++++++++-
 scripts/kconfig/cpuid.c            |  6 +++++-
 scripts/march-native.sh            |  1 +
 10 files changed, 65 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index aa194c96d27c..31a6375d0e31 100644
--- a/Makefile
+++ b/Makefile
@@ -612,6 +612,9 @@ endif
 ifdef CONFIG_MARCH_NATIVE_REP_MOVSB
 KBUILD_CFLAGS += -mmemcpy-strategy=rep_byte:-1:align,rep_byte:-1:noalign
 endif
+ifdef CONFIG_MARCH_NATIVE_REP_STOSB
+KBUILD_CFLAGS += -mmemset-strategy=rep_byte:-1:align,rep_byte:-1:noalign
+endif
 
 ifeq ($(KBUILD_EXTMOD),)
 # Objects we will link into vmlinux / subdirs we need to visit
diff --git a/arch/x86/boot/compressed/head_64.S b/arch/x86/boot/compressed/head_64.S
index 6233ae35d0d9..a350d265e8af 100644
--- a/arch/x86/boot/compressed/head_64.S
+++ b/arch/x86/boot/compressed/head_64.S
@@ -520,8 +520,12 @@ relocated:
 	leaq    _bss(%rip), %rdi
 	leaq    _ebss(%rip), %rcx
 	subq	%rdi, %rcx
+#ifdef CONFIG_MARCH_NATIVE_REP_STOSB
+	rep stosb
+#else
 	shrq	$3, %rcx
 	rep	stosq
+#endif
 
 /*
  * Do the extraction, and jump to the new kernel..
diff --git a/arch/x86/crypto/sha1_ssse3_asm.S b/arch/x86/crypto/sha1_ssse3_asm.S
index 99c5b8c4dc38..c98f8f2aead6 100644
--- a/arch/x86/crypto/sha1_ssse3_asm.S
+++ b/arch/x86/crypto/sha1_ssse3_asm.S
@@ -90,10 +90,15 @@
 	SHA1_PIPELINED_MAIN_BODY
 
 	# cleanup workspace
-	mov	$8, %ecx
 	mov	%rsp, %rdi
 	xor	%eax, %eax
+#ifdef CONFIG_MARCH_NATIVE_REP_STOSB
+	mov	$64, %ecx
+	rep stosb
+#else
+	mov	$8, %ecx
 	rep stosq
+#endif
 
 	mov	%rbp, %rsp		# deallocate workspace
 	pop	%rbp
diff --git a/arch/x86/include/asm/page_64.h b/arch/x86/include/asm/page_64.h
index 051da768273d..7654d5544e0b 100644
--- a/arch/x86/include/asm/page_64.h
+++ b/arch/x86/include/asm/page_64.h
@@ -40,6 +40,18 @@ extern unsigned long __phys_addr_symbol(unsigned long);
 #define pfn_valid(pfn)          ((pfn) < max_pfn)
 #endif
 
+#ifdef CONFIG_MARCH_NATIVE_REP_STOSB
+static __always_inline void clear_page(void *page)
+{
+	uint32_t len = PAGE_SIZE;
+	asm volatile (
+		"rep stosb"
+		: "+D" (page), "+c" (len)
+		: "a" (0)
+		: "memory"
+	);
+}
+#else
 void clear_page_orig(void *page);
 void clear_page_rep(void *page);
 void clear_page_erms(void *page);
@@ -53,6 +65,7 @@ static inline void clear_page(void *page)
 			   "0" (page)
 			   : "cc", "memory", "rax", "rcx");
 }
+#endif
 
 #ifdef CONFIG_MARCH_NATIVE_REP_MOVSB
 static __always_inline void copy_page(void *to, void *from)
diff --git a/arch/x86/kernel/verify_cpu.S b/arch/x86/kernel/verify_cpu.S
index 57b41dafc592..d3f3370e7dab 100644
--- a/arch/x86/kernel/verify_cpu.S
+++ b/arch/x86/kernel/verify_cpu.S
@@ -142,7 +142,7 @@ ENTRY(verify_cpu)
 	jnc	.Lverify_cpu_no_longmode
 #endif
 
-#ifdef CONFIG_MARCH_NATIVE_REP_MOVSB
+#if defined(CONFIG_MARCH_NATIVE_REP_MOVSB) || defined(CONFIG_MARCH_NATIVE_REP_STOSB)
 	xor	%eax, %eax
 	cpuid
 	cmp	$7, %eax
diff --git a/arch/x86/lib/Makefile b/arch/x86/lib/Makefile
index fa24cc717fb1..ed71e88cb859 100644
--- a/arch/x86/lib/Makefile
+++ b/arch/x86/lib/Makefile
@@ -59,7 +59,9 @@ endif
 else
         obj-y += iomap_copy_64.o
         lib-y += csum-partial_64.o csum-copy_64.o csum-wrappers_64.o
+ifneq ($(CONFIG_MARCH_NATIVE_REP_STOSB),y)
         lib-y += clear_page_64.o
+endif
 ifneq ($(CONFIG_MARCH_NATIVE_REP_MOVSB),y)
 	lib-y += copy_page_64.o
 endif
diff --git a/arch/x86/lib/memset_64.S b/arch/x86/lib/memset_64.S
index 9bc861c71e75..7786d1a65423 100644
--- a/arch/x86/lib/memset_64.S
+++ b/arch/x86/lib/memset_64.S
@@ -8,6 +8,20 @@
 
 .weak memset
 
+#ifdef CONFIG_MARCH_NATIVE_REP_STOSB
+ENTRY(memset)
+ENTRY(__memset)
+	mov	%esi, %eax
+	mov	%rdi, %rsi
+	mov	%rdx, %rcx
+	rep stosb
+	mov	%rsi, %rax
+	ret
+ENDPROC(memset)
+ENDPROC(__memset)
+EXPORT_SYMBOL(memset)
+EXPORT_SYMBOL(__memset)
+#else
 /*
  * ISO C memset - set a memory block to a byte value. This function uses fast
  * string to get better performance than the original function. The code is
@@ -140,3 +154,4 @@ ENTRY(memset_orig)
 	jmp .Lafter_bad_alignment
 .Lfinal:
 ENDPROC(memset_orig)
+#endif
diff --git a/arch/x86/lib/usercopy_64.c b/arch/x86/lib/usercopy_64.c
index fff28c6f73a2..a90779b12d89 100644
--- a/arch/x86/lib/usercopy_64.c
+++ b/arch/x86/lib/usercopy_64.c
@@ -16,11 +16,23 @@
 
 unsigned long __clear_user(void __user *addr, unsigned long size)
 {
-	long __d0;
 	might_fault();
 	/* no memory constraint because it doesn't change any memory gcc knows
 	   about */
 	stac();
+
+#ifdef CONFIG_MARCH_NATIVE_REP_STOSB
+	asm volatile (
+		"0:     rep stosb\n"
+		"1:\n"
+		_ASM_EXTABLE(0b,1b)
+		: "+D" (addr), "+c" (size)
+		: "a" (0)
+		: "memory"
+	);
+#else
+	{
+	long __d0;
 	asm volatile(
 		"	testq  %[size8],%[size8]\n"
 		"	jz     4f\n"
@@ -42,6 +54,8 @@ unsigned long __clear_user(void __user *addr, unsigned long size)
 		_ASM_EXTABLE_UA(1b, 2b)
 		: [size8] "=&c"(size), [dst] "=&D" (__d0)
 		: [size1] "r"(size & 7), "[size8]" (size / 8), "[dst]"(addr));
+	}
+#endif
 	clac();
 	return size;
 }
diff --git a/scripts/kconfig/cpuid.c b/scripts/kconfig/cpuid.c
index 2d78fba1dcc7..58d09bda61e5 100644
--- a/scripts/kconfig/cpuid.c
+++ b/scripts/kconfig/cpuid.c
@@ -45,6 +45,7 @@ static inline void cpuid2(uint32_t eax0, uint32_t ecx0, uint32_t *eax, uint32_t
 
 static bool popcnt	= false;
 static bool rep_movsb	= false;
+static bool rep_stosb	= false;
 
 static uint32_t eax0_max;
 
@@ -64,8 +65,10 @@ static void intel(void)
 		cpuid2(7, 0, &eax, &ecx, &edx, &ebx);
 //		printf("%08x %08x %08x %08x\n", eax, ecx, edx, ebx);
 
-		if (ebx & (1 << 9))
+		if (ebx & (1 << 9)) {
 			rep_movsb = true;
+			rep_stosb = true;
+		}
 	}
 }
 
@@ -88,6 +91,7 @@ int main(int argc, char *argv[])
 #define _(x)	if (streq(opt, #x)) return x ? EXIT_SUCCESS : EXIT_FAILURE
 	_(popcnt);
 	_(rep_movsb);
+	_(rep_stosb);
 #undef _
 
 	return EXIT_FAILURE;
diff --git a/scripts/march-native.sh b/scripts/march-native.sh
index 87f00cdb8e10..a41a15a64df4 100755
--- a/scripts/march-native.sh
+++ b/scripts/march-native.sh
@@ -43,6 +43,7 @@ echo "-march=native: $COLLECT_GCC_OPTIONS"
 
 "$CPUID" popcnt		&& option "CONFIG_MARCH_NATIVE_POPCNT"
 "$CPUID" rep_movsb	&& option "CONFIG_MARCH_NATIVE_REP_MOVSB"
+"$CPUID" rep_stosb	&& option "CONFIG_MARCH_NATIVE_REP_STOSB"
 
 for i in $COLLECT_GCC_OPTIONS; do
 	case $i in
-- 
2.21.0

