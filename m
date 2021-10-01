Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1FCC41EC5C
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Oct 2021 13:38:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354070AbhJALjp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 Oct 2021 07:39:45 -0400
Received: from mga17.intel.com ([192.55.52.151]:26877 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1354065AbhJALjo (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Oct 2021 07:39:44 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10123"; a="205562670"
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; 
   d="scan'208";a="205562670"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2021 04:38:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; 
   d="scan'208";a="480402843"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 01 Oct 2021 04:37:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 334E8440; Fri,  1 Oct 2021 14:38:00 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tomas Winkler <tomas.winkler@intel.com>,
        Alexander Usyskin <alexander.usyskin@intel.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH v3 4/4] mei: Unite uuid.h and mei.h in uAPI
Date:   Fri,  1 Oct 2021 14:37:47 +0300
Message-Id: <20211001113747.64040-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211001113747.64040-1-andriy.shevchenko@linux.intel.com>
References: <20211001113747.64040-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

There is only a single user of UUID uAPI, let's make it part
of that user.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v3: new patch (Christoph)
 MAINTAINERS                      |  1 -
 drivers/misc/mei/bus-fixup.c     |  1 -
 drivers/misc/mei/hdcp/mei_hdcp.c |  1 -
 drivers/misc/mei/hw.h            |  2 --
 drivers/misc/mei/main.c          |  1 -
 include/linux/mei_cl_bus.h       |  2 +-
 include/linux/mod_devicetable.h  |  1 +
 include/linux/uuid.h             |  3 ---
 include/uapi/linux/mei.h         | 17 +++++++++++++-
 include/uapi/linux/uuid.h        | 38 --------------------------------
 10 files changed, 18 insertions(+), 49 deletions(-)
 delete mode 100644 include/uapi/linux/uuid.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 369a00af62c7..f4c9fa3433d5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19740,7 +19740,6 @@ L:	linux-kernel@vger.kernel.org
 S:	Maintained
 T:	git git://git.infradead.org/users/hch/uuid.git
 F:	include/linux/uuid.h
-F:	include/uapi/linux/uuid.h
 F:	lib/test_uuid.c
 F:	lib/uuid.c
 
diff --git a/drivers/misc/mei/bus-fixup.c b/drivers/misc/mei/bus-fixup.c
index 67844089db21..03baa616a356 100644
--- a/drivers/misc/mei/bus-fixup.c
+++ b/drivers/misc/mei/bus-fixup.c
@@ -9,7 +9,6 @@
 #include <linux/module.h>
 #include <linux/device.h>
 #include <linux/slab.h>
-#include <linux/uuid.h>
 
 #include <linux/mei_cl_bus.h>
 
diff --git a/drivers/misc/mei/hdcp/mei_hdcp.c b/drivers/misc/mei/hdcp/mei_hdcp.c
index ec2a4fce8581..41e38fab425e 100644
--- a/drivers/misc/mei/hdcp/mei_hdcp.c
+++ b/drivers/misc/mei/hdcp/mei_hdcp.c
@@ -18,7 +18,6 @@
 
 #include <linux/module.h>
 #include <linux/slab.h>
-#include <linux/uuid.h>
 #include <linux/mei_cl_bus.h>
 #include <linux/component.h>
 #include <drm/drm_connector.h>
diff --git a/drivers/misc/mei/hw.h b/drivers/misc/mei/hw.h
index dfd60c916da0..9ad2a9b65506 100644
--- a/drivers/misc/mei/hw.h
+++ b/drivers/misc/mei/hw.h
@@ -7,8 +7,6 @@
 #ifndef _MEI_HW_TYPES_H_
 #define _MEI_HW_TYPES_H_
 
-#include <linux/uuid.h>
-
 /*
  * Timeouts in Seconds
  */
diff --git a/drivers/misc/mei/main.c b/drivers/misc/mei/main.c
index 786f7c8f7f61..15d8f7ae2f31 100644
--- a/drivers/misc/mei/main.c
+++ b/drivers/misc/mei/main.c
@@ -18,7 +18,6 @@
 #include <linux/ioctl.h>
 #include <linux/cdev.h>
 #include <linux/sched/signal.h>
-#include <linux/uuid.h>
 #include <linux/compat.h>
 #include <linux/jiffies.h>
 #include <linux/interrupt.h>
diff --git a/include/linux/mei_cl_bus.h b/include/linux/mei_cl_bus.h
index c6786c12b207..521eef218899 100644
--- a/include/linux/mei_cl_bus.h
+++ b/include/linux/mei_cl_bus.h
@@ -6,8 +6,8 @@
 #define _LINUX_MEI_CL_BUS_H
 
 #include <linux/device.h>
-#include <linux/uuid.h>
 #include <linux/mod_devicetable.h>
+#include <uapi/linux/mei.h>
 
 struct mei_cl_device;
 struct mei_device;
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index ae2e75d15b21..24e60693c44f 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -11,6 +11,7 @@
 #ifdef __KERNEL__
 #include <linux/types.h>
 #include <linux/uuid.h>
+#include <uapi/linux/mei.h>
 typedef unsigned long kernel_ulong_t;
 #endif
 
diff --git a/include/linux/uuid.h b/include/linux/uuid.h
index 6b1a3efa1e0b..43d4a79b273d 100644
--- a/include/linux/uuid.h
+++ b/include/linux/uuid.h
@@ -107,7 +107,4 @@ extern const u8 uuid_index[16];
 int guid_parse(const char *uuid, guid_t *u);
 int uuid_parse(const char *uuid, uuid_t *u);
 
-/* MEI UUID type, don't use anywhere else */
-#include <uapi/linux/uuid.h>
-
 #endif
diff --git a/include/uapi/linux/mei.h b/include/uapi/linux/mei.h
index 4f3638489d01..38dded45e8c9 100644
--- a/include/uapi/linux/mei.h
+++ b/include/uapi/linux/mei.h
@@ -7,7 +7,22 @@
 #ifndef _LINUX_MEI_H
 #define _LINUX_MEI_H
 
-#include <linux/uuid.h>
+#include <linux/types.h>
+
+typedef struct {
+	__u8 b[16];
+} uuid_le;
+
+#define UUID_LE(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)		\
+((uuid_le)								\
+{{ (a) & 0xff, ((a) >> 8) & 0xff, ((a) >> 16) & 0xff, ((a) >> 24) & 0xff, \
+   (b) & 0xff, ((b) >> 8) & 0xff,					\
+   (c) & 0xff, ((c) >> 8) & 0xff,					\
+   (d0), (d1), (d2), (d3), (d4), (d5), (d6), (d7) }})
+
+#define NULL_UUID_LE							\
+	UUID_LE(0x00000000, 0x0000, 0x0000, 0x00, 0x00, 0x00, 0x00,	\
+		0x00, 0x00, 0x00, 0x00)
 
 /*
  * This IOCTL is used to associate the current file descriptor with a
diff --git a/include/uapi/linux/uuid.h b/include/uapi/linux/uuid.h
deleted file mode 100644
index c3e175f686f4..000000000000
--- a/include/uapi/linux/uuid.h
+++ /dev/null
@@ -1,38 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-/*
- * MEI UUID definition
- *
- * Copyright (C) 2010, Intel Corp.
- *	Huang Ying <ying.huang@intel.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License version
- * 2 as published by the Free Software Foundation;
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
-
-#ifndef _UAPI_LINUX_UUID_H_
-#define _UAPI_LINUX_UUID_H_
-
-#include <linux/types.h>
-
-typedef struct {
-	__u8 b[16];
-} uuid_le;
-
-#define UUID_LE(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)		\
-((uuid_le)								\
-{{ (a) & 0xff, ((a) >> 8) & 0xff, ((a) >> 16) & 0xff, ((a) >> 24) & 0xff, \
-   (b) & 0xff, ((b) >> 8) & 0xff,					\
-   (c) & 0xff, ((c) >> 8) & 0xff,					\
-   (d0), (d1), (d2), (d3), (d4), (d5), (d6), (d7) }})
-
-#define NULL_UUID_LE							\
-	UUID_LE(0x00000000, 0x0000, 0x0000, 0x00, 0x00, 0x00, 0x00,	\
-		0x00, 0x00, 0x00, 0x00)
-
-#endif /* _UAPI_LINUX_UUID_H_ */
-- 
2.33.0

