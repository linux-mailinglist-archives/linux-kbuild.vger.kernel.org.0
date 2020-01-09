Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF43135DFB
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Jan 2020 17:16:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387545AbgAIQQp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 Jan 2020 11:16:45 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40427 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387562AbgAIQQm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Jan 2020 11:16:42 -0500
Received: by mail-wr1-f65.google.com with SMTP id c14so8001121wrn.7
        for <linux-kbuild@vger.kernel.org>; Thu, 09 Jan 2020 08:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w5QGDEHKxAn+Hv62tvlVvyCz66mJI7DRO74dgEr16y0=;
        b=Ujg8DvRybkohbaqX+o3hIGbj8woxpSvKKK9B2Rr0B3VfdQPeCpYXnqLsJAWrVkJCpb
         akFPRx0ELEa1ezOxVajKD1RQknIwpEqG+QmDDoPdLnbSv8CvTuAeSo/pqiA3D82P9pH0
         4Ar42/NrT0ok4xcR9Ef4cM0a4aHq8QSgh155dsT3cHYl+ciXsod+1Wkx8JfeVJn4eHgn
         n2hPcIbVQOyqc0A8SdEypJgKkhjgUjIg1j7AeSuCX8Rh0wKB2NvUSp0d8+F8SKmI+9e9
         FRHWNwaqKHb0RvcqM0DyYqYxjWSZUMxzmOo64RqqSLzeNC/WwS8DLiBiNAMMWAaFmsg3
         CPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w5QGDEHKxAn+Hv62tvlVvyCz66mJI7DRO74dgEr16y0=;
        b=d2hpV2JLDwMBc3rN3HAw3Ex+k3w/HUxNc9rMmvrHR5VTmkHwHIk3tlcYEXCdec/Cxy
         uJ117Ji01R9fG3m6ZPFuVyMxFYhupr+XRdCN59TZGscnzcEwwydM2o00LnCe/KI5HKyI
         IL01uBjQlGaWEga4mKg58/Km+grcEHamYHDRYUaBP+sf7kdCl3MoQFRscvRh+jU1ECHG
         mIJrkq6e8FIdINBv+Lc/3MGh59fvog+nPzOKIxwJTM+12WJ/ztlZoDFRPrPDwn4j/9qs
         NyPNenJiK8DWz/lSlPACdNesy1L7p+trExAAY0ijcTBMwbh67AGZAEcNI6dULO2GsOx5
         coLw==
X-Gm-Message-State: APjAAAUyqPukjAJ65RJv2yEW0787PmIedL/AUnGcsbPBIBCdXfyHxak4
        ZHrp/E1L3yRw0D3L+gFWxk53+0AOfzM=
X-Google-Smtp-Source: APXvYqxhdKuYfCwow4RaHNZFhjGFfg692/ra50nSJkUS2euQhPPvWGr6ffNLIg5t8L3beLkZ6RHkcw==
X-Received: by 2002:a5d:6b47:: with SMTP id x7mr6063591wrw.277.1578586599981;
        Thu, 09 Jan 2020 08:16:39 -0800 (PST)
Received: from debian-brgl.home (amontpellier-652-1-53-230.w109-210.abo.wanadoo.fr. [109.210.44.230])
        by smtp.gmail.com with ESMTPSA id l19sm3283141wmj.12.2020.01.09.08.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2020 08:16:39 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2] kconfig: fix an "implicit declaration of function" warning
Date:   Thu,  9 Jan 2020 17:16:36 +0100
Message-Id: <20200109161636.9362-1-brgl@bgdev.pl>
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
 scripts/kconfig/gconf.c | 1 +
 scripts/kconfig/mconf.c | 1 +
 scripts/kconfig/nconf.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index e36b342f1065..5527482c3077 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -18,6 +18,7 @@
 
 #include <stdio.h>
 #include <string.h>
+#include <strings.h>
 #include <unistd.h>
 #include <time.h>
 
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
 
diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index b7c1ef757178..daf1c1506ec4 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -8,6 +8,7 @@
 #define _GNU_SOURCE
 #endif
 #include <string.h>
+#include <strings.h>
 #include <stdlib.h>
 
 #include "lkc.h"
-- 
2.23.0

