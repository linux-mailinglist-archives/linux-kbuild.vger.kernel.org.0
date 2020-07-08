Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 586D721902F
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jul 2020 21:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbgGHTIM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Jul 2020 15:08:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbgGHTIM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Jul 2020 15:08:12 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF230C061A0B;
        Wed,  8 Jul 2020 12:08:11 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id k17so14735592lfg.3;
        Wed, 08 Jul 2020 12:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eBnxDaT9AjE64adFvCIMAud4hZdVgbhRxh2ErEZ+q0Q=;
        b=jp4WgtF3hRVv1VwS7F37db0nIBfYYehuilFOceEH65Kz8IX4YMyoKmNPSgYn7NSBaj
         EhX7n0cxOIGnr01QbBkbf5onbTBoXBNmJmOKMS5yHn4COPLjlFUxKEO1tjAbwvxZb4uA
         8FuRNSjl4cG16y7zNbOs5DQV5T+ucj1Q4AMc3kB5xQZNOMabWrnHLGsSP+3Ha+msSAeu
         ZDxMryIHR+TvUSj8N3NrK6qnfG6PWzkJo2yp/UPl9AfDxLFOBqnB7i4yCTzRTYUeNwk/
         WP5G37jIJBFDHsEmNRGCDLyla9t5feQPriEn4K3MrnB9rF/lVzR53dORFEnJ6CXTjpzi
         30ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eBnxDaT9AjE64adFvCIMAud4hZdVgbhRxh2ErEZ+q0Q=;
        b=HDIoy8DhGyRIwhK/DVA66GgzyyBnYoruC5xB3b7JtWH23Be3Gb+fIew3rEOPU79tUy
         3EezdyGWI8j7BRSWAt8E3BRa2GSeikxhsw7huSKPRfI5kY5lpyp34nKlCJKVIKqmIASR
         b375KqKLOq3pISvSfQkMBXOnHUZeDb2ugImw5ELmzZ/5TDDiB1W2C8FccwUK83OARJm4
         i4dXkD1h+dI1TKbkmbUgqDE6PC5vJoFAn6N372tW0YBETx49WoTHo1XYbGrnAHrlVbvW
         0AMYT4pCpPWbOoHB+Gw00gYD/3tO8OR6GxvOgeb/c3K6bmxOCVhvm7aDUgCJTDe6np2Z
         bhlw==
X-Gm-Message-State: AOAM532TJSA+GJesHRuI3RNjiw5FMYisN+/GcmHvR9dpdl7XARFoQX8h
        CxZthATgC17jjRhW//ezsF47PWakY7A=
X-Google-Smtp-Source: ABdhPJz0wNnsqin7oAMEMkHArTLN9I50Eh2YToM/QxeNv3ivY93RB9ft4KXtJa0wYI+nt28uM+/ltQ==
X-Received: by 2002:a19:c603:: with SMTP id w3mr37402448lff.28.1594235290232;
        Wed, 08 Jul 2020 12:08:10 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-147.NA.cust.bahnhof.se. [98.128.228.147])
        by smtp.gmail.com with ESMTPSA id q1sm205026lfp.42.2020.07.08.12.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 12:08:09 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     torvalds@linux-foundation.org
Cc:     akpm@linux-foundation.org, andy.shevchenko@gmail.com,
        arnd@arndb.de, emil.l.velikov@gmail.com, geert@linux-m68k.org,
        keescook@chromium.org, linus.walleij@linaro.org,
        linux-kernel@vger.kernel.org, lkp@intel.com,
        mm-commits@vger.kernel.org, rikard.falkeborn@gmail.com,
        syednwaris@gmail.com, vilhelm.gray@gmail.com,
        yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        linux-kbuild@vger.kernel.org
Subject: [PATCH] kbuild: Move -Wtype-limits to W=2
Date:   Wed,  8 Jul 2020 21:07:56 +0200
Message-Id: <20200708190756.16810-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <CAHk-=wiKCXEWKJ9dWUimGbrVRo_N2RosESUw8E7m9AEtyZcu=w@mail.gmail.com>
References: <CAHk-=wiKCXEWKJ9dWUimGbrVRo_N2RosESUw8E7m9AEtyZcu=w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

-Wtype-limits is included in -Wextra which is added at W=1. It warns
(among other things) that 'comparison of an unsigned variable `< 0` is
always false. This causes noisy warnings, especially when used in
macros, hence it is more suitable for W=2.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
See also discussion at https://lore.kernel.org/lkml/CAHk-=wiKCXEWKJ9dWUimGbrVRo_N2RosESUw8E7m9AEtyZcu=w@mail.gmail.com/

 scripts/Makefile.extrawarn | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 4aea7cf71d11..62c275685b75 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -35,6 +35,7 @@ KBUILD_CFLAGS += $(call cc-option, -Wstringop-truncation)
 # The following turn off the warnings enabled by -Wextra
 KBUILD_CFLAGS += -Wno-missing-field-initializers
 KBUILD_CFLAGS += -Wno-sign-compare
+KBUILD_CFLAGS += -Wno-type-limits
 
 KBUILD_CPPFLAGS += -DKBUILD_EXTRA_WARN1
 
@@ -66,6 +67,7 @@ KBUILD_CFLAGS += -Wshadow
 KBUILD_CFLAGS += $(call cc-option, -Wlogical-op)
 KBUILD_CFLAGS += -Wmissing-field-initializers
 KBUILD_CFLAGS += -Wsign-compare
+KBUILD_CFLAGS += -Wtype-limits
 KBUILD_CFLAGS += $(call cc-option, -Wmaybe-uninitialized)
 KBUILD_CFLAGS += $(call cc-option, -Wunused-macros)
 
-- 
2.27.0

