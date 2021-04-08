Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EDD9358C9E
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Apr 2021 20:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233043AbhDHSbF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Apr 2021 14:31:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232944AbhDHSak (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Apr 2021 14:30:40 -0400
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C7CAC0613E3
        for <linux-kbuild@vger.kernel.org>; Thu,  8 Apr 2021 11:29:19 -0700 (PDT)
Received: by mail-qk1-x749.google.com with SMTP id p133so1825065qka.17
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Apr 2021 11:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=/RFtNNq4R+HQlfABCrnOp0vGXtCZ+PdK4tYVAs3Xgq4=;
        b=mRyvx1ZyCWRRYs/gtfFKoK8RBt3UI3Cbe8UFU+DjhbwvArNTuLgIFS5sSHA8GrypJO
         h1Ut4lnsHPkWI+6YGudQiUwKpMvE3rw3IvXbMyabZSfdvOVUtUOuttrRv/lU1I0YKtr+
         2KHbgG7VEZaD7k90Q2eC5FYoEypvPzIMBzhRBoMcW7o/u3O1niG3LYNNqbDjD1qMFVl5
         E0r5iFj/NMKIiwFuIz+tbBcn4ksbC5mZayHEJv3FtIIufUIqISS2/csUEuPKce6VPJ6v
         9VVELn3ltJVZx2tcvPVhDFYkynJ6q1lEl6xzivgPR/q2vDBkBfPrFKC+an1ZU7XkvHYL
         wK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=/RFtNNq4R+HQlfABCrnOp0vGXtCZ+PdK4tYVAs3Xgq4=;
        b=pqIm5XQtBd9pttnsk9qprh9CFUVm197+M/8aJOGOwMfi9h260sRZwC9/77VCvWU7L9
         yWt3cBZaQicG8F4tqJhVL7WnkHbdZTzB4M4RHvXH1jalJ7hGsQ25yYbrl3VkveFrtLZI
         WnFjHpSM4/4xsMs2ke3qiizFuqKHRrj5aYWrixUXNVlPSrUonh01jXfdwtJut5B4fFzY
         FZ7hjUPsEz4nUZsB+DUOv9ePYI1KjqXaclgi5MjRbVND5yI+oyWmKehXabfH1vQBgb/F
         fPIk9U09crUIJ1f3KPqZgOKTTYklHb1B7DkVLG6PAtcSf7hSd8L6Rtk70SSYaUUs37hJ
         uObQ==
X-Gm-Message-State: AOAM5308SICpwnd6wsm0d6B3Dk8dIJaLda/Svv6ba9amjC84Ev7Lf/ra
        4RsVuuVTHWdjAa9hP3gBGgQBUT5eZWzdyfztNKs=
X-Google-Smtp-Source: ABdhPJx0EQDE5MZTKE/yaW2uV6UWZxJCkACiU6S0cyy4tgm6Rm995yl/yaBcL1JmqZoeGYIAcOfNaP46VqXvbu6lWB8=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:3560:8505:40a2:e021])
 (user=samitolvanen job=sendgmr) by 2002:a0c:b410:: with SMTP id
 u16mr10174868qve.8.1617906558331; Thu, 08 Apr 2021 11:29:18 -0700 (PDT)
Date:   Thu,  8 Apr 2021 11:28:42 -0700
In-Reply-To: <20210408182843.1754385-1-samitolvanen@google.com>
Message-Id: <20210408182843.1754385-18-samitolvanen@google.com>
Mime-Version: 1.0
References: <20210408182843.1754385-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
Subject: [PATCH v6 17/18] KVM: arm64: Disable CFI for nVHE
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

Disable CFI for the nVHE code to avoid address space confusion.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index a6707df4f6c0..fb24a0f022ad 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -75,9 +75,9 @@ quiet_cmd_hyprel = HYPREL  $@
 quiet_cmd_hypcopy = HYPCOPY $@
       cmd_hypcopy = $(OBJCOPY) --prefix-symbols=__kvm_nvhe_ $< $@
 
-# Remove ftrace and Shadow Call Stack CFLAGS.
-# This is equivalent to the 'notrace' and '__noscs' annotations.
-KBUILD_CFLAGS := $(filter-out $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS), $(KBUILD_CFLAGS))
+# Remove ftrace, Shadow Call Stack, and CFI CFLAGS.
+# This is equivalent to the 'notrace', '__noscs', and '__nocfi' annotations.
+KBUILD_CFLAGS := $(filter-out $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS) $(CC_FLAGS_CFI), $(KBUILD_CFLAGS))
 
 # KVM nVHE code is run at a different exception code with a different map, so
 # compiler instrumentation that inserts callbacks or checks into the code may
-- 
2.31.1.295.g9ea45b61b8-goog

