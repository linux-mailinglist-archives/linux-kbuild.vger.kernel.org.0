Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D01460BE16
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Oct 2022 01:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbiJXXBR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 24 Oct 2022 19:01:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231350AbiJXXAg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Oct 2022 19:00:36 -0400
Received: from mail-ed1-x54a.google.com (mail-ed1-x54a.google.com [IPv6:2a00:1450:4864:20::54a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFEBE2D4524
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Oct 2022 14:22:49 -0700 (PDT)
Received: by mail-ed1-x54a.google.com with SMTP id m7-20020a056402430700b0045daff6ee5dso10506533edc.10
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Oct 2022 14:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XYIeNtcSMBuwQ4ZUNtMrq5SFnntAuabRdvmK/d2x8js=;
        b=Z2RX/saDef7hn683V4j0i5oZ/4CeWuvGJYbdKV5tISFit7ef+6l5PCAipzwyZ7BeiO
         EPirZ8Rv7RC5dlr2jbxe8J5rDP6eyCRFXSbvCOHFLTgHO38oNZ8NcKEZz7LRJV9whBzw
         SlOVNCjuhY1/3D3mJnUM8hAamOdsnb/MAYvqsbY87QLHYWOnDOLJk2St3m6OCZXsAM0P
         wiQfeGmmaTY/zb3roX1oY3y/wFJBytPp5+wk9GOpCrE1kCU6zWIY1Vzoyj/dZdyQokMi
         KtKVBt799EJxWAxrx6ZXHTTkUeoPkaZT3jX6k+JwokHO7Nf58TS2z0+z03halrOoEixy
         Q+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XYIeNtcSMBuwQ4ZUNtMrq5SFnntAuabRdvmK/d2x8js=;
        b=xUktXasxwv+Ez/VsathfeeNJQiN20Wf+D5hj8sM6WPro/22BrSuvkbOs+otaq3LkvT
         Z3YDN66z6FFR4oAtHJ95iMlovVxRsc93qZUGaTFN/a54ddkID9jMdns/wU7lim6e2oz8
         /JgyDMaVHAAXG9K+IsWikJiicX54tLMx0GKfnqGDKKoY0ETFgPmIhZxrRBBo2iwYrUL8
         Jwi3DnnodTkeCsGmrEUrRlNWC/S48pJCp9kjGr3/V+XEff8+nAYwxN5IpoY7ck326LX8
         SSiB4S4YMOODRgKjX8dcYcsKRaqy7UUJb2G39LP+Lr6ATLO8BJ0avulcYQlnwz2Pwnat
         vzAw==
X-Gm-Message-State: ACrzQf22mFJu+qkL5c6TyLnLXmuoat8HqmbOEGAPCU/8k1dhDGYWfQ/0
        /WPHyf5AckIvQDc0w25REXx2YlwZ5rE=
X-Google-Smtp-Source: AMsMyM4v3Qlkg/xauVd+MHmORNpeKek6l2QBmxJ3e+SVVwmlcYAuzT3vjefHuTAy1CPMCwZF2Oldi5XsCCI=
X-Received: from glider.muc.corp.google.com ([2a00:79e0:9c:201:8695:7c88:66ed:f9d1])
 (user=glider job=sendgmr) by 2002:a17:906:8451:b0:79d:af69:8a20 with SMTP id
 e17-20020a170906845100b0079daf698a20mr15002244ejy.406.1666646524113; Mon, 24
 Oct 2022 14:22:04 -0700 (PDT)
Date:   Mon, 24 Oct 2022 23:21:42 +0200
In-Reply-To: <20221024212144.2852069-1-glider@google.com>
Mime-Version: 1.0
References: <20221024212144.2852069-1-glider@google.com>
X-Mailer: git-send-email 2.38.0.135.g90850a2211-goog
Message-ID: <20221024212144.2852069-3-glider@google.com>
Subject: [PATCH 3/5] Kconfig.debug: disable CONFIG_FRAME_WARN for KMSAN by default
From:   Alexander Potapenko <glider@google.com>
To:     glider@google.com
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

KMSAN adds a lot of instrumentation to the code, which results in
increased stack usage (up to 2048 bytes and more in some cases).
It's hard to predict how big the stack frames can be, so we disable
the warnings for KMSAN instead.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Kees Cook <keescook@chromium.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-kbuild@vger.kernel.org
Link: https://github.com/google/kmsan/issues/89
Signed-off-by: Alexander Potapenko <glider@google.com>
---
 lib/Kconfig.debug | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 3fc7abffc7aa2..29280072dc0e4 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -400,8 +400,9 @@ config FRAME_WARN
 	default 1536 if (!64BIT && XTENSA)
 	default 1024 if !64BIT
 	default 2048 if 64BIT
+	default 0 if KMSAN
 	help
-	  Tell gcc to warn at build time for stack frames larger than this.
+	  Tell the compiler to warn at build time for stack frames larger than this.
 	  Setting this too low will cause a lot of warnings.
 	  Setting it to 0 disables the warning.
 
-- 
2.38.0.135.g90850a2211-goog

