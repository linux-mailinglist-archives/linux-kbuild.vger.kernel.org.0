Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B62A28C641
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Oct 2020 02:36:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727747AbgJMAe1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Oct 2020 20:34:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727741AbgJMAdl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Oct 2020 20:33:41 -0400
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A4F5C0613B2
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Oct 2020 17:32:53 -0700 (PDT)
Received: by mail-qt1-x849.google.com with SMTP id l12so13743772qtu.22
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Oct 2020 17:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=BiHYmAAiH626N89XqxkZXfyE7gUyoYuU5gV65m3nGjQ=;
        b=XNjBIDINKT2pRuTcs85XqtGqpKKB5NK63w4IySiOIysYaLEiPBkXTqBpHa9k0rcANP
         Mq8luu8tR+/vZGjuz5FWZqlrWlbhD1dsrCW8kjpnk6Of8lm3Uq7bjBxMFSPhYIwpNkRs
         wzxAjEDJS3JTBUI9Rc9q6CxPrCEE1D+TblGGgUcWZ9InruHmMULIEq8MSFdie4O9SeCJ
         CDrDZvBBKT7r3ExX0KMrO5Td8OLZ31CYqJR7Va6pe/bqAPf2uWlcxTyzqGmJpNzT0KMv
         wQ0Tg2BqZiU27oj8+ptgF/4aA8HHcfJ5uqYDxVmwrvDxTkUyV923+xAgmlUuAFczliXV
         NdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=BiHYmAAiH626N89XqxkZXfyE7gUyoYuU5gV65m3nGjQ=;
        b=IZq8JN/SIEFHKfBNPnW6c+oAdXXen0a9RQ2L2nZHUXQ/ZJGwAqkDZpvG9umVQJl35w
         ndufciRtWbbRkxoM7Wfe2hW5hfuGZS8/eSReeGYHPcY7DXt2zvH8JTBquxmllfrkRSE9
         ECEFNR4OB7tAFbtbObogf6+b5hHnOgX1I1hi2PpJsMWjW8B2aaA/vbEbyp1zjWwapwSE
         9cg5c70Xxk2tITv5Ffr4ONNvSgqVw96RWWeb0eT60ps+6E4tVVVSEy0OFHXiWXJnu5ym
         fKjf1cmKv9ry/2nTeHpg/qdbPji+IEClFu/jMYCfiVe9EeaicLkqkg++dlx+jaRvwHLz
         Koew==
X-Gm-Message-State: AOAM533DFAeiTRPAgXINjZ2SXRnIG3dUfsuM+/o1kMLcLS5iZZm05xsF
        eWYrNvabXjU55KpGJAqV598Vd+lErmlzZnbmnZQ=
X-Google-Smtp-Source: ABdhPJw5yrP7SHcc7TWSGYuiAJWigblY6T4KARgQjUPREPTC4jVDZK0jmnjuyAbsgm5fKdwKwlLo7kamaFSoW1+wZMw=
Sender: "samitolvanen via sendgmr" 
        <samitolvanen@samitolvanen1.mtv.corp.google.com>
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 (user=samitolvanen job=sendgmr) by 2002:ad4:5747:: with SMTP id
 q7mr15646088qvx.0.1602549172707; Mon, 12 Oct 2020 17:32:52 -0700 (PDT)
Date:   Mon, 12 Oct 2020 17:31:59 -0700
In-Reply-To: <20201013003203.4168817-1-samitolvanen@google.com>
Message-Id: <20201013003203.4168817-22-samitolvanen@google.com>
Mime-Version: 1.0
References: <20201013003203.4168817-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
Subject: [PATCH v6 21/25] drivers/misc/lkdtm: disable LTO for rodata.o
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
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
2.28.0.1011.ga647a8990f-goog

