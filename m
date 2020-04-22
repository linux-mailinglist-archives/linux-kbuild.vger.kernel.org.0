Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47E031B46E1
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Apr 2020 16:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbgDVOKi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 22 Apr 2020 10:10:38 -0400
Received: from mga05.intel.com ([192.55.52.43]:58582 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725839AbgDVOKi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 Apr 2020 10:10:38 -0400
IronPort-SDR: S0uSHhHQse40IHIvCl+EohB+n4yMXourW4Ad84i5LNp6cEL6UAjF4h51vw4EyTxkyJyR5oaxpI
 6HeRIjtgZYog==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2020 07:10:37 -0700
IronPort-SDR: O1Cm9vZWgYMPQakPv7T9fofj9pQIQiZhb10P9mFEotUd7SSB9JkGA6E0rSxKb56YOK+vMqHllf
 xyDGI7hR3gBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,414,1580803200"; 
   d="scan'208";a="290845369"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 22 Apr 2020 07:10:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 4DDD611D; Wed, 22 Apr 2020 17:10:35 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] modpost: file2alias: Kill the old UUID type
Date:   Wed, 22 Apr 2020 17:10:34 +0300
Message-Id: <20200422141034.15097-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

There is dangling old UUID type, i.e. uuid_le, which is defined in the same way
as new ones, so, we may safely drop it. There is no ABI change!

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/mod_devicetable.h | 4 ++--
 scripts/mod/file2alias.c        | 8 +++-----
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 4b3d0a4945dfc..f4e543335c307 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -434,7 +434,7 @@ struct virtio_device_id {
  * For Hyper-V devices we use the device guid as the id.
  */
 struct hv_vmbus_device_id {
-	uuid_le guid;
+	guid_t guid;
 	kernel_ulong_t driver_data;	/* Data private to the driver */
 };
 
@@ -707,7 +707,7 @@ struct ipack_device_id {
  */
 struct mei_cl_device_id {
 	char name[MEI_CL_NAME_SIZE];
-	uuid_le uuid;
+	guid_t uuid;
 	__u8    version;
 	kernel_ulong_t driver_info;
 };
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 9599e2a3f1e61..0a42d3bfdfe53 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -34,17 +34,15 @@ typedef Elf64_Addr	kernel_ulong_t;
 typedef uint32_t	__u32;
 typedef uint16_t	__u16;
 typedef unsigned char	__u8;
+
 typedef struct {
 	__u8 b[16];
 } guid_t;
 
-/* backwards compatibility, don't use in new code */
-typedef struct {
-	__u8 b[16];
-} uuid_le;
 typedef struct {
 	__u8 b[16];
 } uuid_t;
+
 #define	UUID_STRING_LEN		36
 
 /* Big exception to the "don't include kernel headers into userspace, which
@@ -104,7 +102,7 @@ static inline void add_wildcard(char *str)
 		strcat(str + len, "*");
 }
 
-static inline void add_uuid(char *str, uuid_le uuid)
+static inline void add_uuid(char *str, guid_t uuid)
 {
 	int len = strlen(str);
 
-- 
2.26.1

