Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBE9770AB0
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jul 2019 22:28:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727868AbfGVU1m (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 22 Jul 2019 16:27:42 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43578 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730367AbfGVU1l (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 Jul 2019 16:27:41 -0400
Received: by mail-wr1-f65.google.com with SMTP id p13so40713124wru.10;
        Mon, 22 Jul 2019 13:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OsRCo9O41kpunRrut5RnGv9tjWQJ5UXpv8a16W7I/8M=;
        b=b2XRg6xDby6kOPn9klBsepzblBvQL4b13k+1UBUsQ6nf0nWNNJ3ySqHA8kP56vmOC7
         znv5lGzOOMK083EJ2eBHTIEmlxYe1Dcnj+3l5MA2tW54e7z59fnpyOg4i54tTLGoCXMr
         PPYhi3HI0rtCyfB7NlWGTGW154PeeDpEmqaBoVBDXwPR4BgssR5oTeRW7el7WvtoSMrR
         YmS1nH3yCsa9PA+J4iR1jALl6OGcEGzV+djScsR3SowUxQ5tDSqmFjIDV4yBU6A+V7C+
         mOEoiBuDuqv7tYWSWqqMP/DiJwY6eXXmStN7W5cmklUSempYnTUshBsn/ls9fzEiVkZW
         rPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OsRCo9O41kpunRrut5RnGv9tjWQJ5UXpv8a16W7I/8M=;
        b=H5RR1JjPcElbRq+NRfYKq+xwSwQ7PybBmKbt3H2khIAH43op6qQku7PTDvJIX3Yu8a
         wU5lt0gfxjAL/aiVs5jS78ZNDXnSJaQNRoJc7Q4eKdeCbRnjvwvoBqcIn/tQ68bJQxc+
         zQBBeHrdxWqyUwqdREJCkAKQF4Ohho6lTD8eUCHE3lM0yF7Qy03OyGhNJlO0bSfxs8DP
         omTDxgG6dynCL0ljvRhjYqk86nXNaNZ9oWs0RfJcW99wS3JgVl/yjhGLr3gVhwKyEUgL
         Zv8wd0P0sur3K6a9ODnIBHWjzyTI7NQsnvb3WQmJHRkyXxlM/rpOxKBkrH0u5Ytp+jkE
         bBsg==
X-Gm-Message-State: APjAAAW77Ocj7CDjvCghMra1dZCIoInloXKmTx75wnkCUsMyZx1xbVFn
        clX+2ju1FqPX+HbnAly54uq7Szc=
X-Google-Smtp-Source: APXvYqygGNZgHpB55spzsseM62K0dB+4Pjp/8IlLLWpQ0Rp2avWlf2DlqHQ8PxEaAjU+NyrDWPegdg==
X-Received: by 2002:a5d:4041:: with SMTP id w1mr64621927wrp.199.1563827259343;
        Mon, 22 Jul 2019 13:27:39 -0700 (PDT)
Received: from localhost.localdomain ([46.53.253.254])
        by smtp.gmail.com with ESMTPSA id f1sm28028413wml.28.2019.07.22.13.27.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 13:27:38 -0700 (PDT)
From:   Alexey Dobriyan <adobriyan@gmail.com>
To:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com
Cc:     linux-kernel@vger.kernel.org, x86@kernel.org, adobriyan@gmail.com,
        linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com,
        michal.lkml@markovi.net
Subject: [PATCH 3/5] x86_64, -march=native: REP MOVSB support
Date:   Mon, 22 Jul 2019 23:27:21 +0300
Message-Id: <20190722202723.13408-3-adobriyan@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190722202723.13408-1-adobriyan@gmail.com>
References: <20190722202723.13408-1-adobriyan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Detect fast REP MOVSB support and use it for page copying.

Inline copy_page(), this saves alternative entry and a function call
overhead which should hopefully improve code generation.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---
 Makefile                             |  3 +++
 arch/x86/include/asm/page_64.h       | 13 +++++++++++++
 arch/x86/kernel/relocate_kernel_64.S | 15 +++++++++++++++
 arch/x86/kernel/verify_cpu.S         | 12 ++++++++++++
 arch/x86/lib/Makefile                |  5 ++++-
 arch/x86/lib/memcpy_64.S             | 13 +++++++++++++
 arch/x86/platform/pvh/head.S         |  4 ++++
 scripts/kconfig/cpuid.c              |  9 +++++++++
 scripts/march-native.sh              |  1 +
 9 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 690f70afa74e..aa194c96d27c 100644
--- a/Makefile
+++ b/Makefile
@@ -609,6 +609,9 @@ endif
 ifdef CONFIG_MARCH_NATIVE
 KBUILD_CFLAGS += -march=native
 endif
+ifdef CONFIG_MARCH_NATIVE_REP_MOVSB
+KBUILD_CFLAGS += -mmemcpy-strategy=rep_byte:-1:align,rep_byte:-1:noalign
+endif
 
 ifeq ($(KBUILD_EXTMOD),)
 # Objects we will link into vmlinux / subdirs we need to visit
diff --git a/arch/x86/include/asm/page_64.h b/arch/x86/include/asm/page_64.h
index 939b1cff4a7b..051da768273d 100644
--- a/arch/x86/include/asm/page_64.h
+++ b/arch/x86/include/asm/page_64.h
@@ -54,7 +54,20 @@ static inline void clear_page(void *page)
 			   : "cc", "memory", "rax", "rcx");
 }
 
+#ifdef CONFIG_MARCH_NATIVE_REP_MOVSB
+static __always_inline void copy_page(void *to, void *from)
+{
+	uint32_t len = PAGE_SIZE;
+	asm volatile (
+		"rep movsb"
+		: "+D" (to), "+S" (from), "+c" (len)
+		:
+		: "memory"
+	);
+}
+#else
 void copy_page(void *to, void *from);
+#endif
 
 #endif	/* !__ASSEMBLY__ */
 
diff --git a/arch/x86/kernel/relocate_kernel_64.S b/arch/x86/kernel/relocate_kernel_64.S
index c51ccff5cd01..822f7a3d035a 100644
--- a/arch/x86/kernel/relocate_kernel_64.S
+++ b/arch/x86/kernel/relocate_kernel_64.S
@@ -266,18 +266,33 @@ swap_pages:
 	movq	%rsi, %rax
 
 	movq	%r10, %rdi
+#ifdef CONFIG_MARCH_NATIVE_REP_MOVSB
+	mov	$4096, %ecx
+	rep movsb
+#else
 	movl	$512, %ecx
 	rep ; movsq
+#endif
 
 	movq	%rax, %rdi
 	movq	%rdx, %rsi
+#ifdef CONFIG_MARCH_NATIVE_REP_MOVSB
+	mov	$4096, %ecx
+	rep movsb
+#else
 	movl	$512, %ecx
 	rep ; movsq
+#endif
 
 	movq	%rdx, %rdi
 	movq	%r10, %rsi
+#ifdef CONFIG_MARCH_NATIVE_REP_MOVSB
+	mov	$4096, %ecx
+	rep movsb
+#else
 	movl	$512, %ecx
 	rep ; movsq
+#endif
 
 	lea	PAGE_SIZE(%rax), %rsi
 	jmp	0b
diff --git a/arch/x86/kernel/verify_cpu.S b/arch/x86/kernel/verify_cpu.S
index a9be8904faa3..57b41dafc592 100644
--- a/arch/x86/kernel/verify_cpu.S
+++ b/arch/x86/kernel/verify_cpu.S
@@ -142,6 +142,18 @@ ENTRY(verify_cpu)
 	jnc	.Lverify_cpu_no_longmode
 #endif
 
+#ifdef CONFIG_MARCH_NATIVE_REP_MOVSB
+	xor	%eax, %eax
+	cpuid
+	cmp	$7, %eax
+	jb	.Lverify_cpu_no_longmode
+	mov	$7, %eax
+	xor	%ecx, %ecx
+	cpuid
+	bt	$9, %ebx
+	jnc	.Lverify_cpu_no_longmode
+#endif
+
 	popf				# Restore caller passed flags
 	xorl %eax, %eax
 	ret
diff --git a/arch/x86/lib/Makefile b/arch/x86/lib/Makefile
index 7dc0e71b0ef3..fa24cc717fb1 100644
--- a/arch/x86/lib/Makefile
+++ b/arch/x86/lib/Makefile
@@ -59,7 +59,10 @@ endif
 else
         obj-y += iomap_copy_64.o
         lib-y += csum-partial_64.o csum-copy_64.o csum-wrappers_64.o
-        lib-y += clear_page_64.o copy_page_64.o
+        lib-y += clear_page_64.o
+ifneq ($(CONFIG_MARCH_NATIVE_REP_MOVSB),y)
+	lib-y += copy_page_64.o
+endif
         lib-y += memmove_64.o memset_64.o
         lib-y += copy_user_64.o
 	lib-y += cmpxchg16b_emu.o
diff --git a/arch/x86/lib/memcpy_64.S b/arch/x86/lib/memcpy_64.S
index 92748660ba51..ab5b9662b348 100644
--- a/arch/x86/lib/memcpy_64.S
+++ b/arch/x86/lib/memcpy_64.S
@@ -17,6 +17,18 @@
 
 .weak memcpy
 
+#ifdef CONFIG_MARCH_NATIVE_REP_MOVSB
+ENTRY(__memcpy)
+ENTRY(memcpy)
+	mov	%rdi, %rax
+	mov	%rdx, %rcx
+	rep movsb
+	ret
+ENDPROC(memcpy)
+ENDPROC(__memcpy)
+EXPORT_SYMBOL(memcpy)
+EXPORT_SYMBOL(__memcpy)
+#else
 /*
  * memcpy - Copy a memory block.
  *
@@ -183,6 +195,7 @@ ENTRY(memcpy_orig)
 .Lend:
 	retq
 ENDPROC(memcpy_orig)
+#endif
 
 #ifndef CONFIG_UML
 
diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index 1f8825bbaffb..2737f3e8c021 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -64,9 +64,13 @@ ENTRY(pvh_start_xen)
 	mov $_pa(pvh_start_info), %edi
 	mov %ebx, %esi
 	mov _pa(pvh_start_info_sz), %ecx
+#ifdef CONFIG_MARCH_NATIVE_REP_MOVSB
+	rep movsb
+#else
 	shr $2,%ecx
 	rep
 	movsl
+#endif
 
 	mov $_pa(early_stack_end), %esp
 
diff --git a/scripts/kconfig/cpuid.c b/scripts/kconfig/cpuid.c
index 9efc0d9464d8..2d78fba1dcc7 100644
--- a/scripts/kconfig/cpuid.c
+++ b/scripts/kconfig/cpuid.c
@@ -44,6 +44,7 @@ static inline void cpuid2(uint32_t eax0, uint32_t ecx0, uint32_t *eax, uint32_t
 }
 
 static bool popcnt	= false;
+static bool rep_movsb	= false;
 
 static uint32_t eax0_max;
 
@@ -59,6 +60,13 @@ static void intel(void)
 			popcnt = true;
 		}
 	}
+	if (eax0_max >= 7) {
+		cpuid2(7, 0, &eax, &ecx, &edx, &ebx);
+//		printf("%08x %08x %08x %08x\n", eax, ecx, edx, ebx);
+
+		if (ebx & (1 << 9))
+			rep_movsb = true;
+	}
 }
 
 int main(int argc, char *argv[])
@@ -79,6 +87,7 @@ int main(int argc, char *argv[])
 
 #define _(x)	if (streq(opt, #x)) return x ? EXIT_SUCCESS : EXIT_FAILURE
 	_(popcnt);
+	_(rep_movsb);
 #undef _
 
 	return EXIT_FAILURE;
diff --git a/scripts/march-native.sh b/scripts/march-native.sh
index c3059f93ed2b..87f00cdb8e10 100755
--- a/scripts/march-native.sh
+++ b/scripts/march-native.sh
@@ -42,6 +42,7 @@ COLLECT_GCC_OPTIONS=$(
 echo "-march=native: $COLLECT_GCC_OPTIONS"
 
 "$CPUID" popcnt		&& option "CONFIG_MARCH_NATIVE_POPCNT"
+"$CPUID" rep_movsb	&& option "CONFIG_MARCH_NATIVE_REP_MOVSB"
 
 for i in $COLLECT_GCC_OPTIONS; do
 	case $i in
-- 
2.21.0

