Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56B5B2781AD
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Sep 2020 09:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727435AbgIYHdR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 25 Sep 2020 03:33:17 -0400
Received: from mail-eopbgr130087.outbound.protection.outlook.com ([40.107.13.87]:53830
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727067AbgIYHdR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 25 Sep 2020 03:33:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eTW25HZjvT/Tk1BdOXQJXmvDk4tqBjUpOog4A6CidF4s9kQeiJ8T29z8E7Kq2HNmwH8zUIe9QM360TS35/po7QQxF4xkrryJNjzH4aOlCOqfWPI75wDqn8dGHgO2/Uxyeouml7StCXqcL53DWSJZelQpf8AYVgTpZiHBxQgKMp9eOTfhWrYG77IHX+yskSdkZG1K00nrBTK5fw5rYUbwvX8jWdRNRT+HoZEYsIXyuT+9LQWmPGjBc31MmCdHKS/VtPg8rdf8Nkz60fr/1R8+ovVoYlRy6ZzuyB4HR/YfTtQZZJZeS2nzOIh5OcLEDlJ6A2nYLKIalt98Pu/aV1PEjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yR41chohSm9+P5OoQ4TZhYOdqp2dEdLNx9SHN5xq9VI=;
 b=WzS+b8sosUruIUBe2usAEPxqtCwceeUfCP8TrtsBUgrK6G+SlrZBYZVEcSIG/SDgKoOWzkFmeuXxxKDkpudwx9yqbkqrvq7cx6O5FZV3ftLZkdO1/nZVRJXkNSuSWxVx83dpPhcCuFtWbfAAR/+aJGy/fuAT5IfRHZIS1dtCL7rSEV7rAMAxwQkohIaJ7PemgwXhWA21UKYUBG6KdBpZyAo+KIT6kLO3rg5BBWsUKN9w8iUEU1g1jL8nXbuBRmiUOj7G2eWc3YRr9lBiSMqobVXJhZHeLEmU/qtY6ku6dlej6ch6fXi9R/8mKFVXoGLuXXeYOgfAlFZEfqESwPlqCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yR41chohSm9+P5OoQ4TZhYOdqp2dEdLNx9SHN5xq9VI=;
 b=BRQUZn9KG3e3yQXCw/gGHi/ty638D3SSKKvie/+kbiUMqAD4KM5puSvTWSIJLdKVMbW8jgirO7+6Z8+q6UPNozifTXu5wYvUZblvXayPAaCqjfS1GOamV5bXB5WK1OEUODxBcWKpabQ4VJQUqjybn11h0tsPj77iTqbZBBXhT8c=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4960.eurprd04.prod.outlook.com (2603:10a6:803:57::21)
 by VI1PR0402MB3759.eurprd04.prod.outlook.com (2603:10a6:803:1f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Fri, 25 Sep
 2020 07:33:12 +0000
Received: from VI1PR04MB4960.eurprd04.prod.outlook.com
 ([fe80::b178:a37b:1f9e:3a6]) by VI1PR04MB4960.eurprd04.prod.outlook.com
 ([fe80::b178:a37b:1f9e:3a6%3]) with mapi id 15.20.3412.024; Fri, 25 Sep 2020
 07:33:12 +0000
From:   Sherry Sun <sherry.sun@nxp.com>
To:     sudeep.dutt@intel.com, ashutosh.dixit@intel.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, masahiroy@kernel.org,
        michal.lkml@markovi.net, lee.jones@linaro.org,
        rikard.falkeborn@gmail.com, mst@redhat.co, bp@suse.de,
        jhugo@codeaurora.org, tglx@linutronix.de,
        manivannan.sadhasivam@linaro.org, mgross@linux.intel.com,
        pierre-louis.bossart@linux.intel.com
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH 2/3] mic: vop: module autoprobing support for vop drivers
Date:   Fri, 25 Sep 2020 15:31:57 +0800
Message-Id: <20200925073158.8238-3-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200925073158.8238-1-sherry.sun@nxp.com>
References: <20200925073158.8238-1-sherry.sun@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: AM0P190CA0001.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::11) To VI1PR04MB4960.eurprd04.prod.outlook.com
 (2603:10a6:803:57::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxp.ap.freescale.net (119.31.174.71) by AM0P190CA0001.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24 via Frontend Transport; Fri, 25 Sep 2020 07:33:05 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 46c427a0-4066-4038-d5d1-08d86125420c
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3759:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB37594A62329DC82AD095B17192360@VI1PR0402MB3759.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FIGvJdxJ39+R2xXQke+OmTbnxwS+b9lPW/t2O9V7wYrxCdg6vTLwA3TUZ1mFwicoYk/asaRAPpmBfQdU1NrVwa/JO29BmRcUH67sQ8du8ZbfJeR+IaTcv2agq9Toy7SAXwi7+kPzbXqw35fLMYyCXqck/yZYyTzI6dWJP/N+Mf0W2Pn+GIK7hYoTYBc5vy1GnsOF7Tn9h5afxmHv5aWWJdjKqlkGAtLeO0V/rpxFpMs0p8UNinqioaz9LZMXzvJxoMHTwMmkKTYth31fw7Ejdz7I8+JkDD1KRhbpCp1qqW5PEQ72L7n4fQ+j692sKtszTq9t5quo0WObgYceHSoX6qXrsJavL0ELDvusBnPQetz/InlDFP+Eef8KP3fvZ1P+kvF+k9vZXmr+hkxP7u4zpXAfCfaUm3swol2066PZ9FA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4960.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(39860400002)(376002)(16526019)(186003)(6666004)(52116002)(2906002)(1076003)(26005)(66556008)(66946007)(66476007)(2616005)(956004)(86362001)(44832011)(4326008)(6512007)(8676002)(7416002)(6486002)(36756003)(316002)(8936002)(478600001)(5660300002)(83380400001)(6506007)(921003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 19ztMM7YxcFdz6VBLIDCMxEyLhYpTAsO0VYde1TEFpNNiyLGsupyuAfpYGlKiSZ2GBmnQNOb7oKp/OgoBQNH9tlb8QBFLfs8XPduNU9KlYZ/N53tiXX0vvnolmbRVY+VaGD0X+Ko1kZwTcnJENbJMNmfAgns55HHXQQre5uZyzxz1L3PAjeU3g91xJ2ZZC6kgLAFDnaDYBaGeimaJTV7G8MsvfERP8tCGjtgZLjiZIggK/0bkSto4RgWcRIRSoojyF7TUbidPxVJf1Vk1vsi2FZaAFPM2BHmV5rFBX4pTRsRUIWDEQ3O7iHsSJiPMA1qam9MdC88uHNocVu0N/o1H2UMTI5Zfh6wlbQLAoY9MGaBUmFwTTp6XktbBcjH15eSM7bbvg5JeBdcUCHuO7v2ClrE8KSrcJ2JbUnZNMZPNIHwhNOUXRWzi6kwKNHytRe8u+eFo7pyuX73tdUKnNBxBnOZUmsRcQ0zHcPl37+kDuHcSuogPaRZdw9/rNrNEdoQVIA5M5v8APCcoHeYHCdczs/G5IsW91K0UNjGP3wOAhuIE/to7f5tX0yLUMx2yC99wN6erCx1PP4FKQtbR1FqKP6AN1CJOi85JJPKfCV76g+AL52yYoEMZOgnf6BVD7jespKv9rjJeHfCeryHTezr3A==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46c427a0-4066-4038-d5d1-08d86125420c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4960.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2020 07:33:12.6874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hsUx4Pk+4ncEZtZnpDRqjBMH7lpXdFxRVhKM1eOQkw0m3VFVbdIuaQJTvyqAoJRnxJD8AuwTQJj1Mua2lyC6MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3759
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
 include/linux/mod_devicetable.h   |  7 +++++++
 scripts/mod/devicetable-offsets.c |  4 ++++
 scripts/mod/file2alias.c          | 16 ++++++++++++++++
 4 files changed, 28 insertions(+), 6 deletions(-)

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

