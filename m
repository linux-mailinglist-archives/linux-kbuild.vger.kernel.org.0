Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 541653F4127
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Aug 2021 21:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232616AbhHVTXd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 22 Aug 2021 15:23:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbhHVTXc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 22 Aug 2021 15:23:32 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02F69C061575;
        Sun, 22 Aug 2021 12:22:51 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id w5so32222912ejq.2;
        Sun, 22 Aug 2021 12:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0RIFHfz5yhdqSHvpEZZkV8wPjACBT6ytbsVRZozzO6g=;
        b=Xi+W25VC68NtwatKdL6p2mcQz6rCUo7v9s/e0itKwPk49/Br2yQig2YdSE6a//yHVA
         wwrzpAyfvxf7cRfbWIEXxvCqLngLW8sixQk4Fe4D2vZlhhHnFtRQJOQ5ax41bNMRQnYy
         wZSVFjl3+FYBLZtCK6TjPCVgm5czrpBE7C4dNo6E8RVNqcYu1jJ9XBlehv+gB982F9I3
         00OqFZFudQOuWmjJWzgkP6yeU806Se+AFcrZy13uDNSHS0gfk/cetCHao7EwEMJOtuHx
         7Kn5+BrSbl192TjfirYFTJBWEHJSHmEer9fZo0Y4WBBPLjkhteXyt7rspy4tBmJLSNcE
         OH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0RIFHfz5yhdqSHvpEZZkV8wPjACBT6ytbsVRZozzO6g=;
        b=egHtL1QBexINA1igjJwnXQes3dmbGAzJs640OpnLNC7z5uUEbL8E04lI89YmRFJ2hl
         C/l40u/13uaDeG+Qr7As76WlHJYMdf6U0Gy7NP0a2Mq4Ne5AqpLxiTcs5wfk4N+dMR2V
         0KpOcr4CV8Fw9R3p/ENbECAHnxLs/RTkAF+kEyfbzmy41Wujj8fPLw4BZl+shZYzB2U1
         zWoEwYeDt7Jk7UNennIXvXHZFGr8GhZjGzeepfJ/QvpvuRgH4Tbxm23/oElXSApnrjnP
         jjVqfqfysOrC/p70R+z+ZOFBEZBnq+h3rcejdln1FJ6c9pI8OgPLSg39k6q6L4wsyNzA
         KIFw==
X-Gm-Message-State: AOAM5300bSuRaXoxsw6PMx84noL1rpkbyg6tdQNJsi24joVfT+IYL6N8
        HYoXNbCAYypuskKA93c3/R0=
X-Google-Smtp-Source: ABdhPJz+8N+XqLOwFfb/ZJA5Kh7jD7negJZgs0PzpRuXzwKCYyCooWjoW0fX13kdaV8brr9ZD1xsBw==
X-Received: by 2002:a17:906:3054:: with SMTP id d20mr19273410ejd.294.1629660169664;
        Sun, 22 Aug 2021 12:22:49 -0700 (PDT)
Received: from localhost.localdomain ([147.235.73.50])
        by smtp.googlemail.com with ESMTPSA id o6sm1577950eje.6.2021.08.22.12.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 12:22:49 -0700 (PDT)
From:   Ariel Marcovitch <arielmarcovitch@gmail.com>
Cc:     Ariel Marcovitch <arielmarcovitch@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] checkkconfigsymbols.py: Fix the '--ignore' option
Date:   Sun, 22 Aug 2021 22:22:01 +0300
Message-Id: <20210822192205.43210-2-arielmarcovitch@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210822192205.43210-1-arielmarcovitch@gmail.com>
References: <20210822192205.43210-1-arielmarcovitch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

It seems like the implementation of the --ignore option is broken.

In check_symbols_helper, when going through the list of files, a file is
added to the list of source files to check if it matches the ignore
pattern. Instead, as stated in the comment below this condition, the
file should be added if it doesn't match the pattern.

This means that when providing an ignore pattern, the only files that
will be checked will be the ones we want the ignore, in addition to the
Kconfig files that don't match the pattern (the check in
parse_kconfig_files is done right)

Signed-off-by: Ariel Marcovitch <arielmarcovitch@gmail.com>
---
 scripts/checkkconfigsymbols.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkkconfigsymbols.py b/scripts/checkkconfigsymbols.py
index 1548f9ce4682..b9b0f15e5880 100755
--- a/scripts/checkkconfigsymbols.py
+++ b/scripts/checkkconfigsymbols.py
@@ -329,7 +329,7 @@ def check_symbols_helper(pool, ignore):
         if REGEX_FILE_KCONFIG.match(gitfile):
             kconfig_files.append(gitfile)
         else:
-            if ignore and not re.match(ignore, gitfile):
+            if ignore and re.match(ignore, gitfile):
                 continue
             # add source files that do not match the ignore pattern
             source_files.append(gitfile)
-- 
2.25.1

