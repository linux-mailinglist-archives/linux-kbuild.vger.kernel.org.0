Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 961C12A0DCA
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Oct 2020 19:50:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727350AbgJ3St4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 30 Oct 2020 14:49:56 -0400
Received: from mga07.intel.com ([134.134.136.100]:22480 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726061AbgJ3Stz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Oct 2020 14:49:55 -0400
IronPort-SDR: oiB9NLXKrkMKag4EnlRoWYWQ5HfeU/Ol6hP02Sy6zPs6rZjpmFU6aoyVB45QO3eQ20yXDwT4Jd
 F56ndaW5fP/Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9790"; a="232829746"
X-IronPort-AV: E=Sophos;i="5.77,434,1596524400"; 
   d="scan'208";a="232829746"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2020 11:49:54 -0700
IronPort-SDR: oPWNfSJuaTXZIXbruLaECGIZkUJaN2Yv159RfJxmHyBn5Q8YHJZUfgJdREh8BkfuJYxukAxCwe
 9BYmDf9aiGiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,434,1596524400"; 
   d="scan'208";a="304840748"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 30 Oct 2020 11:49:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id CA6495B; Fri, 30 Oct 2020 20:49:51 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 2/2] uuid: Make guid_t completely internal type to the kernel
Date:   Fri, 30 Oct 2020 20:49:50 +0200
Message-Id: <20201030184950.26732-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201030184950.26732-1-andriy.shevchenko@linux.intel.com>
References: <20201030184950.26732-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The guid_t type was defined in UAPI by mistake.
Keep it an internal type and leave uuid_le UAPI
for it's only user, i.e. MEI.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: converted uuid_le_cmp() to old type
 include/linux/uuid.h      | 20 ++++++++++++++++----
 include/uapi/linux/uuid.h | 14 +++++---------
 2 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/include/linux/uuid.h b/include/linux/uuid.h
index 8cdc0d3567cd..5be158a49e11 100644
--- a/include/linux/uuid.h
+++ b/include/linux/uuid.h
@@ -8,15 +8,25 @@
 #ifndef _LINUX_UUID_H_
 #define _LINUX_UUID_H_
 
-#include <uapi/linux/uuid.h>
 #include <linux/string.h>
 
 #define UUID_SIZE 16
 
+typedef struct {
+	__u8 b[UUID_SIZE];
+} guid_t;
+
 typedef struct {
 	__u8 b[UUID_SIZE];
 } uuid_t;
 
+#define GUID_INIT(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)			\
+((guid_t)								\
+{{ (a) & 0xff, ((a) >> 8) & 0xff, ((a) >> 16) & 0xff, ((a) >> 24) & 0xff, \
+   (b) & 0xff, ((b) >> 8) & 0xff,					\
+   (c) & 0xff, ((c) >> 8) & 0xff,					\
+   (d0), (d1), (d2), (d3), (d4), (d5), (d6), (d7) }})
+
 #define UUID_INIT(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)			\
 ((uuid_t)								\
 {{ ((a) >> 24) & 0xff, ((a) >> 16) & 0xff, ((a) >> 8) & 0xff, (a) & 0xff, \
@@ -97,10 +107,12 @@ extern const u8 uuid_index[16];
 int guid_parse(const char *uuid, guid_t *u);
 int uuid_parse(const char *uuid, uuid_t *u);
 
-/* backwards compatibility, don't use in new code */
-static inline int uuid_le_cmp(const guid_t u1, const guid_t u2)
+/* MEI UUID type, don't use anywhere else */
+#include <uapi/linux/uuid.h>
+
+static inline int uuid_le_cmp(const uuid_le u1, const uuid_le u2)
 {
-	return memcmp(&u1, &u2, sizeof(guid_t));
+	return memcmp(&u1, &u2, sizeof(uuid_le));
 }
 
 #endif
diff --git a/include/uapi/linux/uuid.h b/include/uapi/linux/uuid.h
index e5a7eecef7c3..c3e175f686f4 100644
--- a/include/uapi/linux/uuid.h
+++ b/include/uapi/linux/uuid.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
- * UUID/GUID definition
+ * MEI UUID definition
  *
  * Copyright (C) 2010, Intel Corp.
  *	Huang Ying <ying.huang@intel.com>
@@ -22,21 +22,17 @@
 
 typedef struct {
 	__u8 b[16];
-} guid_t;
+} uuid_le;
 
-#define GUID_INIT(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)			\
-((guid_t)								\
+#define UUID_LE(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)		\
+((uuid_le)								\
 {{ (a) & 0xff, ((a) >> 8) & 0xff, ((a) >> 16) & 0xff, ((a) >> 24) & 0xff, \
    (b) & 0xff, ((b) >> 8) & 0xff,					\
    (c) & 0xff, ((c) >> 8) & 0xff,					\
    (d0), (d1), (d2), (d3), (d4), (d5), (d6), (d7) }})
 
-/* backwards compatibility, don't use in new code */
-typedef guid_t uuid_le;
-#define UUID_LE(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)		\
-	GUID_INIT(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)
 #define NULL_UUID_LE							\
 	UUID_LE(0x00000000, 0x0000, 0x0000, 0x00, 0x00, 0x00, 0x00,	\
-	     0x00, 0x00, 0x00, 0x00)
+		0x00, 0x00, 0x00, 0x00)
 
 #endif /* _UAPI_LINUX_UUID_H_ */
-- 
2.28.0

