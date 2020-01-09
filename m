Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E431F135997
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Jan 2020 13:56:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729295AbgAIM4e (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 Jan 2020 07:56:34 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42784 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728120AbgAIM4b (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Jan 2020 07:56:31 -0500
Received: by mail-wr1-f66.google.com with SMTP id q6so7255356wro.9
        for <linux-kbuild@vger.kernel.org>; Thu, 09 Jan 2020 04:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4ouFtmfEELWvJ13DB/hJHUscdWjOjJrZEj66Pak4s1Y=;
        b=xqx3KGA2++yS7R7TG0QaX013kZuCurED29C3mgaK4YpOHQgMXTh3VzeqcYiZZP8Rib
         NEHA0voQO6ezOb/WhLv5Sj32sc7JLUVaC4S33L6R3aJLCX8nI/GHgJ9X7t74o4LJxNTc
         R1wYVKvmF+xykpBEnXE01+nf30lNxgY9Hs+3jQrE6g9aAMd4o/QbSAbpeFRTxi9w3Ozu
         grHcFTufOto7YoQ0Uptj+Wlz4AU/462tVJ3PsyguagKTdQPzWH8wMGRh93Zgcd38Whne
         Xk9KEOOUoIn75OGZtFnLRLo64y+OKD9efik9MkCtTSTVA3QfqpYT5zmvpQu9rVBjLQQ+
         LfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4ouFtmfEELWvJ13DB/hJHUscdWjOjJrZEj66Pak4s1Y=;
        b=B+/YunLPgk/Kxg/1LuPCkgZnmcUaHHNvKvUaTL5C4obMXjsA2Jt4cmHia7/YzSkJWw
         puHT0QR19gbE4qi+YzilOfEoMsu96k+4nZhzh1N4mkDaIMnNZNUoxeXokzE5gEHMvsRq
         0pbtT4H6I066/5Pe+dYjwaC9XDvpndG5E9oEVzm+0dJMgz4Sd8VDxfM26S3ekIzqHj41
         6Q/DfVzKqL2xYJSx+2HqB4fMDVKiQm+JKQwVNf6tc6qLgv29+LrPEoIznxaBCi+DebnX
         RLtYgFyQ4EqfcIOw6qYFU+VNf7pcur0wdh9Nzxn8dWEg1U1Q7b1eV/OpHP4QShZS7zaG
         7jow==
X-Gm-Message-State: APjAAAX7Rx7aEPgBzN7DBPsShUycW4m7X9zmSi+4tLuuUG1IhCd7FaMb
        yQ8lyKpKUvokYq2fZ54VNdcdvw==
X-Google-Smtp-Source: APXvYqyidWpQLwOtKY0+Wld9OKT8eLhNt7m1m0B1gGsx5ougaUpJZEQwCZEQtepaBG9XX3KOxu4f/A==
X-Received: by 2002:a5d:6a52:: with SMTP id t18mr10371786wrw.391.1578574589653;
        Thu, 09 Jan 2020 04:56:29 -0800 (PST)
Received: from debian-brgl.home (amontpellier-652-1-53-230.w109-210.abo.wanadoo.fr. [109.210.44.230])
        by smtp.gmail.com with ESMTPSA id f207sm3163471wme.9.2020.01.09.04.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 04:56:29 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] kconfig: fix an "implicit declaration of function" warning
Date:   Thu,  9 Jan 2020 13:56:27 +0100
Message-Id: <20200109125627.24654-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

strncasecmp() & strcasecmp() functions are declared in strings.h, not
string.h. On most environments the former is implicitly included by
the latter but on some setups, building menuconfig results in the
following warning:

  HOSTCC  scripts/kconfig/mconf.o
scripts/kconfig/mconf.c: In function ‘search_conf’:
scripts/kconfig/mconf.c:423:6: warning: implicit declaration of function ‘strncasecmp’ [-Wimplicit-function-declaration]
  if (strncasecmp(dialog_input_result, CONFIG_, strlen(CONFIG_)) == 0)
      ^~~~~~~~~~~
scripts/kconfig/mconf.c: In function ‘main’:
scripts/kconfig/mconf.c:1021:8: warning: implicit declaration of function ‘strcasecmp’ [-Wimplicit-function-declaration]
   if (!strcasecmp(mode, "single_menu"))
        ^~~~~~~~~~

Fix it by explicitly including strings.h.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 scripts/kconfig/mconf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
index 49c26ea9dd98..4063dbc1b927 100644
--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -15,6 +15,7 @@
 #include <stdarg.h>
 #include <stdlib.h>
 #include <string.h>
+#include <strings.h>
 #include <signal.h>
 #include <unistd.h>
 
-- 
2.23.0

