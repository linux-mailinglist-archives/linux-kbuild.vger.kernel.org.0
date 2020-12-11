Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46E7B2D7EA2
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Dec 2020 19:52:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394097AbgLKStU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 11 Dec 2020 13:49:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406353AbgLKSss (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Dec 2020 13:48:48 -0500
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CEFBC061A49
        for <linux-kbuild@vger.kernel.org>; Fri, 11 Dec 2020 10:47:00 -0800 (PST)
Received: by mail-qk1-x74a.google.com with SMTP id p13so1040288qki.14
        for <linux-kbuild@vger.kernel.org>; Fri, 11 Dec 2020 10:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=2x/zjVn7tqzzMwlgW94lOF/53GHge2qEfxVssZKSVKU=;
        b=sVh7pgdYPbhuziZ7RbVkNdr73qN77YcUUWXTQ1tAb3P7jqHRr2p1f5bPxlsX3TaJ0x
         NLRx4jH9CypSCESRGLRonyZ8+kkS3XNyERw+CW+BqWmKtawr0ILqseYbrw/qx5wrEH2B
         VqZ0x9qFDwfElGwb1vEdm1fnMLextKeSpBRqwLQXUche0e5kuofl1+h4UoBzhPS5Diu4
         EguLuAaf07YUp6KSWi5vK+lTKN+85JJaMCLDLqfd6UvMg+GduXve9RFsPVLp74nssXU5
         7G5z+jbgJYyIgkNTgNx96jpD1psInPt090dZnr/BEIQ4zT7bqAbfJUIq9iNE+/XzJIVu
         6Ing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=2x/zjVn7tqzzMwlgW94lOF/53GHge2qEfxVssZKSVKU=;
        b=LfnNgxgUkpE5RSm4kmWAXKME9Hvfca+aWCE0TU2ACyQ4PfNn0bIUNzbl+pFL/WKSWQ
         kt4mYleuDjbUM1ZpxriCoHB9lDdQNxTrhy2Slh+otSp4EE9NeMVPqHp6EnzjdQ9ZJQPg
         j8prqDT2HtwNWkfuMk55Bz3wmFBHSh4OYKAsddGJ4bxc3NQbPKnlQ4J5CFbeKpLN0mr5
         sm4QGxxUbDdgAMIXXIcL6140SPm7p9x+OQt8PwVPkoEq7qbxfo8gGTdBpeZo42yinQ46
         LTSk0U/8mswc17ZIMHNqpJS4qLltOsLJw0QHHGR6k7bT5VZYCS5QUio5g9gnUJpqGka6
         qZeA==
X-Gm-Message-State: AOAM533bzsH8Xdm0Zx3JbGmRe5E5qxPpyhSpTHsjtoZvfs7h9e6bL0VD
        bS+6JTeDVB61rlsrLDKmKozKAEnjrgTtu08HbiQ=
X-Google-Smtp-Source: ABdhPJy6JuT0I8NnXRzTs2o4vn7H7iL4bg1V2c7l8tXurWBfldv/1YSed2IdWjWnqXB3B13fccdvqEaMosao7evXpYA=
Sender: "samitolvanen via sendgmr" 
        <samitolvanen@samitolvanen1.mtv.corp.google.com>
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 (user=samitolvanen job=sendgmr) by 2002:a05:6214:a94:: with SMTP id
 ev20mr17352143qvb.56.1607712419531; Fri, 11 Dec 2020 10:46:59 -0800 (PST)
Date:   Fri, 11 Dec 2020 10:46:29 -0800
In-Reply-To: <20201211184633.3213045-1-samitolvanen@google.com>
Message-Id: <20201211184633.3213045-13-samitolvanen@google.com>
Mime-Version: 1.0
References: <20201211184633.3213045-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
Subject: [PATCH v9 12/16] efi/libstub: disable LTO
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Will Deacon <will@kernel.org>
Cc:     Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        kernel-hardening@lists.openwall.com, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

With CONFIG_LTO_CLANG, we produce LLVM bitcode instead of ELF object
files. Since LTO is not really needed here and the Makefile assumes we
produce an object file, disable LTO for libstub.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 drivers/firmware/efi/libstub/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index 8a94388e38b3..c23466e05e60 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -38,6 +38,8 @@ KBUILD_CFLAGS			:= $(cflags-y) -Os -DDISABLE_BRANCH_PROFILING \
 
 # remove SCS flags from all objects in this directory
 KBUILD_CFLAGS := $(filter-out $(CC_FLAGS_SCS), $(KBUILD_CFLAGS))
+# disable LTO
+KBUILD_CFLAGS := $(filter-out $(CC_FLAGS_LTO), $(KBUILD_CFLAGS))
 
 GCOV_PROFILE			:= n
 # Sanitizer runtimes are unavailable and cannot be linked here.
-- 
2.29.2.576.ga3fc446d84-goog

