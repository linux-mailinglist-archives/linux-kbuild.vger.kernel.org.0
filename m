Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 956FD2D7E8B
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Dec 2020 19:52:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395088AbgLKSsm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 11 Dec 2020 13:48:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406138AbgLKSsg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Dec 2020 13:48:36 -0500
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2C8AC061A00
        for <linux-kbuild@vger.kernel.org>; Fri, 11 Dec 2020 10:46:57 -0800 (PST)
Received: by mail-pg1-x54a.google.com with SMTP id l2so1341252pgi.5
        for <linux-kbuild@vger.kernel.org>; Fri, 11 Dec 2020 10:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=sUICI29mkgxH8XDf6qhMCrhn46+Hzc1owynREvsajYA=;
        b=Mt5+qfjfZ+VylSyluHh2VZfop+oBL3rJXxZDwRaX22l0TfpVmfjZWdRRf4EjcTdwNZ
         tI2smkjeD1V9WDfLcVGcM0q3lBKc5wUlQ0PV2xNazny/qeDxBgjfBw3M6ZeazZiiVTRk
         PuilV1bsANPSfYl5rf4CFzgLv9TH7xZEN6ZdlxzmXfi8iZ0NN8yPkHKEhjrDZeO93M3Z
         Is2ezXs/oAG91woA/WjRTGjceaiPw8zQ6gbt9xphaeSWeIK5J0CKds3mJv3qxGB+SGOL
         yPRehVrtvjhUpPjpNJk+E+PHpWf8LAXA2fOr5tqj7a6NYji5/SC+3IO85wAjvRUlfz9n
         9oSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=sUICI29mkgxH8XDf6qhMCrhn46+Hzc1owynREvsajYA=;
        b=q8X1a/XLkq6xYvh8kTge8pAd4nto42PG4dwi4C0UMvLDJ0ZHN6v5Z1m0wSdESdq1KY
         GSamBl/p6mP56AUv3D+xZXnWANeclQH/OXyexzgHg158Tp66xggROVuL4r37C0XvU1dX
         jGMRuBftgtu3JNSeGJyxlNqSX0wV4PWK4Zoqi/MMchP+pC1COZtX41Uu58R4mpLcknIg
         hkKQhTgjVoj0UWPhssI6R+AOWyL+mOwamNxnL6rmxxaO9/EIqQfefcfglLmGKDbVSZEW
         gSw+re5Ur+RtBAaYZ2EBnmlsgKi/wVnLMaHiGYAIeYYZA7NXr+WIkhizZP1nt+ykbqKQ
         bSOA==
X-Gm-Message-State: AOAM533iw/9kJD3+w9VKnxhpN5SzSt7PxYM873DU2XLqPUdEcUpZalMj
        EU+56KvOpZcK67ZlgeBVHGG52RsGFVvTIM2wbuM=
X-Google-Smtp-Source: ABdhPJyLTnaXTvQFzdGZbemjJUsFLRdMqMxsuXqAqm5rCyQnrHrKDgTVs/Qim5syv8mGMDSyRXsRkeSRJzrM/1+uvUc=
Sender: "samitolvanen via sendgmr" 
        <samitolvanen@samitolvanen1.mtv.corp.google.com>
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 (user=samitolvanen job=sendgmr) by 2002:a17:902:8343:b029:da:cf6a:f65c with
 SMTP id z3-20020a1709028343b02900dacf6af65cmr12048006pln.5.1607712417071;
 Fri, 11 Dec 2020 10:46:57 -0800 (PST)
Date:   Fri, 11 Dec 2020 10:46:28 -0800
In-Reply-To: <20201211184633.3213045-1-samitolvanen@google.com>
Message-Id: <20201211184633.3213045-12-samitolvanen@google.com>
Mime-Version: 1.0
References: <20201211184633.3213045-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
Subject: [PATCH v9 11/16] scripts/mod: disable LTO for empty.c
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

With CONFIG_LTO_CLANG, clang generates LLVM IR instead of ELF object
files. As empty.o is used for probing target properties, disable LTO
for it to produce an object file instead.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 scripts/mod/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/mod/Makefile b/scripts/mod/Makefile
index 78071681d924..c9e38ad937fd 100644
--- a/scripts/mod/Makefile
+++ b/scripts/mod/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 OBJECT_FILES_NON_STANDARD := y
+CFLAGS_REMOVE_empty.o += $(CC_FLAGS_LTO)
 
 hostprogs-always-y	+= modpost mk_elfconfig
 always-y		+= empty.o
-- 
2.29.2.576.ga3fc446d84-goog

