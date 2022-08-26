Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96DF65A2E11
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Aug 2022 20:11:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344945AbiHZSLR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 26 Aug 2022 14:11:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344987AbiHZSLA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Aug 2022 14:11:00 -0400
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 467C5D34E3
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Aug 2022 11:10:56 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-33dce8cae71so36988927b3.8
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Aug 2022 11:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=CWU/c+Z/T3afmWH8jUSRUPrlGa0DK6zNkVSVmthE7JY=;
        b=J+AQGYjSJRFoIHL2qT5xdAZvDrv7rB5xy/XhHbqmf4gaE97fgjZ/gsV7Bj3BJxJ6C+
         FPRauz+dGA3SM+kwveIWXCZxJ7Lo09AWQQ48FIY0hXIPvqLTUVr2mNyYvf0+hQLa5dRB
         p8jEAl2BGy5VXM7O9Hc7ChpszUItzykwB158shIdBODNy334KmOa7Wmpm6E3iQQ83TJt
         32XwyG0fmLqJ039OynjBFyJqv8N2DKehM8g7IugjxRi7bq5yo9SZ8Eas2ju1LuPB7ou7
         0OJ42v4NsHKPhivZjHIYd0OnMbrCqPgaGPj8gsCuamCPEeSNl4fyigNCj8s3DLHyhH42
         ztVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=CWU/c+Z/T3afmWH8jUSRUPrlGa0DK6zNkVSVmthE7JY=;
        b=IG5DkXxfYzrfSxCA8dzLt5MRzzl5ctNBSwvGDmvusHEtSv7csIaWjIm10Zx0oMWbQa
         O088x4A+rukcE6siTXmlLgVopHwiYp9q8h5Ko8aQ8We1YzuqlxzZIFJwLYWM+BPkPSgT
         PqhzuYsQqaDUioYNY9l4JtbYHwQV6RtF3J0ZZvbNspOmZ6V45O83w17c/gzKZWINQELo
         JvZM2zp44Vi9WbEyv+41xo9vnky6p40K0GM/mK+3WBPFxac+mMN8UQbOyrr+D5kXykxp
         sb6bSsQTOTyPv6lsxY+12n6SHad5WxUY1Jvb2W04cHjCGVp0qUD2EG1LlG+/kvivSHcJ
         Rnag==
X-Gm-Message-State: ACgBeo0vlmUTNhFpi6HDjUPkY++5PNW+wPkJD28tTTv7x0ynrh3lDTdC
        vU72fUe0wH/U3IVJJDy15n1xAuuZkUudFXNIn1M=
X-Google-Smtp-Source: AA6agR5zI4BE0SfjNUKDcGZ6Xb4IGuI7GBSJB6t0ufhMUW2iZNyRbbuavTdHsFVco3HP2hlWhORE8Awb5dEsiQIyeEs=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:0:100e:712:8d7b:b933:5438:2a88])
 (user=ndesaulniers job=sendgmr) by 2002:a25:8e84:0:b0:696:466c:baa with SMTP
 id q4-20020a258e84000000b00696466c0baamr798614ybl.604.1661537455239; Fri, 26
 Aug 2022 11:10:55 -0700 (PDT)
Date:   Fri, 26 Aug 2022 11:10:35 -0700
In-Reply-To: <20220826181035.859042-1-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20220826181035.859042-1-ndesaulniers@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1661537435; l=1289;
 i=ndesaulniers@google.com; s=20211004; h=from:subject; bh=KFmDrL6BvTknKQovEEq6T3GFbpZs3ibjX3HcMW2RbEw=;
 b=HAVmPHDoSpY2S9bAFO1KTHzp0jMYkmspk0Y0zWNA/klCy1NkTBTvFdbFEPvTjqH5HFwy7nCPzrDJ
 2mGy2RsICFikIgnIL9rPA36Q4SDd51mgrcFdoNpQ/CPxtlHcT01h
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220826181035.859042-4-ndesaulniers@google.com>
Subject: [PATCH 3/3] Makefile.debug: set -g unconditional on CONFIG_DEBUG_INFO_SPLIT
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
        Nick Desaulniers <ndesaulniers@google.com>
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

Dmitrii, Fangrui, and Mashahiro note:

  Before GCC 11 and Clang 12 -gsplit-dwarf implicitly uses -g2.

Fix CONFIG_DEBUG_INFO_SPLIT for gcc-11+ & clang-12+ which now need -g
specified in order for -gsplit-dwarf to work at all.

Link: https://lore.kernel.org/lkml/20220815013317.26121-1-dmitrii.bundin.a@gmail.com/
Link: https://lore.kernel.org/lkml/CAK7LNARPAmsJD5XKAw7m_X2g7Fi-CAAsWDQiP7+ANBjkg7R7ng@mail.gmail.com/
Link: https://reviews.llvm.org/D80391
Reported-by: Dmitrii Bundin <dmitrii.bundin.a@gmail.com>
Reported-by: Fangrui Song <maskray@google.com>
Reported-by: Masahiro Yamada <masahiroy@kernel.org>
Suggested-by: Dmitrii Bundin <dmitrii.bundin.a@gmail.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 scripts/Makefile.debug | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.debug b/scripts/Makefile.debug
index a7a6da7f6e7d..0f9912f7bd4c 100644
--- a/scripts/Makefile.debug
+++ b/scripts/Makefile.debug
@@ -1,10 +1,8 @@
-DEBUG_CFLAGS	:=
+DEBUG_CFLAGS	:= -g
+KBUILD_AFLAGS	+= -g
 
 ifdef CONFIG_DEBUG_INFO_SPLIT
 DEBUG_CFLAGS	+= -gsplit-dwarf
-else
-DEBUG_CFLAGS	+= -g
-KBUILD_AFLAGS	+= -g
 endif
 
 ifdef CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
-- 
2.37.2.672.g94769d06f0-goog

