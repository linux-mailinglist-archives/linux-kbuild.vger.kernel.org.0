Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA2A1553C3
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2020 09:37:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbgBGIhu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Feb 2020 03:37:50 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35825 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgBGIhu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Feb 2020 03:37:50 -0500
Received: by mail-wm1-f65.google.com with SMTP id b17so1764891wmb.0;
        Fri, 07 Feb 2020 00:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VhxI4FdyoZ++hOoaaohOn1p/rG/JxK4dHpaCe38nLjI=;
        b=jTgGy5kDTVd2TnplGSGM18icUs61ewz2222uhNGabFlQiNNlkMQSjd+MCpo09xTTlt
         sLtyWjTj7tPU9OLllPsFKR3he3L+efTUYr4ybNgw0+ecQ4HD7uP0ErXNnuivOPTr7V5G
         M9bygJDKVOOXqmXm9Kcb9Hu+vIjdkjD1/Wbjn1nhy+OHtLTNm/4+qdiXmzZZ16n8Q+UN
         mua5SftCDsf+YBmCTFf8lcfRhh/g8lVA3pJRjcf6RjQWSkoWdC7FwN3bBArDccaKjt/e
         E8ht4GSKHLXJxhVzzWAq4KnwtFRjm1DKG13Cg3JxvDJOIxR2ju8uRjTOMG/t/1LqJx7z
         0SBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VhxI4FdyoZ++hOoaaohOn1p/rG/JxK4dHpaCe38nLjI=;
        b=oME6k72dg4ixQjgeKQ7uwqk04QDSpBEGbNpYhXiSqGVJYWgFB3Lao3mq5pfa85IPe5
         okQkpgHHOCkxBF6IAuYnHlblg0PLBF0iuTkK3Qrnywk9qtd0ajoB95Vu7ABKo2wjbN53
         avhNR5I8IriTAe7BRpXPk8/WygCGhOk9EaQnpwzJkLqNp5T7ulPay81+1+6x0B8BdNGi
         el57gn7R5/NIeKAgGK1cISPKJiS3/0or5yTH+1r6bhSSIB9MhBSfUFGJ9p/0Hf+YyHcb
         Up1j6USYq/Pgff6+MvIf7BxC8aeKY1LvGj6wr2y83tAVKm/MwhebYQDyHI7AFL4Oosoh
         UUZw==
X-Gm-Message-State: APjAAAVRT14ohxjqzVKVlYKg6TccBmzNEMVZEpdBPLZx/KmkYXqV6NDM
        K5+R/nh31U32DfWz0uQHLCY=
X-Google-Smtp-Source: APXvYqwCCSbJJM8Xr67jFwiLGxFhlgC6/zk1ayA6YeXp+IO9NGnjNeuJUysweCX8PjKIkDmN5iuXwg==
X-Received: by 2002:a1c:e108:: with SMTP id y8mr2907996wmg.147.1581064668504;
        Fri, 07 Feb 2020 00:37:48 -0800 (PST)
Received: from t1700.criteois.lan ([91.199.242.236])
        by smtp.gmail.com with ESMTPSA id o15sm2459594wra.83.2020.02.07.00.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2020 00:37:47 -0800 (PST)
From:   Erwan Velu <erwanaliasr1@gmail.com>
X-Google-Original-From: Erwan Velu <e.velu@criteo.com>
Cc:     Erwan Velu <e.velu@criteo.com>, Jean Delvare <jdelvare@suse.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Mattias Jacobsson <2pi@mok.nu>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andrew Lunn <andrew@lunn.ch>,
        "Darren Hart (VMware)" <dvhart@infradead.org>,
        Changbin Du <changbin.du@intel.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: [PATCH] firmware/dmi: Report DMI Bios & EC firmware release
Date:   Fri,  7 Feb 2020 09:35:47 +0100
Message-Id: <20200207083550.360461-1-e.velu@criteo.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Some vendors like HPe or Dell, encode the release version of their BIOS
in the "System BIOS {Major|Minor} Release" fields of Type 0.

This information is used to know which bios release actually runs.
It could be used for some quirks, debugging sessions or inventory tasks.

A typical output for a Dell system running the 65.27 bios is :
	[root@t1700 ~]# cat /sys/devices/virtual/dmi/id/bios_release
	65.27
	[root@t1700 ~]#

Servers that have a BMC encode the release version of their firmware in the
 "Embedded Controller Firmware {Major|Minor} Release" fields of Type 0.

This information is used to know which BMC release actually runs.
It could be used for some quirks, debugging sessions or inventory tasks.

A typical output for a Dell system running the 3.75 bmc release is :
    [root@t1700 ~]# cat /sys/devices/virtual/dmi/id/ec_firmware_release
    3.75
    [root@t1700 ~]#

Signed-off-by: Erwan Velu <e.velu@criteo.com>
---
 drivers/firmware/dmi-id.c       |  6 ++++++
 drivers/firmware/dmi_scan.c     | 30 ++++++++++++++++++++++++++++++
 include/linux/mod_devicetable.h |  2 ++
 scripts/mod/file2alias.c        |  2 ++
 4 files changed, 40 insertions(+)

diff --git a/drivers/firmware/dmi-id.c b/drivers/firmware/dmi-id.c
index ff39f64f2aae..ab9afe5af4bf 100644
--- a/drivers/firmware/dmi-id.c
+++ b/drivers/firmware/dmi-id.c
@@ -42,6 +42,8 @@ DEFINE_DMI_ATTR_WITH_SHOW(bios_vendor,		0444, DMI_BIOS_VENDOR);
 DEFINE_DMI_ATTR_WITH_SHOW(bios_version,		0444, DMI_BIOS_VERSION);
 DEFINE_DMI_ATTR_WITH_SHOW(bios_date,		0444, DMI_BIOS_DATE);
 DEFINE_DMI_ATTR_WITH_SHOW(sys_vendor,		0444, DMI_SYS_VENDOR);
+DEFINE_DMI_ATTR_WITH_SHOW(bios_release,         0444, DMI_BIOS_RELEASE);
+DEFINE_DMI_ATTR_WITH_SHOW(ec_firmware_release,  0444, DMI_EC_FIRMWARE_RELEASE);
 DEFINE_DMI_ATTR_WITH_SHOW(product_name,		0444, DMI_PRODUCT_NAME);
 DEFINE_DMI_ATTR_WITH_SHOW(product_version,	0444, DMI_PRODUCT_VERSION);
 DEFINE_DMI_ATTR_WITH_SHOW(product_serial,	0400, DMI_PRODUCT_SERIAL);
@@ -78,6 +80,8 @@ static ssize_t get_modalias(char *buffer, size_t buffer_size)
 		{ "bvn", DMI_BIOS_VENDOR },
 		{ "bvr", DMI_BIOS_VERSION },
 		{ "bd",  DMI_BIOS_DATE },
+		{ "br",  DMI_BIOS_RELEASE },
+		{ "ecr", DMI_EC_FIRMWARE_RELEASE },
 		{ "svn", DMI_SYS_VENDOR },
 		{ "pn",  DMI_PRODUCT_NAME },
 		{ "pvr", DMI_PRODUCT_VERSION },
@@ -187,6 +191,8 @@ static void __init dmi_id_init_attr_table(void)
 	ADD_DMI_ATTR(bios_vendor,       DMI_BIOS_VENDOR);
 	ADD_DMI_ATTR(bios_version,      DMI_BIOS_VERSION);
 	ADD_DMI_ATTR(bios_date,         DMI_BIOS_DATE);
+	ADD_DMI_ATTR(bios_release,      DMI_BIOS_RELEASE);
+	ADD_DMI_ATTR(ec_firmware_release, DMI_EC_FIRMWARE_RELEASE);
 	ADD_DMI_ATTR(sys_vendor,        DMI_SYS_VENDOR);
 	ADD_DMI_ATTR(product_name,      DMI_PRODUCT_NAME);
 	ADD_DMI_ATTR(product_version,   DMI_PRODUCT_VERSION);
diff --git a/drivers/firmware/dmi_scan.c b/drivers/firmware/dmi_scan.c
index 2045566d622f..51d81b87ed94 100644
--- a/drivers/firmware/dmi_scan.c
+++ b/drivers/firmware/dmi_scan.c
@@ -182,6 +182,34 @@ static void __init dmi_save_ident(const struct dmi_header *dm, int slot,
 	dmi_ident[slot] = p;
 }
 
+static void __init dmi_save_release(const struct dmi_header *dm, int slot,
+		int index)
+{
+	const u8 *minor, *major;
+	char *s;
+
+	/* If the table doesn't have the field, let's return */
+	if (dmi_ident[slot] || dm->length < index)
+		return;
+
+	minor = (u8 *) dm + index;
+	major = (u8 *) dm + index - 1;
+
+	/* As per the spec, if the system doesn't support this field,
+	 * the value is FF
+	 */
+	if (*major == 0xFF && *minor == 0xFF)
+		return;
+
+	s = dmi_alloc(8);
+	if (!s)
+		return;
+
+	sprintf(s, "%u.%u", *major, *minor);
+
+	dmi_ident[slot] = s;
+}
+
 static void __init dmi_save_uuid(const struct dmi_header *dm, int slot,
 		int index)
 {
@@ -440,6 +468,8 @@ static void __init dmi_decode(const struct dmi_header *dm, void *dummy)
 		dmi_save_ident(dm, DMI_BIOS_VENDOR, 4);
 		dmi_save_ident(dm, DMI_BIOS_VERSION, 5);
 		dmi_save_ident(dm, DMI_BIOS_DATE, 8);
+		dmi_save_release(dm, DMI_BIOS_RELEASE, 21);
+		dmi_save_release(dm, DMI_EC_FIRMWARE_RELEASE, 23);
 		break;
 	case 1:		/* System Information */
 		dmi_save_ident(dm, DMI_SYS_VENDOR, 4);
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index e3596db077dc..e1621c81cf44 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -532,6 +532,8 @@ enum dmi_field {
 	DMI_BIOS_VENDOR,
 	DMI_BIOS_VERSION,
 	DMI_BIOS_DATE,
+	DMI_BIOS_RELEASE,
+	DMI_EC_FIRMWARE_RELEASE,
 	DMI_SYS_VENDOR,
 	DMI_PRODUCT_NAME,
 	DMI_PRODUCT_VERSION,
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index c91eba751804..6c6c9953c488 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -936,6 +936,8 @@ static const struct dmifield {
 	{ "bvn", DMI_BIOS_VENDOR },
 	{ "bvr", DMI_BIOS_VERSION },
 	{ "bd",  DMI_BIOS_DATE },
+	{ "br",  DMI_BIOS_RELEASE },
+	{ "ecr", DMI_EC_FIRMWARE_RELEASE },
 	{ "svn", DMI_SYS_VENDOR },
 	{ "pn",  DMI_PRODUCT_NAME },
 	{ "pvr", DMI_PRODUCT_VERSION },
-- 
2.24.1

