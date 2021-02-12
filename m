Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F3C6319D40
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Feb 2021 12:22:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbhBLLUY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Feb 2021 06:20:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230231AbhBLLUO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Feb 2021 06:20:14 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84D25C061794
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Feb 2021 03:18:51 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id z68so1324300pgz.0
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Feb 2021 03:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WlFdDyGQ/GyyV1yLJE8ER90AFhPfewXl+s4lJ7PrNZo=;
        b=rJRLNn9m5kSZ0YMaUALbsiU/2Yl8iEo8pmMVj8Wbcg+gAwcvGYGd7iSmGUcSUpj/WM
         fMBSGIX+hwvdJwa4/bia4GuNXroSKbnsdJisKS5YIWJtuwGXtmDpEuLyd7t/CTdp3qho
         UHD2cJby8qJi2eW+HQ7/FXmdn3p5sES+sLReAkNsnF57xB6MdPIogSrJqIy6S7BGvNDs
         rH7+ppW3PXmu7iZy70zTKHFEU71UmyzKgAAx9nEdHcmo86dp2ECc2mDIx4boGHeU1rHs
         XM18ZO47ERWvWBnrU8fVnBHVQ08SnOmRCMqavDWYRsHOZhxSULSBbHhsS5I3bqY9rRGT
         Be9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WlFdDyGQ/GyyV1yLJE8ER90AFhPfewXl+s4lJ7PrNZo=;
        b=qfxcSrcMFQN1OzWYCfC/hdAjw2QT5QkvrCz/OtL5WpKBMEYgKIiIIOoPudxnWMvtDR
         lsxywZgjQ8L6x3/h/F6GfFE/WODTNXzvVvcBG4Nzb60E8RQa5Vl1j8erSUX1gWgjE2vH
         kiM6RrG/4Ruog4VWkgz83hKWxycccrsPZK4zwePwceoLiAj3LM15m/wlnqEpMzH2delC
         VNTYbILT+T0W0zlcpETruoSH29ljUDA277hOiiYXSsqQJDJlMF642gXytPbEPdFYeQhA
         +n3kr6YcEl9JqxbshhqoeSfOgled8PSylgL8ZbQlToVk5dTtYEPBEhEeu/qZRYc7XSTg
         3AHA==
X-Gm-Message-State: AOAM531cAL/yVEGjohrjFJ6RaRrHRnYsdScRnZqe9l8wRyVrdDcq/pXU
        jAXDXu3dEQgcuMRs7S9/oRYcvQ==
X-Google-Smtp-Source: ABdhPJwEa9cAqDMrrNkWc6CGYQzJ3YY0YTih43P3yWd5mO8VRfNgoGWyHiLfAUWJF07maB2OFv78MA==
X-Received: by 2002:a63:e108:: with SMTP id z8mr2616603pgh.363.1613128730998;
        Fri, 12 Feb 2021 03:18:50 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id k4sm8349156pfk.44.2021.02.12.03.18.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Feb 2021 03:18:50 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        anmar.oueja@linaro.org, Bill Mills <bill.mills@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH V8 2/4] kbuild: Add generic rule to apply fdtoverlay
Date:   Fri, 12 Feb 2021 16:48:36 +0530
Message-Id: <2654369a72516ff612976252636dd80677e22cb8.1613127681.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1613127681.git.viresh.kumar@linaro.org>
References: <cover.1613127681.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Rob Herring <robh@kernel.org>

Add a generic rule to apply fdtoverlay in Makefile.lib, so every
platform doesn't need to carry the complex rule.

The platform's Makefile only needs to have this now:

 DTC_FLAGS_foo_base += -@
 foo-dtbs := foo_base.dtb foo_overlay1.dtbo foo_overlay2.dtbo
 dtb-y := foo.dtb

We don't want to run schema checks on foo.dtb (as foo.dts doesn't exist)
and the Makefile is updated accordingly.

Signed-off-by: Rob Herring <robh@kernel.org>
Co-developed-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 scripts/Makefile.lib | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index fa0db696120f..3c450bfec015 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -66,6 +66,10 @@ multi-used   := $(multi-used-y) $(multi-used-m)
 real-obj-y := $(foreach m, $(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-))),$($(m:.o=-objs)) $($(m:.o=-y)),$(m)))
 real-obj-m := $(foreach m, $(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m)) $($(m:.o=-))),$($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m)),$(m)))
 
+# List all dtbs to be generated by fdtoverlay
+overlay-y := $(foreach m,$(dtb-y), $(if $(strip $($(m:.dtb=-dtbs))),$(m),))
+overlay-$(CONFIG_OF_ALL_DTBS) += $(foreach m,$(dtb-), $(if $(strip $($(m:.dtb=-dtbs))),$(m),))
+
 always-y += $(always-m)
 
 # hostprogs-always-y += foo
@@ -80,14 +84,21 @@ userprogs += $(userprogs-always-y) $(userprogs-always-m)
 always-y += $(userprogs-always-y) $(userprogs-always-m)
 
 # DTB
+# Add base dtb and overlay dtbo
+dtb-y += $(foreach m,$(overlay-y), $($(m:.dtb=-dtbs)))
+
 # If CONFIG_OF_ALL_DTBS is enabled, all DT blobs are built
 dtb-$(CONFIG_OF_ALL_DTBS)       += $(dtb-)
 
 extra-y				+= $(dtb-y)
 
 ifneq ($(CHECK_DTBS),)
-extra-y += $(patsubst %.dtb,%.dt.yaml, $(dtb-y))
-extra-y += $(patsubst %.dtbo,%.dt.yaml, $(dtb-y))
+# Don't run schema checks for dtbs created by fdtoverlay as they don't
+# have corresponding dts files.
+dt-yaml-y := $(filter-out $(overlay-y),$(dtb-y))
+
+extra-y += $(patsubst %.dtb,%.dt.yaml, $(dt-yaml-y))
+extra-y += $(patsubst %.dtbo,%.dt.yaml, $(dt-yaml-y))
 endif
 
 # Add subdir path
@@ -331,6 +342,15 @@ $(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
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

