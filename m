Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5619B70AB1
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Jul 2019 22:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732464AbfGVU1m (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 22 Jul 2019 16:27:42 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41986 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729672AbfGVU1l (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 Jul 2019 16:27:41 -0400
Received: by mail-wr1-f65.google.com with SMTP id x1so25759384wrr.9;
        Mon, 22 Jul 2019 13:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wATd5kVI+UVI5lH50okrR9ZPqzeszwNO1vzZStFPlUg=;
        b=tjdwuH706NV3IID5GNQflhslZye2/ubjFv+xFb2t7YW58CBapa/ZSSUdxCASFmiEkd
         alk6LKIUAAInpuJuPsNGlhitKZjHWKutvDqX5ybKpDfJGGHU7qMOpJu3ahwTDtntAsPO
         SoBlvJIiYiJ9pDJUIXjH5xE7izLKxvdTPVCXIz796gEwf5texAJVQTVHvAtzKp/TvgEP
         1zy/WNSVk6mct6xgKMTC2EhA6KhWtJQBzz0QNhD60NVrUYU40mGhoofzfCTzY5AV9N4N
         PKXZDya79fefdGZ0bHccq41XLADqfaDvRAe3ok3+C3ocXSPPrt7Mj6vCC/mTX69sPDiB
         N/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wATd5kVI+UVI5lH50okrR9ZPqzeszwNO1vzZStFPlUg=;
        b=oNKeB6LjgjWBXiRc7ooEOE5Lc/kyb9Y0b7JytSEE7ke+aaudcWwuSFlGjESMbhj12r
         P4Yo7jQPu00q6EKKIWiHCP7JqrVRETKs3JfSuFQg4UV/P4d/edHOUPq8Ucb8VTIT4xJo
         +Cxo5XeCefE92pbk94c5h9b2RXy/UqsTP/zUm9ZMXNbcsX+ple8X7Y3viMuh+uwlBfpq
         GWzMu4I+J6n5M32Ty5/phvEmpD2tajBcJhA4XfDCnqgYOuFlkA1pcZSr5QGaVMGjRMgj
         0uQOv/Olti2hs16nHrLKH5VbZ6s9yIa5TzmeLlJA8wFDpMHrMSIuzMEDMmCGWv8+sl5F
         nQ+Q==
X-Gm-Message-State: APjAAAXDyTtsF7ucnkR71jnau5x5Ss3lj+HzIzFd5nkvCXTbDs4BJOId
        if5f6+2n8M0o2nbXJC1i9g==
X-Google-Smtp-Source: APXvYqyOhIoA5MvJN91vEIv7llByxA/nIhjorH8nF/sjwB23QdLyIxVTTnEvn2XxbnShV/F02YXsuQ==
X-Received: by 2002:adf:9bcd:: with SMTP id e13mr76068600wrc.338.1563827257252;
        Mon, 22 Jul 2019 13:27:37 -0700 (PDT)
Received: from localhost.localdomain ([46.53.253.254])
        by smtp.gmail.com with ESMTPSA id f1sm28028413wml.28.2019.07.22.13.27.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 13:27:36 -0700 (PDT)
From:   Alexey Dobriyan <adobriyan@gmail.com>
To:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com
Cc:     linux-kernel@vger.kernel.org, x86@kernel.org, adobriyan@gmail.com,
        linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com,
        michal.lkml@markovi.net
Subject: [PATCH 1/5] x86_64: -march=native support
Date:   Mon, 22 Jul 2019 23:27:19 +0300
Message-Id: <20190722202723.13408-1-adobriyan@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I'm tired of rebasing it, so...

"-march=native" has been available in userspace for a long time and is
trivial to enable in Gentoo:

	$ grep -e ^CFLAGS /etc/portage/make.conf
	CFLAGS="-march=native -O2 -pipe"

Patchset enables kernel compile with "-march=native" and do additional
optimizations based on CPU detection. Unfortunately most of the fun is in
SSE2/AVX2 instructions and kernel can't use those. But I have ideas for
at least BMI2.

This is intended to be an alternative to old school MCORE2 options.
Gentoo also ships a patch unrolling all those individual -march= options
into kernel config options. This patch should deprecate it.

See the link for more information:

	https://www.shlomifish.org/humour/by-others/funroll-loops/Gentoo-is-Rice.html

Patch adds:
* -mgeneral-regs-only
	with -march=native all those shiny AVX42-666 instructions
	may suddenly became available

* small compile time partial CPUID detection,
* detect L1 cache shift at compile time,
* show "-march=native" line in /proc/config.gz,
* bump Kconfig "shell" output buffer to accomodate the option,

* inject individual MARCH_NATIVE options at compile time,
	see other patches.

Currently only Intel and gcc are supported.

Intel, because I never had and AMD box.

Gcc, because clang emits detailed "march=native" information in
a different way, so I need to think how to extract it reliably.

Size benchmarks, my trimmed down kernel:

	add/remove: 1/11 grow/shrink: 1856/5598 up/down: 14452/-65830 (-51378)
	Function                                     old     new   delta
	sha_transform                               4302    4606    +304
				...
	udf_write_fi                                1907    1023    -884
	Total: Before=7814760, After=7763382, chg -0.66%

This is mostly due to memset() un-unrolling.

In general, say, crypto and hash code becomes bigger because all those
rotations and shifts become RORX and SHLX instructions and those are 5+
bytes. Older compilers may also emit "REP RET" on generic kernels
because AMD, but upon detecting Intel those REP prefixes may go.

Users are advised to enable it and do their own benchmarks to decide if
it is worth the hassle.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---
 Makefile                     |  4 ++
 arch/x86/Kconfig.cpu         | 20 +++++++++
 arch/x86/Makefile            |  1 +
 scripts/kconfig/.gitignore   |  1 +
 scripts/kconfig/Makefile     |  7 ++-
 scripts/kconfig/cpuid.c      | 85 ++++++++++++++++++++++++++++++++++++
 scripts/kconfig/preprocess.c |  2 +-
 scripts/march-native.sh      | 66 ++++++++++++++++++++++++++++
 8 files changed, 184 insertions(+), 2 deletions(-)
 create mode 100644 scripts/kconfig/cpuid.c
 create mode 100755 scripts/march-native.sh

diff --git a/Makefile b/Makefile
index 0623c6f88b5b..690f70afa74e 100644
--- a/Makefile
+++ b/Makefile
@@ -606,6 +606,10 @@ ifeq ($(dot-config),1)
 include include/config/auto.conf
 endif
 
+ifdef CONFIG_MARCH_NATIVE
+KBUILD_CFLAGS += -march=native
+endif
+
 ifeq ($(KBUILD_EXTMOD),)
 # Objects we will link into vmlinux / subdirs we need to visit
 init-y		:= init/
diff --git a/arch/x86/Kconfig.cpu b/arch/x86/Kconfig.cpu
index 8e29c991ba3e..d71928d636be 100644
--- a/arch/x86/Kconfig.cpu
+++ b/arch/x86/Kconfig.cpu
@@ -287,8 +287,26 @@ config GENERIC_CPU
 	  Generic x86-64 CPU.
 	  Run equally well on all x86-64 CPUs.
 
+config MARCH_NATIVE
+	bool "-march=native"
+	depends on X86_64 && CC_IS_GCC
+	---help---
+	  Compile with -march=native.
+
+	  Optimise for the machine where compilation is done at. Resulting
+	  kernel and modules will not run reliably on a different machine
+	  unless exactly identical CPUs are used.
+
+	  Select only if you're self-compiling kernels and never share
+	  the binaries. If unsure, select "Generic x86_64".
+
 endchoice
 
+config MARCH_NATIVE_CC_FLAGS
+	string
+	depends on MARCH_NATIVE && CC_IS_GCC
+	default "$(shell,$(CC) -march=native -v -E -x c /dev/null 2>&1 | sed -ne '/^COLLECT_GCC_OPTIONS=/{n;p}' | awk '{$1=$1};1')"
+
 config X86_GENERIC
 	bool "Generic x86 support"
 	depends on X86_32
@@ -307,6 +325,7 @@ config X86_INTERNODE_CACHE_SHIFT
 	int
 	default "12" if X86_VSMP
 	default X86_L1_CACHE_SHIFT
+	depends on !MARCH_NATIVE
 
 config X86_L1_CACHE_SHIFT
 	int
@@ -314,6 +333,7 @@ config X86_L1_CACHE_SHIFT
 	default "6" if MK7 || MK8 || MPENTIUMM || MCORE2 || MATOM || MVIAC7 || X86_GENERIC || GENERIC_CPU
 	default "4" if MELAN || M486 || MGEODEGX1
 	default "5" if MWINCHIP3D || MWINCHIPC6 || MCRUSOE || MEFFICEON || MCYRIXIII || MK6 || MPENTIUMIII || MPENTIUMII || M686 || M586MMX || M586TSC || M586 || MVIAC3_2 || MGEODE_LX
+	depends on !MARCH_NATIVE
 
 config X86_F00F_BUG
 	def_bool y
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 56e748a7679f..5d7355c88142 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -59,6 +59,7 @@ endif
 #
 KBUILD_CFLAGS += -mno-sse -mno-mmx -mno-sse2 -mno-3dnow
 KBUILD_CFLAGS += $(call cc-option,-mno-avx,)
+KBUILD_CFLAGS += $(call cc-option,-mgeneral-regs-only)
 
 ifeq ($(CONFIG_X86_32),y)
         BITS := 32
diff --git a/scripts/kconfig/.gitignore b/scripts/kconfig/.gitignore
index b5bf92f66d11..411a885ad9b1 100644
--- a/scripts/kconfig/.gitignore
+++ b/scripts/kconfig/.gitignore
@@ -8,6 +8,7 @@
 # configuration programs
 #
 conf
+cpuid
 mconf
 nconf
 qconf
diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 7656e1137b6b..cebd1711ba7a 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -69,8 +69,9 @@ simple-targets := oldconfig allnoconfig allyesconfig allmodconfig \
 	alldefconfig randconfig listnewconfig olddefconfig syncconfig
 PHONY += $(simple-targets)
 
-$(simple-targets): $(obj)/conf
+$(simple-targets): $(obj)/conf $(obj)/cpuid
 	$< $(silent) --$@ $(Kconfig)
+	$(Q)$(srctree)/scripts/march-native.sh $(CC) $(obj)/cpuid
 
 PHONY += savedefconfig defconfig
 
@@ -150,6 +151,10 @@ $(obj)/lexer.lex.o: $(obj)/parser.tab.h
 HOSTCFLAGS_lexer.lex.o	:= -I $(srctree)/$(src)
 HOSTCFLAGS_parser.tab.o	:= -I $(srctree)/$(src)
 
+# cpuid: -march=native, CONFIG_MARCH_NATIVE_* detection
+hostprogs-y	+= cpuid
+cpuid-objs	:= cpuid.o
+
 # conf: Used for defconfig, oldconfig and related targets
 hostprogs-y	+= conf
 conf-objs	:= conf.o $(common-objs)
diff --git a/scripts/kconfig/cpuid.c b/scripts/kconfig/cpuid.c
new file mode 100644
index 000000000000..81b292382e26
--- /dev/null
+++ b/scripts/kconfig/cpuid.c
@@ -0,0 +1,85 @@
+/*
+ * Copyright (c) 2017, 2019 Alexey Dobriyan <adobriyan@gmail.com>
+ *
+ * Permission to use, copy, modify, and distribute this software for any
+ * purpose with or without fee is hereby granted, provided that the above
+ * copyright notice and this permission notice appear in all copies.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
+ * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
+ * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
+ * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
+ * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
+ * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
+ * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+ */
+#ifdef __x86_64__
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+static inline bool streq(const char *s1, const char *s2)
+{
+	return strcmp(s1, s2) == 0;
+}
+
+static inline void cpuid(uint32_t eax0, uint32_t *eax, uint32_t *ecx, uint32_t *edx, uint32_t *ebx)
+{
+	asm volatile (
+		"cpuid"
+		: "=a" (*eax), "=c" (*ecx), "=d" (*edx), "=b" (*ebx)
+		: "a" (eax0)
+	);
+}
+
+static inline void cpuid2(uint32_t eax0, uint32_t ecx0, uint32_t *eax, uint32_t *ecx, uint32_t *edx, uint32_t *ebx)
+{
+	asm volatile (
+		"cpuid"
+		: "=a" (*eax), "=c" (*ecx), "=d" (*edx), "=b" (*ebx)
+		: "a" (eax0), "c" (ecx0)
+	);
+}
+
+static uint32_t eax0_max;
+
+static void intel(void)
+{
+	uint32_t eax, ecx, edx, ebx;
+
+	if (eax0_max >= 1) {
+		cpuid(1, &eax, &ecx, &edx, &ebx);
+//		printf("%08x %08x %08x %08x\n", eax, ecx, edx, ebx);
+	}
+}
+
+int main(int argc, char *argv[])
+{
+	const char *opt = argv[1];
+	uint32_t eax, ecx, edx, ebx;
+
+	if (argc != 2)
+		return EXIT_FAILURE;
+
+	cpuid(0, &eax, &ecx, &edx, &ebx);
+//	printf("%08x %08x %08x %08x\n", eax, ecx, edx, ebx);
+	eax0_max = eax;
+
+	if (ecx == 0x6c65746e && edx == 0x49656e69 && ebx == 0x756e6547) {
+		intel();
+	}
+
+#define _(x)	if (streq(opt, #x)) return x ? EXIT_SUCCESS : EXIT_FAILURE
+#undef _
+
+	return EXIT_FAILURE;
+}
+#else
+#include <stdlib.h>
+int main(void)
+{
+	return EXIT_FAILURE;
+}
+#endif
diff --git a/scripts/kconfig/preprocess.c b/scripts/kconfig/preprocess.c
index 0243086fb168..75a819d3abaa 100644
--- a/scripts/kconfig/preprocess.c
+++ b/scripts/kconfig/preprocess.c
@@ -141,7 +141,7 @@ static char *do_lineno(int argc, char *argv[])
 static char *do_shell(int argc, char *argv[])
 {
 	FILE *p;
-	char buf[256];
+	char buf[2048];
 	char *cmd;
 	size_t nread;
 	int i;
diff --git a/scripts/march-native.sh b/scripts/march-native.sh
new file mode 100755
index 000000000000..29a33c80b62b
--- /dev/null
+++ b/scripts/march-native.sh
@@ -0,0 +1,66 @@
+#!/bin/sh
+# Copyright (c) 2017-2019 Alexey Dobriyan <adobriyan@gmail.com>
+if test "$(uname -m)" != "x86_64"; then
+	exit 0
+fi
+
+CC="$1"
+CPUID="$2"
+CONFIG=".config"
+AUTOCONF1="include/config/auto.conf"
+AUTOCONF2="include/generated/autoconf.h"
+
+if ! grep -q -e '^CONFIG_MARCH_NATIVE=y$' "$CONFIG"; then
+	sed -i -e '/^CONFIG_MARCH_NATIVE/d' "$AUTOCONF1" "$AUTOCONF2" >/dev/null 2>&1
+	exit 0
+fi
+
+if ! "$CC" -march=native -x c -c -o /dev/null /dev/null >/dev/null 2>&1; then
+	echo >&2 "error: unsupported '-march=native' compiler option"
+	exit 1
+fi
+
+_option() {
+	echo "$1=$2"		>>"$AUTOCONF1"
+	echo "#define $1 $2"	>>"$AUTOCONF2"
+}
+
+option() {
+	echo "$1=y"		>>"$AUTOCONF1"
+	echo "#define $1 1"	>>"$AUTOCONF2"
+}
+
+if test ! -f "$CONFIG" -o ! -f "$AUTOCONF1" -o ! -f "$AUTOCONF2"; then
+	exit 0
+fi
+
+COLLECT_GCC_OPTIONS=$(
+	"$CC" -march=native -v -E -x c /dev/null 2>&1	|\
+	sed -ne '/^COLLECT_GCC_OPTIONS=/{n;p}'		|\
+	awk '{$1=$1};1'
+)
+echo "-march=native: $COLLECT_GCC_OPTIONS"
+
+for i in $COLLECT_GCC_OPTIONS; do
+	case $i in
+		*/cc1|-E|-quiet|-v|/dev/null|--param|-fstack-protector*)
+			;;
+
+		l1-cache-line-size=64)
+			_option "CONFIG_X86_L1_CACHE_SHIFT"		6
+			_option "CONFIG_X86_INTERNODE_CACHE_SHIFT"	6
+			;;
+
+		l1-cache-size=*);;
+		l2-cache-size=*);;
+
+		-march=*);;
+		-mtune=*);;
+
+		-m*);;
+		-mno-*);;
+
+		*)
+			echo >&2 "warning: unexpected -march=native option '$i'"
+	esac
+done
-- 
2.21.0

