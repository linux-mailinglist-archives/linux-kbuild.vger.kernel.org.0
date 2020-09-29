Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9BE27BEC0
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Sep 2020 10:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727495AbgI2IDw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 29 Sep 2020 04:03:52 -0400
Received: from mail-eopbgr00045.outbound.protection.outlook.com ([40.107.0.45]:25610
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725779AbgI2IDv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Sep 2020 04:03:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j1ci6R8N7geNYbjqNke0hsRp2IeJlsnIjC1QDeOvydc0A7R3iHq5cYHaoMA8pD6KoB0XueMi09k/atPQNwbq8BhL9JemGKq2+HIgnbwqj6VfMhZBXytasR8+j8eVfn5jRUmb1qMFueq7GNB0u59ubVBC1CXzpl8jA5hbXu465eYvmJdXrnUXbrmfWiu/sFpqpj+KUSiJvtI5SUMU5VTrPm2L91A+ZQZ93rSpwYTW3cySWBa4wINU5HIkh4wyHVxu4Si2bS9cgz3/ZmRe52m1RrKI8XX34wl0/ML7LlR/G5nxNWmsttQom77FwY2bNr40TkthqDnyTaAcGPjp+GQoYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FGu4WkvQwrE1Qw4ppYFm2P1iMdh78aOQk1fvRaQU+Zc=;
 b=Ovo/HDzb4wx6lAEoRmv/gpoFiBAQ3CCEwnlLKQsHiRG3GeTsA41/pAx3uqaZPHe38u2bssVTelr25T5feVs72n1H8xeVjfLYxrJ+FiKZtcVDWmRdaKU0OAi1Qn1AF8uhSqKMsKFmXY2/cLA+QYAlufBAIDwx9cy6pSNtPTZg6GQpMW2LxLQMe96qTOjAJd+s8k5QU4RAfRDQLPlnBilSVmk9jgU8WCGu1pmzRWZVqM7+KSLpzlbwBmeI5Oa7WHWXEyGWFasmiivhjdjGJ7eBCUzqFnlOYREgXvW2vnc6GOP1pW9taKuiSYQGjOQaUO/oKuxvisMyuyRUrLekwwm/Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FGu4WkvQwrE1Qw4ppYFm2P1iMdh78aOQk1fvRaQU+Zc=;
 b=nKytHiVdW4YXDwC8AucSznAAnTKpZx8rrVybU0jg/95Rb5L/s603WEQPA4OAB9qfG7gC6sX1mci780kffZw71L1YA0uexGGNYmhUPh8+Ye+KZGNwRKOaO4SUZh63TgUPWUPuNXz9jk0Fko7Si+NA9jFYLhEjTyI3a4M/2NSuwD8=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4960.eurprd04.prod.outlook.com (2603:10a6:803:57::21)
 by VI1PR04MB4255.eurprd04.prod.outlook.com (2603:10a6:803:3f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Tue, 29 Sep
 2020 08:03:48 +0000
Received: from VI1PR04MB4960.eurprd04.prod.outlook.com
 ([fe80::b178:a37b:1f9e:3a6]) by VI1PR04MB4960.eurprd04.prod.outlook.com
 ([fe80::b178:a37b:1f9e:3a6%3]) with mapi id 15.20.3412.029; Tue, 29 Sep 2020
 08:03:48 +0000
From:   Sherry Sun <sherry.sun@nxp.com>
To:     sudeep.dutt@intel.com, ashutosh.dixit@intel.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, masahiroy@kernel.org,
        michal.lkml@markovi.net, lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        linux-kbuild@vger.kernel.org
Subject: [PATCH V2 1/2] mic: vop: module autoprobing support for vop drivers
Date:   Tue, 29 Sep 2020 16:02:13 +0800
Message-Id: <20200929080214.23553-2-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929080214.23553-1-sherry.sun@nxp.com>
References: <20200929080214.23553-1-sherry.sun@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: AM4PR07CA0002.eurprd07.prod.outlook.com
 (2603:10a6:205:1::15) To VI1PR04MB4960.eurprd04.prod.outlook.com
 (2603:10a6:803:57::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxp.ap.freescale.net (119.31.174.71) by AM4PR07CA0002.eurprd07.prod.outlook.com (2603:10a6:205:1::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.13 via Frontend Transport; Tue, 29 Sep 2020 08:03:43 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 22acbb39-5347-4286-8978-08d8644e31ab
X-MS-TrafficTypeDiagnostic: VI1PR04MB4255:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB42553B8DA8A76807EF407A2B92320@VI1PR04MB4255.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PCVrAh8HkKfV9Bs4+BN3iUT26mxGhW5Xk5czSVMvktZCs6wpxssX0TzC4+2sdAd6ikAbvJ8yCBNZPI0I0GGtOgkHlb1bjae884F0P8DWtZPmLdxwnCi5J2Y1yxfkUuuSwdOj7aaGFDcTPuFAjfZ8l614LZwZ2/sTnbwhg0INslp5qM7ReVI8rYHaQK3qTmmuhXWYKO9zWEdnK5nzKGmmn2syVFnxrB3YrnDP3LEp8UqBAe9g7O42hdxPilfN34JhceVYT8GgRF0MiQM3pOriT7C1NJ39gRh9bjYM036wxH6UOCr2oWRRu2ZLEF/i8fyYpvu0VH3Va/5F92o1LEK4Oo/ars45Pdk/AsgdPRtCMDTk+PjlEUMiU89DKxkQo5Mb
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4960.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(376002)(366004)(396003)(66556008)(66476007)(36756003)(1076003)(4326008)(2906002)(86362001)(316002)(2616005)(956004)(6486002)(6666004)(478600001)(8936002)(44832011)(8676002)(66946007)(6506007)(52116002)(5660300002)(26005)(186003)(83380400001)(16526019)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 0iVxdjzNwZVgAJ8rhEFmeKRky+KI6DoB8c69QF1I6iAOnU8FFPPyjdd5fOBHRxzLQC5oovJIHQOVyNnbpbSn8dI/VeCmpSZpdv2uVLw39n6GhU092kMSrK6nDU7r6O9Qmi6yKjfjQnfax+zH/fYr/4D+RIe7vo11yOWYnEEjeMSmR8V/rEbzXlKzHJIrjS19rFU8LtRmC1qSTx4S4k+I3D8gJQoo/x82rRCdwDWpYGrqaE4DvyVSuhqcdPjMc7WRlA8mdBH3C6/7Q/LmvwwK/F9fn2X/vPx1Pk/B2v5Vbehtwbjs1qvR+IHt2VGI4ODJoIK7UaC/yJEbOHRhN5Cc/aJhWnOkXhTK5WwB/Y7byF5sgCjUaxX+X69jnM7YcDGVIhbpRLfOqzR+72uipMxKREjNL6hG/GhkzCbjnuEf4NOmHX/0TQcEqI9Y7CG887zIpx1yOTwMJhyiklElyzdoqwQ82ZHuvxVvT0mispfGTjsmpGCqYlmhcM3YpEu47DqPVievz9ptkUP3gNIgdSuNJHwkF6QaHbzZWod6apH1iXy/P+0k4HpFIUrd0BRQIdMgN6rhMthefqT03N5lEff64ZvgIEOhXeT7pL9vqrHv/evhLDPe9cOMgMfXVOR0bO0kHkFe/vqe8536rzK04bNWrg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22acbb39-5347-4286-8978-08d8644e31ab
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4960.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2020 08:03:48.0954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/CKUKLF//ZOuTrxWcEbuzDvca2bDNbeT+gHLr7KJbC6lIREkdv9greMU9YvHdewi6fasN2dyREMD0GmSSgZbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4255
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add vop autoprobing support to MODULE_DEVICE_TABLE() by adding info
about struct vop_device_id in devicetable-offsets.c and add a vop entry
point in file2alias.c.

The type argument for MODULE_DEVICE_TABLE(type, name) is vop.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
Signed-off-by: Joakim Zhang <qiangqing.zhang@nxp.com>
---
 drivers/misc/mic/bus/vop_bus.h    |  7 +------
 drivers/misc/mic/vop/vop_main.c   |  2 +-
 include/linux/mod_devicetable.h   |  7 +++++++
 scripts/mod/devicetable-offsets.c |  4 ++++
 scripts/mod/file2alias.c          | 16 ++++++++++++++++
 5 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/mic/bus/vop_bus.h b/drivers/misc/mic/bus/vop_bus.h
index d891eacae358..5b4a58757951 100644
--- a/drivers/misc/mic/bus/vop_bus.h
+++ b/drivers/misc/mic/bus/vop_bus.h
@@ -14,16 +14,11 @@
  */
 #include <linux/dmaengine.h>
 #include <linux/interrupt.h>
+#include <linux/mod_devicetable.h>
 
 #include "../common/mic_dev.h"
 
-struct vop_device_id {
-	u32 device;
-	u32 vendor;
-};
-
 #define VOP_DEV_TRNSP 1
-#define VOP_DEV_ANY_ID 0xffffffff
 /*
  * Size of the internal buffer used during DMA's as an intermediate buffer
  * for copy to/from user. Must be an integral number of pages.
diff --git a/drivers/misc/mic/vop/vop_main.c b/drivers/misc/mic/vop/vop_main.c
index 1ccc94dfd6ac..f1e908286843 100644
--- a/drivers/misc/mic/vop/vop_main.c
+++ b/drivers/misc/mic/vop/vop_main.c
@@ -742,7 +742,7 @@ static struct vop_driver vop_driver = {
 
 module_vop_driver(vop_driver);
 
-MODULE_DEVICE_TABLE(mbus, id_table);
+MODULE_DEVICE_TABLE(vop, id_table);
 MODULE_AUTHOR("Intel Corporation");
 MODULE_DESCRIPTION("Intel(R) Virtio Over PCIe (VOP) driver");
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 5b08a473cdba..736cdc236cf9 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -838,4 +838,11 @@ struct mhi_device_id {
 	kernel_ulong_t driver_data;
 };
 
+/* vop */
+struct vop_device_id {
+	__u32 device;
+	__u32 vendor;
+};
+#define VOP_DEV_ANY_ID	0xffffffff
+
 #endif /* LINUX_MOD_DEVICETABLE_H */
diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
index 27007c18e754..393acaa5302a 100644
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@ -243,5 +243,9 @@ int main(void)
 	DEVID(mhi_device_id);
 	DEVID_FIELD(mhi_device_id, chan);
 
+	DEVID(vop_device_id);
+	DEVID_FIELD(vop_device_id, device);
+	DEVID_FIELD(vop_device_id, vendor);
+
 	return 0;
 }
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 2417dd1dee33..8063b778eedf 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -1368,6 +1368,21 @@ static int do_mhi_entry(const char *filename, void *symval, char *alias)
 	return 1;
 }
 
+/* Looks like: vop:dNvN */
+static int do_vop_entry(const char *filename, void *symval,
+			   char *alias)
+{
+	DEF_FIELD(symval, vop_device_id, device);
+	DEF_FIELD(symval, vop_device_id, vendor);
+
+	strcpy(alias, "vop:");
+	ADD(alias, "d", device != VOP_DEV_ANY_ID, device);
+	ADD(alias, "v", vendor != VOP_DEV_ANY_ID, vendor);
+
+	add_wildcard(alias);
+	return 1;
+}
+
 /* Does namelen bytes of name exactly match the symbol? */
 static bool sym_is(const char *name, unsigned namelen, const char *symbol)
 {
@@ -1442,6 +1457,7 @@ static const struct devtable devtable[] = {
 	{"tee", SIZE_tee_client_device_id, do_tee_entry},
 	{"wmi", SIZE_wmi_device_id, do_wmi_entry},
 	{"mhi", SIZE_mhi_device_id, do_mhi_entry},
+	{"vop", SIZE_vop_device_id, do_vop_entry},
 };
 
 /* Create MODULE_ALIAS() statements.
-- 
2.17.1

