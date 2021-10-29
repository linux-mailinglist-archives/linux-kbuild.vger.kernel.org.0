Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6248643FF82
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Oct 2021 17:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230036AbhJ2Pbs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 29 Oct 2021 11:31:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbhJ2Pbr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Oct 2021 11:31:47 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E1AFC061766;
        Fri, 29 Oct 2021 08:29:19 -0700 (PDT)
From:   =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1635521356;
        bh=47S71ww0oeAgpF1M5AvPvZs+YgAcY4mGa2+Jg6+IVus=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dqjLxADx+7gG42MpSHV41hdPF7oE8VC2gn3Nd0mYq09l+Dj13qehsu/zATD1RkiQK
         2Dp1ooRYK6APQr06sfhYosRfRoK2IamEmruabbCz2J0wW9SSVdqnHrFBhi1rWHKbCa
         rNenwe7bWPfHWgHFozSeXyTrMtYa91+Yt5F4UhqI=
To:     linux-input@vger.kernel.org
Cc:     =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina <jkosina@suse.cz>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH 1/6] HID: intel-ish-hid: add support for MODULE_DEVICE_TABLE()
Date:   Fri, 29 Oct 2021 17:28:56 +0200
Message-Id: <20211029152901.297939-2-linux@weissschuh.net>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211029152901.297939-1-linux@weissschuh.net>
References: <20211029152901.297939-1-linux@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This allows to selectively autoload drivers for ISH devices.
Currently all ISH drivers are loaded for all systems having any ISH
device.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

---

Cc: linux-kbuild@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Jiri Kosina <jkosina@suse.cz>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: Nick Desaulniers <ndesaulniers@google.com>
---
 include/linux/mod_devicetable.h   | 13 +++++++++++++
 scripts/mod/devicetable-offsets.c |  3 +++
 scripts/mod/file2alias.c          | 24 ++++++++++++++++++++++++
 3 files changed, 40 insertions(+)

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index ae2e75d15b21..befbf53c4b7c 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -895,4 +895,17 @@ struct dfl_device_id {
 	kernel_ulong_t driver_data;
 };
 
+/* ISHTP (Integrated Sensor Hub Transport Protocol) */
+
+#define ISHTP_MODULE_PREFIX	"ishtp:"
+
+/**
+ * struct ishtp_device_id - ISHTP device identifier
+ * @guid_string: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417f2f49ba
+ * @context: pointer to driver specific data
+ */
+struct ishtp_device_id {
+	guid_t guid;
+};
+
 #endif /* LINUX_MOD_DEVICETABLE_H */
diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
index cc3625617a0e..c0d3bcb99138 100644
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@ -259,5 +259,8 @@ int main(void)
 	DEVID_FIELD(dfl_device_id, type);
 	DEVID_FIELD(dfl_device_id, feature_id);
 
+	DEVID(ishtp_device_id);
+	DEVID_FIELD(ishtp_device_id, guid);
+
 	return 0;
 }
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 49aba862073e..5258247d78ac 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -115,6 +115,17 @@ static inline void add_uuid(char *str, uuid_le uuid)
 		uuid.b[12], uuid.b[13], uuid.b[14], uuid.b[15]);
 }
 
+static inline void add_guid(char *str, guid_t guid)
+{
+	int len = strlen(str);
+
+	sprintf(str + len, "%02X%02X%02X%02X-%02X%02X-%02X%02X-%02X%02X-%02X%02X%02X%02X%02X%02X",
+		guid.b[3], guid.b[2], guid.b[1], guid.b[0],
+		guid.b[5], guid.b[4], guid.b[7], guid.b[6],
+		guid.b[8], guid.b[9], guid.b[10], guid.b[11],
+		guid.b[12], guid.b[13], guid.b[14], guid.b[15]);
+}
+
 /**
  * Check that sizeof(device_id type) are consistent with size of section
  * in .o file. If in-consistent then userspace and kernel does not agree
@@ -1380,6 +1391,18 @@ static int do_mhi_entry(const char *filename, void *symval, char *alias)
 	return 1;
 }
 
+/* Looks like: ishtp:{guid} */
+static int do_ishtp_entry(const char *filename, void *symval, char *alias)
+{
+	DEF_FIELD(symval, ishtp_device_id, guid);
+
+	strcpy(alias, ISHTP_MODULE_PREFIX "{");
+	add_guid(alias, guid);
+	strcat(alias, "}");
+
+	return 1;
+}
+
 static int do_auxiliary_entry(const char *filename, void *symval, char *alias)
 {
 	DEF_FIELD_ADDR(symval, auxiliary_device_id, name);
@@ -1499,6 +1522,7 @@ static const struct devtable devtable[] = {
 	{"auxiliary", SIZE_auxiliary_device_id, do_auxiliary_entry},
 	{"ssam", SIZE_ssam_device_id, do_ssam_entry},
 	{"dfl", SIZE_dfl_device_id, do_dfl_entry},
+	{"ishtp", SIZE_ishtp_device_id, do_ishtp_entry},
 };
 
 /* Create MODULE_ALIAS() statements.
-- 
2.33.1

