Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEC78346A4B
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Mar 2021 21:41:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233576AbhCWUkq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 23 Mar 2021 16:40:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233581AbhCWUkX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Mar 2021 16:40:23 -0400
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50FE4C0613E7
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Mar 2021 13:40:21 -0700 (PDT)
Received: by mail-qv1-xf4a.google.com with SMTP id u8so24234qvm.5
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Mar 2021 13:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=WZ2fsTX5FLJhX01BulIdj9aVU+u+1SaaqVDcWrlk7vo=;
        b=ec/02RNqMxC3NtjfEqCKWLv4qwmQTmHrkXsCeNO2KBn8qSqKzTE24FKGqfuKH+TVkK
         X/VKFkbL4vsRYCrPeFIrZP8DeiwqKS96n7WGnqpK5r2/VAz0Iab+2cnLr9ixgbVx3i2+
         bJO7ki2MVhZqoAWHQEzmE5B7oTVS3IIOSVMH6lZh48SF/0j7bgW6jHNwPIk8gKuBLJqR
         4qQ5N4v6mKVofR2cSUqiTSphpJlczKzRN+vOPaGMsYJ3GFsS6r9eXFPtqA3WSVhoq05F
         zPIbSYNFmagSwu4VxL+cE8EfslHOGZyTYBOn5X3fzMMM4mw38aQ1r1FrLS9fBfhCQ2tj
         1law==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=WZ2fsTX5FLJhX01BulIdj9aVU+u+1SaaqVDcWrlk7vo=;
        b=Uo3IqxPgjWpLfGoDXjbTEdSmmesb41y4Myc3zj6hAuzdB1gq10eKN+5pIaUo541aBB
         yJPUoTBT/GEOH2QHksSoOzOWPO5fWKHkzeJNaa5U/iXmVnzhzyyo5khTWb4G/NPQhNYS
         /akCw2QauOPpGRBFQMxk+N7s8j0jdk5jc9jo9KsmbKye0WdMXmZxQ7h/QNtp/7HJMbCe
         OUSK/QZZpjZQLnPFYeSk+fSM36yVecdVFnrtAI90cAlF0dwe2seI0FWrqZqoa47SDphg
         /1UOZ3N2fXYNgH194ZAkjWe6vuWAI/Ye9oeyZJwfsN1dRlqups488/OoD/CwxJmEBx+T
         JoUA==
X-Gm-Message-State: AOAM533kJ8Otn314LrwIjD+AmvuI+vDloEy69UF0wgV4mZAK7svEQSCH
        nViAK0gxO6KQyY7a/BDsWlYQwX6DFSvnRZG1CfM=
X-Google-Smtp-Source: ABdhPJyxpPvs3kGL5X0rhxaceHJDwoHelX5/WOAlmnNB1fMlzzx1j3iwVr8PFhB1zHKJQ3nkMRVGiRyWH5xdyb6dFU8=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:e9a3:260d:763b:67dc])
 (user=samitolvanen job=sendgmr) by 2002:a0c:bec3:: with SMTP id
 f3mr6577376qvj.49.1616532020445; Tue, 23 Mar 2021 13:40:20 -0700 (PDT)
Date:   Tue, 23 Mar 2021 13:39:46 -0700
In-Reply-To: <20210323203946.2159693-1-samitolvanen@google.com>
Message-Id: <20210323203946.2159693-18-samitolvanen@google.com>
Mime-Version: 1.0
References: <20210323203946.2159693-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
Subject: [PATCH v3 17/17] arm64: allow CONFIG_CFI_CLANG to be selected
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>, Jessica Yu <jeyu@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Tejun Heo <tj@kernel.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Peter Zijlstra <peterz@infradead.org>, bpf@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Select ARCH_SUPPORTS_CFI_CLANG to allow CFI to be enabled.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 arch/arm64/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 5656e7aacd69..2eefdbc3e3c9 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -75,6 +75,7 @@ config ARM64
 	select ARCH_SUPPORTS_SHADOW_CALL_STACK if CC_HAVE_SHADOW_CALL_STACK
 	select ARCH_SUPPORTS_LTO_CLANG if CPU_LITTLE_ENDIAN
 	select ARCH_SUPPORTS_LTO_CLANG_THIN
+	select ARCH_SUPPORTS_CFI_CLANG
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128 && (GCC_VERSION >= 50000 || CC_IS_CLANG)
 	select ARCH_SUPPORTS_NUMA_BALANCING
-- 
2.31.0.291.g576ba9dcdaf-goog

