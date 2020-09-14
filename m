Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4523D26934E
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Sep 2020 19:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726056AbgINR2x (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 14 Sep 2020 13:28:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbgINR2Q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Sep 2020 13:28:16 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 116CDC06174A
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Sep 2020 10:28:11 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id z9so866848wmk.1
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Sep 2020 10:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f1Yic7ZFZnWbBrZg7HASMUx7n5dssR2OZo/o20looTY=;
        b=QYAJeh3Q+9jHTWY5pAYKVdbC19xxu8ncb0TEqMua4SAPTHthmWkX9+Px4bz0H26kWs
         6I/8bZ4ODyxi7WH5k6f6b+s9kmbHCeTl+tfRlX0bnULiJo010jodXWbFD8SVsMqwup4I
         ranJQ2a5yOZvCCFDvOUspxSVCwVf8U0EaBG4mpE+5Gn9jVn3kJa4JLb9x4guXwj5i4rb
         GvPiDjVjO/NaUXS7cSrcp1NQTKBiN7a0tz4VWC74xeF0p8I/9vSbS067MRKNUduneB+J
         zohifeHywe3Gjddluj1vmPUNN9NQBRDr1Bb2lSSSuwWAXQ9XfUh5b/vXVJKRsaf4p2Kc
         ZvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f1Yic7ZFZnWbBrZg7HASMUx7n5dssR2OZo/o20looTY=;
        b=pvoNoKYrEAgArNp1HdCtCtQOc8NbA0JFJwtlh+XGYe9P+EA+3Fn/0gsK3vfK7Mt6eN
         1xhij0J4UUYcWwIOUeKbuDSAqjfnAV4Unbrvj4yitkwuMdYIopN7f5/pfP569TPQJd30
         G3EovgOiO3ejs1bIj67y0NDc7UOX+XUU1tkiUzfg8jlHMuK3R2YTa6Qdw9ObRiJgaIbY
         yxUDPdq+/3xV2GFRnqmNyVLaKW6RQLNNs21tkhD/VgDXWVJIRFsf8i3vZapEbli3YaZf
         uu4vzIDurQkfg0R8o97rwdVDHNkv6WOTGTLU3qutZ+MuLNE/qxrEuGt8UI5K1h9fVaZH
         Z+Eg==
X-Gm-Message-State: AOAM533+sI2RO9FoVJsTPiicJRYjkiZvHSzsohYNXoVDwBROjPH0F0jq
        pIgyHrLvlyLj5m+FbvOxk1o5xQ==
X-Google-Smtp-Source: ABdhPJwVPwGHg4dpWPy9oWTZbgeAo0d2o5bEHs5LmN11i0q+vogMdLJSPpEQ4lXgcBg5Y9aKVbtpdg==
X-Received: by 2002:a7b:c3da:: with SMTP id t26mr422196wmj.23.1600104489670;
        Mon, 14 Sep 2020 10:28:09 -0700 (PDT)
Received: from localhost (49.222.77.34.bc.googleusercontent.com. [34.77.222.49])
        by smtp.gmail.com with ESMTPSA id u126sm23949690wmu.9.2020.09.14.10.28.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 10:28:08 -0700 (PDT)
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
Subject: [PATCH 04/14] KVM: arm64: Add support for buffer usage
Date:   Mon, 14 Sep 2020 17:27:40 +0000
Message-Id: <20200914172750.852684-5-georgepope@google.com>
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

Use init_kvm_debug_buffer macro to init a pointer to the kvm_debug_buffer
and a pointer to the write_index. It is needed a hyp/nVHE version and a
kernel version because there are required different functions to extract
the per_cpu data.

Iterate through the buffer using the for_each_kvm_debug_buffer_slot. The
parameters are the buffer's name, the buffer's type, a pointer of
the type of the buffer, which is used to iterate through it,
an (unsigned long *) to compute the write index and an
unsigned long iterator.

Get the buffer's next empty slot using the kvm_debug_buffer_next_slot function,
the required parameters are a pointer to the buffer start, a pointer to
the writing index, the stored type size and the allocated size of the
buffer. This function has a meaning only inside hyp/nVHE, because it
shouldn't be possible to write inside the buffer from the kernel.

Signed-off-by: George Popescu <georgepope@google.com>
---
 arch/arm64/include/asm/kvm_debug_buffer.h | 31 +++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_debug_buffer.h b/arch/arm64/include/asm/kvm_debug_buffer.h
index 30c9b0b1a7bf..e451c11a77a7 100644
--- a/arch/arm64/include/asm/kvm_debug_buffer.h
+++ b/arch/arm64/include/asm/kvm_debug_buffer.h
@@ -17,10 +17,37 @@
 	DECLARE_PER_CPU(type_name, buff_name)[(size)];                  \
 	DECLARE_PER_CPU(unsigned long, buff_name##_wr_ind)
 
+static inline void *kvm_debug_buffer_next_slot(void *buff, unsigned long *buff_ind,
+			unsigned int struct_size, unsigned long buff_size)
+{
+	void *res = NULL;
+
+	if (*buff_ind < buff_size) {
+		res = buff + (*buff_ind * struct_size);
+		*buff_ind = *buff_ind + 1;
+	}
+	return res;
+}
+
+#define init_kvm_debug_buffer(buff_name, buff_type, buff_pointer, write_ind)		\
+	do {										\
+		buff = (buff_type *) __hyp_this_cpu_ptr(buff_name);			\
+		buff_ind = (unsigned long *) __hyp_this_cpu_ptr(buff_name##_wr_ind);	\
+	} while (0)
+
 #else
 
-#define DECLARE_KVM_DEBUG_BUFFER(type_name, buff_name, size)            \
-	DECLARE_PER_CPU(type_name, kvm_nvhe_sym(buff_name))[(size)];    \
+#define init_kvm_debug_buffer(buff_name, buff_type, buff_pointer, write_ind)		\
+	do {										\
+		buff_pointer = (buff_type *) this_cpu_ptr_nvhe(buff_name);		\
+		write_ind = (unsigned long *) this_cpu_ptr_nvhe(buff_name##_wr_ind);	\
+	} while (0)
+
+#define for_each_kvm_debug_buffer_slot(slot, write_ind, it)				\
+	for ((it) = 0; (it) < *(write_ind); ++(it), ++(slot))
+
+#define DECLARE_KVM_DEBUG_BUFFER(type_name, buff_name, size)				\
+	DECLARE_PER_CPU(type_name, kvm_nvhe_sym(buff_name))[(size)];			\
 	DECLARE_PER_CPU(unsigned long, kvm_nvhe_sym(buff_name##_wr_ind))
 #endif //__KVM_NVHE_HYPERVISOR__
 
-- 
2.28.0.618.gf4bc123cb7-goog

