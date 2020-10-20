Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED5A2288E34
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Oct 2020 18:14:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389715AbgJIQOn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Oct 2020 12:14:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389717AbgJIQOI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Oct 2020 12:14:08 -0400
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BE63C0613D5
        for <linux-kbuild@vger.kernel.org>; Fri,  9 Oct 2020 09:14:08 -0700 (PDT)
Received: by mail-qk1-x749.google.com with SMTP id n125so7113673qke.19
        for <linux-kbuild@vger.kernel.org>; Fri, 09 Oct 2020 09:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=i0HfMD/wRChzzw+H0j5SIQI+XYlsyfomuEvjB0A2b7U=;
        b=sEoOB3beinnRwWhTbfM8SalF0cypydPh216467a4z4b5/i0LPdWiZ5comfR+CiYfuB
         Eu6WnuwqDQWg3zWFoeOdTsPbYHhw3tNqNZ8MjpSQcdjSRgi7EG1dWI1RykapF9xZWiY2
         le1HF/WqJI6Jl13HF5R6zyktQuEsBMAEVBeei7ZFW9w6SZcy2RVolvTp6Wll1P+Fel+u
         qLJQ4BMU4abl2vfwj62MA6cUp201pkizABLlY7j94v8InIgak3mqGIgyVYCkdDVXzKLs
         jgf681rPIiD2mLYPe4v1fiJI8parpj4mo1rgorOkKlmmsNOrBR5zrp7/pX8UClF3X8DT
         0uzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=i0HfMD/wRChzzw+H0j5SIQI+XYlsyfomuEvjB0A2b7U=;
        b=lxgAAZq1baa0SI5nc9SYfwB9wJTYvqB3nMimZPD0oEDNp6BJAz3GMC7GedOVVUzmAr
         7d5F5X0WePGHuOthwkbMF9Uned/+OdWWZDVJH1qW4eskJMDJp+BGVQVB7FOvzYrHjmFF
         fkm+EaLO+BdrJJpWhzCCzcH7iz8dO+KjoqYEiC/wSvKhdNl4u+IzwkTInO4wn86RtYG8
         fn2b3YGgZFzmm+Hqs2d8/rLnlPMIRLah6HT8EEtUQPm0tr3TD2KSuv/fGZQ2jMf2u2Cl
         K4OYAurHrOaMhZwKu9d/81aU9WiiISTGyCVAVQ4l4gXSyK+oquk94YdOZtLn1zsSchsz
         LK6Q==
X-Gm-Message-State: AOAM530NgY/Yv27Khjmrv+2d612TGohWlfL8Whp4e6SyhG42rdETMeHo
        vm2lghOjWFntIlFZCyF+wybx59XrYxwRDh7Y35w=
X-Google-Smtp-Source: ABdhPJy/D8/0u+nzbzzf55/nK574QK9COSo5VcbQLJEKAJhBGhwXDRm3vwXt4Hczxebu5BRqeLM/xZZizY5eXSIgq20=
Sender: "samitolvanen via sendgmr" 
        <samitolvanen@samitolvanen1.mtv.corp.google.com>
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 (user=samitolvanen job=sendgmr) by 2002:ad4:456c:: with SMTP id
 o12mr14223376qvu.48.1602260047185; Fri, 09 Oct 2020 09:14:07 -0700 (PDT)
Date:   Fri,  9 Oct 2020 09:13:22 -0700
In-Reply-To: <20201009161338.657380-1-samitolvanen@google.com>
Message-Id: <20201009161338.657380-14-samitolvanen@google.com>
Mime-Version: 1.0
References: <20201009161338.657380-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
Subject: [PATCH v5 13/29] kbuild: lto: merge module sections
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
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
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

LLD always splits sections with LTO, which increases module sizes. This
change adds linker script rules to merge the split sections in the final
module.

Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 scripts/module.lds.S | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/scripts/module.lds.S b/scripts/module.lds.S
index 69b9b71a6a47..037120173a22 100644
--- a/scripts/module.lds.S
+++ b/scripts/module.lds.S
@@ -25,5 +25,33 @@ SECTIONS {
 	__jump_table		0 : ALIGN(8) { KEEP(*(__jump_table)) }
 }
 
+#ifdef CONFIG_LTO_CLANG
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
+#endif
+
 /* bring in arch-specific sections */
 #include <asm/module.lds.h>
-- 
2.28.0.1011.ga647a8990f-goog

