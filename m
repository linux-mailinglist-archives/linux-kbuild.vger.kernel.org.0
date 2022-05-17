Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD0852A962
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 May 2022 19:36:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351558AbiEQRgZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 May 2022 13:36:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351499AbiEQRgU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 May 2022 13:36:20 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A438022BFE
        for <linux-kbuild@vger.kernel.org>; Tue, 17 May 2022 10:36:18 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id s14so17977734plk.8
        for <linux-kbuild@vger.kernel.org>; Tue, 17 May 2022 10:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6EHXC0+5WwGjzxO6nhB0I9+Yv+MYJk1jowBhHlsrX7Y=;
        b=Umdr47WVACqNYK8t2YdLvvO1D81cAhDB/Bq4A/Yf63zAwWq6VlQkiQjSsqAWFwjt7p
         Mqw4UHC+ktYyTAt5l3p0FArW8yfRhowxMiX1GwZC5Eqsq3VAXMz00yg3jsgVk2RwbVGX
         eMWpMQU34/UE0ytl67fFFZD1sEyQ5JfKaVmyll2s1jRiTi1jN6kJCW7YDpOWoaARnFZF
         txOEKPBk0rjn4NZ90W0h0C5dl3vQcKNQ12kgKoOn0MMuiePDlAATMzAIFH+pHExnWt2l
         mFMFXLbHZ7vOJd/vqBMBJeBBT/kVJDKhuW8s7L1NMwZT9K7GA2+bWhBT63rsINY99wVG
         cscg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6EHXC0+5WwGjzxO6nhB0I9+Yv+MYJk1jowBhHlsrX7Y=;
        b=3AqPB0ZlEHYEtrMw9K1joVmKCvg1QN8v+6JjAgOIUtXa6WnMWX6bXiUA8rdTYREtoD
         5H0XrIRcSv5A5y7UrWzyyxpeCPvzsikviI26oqe7M7bXLPqx829EpE2F9V4NDs8sOK6/
         xJVv1s+3Cqx1zMHg1wfIjZ1FDms/xuHpIS2ztpna/R/Y37NOspAz7tu8Nb8xcSVTmVX7
         r8S7995KKOt62Ul9God56nMGKVyOlD0/xTQ9A4NBwHqRfEqPE9xO2X9Xs0XGgzbgTKfr
         h+BKJ+etgK+PybIuNBPh35CyFNK+Nkih1rWFfvfesDJdAsfacc+Kj2xxqw+0jwEtbft5
         VvsA==
X-Gm-Message-State: AOAM533CmL6u0SHcRB2iT3Pt3R2ww/Eu0JiEI9hFYIntD/ZRsjttveg2
        v16E4Kqc1mqLopx9sdqQuss=
X-Google-Smtp-Source: ABdhPJwejyrTCRAjTQ5xpOqSVzKXpCm7iW4ZBpZhRCRsRcZQ9Wm186GrFE3/oUvfKI13+0VzgpdvEw==
X-Received: by 2002:a17:90a:e7ca:b0:1df:34ec:1fca with SMTP id kb10-20020a17090ae7ca00b001df34ec1fcamr15566367pjb.195.1652808978085;
        Tue, 17 May 2022 10:36:18 -0700 (PDT)
Received: from pop-os.login.wijungle.com ([14.139.240.252])
        by smtp.gmail.com with ESMTPSA id e11-20020a17090a9a8b00b001df4c27e5a5sm1914061pjp.35.2022.05.17.10.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 10:36:17 -0700 (PDT)
From:   ALOK JHA <alok08jha@gmail.com>
To:     alok08jha@gmail.com
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org
Subject: [PATCH] Makefile: Globally enable fall-through warning
Date:   Tue, 17 May 2022 23:05:34 +0530
Message-Id: <20220517173534.10878-1-alok08jha@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>

Now that all the fall-through warnings have been addressed in the
kernel, enable the fall-through warning globally.

Also, update the deprecated.rst file to include implicit fall-through
as 'deprecated' so people can be pointed to a single location for
justification.

Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: Kees Cook <keescook@chromium.org>
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 Documentation/process/deprecated.rst | 14 ++++++++++++++
 Makefile                             |  3 +++
 2 files changed, 17 insertions(+)

diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
index 49e0f64a3427..053b24a6dd38 100644
--- a/Documentation/process/deprecated.rst
+++ b/Documentation/process/deprecated.rst
@@ -119,3 +119,17 @@ array may exceed the remaining memory in the stack segment. This could
 lead to a crash, possible overwriting sensitive contents at the end of the
 stack (when built without `CONFIG_THREAD_INFO_IN_TASK=y`), or overwriting
 memory adjacent to the stack (when built without `CONFIG_VMAP_STACK=y`)
+
+Implicit switch case fall-through
+---------------------------------
+The C language allows switch cases to "fall through" when
+a "break" statement is missing at the end of a case. This,
+however, introduces ambiguity in the code, as it's not always
+clear if the missing break is intentional or a bug. As there
+have been a long list of flaws `due to missing "break" statements
+<https://cwe.mitre.org/data/definitions/484.html>`_, we no longer allow
+"implicit fall-through". In order to identify an intentional fall-through
+case, we have adopted the marking used by static analyzers: a comment
+saying `/* Fall through */`. Once the C++17 `__attribute__((fallthrough))`
+is more widely handled by C compilers, static analyzers, and IDEs, we can
+switch to using that instead.
diff --git a/Makefile b/Makefile
index 9be5834073f8..bdf8eac51b07 100644
--- a/Makefile
+++ b/Makefile
@@ -843,6 +843,9 @@ NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
 # warn about C99 declaration after statement
 KBUILD_CFLAGS += -Wdeclaration-after-statement
 
+# Warn about unmarked fall-throughs in switch statement.
+KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough=3,)
+
 # Variable Length Arrays (VLAs) should not be used anywhere in the kernel
 KBUILD_CFLAGS += -Wvla
 
-- 
2.34.1

