Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6946B26937E
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Sep 2020 19:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbgINReE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 14 Sep 2020 13:34:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726022AbgINR2J (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Sep 2020 13:28:09 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7E2FC061351
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Sep 2020 10:28:08 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id m6so555924wrn.0
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Sep 2020 10:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I6yqR/klZ/NDqjAIsRW35d99E4ctp6zjUJ0+p6Qp1zk=;
        b=FSOe1Y/pA7hRXZNY72c3hBMe/ljMhIxE66K1pTUUVfwNFBvaQYXA0ufNm+qIClk/O+
         vSZsvcN95MRwsi4JST1sCCLEHKfM6IxEY+MgDFP6z9uKuUgcIvWt5hwCegR+9a1Jcv+m
         gH8n0l5ZthmU1P5z+mETgJcgbXbDYJRY1i+0IQl2VaY5ngsnCmqitgyxHOxZkLnS/B7t
         UXFp+ntUx01PcgEYtHtyrccldppKaZ9Ry1m3p4Dc7kdsdGGPgDEoyTew8juouV20fTWo
         Q1wv6gsGClBEW0C3ySzRBVme5tXhbZYou1yowCKvdKf4SFhFjQehcpiWYtQM5a8kPB4j
         BwGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I6yqR/klZ/NDqjAIsRW35d99E4ctp6zjUJ0+p6Qp1zk=;
        b=WeG+VpSq5KFoTuOiDZmJzhi+RhwYyj0N8ygrn3DrcLw75pJ268oXe7ARKCFkkmkSBJ
         1LK4hdzsgCRpBVRDn+TIkLVxt5UtJbAhX2Q1aLir2vRfksc5clFdVSb9Xen2ieGcSXlm
         ztiIHI5JGjP/WInRF2C2q7ODSziXSurKo2GA8R1OZVtp8lOvAZgakW+tzFy6ELojJEWC
         xO7B1iomHYuOcP/3Rs2wunqSEYLv+WNlluRN5MBWgCSmlHmgYKsqNXa1yS7p/QjeDzVx
         aDw9QoZbPcJvQVuZ7ucVyO/5LLNc8aM10knf+07iwRC/76TEgcz7v07mAfUFkf9VggtF
         jBOA==
X-Gm-Message-State: AOAM533E8FPxAh4v4DnPSfD/SJLw6AlEF8f5Xo95fwJS/TV+U6X0QNaQ
        V0bv1T6FchMxjPRlCYuwQfHpOQ==
X-Google-Smtp-Source: ABdhPJwcqjA/RfbM7RQw4khYb1A0QPdinAlS/u4JKeOCntEaITKsGnzpJGBE/zpzmvvaUWtI9yB3Ig==
X-Received: by 2002:adf:f586:: with SMTP id f6mr16953275wro.299.1600104487527;
        Mon, 14 Sep 2020 10:28:07 -0700 (PDT)
Received: from localhost (49.222.77.34.bc.googleusercontent.com. [34.77.222.49])
        by smtp.gmail.com with ESMTPSA id h2sm22418218wrp.69.2020.09.14.10.28.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 10:28:06 -0700 (PDT)
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
Subject: [PATCH 03/14] KVM: arm64: Add support for creating and checking a logging buffer inside hyp/nVHE
Date:   Mon, 14 Sep 2020 17:27:39 +0000
Message-Id: <20200914172750.852684-4-georgepope@google.com>
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

Share a buffer between the kernel and the hyp/nVHE code by using the
macros from kvm_debug_buffer.h.

The buffer is composed of a writing index and a statically allocated
array. The writing index counts how many elements have been written inside
the buffer and should be set to zero whenever the code goes back to
EL2 with the clear_kvm_debug_buffer macro.

To avoid consistency problems the buffer is defined per_cpu and is designed
to be read-only from the kernel perspective.

Check if there is any logging data from hyp/nVHE code.

Every time when the state returns back to the kernel after an hvc call,
the __kvm_arm_check_debug_buffer macro checks if there is any data inside
one of the predefined buffers.

Signed-off-by: George Popescu <georgepope@google.com>
---
 arch/arm64/include/asm/kvm_debug_buffer.h | 34 +++++++++++++++++++++++
 arch/arm64/include/asm/kvm_host.h         |  6 ++++
 arch/arm64/kvm/hyp/hyp-entry.S            |  2 +-
 3 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/include/asm/kvm_debug_buffer.h

diff --git a/arch/arm64/include/asm/kvm_debug_buffer.h b/arch/arm64/include/asm/kvm_debug_buffer.h
new file mode 100644
index 000000000000..30c9b0b1a7bf
--- /dev/null
+++ b/arch/arm64/include/asm/kvm_debug_buffer.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright 2020 Google LLC
+ * Author: George Popescu <georgepope@google.com>
+ */
+#ifndef __ASSEMBLY__
+
+#include <linux/percpu-defs.h>
+#include <asm/kvm_asm.h>
+
+#ifdef __KVM_NVHE_HYPERVISOR__
+#define DEFINE_KVM_DEBUG_BUFFER(type_name, buff_name, size)             \
+	DEFINE_PER_CPU(type_name, buff_name)[(size)];	                \
+	DEFINE_PER_CPU(unsigned long, buff_name##_wr_ind) = 0
+
+#define DECLARE_KVM_DEBUG_BUFFER(type_name, buff_name, size)            \
+	DECLARE_PER_CPU(type_name, buff_name)[(size)];                  \
+	DECLARE_PER_CPU(unsigned long, buff_name##_wr_ind)
+
+#else
+
+#define DECLARE_KVM_DEBUG_BUFFER(type_name, buff_name, size)            \
+	DECLARE_PER_CPU(type_name, kvm_nvhe_sym(buff_name))[(size)];    \
+	DECLARE_PER_CPU(unsigned long, kvm_nvhe_sym(buff_name##_wr_ind))
+#endif //__KVM_NVHE_HYPERVISOR__
+
+#else
+
+.macro clear_kvm_debug_buffer sym tmp1, tmp2, tmp3
+	mov \tmp1, 0
+	hyp_str_this_cpu \sym, \tmp1, \tmp2, \tmp3
+.endm
+
+#endif // __ASSEMBLY__
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 905c2b87e05a..adc8957e9321 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -494,6 +494,10 @@ u64 __kvm_call_hyp(void *hypfn, ...);
 		__kvm_call_hyp(kvm_ksym_ref_nvhe(f), ##__VA_ARGS__);	\
 	})
 
+#define __kvm_arm_check_debug_buffer()					\
+{									\
+}
+
 /*
  * The couple of isb() below are there to guarantee the same behaviour
  * on VHE as on !VHE, where the eret to EL1 acts as a context
@@ -506,6 +510,7 @@ u64 __kvm_call_hyp(void *hypfn, ...);
 			isb();						\
 		} else {						\
 			kvm_call_hyp_nvhe(f, ##__VA_ARGS__);		\
+			__kvm_arm_check_debug_buffer();			\
 		}							\
 	} while(0)
 
@@ -518,6 +523,7 @@ u64 __kvm_call_hyp(void *hypfn, ...);
 			isb();						\
 		} else {						\
 			ret = kvm_call_hyp_nvhe_ret(f, ##__VA_ARGS__);	\
+			__kvm_arm_check_debug_buffer();			\
 		}							\
 									\
 		ret;							\
diff --git a/arch/arm64/kvm/hyp/hyp-entry.S b/arch/arm64/kvm/hyp/hyp-entry.S
index 46b4dab933d0..8df0082b9ccf 100644
--- a/arch/arm64/kvm/hyp/hyp-entry.S
+++ b/arch/arm64/kvm/hyp/hyp-entry.S
@@ -68,7 +68,7 @@ el1_sync:				// Guest trapped into EL2
 	cbnz	x1, el1_hvc_guest	// called HVC
 
 	/* Here, we're pretty sure the host called HVC. */
-	ldp	x0, x1, [sp], #16
+	ldp	x0, x1,	[sp], #16
 
 	/* Check for a stub HVC call */
 	cmp	x0, #HVC_STUB_HCALL_NR
-- 
2.28.0.618.gf4bc123cb7-goog

