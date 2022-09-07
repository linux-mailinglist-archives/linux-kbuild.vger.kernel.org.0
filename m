Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 966715AFB75
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Sep 2022 06:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbiIGE7j (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Sep 2022 00:59:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbiIGE73 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Sep 2022 00:59:29 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0A8B112E
        for <linux-kbuild@vger.kernel.org>; Tue,  6 Sep 2022 21:59:26 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-345753b152fso39020547b3.7
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Sep 2022 21:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=HyKr9I8MzG9kBN69CE/ANl9iOdCK/yJrqP2VJJKmtbA=;
        b=mJJdHlkWP0qiECsFlrlh4TKS0YhzeMCgS4kv9vWslSXb4Vob+X30ichTiTL9WTKgI5
         gol9O3sKAlXKI1d1of7Cx5Dpy6M7xy066hXl72LhnNeDvOPqt4fAeMBFk9P/xDlbHDD2
         UA/pc6CA6BCCHdAtX4qtkpOdFmk8fiZ2OArMTR+ncA3Yby8+sBmM+xa3oX1KJ2YzgJKa
         L3WqzmAD6s/p69GW8Di63kcHhq5ThiT5UKYWfMmqynAphjEWW/B63Rm2Ocy3RFqD/324
         TnivXmR6PypnprSSrfFTKQ6rz9V+TOXSc4HJQE//4PY20nwqS/FUvdbNY4f1mLnkixFm
         MvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=HyKr9I8MzG9kBN69CE/ANl9iOdCK/yJrqP2VJJKmtbA=;
        b=exboJa2z/dxNhVJGCa+g4GzjumVudMJ03H7dA1IoYw7J2bRA5oT27j0dmDOhboxHhd
         A7enP/ctsWx/pVGq1I2BHyhKLUu/c96gTCm4nLkrlCG6yBxyALlAfa7A9+UvDvH+wOpf
         ZMA19hPuvkzRy62a848sFMHT2ve/68WU8LREz8lHOvqEN8yr+O0YTFR4yztEiUcGaeuk
         /PHu+1hMPSm45C/IEXRyKijEPFl2lEQ4cEw0c+Unk+sMgbLZLT+uBqQ7RfNX3Skg2YQE
         Vgqrh2nwNsHy/n7aR8WA0PuoMfOuJXuV86wwGNt1kQ+W8w286GE4ZZBOrni0ZUyEgzoi
         gwuw==
X-Gm-Message-State: ACgBeo0szIBscYHnegarq04DYo3LHgYbcsZoXzV59lGFK9yI6XdV5sJo
        2wbIT+RBLpjpQTzKV/0L0P2z/4yMtOi6u14iX1Q=
X-Google-Smtp-Source: AA6agR6A3nOFVgzH/LIlkj47r/IKh6L2ey7C7N3pfYOn5TOUy3NjV0xTHyAbU1giaqkuT92t6UljPsTDaUWLkFIxjWY=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:0:100e:712:9755:c523:9dcb:2228])
 (user=ndesaulniers job=sendgmr) by 2002:a0d:f2c4:0:b0:333:560c:ee46 with SMTP
 id b187-20020a0df2c4000000b00333560cee46mr1649366ywf.109.1662526766087; Tue,
 06 Sep 2022 21:59:26 -0700 (PDT)
Date:   Tue,  6 Sep 2022 21:59:03 -0700
In-Reply-To: <20220907045907.484043-1-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20220907045907.484043-1-ndesaulniers@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1662526746; l=1808;
 i=ndesaulniers@google.com; s=20211004; h=from:subject; bh=kYGYc5XWvUdto/5QJT//gD0cOAVBQRf+GCe08dKvohM=;
 b=QJ3sqizOMx1/LC5t2cVcxIGdd+h2qlDiVbAXaw+l/z2ysUwiRHXCM6y0Rhd2/XAI2e9D/+A9TzOz
 sLMzCcW9BimZSDyDaerFZtig2p3NctS62ufemI2LaTKtXaET2zUe
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220907045907.484043-2-ndesaulniers@google.com>
Subject: [PATCH v3 1/5] x86/boot/compressed: prefer cc-option for CFLAGS additions
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Tom Rix <trix@redhat.com>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev, x86@kernel.org,
        Dmitrii Bundin <dmitrii.bundin.a@gmail.com>,
        Fangrui Song <maskray@google.com>,
        Alexey Alexandrov <aalexand@google.com>,
        Bill Wendling <morbo@google.com>,
        Greg Thelen <gthelen@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arvind Sankar <nivedita@alum.mit.edu>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

as-option tests new options using KBUILD_CFLAGS, which causes problems
when using as-option to update KBUILD_AFLAGS because many compiler
options are not valid assembler options.

This is being fixed in a follow up patch. Before doing so, move the
assembler test for -Wa,-mrelax-relocations=no from using as-option to
cc-option.

Cc: Arvind Sankar <nivedita@alum.mit.edu>
Cc: x86@kernel.org
Link: https://lore.kernel.org/llvm/CAK7LNATcHt7GcXZ=jMszyH=+M_LC9Qr6yeAGRCBbE6xriLxtUQ@mail.gmail.com/
Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes v2 -> v3:
* Reword commit message as per Nathan.
* Pick up Nathan's RB/TB tags.

Changes v1 -> v2:
* Split off of v1 [1/3].
* Use cc-option to update CFLAGS, as per Masahiro.
* Add Masahiro's Suggested-by, Cc Arvind.

 arch/x86/boot/compressed/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index 35ce1a64068b..85934204d905 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -49,7 +49,7 @@ KBUILD_CFLAGS += $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
 KBUILD_CFLAGS += -fno-asynchronous-unwind-tables
 KBUILD_CFLAGS += -D__DISABLE_EXPORTS
 # Disable relocation relaxation in case the link is not PIE.
-KBUILD_CFLAGS += $(call as-option,-Wa$(comma)-mrelax-relocations=no)
+KBUILD_CFLAGS += $(call cc-option,-Wa$(comma)-mrelax-relocations=no)
 KBUILD_CFLAGS += -include $(srctree)/include/linux/hidden.h
 
 # sev.c indirectly inludes inat-table.h which is generated during
-- 
2.37.2.789.g6183377224-goog

