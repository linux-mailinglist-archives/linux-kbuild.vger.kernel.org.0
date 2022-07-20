Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98A5357C0D1
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Jul 2022 01:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbiGTXXn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Jul 2022 19:23:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbiGTXXm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Jul 2022 19:23:42 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DC3A15A07
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Jul 2022 16:23:41 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id j2-20020a2597c2000000b0064b3e54191aso14277143ybo.20
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Jul 2022 16:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=R+/1pbXuzmkVkOVy5qVFEBVHEW28THt6o2fZNxe3Mxk=;
        b=PdnjK40uqE0rlZAfyoGITLGrx0eRz5JxZ7VRQIerUO+mUtU6DdggO5Ajy3NGMqmKow
         IeTieM6BTy5sLQqE8tqL1gpZrGtnd8WELTcYjwIotVkVpwAmvUXJSnkmcFGeAh4xIinb
         7RBd2n0ycGcN6sTR2j6mt5AOt68f/L+sYICQWEAnAyOAx2po/n6Ub2jx+vDZ3Ys7cOR/
         cLNwNFxXPYWtryBkP+jxU/WJARD+Up+a9L3wTOxEIWs6amWDeG9gjWhf2pMlFsiXhGCB
         qqDicb5nVMv2sAlb/DqGazIarpYZDaOi91FxuwIMwuUd+WPztxwagBMiWLBinCi1D6Sw
         34MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=R+/1pbXuzmkVkOVy5qVFEBVHEW28THt6o2fZNxe3Mxk=;
        b=ADDosfHTvas9tiVc3IlttOidFq2amxsdsjklGrV5iHP7UnI5D8+mQ3Zx4oGV7tg3Fd
         w8eg1oUyr4dIzwS1YoRDvvgJE/mb7KnReQVka3ob18SUcNklu3zuvkmwjLiYhig9Gtep
         RZib/Yl7OrRwTb97IbMFdKZY4krFoe5bkbbeW1VgMxPq5+DjAFZEhEM1BneGs8+QDhzV
         4gMSa0vx4zeng/tYVvnOtv5QZm48HnYKvYH/oRsescX12UprLTF3IRMoygcUGst1TEZE
         g6McHnH6vTXH+EKrdq7XfJ6GR/b902ipZvJWZP9lldu9AqOFtAKcl3rJrnOCVvHHpAsP
         ftlA==
X-Gm-Message-State: AJIora+iU7kdAL38HWVXFgsE04QBxmQG8mjdPe6hhvxUL0cvfE9vePOY
        5Y6Uqz+7WzoV6W8Dyd982DOTNO5x4PpVw1hQxw==
X-Google-Smtp-Source: AGRyM1s5yy+h6QaK+AjrtLq6y3FlnydodI5uH79guzSZhcFTGxDYwsSbdfDP6/AXl1R0X9J2R2ETP9lL6nC7QgPDCw==
X-Received: from justinstitt.mtv.corp.google.com ([2620:15c:211:202:c00d:c17d:52be:ff65])
 (user=justinstitt job=sendgmr) by 2002:a05:6902:102f:b0:66f:1145:af6e with
 SMTP id x15-20020a056902102f00b0066f1145af6emr38142323ybt.509.1658359420516;
 Wed, 20 Jul 2022 16:23:40 -0700 (PDT)
Date:   Wed, 20 Jul 2022 16:23:32 -0700
Message-Id: <20220720232332.2720091-1-justinstitt@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Subject: [PATCH] Makefile.extrawarn: re-enable -Wformat for clang
From:   Justin Stitt <justinstitt@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Tom Rix <trix@redhat.com>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        Justin Stitt <justinstitt@google.com>
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

There's been an ongoing mission to re-enable the -Wformat warning for
Clang. A previous attempt at enabling the warning showed that there were
many instances of this warning throughout the codebase. The sheer amount
of these warnings really polluted builds and thus -Wno-format was added
to _temporarily_ toggle them off.

After many patches the warning has largely been eradicated for x86,
x86_64, arm, and arm64 on a variety of configs. The time to enable the
warning has never been better as it seems for the first time we are
ahead of them and can now solve them as they appear rather than tackling
from a backlog.

As to the root cause of this large backlog of warnings, Clang seems to
pickup on some more nuanced cases of format warnings caused by implicit
integer conversion as well as default argument promotions from
printf-like functions.


Link: https://github.com/ClangBuiltLinux/linux/issues/378
Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Previous attempt: (https://patchwork.kernel.org/project/linux-kbuild/patch/20190201210853.244043-1-jflat@chromium.org/)

Note:
For this patch to land on its feet, the plethora of supporting patches that
fixed various -Wformat warnings need to be picked up. Thanfully, a lot
of them have!

Here are the patches still waiting to be picked up:
* https://lore.kernel.org/all/20220718230626.1029318-1-justinstitt@google.com/
* https://lore.kernel.org/all/20220711222919.2043613-1-justinstitt@google.com/

 scripts/Makefile.extrawarn | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index f5f0d6f09053..9bbaf7112a9b 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -47,7 +47,6 @@ else
 
 ifdef CONFIG_CC_IS_CLANG
 KBUILD_CFLAGS += -Wno-initializer-overrides
-KBUILD_CFLAGS += -Wno-format
 KBUILD_CFLAGS += -Wno-sign-compare
 KBUILD_CFLAGS += -Wno-format-zero-length
 KBUILD_CFLAGS += $(call cc-disable-warning, pointer-to-enum-cast)
-- 
2.37.0.170.g444d1eabd0-goog

