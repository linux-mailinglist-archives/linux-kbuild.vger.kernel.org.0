Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A0EC5BD3B9
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Sep 2022 19:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231255AbiISRan (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Sep 2022 13:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231330AbiISRak (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Sep 2022 13:30:40 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EAE927175
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Sep 2022 10:30:38 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-34546b03773so255817057b3.9
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Sep 2022 10:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=s6uRkLrexDp9AuGMyAs7SqQv5eI0LnBw/AxscLv33eg=;
        b=K/Kvf34Ybxb1LFBqrZoKkACQgHyv4I1QScwmZvyn+qM1dIy+smtpSYautDp5op7gJU
         qnmLqtZCvZASSkHNNy7A0D0Lq+4YHS8o1qh8mZqKy9m/klmLjt3nRjrdgFcpsequdAcM
         68bvJZS3B7fbvfmV7CVjmq1CQA5y9Dnva7iT4sC7/GKUycyZe8YnGsdVDD4fAqH0EZpu
         +4MWmskGe66wmsRGjCL+p7sOZp3c5ncxumEFIokiC8/9pkkiJ611StSAi+qeFkc6W7rg
         tKPX3j6S2gqIQ75Q4R9hw93RYPYdeOov2NXSgSkZTP2uzTTJbSnPUd0ri+zoJyZfjvam
         wRDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=s6uRkLrexDp9AuGMyAs7SqQv5eI0LnBw/AxscLv33eg=;
        b=XI7havV3wXyv8Kd+Wx6LYnw9uTOP0gzJirFK7hTr5LcI+rcX2pK+Z5a3uJ6tALDuxD
         IGzDMviphte3+MTdYKcKLFJfrp3prfnoWLIaG3q3ZtzewiDBHpdKw3APRsEmNlS6Ge59
         L5F+MOt1PXL8FB4Yg9OiKAet6a4ek9mer33qkdgYW9MB0Majd52TOEY1p97MWHtsK51V
         jvJVbQwK6QAd+NXI6z8yWuf2QV9B7SyR4RarWbyaS9kfp4R99m88q62sZSJBDdQtmzCg
         WOZljNP3iaKDJAe6wl2CNXBC7gIn2odR6EaBtQJ5E89PdFe3Lk6287HNJMoxkI4N6fj6
         WDdA==
X-Gm-Message-State: ACrzQf2McDlyHQGc00CVrMn9pQHBEyU7BNwaQAU8nlx8X+H1ONM/m56u
        KHkYFNLCh8fpXjYQVyw/8ZtBgE6uL7HfKffwA0c=
X-Google-Smtp-Source: AMsMyM7Xw97MlDeNMoxeK4C9Q8yZvzyx5YmMmdhCqbBrCkMO2dSAQn1JLxTtaeoCnl54hW+OljS/Ds62sezBoCwwLGw=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:0:100e:712:2923:f5c9:c5a4:11b5])
 (user=ndesaulniers job=sendgmr) by 2002:a81:a1c2:0:b0:345:350d:87a3 with SMTP
 id y185-20020a81a1c2000000b00345350d87a3mr15443885ywg.248.1663608637200; Mon,
 19 Sep 2022 10:30:37 -0700 (PDT)
Date:   Mon, 19 Sep 2022 10:30:30 -0700
In-Reply-To: <CAK7LNAT_cMLGLBz7ugaLpJD3QmZmY8FK56x9nihvWeYhJpi2ag@mail.gmail.com>
Mime-Version: 1.0
References: <CAK7LNAT_cMLGLBz7ugaLpJD3QmZmY8FK56x9nihvWeYhJpi2ag@mail.gmail.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1663608630; l=1713;
 i=ndesaulniers@google.com; s=20211004; h=from:subject; bh=cdm/EgJkMgVfXemuVsGW5smIaKhzDdLe8UcPfmZXEsM=;
 b=Y4JtRN4iXagKcRSnVdBlksOjDtas21bn99X7rSkhO86XxKEYotN6z0T6jJuHh6tAcb1hMHaGeByh
 gwoIis1HC1A4hpsZ/yK7pCa0Caqzr6Go1ZktWCvEicmd/c4rLC/s
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
Message-ID: <20220919173030.3726922-1-ndesaulniers@google.com>
Subject: [PATCH v4] Makefile.debug: set -g unconditional on CONFIG_DEBUG_INFO_SPLIT
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <llvm@lists.linux.dev>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andi Kleen <ak@linux.intel.com>,
        Dmitrii Bundin <dmitrii.bundin.a@gmail.com>,
        Fangrui Song <maskray@google.com>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Dmitrii, Fangrui, and Mashahiro note:

  Before GCC 11 and Clang 12 -gsplit-dwarf implicitly uses -g2.

Fix CONFIG_DEBUG_INFO_SPLIT for gcc-11+ & clang-12+ which now need -g
specified in order for -gsplit-dwarf to work at all.

-gsplit-dwarf has been mutually exclusive with -g since support for
CONFIG_DEBUG_INFO_SPLIT was introduced in
commit 866ced950bcd ("kbuild: Support split debug info v4")
I don't think it ever needed to be.

Link: https://lore.kernel.org/lkml/20220815013317.26121-1-dmitrii.bundin.a@gmail.com/
Link: https://lore.kernel.org/lkml/CAK7LNARPAmsJD5XKAw7m_X2g7Fi-CAAsWDQiP7+ANBjkg7R7ng@mail.gmail.com/
Link: https://reviews.llvm.org/D80391
Cc: Andi Kleen <ak@linux.intel.com>
Reported-by: Dmitrii Bundin <dmitrii.bundin.a@gmail.com>
Reported-by: Fangrui Song <maskray@google.com>
Reported-by: Masahiro Yamada <masahiroy@kernel.org>
Suggested-by: Dmitrii Bundin <dmitrii.bundin.a@gmail.com>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes v3 -> v4:
* Split into its own patch; we don't have any out of line assembler
  files using .debug_* or .cfi_* directives that would produce
  meaningful debug info in .dwo files.

 scripts/Makefile.debug | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/Makefile.debug b/scripts/Makefile.debug
index 9f39b0130551..26d6a9d97a20 100644
--- a/scripts/Makefile.debug
+++ b/scripts/Makefile.debug
@@ -1,9 +1,7 @@
-DEBUG_CFLAGS	:=
+DEBUG_CFLAGS	:= -g
 
 ifdef CONFIG_DEBUG_INFO_SPLIT
 DEBUG_CFLAGS	+= -gsplit-dwarf
-else
-DEBUG_CFLAGS	+= -g
 endif
 
 ifndef CONFIG_AS_IS_LLVM
-- 
2.37.3.968.ga6b4b080e4-goog

