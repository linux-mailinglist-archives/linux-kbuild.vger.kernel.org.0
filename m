Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9864627DAD2
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Sep 2020 23:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728814AbgI2Vrv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 29 Sep 2020 17:47:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729031AbgI2VrW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Sep 2020 17:47:22 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28ECAC061755
        for <linux-kbuild@vger.kernel.org>; Tue, 29 Sep 2020 14:47:22 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id p43so4048203qtb.23
        for <linux-kbuild@vger.kernel.org>; Tue, 29 Sep 2020 14:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=M/tCJ87SKQnbyhBQptnFDCNgoy9D1scy1+3ph9ahS3g=;
        b=gdAEDDvLlL0msAdcbIE0elhCADhQmKL9S16dzNU1NewfqdOooSY9iFqACy8+PZ7gHu
         RjJqXHtJjRJu9BoQC0Z+qcoslnaCbYOM5YVwAUiEbJv8oMPbNKei4NbKX8/eYf1TjsBX
         LuD//MCUmK3U7ZJ2uod6D1w8OHvoyhKJylEziLAmUyzobSpYb93PY4CL1x+jJuLiN+Df
         TJvELp9Gtnh21l2Y6CWFhRqKGqHS7xc78jprEFcrRoojdnbVtKont9eEkY55sgaj+pEf
         r+rlpDV8ZtQQ3iUVmb9timiu1KOz8XTe/0fr94WEPlFW4uof3ENuM7MDtO9p1BgJUAsl
         mKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=M/tCJ87SKQnbyhBQptnFDCNgoy9D1scy1+3ph9ahS3g=;
        b=gl2hhWhNGPKFonyF4zVelfThyWTTSth15R1oMMOmzAkMylQw4QcH0woj3L09BuZMRD
         Lx9/5qeG0bcfaPETJC/V+TJQwUyDRmblQL1GcYuebFpVzWHszYspKp5Dh1lKcl9M+HDD
         wUZzwN7zhjfi8Up3Eah4xSq2jDF8FaBt+isM84OY/oNT0VejLEr2ZyXgLfVFJcFPNxHl
         EoK9nKGcaQnC/h7PlUaqfsNAzkhmtu2WWhzIbj4p+VvhKpS/faOPhTQsapFroJh14pTF
         1HLPxdLBPHoAeYWsAYsCg6+avowtBR1ShDhtlt0YThRmcBzKFw++sB8BCQ68VDp7XdMn
         kWbw==
X-Gm-Message-State: AOAM532++aZjqvc+6xArPojD0zXalrAnDymRzzK4I2gSYCvWrPu0zYbE
        Jhjvmd9bTs9VFuTkAMdM4whXFnxOMvzZa1pjDMs=
X-Google-Smtp-Source: ABdhPJwIclf1YZILYpRHL9aLGjIyClVObMTVmWZ7pfwr9sU8b01qvKeenw3eQ8lUfzBJlACcTh5VbLCas1CqVTaKm1c=
Sender: "samitolvanen via sendgmr" 
        <samitolvanen@samitolvanen1.mtv.corp.google.com>
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 (user=samitolvanen job=sendgmr) by 2002:ad4:58c7:: with SMTP id
 dh7mr6716936qvb.20.1601416041280; Tue, 29 Sep 2020 14:47:21 -0700 (PDT)
Date:   Tue, 29 Sep 2020 14:46:23 -0700
In-Reply-To: <20200929214631.3516445-1-samitolvanen@google.com>
Message-Id: <20200929214631.3516445-22-samitolvanen@google.com>
Mime-Version: 1.0
References: <20200929214631.3516445-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.28.0.709.gb0816b6eb0-goog
Subject: [PATCH v4 21/29] scripts/mod: disable LTO for empty.c
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
2.28.0.709.gb0816b6eb0-goog

