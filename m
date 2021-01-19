Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C9822FAEB7
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Jan 2021 03:23:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387892AbhASCWt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 18 Jan 2021 21:22:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393946AbhASCWp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Jan 2021 21:22:45 -0500
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03135C061573;
        Mon, 18 Jan 2021 18:22:05 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id e17so3624368qto.3;
        Mon, 18 Jan 2021 18:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uvVQDxYFvYqoF+K8ci4qn05sk1l1BTuSg44ft2MDtH4=;
        b=HhgxnwqY6uDcFQ+5x2NAJSxS+o0DYUVGshktNgxa0/nmN9Ba3kNfESPag6zMFT5/bf
         ZPXDJjuAU/xXq0rB/qLMMen6XDzxDfP/bQggDclv64JMkkbBy2w2OAE1M/s1VRQKtdb8
         F1SROHq+eYyKSGXlxk9W56ql3qnntLyE0RRTlEbUvL0vimjLtO2L1VXEIe+nX8LDIsaZ
         jXDZ0ntt7VNY8aUc5/zMynH8NAmatSAUTVr3s6WTVoEKZ20s4/M7P5JUNKUlQkTKdiif
         /evy0bFQAjsN7IJbRBwHycfV1o4CH7aSb4HXIcOkvKHX8HJvweOCAIx+9YH19N/q4QZM
         jA4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uvVQDxYFvYqoF+K8ci4qn05sk1l1BTuSg44ft2MDtH4=;
        b=Lp6o80cRAt9d0jlbpyWTEEx6g9yuvbRk/7afAqkqjc1WBTCtUy0R0EvNsgPviv4Xnj
         G0nojEyU3CZAQRU5fOHWOae+YrVfXY7KTF6KwarjPRy7eSfbgV6C6lDpwn73tssRl1mt
         WDp3erJfwVktVSLgQzD2uCjDOnQFvLaphxoPhCzFZk/E2Uq3sxpl1+vPbVGZ+/SIr42o
         Se0ybxO75FDRs+dpHs5aU+VACkLCwjUbnzFdp89j2piIeTG4KtrWZyo6ZvX9r7F8Zue0
         GY2a6OmJvymQhgObbubDlhp0rWgNb9GV0pwzP0D5kVMBcZV/nJE0zmTM0j5v0zIzI9FJ
         6Q6A==
X-Gm-Message-State: AOAM530LpBHbW0yUvMHqPYADNBqF5+wFM9kez0OtrB8qBw1bH+UvHVC6
        /o/g2Ib05ZSi1pmpGCN7fH0=
X-Google-Smtp-Source: ABdhPJy+bgCIazljR4BqFCPgcP9YA7HwXsTvCuYFjYtbZfrEBjq6gUYEDUO6b9l9pzjCzGNITu31rQ==
X-Received: by 2002:ac8:370b:: with SMTP id o11mr2465925qtb.314.1611022923564;
        Mon, 18 Jan 2021 18:22:03 -0800 (PST)
Received: from localhost.localdomain (c-67-187-90-124.hsd1.ky.comcast.net. [67.187.90.124])
        by smtp.gmail.com with ESMTPSA id s14sm12212194qke.45.2021.01.18.18.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 18:22:02 -0800 (PST)
From:   frowand.list@gmail.com
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        pantelis.antoniou@konsulko.com
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: re: [PATCH] of: unittest: Statically apply overlays using fdtoverlay
Date:   Mon, 18 Jan 2021 20:21:54 -0600
Message-Id: <20210119022154.2338781-1-frowand.list@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <1e42183ccafa1afba33b3e79a4e3efd3329fd133.1610095159.git.viresh.kumar@linaro.org>
References: <1e42183ccafa1afba33b3e79a4e3efd3329fd133.1610095159.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

These changes apply on top of the patches in:

  [PATCH] of: unittest: Statically apply overlays using fdtoverlay
  Message-Id: <1e42183ccafa1afba33b3e79a4e3efd3329fd133.1610095159.git.viresh.kumar@linaro.org>

There are still some issues to be cleaned up, so not ready for acceptance.

I have not used the construct "always-$(CONFIG_OF_OVERLAY)" before, and
have not looked into the proper usage of it.

I tested this using a hand build libfdt and fdtoverlay from the dtc-compiler
upstream project.  For my testing I added LD_LIBRARY_PATH to the body of
"cmd_fdtoverlay" to reference my hand built libfdt.  The kernel build
system will have to instead use a libfdt that is built in the kernel
tree.

I have not run this through checkpatch, or my checks for build warnings.
I have not run unittests on my target with these patches applied.

---
 drivers/of/unittest-data/Makefile | 67 ++++++++++++++++++++++---------
 1 file changed, 48 insertions(+), 19 deletions(-)

diff --git a/drivers/of/unittest-data/Makefile b/drivers/of/unittest-data/Makefile
index f17bce85f65f..28614a123d1e 100644
--- a/drivers/of/unittest-data/Makefile
+++ b/drivers/of/unittest-data/Makefile
@@ -39,25 +39,54 @@ DTC_FLAGS_testcases += -@
 # suppress warnings about intentional errors
 DTC_FLAGS_testcases += -Wno-interrupts_property
 
-# Apply overlays statically with fdtoverlay
-intermediate-overlay	:= overlay.dtb
-master			:= overlay_0.dtb overlay_1.dtb overlay_2.dtb \
-			   overlay_3.dtb overlay_4.dtb overlay_5.dtb \
-			   overlay_6.dtb overlay_7.dtb overlay_8.dtb \
-			   overlay_9.dtb overlay_10.dtb overlay_11.dtb \
-			   overlay_12.dtb overlay_13.dtb overlay_15.dtb \
-			   overlay_gpio_01.dtb overlay_gpio_02a.dtb \
-			   overlay_gpio_02b.dtb overlay_gpio_03.dtb \
-			   overlay_gpio_04a.dtb overlay_gpio_04b.dtb \
-			   intermediate-overlay.dtb
-
-quiet_cmd_fdtoverlay = fdtoverlay $@
-      cmd_fdtoverlay = $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $^
-
-$(obj)/intermediate-overlay.dtb: $(obj)/overlay_base.dtb $(addprefix $(obj)/,$(intermediate-overlay))
-	$(call if_changed,fdtoverlay)
+# Apply overlays statically with fdtoverlay.  This is a build time test that
+# the overlays can be applied successfully by fdtoverlay.  This does not
+# guarantee that the overlays can be applied successfully at run time by
+# unittest, but it provides a bit of build time test coverage for those
+# who do not execute unittest.
+#
+# The overlays are applied on top of testcases.dtb to create static_test.dtb
+# If fdtoverlay detects an error than the kernel build will fail.
+# static_test.dtb is not consumed by unittest.
+#
+# Some unittest overlays deliberately contain errors that unittest checks for.
+# These overlays will cause fdtoverlay to fail, and are thus not included
+# in the static test:
+#			overlay.dtb \
+#			overlay_bad_add_dup_node.dtb \
+#			overlay_bad_add_dup_prop.dtb \
+#			overlay_bad_phandle.dtb \
+#			overlay_bad_symbol.dtb \
+
+apply_static_overlay := overlay_base.dtb \
+			overlay_0.dtb \
+			overlay_1.dtb \
+			overlay_2.dtb \
+			overlay_3.dtb \
+			overlay_4.dtb \
+			overlay_5.dtb \
+			overlay_6.dtb \
+			overlay_7.dtb \
+			overlay_8.dtb \
+			overlay_9.dtb \
+			overlay_10.dtb \
+			overlay_11.dtb \
+			overlay_12.dtb \
+			overlay_13.dtb \
+			overlay_15.dtb \
+			overlay_gpio_01.dtb \
+			overlay_gpio_02a.dtb \
+			overlay_gpio_02b.dtb \
+			overlay_gpio_03.dtb \
+			overlay_gpio_04a.dtb \
+			overlay_gpio_04b.dtb \
+
+quiet_cmd_fdtoverlay = FDTOVERLAY $@
+
+## This is not correct, need to use libfdt from the kernel tree:
+cmd_fdtoverlay = $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $^
 
-$(obj)/master.dtb: $(obj)/testcases.dtb $(addprefix $(obj)/,$(master))
+$(obj)/static_test.dtb: $(obj)/testcases.dtb $(addprefix $(obj)/,$(apply_static_overlay))
 	$(call if_changed,fdtoverlay)
 
-always-$(CONFIG_OF_OVERLAY) += intermediate-overlay.dtb master.dtb
+always-$(CONFIG_OF_OVERLAY) += static_test.dtb
-- 
Frank Rowand <frank.rowand@sony.com>

