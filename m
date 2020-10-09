Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07E72288E3E
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Oct 2020 18:15:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389410AbgJIQO7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Oct 2020 12:14:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389780AbgJIQOX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Oct 2020 12:14:23 -0400
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F8F0C0613DC
        for <linux-kbuild@vger.kernel.org>; Fri,  9 Oct 2020 09:14:23 -0700 (PDT)
Received: by mail-pf1-x44a.google.com with SMTP id m64so3046909pfm.0
        for <linux-kbuild@vger.kernel.org>; Fri, 09 Oct 2020 09:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=BiHYmAAiH626N89XqxkZXfyE7gUyoYuU5gV65m3nGjQ=;
        b=kWaosZKlpyaPhHKVgAB5jaN7Z/L5GLVvlb4+fdv2ch+ej3HpYqzh6uZcdm3+Tvoykg
         6omGVQqiCVxWzoz/gV2RtiawIlWAzwAOAuDWw0klxLvDAp9C8MllbAFa/+mLP6BcvQ6Q
         1JGIssCdJM4GgwAf9G0Zx3c0le6touIF258LA0TedygIS2yHumz44INySxDCNXx7yHIK
         60P3ikRwg9bDNGtZtGkEoyU1tNL/E5ndf++JFwH856D/hSDeXzqinxxFRqXy0QAm3BSb
         k4Ywf7UqYk+GgIXWciDnanYQ1EPbCUEpP8hpqyk2cG836ip23OzwDZz83/Buo4laq19m
         uH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=BiHYmAAiH626N89XqxkZXfyE7gUyoYuU5gV65m3nGjQ=;
        b=pHU5HHTwkmmeSJ1CiIrKxKlXA4LRwWjs2nPlFRVVpEiesq5OBCjHBqFoojq8xC25ag
         zxwg47Z8tZpg5woT+6Fb6+hTZEZS4rRdtysd1SyaQBIx1kG8Yi54KDrpzxihrWl3Vavr
         b/nVFtwRIAAEjpBnToQNVCaha1X8RMl35LEOVFOw6EYckt+6WaupJ7qktf/wvK5JSBOh
         07tNucq0qBnwhWv0DNZ7sUEyK3bvCOiYDJbV+2jHMrKttIkEFK+x3i0sEqXtxCvbbl7V
         eMmqzG+YXCEQ7iEoESiNNpQrRomDekAVqSd/8W5OzvuFwC124hHhw/nMDxsH4PJMdKfM
         2KaA==
X-Gm-Message-State: AOAM531fzjGtuFV90aOc9mSDSTkDW+KWdQaj7Rudx4d+k0ugOfA4SE15
        l0n+7JxZgYvoxODy+9WW686JWzHhI+wach2GQh8=
X-Google-Smtp-Source: ABdhPJyHPiE5GePYAvaEya8u/0CvrCAAGbNDB2zBtM4hELH+YYZewJMzkdHOHE7lBNk0pBM71xtMSBAsdjBdBJfED8o=
Sender: "samitolvanen via sendgmr" 
        <samitolvanen@samitolvanen1.mtv.corp.google.com>
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 (user=samitolvanen job=sendgmr) by 2002:a17:90a:7c0c:: with SMTP id
 v12mr5366318pjf.71.1602260062781; Fri, 09 Oct 2020 09:14:22 -0700 (PDT)
Date:   Fri,  9 Oct 2020 09:13:30 -0700
In-Reply-To: <20201009161338.657380-1-samitolvanen@google.com>
Message-Id: <20201009161338.657380-22-samitolvanen@google.com>
Mime-Version: 1.0
References: <20201009161338.657380-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
Subject: [PATCH v5 21/29] drivers/misc/lkdtm: disable LTO for rodata.o
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

