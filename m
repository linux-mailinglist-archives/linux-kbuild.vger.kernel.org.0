Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA4DA772BD4
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Aug 2023 18:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232033AbjHGQ6R (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 7 Aug 2023 12:58:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231696AbjHGQ6L (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Aug 2023 12:58:11 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4F68172A
        for <linux-kbuild@vger.kernel.org>; Mon,  7 Aug 2023 09:57:47 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5734d919156so40879427b3.3
        for <linux-kbuild@vger.kernel.org>; Mon, 07 Aug 2023 09:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691427465; x=1692032265;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OhiUftOb2o56hkUQV+ZtLncPSlYoXMv0SECjTg7Jt94=;
        b=TljiyfJW5u5nsEuK9l9Jz1vIL1gWGBr6Px3os1xU1f83SmzDxB6bEquswGJ5SdzB7v
         jYEdyMj8F83vDjsQxr6QZ5tdLSAvKiPajCYuAg/Wsqv5cfqSMocJ0XSZ6RrS1w4tOB7/
         Q5TCsCBjULogwwcWjYttdXUVWIXaQrYWQppoeX0kKnOU6HSStOjT2SHLjYxJTV3PPjkK
         2E8d44Q//5X3h9RwfRfMVXkQFPC3HnwZ03BQZcMO2Pzlet4vtQLODjFWf5VVKziJsrZT
         d+fifZDim0wavKDzpLRoTj2RFojONIoJbU5hjQpM0U9PIDYm47AeBOWrDq+wNaL8T41x
         t2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691427465; x=1692032265;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OhiUftOb2o56hkUQV+ZtLncPSlYoXMv0SECjTg7Jt94=;
        b=DmwRYhs1uUP6exjD6dpgod58y6BmukJXKqMOIzVHv8ZXLUp4k3GIVSXNlheHCVo5ZD
         5XYVTh3z0/Xgj8/gQ4u9hY7kjcjTs7aA3NOw0Sv/+7YUzHt/ubPlVuG55qkDGOHKicJJ
         zsrhE3xf24DUz/NVWGADdcTm+V+kASvL8J/ihkjcwbXcG0IpTHByepkEIFw5fhu91/yn
         RfiMqCk81UkQNV0ywCcuk5lWkB7P/ZPL9yMgmCAvFcBi6Z5dDqB6FyMkVUHBpDKq9KSi
         KAMMDOQ6an+hYNlmO4o7O8EBztnGbpMeSUyEN5w399v+zo2ZELnTo1BviohOogR/xZlX
         Sycg==
X-Gm-Message-State: AOJu0YxDjXzELaCYPK03AboyWUgT3HFLXzi6l3Ufvpd3NJwTiY7gmUC/
        YP5BLA8l4ljZKw+lV4R4X1vJK1q6YJlbl1PZu/s=
X-Google-Smtp-Source: AGHT+IFWkQ0pLgPAKWFDCriEIiAIO+33WqMKSSXVJL3oPrcmXL+Bseok4OpPoN4rRXf53fZG+IVdJph/ei2vIJld6Po=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:4746:957d:1a28:5104])
 (user=ndesaulniers job=sendgmr) by 2002:a81:a84a:0:b0:570:7d9b:9b16 with SMTP
 id f71-20020a81a84a000000b005707d9b9b16mr69838ywh.2.1691427465219; Mon, 07
 Aug 2023 09:57:45 -0700 (PDT)
Date:   Mon, 07 Aug 2023 09:57:43 -0700
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIYi0WQC/3XMQQrCMBCF4auUWRtJa5OoK+8hRZI4TQdspySlK
 CV3N3bv8n/wvg0SRsIE12qDiCsl4qlEc6jAD3YKKOhZGhrZnORZGjFSSjSFxxx5YSG9u0j0ulW th/KZI/b03r17V3qgtHD87Pxa/9Z/0lqLWpheae2Ms8rbW2AOLzx6HqHLOX8B31sGXKsAAAA=
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691427463; l=1707;
 i=ndesaulniers@google.com; s=20220923; h=from:subject:message-id;
 bh=/3ebNjUMiHT+ZDd7Ua2EPlNM8kr/3S8xi33sTpmWDMc=; b=WZkUghyVlQr8CofcN5Yr2Itll/XZeeEa+w7dIYsN21Mosf0pZvOZYSBDP3MaFJvJfwA7mp+on
 FTDDnEp75lPAqMse60QXcUKBJ6gadYonZb8YYFKpcH4AmjHHDIz3fC7
X-Mailer: b4 0.12.3
Message-ID: <20230807-missing_proto-v2-1-3ae2e188bb0c@google.com>
Subject: [PATCH v2] Makefile.extrawarn: enable -Wmissing-variable-declarations
 for W=1
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I noticed Tom was sending patches where smatch was recommending
annotating functions as static when no previous declaration existed.
Surely the compiler could make such recommendations as well, I thought.

Looks like -Wmissing-variable-declarations can make such
recommendations.

GCC just added support for this warning (gcc 14.1.0 will ship with
support), and all versions of clang relevant to building the kernel
support this flag.

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes in v2:
- Fix typo in warning flag name. I thought I tested W=1 but I was
  looking at -Wmissing-declaration, not the expected
  -Wmissing-variable-declaration. Actually verified v2.
- Link to v1: https://lore.kernel.org/r/20230807-missing_proto-v1-1-7f566b7ba5ca@google.com
---
 scripts/Makefile.extrawarn | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 40cd13eca82e..18ce75c5c384 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -32,6 +32,7 @@ KBUILD_CFLAGS += $(call cc-option, -Wunused-but-set-variable)
 KBUILD_CFLAGS += $(call cc-option, -Wunused-const-variable)
 KBUILD_CFLAGS += $(call cc-option, -Wpacked-not-aligned)
 KBUILD_CFLAGS += $(call cc-option, -Wstringop-truncation)
+KBUILD_CFLAGS += $(call cc-option, -Wmissing-variable-declarations)
 # The following turn off the warnings enabled by -Wextra
 KBUILD_CFLAGS += -Wno-missing-field-initializers
 KBUILD_CFLAGS += -Wno-sign-compare

---
base-commit: 52a93d39b17dc7eb98b6aa3edb93943248e03b2f
change-id: 20230807-missing_proto-0cb90ec6454c

Best regards,
-- 
Nick Desaulniers <ndesaulniers@google.com>

