Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6320110B1E4
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Nov 2019 16:09:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbfK0PJn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 27 Nov 2019 10:09:43 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40226 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbfK0PJn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 27 Nov 2019 10:09:43 -0500
Received: by mail-wm1-f65.google.com with SMTP id y5so7898207wmi.5;
        Wed, 27 Nov 2019 07:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cjO37N9FrEVVAlj2Cp+V8ZeFjWK0fAAiQ+h/m2gAVW0=;
        b=RfoJsU550WYts4lENLmG1Mjt4l3KoXW+iPjR1k7X4R8g3zY21kZhUEb+i/cNfIPe/O
         BF0wcM2svSVXF1S6BbtEoWXnoudvulZvRx//hoDhQ6wXK72lrgBCI3/F2+JVsNJMGWra
         /SqKwfXp2+DUaLtE0HvNHXzsLLKzZ2X76rgRcgdc5pNmowwRjyO/xzHzMjZiKuFmxA8q
         XI2JtRaMT4lw2i/BvDWw3eJBrXE/mWUMKLvEYxzGvSiUMxbuzlqxXHePvH9fiAkkzrbs
         a8K9Is1VY/f7AQlXiFzwCzK68Mu9Fb014aucKxLNT1GVXGtEntrnYeAAhQnkIb5a0Rcg
         9Bdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cjO37N9FrEVVAlj2Cp+V8ZeFjWK0fAAiQ+h/m2gAVW0=;
        b=nMVaFanChO8kHyKoa0mJ+VGdbmd70kPCQ8FtcDzstORkW47/ukXB47o22SEzwepdti
         lAl4swZzOMeIuTp+WOI2Q2TLguaAnMu2djF0vQh/ZOA0iBoYnkMJ+bBejmNM2wpQ0GCK
         TxSvjpihq/YmS/cj2iqIQtkJO8TELeFXGnPVHCeKLtLR9itpNxG69BfpB9OnpjwR9lt5
         Sn2nXXJ8YG4YHTXy3W+XvVFbXi5va/cKx7uq6+kzEJ18Dae1P21fxXDFpCBvS94rsn5+
         yoqZr+No/yKMAO2tAHpybFkbpeunoWQQ8b3+31vzcFCGelRhob/B4Kl4ROwo5T1vnLHc
         CBdw==
X-Gm-Message-State: APjAAAVz+x58gDGHo+Eb/BXlLl6O0vUJyoPgVj/Z8ZMu8HKA3792XjOz
        3EDogE4MnUORMUVKMSv2VoU=
X-Google-Smtp-Source: APXvYqwXVUhNs717PvueSwSSuwXBs/9XYAYSl2GzV1zdFh7Xu5E2cuGNw6AuD4iNRqCAP+bUQ4o9cA==
X-Received: by 2002:a1c:b1c3:: with SMTP id a186mr4953875wmf.10.1574867381522;
        Wed, 27 Nov 2019 07:09:41 -0800 (PST)
Received: from t1700.criteois.lan ([91.199.242.236])
        by smtp.gmail.com with ESMTPSA id o1sm4496500wrn.84.2019.11.27.07.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2019 07:09:41 -0800 (PST)
From:   Erwan Velu <erwanaliasr1@gmail.com>
X-Google-Original-From: Erwan Velu <e.velu@criteo.com>
Cc:     Erwan Velu <e.velu@criteo.com>, Jean Delvare <jdelvare@suse.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Mattias Jacobsson <2pi@mok.nu>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Changbin Du <changbin.du@intel.com>,
        "Robert P. J. Day" <rpjday@crashcourse.ca>,
        Sumit Garg <sumit.garg@linaro.org>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: [PATCH 2/2] firmware/dmi: Report DMI Embedded Firmware release
Date:   Wed, 27 Nov 2019 16:07:26 +0100
Message-Id: <20191127150729.860625-2-e.velu@criteo.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191127150729.860625-1-e.velu@criteo.com>
References: <20190918094323.17515-1-e.velu@criteo.com>
 <20191127150729.860625-1-e.velu@criteo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Servers that have a BMC encodes the release version of their firmwarein the
 "Embedded Controller Firmware {Major|Minor} Release" fields of Type 0.

This information is used to know which BMC release actually runs.
It could be used for some quirks, debugging sessions or inventory tasks.

A typical output for a Dell system running the 3.75 bios is :

    [root@t1700 ~]# cat /sys/devices/virtual/dmi/id/fw_release
    3.75
    [root@t1700 ~]#

Signed-off-by: Erwan Velu <e.velu@criteo.com>
---
 drivers/firmware/dmi-id.c       | 3 +++
 drivers/firmware/dmi_scan.c     | 1 +
 include/linux/mod_devicetable.h | 1 +
 scripts/mod/file2alias.c        | 1 +
 4 files changed, 6 insertions(+)

diff --git a/drivers/firmware/dmi-id.c b/drivers/firmware/dmi-id.c
index a2aac65ff771..93eca3222fb0 100644
--- a/drivers/firmware/dmi-id.c
+++ b/drivers/firmware/dmi-id.c
@@ -43,6 +43,7 @@ DEFINE_DMI_ATTR_WITH_SHOW(bios_version,		0444, DMI_BIOS_VERSION);
 DEFINE_DMI_ATTR_WITH_SHOW(bios_date,		0444, DMI_BIOS_DATE);
 DEFINE_DMI_ATTR_WITH_SHOW(sys_vendor,		0444, DMI_SYS_VENDOR);
 DEFINE_DMI_ATTR_WITH_SHOW(bios_release,         0444, DMI_BIOS_RELEASE);
+DEFINE_DMI_ATTR_WITH_SHOW(fw_release,           0444, DMI_EMBEDDED_FW_RELEASE);
 DEFINE_DMI_ATTR_WITH_SHOW(product_name,		0444, DMI_PRODUCT_NAME);
 DEFINE_DMI_ATTR_WITH_SHOW(product_version,	0444, DMI_PRODUCT_VERSION);
 DEFINE_DMI_ATTR_WITH_SHOW(product_serial,	0400, DMI_PRODUCT_SERIAL);
@@ -80,6 +81,7 @@ static ssize_t get_modalias(char *buffer, size_t buffer_size)
 		{ "bvr", DMI_BIOS_VERSION },
 		{ "bd",  DMI_BIOS_DATE },
 		{ "br",  DMI_BIOS_RELEASE },
+		{ "efr", DMI_EMBEDDED_FW_RELEASE },
 		{ "svn", DMI_SYS_VENDOR },
 		{ "pn",  DMI_PRODUCT_NAME },
 		{ "pvr", DMI_PRODUCT_VERSION },
@@ -190,6 +192,7 @@ static void __init dmi_id_init_attr_table(void)
 	ADD_DMI_ATTR(bios_version,      DMI_BIOS_VERSION);
 	ADD_DMI_ATTR(bios_date,         DMI_BIOS_DATE);
 	ADD_DMI_ATTR(bios_release,      DMI_BIOS_RELEASE);
+	ADD_DMI_ATTR(fw_release,        DMI_EMBEDDED_FW_RELEASE);
 	ADD_DMI_ATTR(sys_vendor,        DMI_SYS_VENDOR);
 	ADD_DMI_ATTR(product_name,      DMI_PRODUCT_NAME);
 	ADD_DMI_ATTR(product_version,   DMI_PRODUCT_VERSION);
diff --git a/drivers/firmware/dmi_scan.c b/drivers/firmware/dmi_scan.c
index d010c915c1ab..5394aa553140 100644
--- a/drivers/firmware/dmi_scan.c
+++ b/drivers/firmware/dmi_scan.c
@@ -467,6 +467,7 @@ static void __init dmi_decode(const struct dmi_header *dm, void *dummy)
 		dmi_save_ident(dm, DMI_BIOS_VERSION, 5);
 		dmi_save_ident(dm, DMI_BIOS_DATE, 8);
 		dmi_save_release(dm, DMI_BIOS_RELEASE, 21);
+		dmi_save_release(dm, DMI_EMBEDDED_FW_RELEASE, 23);
 		break;
 	case 1:		/* System Information */
 		dmi_save_ident(dm, DMI_SYS_VENDOR, 4);
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 618933d770e6..ad64a101676d 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -533,6 +533,7 @@ enum dmi_field {
 	DMI_BIOS_VERSION,
 	DMI_BIOS_DATE,
 	DMI_BIOS_RELEASE,
+	DMI_EMBEDDED_FW_RELEASE,
 	DMI_SYS_VENDOR,
 	DMI_PRODUCT_NAME,
 	DMI_PRODUCT_VERSION,
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index cc48930cc02a..c0e1d379d9df 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -937,6 +937,7 @@ static const struct dmifield {
 	{ "bvr", DMI_BIOS_VERSION },
 	{ "bd",  DMI_BIOS_DATE },
 	{ "br",  DMI_BIOS_RELEASE },
+	{ "efr", DMI_EMBEDDED_FW_RELEASE },
 	{ "svn", DMI_SYS_VENDOR },
 	{ "pn",  DMI_PRODUCT_NAME },
 	{ "pvr", DMI_PRODUCT_VERSION },
-- 
2.23.0

