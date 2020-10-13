Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E54D28C65A
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Oct 2020 02:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727634AbgJMAes (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Oct 2020 20:34:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727648AbgJMAdM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Oct 2020 20:33:12 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89BDCC0613AA
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Oct 2020 17:32:48 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id n13so18961630ybk.9
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Oct 2020 17:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=KGusc3+RBCNZzwrkW+3708RrOouUa5FTnw8PnBTY3Ig=;
        b=bb3nDFzIx4qOjrAxOJ2W8KlT1MSwi986POJ9cJKOfKNUvRnVD7cY4Jz0mSg7MRPV0m
         lXGeie9Xx5DffV8Za4XM0+PkCWp/NCEYvBCpL7dbWdrPNqfhiC4UEsNhLdH9WWLRAVhu
         rBrRJaB7DNAvuCtUjCRM0HtqGKgpYPqEp2T0+l16BlXpPCOzksZ+AJZoofJNI/IPVJLU
         DGaw9KsaIO4EuTukInDUjt34kVBq5g8dbh3CNbZSE7P38c406JgXNG5VZxPiK/gkKrw+
         oQSbozkgWh9aNk4C9mJf/hcl8a66+ktKY02krWk3JyMwLeJ56+gSghiqZIoBEYDSxY68
         9P+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=KGusc3+RBCNZzwrkW+3708RrOouUa5FTnw8PnBTY3Ig=;
        b=t0U7pgKZu1NVZj3kEOGYMDEByn9cvPT/dKo7BifUWJFC6uDbjtInpUHIVgXFmpWCDT
         46IwvErQn6/ealuTN19COXlQwpeauXHQB+YhiDmG5smKBqEMFCS3t0Z2A0CdanvCkRfz
         //BYzI87SwMqzwaUVzj2JcA4c/kr1OS0/fYQRdkCgmmnBjDhGMPKVgioinAGJ4nk6aqT
         kvjlZVpcVOJc0Dwz8Xcgbe6s4lMc7b5w1xtvMQok4ExmqMqkCnXZNdYLIOxLstL3gCra
         p7fJUv3co7eoIUBO+E/i9nEj3ooral23DRxCfDxWSleFp3Fm1olsXGoHvC9Z9a2BvKEn
         AHIA==
X-Gm-Message-State: AOAM532v0Kk9s8dOWstvBnyk4ignyJZD9VrYmSEy7HxOpliUdNzaiIZT
        65Li7dSu4WFipbKOlIiLD/wt6Xbfnlm+ixGPyuo=
X-Google-Smtp-Source: ABdhPJxn7XFZrqOn+1+G64/SnDmtkk1LEUGGMAzLxs1dl5s59vyoJo/OwiDLBmXb5P310AefkBc1vWcPP0Py9wbvJGA=
Sender: "samitolvanen via sendgmr" 
        <samitolvanen@samitolvanen1.mtv.corp.google.com>
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 (user=samitolvanen job=sendgmr) by 2002:a25:2689:: with SMTP id
 m131mr35046414ybm.506.1602549167733; Mon, 12 Oct 2020 17:32:47 -0700 (PDT)
Date:   Mon, 12 Oct 2020 17:31:57 -0700
In-Reply-To: <20201013003203.4168817-1-samitolvanen@google.com>
Message-Id: <20201013003203.4168817-20-samitolvanen@google.com>
Mime-Version: 1.0
References: <20201013003203.4168817-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
Subject: [PATCH v6 19/25] scripts/mod: disable LTO for empty.c
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
2.28.0.1011.ga647a8990f-goog

