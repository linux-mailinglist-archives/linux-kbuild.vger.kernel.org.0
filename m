Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3057F26934C
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Sep 2020 19:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbgINR2n (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 14 Sep 2020 13:28:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726273AbgINR2Y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Sep 2020 13:28:24 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B95BC061355
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Sep 2020 10:28:13 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id s12so466099wrw.11
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Sep 2020 10:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/4VwXgJoMbk9POxFRHy1vRuuoE0F0rYUfbOkZd2TWH0=;
        b=amPh1yVyk5hsom+N7frn7ZaaN2fdVT09fNxiF+g8sBUUwDxE8gwytpL5RaaqpAKPXL
         K1P6UwD+bgpwaOVGkDSH8HhKaO6zCvViC3tpU9Zpuwn4OcPoiiGXGBoW2R0EoC8v4rKy
         EGoQGj3Dg1w2+f36a7/lnrpY/1iFHmPlqbhDSmo0O+MGsGmZGM6pqptzDnasinwhANLj
         4Fc/V4MVAloP8rQ590HmNMl95HI36WRgEGjmpAubcTv73WDPz2iZNfd5xPgaOkDzx8TR
         RterKOwezbCeHnyORfnJPbeyY0EZq9QAv2mPqglRAYdyEvVDulzE9OeK3oSzuwgvg5TQ
         6agA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/4VwXgJoMbk9POxFRHy1vRuuoE0F0rYUfbOkZd2TWH0=;
        b=tTDb8NZFijTafORfCnaophDeux/j11Sehv3fBHn+Z19I7V65k10OI5mNcltOpvMlnJ
         bMBLZNNkWbgOENHyjwXpJGAT78Za6UNpGatM/DAxncZGULX9bFJBcWTpbi+YWg6ice2E
         5uvnPbhAR9DhePGHWNkI9QuPoO/47UTC/blO5G4f7f1A/WJO2qzZeKhQzRFCcCqWqy4I
         mMvTxpWDUHyHgkE1vdXWH1DVYSe2yACjVo3++x6IOupp3TH3njZn2WFWttI8rmacdnIX
         2Dg7pirVMSwGutq3sH4doFurT+jxbnLlkLGG7FI/oboZqd/lJrh6sqSZnBqNAr1G2qKM
         xjJg==
X-Gm-Message-State: AOAM530HHcEQiUIlankhu6ev4pXpi7ld7g1RJogs/oZkbQyrAE12rKQd
        AP1sHM1QwP8ZmwRJr8jlFGslug==
X-Google-Smtp-Source: ABdhPJzjIpl24eBuXRk5Xw2CVqvs2BB+r9DeJ7mZjJ1acd5LET7e/D2xbtzn/nEHsYfgyEIUS5e5Mg==
X-Received: by 2002:adf:8b48:: with SMTP id v8mr17059052wra.21.1600104491563;
        Mon, 14 Sep 2020 10:28:11 -0700 (PDT)
Received: from localhost (49.222.77.34.bc.googleusercontent.com. [34.77.222.49])
        by smtp.gmail.com with ESMTPSA id h16sm22935608wre.87.2020.09.14.10.28.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 10:28:10 -0700 (PDT)
From:   George-Aurelian Popescu <georgepope@google.com>
To:     maz@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        masahiroy@kernel.org, michal.lkml@markovi.net
Cc:     linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        clang-built-linux@googlegroups.com, james.morse@arm.com,
        julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com,
        natechancellor@gmail.com, ndesaulniers@google.com,
        dbrazdil@google.com, broonie@kernel.org, maskray@google.com,
        ascull@google.com, keescook@chromium.org,
        akpm@linux-foundation.org, dvyukov@google.com, elver@google.com,
        tglx@linutronix.de, arnd@arndb.de,
        George Popescu <georgepope@google.com>
Subject: [PATCH 05/14] KVM: arm64: Define a buffer that can pass UBSan data from hyp/nVHE to kernel
Date:   Mon, 14 Sep 2020 17:27:41 +0000
Message-Id: <20200914172750.852684-6-georgepope@google.com>
X-Mailer: git-send-email 2.28.0.618.gf4bc123cb7-goog
In-Reply-To: <20200914172750.852684-1-georgepope@google.com>
References: <20200914172750.852684-1-georgepope@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: George Popescu <georgepope@google.com>

Store data, which is collected from UBSan handlers that lives inside hyp/nVHE,
into the kvm_ubsan_buffer.
This buffer is designed to store only UBSan data because it should not be
preoccupied by other mechanisms data structures and functionalities.

Map the buffer and the write index before switching the control to
hyp/nVHE.

Map the kernel .data region to read the compile time generated UBSan struct's
data from hyp/nVHE.

Signed-off-by: George Popescu <georgepope@google.com>
---
 arch/arm64/include/asm/kvm_asm.h   |  3 +++
 arch/arm64/include/asm/kvm_host.h  |  6 +++++
 arch/arm64/include/asm/kvm_ubsan.h | 17 +++++++++++++
 arch/arm64/kvm/Makefile            |  4 ++++
 arch/arm64/kvm/arm.c               | 38 +++++++++++++++++++++++++++++-
 arch/arm64/kvm/hyp/hyp-entry.S     |  4 ++++
 arch/arm64/kvm/hyp/nvhe/ubsan.c    | 24 ++++++++++++++++++-
 arch/arm64/kvm/kvm_ubsan_buffer.c  | 32 +++++++++++++++++++++++++
 8 files changed, 126 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/include/asm/kvm_ubsan.h
 create mode 100644 arch/arm64/kvm/kvm_ubsan_buffer.c

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 200bb8d0a720..9d4a77f08ffd 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -63,6 +63,9 @@
 #define CHOOSE_VHE_SYM(sym)	sym
 #define CHOOSE_NVHE_SYM(sym)	kvm_nvhe_sym(sym)
 
+#define this_cpu_ptr_nvhe(sym)		this_cpu_ptr(&kvm_nvhe_sym(sym))
+#define per_cpu_ptr_nvhe(sym, cpu)	per_cpu_ptr(&kvm_nvhe_sym(sym), cpu)
+
 #ifndef __KVM_NVHE_HYPERVISOR__
 /*
  * BIG FAT WARNINGS:
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index adc8957e9321..337fd2d0f976 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -494,8 +494,14 @@ u64 __kvm_call_hyp(void *hypfn, ...);
 		__kvm_call_hyp(kvm_ksym_ref_nvhe(f), ##__VA_ARGS__);	\
 	})
 
+#ifdef CONFIG_UBSAN
+extern void __kvm_check_ubsan_buffer(void);
+#endif
+
 #define __kvm_arm_check_debug_buffer()					\
 {									\
+	if (IS_ENABLED(CONFIG_UBSAN))					\
+		__kvm_check_ubsan_buffer();				\
 }
 
 /*
diff --git a/arch/arm64/include/asm/kvm_ubsan.h b/arch/arm64/include/asm/kvm_ubsan.h
new file mode 100644
index 000000000000..af607a796376
--- /dev/null
+++ b/arch/arm64/include/asm/kvm_ubsan.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2020 Google LLC
+ * Author: George Popescu <georgepope@google.com>
+ */
+
+#ifdef CONFIG_UBSAN
+#include <ubsan.h>
+
+
+#define UBSAN_MAX_TYPE 6
+#define KVM_UBSAN_BUFFER_SIZE 1000
+
+struct kvm_ubsan_info {
+	int type;
+};
+#endif
diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index 99977c1972cc..92f06cb5b3df 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -24,4 +24,8 @@ kvm-y := $(KVM)/kvm_main.o $(KVM)/coalesced_mmio.o $(KVM)/eventfd.o \
 	 vgic/vgic-mmio-v3.o vgic/vgic-kvm-device.o \
 	 vgic/vgic-its.o vgic/vgic-debug.o
 
+CFLAGS_kvm_ubsan_buffer.o += -I $(srctree)/lib/
+CFLAGS_arm.o += -I $(srctree)/lib
+
+kvm-$(CONFIG_UBSAN) += kvm_ubsan_buffer.o
 kvm-$(CONFIG_KVM_ARM_PMU)  += pmu-emul.o
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index b588c3b5c2f0..eff57069e103 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -42,10 +42,17 @@
 #include <kvm/arm_pmu.h>
 #include <kvm/arm_psci.h>
 
+#include <asm/kvm_debug_buffer.h>
+#include <asm/kvm_ubsan.h>
+
 #ifdef REQUIRES_VIRT
 __asm__(".arch_extension	virt");
 #endif
 
+#ifdef CONFIG_UBSAN
+DECLARE_KVM_DEBUG_BUFFER(struct kvm_ubsan_info, kvm_ubsan_buff, KVM_UBSAN_BUFFER_SIZE);
+#endif
+
 DEFINE_PER_CPU(kvm_host_data_t, kvm_host_data);
 static DEFINE_PER_CPU(unsigned long, kvm_arm_hyp_stack_page);
 
@@ -1519,7 +1526,15 @@ static int init_hyp_mode(void)
 		kvm_err("Cannot map bss section\n");
 		goto out_err;
 	}
-
+#ifdef CONFIG_UBSAN
+	/* required by ubsan to access the handlers structures fields */
+	err = create_hyp_mappings(kvm_ksym_ref(_data),
+				  kvm_ksym_ref(__end_once), PAGE_HYP_RO);
+	if (err) {
+		kvm_err("Cannot map data section\n");
+		goto out_err;
+	}
+#endif
 	err = kvm_map_vectors();
 	if (err) {
 		kvm_err("Cannot map vectors\n");
@@ -1552,6 +1567,27 @@ static int init_hyp_mode(void)
 		}
 	}
 
+#ifdef CONFIG_UBSAN
+	for_each_possible_cpu(cpu) {
+		/* map the write index */
+		struct kvm_ubsan_info *buff;
+		unsigned long *wr_ind;
+
+		wr_ind = per_cpu_ptr_nvhe(kvm_ubsan_buff_wr_ind, cpu);
+		err = create_hyp_mappings(wr_ind, wr_ind + 1, PAGE_HYP);
+		if (err) {
+			kvm_err("Cannot map the busan buffer write index: %d\n", err);
+			goto out_err;
+		}
+		buff = per_cpu_ptr(kvm_nvhe_sym(kvm_ubsan_buff), cpu);
+		err = create_hyp_mappings(buff, buff + KVM_UBSAN_BUFFER_SIZE, PAGE_HYP);
+		if (err) {
+			kvm_err("Cannot map the ubsan buffer: %d\n", err);
+			goto out_err;
+		}
+	}
+#endif
+
 	err = hyp_map_aux_data();
 	if (err)
 		kvm_err("Cannot map host auxiliary data: %d\n", err);
diff --git a/arch/arm64/kvm/hyp/hyp-entry.S b/arch/arm64/kvm/hyp/hyp-entry.S
index 8df0082b9ccf..bcdbab4d2e43 100644
--- a/arch/arm64/kvm/hyp/hyp-entry.S
+++ b/arch/arm64/kvm/hyp/hyp-entry.S
@@ -14,6 +14,7 @@
 #include <asm/kvm_asm.h>
 #include <asm/kvm_mmu.h>
 #include <asm/mmu.h>
+#include <asm/kvm_debug_buffer.h>
 
 .macro save_caller_saved_regs_vect
 	/* x0 and x1 were saved in the vector entry */
@@ -74,6 +75,9 @@ el1_sync:				// Guest trapped into EL2
 	cmp	x0, #HVC_STUB_HCALL_NR
 	b.hs	1f
 
+#ifdef CONFIG_UBSAN
+	clear_kvm_debug_buffer kvm_ubsan_buff_wr_ind, x4, x5, x6
+#endif
 	/*
 	 * Compute the idmap address of __kvm_handle_stub_hvc and
 	 * jump there. Since we use kimage_voffset, do not use the
diff --git a/arch/arm64/kvm/hyp/nvhe/ubsan.c b/arch/arm64/kvm/hyp/nvhe/ubsan.c
index a5db6b61ceb2..a43c9646e1e8 100644
--- a/arch/arm64/kvm/hyp/nvhe/ubsan.c
+++ b/arch/arm64/kvm/hyp/nvhe/ubsan.c
@@ -3,9 +3,31 @@
  * Copyright 2020 Google LLC
  * Author: George Popescu <georgepope@google.com>
  */
+#include <linux/bitops.h>
 #include <linux/ctype.h>
 #include <linux/types.h>
-#include <ubsan.h>
+#include <linux/percpu-defs.h>
+#include <linux/kvm_host.h>
+#include <asm/kvm_arm.h>
+#include <asm/kvm_asm.h>
+#include <asm/kvm_ubsan.h>
+#include <asm/kvm_debug_buffer.h>
+#include <kvm/arm_pmu.h>
+
+DEFINE_KVM_DEBUG_BUFFER(struct kvm_ubsan_info, kvm_ubsan_buff, KVM_UBSAN_BUFFER_SIZE);
+
+static inline struct kvm_ubsan_info *kvm_ubsan_buffer_next_slot(void)
+{
+	struct kvm_ubsan_info *res;
+	struct kvm_ubsan_info *buff;
+	unsigned long *buff_ind;
+	unsigned long buff_size = KVM_UBSAN_BUFFER_SIZE;
+	unsigned int struct_size = sizeof(struct kvm_ubsan_info);
+
+	init_kvm_debug_buffer(kvm_ubsan_buff, struct kvm_ubsan_info, buff, buff_ind);
+	res = kvm_debug_buffer_next_slot(buff, buff_ind, struct_size, buff_size);
+	return res;
+}
 
 void __ubsan_handle_add_overflow(void *_data, void *lhs, void *rhs) {}
 
diff --git a/arch/arm64/kvm/kvm_ubsan_buffer.c b/arch/arm64/kvm/kvm_ubsan_buffer.c
new file mode 100644
index 000000000000..28dcf19b5706
--- /dev/null
+++ b/arch/arm64/kvm/kvm_ubsan_buffer.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2020 Google LLC
+ * Author: George Popescu <georgepope@google.com>
+ */
+
+#include <linux/ctype.h>
+#include <linux/types.h>
+#include <asm/kvm_debug_buffer.h>
+#include <asm/kvm_arm.h>
+#include <asm/kvm_asm.h>
+#include <kvm/arm_pmu.h>
+
+#include <ubsan.h>
+#include <asm/kvm_ubsan.h>
+
+DECLARE_KVM_DEBUG_BUFFER(struct kvm_ubsan_info, kvm_ubsan_buff, KVM_UBSAN_BUFFER_SIZE);
+
+
+void __kvm_check_ubsan_buffer(void)
+{
+	unsigned long *write_ind;
+	unsigned long it;
+	struct kvm_ubsan_info *slot;
+
+	init_kvm_debug_buffer(kvm_ubsan_buff, struct kvm_ubsan_info, slot, write_ind);
+	for_each_kvm_debug_buffer_slot(slot, write_ind, it) {
+		/* check ubsan data */
+		slot->type = 0;
+	}
+}
+
-- 
2.28.0.618.gf4bc123cb7-goog

