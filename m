Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B5672994AA
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Oct 2020 18:58:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1782723AbgJZR6K (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 26 Oct 2020 13:58:10 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36351 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1782232AbgJZR6J (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Oct 2020 13:58:09 -0400
Received: by mail-pl1-f195.google.com with SMTP id r10so5097317plx.3
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Oct 2020 10:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jVqFrGJ54qznF12EgJgnYEytgLpa/16deYrykuVS5Rk=;
        b=ZOOw+V2RHRZn8HxQIHaNmwEX9HGWCqhQ6DHV/MT0C3Rp3Amv/+2dZBRKec0rKvIx7d
         QOLN9EQ2s2Ve/eWQJZydilAgqLnLxN0OZls4cB+SxV6QEuUadkBlJ2nwI133LYHphuFU
         MAGSYY9jpJ+dMiWxWQ184HapvtHCF87KI2UQJFuZ4TxTXjmZVAKrD5/bPhD8ib+8UiPi
         SbrGzY3mvZyat/E6dGLrHxOrC0V3aY974cLwKvBBJix2xB57NUK+HT4K8Pdk09OoQ8wd
         FjIFQQ0RgTs6w8qpYhI7fBDtyi1jexSkkK019NqWZR6rWsr4qGrMciRNByssmjlmx374
         Pu1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jVqFrGJ54qznF12EgJgnYEytgLpa/16deYrykuVS5Rk=;
        b=uJdTz8c0CTkRDN2ZWdCNb/vXKeCLPxsHNX34WH+WB3FxnsEB4/q23klvVsjvpZOp9k
         77RtrpeLZOQ2+PSnfOfWADB/DDkzNyDowEcLcq6moWr5pg/Yzjn5DwTSGADkKcsCcAAP
         E33S8zC0oXkPOUvLtbVwrHmgtoqnJiJ2E8M90RPF3RQlfYLkREcqa0eqNT/wwz6p56fb
         1W+sDwFjke/lLH59jbSUt4ZbmUWgDerQn/XnIpkxKOiJA4moyeJ/Z3/MDZNpg8IauFwz
         jzvoQwbA7KuQfNzQode9F3juLXPlrcvk7KjygZOrKu6sgkFQ3ily2kuQn2p8bRr5Y9l9
         SgdQ==
X-Gm-Message-State: AOAM533o9hcM1TxcKec+omIdXmXLEiTKrbW5GTk1lJkWhWONzlHJRenM
        pxNgqaDH13WXy9C4v91krAUR
X-Google-Smtp-Source: ABdhPJzgATxazG66Vln/+4UlHaSHpaVSkUndwcviy4e28WWIsUcCoLM3wud9RK8Mjr2Ro4ZSZPzfug==
X-Received: by 2002:a17:902:b70f:b029:d6:5bcb:1b24 with SMTP id d15-20020a170902b70fb02900d65bcb1b24mr181099pls.82.1603735088185;
        Mon, 26 Oct 2020 10:58:08 -0700 (PDT)
Received: from localhost.localdomain ([116.68.74.56])
        by smtp.gmail.com with ESMTPSA id o65sm11583088pga.42.2020.10.26.10.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 10:58:07 -0700 (PDT)
From:   Vaishnav M A <vaishnav@beagleboard.org>
To:     johan@kernel.org
Cc:     ribalda@kernel.org, robh@kernel.org, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, masahiroy@kernel.org,
        andriy.shevchenko@linux.intel.com, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-kbuild@vger.kernel.org,
        jkridner@beagleboard.org, drew@beagleboard.org,
        robertcnelson@beagleboard.org, vaishnav@beagleboard.org
Subject: [RFC PATCH 3/5] serdev: add of_ helper to get serdev controller
Date:   Mon, 26 Oct 2020 23:27:16 +0530
Message-Id: <20201026175718.965773-4-vaishnav@beagleboard.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026175718.965773-1-vaishnav@beagleboard.org>
References: <20201026175718.965773-1-vaishnav@beagleboard.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

add of_find_serdev_controller_by_node() to obtain a
serdev_controller from the device_node, which can 
help if the serdev_device is not described over 
device tree and instantiation of the device happens later
from a different driver, for the same purpose an option
to not delete an empty serdev controller is added.

Signed-off-by: Vaishnav M A <vaishnav@beagleboard.org>
---
 drivers/tty/serdev/core.c | 17 +++++++++++++++++
 include/linux/serdev.h    |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/drivers/tty/serdev/core.c b/drivers/tty/serdev/core.c
index 01b248fdc264..85977b36ed7f 100644
--- a/drivers/tty/serdev/core.c
+++ b/drivers/tty/serdev/core.c
@@ -582,6 +582,17 @@ static int of_serdev_register_devices(struct serdev_controller *ctrl)
 	return 0;
 }
 
+struct serdev_controller *of_find_serdev_controller_by_node(struct device_node *node)
+{
+	struct device *dev = bus_find_device_by_of_node(&serdev_bus_type, node);
+
+	if (!dev)
+		return NULL;
+
+	return (dev->type == &serdev_ctrl_type) ? to_serdev_controller(dev) : NULL;
+}
+EXPORT_SYMBOL_GPL(of_find_serdev_controller_by_node);
+
 #ifdef CONFIG_ACPI
 
 #define SERDEV_ACPI_MAX_SCAN_DEPTH 32
@@ -779,6 +790,12 @@ int serdev_controller_add(struct serdev_controller *ctrl)
 
 	pm_runtime_enable(&ctrl->dev);
 
+	/* provide option to not delete a serdev controller without devices
+	 * if property is present
+	 */
+	if (device_property_present(&ctrl->dev, "force-empty-serdev-controller"))
+		return 0;
+
 	ret_of = of_serdev_register_devices(ctrl);
 	ret_acpi = acpi_serdev_register_devices(ctrl);
 	if (ret_of && ret_acpi) {
diff --git a/include/linux/serdev.h b/include/linux/serdev.h
index 0d9c90a250b0..2e1eb4d17e1b 100644
--- a/include/linux/serdev.h
+++ b/include/linux/serdev.h
@@ -115,6 +115,8 @@ static inline struct serdev_controller *to_serdev_controller(struct device *d)
 	return container_of(d, struct serdev_controller, dev);
 }
 
+struct serdev_controller *of_find_serdev_controller_by_node(struct device_node *node);
+
 static inline void *serdev_device_get_drvdata(const struct serdev_device *serdev)
 {
 	return dev_get_drvdata(&serdev->dev);
-- 
2.25.1

