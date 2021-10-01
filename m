Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 771D041EC58
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Oct 2021 13:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354046AbhJALjm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 Oct 2021 07:39:42 -0400
Received: from mga11.intel.com ([192.55.52.93]:47222 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1353912AbhJALjl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Oct 2021 07:39:41 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10123"; a="222207482"
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; 
   d="scan'208";a="222207482"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2021 04:37:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,337,1624345200"; 
   d="scan'208";a="520998784"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 01 Oct 2021 04:37:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 125FF1AD; Fri,  1 Oct 2021 14:37:59 +0300 (EEST)
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
Subject: [PATCH v3 1/4] modpost: Mark uuid_le type only for MEI
Date:   Fri,  1 Oct 2021 14:37:44 +0300
Message-Id: <20211001113747.64040-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The uuid_le type is used only for MEI ABI, do not advertise it for others.
Due to above, bury add_uuid() in its only user.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v3: no change
 scripts/mod/file2alias.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 49aba862073e..c9c9c2328e26 100644
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
@@ -1211,12 +1203,16 @@ static int do_mei_entry(const char *filename, void *symval,
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
2.33.0

