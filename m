Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03B817323B4
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Jun 2023 01:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbjFOXfB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Jun 2023 19:35:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjFOXfB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Jun 2023 19:35:01 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E304B3
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Jun 2023 16:35:00 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b44eddb52dso296601fa.3
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Jun 2023 16:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686872098; x=1689464098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H2tqtMVsz3mB4DrgpzDp0Py8EDZbf6T+ZfvwoV3HdBk=;
        b=gVdzEJ2OT8/wWlEEYsR9qOX+oJX4XtK/ugzf/gDJpP99tum6yPpaDoLSmlWiYEta35
         8jNF1BeuJOJhTOjjC51KYVBLr3+SLOFmEnodY6A9xJwODBCMynL07WXGg9DOv1DcuSef
         7SDaL1ioo/k1VXXrD4FPxdOL4IEPikEgKR1l77+13mH9kOe+KVVcHbffGdQSpJryAGt6
         Ms3J0g0Ju2Evx4OMiWVmDFD8GIqA+a2jsVh66Jbdx6P1Bc1zULTeuzR/PB5J3uCRFqDx
         8zaf2tPhwwYLiHDsRUyJmvtuQqE2ZiqTFZgt6pOrONUedawqE1MzDXYqUuLQZb1nblSL
         5r4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686872098; x=1689464098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H2tqtMVsz3mB4DrgpzDp0Py8EDZbf6T+ZfvwoV3HdBk=;
        b=eLvZF0N79GlHmvgLx1/JljdJQzD0YxhESxTEHxdiMLcFMcwkB9xoIplJ8ET/hCAKDd
         3X9wrQ5klaAf/iUW/m+gQuuz9lwlzdLg/aPKf0toaXSuP8GGwQdJvwZkAH0JUSnvU5uG
         wQhk9ex27uPhMo5H/V+ukJZx8xi7l98RqpjG6jO7TThEFxsAV8Gj0jDOUWwZKJZLX2sQ
         71CgaPJgnCrLKKuaW5tSy9eK70hcO72DGv6iHBc5T8fibjh10NQI9YoB5isYitGv1dJI
         6/K57cckG8eipsFp0mShxzMzRr75/q5PtGRwHEgxwXmmwfAJxdBnTcn7qUoXajdcIf+i
         3u9g==
X-Gm-Message-State: AC+VfDxTPO6uVQxQmvQQLbOrXVGn0K4cPklRmBGce2euHWZ3J4lP6QQp
        ws1JQQ6EIjsP6EOrf2tGPJhHAuxrwfGNTknu
X-Google-Smtp-Source: ACHHUZ6BA94A4Q+dQKPH20KVCF+oRtjlrnDesVPwA4SQ1mWWMk1BXEXxDvc2FheJrlR3nAXe3FX4Wg==
X-Received: by 2002:a2e:a40d:0:b0:2b1:fdcc:3c5d with SMTP id p13-20020a2ea40d000000b002b1fdcc3c5dmr492142ljn.48.1686872097435;
        Thu, 15 Jun 2023 16:34:57 -0700 (PDT)
Received: from localhost.localdomain ([146.70.132.158])
        by smtp.gmail.com with ESMTPSA id 21-20020a05600c029500b003f8d80ecc4bsm451023wmk.34.2023.06.15.16.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 16:34:55 -0700 (PDT)
From:   Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
To:     linux-kbuild@vger.kernel.org
Cc:     masahiroy@kernel.org, devzero@web.de,
        Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
Subject: [PATCH v3] script: modpost: emit a warning when the description is missing
Date:   Fri, 16 Jun 2023 01:34:49 +0200
Message-ID: <20230615233449.242021-1-vincenzopalazzodev@gmail.com>
X-Mailer: git-send-email 2.41.0
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

Emit a warning when the mod description is missed and only
when the W=1 is enabled.

Based on top: https://patchwork.kernel.org/project/linux-kbuild/patch/20230606094159.1910369-1-masahiroy@kernel.org/

Reported-by: Roland Kletzing <devzero@web.de>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=10770
Signed-off-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
---
 scripts/mod/modpost.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index d4531d09984d..8795af0edba8 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1818,6 +1818,10 @@ static void read_symbols(const char *modname)
 		}
 	}
 
+#ifdef WARN
+	if (extra_warn && !get_modinfo(&info, "description"))
+		warn("missing MODULE_DESCRIPTION() in %s\n", modname);
+#endif
 	for (sym = info.symtab_start; sym < info.symtab_stop; sym++) {
 		symname = remove_dot(info.strtab + sym->st_name);
 
-- 
2.41.0

