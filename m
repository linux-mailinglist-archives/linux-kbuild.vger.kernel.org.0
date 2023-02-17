Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F5BE69AF54
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Feb 2023 16:18:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbjBQPSw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 Feb 2023 10:18:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbjBQPSu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Feb 2023 10:18:50 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDDAB656B2
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Feb 2023 07:18:45 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id w13so1273637wrl.13
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Feb 2023 07:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GHpElbdT8yGvO2G+2wK7hH12e2y8DO+zHXf7OVoJ8YY=;
        b=Xw/ILqWdiTi7Y5ML8FZgvK/UJFdWtP/qoxwRrlczOKWdxKZ3ltZr09E7i7Kb6hx3pg
         CwaTCoeenVJmC58suWT4k7NVsQCIPpNt6mwkWd6wlcRVqP+3xr/wF+u8asvJYhM8SHCH
         Y+ExaTAObLFUuT0b0f1DMpW/t+f20533EBThc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GHpElbdT8yGvO2G+2wK7hH12e2y8DO+zHXf7OVoJ8YY=;
        b=gmg94aHPKitE59BFUiSJzWYMb+h5UfLvgEsjCUYAXo3RVfh7CWWjWLU9jhqRAj7iaB
         Wz944jaja20GiTiU/47Z8la5cb5WDZl/m8zh3PSqKcWtXR6c5t7Mp7Ebgu4e4dhVKAEJ
         WvJ2s48zOShYkYTwJPijd+hxCv+CMKrHXrlx1iZJSTImsNVaLTf7dZGKyWb9Yqh0WEeP
         zQDB8avPpO0EdPoN8I6VAmrkixU3lwGixvjmYYoVUaSYOeibEF3k+VrPctkvUPDD3lwD
         GEwv0ChnKuN9oBysBKsmynYjxePV49K0eh4xYklORpLOQajY9f/EtyV7dVh11VOQQU59
         meJQ==
X-Gm-Message-State: AO0yUKUZI/iLVaU9dCfUlzCU1NkZvC22w5jUkfGrP71O/k5Asv8YDBn1
        f7N4vqAjcsOlvCiGt0ayGg6/XA==
X-Google-Smtp-Source: AK7set9HOYCXPZnIl+FQkYUmovMzzNM5k0/e/5wKgplxSmbKJ77s6EqPKIFEntOkCwkD9eyurmqsYA==
X-Received: by 2002:adf:f646:0:b0:2c6:e87f:f19 with SMTP id x6-20020adff646000000b002c6e87f0f19mr1491310wrp.57.1676647124414;
        Fri, 17 Feb 2023 07:18:44 -0800 (PST)
Received: from revest.zrh.corp.google.com ([2a00:79e0:9d:6:1704:c044:3b31:aaca])
        by smtp.gmail.com with ESMTPSA id 26-20020a05600c229a00b003dc49e0132asm1166420wmf.1.2023.02.17.07.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 07:18:43 -0800 (PST)
From:   Florent Revest <revest@chromium.org>
To:     bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        linux-kbuild@vger.kernel.org
Cc:     andrii@kernel.org, mykolal@fb.com, ast@kernel.org,
        daniel@iogearbox.net, kpsingh@kernel.org, masahiroy@kernel.org,
        nathan@kernel.org, ndesaulniers@google.com,
        Florent Revest <revest@chromium.org>
Subject: [PATCH bpf-next] selftests/bpf: Fix cross compilation with CLANG_CROSS_FLAGS
Date:   Fri, 17 Feb 2023 16:18:32 +0100
Message-Id: <20230217151832.27784-1-revest@chromium.org>
X-Mailer: git-send-email 2.39.2.637.g21b0678d19-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I cross-compile my BPF selftests with the following command:

CLANG_CROSS_FLAGS="--target=aarch64-linux-gnu --sysroot=/sysroot/" \
  make LLVM=1 CC=clang CROSS_COMPILE=aarch64-linux-gnu- SRCARCH=arm64

(Note the use of CLANG_CROSS_FLAGS to specify a custom sysroot instead
of letting clang use gcc's default sysroot)

However, CLANG_CROSS_FLAGS gets propagated to host tools builds (libbpf
and bpftool) and because they reference it directly in their Makefiles,
they end up cross-compiling host objects which results in linking
errors.

This patch ensures that CLANG_CROSS_FLAGS is reset if CROSS_COMPILE
isn't set (for example when reaching a BPF host tool build).

Signed-off-by: Florent Revest <revest@chromium.org>
---
 tools/scripts/Makefile.include | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
index 0efb8f2b33ce..ff527ac065cf 100644
--- a/tools/scripts/Makefile.include
+++ b/tools/scripts/Makefile.include
@@ -108,6 +108,8 @@ endif # GCC_TOOLCHAIN_DIR
 endif # CLANG_CROSS_FLAGS
 CFLAGS += $(CLANG_CROSS_FLAGS)
 AFLAGS += $(CLANG_CROSS_FLAGS)
+else
+CLANG_CROSS_FLAGS :=
 endif # CROSS_COMPILE
 
 # Hack to avoid type-punned warnings on old systems such as RHEL5:
-- 
2.39.2.637.g21b0678d19-goog

