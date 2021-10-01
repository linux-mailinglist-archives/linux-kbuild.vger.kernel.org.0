Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C8D041EC57
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Oct 2021 13:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354026AbhJALjm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 Oct 2021 07:39:42 -0400
Received: from mga01.intel.com ([192.55.52.88]:58924 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1353920AbhJALjl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Oct 2021 07:39:41 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10123"; a="247965850"
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; 
   d="scan'208";a="247965850"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2021 04:37:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; 
   d="scan'208";a="556258670"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Oct 2021 04:37:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 299843DA; Fri,  1 Oct 2021 14:38:00 +0300 (EEST)
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
Subject: [PATCH v3 3/4] mei: Move uuid_le_cmp() to its only user
Date:   Fri,  1 Oct 2021 14:37:46 +0300
Message-Id: <20211001113747.64040-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211001113747.64040-1-andriy.shevchenko@linux.intel.com>
References: <20211001113747.64040-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

There is only a single user of uuid_le_cmp() API, let's make it private
to that user.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v3: new patch
 drivers/misc/mei/mei_dev.h | 5 +++++
 include/linux/uuid.h       | 5 -----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/misc/mei/mei_dev.h b/drivers/misc/mei/mei_dev.h
index 694f866f87ef..2c1a22b64302 100644
--- a/drivers/misc/mei/mei_dev.h
+++ b/drivers/misc/mei/mei_dev.h
@@ -13,6 +13,11 @@
 #include <linux/mei.h>
 #include <linux/mei_cl_bus.h>
 
+static inline int uuid_le_cmp(const uuid_le u1, const uuid_le u2)
+{
+	return memcmp(&u1, &u2, sizeof(uuid_le));
+}
+
 #include "hw.h"
 #include "hbm.h"
 
diff --git a/include/linux/uuid.h b/include/linux/uuid.h
index 5be158a49e11..6b1a3efa1e0b 100644
--- a/include/linux/uuid.h
+++ b/include/linux/uuid.h
@@ -110,9 +110,4 @@ int uuid_parse(const char *uuid, uuid_t *u);
 /* MEI UUID type, don't use anywhere else */
 #include <uapi/linux/uuid.h>
 
-static inline int uuid_le_cmp(const uuid_le u1, const uuid_le u2)
-{
-	return memcmp(&u1, &u2, sizeof(uuid_le));
-}
-
 #endif
-- 
2.33.0

