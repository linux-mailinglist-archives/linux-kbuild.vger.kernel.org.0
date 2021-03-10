Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A378D33356E
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Mar 2021 06:36:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232291AbhCJFgC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Mar 2021 00:36:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbhCJFfo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Mar 2021 00:35:44 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 059DCC061761
        for <linux-kbuild@vger.kernel.org>; Tue,  9 Mar 2021 21:35:44 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id mz6-20020a17090b3786b02900c16cb41d63so6852309pjb.2
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Mar 2021 21:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=58ajQUMstgxJpl1y7+plBGF8oswQUABpiSuFMrlXVDw=;
        b=Gatl9fDXJsX2otJIyfsCenFRWp4RaeSe7afqLDmTg3sAZgfT1nT4Z7QE3fFB+aGYDJ
         jr0Nn56Bv3K56/lG31IfG6BkIwSuph+RxJNHsX4huviBqD/WPs6g2KW+ByI+xzdGWiFh
         50JgmqybmTwwFdyjJNV2BaxlX/mTWbTGLCwCYx2OM+u6WptSAX6V3RHIqmoM93V44Pf1
         uH4ZDuJT+JIDAPjqb85/GD/fKhpLxGAy5lSBFOgVb3E/sNoJKXZfRRgzzS6vFUxZdk+N
         pqIiYy0i2oDi9r+t2BTIiA+UYKnaDC6HxXpw11TjWvbBdhOEdZiwwEZ+lz21yLytJ8d1
         iDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=58ajQUMstgxJpl1y7+plBGF8oswQUABpiSuFMrlXVDw=;
        b=lJuFoSCppYN8gvIC9Ip1NfB/rcY8izRG+1BIvst2GOqNsLomP1Rs/7T74wM8/OJ3HB
         hck/irQNUaPnJ7hvC3NI3k+Yb2t2mC8nkgyuiFUum2j4EIq+hvoF7ztr68YLozeTZu33
         BFAYDXlYUhZsF+swL1+kEdfRxnKqvdY9dQw23enrelQprM2HQPXpdzaMNez5x6Xlj9f+
         qxH/LmRuVJCcxPIvvAOBqdvAUR/SuezE+kQBxpKCGW8vxGTfYzsldxNEobiXyxqWjokf
         z/g/DeBru0hzo607QU634QFASNY+QkrovPnRxlDsoCBi1SvANCfUyE2sGDrMfnGKPKb3
         vcxw==
X-Gm-Message-State: AOAM530b2inR01Erph58fSg0EBFTECoNECLPt6LGrP/Y+IETTBUXQkxc
        8VQUZdHveb4T0FOdZ7ZzYGjwtw==
X-Google-Smtp-Source: ABdhPJzHKK6EkBZ2INcVds8+1R9+JzZpjkhb03MlFG020tmpPs7TxV6fYZEOxJ7GbTXMDk+qDUyegA==
X-Received: by 2002:a17:90b:388d:: with SMTP id mu13mr1793397pjb.34.1615354543607;
        Tue, 09 Mar 2021 21:35:43 -0800 (PST)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id a22sm8261001pgw.52.2021.03.09.21.35.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Mar 2021 21:35:43 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Frank Rowand <frowand.list@gmail.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        anmar.oueja@linaro.org, Bill Mills <bill.mills@linaro.org>,
        Rob Herring <robh@kernel.org>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V11 2/5] kbuild: Add generic rule to apply fdtoverlay
Date:   Wed, 10 Mar 2021 11:05:30 +0530
Message-Id: <20920b0df6b067aca4040459a9677d7d1d6d766a.1615354376.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1615354376.git.viresh.kumar@linaro.org>
References: <cover.1615354376.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Rob Herring <robh@kernel.org>

Add a generic rule to apply fdtoverlay in Makefile.lib, so every
platform doesn't need to carry the complex rule. This also automatically
adds "DTC_FLAGS_foo_base += -@" for all base files.

The platform's Makefile only needs to have this now:

 foo-dtbs := foo_base.dtb foo_overlay1.dtbo foo_overlay2.dtbo
 dtb-y := foo.dtb

We don't want to run schema checks on foo.dtb (as foo.dts doesn't exist)
and the Makefile is updated accordingly.

Acked-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Rob Herring <robh@kernel.org>
Co-developed-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 scripts/Makefile.lib | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index a2658242d956..bc045a54a34e 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -75,11 +75,24 @@ always-y += $(userprogs-always-y) $(userprogs-always-m)
 # If CONFIG_OF_ALL_DTBS is enabled, all DT blobs are built
 dtb-$(CONFIG_OF_ALL_DTBS)       += $(dtb-)
 
+# List all dtbs to be generated by fdtoverlay
+overlay-y := $(foreach m,$(dtb-y), $(if $(strip $($(m:.dtb=-dtbs))),$(m),))
+
+# Generate symbols for the base files so overlays can be applied to them.
+$(foreach m,$(overlay-y), $(eval DTC_FLAGS_$(basename $(firstword $($(m:.dtb=-dtbs)))) += -@))
+
+# Add base dtb and overlay dtbo
+dtb-y += $(foreach m,$(overlay-y), $($(m:.dtb=-dtbs)))
+
 always-y			+= $(dtb-y)
 
 ifneq ($(CHECK_DTBS),)
-always-y += $(patsubst %.dtb,%.dt.yaml, $(dtb-y))
-always-y += $(patsubst %.dtbo,%.dt.yaml, $(dtb-y))
+# Don't run schema checks for dtbs created by fdtoverlay as they don't
+# have corresponding dts files.
+dt-yaml-y := $(filter-out $(overlay-y),$(dtb-y))
+
+always-y += $(patsubst %.dtb,%.dt.yaml, $(dt-yaml-y))
+always-y += $(patsubst %.dtbo,%.dt.yaml, $(dt-yaml-y))
 endif
 
 # Add subdir path
@@ -337,6 +350,15 @@ $(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
 $(obj)/%.dtbo: $(src)/%.dts $(DTC) FORCE
 	$(call if_changed_dep,dtc)
 
+overlay-y := $(addprefix $(obj)/, $(overlay-y))
+
+quiet_cmd_fdtoverlay = DTOVL   $@
+      cmd_fdtoverlay = $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $(real-prereqs)
+
+$(overlay-y): FORCE
+	$(call if_changed,fdtoverlay)
+$(call multi_depend, $(overlay-y), .dtb, -dtbs)
+
 DT_CHECKER ?= dt-validate
 DT_BINDING_DIR := Documentation/devicetree/bindings
 # DT_TMP_SCHEMA may be overridden from Documentation/devicetree/bindings/Makefile
-- 
2.25.0.rc1.19.g042ed3e048af

