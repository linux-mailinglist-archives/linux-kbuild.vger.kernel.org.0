Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4DEE340B5A
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Mar 2021 18:12:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232403AbhCRRMS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 18 Mar 2021 13:12:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232419AbhCRRLs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Mar 2021 13:11:48 -0400
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67C42C061761
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Mar 2021 10:11:48 -0700 (PDT)
Received: by mail-pf1-x44a.google.com with SMTP id z11so9827328pfe.12
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Mar 2021 10:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=qAbADIQAzXUoq/ElYpa9rjjQHxphEP8wPywcql//gEU=;
        b=jf1TyFgM0qbBrh8PG+9UgOrM2tO3xTLSkbdFlAjoOHwSeKc0SfFX4Q0fQJiehD98Nx
         V8eHEHeFH6F/2w32lpdS3m06xBAZ3vNDNaCX7x8qpFxSBm6uQOUYcLoYxxuENofMBupO
         B6duso7Pzno7l5uVBkFz0xUe8AtQKuhaTmELX5H6eGSYwEqGS1XqRT74+g1vLez+eXeQ
         7z+ITybX9ylbz6ZkOa1dh63eUDWtdli7pIImj6+FfB23BTBDzIAs1fv35o+sxuUwBS44
         oltowRxFMks3nSe/2PYy3IOmtCU5Xy90zkjD6XlVuVonF/+UFPw1quOUALWqQTVSZsf8
         4bfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=qAbADIQAzXUoq/ElYpa9rjjQHxphEP8wPywcql//gEU=;
        b=jMDg+sZJmr/yV/tDh99RdcGmBrGzmUP1MwjAPbYOjcMDrjO3+kOas9yAH/oAEy0Gek
         sl5yGOfLCQTMESKZbj0F7rXy0fghCiFEpXOKT3tRwViEHVBLYMhdCWnvry0toYdi5lRC
         wO1pxngTDwDmdnIRv7LZQ5I0chEZHbCfmIPLyVJ9XhJqQ/BeukfKXidTWuReY8bOvxvw
         AmlYlVnh3K2L86q0uROWWhSpq2aTcHwRtvm1qqZjsv0W37Cmpa8SV/Ed16AYpG/+0hA9
         lzoX92bTwDO7TX5Rqa1/4AXgZAjjf1tWnszUTG7ButK6zhjx7hefBpMWAcOhpbJVlFYM
         TeJQ==
X-Gm-Message-State: AOAM533ecjfaVybrsjftSCFOiwA4lJR5QZvMqa5QuwGShrM0URoEbrE0
        uAoej+6JpGjQnE3G4p7S6hByDVQyngeHVvN3yso=
X-Google-Smtp-Source: ABdhPJwHw3Ga/ReLCOxUOvdN7Ru83Wr8fqQUCOT6GinoqE3bL2zrZGNpaekhia574g649F2KSLcKcxlK/YtI6PlZyyY=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:c0d7:a7ba:fb41:a35a])
 (user=samitolvanen job=sendgmr) by 2002:aa7:9ae7:0:b029:20a:d94d:dd61 with
 SMTP id y7-20020aa79ae70000b029020ad94ddd61mr5297194pfp.0.1616087507868; Thu,
 18 Mar 2021 10:11:47 -0700 (PDT)
Date:   Thu, 18 Mar 2021 10:11:09 -0700
In-Reply-To: <20210318171111.706303-1-samitolvanen@google.com>
Message-Id: <20210318171111.706303-16-samitolvanen@google.com>
Mime-Version: 1.0
References: <20210318171111.706303-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
Subject: [PATCH v2 15/17] arm64: add __nocfi to __apply_alternatives
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>, Jessica Yu <jeyu@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Tejun Heo <tj@kernel.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Christoph Hellwig <hch@infradead.org>, bpf@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

__apply_alternatives makes indirect calls to functions whose address
is taken in assembly code using the alternative_cb macro. With
non-canonical CFI, the compiler won't replace these function
references with the jump table addresses, which trips CFI. Disable CFI
checking in the function to work around the issue.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 arch/arm64/kernel/alternative.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/alternative.c b/arch/arm64/kernel/alternative.c
index 1184c44ea2c7..abc84636af07 100644
--- a/arch/arm64/kernel/alternative.c
+++ b/arch/arm64/kernel/alternative.c
@@ -133,8 +133,8 @@ static void clean_dcache_range_nopatch(u64 start, u64 end)
 	} while (cur += d_size, cur < end);
 }
 
-static void __apply_alternatives(void *alt_region,  bool is_module,
-				 unsigned long *feature_mask)
+static void __nocfi __apply_alternatives(void *alt_region,  bool is_module,
+					 unsigned long *feature_mask)
 {
 	struct alt_instr *alt;
 	struct alt_region *region = alt_region;
-- 
2.31.0.291.g576ba9dcdaf-goog

