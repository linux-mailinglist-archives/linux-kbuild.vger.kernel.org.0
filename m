Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B465A25CB14
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Sep 2020 22:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729401AbgICUiD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Sep 2020 16:38:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729528AbgICUcE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Sep 2020 16:32:04 -0400
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBD94C06121B
        for <linux-kbuild@vger.kernel.org>; Thu,  3 Sep 2020 13:31:21 -0700 (PDT)
Received: by mail-pg1-x549.google.com with SMTP id f25so2504315pgf.3
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Sep 2020 13:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=qzws6VAVgyA/bHAW4bIM+1/PEs3H7Fw9+snejeFUOZY=;
        b=l6ts1jl/oDYFx7Z7jTK+VUTx0ZJGZaKE7o8HVIoUFkyZL7TYmW72ZGA7JS0ScvJizX
         2poM8TiIv9s0G3GDDBkFSsOxxTFAz6nJQhHgZnWqHMwaLKsznl1U2r36PUHgj2H3zPmg
         DgO56hNvYB3OLRcQmpltscndu/jlfmURxCRLgKzYO74k03/0B+10iZNRKEeBRDlZ2lrE
         xz1VEp951D9IVC8lto/GdOWPwQv+ampbYQO1w7i1HLHHl5BYVymhZNELnf6ufJ+Gdu/z
         xLiMS61an4HtU3uQF4yYsvl4kUO6nw457tEuJotYfUQL12wOUQw8kppyMo2n/oyzXl/r
         LnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=qzws6VAVgyA/bHAW4bIM+1/PEs3H7Fw9+snejeFUOZY=;
        b=ITgJ+rtEVyZNN82RX/mKMigv9cK0WbOCut3cHVgnQGT76AUUlwLFmtRdWqzRTMrpaa
         VHlZtVRvs5heN2UPV6gMX3qqqomJmcr++mOplphUHV7k0YwQ9UVfoVz/qGz557ie4vbj
         a7r/yJqXusIGyTMy3pn8muKl3tLkkrbIUNJCvXkq1ARJKciojZ5Bsds1woDsiFAY3/r0
         jskKdERaQNiKXGcaM3VW7YscuDxO1DAmpLK/KZCh4IpA4ZWn0UvFofrgKf+B5XtGdXWt
         qys9wUHSJ6M9ix03kHsBB8kJCK9n1EHrgAK7jifGUbFfYlQuQv+toqBgR90wkvFPRe6/
         R9bA==
X-Gm-Message-State: AOAM5302/wQ4oiomWTF1E1DSAq8zAmUfh2DMjn8qz+e58pozZWdM4639
        Gk1atEURrIZM3Thix+YlSdcNMRkxyh4bQd4eVlk=
X-Google-Smtp-Source: ABdhPJyqBKHj8evcoo3MhmAmuS+y/1ePCLsQz2DyXY+1GspPP4nM4pP9zEhExeD4dZEE75tM/6sOY94GicyknkeuYRM=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 (user=samitolvanen job=sendgmr) by 2002:a17:90a:3948:: with SMTP id
 n8mr5186825pjf.156.1599165081221; Thu, 03 Sep 2020 13:31:21 -0700 (PDT)
Date:   Thu,  3 Sep 2020 13:30:38 -0700
In-Reply-To: <20200903203053.3411268-1-samitolvanen@google.com>
Message-Id: <20200903203053.3411268-14-samitolvanen@google.com>
Mime-Version: 1.0
References: <20200624203200.78870-1-samitolvanen@google.com> <20200903203053.3411268-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
Subject: [PATCH v2 13/28] kbuild: lto: merge module sections
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        kernel-hardening@lists.openwall.com, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        x86@kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

LLD always splits sections with LTO, which increases module sizes. This
change adds a linker script that merges the split sections in the final
module.

Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 Makefile               |  2 ++
 scripts/module-lto.lds | 26 ++++++++++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 scripts/module-lto.lds

diff --git a/Makefile b/Makefile
index c69e07bd506a..bb82a4323f1d 100644
--- a/Makefile
+++ b/Makefile
@@ -921,6 +921,8 @@ CC_FLAGS_LTO_CLANG += -fvisibility=default
 # Limit inlining across translation units to reduce binary size
 LD_FLAGS_LTO_CLANG := -mllvm -import-instr-limit=5
 KBUILD_LDFLAGS += $(LD_FLAGS_LTO_CLANG)
+
+KBUILD_LDS_MODULE += $(srctree)/scripts/module-lto.lds
 endif
 
 ifdef CONFIG_LTO
diff --git a/scripts/module-lto.lds b/scripts/module-lto.lds
new file mode 100644
index 000000000000..cbb11dc3639a
--- /dev/null
+++ b/scripts/module-lto.lds
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * With CONFIG_LTO_CLANG, LLD always enables -fdata-sections and
+ * -ffunction-sections, which increases the size of the final module.
+ * Merge the split sections in the final binary.
+ */
+SECTIONS {
+	__patchable_function_entries : { *(__patchable_function_entries) }
+
+	.bss : {
+		*(.bss .bss.[0-9a-zA-Z_]*)
+		*(.bss..L*)
+	}
+
+	.data : {
+		*(.data .data.[0-9a-zA-Z_]*)
+		*(.data..L*)
+	}
+
+	.rodata : {
+		*(.rodata .rodata.[0-9a-zA-Z_]*)
+		*(.rodata..L*)
+	}
+
+	.text : { *(.text .text.[0-9a-zA-Z_]*) }
+}
-- 
2.28.0.402.g5ffc5be6b7-goog

