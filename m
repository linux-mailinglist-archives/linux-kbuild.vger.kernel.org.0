Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 915C426937D
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Sep 2020 19:34:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgINRd4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 14 Sep 2020 13:33:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbgINR22 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Sep 2020 13:28:28 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0C49C06121C
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Sep 2020 10:28:16 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id g4so515884wrs.5
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Sep 2020 10:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VE4tiaYIO2WH178ygWtKyTutOHC4+8KlDDbyhHM4F14=;
        b=tSsBMUWsMvg8+rPbGLC3iYKX0M9xTuJCgz8t9VzFY/lPy2b722XAFrOELq7cSNpIxk
         N9S5vrz2VcmU/j3WqAfHtIo7s+KuY8ak7B/tAU5NAvf54fH1rh0GHPJ6ElKhZGk3Mdw2
         ZyUng2UvYJ18NYurvGMI2vrPFIihzVaGyJOS8jOH2ePwigt8T84XvtwVOp5ByrQLnaXd
         SxgwfYEnrlmxDAAm/fq1xJgaWOPKHUMNCKDRSG5G7oYbjiJGUMoAY65TE+vuPGm9bag9
         Lh14EdLD9IpUB/n0nxNhI+Mj+Hx5DMLpZMQ3zlrmushDlXv2bFwUMuUlbzXDmKDYSRNl
         l23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VE4tiaYIO2WH178ygWtKyTutOHC4+8KlDDbyhHM4F14=;
        b=YhMJm/jv37ZI93ciBMBtVlRFp5a1wjbEkeeJ5nPAgmW88JoQw/rjjZ2yupX0mUKVzI
         czw3eX3WRbg19PtMv5UB+7QJsaIz8B+FvD+MgL14TMJTHCxFP523qAVexH5FvGsM9Njp
         yFYmz/dzStTZGBe+nKatIRrGLLWXzLV37N0O18OK8nIboUWA4N2+VhklDyUMEjZwmpwr
         DP/z3Zk5N8NG2eQuiSnPbJicDMMPmP9ZeuxBvATLEmEjX2QWre1tZadKAWgKG/1tre2e
         U3OaJgeaokkOsH2bWdw+sX5D5E2/lfWhJao3LiDyMhX3L29kFCHm9y3lfVueS/o8NXhp
         T1fw==
X-Gm-Message-State: AOAM5329vx70hYSVnVqqCYBc4Nl4r+FY/SP0mmeUdmROtBUysqxM2uWX
        Ba2lWe8avgCqtcOzD6jYs3wnQw==
X-Google-Smtp-Source: ABdhPJwDp0qDmVhRrvPNjBrZkX56Whr339QzJq0eZ5FLOChOIB1ToFOdRxzoHsQ+yPW+W6ciFtGbiw==
X-Received: by 2002:a5d:50c3:: with SMTP id f3mr16765517wrt.125.1600104495500;
        Mon, 14 Sep 2020 10:28:15 -0700 (PDT)
Received: from localhost (49.222.77.34.bc.googleusercontent.com. [34.77.222.49])
        by smtp.gmail.com with ESMTPSA id e1sm15404359wrp.49.2020.09.14.10.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 10:28:14 -0700 (PDT)
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
Subject: [PATCH 07/14] KVM: arm64: Enable UBSAN_BOUNDS for the both the kernel and hyp/nVHE
Date:   Mon, 14 Sep 2020 17:27:43 +0000
Message-Id: <20200914172750.852684-8-georgepope@google.com>
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

If an out of bounds happens inside the hyp/nVHE code, the
ubsan_out_of_bounds handler stores the logging data inside the
kvm_ubsan_buffer. The one responsible for printing is the kernel
ubsan_out_of_bounds handler. The process of decapsulating the data happens
in kvm_ubsan_buffer.c.

The struct kvm_ubsan_info contains three main components:
-enum type, which is used to identify which handler to call from the
kernel.
-struct ubsan_values, which stores the operands involved during the
undefined behaviours, which can be one, two or zero, depending on what
undefiend behaviour is reported. As an example for: out_of_bounds there
is only one operand (the index).

Accessing a slot with no type should do nothing. Each slot is marked
with the UBSAN_NONE tag after it's first usage.

Signed-off-by: George Popescu <georgepope@google.com>
---
 arch/arm64/include/asm/kvm_ubsan.h | 19 ++++++++++++++++++-
 arch/arm64/kvm/hyp/nvhe/ubsan.c    | 13 ++++++++++++-
 arch/arm64/kvm/kvm_ubsan_buffer.c  | 13 ++++++++++++-
 3 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_ubsan.h b/arch/arm64/include/asm/kvm_ubsan.h
index af607a796376..575881e0bd5f 100644
--- a/arch/arm64/include/asm/kvm_ubsan.h
+++ b/arch/arm64/include/asm/kvm_ubsan.h
@@ -11,7 +11,24 @@
 #define UBSAN_MAX_TYPE 6
 #define KVM_UBSAN_BUFFER_SIZE 1000
 
+struct ubsan_values {
+	void *lval;
+	void *rval;
+	char op;
+};
+
 struct kvm_ubsan_info {
-	int type;
+	enum {
+		UBSAN_NONE,
+		UBSAN_OUT_OF_BOUNDS
+	} type;
+	union {
+		struct out_of_bounds_data out_of_bounds_data;
+	};
+	union {
+		struct ubsan_values u_val;
+	};
 };
 #endif
+
+void __ubsan_handle_out_of_bounds(void *_data, void *index);
diff --git a/arch/arm64/kvm/hyp/nvhe/ubsan.c b/arch/arm64/kvm/hyp/nvhe/ubsan.c
index a43c9646e1e8..b2d3404f6215 100644
--- a/arch/arm64/kvm/hyp/nvhe/ubsan.c
+++ b/arch/arm64/kvm/hyp/nvhe/ubsan.c
@@ -43,7 +43,18 @@ void __ubsan_handle_type_mismatch(struct type_mismatch_data *data, void *ptr) {}
 
 void __ubsan_handle_type_mismatch_v1(void *_data, void *ptr) {}
 
-void __ubsan_handle_out_of_bounds(void *_data, void *index) {}
+void __ubsan_handle_out_of_bounds(void *_data, void *index)
+{
+	struct kvm_ubsan_info *slot = NULL;
+	struct out_of_bounds_data *data = _data;
+
+	slot = kvm_ubsan_buffer_next_slot();
+	if (slot) {
+		slot->type = UBSAN_OUT_OF_BOUNDS;
+		slot->out_of_bounds_data = *data;
+		slot->u_val.lval = index;
+	}
+}
 
 void __ubsan_handle_shift_out_of_bounds(void *_data, void *lhs, void *rhs) {}
 
diff --git a/arch/arm64/kvm/kvm_ubsan_buffer.c b/arch/arm64/kvm/kvm_ubsan_buffer.c
index 28dcf19b5706..ce796bdd027e 100644
--- a/arch/arm64/kvm/kvm_ubsan_buffer.c
+++ b/arch/arm64/kvm/kvm_ubsan_buffer.c
@@ -16,6 +16,17 @@
 
 DECLARE_KVM_DEBUG_BUFFER(struct kvm_ubsan_info, kvm_ubsan_buff, KVM_UBSAN_BUFFER_SIZE);
 
+void __kvm_check_ubsan_data(struct kvm_ubsan_info *slot)
+{
+	switch (slot->type) {
+	case UBSAN_NONE:
+		break;
+	case UBSAN_OUT_OF_BOUNDS:
+		__ubsan_handle_out_of_bounds(&slot->out_of_bounds_data,
+				slot->u_val.lval);
+		break;
+	}
+}
 
 void __kvm_check_ubsan_buffer(void)
 {
@@ -25,7 +36,7 @@ void __kvm_check_ubsan_buffer(void)
 
 	init_kvm_debug_buffer(kvm_ubsan_buff, struct kvm_ubsan_info, slot, write_ind);
 	for_each_kvm_debug_buffer_slot(slot, write_ind, it) {
-		/* check ubsan data */
+		__kvm_check_ubsan_data(slot);
 		slot->type = 0;
 	}
 }
-- 
2.28.0.618.gf4bc123cb7-goog

