Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD94358CAA
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Apr 2021 20:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232913AbhDHSbX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Apr 2021 14:31:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232981AbhDHSaz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Apr 2021 14:30:55 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11D83C0610D2
        for <linux-kbuild@vger.kernel.org>; Thu,  8 Apr 2021 11:29:21 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id k15so2899605ybh.6
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Apr 2021 11:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=wpJei33p36j3KjjMHxyiKmG4dj3y1cwd0hIxQebiEdM=;
        b=a3nRPCcLgUjC8+dAsZsjnXIQNP/rwy/DDjL0mVaRLZUSJLKjLCe23/7r3jufcOURP2
         YfreigpdbzFmBPynu7ev4x2f9hGuOwXl1gQNFI+p2gMnNBATgfM6aNqo8eWkwib0f/8F
         EUNhOz40NxYK4iX4IsYefTQK+m8Ly9vO79flGB3PdZreeWclK/3HsvQa2Eu+zlw9dkH7
         6qm5k1CF4uhU9Fd39Czmkl971aNRY+2JAKOGLjLe1yvMJopP7gW/T36sDYdpLNjW4pel
         /nYjwa7lv0PuEkaqdQpGCQ8z4533FqqU8pmp1ExKErObiCmjnfRuj5TuEngXRWPRbWkv
         GPuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=wpJei33p36j3KjjMHxyiKmG4dj3y1cwd0hIxQebiEdM=;
        b=IiliH7Hvn5J8Pn5oJ4u/HTmQO+4Gf7O+Y4AlQWRUyhCKdDPlmKsH0zakzy+7uNfAH4
         q2aHGheR2YiBvJq14zwaRgPIQtHPDcyDXAcm6HahBY7ih6F8dGTHv9QD6y2NBBzDbkOg
         hZ7oBsqwW+aGY4MafSOF7Y6wDPOzrtnlLgnkckxxaEk/bjz8KolJqecYH5GX/yxbEZvL
         VarCZpZ+DrMSL6OzJDqJnZX+Lio1Xq9BbzUoKqP0FiWCSRdfJA8ghSN1hs1ntwtm+pOL
         x8G6iejKrQqLtDCR+jBb0+qVll/7UJHFYknVXWH3cQtDe6o5xiM1OhAVPlB3xzFOZ7Ri
         bdhA==
X-Gm-Message-State: AOAM533/83QaDbS8n/VVvGppx7EINs9MK2LPmWeCCyJJzydlFtIrYCTh
        zp/Ad/oZhT9E2zaBbHz0FvAK3T3CRaKzdU845p8=
X-Google-Smtp-Source: ABdhPJy+nIguXtNRexvJIjrSyuROKE2OJGFq0G34E3vTRN1y9bOJbuovRIfl9/FQBpeHGk7p24GDKVlYncDOiGe0FU8=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:3560:8505:40a2:e021])
 (user=samitolvanen job=sendgmr) by 2002:a25:cf16:: with SMTP id
 f22mr13542667ybg.342.1617906560306; Thu, 08 Apr 2021 11:29:20 -0700 (PDT)
Date:   Thu,  8 Apr 2021 11:28:43 -0700
In-Reply-To: <20210408182843.1754385-1-samitolvanen@google.com>
Message-Id: <20210408182843.1754385-19-samitolvanen@google.com>
Mime-Version: 1.0
References: <20210408182843.1754385-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
Subject: [PATCH v6 18/18] arm64: allow CONFIG_CFI_CLANG to be selected
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>, Jessica Yu <jeyu@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Tejun Heo <tj@kernel.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>, bpf@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Select ARCH_SUPPORTS_CFI_CLANG to allow CFI to be enabled.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/arm64/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index e4e1b6550115..d7395772b6b8 100644
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
2.31.1.295.g9ea45b61b8-goog

