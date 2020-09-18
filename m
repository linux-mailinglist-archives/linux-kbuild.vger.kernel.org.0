Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9BDA270685
	for <lists+linux-kbuild@lfdr.de>; Fri, 18 Sep 2020 22:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgIRUQM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 18 Sep 2020 16:16:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbgIRUPc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Sep 2020 16:15:32 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 901F1C0613D1
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Sep 2020 13:15:32 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id c5so6083627qtd.12
        for <linux-kbuild@vger.kernel.org>; Fri, 18 Sep 2020 13:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=X2rJBbb/dAb+yfnrEjkjEFh1Qlc3T9c6r5OVY+2F28Q=;
        b=UfHLbm8nbc7nF4Jo2yUgHO34FEnYwaE+D6WpRyYM9fua/f1c+fZ8kF6HsVdGT3ZStz
         DIioQeeYjH1vQBjYBq6RWn1tj8Ze0d8QdJv/5ZoCfD/OJopHg281EA0NzxBu0bnxaWZh
         gx+JUnvc4+vXR4wjKioKlFelZxpe0ui4Lh1MT956XxN4Ky84dI7eVbp7usD/4ORebyXi
         CldVhYDtXNAYA4NGIwtBdJpXhE9cy2RjWHBM1Uc8TjKab8xO1nXAuOuk6CkQAwAWw4AW
         +5M/W/XGQlX5ApQtgCjOdjNKX53WnhGd309U+vDRlJPdbYtPQkUcz7FocAivoRqNyi4G
         Nh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=X2rJBbb/dAb+yfnrEjkjEFh1Qlc3T9c6r5OVY+2F28Q=;
        b=IcUbmDBRmVAVvv/V3KD4h3pHXbaF9Dw+aONLAo1wOoxYnXbPHn/aifLJf49ZKruG5j
         pfjEURzdHKbN63P7v0xYDFkOGr39hn7VbYecpJB9AESHOhYCrwLqn7yuw/zspSyDvALC
         Wu+vzvU0pvPoSTxeetchatXd+nJSQeLwxUO6dENCdgZHhgaYq+Nd28QIGKUZH6Rgthsd
         XQmJfgmUTw9gitF2xoaqBwgKLSeepAEOTjqYKv73rmwHzyNK0kq6GTAzfEKQlsF0jg5m
         ztSAHT+hGcv+RDzGwiGJLgg+v4yzjrAB5rCeQeSqzCrb2eUIqoEJaUGgArHanULSwNDV
         6BGQ==
X-Gm-Message-State: AOAM532SZwVuF42Sf9AfGQWCxAG3p2hfsglEPCRgTJ7pTGRV1DcUcDLC
        Se2xWxqS6V6T3NljCvaHzQzCEdBiFWXqrRWvC/0=
X-Google-Smtp-Source: ABdhPJzo4LTM6y/+DCzOvBKNO4aVvzGwT/r1d/eIrsPqlXmeiMn37vjIcaP3n6Xyzc5vYh3xJFK8sACdwTT13Li7Iew=
Sender: "samitolvanen via sendgmr" 
        <samitolvanen@samitolvanen1.mtv.corp.google.com>
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 (user=samitolvanen job=sendgmr) by 2002:ad4:5a0e:: with SMTP id
 ei14mr20725499qvb.15.1600460131755; Fri, 18 Sep 2020 13:15:31 -0700 (PDT)
Date:   Fri, 18 Sep 2020 13:14:28 -0700
In-Reply-To: <20200918201436.2932360-1-samitolvanen@google.com>
Message-Id: <20200918201436.2932360-23-samitolvanen@google.com>
Mime-Version: 1.0
References: <20200918201436.2932360-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
Subject: [PATCH v3 22/30] efi/libstub: disable LTO
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
index 296b18fbd7a2..0ea5aa52c7fa 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -35,6 +35,8 @@ KBUILD_CFLAGS			:= $(cflags-y) -Os -DDISABLE_BRANCH_PROFILING \
 
 # remove SCS flags from all objects in this directory
 KBUILD_CFLAGS := $(filter-out $(CC_FLAGS_SCS), $(KBUILD_CFLAGS))
+# disable LTO
+KBUILD_CFLAGS := $(filter-out $(CC_FLAGS_LTO), $(KBUILD_CFLAGS))
 
 GCOV_PROFILE			:= n
 # Sanitizer runtimes are unavailable and cannot be linked here.
-- 
2.28.0.681.g6f77f65b4e-goog

