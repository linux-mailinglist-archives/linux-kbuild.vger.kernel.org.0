Return-Path: <linux-kbuild+bounces-716-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EB7841189
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jan 2024 19:02:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A70DC28EE27
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jan 2024 18:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0106C1586D6;
	Mon, 29 Jan 2024 18:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hqPNbxNn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B5976022
	for <linux-kbuild@vger.kernel.org>; Mon, 29 Jan 2024 18:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706551254; cv=none; b=Rko1HUUEJZyFs+cb7V05dHi4jjDANwCW5vle/cqCZuUCKQaOML7wgsrBjGZU1KW3aAdnh8U6GbRnt1AD5thic0K34etPj6TqlaZXnJAgun+98hdO7ENKzOK/Grh1qVE0vQ+ezIMzteJMUSgy3qZQRA9eUEilA8PiXYK6LpUFDWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706551254; c=relaxed/simple;
	bh=vyr6Rwi/L4pPWBag7CWmhgakv5Jllyh1RjY3A2J+kW0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TKdk2dqnkm9RFWv5ry7w7Ft1y/zfOEJ51lpj6/DjjAUIl9XrQUyJu6CMvfYd00bURXGq68LZF5XT5Z9uVON8krcF8KnMaxB6FjrceUuMQm9zI9SHu1y2NFTyhE3BQ12JvT47L3Ze/eAnOa1/74H80XxtRztuWVxdgmA7tbO57hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hqPNbxNn; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6ddc0c02665so1117046b3a.0
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Jan 2024 10:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706551252; x=1707156052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCmwNzG0gnTrnb9QgYxmIVbsupAP31DOfmkmHJeY0ek=;
        b=hqPNbxNndTfhQPefx6pHq3mYjF2fPySoDhhRhZvRn7OgRllIc7hLycb5b+KMyPPA1H
         cw9FHa0yHXRRdp5OGGXlHWMtcdYB4Yom5oYray26qKj8Ejq3ZmrKhG0FZdqPNMRZfxyT
         5DBLISuER+7YuJ0mP8g1N5CHs84/2uOrTv9No=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706551252; x=1707156052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OCmwNzG0gnTrnb9QgYxmIVbsupAP31DOfmkmHJeY0ek=;
        b=FfFa9dWlIcWK8iiSYdV3044IUg5EWJVBYVxMsn1/ZEnup/9U1Yvg3K3bxUkz5JyO/S
         5asezPs4j9SoaR1ctLW/kl628hma0IgM/O2ziB7EFrtZVurdEByBd1gL77jKAH3IuEby
         CDBTr6COv5KTdTzPW6K7vZnMmpXXLbMuwokkhyUpRrfTR2nYoyUZ+5wDBN9Gi2wkNngs
         1Wz8zokprJH+jvJUAHu9rd8gHYhVKyUj/drJy50Sv61AB0SLW6IT07u3ZwxryTClpsFR
         hkCfG+XHGY2gqRe6TvcDwHKkS2LIxMQRo7pHhyQ8wo+v7XL7GvT2tFl+o+S8529/fmPt
         gdvQ==
X-Gm-Message-State: AOJu0YykmhmNnbdIYDAT4JQNeRVdghzKcFxWYEXPlOe0tkrpsNBUgGkM
	nOZbtP9HZ9y5mWcLq6OyPlhEwySjctF7w6uCLA1tCK8dE4/IEeJZH4akwmOY5KOC87SBEIETTxw
	=
X-Google-Smtp-Source: AGHT+IGVjbfx+dgJA2wbD9MRyfwRvwDaPUuZ8EQ54JR12VYQ5TreN5Z+GN2o1FR+hWh1xxRLAdwFNQ==
X-Received: by 2002:a05:6a00:4b84:b0:6de:144e:5adb with SMTP id ks4-20020a056a004b8400b006de144e5adbmr2032890pfb.9.1706551251690;
        Mon, 29 Jan 2024 10:00:51 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id ld10-20020a056a004f8a00b006ddce8e110bsm6145946pfb.128.2024.01.29.10.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 10:00:51 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Marco Elver <elver@google.com>
Cc: Kees Cook <keescook@chromium.org>,
	Justin Stitt <justinstitt@google.com>,
	Fangrui Song <maskray@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH 6/6] ubsan: Get x86_64 booting with unsigned wrap-around sanitizer
Date: Mon, 29 Jan 2024 10:00:43 -0800
Message-Id: <20240129180046.3774731-6-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129175033.work.813-kees@kernel.org>
References: <20240129175033.work.813-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8826; i=keescook@chromium.org;
 h=from:subject; bh=vyr6Rwi/L4pPWBag7CWmhgakv5Jllyh1RjY3A2J+kW0=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlt+fL+5j6RyjG7DFwNYFk5rjZHC5PVhYr7Nsno
 6c43/+/XJuJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZbfnywAKCRCJcvTf3G3A
 JoneD/4yJSut/tjh9xof+uxlmfu6lhp6Y/pPhiztmsHBZs6eoYUT5ZgHTVbbmBCR9BsSXIWNSjP
 qQRttiPvGPUoWvplm6FkkD5jsTkUKrBbE+k8sSQzgTn8JGKu/zUBie2nr0Med5fXmSe/vN08qsi
 6NK61jypgUeb2pM9WTX0jaw6pcbBEn4lF6k7J9JsC0x3zwePDBCvuYQnTOfPiOli9MH8sE2m7Ux
 CO4MSJi9o4ougznPuSqbbGqU1E66GOz7koREFMXIb1hxsiwxDRRr19kak0MRMzx3n9jgCYWfBRF
 vah4SUGIyPSJcpltYbg1tl1kIS0OOKXP5p26TmxyfdfDKDruPJm9VEd6FtHAPwdS/eSJxkJcuCD
 mVgoUmh/5fFvP0DwsamhMn+6bc9vqdGWZ/pusIr7JG/nw3jJUMeFUXwryR9STu2HBsYm8DB5lQR
 4zpO3NtQnHldS7UYyRvT3efNH9qZP/0umPzlasK6u7ZfHCWAHDUV5Eed5rMtTxywEAzhyJsrLC8
 y/7vEA/t4Dv/JlU0RJLd6INlXGEjCUXhx0A/U0AfUoiAm6c/JxqoU4rxP25AB28e1zYVIVpZeTV
 cxTMOVYc5CXqZpPKWtOY2c9MNUgfQJrWGICCS4DqqTzbGmHoULukYpOnlGBqwm07O83s0pTGgX/ lBYuk1BRX+RxxrA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

In order to get x86_64 booting with the unsigned wrap-around sanitizer,
several kernel areas that depend heavily on unsigned wrap-around need to
be disabled entirely (with "UBSAN_UNSIGNED_WRAP := n"). As we fine-tune
the sanitizer, we can revisit these and perform finer grain annotations.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/kernel/Makefile      | 1 +
 arch/x86/kernel/apic/Makefile | 1 +
 arch/x86/mm/Makefile          | 1 +
 arch/x86/mm/pat/Makefile      | 1 +
 crypto/Makefile               | 1 +
 drivers/acpi/Makefile         | 1 +
 kernel/Makefile               | 1 +
 kernel/locking/Makefile       | 1 +
 kernel/rcu/Makefile           | 1 +
 kernel/sched/Makefile         | 1 +
 lib/Kconfig.ubsan             | 5 +++--
 lib/Makefile                  | 1 +
 lib/crypto/Makefile           | 1 +
 lib/crypto/mpi/Makefile       | 1 +
 lib/zlib_deflate/Makefile     | 1 +
 lib/zstd/Makefile             | 2 ++
 mm/Makefile                   | 1 +
 net/core/Makefile             | 1 +
 net/ipv4/Makefile             | 1 +
 19 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index 0000325ab98f..de93f8b8a149 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -30,6 +30,7 @@ KASAN_SANITIZE_sev.o					:= n
 
 # With some compiler versions the generated code results in boot hangs, caused
 # by several compilation units. To be safe, disable all instrumentation.
+UBSAN_WRAP_UNSIGNED := n
 KCSAN_SANITIZE := n
 KMSAN_SANITIZE_head$(BITS).o				:= n
 KMSAN_SANITIZE_nmi.o					:= n
diff --git a/arch/x86/kernel/apic/Makefile b/arch/x86/kernel/apic/Makefile
index 3bf0487cf3b7..aa97b5830b64 100644
--- a/arch/x86/kernel/apic/Makefile
+++ b/arch/x86/kernel/apic/Makefile
@@ -6,6 +6,7 @@
 # Leads to non-deterministic coverage that is not a function of syscall inputs.
 # In particular, smp_apic_timer_interrupt() is called in random places.
 KCOV_INSTRUMENT		:= n
+UBSAN_WRAP_UNSIGNED	:= n
 
 obj-$(CONFIG_X86_LOCAL_APIC)	+= apic.o apic_common.o apic_noop.o ipi.o vector.o init.o
 obj-y				+= hw_nmi.o
diff --git a/arch/x86/mm/Makefile b/arch/x86/mm/Makefile
index c80febc44cd2..7a43466d4581 100644
--- a/arch/x86/mm/Makefile
+++ b/arch/x86/mm/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 # Kernel does not boot with instrumentation of tlb.c and mem_encrypt*.c
+UBSAN_WRAP_UNSIGNED := n
 KCOV_INSTRUMENT_tlb.o			:= n
 KCOV_INSTRUMENT_mem_encrypt.o		:= n
 KCOV_INSTRUMENT_mem_encrypt_amd.o	:= n
diff --git a/arch/x86/mm/pat/Makefile b/arch/x86/mm/pat/Makefile
index ea464c995161..281a5786c5ea 100644
--- a/arch/x86/mm/pat/Makefile
+++ b/arch/x86/mm/pat/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
+UBSAN_WRAP_UNSIGNED := n
 
 obj-y				:= set_memory.o memtype.o
 
diff --git a/crypto/Makefile b/crypto/Makefile
index 408f0a1f9ab9..c7b23d99e715 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -2,6 +2,7 @@
 #
 # Cryptographic API
 #
+UBSAN_WRAP_UNSIGNED := n
 
 obj-$(CONFIG_CRYPTO) += crypto.o
 crypto-y := api.o cipher.o compress.o
diff --git a/drivers/acpi/Makefile b/drivers/acpi/Makefile
index 12ef8180d272..92a8e8563b1b 100644
--- a/drivers/acpi/Makefile
+++ b/drivers/acpi/Makefile
@@ -2,6 +2,7 @@
 #
 # Makefile for the Linux ACPI interpreter
 #
+UBSAN_WRAP_UNSIGNED := n
 
 ccflags-$(CONFIG_ACPI_DEBUG)	+= -DACPI_DEBUG_OUTPUT
 
diff --git a/kernel/Makefile b/kernel/Makefile
index ce105a5558fc..1b31aa19b4fb 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -2,6 +2,7 @@
 #
 # Makefile for the linux kernel.
 #
+UBSAN_WRAP_UNSIGNED := n
 
 obj-y     = fork.o exec_domain.o panic.o \
 	    cpu.o exit.o softirq.o resource.o \
diff --git a/kernel/locking/Makefile b/kernel/locking/Makefile
index 0db4093d17b8..dd6492509596 100644
--- a/kernel/locking/Makefile
+++ b/kernel/locking/Makefile
@@ -2,6 +2,7 @@
 # Any varying coverage in these files is non-deterministic
 # and is generally not a function of system call inputs.
 KCOV_INSTRUMENT		:= n
+UBSAN_WRAP_UNSIGNED	:= n
 
 obj-y += mutex.o semaphore.o rwsem.o percpu-rwsem.o
 
diff --git a/kernel/rcu/Makefile b/kernel/rcu/Makefile
index 0cfb009a99b9..305c13042633 100644
--- a/kernel/rcu/Makefile
+++ b/kernel/rcu/Makefile
@@ -2,6 +2,7 @@
 # Any varying coverage in these files is non-deterministic
 # and is generally not a function of system call inputs.
 KCOV_INSTRUMENT := n
+UBSAN_WRAP_UNSIGNED := n
 
 ifeq ($(CONFIG_KCSAN),y)
 KBUILD_CFLAGS += -g -fno-omit-frame-pointer
diff --git a/kernel/sched/Makefile b/kernel/sched/Makefile
index 976092b7bd45..e487b0e86c2e 100644
--- a/kernel/sched/Makefile
+++ b/kernel/sched/Makefile
@@ -7,6 +7,7 @@ ccflags-y += $(call cc-disable-warning, unused-but-set-variable)
 # These files are disabled because they produce non-interesting flaky coverage
 # that is not a function of syscall inputs. E.g. involuntary context switches.
 KCOV_INSTRUMENT := n
+UBSAN_WRAP_UNSIGNED := n
 
 # Disable KCSAN to avoid excessive noise and performance degradation. To avoid
 # false positives ensure barriers implied by sched functions are instrumented.
diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
index 0611120036eb..54981e717355 100644
--- a/lib/Kconfig.ubsan
+++ b/lib/Kconfig.ubsan
@@ -132,8 +132,9 @@ config UBSAN_UNSIGNED_WRAP
 	depends on !COMPILE_TEST
 	help
 	  This option enables -fsanitize=unsigned-integer-overflow which checks
-	  for wrap-around of any arithmetic operations with unsigned integers. This
-	  currently causes x86 to fail to boot.
+	  for wrap-around of any arithmetic operations with unsigned integers.
+	  Given the history of C and the many common code patterns involving
+	  unsigned wrap-around, this is a very noisy option right now.
 
 config UBSAN_POINTER_WRAP
 	bool "Perform checking for pointer arithmetic wrap-around"
diff --git a/lib/Makefile b/lib/Makefile
index 6b09731d8e61..2b7c36e9291f 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -2,6 +2,7 @@
 #
 # Makefile for some libs needed in the kernel.
 #
+UBSAN_WRAP_UNSIGNED := n
 
 ccflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_FTRACE)
 
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 8d1446c2be71..fce88a337a53 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
+UBSAN_WRAP_UNSIGNED := n
 
 obj-$(CONFIG_CRYPTO_LIB_UTILS)			+= libcryptoutils.o
 libcryptoutils-y				:= memneq.o utils.o
diff --git a/lib/crypto/mpi/Makefile b/lib/crypto/mpi/Makefile
index 6e6ef9a34fe1..ce95653915b1 100644
--- a/lib/crypto/mpi/Makefile
+++ b/lib/crypto/mpi/Makefile
@@ -2,6 +2,7 @@
 #
 # MPI multiprecision maths library (from gpg)
 #
+UBSAN_WRAP_UNSIGNED := n
 
 obj-$(CONFIG_MPILIB) = mpi.o
 
diff --git a/lib/zlib_deflate/Makefile b/lib/zlib_deflate/Makefile
index 2622e03c0b94..5d71690554bb 100644
--- a/lib/zlib_deflate/Makefile
+++ b/lib/zlib_deflate/Makefile
@@ -6,6 +6,7 @@
 # This is the compression code, see zlib_inflate for the
 # decompression code.
 #
+UBSAN_WRAP_UNSIGNED := n
 
 obj-$(CONFIG_ZLIB_DEFLATE) += zlib_deflate.o
 
diff --git a/lib/zstd/Makefile b/lib/zstd/Makefile
index 20f08c644b71..7a187cb08c1f 100644
--- a/lib/zstd/Makefile
+++ b/lib/zstd/Makefile
@@ -8,6 +8,8 @@
 # in the COPYING file in the root directory of this source tree).
 # You may select, at your option, one of the above-listed licenses.
 # ################################################################
+UBSAN_WRAP_UNSIGNED := n
+
 obj-$(CONFIG_ZSTD_COMPRESS) += zstd_compress.o
 obj-$(CONFIG_ZSTD_DECOMPRESS) += zstd_decompress.o
 obj-$(CONFIG_ZSTD_COMMON) += zstd_common.o
diff --git a/mm/Makefile b/mm/Makefile
index e4b5b75aaec9..cacbdd1a2d40 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -2,6 +2,7 @@
 #
 # Makefile for the linux memory manager.
 #
+UBSAN_WRAP_UNSIGNED := n
 
 KASAN_SANITIZE_slab_common.o := n
 KASAN_SANITIZE_slub.o := n
diff --git a/net/core/Makefile b/net/core/Makefile
index 821aec06abf1..501d7300da83 100644
--- a/net/core/Makefile
+++ b/net/core/Makefile
@@ -2,6 +2,7 @@
 #
 # Makefile for the Linux networking core.
 #
+UBSAN_WRAP_UNSIGNED := n
 
 obj-y := sock.o request_sock.o skbuff.o datagram.o stream.o scm.o \
 	 gen_stats.o gen_estimator.o net_namespace.o secure_seq.o \
diff --git a/net/ipv4/Makefile b/net/ipv4/Makefile
index ec36d2ec059e..c738d463bb7e 100644
--- a/net/ipv4/Makefile
+++ b/net/ipv4/Makefile
@@ -2,6 +2,7 @@
 #
 # Makefile for the Linux TCP/IP (INET) layer.
 #
+UBSAN_WRAP_UNSIGNED := n
 
 obj-y     := route.o inetpeer.o protocol.o \
 	     ip_input.o ip_fragment.o ip_forward.o ip_options.o \
-- 
2.34.1


