Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B585F2CE0B2
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Dec 2020 22:30:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729628AbgLCV2Y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Dec 2020 16:28:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728312AbgLCV2Y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Dec 2020 16:28:24 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82273C08C5F2;
        Thu,  3 Dec 2020 13:27:11 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id cm17so3697081edb.4;
        Thu, 03 Dec 2020 13:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sfVhBdMnQHZjG40tgGVmuJKvGE7XyS0W84Qh7YYQGr8=;
        b=cBuVlSZOJgAfOyE5m7Qrcp3Kn3QKjqQ9Q4j0u8r8RjfCuajISQ+12seDYK3fDDm5yP
         VCAlbnE3h/TUjpwhuNStyDn/kwWiudEqz2fH9m+0r0LQXT4+d7q6AY8dz34S+zI0rgE5
         vEvERFh9mG81AaFoGuART6doB07Cj/nLQBq1E3e4kQsMtq6ILGVjw13ZesXY6ESMNaFS
         WIZ+vkoWtRpbZdc67nOpwzxj3jXdQ8w6+EUYUhpqkdVvlWq4eKO5exLxH5LbSwSrsBfB
         euixNNv73IrjOACoVL5cWeBFHMpPTmDOxAdZmbrmzTx6ri4U8c7fnnxuh7SgLGxC6Jht
         U0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sfVhBdMnQHZjG40tgGVmuJKvGE7XyS0W84Qh7YYQGr8=;
        b=VJYnEUFQsQwH5N+Um5BaKT//PVv5b/iOFBCqLO13zwzFOubOJFNE2d+9MzGjSImTF5
         N3WETBLpB6RTfOcOeoiCgt08yMTKoewgNLJyP2Vcbxc60Bz2Dv6f/R5pye/9ecCNXuA6
         fN0p/xUFMTiadPNFjx3nUMQGcqf/Qp3oqbBcWXf76mMT0TbSbY1vsrdq7+rzZ+GM8u9G
         BPE4BXhy680lzRhaUCvrpTsh94Zd/Inc05H2lcVRvwuXY3UDRJLav50KyGfDIlLLEqnk
         xnJksrH/kJNCXDUvIAvJxlXgaRb4MAyDIIkkEpr4a96CT91LIc/Mm3tFG8pr1JLaVTPF
         8ljQ==
X-Gm-Message-State: AOAM533N24s0MVj8pALE4AdPnDwXP/eLJd2RvSz3iahSCb05q94OLqri
        v5+hupVsrSYVTXy3ppPtT0Pav6p3xN8=
X-Google-Smtp-Source: ABdhPJxvOLNf1VdDfFHTebsTaKZQa4BJyrSrb1VTzYJ4sV9VJBsUmhuKoyVGNAe09B7cEs9BA2L5EQ==
X-Received: by 2002:a50:a40c:: with SMTP id u12mr4615437edb.337.1607030828718;
        Thu, 03 Dec 2020 13:27:08 -0800 (PST)
Received: from xws.fritz.box (pd9e5a6ef.dip0.t-ipconnect.de. [217.229.166.239])
        by smtp.gmail.com with ESMTPSA id e3sm1656169ejq.96.2020.12.03.13.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 13:27:07 -0800 (PST)
From:   Maximilian Luz <luzmaximilian@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        =?UTF-8?q?Bla=C5=BE=20Hrastnik?= <blaz@mxxn.io>,
        Dorian Stoll <dorian.stoll@tmsp.io>,
        platform-driver-x86@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: [PATCH v2 6/9] platform/surface: aggregator: Add dedicated bus and device type
Date:   Thu,  3 Dec 2020 22:26:37 +0100
Message-Id: <20201203212640.663931-7-luzmaximilian@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203212640.663931-1-luzmaximilian@gmail.com>
References: <20201203212640.663931-1-luzmaximilian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The Surface Aggregator EC provides varying functionality, depending on
the Surface device. To manage this functionality, we use dedicated
client devices for each subsystem or virtual device of the EC. While
some of these clients are described as standard devices in ACPI and the
corresponding client drivers can be implemented as platform drivers in
the kernel (making use of the controller API already present), many
devices, especially on newer Surface models, cannot be found there.

To simplify management of these devices, we introduce a new bus and
client device type for the Surface Aggregator subsystem. The new device
type takes care of managing the controller reference, essentially
guaranteeing its validity for as long as the client device exists, thus
alleviating the need to manually establish device links for that purpose
in the client driver (as has to be done with the platform devices).

Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
---

Changes in v1 (from RFC):
 - add copyright lines
 - change SPDX identifier to GPL-2.0+ (was GPL-2.0-or-later)
 - remove unnecessary READ_ONCE on multiple occasions
 - improve documentation of special values for SSAM_DEVICE()
 - add NULL checks for ssam_device_get, ssam_device_put

Changes in v2:
 - return ENODEV instead of ENXIO if controller is not present
 - use sysfs_emit for sysfs attributes
 - spell check comments and strings, fix typos
 - unify comment style
 - run checkpatch --strict, fix warnings and style issues

---
 drivers/platform/surface/aggregator/Kconfig  |  12 +
 drivers/platform/surface/aggregator/Makefile |   4 +
 drivers/platform/surface/aggregator/bus.c    | 415 ++++++++++++++++++
 drivers/platform/surface/aggregator/bus.h    |  27 ++
 drivers/platform/surface/aggregator/core.c   |  12 +
 include/linux/mod_devicetable.h              |  18 +
 include/linux/surface_aggregator/device.h    | 423 +++++++++++++++++++
 scripts/mod/devicetable-offsets.c            |   8 +
 scripts/mod/file2alias.c                     |  23 +
 9 files changed, 942 insertions(+)
 create mode 100644 drivers/platform/surface/aggregator/bus.c
 create mode 100644 drivers/platform/surface/aggregator/bus.h
 create mode 100644 include/linux/surface_aggregator/device.h

diff --git a/drivers/platform/surface/aggregator/Kconfig b/drivers/platform/surface/aggregator/Kconfig
index 48f40c345e29..44c2493706bc 100644
--- a/drivers/platform/surface/aggregator/Kconfig
+++ b/drivers/platform/surface/aggregator/Kconfig
@@ -42,6 +42,18 @@ menuconfig SURFACE_AGGREGATOR
 	  module, y if you want to build it into the kernel and n if you don't
 	  want it at all.

+config SURFACE_AGGREGATOR_BUS
+	bool "Surface System Aggregator Module Bus"
+	depends on SURFACE_AGGREGATOR
+	default y
+	help
+	  Expands the Surface System Aggregator Module (SSAM) core driver by
+	  providing a dedicated bus and client-device type.
+
+	  This bus and device type are intended to provide and simplify support
+	  for non-platform and non-ACPI SSAM devices, i.e. SSAM devices that are
+	  not auto-detectable via the conventional means (e.g. ACPI).
+
 config SURFACE_AGGREGATOR_ERROR_INJECTION
 	bool "Surface System Aggregator Module Error Injection Capabilities"
 	depends on SURFACE_AGGREGATOR
diff --git a/drivers/platform/surface/aggregator/Makefile b/drivers/platform/surface/aggregator/Makefile
index b8b24c8ec310..c112e2c7112b 100644
--- a/drivers/platform/surface/aggregator/Makefile
+++ b/drivers/platform/surface/aggregator/Makefile
@@ -11,3 +11,7 @@ surface_aggregator-objs += ssh_parser.o
 surface_aggregator-objs += ssh_packet_layer.o
 surface_aggregator-objs += ssh_request_layer.o
 surface_aggregator-objs += controller.o
+
+ifeq ($(CONFIG_SURFACE_AGGREGATOR_BUS),y)
+surface_aggregator-objs += bus.o
+endif
diff --git a/drivers/platform/surface/aggregator/bus.c b/drivers/platform/surface/aggregator/bus.c
new file mode 100644
index 000000000000..9f7b4f91a87e
--- /dev/null
+++ b/drivers/platform/surface/aggregator/bus.c
@@ -0,0 +1,415 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Surface System Aggregator Module bus and device integration.
+ *
+ * Copyright (C) 2019-2020 Maximilian Luz <luzmaximilian@gmail.com>
+ */
+
+#include <linux/device.h>
+#include <linux/slab.h>
+
+#include <linux/surface_aggregator/controller.h>
+#include <linux/surface_aggregator/device.h>
+
+#include "bus.h"
+#include "controller.h"
+
+static ssize_t modalias_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
+{
+	struct ssam_device *sdev = to_ssam_device(dev);
+
+	return sysfs_emit(buf, "ssam:d%02Xc%02Xt%02Xi%02Xf%02X\n",
+			sdev->uid.domain, sdev->uid.category, sdev->uid.target,
+			sdev->uid.instance, sdev->uid.function);
+}
+static DEVICE_ATTR_RO(modalias);
+
+static struct attribute *ssam_device_attrs[] = {
+	&dev_attr_modalias.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(ssam_device);
+
+static int ssam_device_uevent(struct device *dev, struct kobj_uevent_env *env)
+{
+	struct ssam_device *sdev = to_ssam_device(dev);
+
+	return add_uevent_var(env, "MODALIAS=ssam:d%02Xc%02Xt%02Xi%02Xf%02X",
+			      sdev->uid.domain, sdev->uid.category,
+			      sdev->uid.target, sdev->uid.instance,
+			      sdev->uid.function);
+}
+
+static void ssam_device_release(struct device *dev)
+{
+	struct ssam_device *sdev = to_ssam_device(dev);
+
+	ssam_controller_put(sdev->ctrl);
+	kfree(sdev);
+}
+
+const struct device_type ssam_device_type = {
+	.name    = "surface_aggregator_device",
+	.groups  = ssam_device_groups,
+	.uevent  = ssam_device_uevent,
+	.release = ssam_device_release,
+};
+EXPORT_SYMBOL_GPL(ssam_device_type);
+
+/**
+ * ssam_device_alloc() - Allocate and initialize a SSAM client device.
+ * @ctrl: The controller under which the device should be added.
+ * @uid:  The UID of the device to be added.
+ *
+ * Allocates and initializes a new client device. The parent of the device
+ * will be set to the controller device and the name will be set based on the
+ * UID. Note that the device still has to be added via ssam_device_add().
+ * Refer to that function for more details.
+ *
+ * Return: Returns the newly allocated and initialized SSAM client device, or
+ * %NULL if it could not be allocated.
+ */
+struct ssam_device *ssam_device_alloc(struct ssam_controller *ctrl,
+				      struct ssam_device_uid uid)
+{
+	struct ssam_device *sdev;
+
+	sdev = kzalloc(sizeof(*sdev), GFP_KERNEL);
+	if (!sdev)
+		return NULL;
+
+	device_initialize(&sdev->dev);
+	sdev->dev.bus = &ssam_bus_type;
+	sdev->dev.type = &ssam_device_type;
+	sdev->dev.parent = ssam_controller_device(ctrl);
+	sdev->ctrl = ssam_controller_get(ctrl);
+	sdev->uid = uid;
+
+	dev_set_name(&sdev->dev, "%02x:%02x:%02x:%02x:%02x",
+		     sdev->uid.domain, sdev->uid.category, sdev->uid.target,
+		     sdev->uid.instance, sdev->uid.function);
+
+	return sdev;
+}
+EXPORT_SYMBOL_GPL(ssam_device_alloc);
+
+/**
+ * ssam_device_add() - Add a SSAM client device.
+ * @sdev: The SSAM client device to be added.
+ *
+ * Added client devices must be guaranteed to always have a valid and active
+ * controller. Thus, this function will fail with %-ENODEV if the controller
+ * of the device has not been initialized yet, has been suspended, or has been
+ * shut down.
+ *
+ * The caller of this function should ensure that the corresponding call to
+ * ssam_device_remove() is issued before the controller is shut down. If the
+ * added device is a direct child of the controller device (default), it will
+ * be automatically removed when the controller is shut down.
+ *
+ * By default, the controller device will become the parent of the newly
+ * created client device. The parent may be changed before ssam_device_add is
+ * called, but care must be taken that a) the correct suspend/resume ordering
+ * is guaranteed and b) the client device does not outlive the controller,
+ * i.e. that the device is removed before the controller is being shut down.
+ * In case these guarantees have to be manually enforced, please refer to the
+ * ssam_client_link() and ssam_client_bind() functions, which are intended to
+ * set up device-links for this purpose.
+ *
+ * Return: Returns zero on success, a negative error code on failure.
+ */
+int ssam_device_add(struct ssam_device *sdev)
+{
+	int status;
+
+	/*
+	 * Ensure that we can only add new devices to a controller if it has
+	 * been started and is not going away soon. This works in combination
+	 * with ssam_controller_remove_clients to ensure driver presence for the
+	 * controller device, i.e. it ensures that the controller (sdev->ctrl)
+	 * is always valid and can be used for requests as long as the client
+	 * device we add here is registered as child under it. This essentially
+	 * guarantees that the client driver can always expect the preconditions
+	 * for functions like ssam_request_sync (controller has to be started
+	 * and is not suspended) to hold and thus does not have to check for
+	 * them.
+	 *
+	 * Note that for this to work, the controller has to be a parent device.
+	 * If it is not a direct parent, care has to be taken that the device is
+	 * removed via ssam_device_remove(), as device_unregister does not
+	 * remove child devices recursively.
+	 */
+	ssam_controller_statelock(sdev->ctrl);
+
+	if (sdev->ctrl->state != SSAM_CONTROLLER_STARTED) {
+		ssam_controller_stateunlock(sdev->ctrl);
+		return -ENODEV;
+	}
+
+	status = device_add(&sdev->dev);
+
+	ssam_controller_stateunlock(sdev->ctrl);
+	return status;
+}
+EXPORT_SYMBOL_GPL(ssam_device_add);
+
+/**
+ * ssam_device_remove() - Remove a SSAM client device.
+ * @sdev: The device to remove.
+ *
+ * Removes and unregisters the provided SSAM client device.
+ */
+void ssam_device_remove(struct ssam_device *sdev)
+{
+	device_unregister(&sdev->dev);
+}
+EXPORT_SYMBOL_GPL(ssam_device_remove);
+
+/**
+ * ssam_device_id_compatible() - Check if a device ID matches a UID.
+ * @id:  The device ID as potential match.
+ * @uid: The device UID matching against.
+ *
+ * Check if the given ID is a match for the given UID, i.e. if a device with
+ * the provided UID is compatible to the given ID following the match rules
+ * described in its &ssam_device_id.match_flags member.
+ *
+ * Return: Returns %true iff the given UID is compatible to the match rule
+ * described by the given ID, %false otherwise.
+ */
+static bool ssam_device_id_compatible(const struct ssam_device_id *id,
+				      struct ssam_device_uid uid)
+{
+	if (id->domain != uid.domain || id->category != uid.category)
+		return false;
+
+	if ((id->match_flags & SSAM_MATCH_TARGET) && id->target != uid.target)
+		return false;
+
+	if ((id->match_flags & SSAM_MATCH_INSTANCE) && id->instance != uid.instance)
+		return false;
+
+	if ((id->match_flags & SSAM_MATCH_FUNCTION) && id->function != uid.function)
+		return false;
+
+	return true;
+}
+
+/**
+ * ssam_device_id_is_null() - Check if a device ID is null.
+ * @id: The device ID to check.
+ *
+ * Check if a given device ID is null, i.e. all zeros. Used to check for the
+ * end of ``MODULE_DEVICE_TABLE(ssam, ...)`` or similar lists.
+ *
+ * Return: Returns %true if the given ID represents a null ID, %false
+ * otherwise.
+ */
+static bool ssam_device_id_is_null(const struct ssam_device_id *id)
+{
+	return id->match_flags == 0 &&
+		id->domain == 0 &&
+		id->category == 0 &&
+		id->target == 0 &&
+		id->instance == 0 &&
+		id->function == 0 &&
+		id->driver_data == 0;
+}
+
+/**
+ * ssam_device_id_match() - Find the matching ID table entry for the given UID.
+ * @table: The table to search in.
+ * @uid:   The UID to matched against the individual table entries.
+ *
+ * Find the first match for the provided device UID in the provided ID table
+ * and return it. Returns %NULL if no match could be found.
+ */
+const struct ssam_device_id *ssam_device_id_match(const struct ssam_device_id *table,
+						  const struct ssam_device_uid uid)
+{
+	const struct ssam_device_id *id;
+
+	for (id = table; !ssam_device_id_is_null(id); ++id)
+		if (ssam_device_id_compatible(id, uid))
+			return id;
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(ssam_device_id_match);
+
+/**
+ * ssam_device_get_match() - Find and return the ID matching the device in the
+ * ID table of the bound driver.
+ * @dev: The device for which to get the matching ID table entry.
+ *
+ * Find the fist match for the UID of the device in the ID table of the
+ * currently bound driver and return it. Returns %NULL if the device does not
+ * have a driver bound to it, the driver does not have match_table (i.e. it is
+ * %NULL), or there is no match in the driver's match_table.
+ *
+ * This function essentially calls ssam_device_id_match() with the ID table of
+ * the bound device driver and the UID of the device.
+ *
+ * Return: Returns the first match for the UID of the device in the device
+ * driver's match table, or %NULL if no such match could be found.
+ */
+const struct ssam_device_id *ssam_device_get_match(const struct ssam_device *dev)
+{
+	const struct ssam_device_driver *sdrv;
+
+	sdrv = to_ssam_device_driver(dev->dev.driver);
+	if (!sdrv)
+		return NULL;
+
+	if (!sdrv->match_table)
+		return NULL;
+
+	return ssam_device_id_match(sdrv->match_table, dev->uid);
+}
+EXPORT_SYMBOL_GPL(ssam_device_get_match);
+
+/**
+ * ssam_device_get_match_data() - Find the ID matching the device in the
+ * ID table of the bound driver and return its ``driver_data`` member.
+ * @dev: The device for which to get the match data.
+ *
+ * Find the fist match for the UID of the device in the ID table of the
+ * corresponding driver and return its driver_data. Returns %NULL if the
+ * device does not have a driver bound to it, the driver does not have
+ * match_table (i.e. it is %NULL), there is no match in the driver's
+ * match_table, or the match does not have any driver_data.
+ *
+ * This function essentially calls ssam_device_get_match() and, if any match
+ * could be found, returns its ``struct ssam_device_id.driver_data`` member.
+ *
+ * Return: Returns the driver data associated with the first match for the UID
+ * of the device in the device driver's match table, or %NULL if no such match
+ * could be found.
+ */
+const void *ssam_device_get_match_data(const struct ssam_device *dev)
+{
+	const struct ssam_device_id *id;
+
+	id = ssam_device_get_match(dev);
+	if (!id)
+		return NULL;
+
+	return (const void *)id->driver_data;
+}
+EXPORT_SYMBOL_GPL(ssam_device_get_match_data);
+
+static int ssam_bus_match(struct device *dev, struct device_driver *drv)
+{
+	struct ssam_device_driver *sdrv = to_ssam_device_driver(drv);
+	struct ssam_device *sdev = to_ssam_device(dev);
+
+	if (!is_ssam_device(dev))
+		return 0;
+
+	return !!ssam_device_id_match(sdrv->match_table, sdev->uid);
+}
+
+static int ssam_bus_probe(struct device *dev)
+{
+	return to_ssam_device_driver(dev->driver)
+		->probe(to_ssam_device(dev));
+}
+
+static int ssam_bus_remove(struct device *dev)
+{
+	struct ssam_device_driver *sdrv = to_ssam_device_driver(dev->driver);
+
+	if (sdrv->remove)
+		sdrv->remove(to_ssam_device(dev));
+
+	return 0;
+}
+
+struct bus_type ssam_bus_type = {
+	.name   = "surface_aggregator",
+	.match  = ssam_bus_match,
+	.probe  = ssam_bus_probe,
+	.remove = ssam_bus_remove,
+};
+EXPORT_SYMBOL_GPL(ssam_bus_type);
+
+/**
+ * __ssam_device_driver_register() - Register a SSAM client device driver.
+ * @sdrv:  The driver to register.
+ * @owner: The module owning the provided driver.
+ *
+ * Please refer to the ssam_device_driver_register() macro for the normal way
+ * to register a driver from inside its owning module.
+ */
+int __ssam_device_driver_register(struct ssam_device_driver *sdrv,
+				  struct module *owner)
+{
+	sdrv->driver.owner = owner;
+	sdrv->driver.bus = &ssam_bus_type;
+
+	/* force drivers to async probe so I/O is possible in probe */
+	sdrv->driver.probe_type = PROBE_PREFER_ASYNCHRONOUS;
+
+	return driver_register(&sdrv->driver);
+}
+EXPORT_SYMBOL_GPL(__ssam_device_driver_register);
+
+/**
+ * ssam_device_driver_unregister - Unregister a SSAM device driver.
+ * @sdrv: The driver to unregister.
+ */
+void ssam_device_driver_unregister(struct ssam_device_driver *sdrv)
+{
+	driver_unregister(&sdrv->driver);
+}
+EXPORT_SYMBOL_GPL(ssam_device_driver_unregister);
+
+static int ssam_remove_device(struct device *dev, void *_data)
+{
+	struct ssam_device *sdev = to_ssam_device(dev);
+
+	if (is_ssam_device(dev))
+		ssam_device_remove(sdev);
+
+	return 0;
+}
+
+/**
+ * ssam_controller_remove_clients() - Remove SSAM client devices registered as
+ * direct children under the given controller.
+ * @ctrl: The controller to remove all direct clients for.
+ *
+ * Remove all SSAM client devices registered as direct children under the
+ * given controller. Note that this only accounts for direct children of the
+ * controller device. This does not take care of any client devices where the
+ * parent device has been manually set before calling ssam_device_add. Refer
+ * to ssam_device_add()/ssam_device_remove() for more details on those cases.
+ *
+ * To avoid new devices being added in parallel to this call, the main
+ * controller lock (not statelock) must be held during this (and if
+ * necessary, any subsequent deinitialization) call.
+ */
+void ssam_controller_remove_clients(struct ssam_controller *ctrl)
+{
+	struct device *dev;
+
+	dev = ssam_controller_device(ctrl);
+	device_for_each_child_reverse(dev, NULL, ssam_remove_device);
+}
+
+/**
+ * ssam_bus_register() - Register and set-up the SSAM client device bus.
+ */
+int ssam_bus_register(void)
+{
+	return bus_register(&ssam_bus_type);
+}
+
+/**
+ * ssam_bus_unregister() - Unregister the SSAM client device bus.
+ */
+void ssam_bus_unregister(void)
+{
+	return bus_unregister(&ssam_bus_type);
+}
diff --git a/drivers/platform/surface/aggregator/bus.h b/drivers/platform/surface/aggregator/bus.h
new file mode 100644
index 000000000000..7712baaed6a5
--- /dev/null
+++ b/drivers/platform/surface/aggregator/bus.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Surface System Aggregator Module bus and device integration.
+ *
+ * Copyright (C) 2019-2020 Maximilian Luz <luzmaximilian@gmail.com>
+ */
+
+#ifndef _SURFACE_AGGREGATOR_BUS_H
+#define _SURFACE_AGGREGATOR_BUS_H
+
+#include <linux/surface_aggregator/controller.h>
+
+#ifdef CONFIG_SURFACE_AGGREGATOR_BUS
+
+void ssam_controller_remove_clients(struct ssam_controller *ctrl);
+
+int ssam_bus_register(void);
+void ssam_bus_unregister(void);
+
+#else /* CONFIG_SURFACE_AGGREGATOR_BUS */
+
+static inline void ssam_controller_remove_clients(struct ssam_controller *ctrl) {}
+static inline int ssam_bus_register(void) { return 0; }
+static inline void ssam_bus_unregister(void) {}
+
+#endif /* CONFIG_SURFACE_AGGREGATOR_BUS */
+#endif /* _SURFACE_AGGREGATOR_BUS_H */
diff --git a/drivers/platform/surface/aggregator/core.c b/drivers/platform/surface/aggregator/core.c
index b5d44ab61f06..cde66c497d3e 100644
--- a/drivers/platform/surface/aggregator/core.c
+++ b/drivers/platform/surface/aggregator/core.c
@@ -22,6 +22,8 @@
 #include <linux/sysfs.h>

 #include <linux/surface_aggregator/controller.h>
+
+#include "bus.h"
 #include "controller.h"

 #define CREATE_TRACE_POINTS
@@ -733,6 +735,9 @@ static void ssam_serial_hub_remove(struct serdev_device *serdev)
 	sysfs_remove_group(&serdev->dev.kobj, &ssam_sam_group);
 	ssam_controller_lock(ctrl);

+	/* Remove all client devices. */
+	ssam_controller_remove_clients(ctrl);
+
 	/* Act as if suspending to silence events. */
 	status = ssam_ctrl_notif_display_off(ctrl);
 	if (status) {
@@ -785,6 +790,10 @@ static int __init ssam_core_init(void)
 {
 	int status;

+	status = ssam_bus_register();
+	if (status)
+		goto err_bus;
+
 	status = ssh_ctrl_packet_cache_init();
 	if (status)
 		goto err_cpkg;
@@ -804,6 +813,8 @@ static int __init ssam_core_init(void)
 err_evitem:
 	ssh_ctrl_packet_cache_destroy();
 err_cpkg:
+	ssam_bus_unregister();
+err_bus:
 	return status;
 }
 module_init(ssam_core_init);
@@ -813,6 +824,7 @@ static void __exit ssam_core_exit(void)
 	serdev_device_driver_unregister(&ssam_serial_hub);
 	ssam_event_item_cache_destroy();
 	ssh_ctrl_packet_cache_destroy();
+	ssam_bus_unregister();
 }
 module_exit(ssam_core_exit);

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 5b08a473cdba..0b8f1feefe0e 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -838,4 +838,22 @@ struct mhi_device_id {
 	kernel_ulong_t driver_data;
 };

+/* Surface System Aggregator Module */
+
+#define SSAM_MATCH_TARGET	0x1
+#define SSAM_MATCH_INSTANCE	0x2
+#define SSAM_MATCH_FUNCTION	0x4
+
+struct ssam_device_id {
+	__u8 match_flags;
+
+	__u8 domain;
+	__u8 category;
+	__u8 target;
+	__u8 instance;
+	__u8 function;
+
+	kernel_ulong_t driver_data;
+};
+
 #endif /* LINUX_MOD_DEVICETABLE_H */
diff --git a/include/linux/surface_aggregator/device.h b/include/linux/surface_aggregator/device.h
new file mode 100644
index 000000000000..7221d4a9c1c1
--- /dev/null
+++ b/include/linux/surface_aggregator/device.h
@@ -0,0 +1,423 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Surface System Aggregator Module (SSAM) bus and client-device subsystem.
+ *
+ * Main interface for the surface-aggregator bus, surface-aggregator client
+ * devices, and respective drivers building on top of the SSAM controller.
+ * Provides support for non-platform/non-ACPI SSAM clients via dedicated
+ * subsystem.
+ *
+ * Copyright (C) 2019-2020 Maximilian Luz <luzmaximilian@gmail.com>
+ */
+
+#ifndef _LINUX_SURFACE_AGGREGATOR_DEVICE_H
+#define _LINUX_SURFACE_AGGREGATOR_DEVICE_H
+
+#include <linux/device.h>
+#include <linux/mod_devicetable.h>
+#include <linux/types.h>
+
+#include <linux/surface_aggregator/controller.h>
+
+
+/* -- Surface System Aggregator Module bus. --------------------------------- */
+
+/**
+ * enum ssam_device_domain - SAM device domain.
+ * @SSAM_DOMAIN_VIRTUAL:   Virtual device.
+ * @SSAM_DOMAIN_SERIALHUB: Physical device connected via Surface Serial Hub.
+ */
+enum ssam_device_domain {
+	SSAM_DOMAIN_VIRTUAL   = 0x00,
+	SSAM_DOMAIN_SERIALHUB = 0x01,
+};
+
+/**
+ * enum ssam_virtual_tc - Target categories for the virtual SAM domain.
+ * @SSAM_VIRTUAL_TC_HUB: Device hub category.
+ */
+enum ssam_virtual_tc {
+	SSAM_VIRTUAL_TC_HUB = 0x00,
+};
+
+/**
+ * struct ssam_device_uid - Unique identifier for SSAM device.
+ * @domain:   Domain of the device.
+ * @category: Target category of the device.
+ * @target:   Target ID of the device.
+ * @instance: Instance ID of the device.
+ * @function: Sub-function of the device. This field can be used to split a
+ *            single SAM device into multiple virtual subdevices to separate
+ *            different functionality of that device and allow one driver per
+ *            such functionality.
+ */
+struct ssam_device_uid {
+	u8 domain;
+	u8 category;
+	u8 target;
+	u8 instance;
+	u8 function;
+};
+
+/*
+ * Special values for device matching.
+ *
+ * These values are intended to be used with SSAM_DEVICE(), SSAM_VDEV(), and
+ * SSAM_SDEV() exclusively. Specifically, they are used to initialize the
+ * match_flags member of the device ID structure. Do not use them directly
+ * with struct ssam_device_id or struct ssam_device_uid.
+ */
+#define SSAM_ANY_TID		0xffff
+#define SSAM_ANY_IID		0xffff
+#define SSAM_ANY_FUN		0xffff
+
+/**
+ * SSAM_DEVICE() - Initialize a &struct ssam_device_id with the given
+ * parameters.
+ * @d:   Domain of the device.
+ * @cat: Target category of the device.
+ * @tid: Target ID of the device.
+ * @iid: Instance ID of the device.
+ * @fun: Sub-function of the device.
+ *
+ * Initializes a &struct ssam_device_id with the given parameters. See &struct
+ * ssam_device_uid for details regarding the parameters. The special values
+ * %SSAM_ANY_TID, %SSAM_ANY_IID, and %SSAM_ANY_FUN can be used to specify that
+ * matching should ignore target ID, instance ID, and/or sub-function,
+ * respectively. This macro initializes the ``match_flags`` field based on the
+ * given parameters.
+ *
+ * Note: The parameters @d and @cat must be valid &u8 values, the parameters
+ * @tid, @iid, and @fun must be either valid &u8 values or %SSAM_ANY_TID,
+ * %SSAM_ANY_IID, or %SSAM_ANY_FUN, respectively. Other non-&u8 values are not
+ * allowed.
+ */
+#define SSAM_DEVICE(d, cat, tid, iid, fun)					\
+	.match_flags = (((tid) != SSAM_ANY_TID) ? SSAM_MATCH_TARGET : 0)	\
+		     | (((iid) != SSAM_ANY_IID) ? SSAM_MATCH_INSTANCE : 0)	\
+		     | (((fun) != SSAM_ANY_FUN) ? SSAM_MATCH_FUNCTION : 0),	\
+	.domain   = d,								\
+	.category = cat,							\
+	.target   = ((tid) != SSAM_ANY_TID) ? (tid) : 0,			\
+	.instance = ((iid) != SSAM_ANY_IID) ? (iid) : 0,			\
+	.function = ((fun) != SSAM_ANY_FUN) ? (fun) : 0				\
+
+/**
+ * SSAM_VDEV() - Initialize a &struct ssam_device_id as virtual device with
+ * the given parameters.
+ * @cat: Target category of the device.
+ * @tid: Target ID of the device.
+ * @iid: Instance ID of the device.
+ * @fun: Sub-function of the device.
+ *
+ * Initializes a &struct ssam_device_id with the given parameters in the
+ * virtual domain. See &struct ssam_device_uid for details regarding the
+ * parameters. The special values %SSAM_ANY_TID, %SSAM_ANY_IID, and
+ * %SSAM_ANY_FUN can be used to specify that matching should ignore target ID,
+ * instance ID, and/or sub-function, respectively. This macro initializes the
+ * ``match_flags`` field based on the given parameters.
+ *
+ * Note: The parameter @cat must be a valid &u8 value, the parameters @tid,
+ * @iid, and @fun must be either valid &u8 values or %SSAM_ANY_TID,
+ * %SSAM_ANY_IID, or %SSAM_ANY_FUN, respectively. Other non-&u8 values are not
+ * allowed.
+ */
+#define SSAM_VDEV(cat, tid, iid, fun) \
+	SSAM_DEVICE(SSAM_DOMAIN_VIRTUAL, SSAM_VIRTUAL_TC_##cat, tid, iid, fun)
+
+/**
+ * SSAM_SDEV() - Initialize a &struct ssam_device_id as physical SSH device
+ * with the given parameters.
+ * @cat: Target category of the device.
+ * @tid: Target ID of the device.
+ * @iid: Instance ID of the device.
+ * @fun: Sub-function of the device.
+ *
+ * Initializes a &struct ssam_device_id with the given parameters in the SSH
+ * domain. See &struct ssam_device_uid for details regarding the parameters.
+ * The special values %SSAM_ANY_TID, %SSAM_ANY_IID, and %SSAM_ANY_FUN can be
+ * used to specify that matching should ignore target ID, instance ID, and/or
+ * sub-function, respectively. This macro initializes the ``match_flags``
+ * field based on the given parameters.
+ *
+ * Note: The parameter @cat must be a valid &u8 value, the parameters @tid,
+ * @iid, and @fun must be either valid &u8 values or %SSAM_ANY_TID,
+ * %SSAM_ANY_IID, or %SSAM_ANY_FUN, respectively. Other non-&u8 values are not
+ * allowed.
+ */
+#define SSAM_SDEV(cat, tid, iid, fun) \
+	SSAM_DEVICE(SSAM_DOMAIN_SERIALHUB, SSAM_SSH_TC_##cat, tid, iid, fun)
+
+/**
+ * struct ssam_device - SSAM client device.
+ * @dev:  Driver model representation of the device.
+ * @ctrl: SSAM controller managing this device.
+ * @uid:  UID identifying the device.
+ */
+struct ssam_device {
+	struct device dev;
+	struct ssam_controller *ctrl;
+
+	struct ssam_device_uid uid;
+};
+
+/**
+ * struct ssam_device_driver - SSAM client device driver.
+ * @driver:      Base driver model structure.
+ * @match_table: Match table specifying which devices the driver should bind to.
+ * @probe:       Called when the driver is being bound to a device.
+ * @remove:      Called when the driver is being unbound from the device.
+ */
+struct ssam_device_driver {
+	struct device_driver driver;
+
+	const struct ssam_device_id *match_table;
+
+	int  (*probe)(struct ssam_device *sdev);
+	void (*remove)(struct ssam_device *sdev);
+};
+
+extern struct bus_type ssam_bus_type;
+extern const struct device_type ssam_device_type;
+
+/**
+ * is_ssam_device() - Check if the given device is a SSAM client device.
+ * @d: The device to test the type of.
+ *
+ * Return: Returns %true iff the specified device is of type &struct
+ * ssam_device, i.e. the device type points to %ssam_device_type, and %false
+ * otherwise.
+ */
+static inline bool is_ssam_device(struct device *d)
+{
+	return d->type == &ssam_device_type;
+}
+
+/**
+ * to_ssam_device() - Casts the given device to a SSAM client device.
+ * @d: The device to cast.
+ *
+ * Casts the given &struct device to a &struct ssam_device. The caller has to
+ * ensure that the given device is actually enclosed in a &struct ssam_device,
+ * e.g. by calling is_ssam_device().
+ *
+ * Return: Returns a pointer to the &struct ssam_device wrapping the given
+ * device @d.
+ */
+static inline struct ssam_device *to_ssam_device(struct device *d)
+{
+	return container_of(d, struct ssam_device, dev);
+}
+
+/**
+ * to_ssam_device_driver() - Casts the given device driver to a SSAM client
+ * device driver.
+ * @d: The driver to cast.
+ *
+ * Casts the given &struct device_driver to a &struct ssam_device_driver. The
+ * caller has to ensure that the given driver is actually enclosed in a
+ * &struct ssam_device_driver.
+ *
+ * Return: Returns the pointer to the &struct ssam_device_driver wrapping the
+ * given device driver @d.
+ */
+static inline
+struct ssam_device_driver *to_ssam_device_driver(struct device_driver *d)
+{
+	return container_of(d, struct ssam_device_driver, driver);
+}
+
+const struct ssam_device_id *ssam_device_id_match(const struct ssam_device_id *table,
+						  const struct ssam_device_uid uid);
+
+const struct ssam_device_id *ssam_device_get_match(const struct ssam_device *dev);
+
+const void *ssam_device_get_match_data(const struct ssam_device *dev);
+
+struct ssam_device *ssam_device_alloc(struct ssam_controller *ctrl,
+				      struct ssam_device_uid uid);
+
+int ssam_device_add(struct ssam_device *sdev);
+void ssam_device_remove(struct ssam_device *sdev);
+
+/**
+ * ssam_device_get() - Increment reference count of SSAM client device.
+ * @sdev: The device to increment the reference count of.
+ *
+ * Increments the reference count of the given SSAM client device by
+ * incrementing the reference count of the enclosed &struct device via
+ * get_device().
+ *
+ * See ssam_device_put() for the counter-part of this function.
+ *
+ * Return: Returns the device provided as input.
+ */
+static inline struct ssam_device *ssam_device_get(struct ssam_device *sdev)
+{
+	return sdev ? to_ssam_device(get_device(&sdev->dev)) : NULL;
+}
+
+/**
+ * ssam_device_put() - Decrement reference count of SSAM client device.
+ * @sdev: The device to decrement the reference count of.
+ *
+ * Decrements the reference count of the given SSAM client device by
+ * decrementing the reference count of the enclosed &struct device via
+ * put_device().
+ *
+ * See ssam_device_get() for the counter-part of this function.
+ */
+static inline void ssam_device_put(struct ssam_device *sdev)
+{
+	if (sdev)
+		put_device(&sdev->dev);
+}
+
+/**
+ * ssam_device_get_drvdata() - Get driver-data of SSAM client device.
+ * @sdev: The device to get the driver-data from.
+ *
+ * Return: Returns the driver-data of the given device, previously set via
+ * ssam_device_set_drvdata().
+ */
+static inline void *ssam_device_get_drvdata(struct ssam_device *sdev)
+{
+	return dev_get_drvdata(&sdev->dev);
+}
+
+/**
+ * ssam_device_set_drvdata() - Set driver-data of SSAM client device.
+ * @sdev: The device to set the driver-data of.
+ * @data: The data to set the device's driver-data pointer to.
+ */
+static inline void ssam_device_set_drvdata(struct ssam_device *sdev, void *data)
+{
+	dev_set_drvdata(&sdev->dev, data);
+}
+
+int __ssam_device_driver_register(struct ssam_device_driver *d, struct module *o);
+void ssam_device_driver_unregister(struct ssam_device_driver *d);
+
+/**
+ * ssam_device_driver_register() - Register a SSAM client device driver.
+ * @drv: The driver to register.
+ */
+#define ssam_device_driver_register(drv) \
+	__ssam_device_driver_register(drv, THIS_MODULE)
+
+/**
+ * module_ssam_device_driver() - Helper macro for SSAM device driver
+ * registration.
+ * @drv: The driver managed by this module.
+ *
+ * Helper macro to register a SSAM device driver via module_init() and
+ * module_exit(). This macro may only be used once per module and replaces the
+ * aforementioned definitions.
+ */
+#define module_ssam_device_driver(drv)			\
+	module_driver(drv, ssam_device_driver_register,	\
+		      ssam_device_driver_unregister)
+
+
+/* -- Helpers for client-device requests. ----------------------------------- */
+
+/**
+ * SSAM_DEFINE_SYNC_REQUEST_CL_N() - Define synchronous client-device SAM
+ * request function with neither argument nor return value.
+ * @name: Name of the generated function.
+ * @spec: Specification (&struct ssam_request_spec_md) defining the request.
+ *
+ * Defines a function executing the synchronous SAM request specified by
+ * @spec, with the request having neither argument nor return value. Device
+ * specifying parameters are not hard-coded, but instead are provided via the
+ * client device, specifically its UID, supplied when calling this function.
+ * The generated function takes care of setting up the request struct, buffer
+ * allocation, as well as execution of the request itself, returning once the
+ * request has been fully completed. The required transport buffer will be
+ * allocated on the stack.
+ *
+ * The generated function is defined as ``int name(struct ssam_device *sdev)``,
+ * returning the status of the request, which is zero on success and negative
+ * on failure. The ``sdev`` parameter specifies both the target device of the
+ * request and by association the controller via which the request is sent.
+ *
+ * Refer to ssam_request_sync_onstack() for more details on the behavior of
+ * the generated function.
+ */
+#define SSAM_DEFINE_SYNC_REQUEST_CL_N(name, spec...)			\
+	SSAM_DEFINE_SYNC_REQUEST_MD_N(__raw_##name, spec)		\
+	int name(struct ssam_device *sdev)				\
+	{								\
+		return __raw_##name(sdev->ctrl, sdev->uid.target,	\
+				    sdev->uid.instance);		\
+	}
+
+/**
+ * SSAM_DEFINE_SYNC_REQUEST_CL_W() - Define synchronous client-device SAM
+ * request function with argument.
+ * @name:  Name of the generated function.
+ * @atype: Type of the request's argument.
+ * @spec:  Specification (&struct ssam_request_spec_md) defining the request.
+ *
+ * Defines a function executing the synchronous SAM request specified by
+ * @spec, with the request taking an argument of type @atype and having no
+ * return value. Device specifying parameters are not hard-coded, but instead
+ * are provided via the client device, specifically its UID, supplied when
+ * calling this function. The generated function takes care of setting up the
+ * request struct, buffer allocation, as well as execution of the request
+ * itself, returning once the request has been fully completed. The required
+ * transport buffer will be allocated on the stack.
+ *
+ * The generated function is defined as ``int name(struct ssam_device *sdev,
+ * const atype *arg)``, returning the status of the request, which is zero on
+ * success and negative on failure. The ``sdev`` parameter specifies both the
+ * target device of the request and by association the controller via which
+ * the request is sent. The request's argument is specified via the ``arg``
+ * pointer.
+ *
+ * Refer to ssam_request_sync_onstack() for more details on the behavior of
+ * the generated function.
+ */
+#define SSAM_DEFINE_SYNC_REQUEST_CL_W(name, atype, spec...)		\
+	SSAM_DEFINE_SYNC_REQUEST_MD_W(__raw_##name, atype, spec)	\
+	int name(struct ssam_device *sdev, const atype *arg)		\
+	{								\
+		return __raw_##name(sdev->ctrl, sdev->uid.target,	\
+				    sdev->uid.instance, arg);		\
+	}
+
+/**
+ * SSAM_DEFINE_SYNC_REQUEST_CL_R() - Define synchronous client-device SAM
+ * request function with return value.
+ * @name:  Name of the generated function.
+ * @rtype: Type of the request's return value.
+ * @spec:  Specification (&struct ssam_request_spec_md) defining the request.
+ *
+ * Defines a function executing the synchronous SAM request specified by
+ * @spec, with the request taking no argument but having a return value of
+ * type @rtype. Device specifying parameters are not hard-coded, but instead
+ * are provided via the client device, specifically its UID, supplied when
+ * calling this function. The generated function takes care of setting up the
+ * request struct, buffer allocation, as well as execution of the request
+ * itself, returning once the request has been fully completed. The required
+ * transport buffer will be allocated on the stack.
+ *
+ * The generated function is defined as ``int name(struct ssam_device *sdev,
+ * rtype *ret)``, returning the status of the request, which is zero on
+ * success and negative on failure. The ``sdev`` parameter specifies both the
+ * target device of the request and by association the controller via which
+ * the request is sent. The request's return value is written to the memory
+ * pointed to by the ``ret`` parameter.
+ *
+ * Refer to ssam_request_sync_onstack() for more details on the behavior of
+ * the generated function.
+ */
+#define SSAM_DEFINE_SYNC_REQUEST_CL_R(name, rtype, spec...)		\
+	SSAM_DEFINE_SYNC_REQUEST_MD_R(__raw_##name, rtype, spec)	\
+	int name(struct ssam_device *sdev, rtype *ret)			\
+	{								\
+		return __raw_##name(sdev->ctrl, sdev->uid.target,	\
+				    sdev->uid.instance, ret);		\
+	}
+
+#endif /* _LINUX_SURFACE_AGGREGATOR_DEVICE_H */
diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
index 27007c18e754..4339377ad929 100644
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@ -243,5 +243,13 @@ int main(void)
 	DEVID(mhi_device_id);
 	DEVID_FIELD(mhi_device_id, chan);

+	DEVID(ssam_device_id);
+	DEVID_FIELD(ssam_device_id, match_flags);
+	DEVID_FIELD(ssam_device_id, domain);
+	DEVID_FIELD(ssam_device_id, category);
+	DEVID_FIELD(ssam_device_id, target);
+	DEVID_FIELD(ssam_device_id, instance);
+	DEVID_FIELD(ssam_device_id, function);
+
 	return 0;
 }
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 2417dd1dee33..5b79fdc42641 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -1368,6 +1368,28 @@ static int do_mhi_entry(const char *filename, void *symval, char *alias)
 	return 1;
 }

+/*
+ * Looks like: ssam:dNcNtNiNfN
+ *
+ * N is exactly 2 digits, where each is an upper-case hex digit.
+ */
+static int do_ssam_entry(const char *filename, void *symval, char *alias)
+{
+	DEF_FIELD(symval, ssam_device_id, match_flags);
+	DEF_FIELD(symval, ssam_device_id, domain);
+	DEF_FIELD(symval, ssam_device_id, category);
+	DEF_FIELD(symval, ssam_device_id, target);
+	DEF_FIELD(symval, ssam_device_id, instance);
+	DEF_FIELD(symval, ssam_device_id, function);
+
+	sprintf(alias, "ssam:d%02Xc%02X", domain, category);
+	ADD(alias, "t", match_flags & SSAM_MATCH_TARGET, target);
+	ADD(alias, "i", match_flags & SSAM_MATCH_INSTANCE, instance);
+	ADD(alias, "f", match_flags & SSAM_MATCH_FUNCTION, function);
+
+	return 1;
+}
+
 /* Does namelen bytes of name exactly match the symbol? */
 static bool sym_is(const char *name, unsigned namelen, const char *symbol)
 {
@@ -1442,6 +1464,7 @@ static const struct devtable devtable[] = {
 	{"tee", SIZE_tee_client_device_id, do_tee_entry},
 	{"wmi", SIZE_wmi_device_id, do_wmi_entry},
 	{"mhi", SIZE_mhi_device_id, do_mhi_entry},
+	{"ssam", SIZE_ssam_device_id, do_ssam_entry},
 };

 /* Create MODULE_ALIAS() statements.
--
2.29.2

