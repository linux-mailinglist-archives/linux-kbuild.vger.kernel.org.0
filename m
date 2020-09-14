Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2F8B269363
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Sep 2020 19:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725984AbgINRbq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 14 Sep 2020 13:31:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726249AbgINR2j (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Sep 2020 13:28:39 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9606C061221
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Sep 2020 10:28:22 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id e17so828670wme.0
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Sep 2020 10:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oxR4q2exhcBC90vTFTNwz9/4eynAbLxOPQRAqHe9Mw8=;
        b=iEFv1oxODcKOHWza+NvTccTL3/wQordMg3U1eoRfqFg8wT2ZdgAAKIR5TqyBMDSz7j
         p6Two6b4VjgeiaRHbB/+ioQrmadcmqQvnY2N2R59qUqGWhKvSFcPBbecWZMmsRSOU+b8
         KasiVBhlOh+RhMOjN/LwusWdi6h9O0xedIEU1Db+QSOrCrPoo9U0qsW40Nrzrbp0EX3n
         +kIWWdPuoVXtvUJpO3w/+q3szInGmWzwUlyfDpMM1RV0gzMMrgepqVoqPV5Re2h4Id55
         72djWWoXs5+9bVxRyrIlmei/6++TYwru7YoKIBE4OfzDSAe/C622EhPn8E3Mn02ok9ma
         srOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oxR4q2exhcBC90vTFTNwz9/4eynAbLxOPQRAqHe9Mw8=;
        b=V6vJfypJ+cP0Hv6Ei2lOaY1slEXmbY/Xr6b0B/sbLTbyqxuc95k/OTiR4xyyKXYOCg
         C7+f/OxQFe5D2fiypZeQOASjumEzOLOfm7rrH4d/qHwzmhCkXLUaagLjiVHHtIIIqmfz
         nZ9Of7MEbT3tqkLIuhSzsv4h4PzGA3UVmYglVp9ylGYdkC9dM7jg9MjJqdeum+Ftx2NZ
         W2xwIbd3oZba9FrKcAdyAezsORnwYxIv3Myq2HlCkJ8sP9a+X/CilrWGyVI8x2lTrJZv
         +R2Cxj9ogdr3lSbNAK0ro3aUmTdSbPN7P/T34QkKE6j9P6cKx+JERNPJgI6gEsVhgXnv
         mOHw==
X-Gm-Message-State: AOAM530lwwDcnJnFjhLhEAjtC6GZRCeN0YvHifyQ7rf32mOJ+O9fVMlq
        De16WsRq/JcDMX4elH+BXqJ8mQ==
X-Google-Smtp-Source: ABdhPJziHq0hb99caNbhZ6ZpDc46fHJPvgXN25hJZzyvPSDfDyF5i1/XYuIsmSM1xvZxBc9ptSKANw==
X-Received: by 2002:a1c:6145:: with SMTP id v66mr426746wmb.171.1600104501282;
        Mon, 14 Sep 2020 10:28:21 -0700 (PDT)
Received: from localhost (49.222.77.34.bc.googleusercontent.com. [34.77.222.49])
        by smtp.gmail.com with ESMTPSA id m1sm20204287wmc.28.2020.09.14.10.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 10:28:20 -0700 (PDT)
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
Subject: [PATCH 10/14] KVM: arm64: __ubsan_handle_load_invalid_value hyp/nVHE implementation.
Date:   Mon, 14 Sep 2020 17:27:46 +0000
Message-Id: <20200914172750.852684-11-georgepope@google.com>
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

The handler for the load invalid value undefined behaviour is
implemented for hyp/nVHE. The handler's parameters are stored inside
the buffer.

They are used by the symmetric handler from the kernel.

Signed-off-by: George Popescu <georgepope@google.com>
---
 arch/arm64/include/asm/kvm_ubsan.h |  5 ++++-
 arch/arm64/kvm/hyp/nvhe/ubsan.c    | 14 +++++++++++++-
 arch/arm64/kvm/kvm_ubsan_buffer.c  |  4 ++++
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_ubsan.h b/arch/arm64/include/asm/kvm_ubsan.h
index 3130a80cd8b2..b643ac9a4090 100644
--- a/arch/arm64/include/asm/kvm_ubsan.h
+++ b/arch/arm64/include/asm/kvm_ubsan.h
@@ -22,12 +22,14 @@ struct kvm_ubsan_info {
 		UBSAN_NONE,
 		UBSAN_OUT_OF_BOUNDS,
 		UBSAN_UNREACHABLE_DATA,
-		UBSAN_SHIFT_OUT_OF_BOUNDS
+		UBSAN_SHIFT_OUT_OF_BOUNDS,
+		UBSAN_INVALID_DATA
 	} type;
 	union {
 		struct out_of_bounds_data out_of_bounds_data;
 		struct unreachable_data unreachable_data;
 		struct shift_out_of_bounds_data shift_out_of_bounds_data;
+		struct invalid_value_data invalid_value_data;
 	};
 	union {
 		struct ubsan_values u_val;
@@ -38,3 +40,4 @@ struct kvm_ubsan_info {
 void __ubsan_handle_out_of_bounds(void *_data, void *index);
 void __ubsan_handle_builtin_unreachable(void *_data);
 void __ubsan_handle_shift_out_of_bounds(void *_data, void *lhs, void *rhs);
+void __ubsan_handle_load_invalid_value(void *_data, void *val);
diff --git a/arch/arm64/kvm/hyp/nvhe/ubsan.c b/arch/arm64/kvm/hyp/nvhe/ubsan.c
index 40b82143e57f..1888a1f51724 100644
--- a/arch/arm64/kvm/hyp/nvhe/ubsan.c
+++ b/arch/arm64/kvm/hyp/nvhe/ubsan.c
@@ -82,4 +82,16 @@ void __ubsan_handle_builtin_unreachable(void *_data)
 	}
 }
 
-void __ubsan_handle_load_invalid_value(void *_data, void *val) {}
+void __ubsan_handle_load_invalid_value(void *_data, void *val)
+{
+	struct kvm_ubsan_info *slot;
+	struct invalid_value_data *data = _data;
+
+	slot = kvm_ubsan_buffer_next_slot();
+	if (slot) {
+		slot->type = UBSAN_INVALID_DATA;
+		slot->invalid_value_data = *data;
+		slot->u_val.lval = val;
+	}
+
+}
diff --git a/arch/arm64/kvm/kvm_ubsan_buffer.c b/arch/arm64/kvm/kvm_ubsan_buffer.c
index b4a282bec91d..01bf2171af9e 100644
--- a/arch/arm64/kvm/kvm_ubsan_buffer.c
+++ b/arch/arm64/kvm/kvm_ubsan_buffer.c
@@ -32,6 +32,10 @@ void __kvm_check_ubsan_data(struct kvm_ubsan_info *slot)
 		__ubsan_handle_shift_out_of_bounds(&slot->shift_out_of_bounds_data,
 				slot->u_val.lval, slot->u_val.rval);
 		break;
+	case UBSAN_INVALID_DATA:
+		__ubsan_handle_load_invalid_value(&slot->invalid_value_data,
+				slot->u_val.lval);
+		break;
 	}
 }
 
-- 
2.28.0.618.gf4bc123cb7-goog

