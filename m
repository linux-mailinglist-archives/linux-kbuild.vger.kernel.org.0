Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5556A269367
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Sep 2020 19:32:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726160AbgINRbk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 14 Sep 2020 13:31:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbgINR2j (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Sep 2020 13:28:39 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65F7FC06178C
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Sep 2020 10:28:26 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id c18so480880wrm.9
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Sep 2020 10:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iB4T9kLFB3iIR2Z+tST4GCiUmTN46viq6Nw4qtcThCM=;
        b=tHkFPa0pnHNp4OB1KzhooQ3KuORDrIJ7EGWt10+yQOe8MMQgNYmjvEghP0/sEQoSOw
         NrHpSaLPFtOEbdIH9+QT2zFtdAdtVSJMZUXbmMtmY3dpj/pbWw+n7CeJaMiwconli2u0
         Aq9SPNQjoF5YaSNdG2pKHO6K6yXVQYc/hqdvdq04SyAuqS5OMA9RdpqN6bK/vjgH1P2E
         nEuQNt3dBI+O7bKCdwYE9d4NGSUX4o8hKfj56xPAkb3QSVu8+VbwpCHLiLB43E6Mmk0x
         T2fPnr0nxh+nP7t5TwBiUIkBB9Mp91pQ3RSH/8TvQJaByVAfUODo3KhhmSbUoNInEg47
         59PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iB4T9kLFB3iIR2Z+tST4GCiUmTN46viq6Nw4qtcThCM=;
        b=ReKLoVhGp+So4kgB5soeGWd7KKL0TRxWtdGcz/LZYJ7KFYCt6UQiTR2xpTasDpvKpg
         ebNgeV0DE4HaWx3wI9nIsSaXdMgkuV6q+c6oncQkCj+nI85khqTDloJIT379vH7GRIZf
         usnvF2bGpTaCF+Mhz5JkMEhJjgUUjD+zOWrHrCMFn49Dsz83o3mwkzc1ooVsytJ9nVSt
         avfzJPKl6Wz4rzpuxfz7cy4fus6KOk7Y6nw12Cy9Cx5+3i82mtAXEXgFE1iYwvVDlumB
         QYeLVaNctOIJBtXmb4EMfIBf7SHI041cy/BUqfnhGUDTVEOzxc1VL3+g/VS+GFa6aQ+E
         sw1g==
X-Gm-Message-State: AOAM533Zcl/vfRJ3qyyeR0Kru0cjzip11ElApD8dukgdOgsfZDzsnImL
        cJEponXNRTkY5GpxUX8gdzyb4g==
X-Google-Smtp-Source: ABdhPJxsgUHbqteuZSLV5s7MMDzWKj4bHGqYYGxCbtmcUOFgjTdJjebJk3JjekSIihnZSCM+KQlc3w==
X-Received: by 2002:adf:cf0b:: with SMTP id o11mr16218454wrj.94.1600104504963;
        Mon, 14 Sep 2020 10:28:24 -0700 (PDT)
Received: from localhost (49.222.77.34.bc.googleusercontent.com. [34.77.222.49])
        by smtp.gmail.com with ESMTPSA id l126sm20422503wmf.39.2020.09.14.10.28.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 10:28:24 -0700 (PDT)
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
Subject: [PATCH 12/14] KVM: arm64: Detect arithmetic overflow is inside hyp/nVHE.
Date:   Mon, 14 Sep 2020 17:27:48 +0000
Message-Id: <20200914172750.852684-13-georgepope@google.com>
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

Whenever an arithmetic overflow: addition, subtraction, multiplication,
division or negating happens inside the hyp/nVHE code,
an __ubsan_handle_*_overflow is called.

All the overflow handlers are sharing the same structure called
overflow_data and they use the write_overflow_data(*) function to store
the data to the buffer.

When decapsulating the data inside the kernel, the right handler is
called by checking the "op" field, which stores the arithmetic
opperator.

Signed-off-by: George Popescu <georgepope@google.com>
---
 arch/arm64/include/asm/kvm_ubsan.h | 10 ++++++--
 arch/arm64/kvm/hyp/nvhe/ubsan.c    | 40 ++++++++++++++++++++++++++----
 arch/arm64/kvm/kvm_ubsan_buffer.c  | 18 ++++++++++++++
 3 files changed, 61 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_ubsan.h b/arch/arm64/include/asm/kvm_ubsan.h
index a9f499f4ef6d..4abdbff38f79 100644
--- a/arch/arm64/include/asm/kvm_ubsan.h
+++ b/arch/arm64/include/asm/kvm_ubsan.h
@@ -24,7 +24,8 @@ struct kvm_ubsan_info {
 		UBSAN_UNREACHABLE_DATA,
 		UBSAN_SHIFT_OUT_OF_BOUNDS,
 		UBSAN_INVALID_DATA,
-		UBSAN_TYPE_MISMATCH
+		UBSAN_TYPE_MISMATCH,
+		UBSAN_OVERFLOW_DATA
 	} type;
 	union {
 		struct out_of_bounds_data out_of_bounds_data;
@@ -32,6 +33,7 @@ struct kvm_ubsan_info {
 		struct shift_out_of_bounds_data shift_out_of_bounds_data;
 		struct invalid_value_data invalid_value_data;
 		struct type_mismatch_data type_mismatch_data;
+		struct overflow_data overflow_data;
 	};
 	union {
 		struct ubsan_values u_val;
@@ -44,4 +46,8 @@ void __ubsan_handle_builtin_unreachable(void *_data);
 void __ubsan_handle_shift_out_of_bounds(void *_data, void *lhs, void *rhs);
 void __ubsan_handle_load_invalid_value(void *_data, void *val);
 void __ubsan_handle_type_mismatch(struct type_mismatch_data  *_data, void *ptr);
-
+void __ubsan_handle_add_overflow(void *data, void *lhs, void *rhs);
+void __ubsan_handle_sub_overflow(void *data, void *lhs, void *rhs);
+void __ubsan_handle_mul_overflow(void *data, void *lhs, void *rhs);
+void __ubsan_handle_negate_overflow(void *_data, void *old_val);
+void __ubsan_handle_divrem_overflow(void *_data, void *lhs, void *rhs);
diff --git a/arch/arm64/kvm/hyp/nvhe/ubsan.c b/arch/arm64/kvm/hyp/nvhe/ubsan.c
index c99d919105aa..dd2dae60864f 100644
--- a/arch/arm64/kvm/hyp/nvhe/ubsan.c
+++ b/arch/arm64/kvm/hyp/nvhe/ubsan.c
@@ -47,15 +47,45 @@ static void write_type_mismatch_data(struct type_mismatch_data_common *data, voi
 	}
 }
 
-void __ubsan_handle_add_overflow(void *_data, void *lhs, void *rhs) {}
+static void write_overflow_data(struct overflow_data *data, void *lval, void *rval, char op)
+{
+	struct kvm_ubsan_info *slot = kvm_ubsan_buffer_next_slot();
+
+	if (slot) {
+		slot->type = UBSAN_OVERFLOW_DATA;
+		slot->overflow_data = *data;
+		slot->u_val.op = op;
+		slot->u_val.lval = lval;
+		if (op != '!')
+			slot->u_val.rval = rval;
+	}
+}
+
+void __ubsan_handle_add_overflow(void *_data, void *lhs, void *rhs)
+{
+	write_overflow_data(_data, lhs, rhs, '+');
+}
 
-void __ubsan_handle_sub_overflow(void *_data, void *lhs, void *rhs) {}
+void __ubsan_handle_sub_overflow(void *_data, void *lhs, void *rhs)
+{
+	write_overflow_data(_data, lhs, rhs, '-');
+}
 
-void __ubsan_handle_mul_overflow(void *_data, void *lhs, void *rhs) {}
+void __ubsan_handle_mul_overflow(void *_data, void *lhs, void *rhs)
+{
+	write_overflow_data(_data, lhs, rhs, '*');
+}
 
-void __ubsan_handle_negate_overflow(void *_data, void *old_val) {}
+void __ubsan_handle_negate_overflow(void *_data, void *old_val)
+{
+	write_overflow_data(_data, old_val, NULL, '!');
+}
+
+void __ubsan_handle_divrem_overflow(void *_data, void *lhs, void *rhs)
+{
+	write_overflow_data(_data, lhs, rhs, '/');
+}
 
-void __ubsan_handle_divrem_overflow(void *_data, void *lhs, void *rhs) {}
 
 void __ubsan_handle_type_mismatch(struct type_mismatch_data *data, void *ptr)
 {
diff --git a/arch/arm64/kvm/kvm_ubsan_buffer.c b/arch/arm64/kvm/kvm_ubsan_buffer.c
index 21c242c92f0a..bd847ac1321e 100644
--- a/arch/arm64/kvm/kvm_ubsan_buffer.c
+++ b/arch/arm64/kvm/kvm_ubsan_buffer.c
@@ -40,6 +40,24 @@ void __kvm_check_ubsan_data(struct kvm_ubsan_info *slot)
 		__ubsan_handle_type_mismatch(&slot->type_mismatch_data,
 				slot->u_val.lval);
 		break;
+	case UBSAN_OVERFLOW_DATA:
+		if (slot->u_val.op == '/') {
+			__ubsan_handle_divrem_overflow(&slot->overflow_data,
+					slot->u_val.lval, slot->u_val.rval);
+		} else if (slot->u_val.op == '!') {
+			__ubsan_handle_negate_overflow(&slot->overflow_data,
+					slot->u_val.lval);
+		} else if (slot->u_val.op == '+') {
+			__ubsan_handle_add_overflow(&slot->overflow_data,
+					slot->u_val.lval, slot->u_val.rval);
+		} else if (slot->u_val.op == '-') {
+			__ubsan_handle_sub_overflow(&slot->overflow_data,
+					slot->u_val.lval, slot->u_val.rval);
+		} else if (slot->u_val.op == '*') {
+			__ubsan_handle_mul_overflow(&slot->overflow_data,
+					slot->u_val.lval, slot->u_val.rval);
+		}
+		break;
 	}
 }
 
-- 
2.28.0.618.gf4bc123cb7-goog

