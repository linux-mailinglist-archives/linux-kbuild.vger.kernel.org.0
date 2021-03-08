Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10F1A330B93
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Mar 2021 11:46:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231612AbhCHKpe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 8 Mar 2021 05:45:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231445AbhCHKpZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Mar 2021 05:45:25 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E5ABC06174A
        for <linux-kbuild@vger.kernel.org>; Mon,  8 Mar 2021 02:45:25 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so2884622pjv.1
        for <linux-kbuild@vger.kernel.org>; Mon, 08 Mar 2021 02:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=53ZYVB0Xtgq6MCwjC2uhWBZLLQ7+TlafX4FRolIvaTs=;
        b=luf+uBm0s951oaAOJBzVSyXwGFnh87lmYOJQeoiotcG8IB2n44N3orrQ1dOsWEiJ8T
         B5gYj/JqJBnfE6V+rMRfAXrPD5q38sbRW4dspZG2sxpNQrrZ4bPHzJXj+ONwwwtC4whZ
         sb48IY7U8sYS49F1WmyhbINkeJApVF6xwM6R+/vVMGYZIKVqP6u894n4lG5ITrk2mhkR
         hz25bxWQBdC1xMIEcickXgUOgHT3GDj0wOSGrNEdL+AZlMeYS3AflM5BmpVP3daSP8nZ
         dBwkyqvLgxzuwYGSZLE5tp+bIBNI2GEyaU0uNFl+KO76ucpbmop1aUPIAyBwyUvFQflV
         B8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=53ZYVB0Xtgq6MCwjC2uhWBZLLQ7+TlafX4FRolIvaTs=;
        b=XJ+S2q0IBwzOUb57OQXqFjVu6Jp9Z5sLx4UhLMTdkblmkRijOor1sqD8MZxJLERAxN
         tY8VL+y2SF7QDc9eu8vSUm7YTKtTflL5z5k1lxEvMTFjD8ToXtu6MC2RjYWuM9In8aX3
         NC90xuwviQENo/yO13nYu2PR7kZk1EaV5QvmO9vC6C+aZrzWlZhG1D2At3MEj7XJqu5P
         CSwmo65n93U060hhfxMRbx1kkrgN61mbJi9RfkwFghMS0C8/+l4mEwM5Dm+XJRaRfdzP
         FGTvvdlQh7iy6cxOcGWDJ0BvVeMNCfnZUoZ/2dbgvQo/O1rADHsA/Cz/i/khhvAJaJa1
         h3Ww==
X-Gm-Message-State: AOAM533MlCs5YbR+/Lm/Eff7OEfuI2wo/oEgbWSEcrnHqlvavmIBjeTY
        mWUtTCz2muFlDvLUknA86iaXrw==
X-Google-Smtp-Source: ABdhPJw240y45CbG3Ei8qNvh8f5y62WhPu+H6jis379KERWIO1vkLE+x4DUBbKuINfML9Y+w5zeOXg==
X-Received: by 2002:a17:90a:8a8b:: with SMTP id x11mr24239294pjn.151.1615200324657;
        Mon, 08 Mar 2021 02:45:24 -0800 (PST)
Received: from localhost ([122.171.124.15])
        by smtp.gmail.com with ESMTPSA id d7sm9721822pfh.73.2021.03.08.02.45.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Mar 2021 02:45:23 -0800 (PST)
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
Subject: [PATCH V10 2/5] kbuild: Add generic rule to apply fdtoverlay
Date:   Mon,  8 Mar 2021 16:15:07 +0530
Message-Id: <c6dea8f363725c069e26031ec7c7c5f27850103b.1615199908.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1615199908.git.viresh.kumar@linaro.org>
References: <cover.1615199908.git.viresh.kumar@linaro.org>
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

