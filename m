Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A5FD668ADA
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Jan 2023 05:29:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbjAME3Y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 12 Jan 2023 23:29:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235865AbjAME2A (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Jan 2023 23:28:00 -0500
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C51B63F7F
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Jan 2023 20:24:05 -0800 (PST)
Received: by mail-qt1-x82f.google.com with SMTP id j15so12767398qtv.4
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Jan 2023 20:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pefoley.com; s=google;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a8cMX5GKPoKccxTchBsyHZnq0OSj1O4A8nPHn9d7V1o=;
        b=cEzlVZuKDq6nSLB5AsQv7c3tUmjzqTPS7Xk50PEH7tr5n4xPcj226rGJDLHQmzhhlC
         fLcu0xB5uC+2eHmhurFzh7li6/vOjJDvltDRG1C3FlRinOZcZLDPvWS9Hue6cMFOeYhu
         IUC/7TvVHTCHa9KHfF5kh8vLlCHqmyojTTI7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8cMX5GKPoKccxTchBsyHZnq0OSj1O4A8nPHn9d7V1o=;
        b=kPFagUTY83GyNok2a4RjqiMqgdvpNCLfsViEpcoKtlpnXywMZH1ehbXriKLJo+frqN
         81xmXWfq5jlm3NyLttjkvSbQsPGY8zZOnrlX5TIUuwlxbcUhc4I9RPkb5XOA6LMsSlOy
         zVtmwTifrM+Uh11knQkR0kEY+qkA/I0Zf4KTwEV5WWxCvRbTym62VonAlCBUPFtmtf5Y
         uRwm8di+v1QGsqW77KETJ4dEEeeC6wCyQjJxlJq13zNPhd3mYTqVH4m1pDIVORs9/M7u
         MiKhfgDfxsS/aBlD1+u7YsxarQhj8hIqwiksuphOiTAZBUryZySgBLypBNUb/+FP+Hym
         Wm7A==
X-Gm-Message-State: AFqh2koSX1t1HgkkIdZ0bbATEWrjOJ1Y6STKYZvI1jxJ3rmOvcL4KBcW
        7UoTFXrWX4sNnpElC4DTyAhDyA==
X-Google-Smtp-Source: AMrXdXuk/2VbFdKDGoSU5ikKdNECWKlx3bErDZk3CR5OU8//P0jIKD3q+cXgNdTDttB9Oow6AlqywA==
X-Received: by 2002:ac8:4245:0:b0:3a9:8082:8991 with SMTP id r5-20020ac84245000000b003a980828991mr108105845qtm.5.1673583844230;
        Thu, 12 Jan 2023 20:24:04 -0800 (PST)
Received: from [192.168.1.3] ([2600:4040:29fb:d300:887b:7eff:fe74:68b2])
        by smtp.gmail.com with ESMTPSA id k19-20020a05620a415300b006feb0007217sm11943251qko.65.2023.01.12.20.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 20:24:03 -0800 (PST)
From:   Peter Foley <pefoley2@pefoley.com>
Date:   Thu, 12 Jan 2023 23:23:59 -0500
Subject: [PATCH v2] kconfig: Update all declared targets
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230111-kconfig-v2-1-b000fb6bc902@pefoley.com>
X-B4-Tracking: v=1; b=H4sIAN/cwGMC/2WNwQ6DIBBEf8XsuTQsVht78j8aD0gX3bSCAUNqj
 P9e9Nrjm3mZ2SBSYIrwKDYIlDiydxnUpQAzajeQ4FdmUFKVEhHF23hneRBUNabG6mYrWUO2ex1J
 9EE7Mx7+pONC4SjmQJa/58WzyzxyXHxYz8eER/o/nlCg0I1CK8v6Lq1sZ7L+Q+vV+Am6fd9/lhn
 EWrkAAAA=
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Foley <pefoley2@pefoley.com>
X-Mailer: b4 0.11.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1673583843; l=2116;
 i=pefoley2@pefoley.com; s=20230111; h=from:subject:message-id;
 bh=WaQ502LRc6wim0lifNuPK58lYVRIxl6hVD2L1oqMFjs=;
 b=9JF4YbvwTwZ+nyLIjEDj692RkbTsfUlGmx45E/OtkHNOXhCgwoysxLYn/Byir6Z0HX0JQpuk3QRT
 es5M+4GnBkHhw7zwFIIOmVzR2IsEMbqWmLQdaby0Tn1sXroxTTA0
X-Developer-Key: i=pefoley2@pefoley.com; a=ed25519;
 pk=DCQqIdN6rHnvfQH58WQiQzJFfGUo1HyWSvdYG8vnO5o=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently qconf-cfg.sh is the only script that touches the "-bin"
target, even though all of the conf_cfg rules declare that they do.
Make the recipe unconditionally touch all declared targets to avoid
incompatibilities with upcoming versions of GNU make:
https://lists.gnu.org/archive/html/info-gnu/2022-10/msg00008.html

e.g.
scripts/kconfig/Makefile:215: warning: pattern recipe did not update peer target 'scripts/kconfig/nconf-bin'.
scripts/kconfig/Makefile:215: warning: pattern recipe did not update peer target 'scripts/kconfig/mconf-bin'.
scripts/kconfig/Makefile:215: warning: pattern recipe did not update peer target 'scripts/kconfig/gconf-bin'.

Signed-off-by: Peter Foley <pefoley2@pefoley.com>
---
Changes in v2:
- Update pattern rule to touch -bin instead of each script.
- Add missing gitignore entries.
- Link to v1: https://lore.kernel.org/r/20230111-kconfig-v1-1-a921f03670f0@pefoley.com
---
 scripts/kconfig/.gitignore | 2 +-
 scripts/kconfig/Makefile   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/.gitignore b/scripts/kconfig/.gitignore
index c8a3f9cd52f0..f8bdf0cf4662 100644
--- a/scripts/kconfig/.gitignore
+++ b/scripts/kconfig/.gitignore
@@ -3,5 +3,5 @@
 /[gmnq]conf
 /[gmnq]conf-cflags
 /[gmnq]conf-libs
-/qconf-bin
+/[gmnq]conf-bin
 /qconf-moc.cc
diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 0b1d15efaeb0..af1c96198f49 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -209,7 +209,7 @@ $(obj)/gconf: | $(obj)/gconf-libs
 $(obj)/gconf.o: | $(obj)/gconf-cflags
 
 # check if necessary packages are available, and configure build flags
-cmd_conf_cfg = $< $(addprefix $(obj)/$*conf-, cflags libs bin)
+cmd_conf_cfg = $< $(addprefix $(obj)/$*conf-, cflags libs bin); touch $(obj)/$*conf-bin
 
 $(obj)/%conf-cflags $(obj)/%conf-libs $(obj)/%conf-bin: $(src)/%conf-cfg.sh
 	$(call cmd,conf_cfg)

---
base-commit: e8f60cd7db24f94f2dbed6bec30dd16a68fc0828
change-id: 20230111-kconfig-e59c6154f506

Best regards,
-- 
Peter Foley <pefoley2@pefoley.com>
