Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C9213EE0D8
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Aug 2021 02:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234864AbhHQAWE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 20:22:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234861AbhHQAWD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 20:22:03 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 839F6C061764
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 17:21:31 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id m8-20020a05622a0548b029028e6910f18aso10233985qtx.4
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 17:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=kQY8kOYZdYKiHWDklrQnDN9z/iRRKX3LSfg/PX+3Ycs=;
        b=l4JcmRDb9TBhkEtWZhsc0SxqfOzIUf9YXUnObA0+zhBM/AxirIBnlaurxqWctpKQvf
         SIUX7kAxcjbAPqWZvK1m0dqVy4cljFgfM6UQXl2rikBQWS+ngk0E0VOlqbGcNTJOLqLn
         Vpz11rhaZ3T14nLJw1/gaik1LdkWxJv6UpgRI1Apnk5voAs58cIrrH+13oO4BEJvMuZX
         czc49Vm58VCoIgBTuRJYcxVEFF865M6NSMTa8qLwPMHkqRBDkqN0TF4o6C0rP7i15k/r
         CuG/Xux2YsBusNXKOAGsdNyCSr2lNbKw8+MOWcwB02jDbpHhic2l6W/8sDRKAPbH7C2g
         OmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=kQY8kOYZdYKiHWDklrQnDN9z/iRRKX3LSfg/PX+3Ycs=;
        b=psoYgJFaynt7cUuYsUZxDT0+ete1nOIT7oRW4laH+Su4BJkJM97arjpXukual/U5BC
         McK4pYGxZl3CpRmb9O7qBafdKp1Q4wQcobuh25lpaTOsXOnXRGd2vlr/q+4taSHMLqx2
         QyjUIkx3tDeySp+wAkWOBI6uPMmohGHy56UfvtHbGr/yJFe7Eyl3kAj0U0kzTA07+STE
         XSadVMaSq3y0fMwKNLZ5Q6KhZ44Q841JTNaIec84FyRBXA3buIXk9UtCL/FBKf4WaJJW
         956oJpAb8g6Ob32LvXBQWIYoHvpm1cnzFyb0pt/I2o1eg/nfimZRoWVYiKn7uM3AJ6r3
         vFVw==
X-Gm-Message-State: AOAM533QttqycOEUn8bW3/ceK8BVC4hlHenBH+x34i0M1+TCJZ7F8kKP
        bGVIhxBJqTtvQVSEeO9g5Lvd22nh5Snk/WE2Q8Q=
X-Google-Smtp-Source: ABdhPJxTkZIv04ZmEfD+6QrC3ov/cXwEg1cbKJC+LxC+u+pxEQRLUIfuWwYxbvNk8n9zhFj4s1tTHYy/BW242JVyydo=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:478:6e44:5cf7:fcde])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6214:324:: with SMTP id
 j4mr727123qvu.34.1629159690697; Mon, 16 Aug 2021 17:21:30 -0700 (PDT)
Date:   Mon, 16 Aug 2021 17:21:08 -0700
In-Reply-To: <20210817002109.2736222-1-ndesaulniers@google.com>
Message-Id: <20210817002109.2736222-7-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20210817002109.2736222-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [PATCH 6/7] Makefile: replace cc-option-yn uses with cc-option
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

cc-option-yn can be replaced with cc-option. ie.
Checking for support:
ifeq ($(call cc-option-yn,$(FLAG)),y)
becomes:
ifneq ($(call cc-option,$(FLAG)),)

Checking for lack of support:
ifeq ($(call cc-option-yn,$(FLAG)),n)
becomes:
ifeq ($(call cc-option,$(FLAG)),)

This allows us to pursue removing cc-option-yn.

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 72f9e2b0202c..f76be5f62d79 100644
--- a/Makefile
+++ b/Makefile
@@ -967,7 +967,7 @@ ifdef CONFIG_FUNCTION_TRACER
 ifdef CONFIG_FTRACE_MCOUNT_USE_CC
   CC_FLAGS_FTRACE	+= -mrecord-mcount
   ifdef CONFIG_HAVE_NOP_MCOUNT
-    ifeq ($(call cc-option-yn, -mnop-mcount),y)
+    ifneq ($(call cc-option, -mnop-mcount),)
       CC_FLAGS_FTRACE	+= -mnop-mcount
       CC_FLAGS_USING	+= -DCC_USING_NOP_MCOUNT
     endif
-- 
2.33.0.rc1.237.g0d66db33f3-goog

