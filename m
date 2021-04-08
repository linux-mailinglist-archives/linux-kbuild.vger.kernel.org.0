Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4076358C8D
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Apr 2021 20:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233081AbhDHSa4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Apr 2021 14:30:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232955AbhDHSaZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Apr 2021 14:30:25 -0400
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB30C0611A3
        for <linux-kbuild@vger.kernel.org>; Thu,  8 Apr 2021 11:29:17 -0700 (PDT)
Received: by mail-pl1-x64a.google.com with SMTP id z1so1301731plg.14
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Apr 2021 11:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=E//9MgjgyGyGzfpqyqWq2doSFEPDUmVLoRf38lFR7Ug=;
        b=RkrEMcjEGks9eZDKQu+2cXBVixhfRtfNzurKOb7kj5G0lHbsNG+kVYT00dZ5fCwZZm
         oGJ3H14LgsxmvSmAONHP3AD4DqcsZiijiViY54PVPWASyhlBWJKul0uk2D6FHPy5MGCI
         hRwVaWPtPODb24A1fAYvc3Pk8kJw73Wgq0qpJVjB3nsOpeMmHe8UyFYE027vmCmfDH59
         TeMeJF97gfJcV1bR86XXNmc9WzLb/xoI5eyDhzlmA3A8LFSbl+CVN1qG+Ng6f1ydMu6m
         HP+jBZVA3ShA+iChc9OSbbyum7a0Xu8+WCER3+MJXJ4MzHQMgKZMSbyX49ZilNruBraI
         +ZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=E//9MgjgyGyGzfpqyqWq2doSFEPDUmVLoRf38lFR7Ug=;
        b=f013xZ1ibuC5x5CmcoNE3s2n+vZ1IiYk8vQ5M7FEfI7hN5R1jMKH6lCDiQse5HMNRU
         H1nF8GYuw9PO2LwMmuzlyL5WgxpVFU79y7mbirKzwgEpudDXS2c06I/1t1WQmPsZCVYM
         O3mIymxXBmIob4fIWSUmFdF/W0HdKDjcEleXhrbsLcmEGyqpugsF/5uqL2Roh67Yu3co
         SgWWe+JEo6Z2BcgDwCfpSXPYFZALGpGnBtukZdIDizDfuH9K7MppJjGxpRkmk4uOiXST
         208wLzAqCz0ifAysEmlyOhtMiHPD9XVdvuy+FV03yOQ7k9It0hKaaao4vhiUdlDF13Ry
         8MPA==
X-Gm-Message-State: AOAM531s4FVIdMxAFbwVnK8g1laTILJ5b3LYLJZJiblzBeL9hKlWX7Ii
        CW3dDY+FWJOw1gXXTzDW6dpE2t/6/Oku+rM9eg4=
X-Google-Smtp-Source: ABdhPJxklicbJf72RxeJ+L/uYgGqphrH56F65dx6SJ8/fgnDi6ps2xo+6HGcUO7vtPk7NlHN1dleq0bA9WeA14sn2Uk=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:3560:8505:40a2:e021])
 (user=samitolvanen job=sendgmr) by 2002:a17:902:7896:b029:e8:fa73:ad22 with
 SMTP id q22-20020a1709027896b02900e8fa73ad22mr8974621pll.66.1617906556287;
 Thu, 08 Apr 2021 11:29:16 -0700 (PDT)
Date:   Thu,  8 Apr 2021 11:28:41 -0700
In-Reply-To: <20210408182843.1754385-1-samitolvanen@google.com>
Message-Id: <20210408182843.1754385-17-samitolvanen@google.com>
Mime-Version: 1.0
References: <20210408182843.1754385-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
Subject: [PATCH v6 16/18] arm64: ftrace: use function_nocfi for ftrace_call
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

With CONFIG_CFI_CLANG, the compiler replaces function pointers with
jump table addresses, which breaks dynamic ftrace as the address of
ftrace_call is replaced with the address of ftrace_call.cfi_jt. Use
function_nocfi() to get the address of the actual function instead.

Suggested-by: Ben Dai <ben.dai@unisoc.com>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Acked-by: Mark Rutland <mark.rutland@arm.com>
Tested-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/arm64/kernel/ftrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/ftrace.c b/arch/arm64/kernel/ftrace.c
index 86a5cf9bc19a..b5d3ddaf69d9 100644
--- a/arch/arm64/kernel/ftrace.c
+++ b/arch/arm64/kernel/ftrace.c
@@ -55,7 +55,7 @@ int ftrace_update_ftrace_func(ftrace_func_t func)
 	unsigned long pc;
 	u32 new;
 
-	pc = (unsigned long)&ftrace_call;
+	pc = (unsigned long)function_nocfi(ftrace_call);
 	new = aarch64_insn_gen_branch_imm(pc, (unsigned long)func,
 					  AARCH64_INSN_BRANCH_LINK);
 
-- 
2.31.1.295.g9ea45b61b8-goog

