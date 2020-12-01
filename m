Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF9372CAEE0
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Dec 2020 22:41:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389934AbgLAVj2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Dec 2020 16:39:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389855AbgLAVj1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Dec 2020 16:39:27 -0500
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com [IPv6:2607:f8b0:4864:20::f4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32D38C09425C
        for <linux-kbuild@vger.kernel.org>; Tue,  1 Dec 2020 13:37:43 -0800 (PST)
Received: by mail-qv1-xf4a.google.com with SMTP id b15so2199127qvm.10
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Dec 2020 13:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=aPTc8wYkBIIZS9XLhaJqPHrVGew/rHRzWtLqs6SwnEk=;
        b=vXHUajvUgn40LQCYOvZPKvqCWjM82atINdDHUGd5EhIZaxvZWNECR6Puf1wV/Xm1fz
         RZFUluVJoen54/2OkeSIKDLooJAqo6nO6jmid/KnIY+pQsB0jUK1FLQCjzUfvDCGjqfW
         5DsweDMH7mPM+webX4KoPPbT06j0wd8ib/BAqCtFcLiXN9fRxFfzVzezsrV61oCpnhyb
         7uduG6UItD7EnvVpEffELx2wbLPqlD3Oqd6UlZIDNGhgDg+wEFbzFvokQCivtnRsGs7N
         92Et/EOjPux1Tii1bL3i8/gTtmbaMJpflMTGhVRAPssOG6ib3nwdVtng5zkY0hoNy4H7
         BGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=aPTc8wYkBIIZS9XLhaJqPHrVGew/rHRzWtLqs6SwnEk=;
        b=ctyDnAfTMQsE9Z/HZ6p+k7xq5QEl4IR9MCwsUHbChiU9cnm3qxxQem+JL6aQdNJpu+
         ZNIQyXDG7hEm9vr0ffhViGDGFduiAhlIgbTxKX4zdstXacG+2igRVDF99gJS9YsGaqk+
         Ni2KIdOX+mqb3lVDHMKiO1l3SD9qfz3ibMjazZZg8FlvvFconKOsDktqauyo93djExfR
         Dx8ZiW3K9wkbh+yeJuCmKYMgL8sSgLGyQ+cA5RwNuOIn9x+0FA8uthgbgD7yO9QrUtcG
         T6RPfSbdb7c7kS6vEYGElqj1Vk15jXPT45QsVkm4nnNzpO80vOLRYyasDjvmn3GW23vA
         N9Ow==
X-Gm-Message-State: AOAM532Boo5d8z5VTExFBibN3Lu+Gnmpri2MuUGtOww2TEmeAB4pK6B1
        AF+T/fNxPPcX3o5RNo5eUpkV+PNF6Ueoe13ToOQ=
X-Google-Smtp-Source: ABdhPJx2UMQKvzPc9YbjuAcaOdZsXhK7RlcIM2M9pkfdRpnDBi+U9k28DqELenlSlo2tvxUYIND8c9jWK0Acmjv4ppQ=
Sender: "samitolvanen via sendgmr" 
        <samitolvanen@samitolvanen1.mtv.corp.google.com>
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 (user=samitolvanen job=sendgmr) by 2002:ad4:5685:: with SMTP id
 bc5mr5091015qvb.48.1606858662372; Tue, 01 Dec 2020 13:37:42 -0800 (PST)
Date:   Tue,  1 Dec 2020 13:37:04 -0800
In-Reply-To: <20201201213707.541432-1-samitolvanen@google.com>
Message-Id: <20201201213707.541432-14-samitolvanen@google.com>
Mime-Version: 1.0
References: <20201201213707.541432-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
Subject: [PATCH v8 13/16] drivers/misc/lkdtm: disable LTO for rodata.o
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

Disable LTO for rodata.o to allow objcopy to be used to
manipulate sections.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Acked-by: Kees Cook <keescook@chromium.org>
---
 drivers/misc/lkdtm/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/misc/lkdtm/Makefile b/drivers/misc/lkdtm/Makefile
index c70b3822013f..dd4c936d4d73 100644
--- a/drivers/misc/lkdtm/Makefile
+++ b/drivers/misc/lkdtm/Makefile
@@ -13,6 +13,7 @@ lkdtm-$(CONFIG_LKDTM)		+= cfi.o
 
 KASAN_SANITIZE_stackleak.o	:= n
 KCOV_INSTRUMENT_rodata.o	:= n
+CFLAGS_REMOVE_rodata.o		+= $(CC_FLAGS_LTO)
 
 OBJCOPYFLAGS :=
 OBJCOPYFLAGS_rodata_objcopy.o	:= \
-- 
2.29.2.576.ga3fc446d84-goog

