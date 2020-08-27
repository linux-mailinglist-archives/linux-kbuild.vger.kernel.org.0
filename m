Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91F44254E26
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Aug 2020 21:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727957AbgH0TW5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 27 Aug 2020 15:22:57 -0400
Received: from mx2.veeam.com ([12.182.39.6]:47842 "EHLO mx2.veeam.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726236AbgH0TW4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 27 Aug 2020 15:22:56 -0400
X-Greylist: delayed 533 seconds by postgrey-1.27 at vger.kernel.org; Thu, 27 Aug 2020 15:22:53 EDT
Received: from mail.veeam.com (prgmbx01.amust.local [172.24.0.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx2.veeam.com (Postfix) with ESMTPS id CEDCF413A9;
        Thu, 27 Aug 2020 15:13:57 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=veeam.com; s=mx2;
        t=1598555638; bh=YLMeDFdTFm2zg31VhJtBC0YxoCrw3uCbRW9Q0Rocgk0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References:From;
        b=eP96DmYtoRb7613mhyxwcB7HYAVGZTZIUaqodDVilZ5ZYo7LuNe6RKg44N7PQXltI
         IpEFXrWMjKxJXIjp1Wci6i3++bs0edv9izCHpVopxzEkOji6QbVS+Y3OyRRfY2lx17
         yyn9X3+TBBK4mlgss/s9g/n3pbXdPGK00mvWdZn8=
Received: from prgdevlinuxpatch01.amust.local (172.24.14.5) by
 prgmbx01.amust.local (172.24.0.171) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.595.3;
 Thu, 27 Aug 2020 21:13:53 +0200
From:   Sergei Shtepa <sergei.shtepa@veeam.com>
To:     <masahiroy@kernel.org>, <michal.lkml@markovi.net>,
        <axboe@kernel.dk>, <koct9i@gmail.com>, <jack@suse.cz>,
        <damien.lemoal@wdc.com>, <ming.lei@redhat.com>, <steve@sk2.org>,
        <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-block@vger.kernel.org>
CC:     Sergei Shtepa <sergei.shtepa@veeam.com>
Subject: [PATCH 1/1] block io layer filters api
Date:   Thu, 27 Aug 2020 22:13:39 +0300
Message-ID: <1598555619-14792-2-git-send-email-sergei.shtepa@veeam.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1598555619-14792-1-git-send-email-sergei.shtepa@veeam.com>
References: <1598555619-14792-1-git-send-email-sergei.shtepa@veeam.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.24.14.5]
X-ClientProxiedBy: prgmbx02.amust.local (172.24.0.172) To prgmbx01.amust.local
 (172.24.0.171)
X-EsetResult: clean, is OK
X-EsetId: 37303A29C604D26B607C6A
X-Veeam-MMEX: True
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx2.veeam.com [172.18.16.6]); Thu, 27 Aug 2020 15:13:58 -0400 (EDT)
X-Veeam-MailScanner-Information: Please contact email@veeam.com if you have any problems
X-Spam-Status: No
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

to register a filter a user of the API would call blk_filter_register()
with blk_filter_ops that would allow it to intercept the following events
in the system:
* bio requests
* addition of a disk
* removal of a disk

to unregister a filter a user of the API would call
blk_filter_unregister() multiple filters can be stacked at different
altitudes when bio request is intercepted, it can be passed to filter
at lower level or it can be sent for completion

Signed-off-by: Sergei Shtepa <sergei.shtepa@veeam.com>
---
 block/Kconfig               |  11 ++
 block/Makefile              |   1 +
 block/blk-core.c            |  11 +-
 block/blk-filter-internal.h |  34 +++++
 block/blk-filter.c          | 288 ++++++++++++++++++++++++++++++++++++
 block/genhd.c               |  24 +++
 include/linux/blk-filter.h  |  41 +++++
 include/linux/genhd.h       |   2 +
 8 files changed, 410 insertions(+), 2 deletions(-)
 create mode 100644 block/blk-filter-internal.h
 create mode 100644 block/blk-filter.c
 create mode 100644 include/linux/blk-filter.h

diff --git a/block/Kconfig b/block/Kconfig
index bbad5e8bbffe..a308801b4376 100644
--- a/block/Kconfig
+++ b/block/Kconfig
@@ -204,6 +204,17 @@ config BLK_INLINE_ENCRYPTION_FALLBACK
 	  by falling back to the kernel crypto API when inline
 	  encryption hardware is not present.
 
+config BLK_FILTER
+	bool "Enable support for block layer filters"
+	default y
+	depends on MODULES
+	help
+	  Enabling this lets third-party kernel modules intercept
+	  bio requests for any block device. This allows them to implement
+	  changed block tracking and snapshots without any reconfiguration of
+	  the existing setup. For example, this option allows snapshotting of
+	  a block device without adding it to LVM.
+
 menu "Partition Types"
 
 source "block/partitions/Kconfig"
diff --git a/block/Makefile b/block/Makefile
index 8d841f5f986f..b8ee50b8e031 100644
--- a/block/Makefile
+++ b/block/Makefile
@@ -38,3 +38,4 @@ obj-$(CONFIG_BLK_SED_OPAL)	+= sed-opal.o
 obj-$(CONFIG_BLK_PM)		+= blk-pm.o
 obj-$(CONFIG_BLK_INLINE_ENCRYPTION)	+= keyslot-manager.o blk-crypto.o
 obj-$(CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK)	+= blk-crypto-fallback.o
+obj-$(CONFIG_BLK_FILTER)	+= blk-filter.o
diff --git a/block/blk-core.c b/block/blk-core.c
index d9d632639bd1..3421ddeb69e5 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -50,6 +50,7 @@
 #include "blk-mq-sched.h"
 #include "blk-pm.h"
 #include "blk-rq-qos.h"
+#include "blk-filter-internal.h"
 
 struct dentry *blk_debugfs_root;
 
@@ -1273,13 +1274,19 @@ blk_qc_t submit_bio(struct bio *bio)
 		blk_qc_t ret;
 
 		psi_memstall_enter(&pflags);
-		ret = submit_bio_noacct(bio);
+		if (IS_ENABLED(CONFIG_BLK_FILTER))
+			ret = blk_filter_submit_bio(bio);
+		else
+			ret = submit_bio_noacct(bio);
 		psi_memstall_leave(&pflags);
 
 		return ret;
 	}
 
-	return submit_bio_noacct(bio);
+	if (IS_ENABLED(CONFIG_BLK_FILTER))
+		return blk_filter_submit_bio(bio);
+	else
+		return submit_bio_noacct(bio);
 }
 EXPORT_SYMBOL(submit_bio);
 
diff --git a/block/blk-filter-internal.h b/block/blk-filter-internal.h
new file mode 100644
index 000000000000..942066f3fecb
--- /dev/null
+++ b/block/blk-filter-internal.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ *
+ * Block device filters internal declarations
+ */
+
+#ifndef BLK_FILTER_INTERNAL_H
+#define BLK_FILTER_INTERNAL_H
+
+#ifdef CONFIG_BLK_FILTER
+#include <linux/blk-filter.h>
+
+void blk_filter_disk_add(struct gendisk *disk);
+
+void blk_filter_disk_del(struct gendisk *disk);
+
+void blk_filter_disk_release(struct gendisk *disk);
+
+blk_qc_t blk_filter_submit_bio(struct bio *bio);
+
+#else /* CONFIG_BLK_FILTER */
+
+static inline void blk_filter_disk_add(struct gendisk *disk) { }
+
+static inline void blk_filter_disk_del(struct gendisk *disk) { }
+
+static inline void blk_filter_disk_release(struct gendisk *disk) { }
+
+static inline blk_qc_t blk_filter_submit_bio(struct bio *bio) { return 0; }
+
+#endif /* CONFIG_BLK_FILTER */
+
+#endif
diff --git a/block/blk-filter.c b/block/blk-filter.c
new file mode 100644
index 000000000000..edb30f342a3d
--- /dev/null
+++ b/block/blk-filter.c
@@ -0,0 +1,288 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/genhd.h>
+#include <linux/bio.h>
+#include <linux/blkdev.h>
+#include "blk-filter-internal.h"
+#include <linux/rwsem.h>
+
+struct blk_filter_ctx {
+	struct blk_filter *filter;
+	/*
+	 * Reserved for extension
+	 */
+};
+
+DECLARE_RWSEM(blk_filter_ctx_list_lock);
+struct blk_filter_ctx *blk_filter_ctx_list[BLK_FILTER_ALTITUDE_MAX] = { 0 };
+
+static inline struct blk_filter_ctx *_get_ctx(size_t altitude)
+{
+	return blk_filter_ctx_list[altitude-1];
+}
+
+static inline void _set_ctx(size_t altitude, struct blk_filter_ctx *ctx)
+{
+	blk_filter_ctx_list[altitude-1] = ctx;
+}
+
+static struct blk_filter_ctx *_blk_ctx_new(struct blk_filter *filter)
+{
+	struct blk_filter_ctx *ctx = kzalloc(sizeof(struct blk_filter_ctx), GFP_KERNEL);
+
+	if (!ctx)
+		return ctx;
+
+	ctx->filter = filter;
+
+	return ctx;
+}
+
+static int _blk_ctx_link(struct blk_filter_ctx *ctx, size_t altitude)
+{
+	int result = 0;
+
+	if (altitude > BLK_FILTER_ALTITUDE_MAX)
+		return -ENOENT;
+
+	down_write(&blk_filter_ctx_list_lock);
+
+	if (_get_ctx(altitude))
+		result = -EEXIST;
+	else
+		_set_ctx(altitude, ctx);
+
+	up_write(&blk_filter_ctx_list_lock);
+
+	return result;
+}
+
+static int _blk_ctx_unlink(struct blk_filter_ctx *ctx)
+{
+	int result = -EEXIST;
+	size_t altitude = BLK_FILTER_ALTITUDE_MIN;
+
+	down_write(&blk_filter_ctx_list_lock);
+
+	for (; altitude <= BLK_FILTER_ALTITUDE_MAX; ++altitude) {
+		if (_get_ctx(altitude) && (_get_ctx(altitude) == ctx)) {
+			_set_ctx(altitude, NULL);
+			result = 0;
+			break;
+		}
+	}
+
+	up_write(&blk_filter_ctx_list_lock);
+
+	return result;
+}
+
+/**
+ * blk_filter_disk_add() - Notify filters when a new disk is added.
+ * @disk: The new disk.
+ */
+void blk_filter_disk_add(struct gendisk *disk)
+{
+	size_t altitude = BLK_FILTER_ALTITUDE_MIN;
+
+	pr_warn("blk-filter: add disk [%s].\n", disk->disk_name);
+
+	down_read(&blk_filter_ctx_list_lock);
+
+	for (; altitude <= BLK_FILTER_ALTITUDE_MAX; ++altitude) {
+		struct blk_filter_ctx *ctx = _get_ctx(altitude);
+
+		if (ctx && ctx->filter->ops && ctx->filter->ops->disk_add)
+			ctx->filter->ops->disk_add(disk);
+	}
+
+	up_read(&blk_filter_ctx_list_lock);
+}
+
+/**
+ * blk_filter_disk_del() - Notify filters when the disk is deleted.
+ * @disk: The disk to delete.
+ */
+void blk_filter_disk_del(struct gendisk *disk)
+{
+	size_t altitude = BLK_FILTER_ALTITUDE_MIN;
+
+	pr_warn("blk-filter: del disk [%s].\n", disk->disk_name);
+
+	down_read(&blk_filter_ctx_list_lock);
+
+	for (; altitude <= BLK_FILTER_ALTITUDE_MAX; ++altitude) {
+		struct blk_filter_ctx *ctx = _get_ctx(altitude);
+
+		if (ctx && ctx->filter->ops && ctx->filter->ops->disk_del)
+			ctx->filter->ops->disk_del(disk);
+	}
+
+	up_read(&blk_filter_ctx_list_lock);
+}
+
+/**
+ * blk_filter_disk_release() - Notify filters when the disk is released.
+ * @disk: The disk to release.
+ */
+void blk_filter_disk_release(struct gendisk *disk)
+{
+	size_t altitude = BLK_FILTER_ALTITUDE_MAX;
+
+	pr_warn("blk-filter: release disk [%s].\n", disk->disk_name);
+
+	down_read(&blk_filter_ctx_list_lock);
+
+	for (; altitude <= BLK_FILTER_ALTITUDE_MIN; --altitude) {
+		struct blk_filter_ctx *ctx = _get_ctx(altitude);
+
+		if (ctx && ctx->filter->ops && ctx->filter->ops->disk_release)
+			ctx->filter->ops->disk_release(disk);
+	}
+
+	up_read(&blk_filter_ctx_list_lock);
+}
+
+/**
+ * blk_filter_submit_bio_altitude() - Send bio for porcessing to specific filter.
+ * @altitude: The filter altitude.
+ * @bio: The new bio for block I/O layer.
+ *
+ * Return: Bio submitting result, like for submit_bio function.
+ */
+blk_qc_t blk_filter_submit_bio_altitude(size_t altitude, struct bio *bio)
+{
+	blk_qc_t ret;
+	bool bypass = true;
+
+	down_read(&blk_filter_ctx_list_lock);
+	while (altitude >= BLK_FILTER_ALTITUDE_MIN) {
+		struct blk_filter_ctx *ctx = _get_ctx(altitude);
+
+		if (ctx && ctx->filter->ops && ctx->filter->ops->submit_bio) {
+			ret = ctx->filter->ops->submit_bio(bio);
+			bypass = false;
+			break;
+		}
+		--altitude;
+	}
+	up_read(&blk_filter_ctx_list_lock);
+
+	if (bypass)
+		ret = submit_bio_noacct(bio);
+
+	return ret;
+}
+
+/**
+ * blk_filter_submit_bio() - Send new bio to filters for processing.
+ * @bio: The new bio for block I/O layer.
+ *
+ * Return: Bio submitting result, like for submit_bio function.
+ */
+blk_qc_t blk_filter_submit_bio(struct bio *bio)
+{
+	return blk_filter_submit_bio_altitude(BLK_FILTER_ALTITUDE_MAX, bio);
+}
+
+/**
+ * blk_filter_register() - Create new block I/O layer filter.
+ * @filter: The filter description structure.
+ *
+ * Return: Zero if the filter was registered successfully or an error code if it failed.
+ */
+int blk_filter_register(struct blk_filter *filter)
+{
+	int result = 0;
+	struct blk_filter_ctx *ctx;
+
+	pr_warn("blk-filter: register filter [%s].\n", filter->name);
+
+	ctx = _blk_ctx_new(filter);
+	if (!ctx)
+		return -ENOMEM;
+
+	result = _blk_ctx_link(ctx, filter->altitude);
+	if (result)
+		goto failed;
+
+	filter->blk_filter_ctx = (void *)ctx;
+	return 0;
+
+failed:
+	kfree(ctx);
+	return result;
+}
+EXPORT_SYMBOL(blk_filter_register);
+
+/**
+ * blk_filter_unregister() - Remove existing block I/O layer filter.
+ * @filter: The filter description structure.
+ *
+ * Return: Zero if the filter was removed successfully or an error code if it failed.
+ */
+int blk_filter_unregister(struct blk_filter *filter)
+{
+	int result = 0;
+	struct blk_filter_ctx *ctx;
+
+	pr_warn("blk-filter: unregister filter [%s].\n", filter->name);
+
+	ctx = (struct blk_filter_ctx *)filter->blk_filter_ctx;
+
+	result = _blk_ctx_unlink(ctx);
+	if (result == 0)
+		kfree(ctx);
+
+	return result;
+}
+EXPORT_SYMBOL(blk_filter_unregister);
+
+/**
+ * blk_filter_check_altitude() - Checking that altitude is free.
+ * @altitude: The filter description structure.
+ *
+ * Return: NULL if the altitude is free or the name of the module registered at this altitude.
+ */
+const char *blk_filter_check_altitude(size_t altitude)
+{
+	struct blk_filter_ctx *ctx = _get_ctx(altitude);
+
+	if (!ctx)
+		return NULL;
+
+	return ctx->filter->name;
+}
+EXPORT_SYMBOL(blk_filter_check_altitude);
+
+static void _attach_fn(struct gendisk *disk, void *_ctx)
+{
+	struct blk_filter *filter = (struct blk_filter *)_ctx;
+
+	if (filter->ops && filter->ops->disk_add)
+		filter->ops->disk_add(disk);
+}
+
+/**
+ * blk_filter_attach_disks() - Enumerate all existing disks and call disk_add callback for each.
+ * @filter: The filter description structure.
+ *
+ * Return: Zero if the existing disks was attached successfully or an error code if it failed.
+ */
+int blk_filter_attach_disks(struct blk_filter *filter)
+{
+	return disk_enumerate(_attach_fn, filter);
+}
+EXPORT_SYMBOL(blk_filter_attach_disks);
+
+/**
+ * blk_filter_submit_bio_next() - Send a bio to the lower filters for processing.
+ * @bio: The bio for block I/O layer.
+ *
+ * Return: Bio submitting result, like for submit_bio function.
+ */
+blk_qc_t blk_filter_submit_bio_next(struct blk_filter *filter, struct bio *bio)
+{
+	return blk_filter_submit_bio_altitude(filter->altitude-1, bio);
+}
+EXPORT_SYMBOL(blk_filter_submit_bio_next);
diff --git a/block/genhd.c b/block/genhd.c
index 99c64641c314..c5604415e772 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -25,6 +25,7 @@
 #include <linux/badblocks.h>
 
 #include "blk.h"
+#include "blk-filter-internal.h"
 
 static DEFINE_MUTEX(block_class_lock);
 static struct kobject *block_depr;
@@ -837,6 +838,7 @@ static void __device_add_disk(struct device *parent, struct gendisk *disk,
 	 */
 	WARN_ON_ONCE(!blk_get_queue(disk->queue));
 
+	blk_filter_disk_add(disk);
 	disk_add_events(disk);
 	blk_integrity_add(disk);
 }
@@ -900,6 +902,7 @@ void del_gendisk(struct gendisk *disk)
 
 	might_sleep();
 
+	blk_filter_disk_del(disk);
 	blk_integrity_del(disk);
 	disk_del_events(disk);
 
@@ -1562,6 +1565,7 @@ static void disk_release(struct device *dev)
 
 	might_sleep();
 
+	blk_filter_disk_release(disk);
 	blk_free_devt(dev->devt);
 	disk_release_events(disk);
 	kfree(disk->random);
@@ -2339,3 +2343,23 @@ static void disk_release_events(struct gendisk *disk)
 	WARN_ON_ONCE(disk->ev && disk->ev->block != 1);
 	kfree(disk->ev);
 }
+
+int disk_enumerate(void (*fn)(struct gendisk *disk, void *ctx), void *ctx)
+{
+	struct class_dev_iter *iter;
+	struct device *dev;
+
+	iter = kmalloc(sizeof(*iter), GFP_KERNEL);
+	if (!iter)
+		return -ENOMEM;
+
+	class_dev_iter_init(iter, &block_class, NULL, &disk_type);
+	dev = class_dev_iter_next(iter);
+	while (dev) {
+		fn(dev_to_disk(dev), ctx);
+		dev = class_dev_iter_next(iter);
+	};
+
+	kfree(iter);
+	return 0;
+}
diff --git a/include/linux/blk-filter.h b/include/linux/blk-filter.h
new file mode 100644
index 000000000000..201613168864
--- /dev/null
+++ b/include/linux/blk-filter.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * API declarations for kernel modules utilizing block device filters
+ */
+
+#ifndef BLK_FILTER_H
+#define BLK_FILTER_H
+
+#ifdef CONFIG_BLK_FILTER
+#define BLK_FILTER_ALTITUDE_MAX 4
+#define BLK_FILTER_ALTITUDE_MIN 1
+
+struct blk_filter_ops {
+	void (*disk_add)(struct gendisk *disk);
+	void (*disk_del)(struct gendisk *disk);
+	void (*disk_release)(struct gendisk *disk);
+	blk_qc_t (*submit_bio)(struct bio *bio);
+};
+
+struct blk_filter {
+	const char *name;
+	const struct blk_filter_ops *ops;
+	size_t altitude;
+	void *blk_filter_ctx;
+};
+
+
+int blk_filter_register(struct blk_filter *filter);
+
+int blk_filter_unregister(struct blk_filter *filter);
+
+const char *blk_filter_check_altitude(size_t altitude);
+
+int blk_filter_attach_disks(struct blk_filter *filter);
+
+blk_qc_t blk_filter_submit_bio_next(struct blk_filter *filter, struct bio *bio);
+
+#endif /* CONFIG_BLK_FILTER */
+
+#endif
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index 4ab853461dff..5f065f8989b4 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -319,6 +319,8 @@ extern void set_capacity_revalidate_and_notify(struct gendisk *disk,
 			sector_t size, bool revalidate);
 extern unsigned int disk_clear_events(struct gendisk *disk, unsigned int mask);
 
+extern int disk_enumerate(void (*fn)(struct gendisk *disk, void *cxt), void *cxt);
+
 /* drivers/char/random.c */
 extern void add_disk_randomness(struct gendisk *disk) __latent_entropy;
 extern void rand_initialize_disk(struct gendisk *disk);
-- 
2.20.1

