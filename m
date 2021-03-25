Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 435C3348804
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Mar 2021 05:42:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbhCYEmG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Mar 2021 00:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbhCYElr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Mar 2021 00:41:47 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AD05C061760
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Mar 2021 21:41:47 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id l76so571250pga.6
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Mar 2021 21:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5uloYZ+8PoxiaTnT5ukVkjxfChFSHEatXuJ9cHkJu9M=;
        b=hiXjI1myZwfoNGPp8+hjoNraAb1rNgkpcycqeWl6te88OdvHNMzTyy2EXiOWpYLwqa
         tUcRJy5ZN8PVSzhTb65he/NhsLMlJ79gStqExtVfHNxh7aQjOv8KQIDBEgwVnbt5udd6
         TZye8a8LrUbvmg6Ibe9OB8HoNwZSPoDq2I+ckdjbgsn5tpchFEzeG4H7ISepWWx1MWNt
         jPhGOSazVVFfSDPJuCdn7Cee8nO/bKvtf5fVNTg5iUevomqJdUrqg51maIUQVbWp3ERt
         nOAD5S38C3rTPevGOeR3kJMlfPJrZ8Rtk4LjW5g6VsqRPgaAKJXRCUC2WMMJ7fM8HrAi
         urpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5uloYZ+8PoxiaTnT5ukVkjxfChFSHEatXuJ9cHkJu9M=;
        b=h8JPezF04vv1sDswej63GNjt1HX+pPyAihduDNiEJLr3fM9u6ih940oUYUJpPiNGtn
         uZA697PrpVCv1yjS2+la+SiTG1oX6eYeU4KPc0bT7jxJzuCV2jhOqU23V+NYkWBuQ1Hk
         VfuHdRX0pCCICTp389rriWovF4OnUf05BGC8YofL2qQ0zNEOkOK07zueIqKPutB5leiA
         GH2unVnp9qXXBv6uldXp49UY2Y11+PrMfjl2oxNnHWHKpidx9DAPzetMgg6Ju1vpnHVe
         1+mX3YuDoQxz+WhNdWShLrw9OdO91b5sF6QnP5apG+1AzsFfBkTO0hxGNBcm2ybNf+B7
         eUTQ==
X-Gm-Message-State: AOAM532/xgx7hwyShlndVRJi4PZ3nwwBpXNiUjgvcFbLIZyEaS9tT5+N
        t/4eitINQlYPK4010s2xDRLSX7+J8ld/dg==
X-Google-Smtp-Source: ABdhPJwaLPUoL4onWYWyHitcJn5dQ/575KUKsL+MTUrspH3NCsoeS4ULL4NojHZ92suFEhnN1JHj/Q==
X-Received: by 2002:a65:62d9:: with SMTP id m25mr6013481pgv.6.1616647306354;
        Wed, 24 Mar 2021 21:41:46 -0700 (PDT)
Received: from localhost ([122.172.6.13])
        by smtp.gmail.com with ESMTPSA id fa21sm3997449pjb.25.2021.03.24.21.41.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Mar 2021 21:41:45 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Bill Mills <bill.mills@linaro.org>, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V4] kbuild: Add rule to build .dt.yaml files for overlays
Date:   Thu, 25 Mar 2021 10:11:37 +0530
Message-Id: <4f50cfd94a43a03e107f83fadd02cd6be7b422e3.1616647039.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <20210324223713.1334666-1-frowand.list@gmail.com>
References: <20210324223713.1334666-1-frowand.list@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The overlay source files are named with .dtso extension now, add a new
rule to generate .dt.yaml for them.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V4:
- Rebase over Frank's cleanup patch:

  https://lore.kernel.org/lkml/20210324223713.1334666-1-frowand.list@gmail.com/

- Drop changes to drivers/of/unittest-data/Makefile.
- Drop modifications to the rule that builds .dtbo files (as it is
  already updated by Frank).

 scripts/Makefile.lib | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 814b430b407e..a682869d8f4b 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -376,6 +376,9 @@ endef
 $(obj)/%.dt.yaml: $(src)/%.dts $(DTC) $(DT_TMP_SCHEMA) FORCE
 	$(call if_changed_rule,dtc,yaml)
 
+$(obj)/%.dt.yaml: $(src)/%.dtso $(DTC) $(DT_TMP_SCHEMA) FORCE
+	$(call if_changed_rule,dtc,yaml)
+
 dtc-tmp = $(subst $(comma),_,$(dot-target).dts.tmp)
 
 # Bzip2
-- 
2.25.0.rc1.19.g042ed3e048af

