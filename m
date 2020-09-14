Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6BC326937A
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Sep 2020 19:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbgINRdv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 14 Sep 2020 13:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726291AbgINR2c (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Sep 2020 13:28:32 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA199C06121F
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Sep 2020 10:28:20 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id a17so506671wrn.6
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Sep 2020 10:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KftJRcollRLFMVov7TaPj7WtBHwyxRPUsiHY/UZT1fw=;
        b=EYgWAcl9cL9AeiTblL7CMC+AqQx78U6/I1W7VW7Ja5I15I0jt+My8KPdhD1SAVpEHD
         AJXt5LuKrD0WR0bw/B1exIDwe7tkOX43hf5qS4uwiYCJAEU/FA1aTxXb7U22+RLK0Gw5
         IEqZhFqCrBcnVwsvqPgPtUtdGHrW6CU24YKBfkwIy52kBZc31aRqkrNTC7FpmXQy/eQ5
         dVCJRFM3SOoQVUXjSfMIKlDXY7aS2d0IgN2BzjI6mWTiBBzhjwhcJRJy/vKgdde8y6Km
         iNWk73Vy+veU+2hjy0D/PR5vfHhuUmQkzEOLnrIPC2sx7KQNQCejEB2d78t3JnwXXpZV
         WvtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KftJRcollRLFMVov7TaPj7WtBHwyxRPUsiHY/UZT1fw=;
        b=FWgNXA4K7RtFr0iC6rbKfvdA172k/z1ltwqnsz8TINHuObezbhS6PLllVJoniL4fSo
         7PI1XHiS49szpLBMr+I957lJyFNOx0OmXM/a35eDyQVCxDqpFwRCGcfg4vSiy5+77FQK
         8QbhY1AcFmDV6LsokqqD+ZQ2eLVd1w2hjlv2620oam6RRFK7VlfPcbnDaJnts8UmxXpp
         DSg637c+oRdUpM5qv4NF4A2wEzFpTx3nunf2YTSyT+SMwe6AEKlyyPHht3tRhTtyW+ME
         Yo7dTkk9I22YDkXHdVFO0GnFWfooaU4bMnX3Txne1TLGQTHBiAj+Ci0O59TTfy5nvOXO
         BSZA==
X-Gm-Message-State: AOAM532uKPGE5EjfpiyGobDu9ZgV7YjMGV2nF9zgjOH18AyaDpkKUJBB
        jdWXgLlKrD7nL54BEyrcIkMYDw==
X-Google-Smtp-Source: ABdhPJyWV+uC0DmNRAdK7vcbjg9wndOENA5KYq6/erRd565McYdWx62TZeUsQp7Eg/H+vCrNtXp7tA==
X-Received: by 2002:adf:f10a:: with SMTP id r10mr16416565wro.86.1600104499411;
        Mon, 14 Sep 2020 10:28:19 -0700 (PDT)
Received: from localhost (49.222.77.34.bc.googleusercontent.com. [34.77.222.49])
        by smtp.gmail.com with ESMTPSA id l19sm19870946wmi.8.2020.09.14.10.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 10:28:18 -0700 (PDT)
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
Subject: [PATCH 09/14] KVM: arm64: Enable shift out of bounds undefined behaviour check for hyp/nVHE
Date:   Mon, 14 Sep 2020 17:27:45 +0000
Message-Id: <20200914172750.852684-10-georgepope@google.com>
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

__ubsan_handle_shift_out_of_bounds data is passed to the buffer inside
hyp/nVHE. This data is passed to the original handler from kernel.

The values of the operands of the shift expression are stored as the lhs
and rhs pointers, so there is no need to dereference them.

Signed-off-by: George Popescu <georgepope@google.com>
---
 arch/arm64/include/asm/kvm_ubsan.h |  5 ++++-
 arch/arm64/kvm/hyp/nvhe/ubsan.c    | 14 +++++++++++++-
 arch/arm64/kvm/kvm_ubsan_buffer.c  |  4 ++++
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_ubsan.h b/arch/arm64/include/asm/kvm_ubsan.h
index 7fd0d0dfbd82..3130a80cd8b2 100644
--- a/arch/arm64/include/asm/kvm_ubsan.h
+++ b/arch/arm64/include/asm/kvm_ubsan.h
@@ -21,11 +21,13 @@ struct kvm_ubsan_info {
 	enum {
 		UBSAN_NONE,
 		UBSAN_OUT_OF_BOUNDS,
-		UBSAN_UNREACHABLE_DATA
+		UBSAN_UNREACHABLE_DATA,
+		UBSAN_SHIFT_OUT_OF_BOUNDS
 	} type;
 	union {
 		struct out_of_bounds_data out_of_bounds_data;
 		struct unreachable_data unreachable_data;
+		struct shift_out_of_bounds_data shift_out_of_bounds_data;
 	};
 	union {
 		struct ubsan_values u_val;
@@ -35,3 +37,4 @@ struct kvm_ubsan_info {
 
 void __ubsan_handle_out_of_bounds(void *_data, void *index);
 void __ubsan_handle_builtin_unreachable(void *_data);
+void __ubsan_handle_shift_out_of_bounds(void *_data, void *lhs, void *rhs);
diff --git a/arch/arm64/kvm/hyp/nvhe/ubsan.c b/arch/arm64/kvm/hyp/nvhe/ubsan.c
index 9497e7f7f397..40b82143e57f 100644
--- a/arch/arm64/kvm/hyp/nvhe/ubsan.c
+++ b/arch/arm64/kvm/hyp/nvhe/ubsan.c
@@ -56,7 +56,19 @@ void __ubsan_handle_out_of_bounds(void *_data, void *index)
 	}
 }
 
-void __ubsan_handle_shift_out_of_bounds(void *_data, void *lhs, void *rhs) {}
+void __ubsan_handle_shift_out_of_bounds(void *_data, void *lhs, void *rhs)
+{
+	struct kvm_ubsan_info *slot;
+	struct shift_out_of_bounds_data *data = _data;
+
+	slot = kvm_ubsan_buffer_next_slot();
+	if (slot) {
+		slot->type = UBSAN_SHIFT_OUT_OF_BOUNDS;
+		slot->shift_out_of_bounds_data = *data;
+		slot->u_val.lval = lhs;
+		slot->u_val.rval = rhs;
+	}
+}
 
 void __ubsan_handle_builtin_unreachable(void *_data)
 {
diff --git a/arch/arm64/kvm/kvm_ubsan_buffer.c b/arch/arm64/kvm/kvm_ubsan_buffer.c
index f66cc5f7878e..b4a282bec91d 100644
--- a/arch/arm64/kvm/kvm_ubsan_buffer.c
+++ b/arch/arm64/kvm/kvm_ubsan_buffer.c
@@ -28,6 +28,10 @@ void __kvm_check_ubsan_data(struct kvm_ubsan_info *slot)
 	case UBSAN_UNREACHABLE_DATA:
 		__ubsan_handle_builtin_unreachable(&slot->unreachable_data);
 		break;
+	case UBSAN_SHIFT_OUT_OF_BOUNDS:
+		__ubsan_handle_shift_out_of_bounds(&slot->shift_out_of_bounds_data,
+				slot->u_val.lval, slot->u_val.rval);
+		break;
 	}
 }
 
-- 
2.28.0.618.gf4bc123cb7-goog

