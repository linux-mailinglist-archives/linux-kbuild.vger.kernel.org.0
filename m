Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53A907323C2
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Jun 2023 01:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbjFOXkr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Jun 2023 19:40:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbjFOXkq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Jun 2023 19:40:46 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF1F22944
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Jun 2023 16:40:44 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f8f45d7bc7so63885e9.3
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Jun 2023 16:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686872443; x=1689464443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WJ+q1wtWhnhJW4zl7FiSFodYMl7beriAHvha3HJuYwQ=;
        b=ff6yWHuhR8ygWkXS5/I4XmMOi5VsyViNx85SOFK9hLhwHJs8OOZoiUOUWm64Ws3Xod
         FkckVQ6li/KLN7o48WVN1yQF4ak0kWjAZAkloxjlb9fGVTf6ARnDzRtuE++RbVCEv8Na
         Hw3Jaz2LsSYRufjEY2zucRyB8uLwS78BCcWiGt17IVYl7bu+Ueluu2+mvjNBAhqJ0gxq
         7D/avI9A2gOtFe5WMfy1cHBpUL4Brc7GJxxCXeri7ynwfzn+yKongps1FKGPIHUTZGS4
         I400i5G+7xKJ1MyMZ0wZvVDbkneC+WeVvuXY1dAxyQWZmzgV85mM8BqBRkmo7J+e63TD
         65Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686872443; x=1689464443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WJ+q1wtWhnhJW4zl7FiSFodYMl7beriAHvha3HJuYwQ=;
        b=C1v3GN03lwfSgSVCo3oRvf22EOXpvgM8Fke7XLiF393I6OBtGc8iCxTGzb0Qj3rsEo
         B/QpJU3uCWNfIIDvp7O3eMy6pvy9srI3lYebQZXLuPamGl+IXi7e55JxhMD9+OeUFPUh
         AjifpG39etuUAB4vJ14reMnrEHC8JW6Gy+JKTsNJVQ99vFhdYDuU4PbPIMkEQI/SBuDD
         dAQzKforvyi30tPhfbVfYhqxaKfLSwbVXb/jookP+CnjwE/lOQc0dqWDOWvmoHFuEEr6
         oD8N6JhRBaqEurEMMnZPMBgWPfjwvvNbMamPqkh8+/7JLTWpp5wGKpxSkOiJLAMXoe6J
         LIUw==
X-Gm-Message-State: AC+VfDzTQO6piRGNRAOWJ3qwH7QT/Q+1lZn5viF7AABuK2OBhxQbJ+1v
        x4BjBflcr0jsYBsxwyb9KWtcM0GqIGVnmZ4P
X-Google-Smtp-Source: ACHHUZ6oIB39/csi7k0MiCeefAy0FQ7SoHtciTSuYxGJ4FMoYP/gTm9oTmWPApDHidlv8tqUamcNpQ==
X-Received: by 2002:a1c:7c1a:0:b0:3f6:496:e240 with SMTP id x26-20020a1c7c1a000000b003f60496e240mr461251wmc.27.1686872442662;
        Thu, 15 Jun 2023 16:40:42 -0700 (PDT)
Received: from localhost.localdomain ([146.70.132.158])
        by smtp.gmail.com with ESMTPSA id t12-20020a1c770c000000b003f80b96097esm476390wmi.31.2023.06.15.16.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 16:40:41 -0700 (PDT)
From:   Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
To:     linux-kbuild@vger.kernel.org
Cc:     masahiroy@kernel.org, devzero@web.de,
        Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
Subject: [PATCH v4] script: modpost: emit a warning when the description is missing
Date:   Fri, 16 Jun 2023 01:40:37 +0200
Message-ID: <20230615234037.244446-1-vincenzopalazzodev@gmail.com>
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

Sorry the version 3 is wrong, there is no reason 
to wrap the if under the `W`.

Reported-by: Roland Kletzing <devzero@web.de>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=10770
Signed-off-by: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
---
 scripts/mod/modpost.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index d4531d09984d..0cdf8d655bd3 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1818,6 +1818,8 @@ static void read_symbols(const char *modname)
 		}
 	}
 
+	if (extra_warn && !get_modinfo(&info, "description"))
+		warn("missing MODULE_DESCRIPTION() in %s\n", modname);
 	for (sym = info.symtab_start; sym < info.symtab_stop; sym++) {
 		symname = remove_dot(info.strtab + sym->st_name);
 
-- 
2.41.0

