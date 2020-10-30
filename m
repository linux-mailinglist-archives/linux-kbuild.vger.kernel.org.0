Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F22E12A0DC7
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Oct 2020 19:49:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbgJ3Stz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 30 Oct 2020 14:49:55 -0400
Received: from mga01.intel.com ([192.55.52.88]:23216 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725975AbgJ3Stz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Oct 2020 14:49:55 -0400
IronPort-SDR: kvGn/OCd70pfbHv6eGvaQp9WQVgwC+0VFQgrkllw1JZxgeK8ad44H1HjiCacY+SFLPxqwrNTfz
 HW53++mOWr6Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9790"; a="186463780"
X-IronPort-AV: E=Sophos;i="5.77,434,1596524400"; 
   d="scan'208";a="186463780"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2020 11:49:54 -0700
IronPort-SDR: IwaOzE12dWYBEDJDl/x2ABuz5rNpfSyLblwuZDRM2RkByCVt+UdlFaFUscZ01FHS3RShtTTT7r
 qYPstRD0MRtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,434,1596524400"; 
   d="scan'208";a="537162708"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 30 Oct 2020 11:49:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id C18B72A0; Fri, 30 Oct 2020 20:49:51 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/2] modpost: Mark uuid_le type only for MEI
Date:   Fri, 30 Oct 2020 20:49:49 +0200
Message-Id: <20201030184950.26732-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The uuid_le type is used only for MEI ABI, do not advertise it for others.
Due to above, bury add_uuid() in its only user.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: no changes
 scripts/mod/file2alias.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 8a438c94dcd9..fefff92b33ef 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -34,19 +34,22 @@ typedef Elf64_Addr	kernel_ulong_t;
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
 
+/* MEI UUID type, don't use anywhere else */
+typedef struct {
+	__u8 b[16];
+} uuid_le;
+
 /* Big exception to the "don't include kernel headers into userspace, which
  * even potentially has different endianness and word sizes, since
  * we handle those differences explicitly below */
@@ -104,17 +107,6 @@ static inline void add_wildcard(char *str)
 		strcat(str + len, "*");
 }
 
-static inline void add_uuid(char *str, uuid_le uuid)
-{
-	int len = strlen(str);
-
-	sprintf(str + len, "%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x",
-		uuid.b[3], uuid.b[2], uuid.b[1], uuid.b[0],
-		uuid.b[5], uuid.b[4], uuid.b[7], uuid.b[6],
-		uuid.b[8], uuid.b[9], uuid.b[10], uuid.b[11],
-		uuid.b[12], uuid.b[13], uuid.b[14], uuid.b[15]);
-}
-
 /**
  * Check that sizeof(device_id type) are consistent with size of section
  * in .o file. If in-consistent then userspace and kernel does not agree
@@ -1198,12 +1190,16 @@ static int do_mei_entry(const char *filename, void *symval,
 			char *alias)
 {
 	DEF_FIELD_ADDR(symval, mei_cl_device_id, name);
-	DEF_FIELD_ADDR(symval, mei_cl_device_id, uuid);
+	DEF_FIELD(symval, mei_cl_device_id, uuid);
 	DEF_FIELD(symval, mei_cl_device_id, version);
 
 	sprintf(alias, MEI_CL_MODULE_PREFIX);
 	sprintf(alias + strlen(alias), "%s:",  (*name)[0]  ? *name : "*");
-	add_uuid(alias, *uuid);
+	sprintf(alias + strlen(alias), "%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x",
+		uuid.b[3], uuid.b[2], uuid.b[1], uuid.b[0],
+		uuid.b[5], uuid.b[4], uuid.b[7], uuid.b[6],
+		uuid.b[8], uuid.b[9], uuid.b[10], uuid.b[11],
+		uuid.b[12], uuid.b[13], uuid.b[14], uuid.b[15]);
 	ADD(alias, ":", version != MEI_CL_VERSION_ANY, version);
 
 	strcat(alias, ":*");
-- 
2.28.0

