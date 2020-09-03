Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14C0E25CB11
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Sep 2020 22:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729259AbgICUfx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Sep 2020 16:35:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729535AbgICUcJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Sep 2020 16:32:09 -0400
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46613C061231
        for <linux-kbuild@vger.kernel.org>; Thu,  3 Sep 2020 13:31:24 -0700 (PDT)
Received: by mail-qv1-xf4a.google.com with SMTP id l1so2535425qvr.0
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Sep 2020 13:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=cFYZU8yCmBPQlyxKhbN3fBJPGbsM547TbMqCUcHgNNs=;
        b=f2KZmcgYz5Ysbx7BF62rI5UJWOS12FN6N90Amy8wNR+g9fWhhBQkZa5CaKf0dS8brC
         6Ro6z+jEQSCS3MWX0kosxP4fsqH2/+671H0FR2hgia8WGh2l9J0fRbxn4fS9LBIOcqsn
         cfg+hzRqGFg//tgcGlbiaDXIBOoDoqEGBJdWHQyzr3ofan4aBNcv3L8cSwT1RQT4lXSp
         Mo1JKD3ynQ9gHpI/aTI54CwV746sFqsVOEhvOjmNc4OgLhewoJ13I5Y1xKy5epce9McN
         +zMfVllNIuAdNq+xsrw+qbjhr6JPUJISf6N/sMIEsTKdrYvLhzy1RmEG8RGpVVXx5zt0
         mdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=cFYZU8yCmBPQlyxKhbN3fBJPGbsM547TbMqCUcHgNNs=;
        b=ObI3304LFeuIx66AyhYlgu/5IQ3dh34Up+qkymN5iXUyZhzDgVGq6mvrnvlh8HQtyr
         SogQzAXLU7sP3iNm1z6Kd/DH8Tu6ADn/LdoQ/OH7EQ9ThERtyZ4Op6FA3zndRxDyP8FW
         DgqCxKpCYLP9uY9ho5xaSH4YqO0dKFPv3KdgIeYrrUfjq5YRrYoguEwIMA+0lruCYGcM
         UyWeHF45LaQ6GnjVAX8eeK4wyo3hFtYNiZr4mAkaxj6AVH3XRTtDfAR6CPj1cXfx1T4x
         dcFftoqdgvwjX/ceUkUTkcRjuALpymiCk3sRXEBshtPKw0/Pmr4i7Hz5lFTvz5Uxm724
         WZsg==
X-Gm-Message-State: AOAM530Mn3APqdxzZ+mq/qhKZCyVHpbNp6Cu1OBxhrT8UlthMbrAM5D8
        uy73PGDFjk9gHer2gku4id0F3taQAwYt7K6MjAY=
X-Google-Smtp-Source: ABdhPJyzhYZs0Vph1w8I/Ma5DB61AQsRFG4mGPB5xTJWndGiIvzc18vAFQNXB2O/jZWPV1Ikufh2xpTXWWNkBkMFMaI=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 (user=samitolvanen job=sendgmr) by 2002:a0c:ba8e:: with SMTP id
 x14mr4773039qvf.23.1599165083400; Thu, 03 Sep 2020 13:31:23 -0700 (PDT)
Date:   Thu,  3 Sep 2020 13:30:39 -0700
In-Reply-To: <20200903203053.3411268-1-samitolvanen@google.com>
Message-Id: <20200903203053.3411268-15-samitolvanen@google.com>
Mime-Version: 1.0
References: <20200624203200.78870-1-samitolvanen@google.com> <20200903203053.3411268-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
Subject: [PATCH v2 14/28] kbuild: lto: remove duplicate dependencies from .mod files
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

With LTO, llvm-nm prints out symbols for each archive member
separately, which results in a lot of duplicate dependencies in the
.mod file when CONFIG_TRIM_UNUSED_SYMS is enabled. When a module
consists of several compilation units, the output can exceed the
default xargs command size limit and split the dependency list to
multiple lines, which results in used symbols getting trimmed.

This change removes duplicate dependencies, which will reduce the
probability of this happening and makes .mod files smaller and
easier to read.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/Makefile.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index b8f1f0d65a73..3bb36b4b853c 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -286,7 +286,7 @@ endef
 
 # List module undefined symbols (or empty line if not enabled)
 ifdef CONFIG_TRIM_UNUSED_KSYMS
-cmd_undef_syms = $(NM) $< | sed -n 's/^  *U //p' | xargs echo
+cmd_undef_syms = $(NM) $< | sed -n 's/^  *U //p' | sort -u | xargs echo
 else
 cmd_undef_syms = echo
 endif
-- 
2.28.0.402.g5ffc5be6b7-goog

