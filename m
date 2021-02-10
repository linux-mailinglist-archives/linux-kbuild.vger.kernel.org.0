Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25A993164EA
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Feb 2021 12:17:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbhBJLRZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Feb 2021 06:17:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbhBJLPI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Feb 2021 06:15:08 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 515E3C061356
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Feb 2021 03:13:49 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id j12so1028692pfj.12
        for <linux-kbuild@vger.kernel.org>; Wed, 10 Feb 2021 03:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QRU7LnSUwsy2J1LUcByliifcDkevWGi1e/7l1FGxdFY=;
        b=g7X4InNpSo7NEg4suX2BeSEGrpDV26yKM5BqqZkeSr/4o8ywcQXQzv0aC+/MBYnZd0
         fC+ipxMjsvmPhwCK0C5bZtf687ZxDgvraWUybv5VE2h69zapWBR6go6VRRNMfnqFedzm
         i/jJeZqWKTKdiikUrO6ZTVg93qXjEOyw+Rvxgk1qkRAhjygrQCm/a6SeduOz2oMzyuA9
         WsmEEcrFAQ1ROZED540Fi9yBr2c2iM3gTEnogjMHya+lLRRWSszNqIGT7To5jU9lLCA3
         0LOprTGRy5auRvpHEzViCdbWROCyc4uyiV54ILrBfgk/R2xVaEEUY2OifQVQuN7e4eJI
         5ksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QRU7LnSUwsy2J1LUcByliifcDkevWGi1e/7l1FGxdFY=;
        b=mQ7ctk9h1q7mY3js7nE+quzcIGbi2YiTRMNnZPNqzRANwqjVSXLodrXArAPV0xDry9
         dar9ZAZLdXVoybJUf7a8OOxQRYPLJTuY27FImcLbBkC/G9Cs/LAqkYOpeu1u5SLMpgVq
         f1gm5IJcVgIOCw7OWUziZAuz9MQEKuvcun4wvqaLpC3EGUNJYFXoHaxVmWcnDhFKBsX+
         z1BUkvpCWxkZV28Nt4wESYvOPT5b8vmlK+VznBScZijK0nAS4M1+JEwV2rsL5Rq7i5TS
         5FUWLyojC4heO2s6k2hXdOOwvT5k2X003Y5XMOEvHd6MAoSYjbrtVkSKXqwXUCqBb7tl
         /HBg==
X-Gm-Message-State: AOAM531LjtkGqsJvViRvyUMZxQ2UavOGuJjDEGOa1HiGFa7R1XxZUfmM
        Fu4h794pTGVDwFGCE7PyUp9oHQ==
X-Google-Smtp-Source: ABdhPJzBP3OqpqSZEkEdtiGKaG9/SUHfEWELDMOS7uSdecD3j4DWi5Q3ln5ROFTnJM+FPHtphI9LuA==
X-Received: by 2002:a63:c741:: with SMTP id v1mr2603957pgg.316.1612955628899;
        Wed, 10 Feb 2021 03:13:48 -0800 (PST)
Received: from localhost ([122.172.59.240])
        by smtp.gmail.com with ESMTPSA id e26sm2108659pfm.87.2021.02.10.03.13.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Feb 2021 03:13:48 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        anmar.oueja@linaro.org, Bill Mills <bill.mills@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH V7 3/3] of: unittest: Statically apply overlays using fdtoverlay
Date:   Wed, 10 Feb 2021 16:43:30 +0530
Message-Id: <72f0396f0eeed6dad25527368ee9e471312f9a59.1612955268.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1612955268.git.viresh.kumar@linaro.org>
References: <cover.1612955268.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Now that fdtoverlay is part of the kernel build, start using it to test
the unitest overlays we have by applying them statically. Create two new
base files static_base_1.dts and static_base_2.dts which includes other
.dtsi files.

Some unittest overlays deliberately contain errors that unittest checks
for. These overlays will cause fdtoverlay to fail, and are thus not
included for static builds.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/of/unittest-data/Makefile          | 50 ++++++++++++++++++++++
 drivers/of/unittest-data/static_base_1.dts |  4 ++
 drivers/of/unittest-data/static_base_2.dts |  4 ++
 3 files changed, 58 insertions(+)
 create mode 100644 drivers/of/unittest-data/static_base_1.dts
 create mode 100644 drivers/of/unittest-data/static_base_2.dts

diff --git a/drivers/of/unittest-data/Makefile b/drivers/of/unittest-data/Makefile
index 009f4045c8e4..1d6029e722c0 100644
--- a/drivers/of/unittest-data/Makefile
+++ b/drivers/of/unittest-data/Makefile
@@ -34,7 +34,57 @@ DTC_FLAGS_overlay += -@
 DTC_FLAGS_overlay_bad_phandle += -@
 DTC_FLAGS_overlay_bad_symbol += -@
 DTC_FLAGS_overlay_base += -@
+DTC_FLAGS_static_base_1 += -@
+DTC_FLAGS_static_base_2 += -@
 DTC_FLAGS_testcases += -@
 
 # suppress warnings about intentional errors
 DTC_FLAGS_testcases += -Wno-interrupts_property
+
+# Apply overlays statically with fdtoverlay.  This is a build time test that
+# the overlays can be applied successfully by fdtoverlay.  This does not
+# guarantee that the overlays can be applied successfully at run time by
+# unittest, but it provides a bit of build time test coverage for those
+# who do not execute unittest.
+#
+# The overlays are applied on top of static_base_1.dtb and static_base_2.dtb to
+# create static_test_1.dtb and static_test_2.dtb.  If fdtoverlay detects an
+# error than the kernel build will fail.  static_test_1.dtb and
+# static_test_2.dtb are not consumed by unittest.
+#
+# Some unittest overlays deliberately contain errors that unittest checks for.
+# These overlays will cause fdtoverlay to fail, and are thus not included
+# in the static test:
+#			  overlay_bad_add_dup_node.dtb \
+#			  overlay_bad_add_dup_prop.dtb \
+#			  overlay_bad_phandle.dtb \
+#			  overlay_bad_symbol.dtb \
+
+apply_static_overlay_1 := overlay_0.dtbo \
+			  overlay_1.dtbo \
+			  overlay_2.dtbo \
+			  overlay_3.dtbo \
+			  overlay_4.dtbo \
+			  overlay_5.dtbo \
+			  overlay_6.dtbo \
+			  overlay_7.dtbo \
+			  overlay_8.dtbo \
+			  overlay_9.dtbo \
+			  overlay_10.dtbo \
+			  overlay_11.dtbo \
+			  overlay_12.dtbo \
+			  overlay_13.dtbo \
+			  overlay_15.dtbo \
+			  overlay_gpio_01.dtbo \
+			  overlay_gpio_02a.dtbo \
+			  overlay_gpio_02b.dtbo \
+			  overlay_gpio_03.dtbo \
+			  overlay_gpio_04a.dtbo \
+			  overlay_gpio_04b.dtbo
+
+apply_static_overlay_2 := overlay.dtbo
+
+static_test_1-dtbs := static_base_1.dtb $(apply_static_overlay_1)
+static_test_2-dtbs := static_base_2.dtb $(apply_static_overlay_2)
+
+overlay-$(CONFIG_OF_OVERLAY) += static_test_1.dtb static_test_2.dtb
diff --git a/drivers/of/unittest-data/static_base_1.dts b/drivers/of/unittest-data/static_base_1.dts
new file mode 100644
index 000000000000..10556cb3f01f
--- /dev/null
+++ b/drivers/of/unittest-data/static_base_1.dts
@@ -0,0 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "testcases_common.dtsi"
diff --git a/drivers/of/unittest-data/static_base_2.dts b/drivers/of/unittest-data/static_base_2.dts
new file mode 100644
index 000000000000..b0ea9504d6f3
--- /dev/null
+++ b/drivers/of/unittest-data/static_base_2.dts
@@ -0,0 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "overlay_common.dtsi"
-- 
2.25.0.rc1.19.g042ed3e048af

