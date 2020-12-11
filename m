Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1456E2D7EA6
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Dec 2020 19:52:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406403AbgLKSt0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 11 Dec 2020 13:49:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406376AbgLKSsz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Dec 2020 13:48:55 -0500
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2126CC061D76
        for <linux-kbuild@vger.kernel.org>; Fri, 11 Dec 2020 10:47:06 -0800 (PST)
Received: by mail-pg1-x549.google.com with SMTP id u26so7074099pgl.15
        for <linux-kbuild@vger.kernel.org>; Fri, 11 Dec 2020 10:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=eJOu5ULB+j5PKw+BEEvH8i1sRvfR46/XAOq+5l8TcdE=;
        b=RNsVNk9rfWJRgJhnPu8tKl4xZ3XK+P117n64+jfeRxuRU7OckTxdduQUn0rQFZZJVK
         JY0s2ThPlJXNfuesUNy4qQ3uQ6VkP5ASRwViSOZDH9PEzNkXgsJJYnuOturiekfHhAnE
         BMGxOAye9LF6GlUS/cQHLsIHYbhoAlQO47vuBYWgWIh4Ce3sUs1MvtAQWZ5auUzCvg2J
         8UB/8N8jmyDbgRaTOfT2H7pMLqPElQFcrUWQGbre4Su0z5/Uw+grYzDeUrDo5GvOUsKk
         hhusYQkb2Divz4sMPZM0KcULhtVtRw12Nf2ssUpus5luGnVDa71D2rpr2EygAIXCM6As
         niAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=eJOu5ULB+j5PKw+BEEvH8i1sRvfR46/XAOq+5l8TcdE=;
        b=KPbPcOG9QBalBet/iUVfuDD9OLReopjjfQ1OvvsSRRULRRtlmfebbepV+AkelKNfsJ
         9trofUKstzwfXTfNRG1dR7VkVFHGcXizo6ptA6d0vCCkwdnTdIY8aLbCue9SeOeOdZr/
         t0+xydJy8lwbk2xgCZCmdrat6QoLyaGdmzlAcCk9PUZfRLWJCOnn4gyNxqMdUIM0EixU
         b9I4cggRemqjWZQwL1o6UJ+NoZK0gZcsCG/p7YWDoiLRvcPiHXu7ivyZLfCClXW0+pvF
         99a7+lhaDgPfATcbboMmoYqQoQBJrzgDZZr1ataiJM70WdlZeKI8EDOvFhIYxnTcVmG+
         +Zcg==
X-Gm-Message-State: AOAM533pQWvzZ16T6SIWAdfIUf90tBgGQbJVE3OepTBwH0FdzBG8MXSK
        HQts9m7+afpTrPfb4RnLo19KVG7B5SkgHiQLW6s=
X-Google-Smtp-Source: ABdhPJz0jKgJuUJrOj0cvusE84eexhNfATvSYqDzbLZYuW/7NEpt0846SG0sYBvcmPaDK3dyaOg+yr9NP20UvvW2JLE=
Sender: "samitolvanen via sendgmr" 
        <samitolvanen@samitolvanen1.mtv.corp.google.com>
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 (user=samitolvanen job=sendgmr) by 2002:a17:902:5997:b029:da:a1cd:3cc2 with
 SMTP id p23-20020a1709025997b02900daa1cd3cc2mr12248005pli.80.1607712425571;
 Fri, 11 Dec 2020 10:47:05 -0800 (PST)
Date:   Fri, 11 Dec 2020 10:46:32 -0800
In-Reply-To: <20201211184633.3213045-1-samitolvanen@google.com>
Message-Id: <20201211184633.3213045-16-samitolvanen@google.com>
Mime-Version: 1.0
References: <20201211184633.3213045-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
Subject: [PATCH v9 15/16] arm64: disable recordmcount with DYNAMIC_FTRACE_WITH_REGS
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

DYNAMIC_FTRACE_WITH_REGS uses -fpatchable-function-entry, which makes
running recordmcount unnecessary as there are no mcount calls in object
files, and __mcount_loc doesn't need to be generated.

While there's normally no harm in running recordmcount even when it's
not strictly needed, this won't work with LTO as we have LLVM bitcode
instead of ELF objects.

This change selects FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY, which
disables recordmcount when patchable function entries are used instead.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Acked-by: Will Deacon <will@kernel.org>
---
 arch/arm64/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a6b5b7ef40ae..cf7eaaa0fb2f 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -159,6 +159,8 @@ config ARM64
 	select HAVE_DYNAMIC_FTRACE
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS \
 		if $(cc-option,-fpatchable-function-entry=2)
+	select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY \
+		if DYNAMIC_FTRACE_WITH_REGS
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS
 	select HAVE_FAST_GUP
 	select HAVE_FTRACE_MCOUNT_RECORD
-- 
2.29.2.576.ga3fc446d84-goog

