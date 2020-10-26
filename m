Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F00C299495
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Oct 2020 18:57:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1788886AbgJZR5z (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 26 Oct 2020 13:57:55 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45448 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1782180AbgJZR5z (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Oct 2020 13:57:55 -0400
Received: by mail-pl1-f193.google.com with SMTP id v22so5080782ply.12
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Oct 2020 10:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zdwZb/8vCueVng7uQfENP1wxUMwC84r+n6kRBBfDO4Q=;
        b=PkU3mM+7LhxcJsnVDtuswZz3ooy1YfPd53qjZhfQIiK8SaHwOgpKYba/oaddGT/tlr
         hPAaX7h/uY/L35GsAnIINjyHIEYO+3+betYb9yJkZsbV+ZV+wUoCjVOT893SI8GcsSbo
         J2ynmE2XWlH/gmjv1iu/Mib/6rWNjn1cSSyy5Spoxk9rZe7yl3XD84d1N+gcNm4Tx1j6
         zBKxK7GIdtkQpdTA/9k3M41VGcKz+leq+ybkvrxi7TmAK8aNcK781TDj70Lc6hutc0W3
         oyCrcLwhBzGCemlZdby8rj1zuv1VHa1RLqZEyiddD7br1bMBp/vlLYI/8JltlsvBp33V
         lyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zdwZb/8vCueVng7uQfENP1wxUMwC84r+n6kRBBfDO4Q=;
        b=sRjzFYRS1TO3CKM9S6y4xaqOimrV3tB0tbYLWA92zI36q6jIWoEGU+UKSy17sPEBsy
         7sv+lqsz/cuqJBJLqhv3Bj6re0De9x65Zv5XpM1g8az/xhNBaTszEB/pvLa3aGMLmKKX
         Xv5T+worHtUS7m8QXl5vynVpF2dlK9Gq+wy5G2pVrjWhlQ3ZVeBaijWe03bV2IWlxO2M
         FQreYuPALj5guA3opYrFrWBgxWvnvpkxC2g2y0Xg0h/TfFsHI/INh6eMYB9t8vpOhQlo
         cfg+/OCx0jmL3VLyPNlh511Hg6aQX4TbB/+mTm6eoAlAaS/2UMFXRXkkLgL6U/zYQa/B
         C/Ww==
X-Gm-Message-State: AOAM531+r5+wTxRL2RMGPUAK0wZ6AM0+9Op6ga9lRtBZSoPvc5LvVaW/
        /6dtfYSHZM374m0V90pHTE7V
X-Google-Smtp-Source: ABdhPJzyMepZDH89Xdy7E0fgsxyQn6K95GUGdr73fKNwZk6Z1CBEWb1cQpviZhBAwniC4A/ngeoqbw==
X-Received: by 2002:a17:902:a503:b029:d6:d9d:f901 with SMTP id s3-20020a170902a503b02900d60d9df901mr11404419plq.54.1603735073836;
        Mon, 26 Oct 2020 10:57:53 -0700 (PDT)
Received: from localhost.localdomain ([116.68.74.56])
        by smtp.gmail.com with ESMTPSA id o65sm11583088pga.42.2020.10.26.10.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 10:57:53 -0700 (PDT)
From:   Vaishnav M A <vaishnav@beagleboard.org>
To:     johan@kernel.org
Cc:     ribalda@kernel.org, robh@kernel.org, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, masahiroy@kernel.org,
        andriy.shevchenko@linux.intel.com, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-kbuild@vger.kernel.org,
        jkridner@beagleboard.org, drew@beagleboard.org,
        robertcnelson@beagleboard.org, vaishnav@beagleboard.org
Subject: [RFC PATCH 1/5] serdev: Add serdev_device_id
Date:   Mon, 26 Oct 2020 23:27:14 +0530
Message-Id: <20201026175718.965773-2-vaishnav@beagleboard.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026175718.965773-1-vaishnav@beagleboard.org>
References: <20201026175718.965773-1-vaishnav@beagleboard.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently,a serdev device driver can only be used with devices that are
nodes of a device tree, or are part of the ACPI table.id_table will be
used for devices that are not part of the device tree nor the ACPI table
(example: device on greybus gbphy created uart).

corresponding modalias field is introduced to name the driver to be
used with the device, required for device(s) that are neither described
by device tree nor ACPI table.serdev_device_uevent is also extended
for modalias devices.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Signed-off-by: Vaishnav M A <vaishnav@beagleboard.org>
---
 drivers/tty/serdev/core.c       | 41 ++++++++++++++++++++++++++++-----
 include/linux/mod_devicetable.h | 10 ++++++++
 include/linux/serdev.h          |  3 +++
 3 files changed, 48 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/serdev/core.c b/drivers/tty/serdev/core.c
index c5f0d936b003..01b248fdc264 100644
--- a/drivers/tty/serdev/core.c
+++ b/drivers/tty/serdev/core.c
@@ -27,12 +27,17 @@ static ssize_t modalias_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	int len;
+	struct serdev_device *serdev = to_serdev_device(dev);
 
 	len = acpi_device_modalias(dev, buf, PAGE_SIZE - 1);
 	if (len != -ENODEV)
 		return len;
 
-	return of_device_modalias(dev, buf, PAGE_SIZE);
+	len = of_device_modalias(dev, buf, PAGE_SIZE);
+	if (len != -ENODEV)
+		return len;
+
+	return sprintf(buf, "%s%s\n", SERDEV_MODULE_PREFIX, serdev->modalias);
 }
 static DEVICE_ATTR_RO(modalias);
 
@@ -45,14 +50,18 @@ ATTRIBUTE_GROUPS(serdev_device);
 static int serdev_device_uevent(struct device *dev, struct kobj_uevent_env *env)
 {
 	int rc;
-
-	/* TODO: platform modalias */
+	struct serdev_device *serdev = to_serdev_device(dev);
 
 	rc = acpi_device_uevent_modalias(dev, env);
 	if (rc != -ENODEV)
 		return rc;
 
-	return of_device_uevent_modalias(dev, env);
+	rc = of_device_uevent_modalias(dev, env);
+	if (rc != -ENODEV)
+		return rc;
+
+	return add_uevent_var(env, "MODALIAS=%s%s", SERDEV_MODULE_PREFIX,
+							serdev->modalias);
 }
 
 static void serdev_device_release(struct device *dev)
@@ -83,16 +92,36 @@ static const struct device_type serdev_ctrl_type = {
 	.release	= serdev_ctrl_release,
 };
 
+static int serdev_match_id(const struct serdev_device_id *id,
+			   const struct serdev_device *sdev)
+{
+	while (id->name[0]) {
+		if (!strcmp(sdev->modalias, id->name))
+			return 1;
+		id++;
+	}
+
+	return 0;
+}
+
 static int serdev_device_match(struct device *dev, struct device_driver *drv)
 {
+	const struct serdev_device *sdev = to_serdev_device(dev);
+	const struct serdev_device_driver *sdrv = to_serdev_device_driver(drv);
+
 	if (!is_serdev_device(dev))
 		return 0;
 
-	/* TODO: platform matching */
 	if (acpi_driver_match_device(dev, drv))
 		return 1;
 
-	return of_driver_match_device(dev, drv);
+	if (of_driver_match_device(dev, drv))
+		return 1;
+
+	if (sdrv->id_table)
+		return serdev_match_id(sdrv->id_table, sdev);
+
+	return strcmp(sdev->modalias, drv->name) == 0;
 }
 
 /**
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 5b08a473cdba..656353952da2 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -486,6 +486,16 @@ struct i3c_device_id {
 	const void *data;
 };
 
+/* serdev */
+
+#define SERDEV_NAME_SIZE	32
+#define SERDEV_MODULE_PREFIX	"serdev:"
+
+struct serdev_device_id {
+	char name[SERDEV_NAME_SIZE];
+	kernel_ulong_t driver_data;
+};
+
 /* spi */
 
 #define SPI_NAME_SIZE	32
diff --git a/include/linux/serdev.h b/include/linux/serdev.h
index 9f14f9c12ec4..0d9c90a250b0 100644
--- a/include/linux/serdev.h
+++ b/include/linux/serdev.h
@@ -7,6 +7,7 @@
 
 #include <linux/types.h>
 #include <linux/device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/termios.h>
 #include <linux/delay.h>
 
@@ -45,6 +46,7 @@ struct serdev_device {
 	const struct serdev_device_ops *ops;
 	struct completion write_comp;
 	struct mutex write_lock;
+	char modalias[SERDEV_NAME_SIZE];
 };
 
 static inline struct serdev_device *to_serdev_device(struct device *d)
@@ -63,6 +65,7 @@ struct serdev_device_driver {
 	struct device_driver driver;
 	int	(*probe)(struct serdev_device *);
 	void	(*remove)(struct serdev_device *);
+	const struct serdev_device_id *id_table;
 };
 
 static inline struct serdev_device_driver *to_serdev_device_driver(struct device_driver *d)
-- 
2.25.1

