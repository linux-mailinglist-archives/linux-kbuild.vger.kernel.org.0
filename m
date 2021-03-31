Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33802350960
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Mar 2021 23:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232903AbhCaV2X (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 31 Mar 2021 17:28:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232917AbhCaV16 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Mar 2021 17:27:58 -0400
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05D27C061574
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Mar 2021 14:27:57 -0700 (PDT)
Received: by mail-qk1-x749.google.com with SMTP id k68so2377449qke.2
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Mar 2021 14:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=tNWRsiiEAfetheYG6qtDYdd6Zu2YM8DJGmENfE26Aac=;
        b=ubXheP2brktumzheoRlwOGBaDAhJZCw5NjiWWseiWXm7uPGHPIEhQNkw1vclDXilyC
         T58HwhxWmupp1FHmmbm/one9xjzW1zyEIjkTSSxxlsem3MjSEZyOYyr2rhKeCFRUkd1c
         yGspf/krXoZV1aO23JrXpEBnl0Y82WLgsZPob752XnnEkvdLJpCAqDdeG+QPej4XPSZi
         CCDXPydG6+7wL9MGmLynGahaXHCtSa4TMIRQo0YgQK5KW48jFUEOkg9RmceaiJf2wbgY
         lIMNbUBaPlDMhK4s8fFJq1GcJptaYswx+mQ1VL7I/WglifRbnqfcOPmIuT0hvWr13KAr
         jjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=tNWRsiiEAfetheYG6qtDYdd6Zu2YM8DJGmENfE26Aac=;
        b=qFZy7g7b12vq+7lCCzFlxk0f0MfGXgE0CRaKfuSEsoSttpl+jMyZ75fUNK7PPwI2YX
         UCatDBf0Dn2if7jxCKlkg9AHkM6R6egA2ccGLFEf6BkkTh0ea7L3Hp11k9FtDQkcj4Sr
         CycyhJBpE/aZO3zvT8nWqH8bpUWZpONiillHQvYbg4b78qMrKSB7l+gXeDyksZS/LfPB
         AXeaFWghL7g5/h+v2ZZDPdGm1nIwewtVOjehDqIcEh35EkC5de+ietraFRkIsfWpE+k2
         e6vWvoJGukxIHiUsaBkS9nWzkcbLvWxni75K8lK9RcYkeZxyrqMlM1mlTG8U/tFQ1wVE
         Dv0A==
X-Gm-Message-State: AOAM533hpvq301c2PFr3RhooYzNC6Lu9Cv28BcGbyLDSr9xFUEMmmvWf
        wmIlqg1Oh9vhkSTfqLa/cTGpVt8mQuVaAJd5FGE=
X-Google-Smtp-Source: ABdhPJzZWP60rNMcikFQnnnMLQ3nIFchg+3t6XyAeYS/TMwgF+id2xc8kKag8yrH4KJDKMnacT9UMf7IYNlFmwHArxk=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:7933:7015:a5d5:3835])
 (user=samitolvanen job=sendgmr) by 2002:a0c:f349:: with SMTP id
 e9mr4952920qvm.59.1617226076143; Wed, 31 Mar 2021 14:27:56 -0700 (PDT)
Date:   Wed, 31 Mar 2021 14:27:20 -0700
In-Reply-To: <20210331212722.2746212-1-samitolvanen@google.com>
Message-Id: <20210331212722.2746212-17-samitolvanen@google.com>
Mime-Version: 1.0
References: <20210331212722.2746212-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
Subject: [PATCH v4 16/17] KVM: arm64: Disable CFI for nVHE
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
        Sedat Dilek <sedat.dilek@gmail.com>, bpf@vger.kernel.org,
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
2.31.0.291.g576ba9dcdaf-goog

