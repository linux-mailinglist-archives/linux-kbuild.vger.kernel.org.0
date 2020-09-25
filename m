Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A6672781AF
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Sep 2020 09:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727067AbgIYHdY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 25 Sep 2020 03:33:24 -0400
Received: from mail-eopbgr80058.outbound.protection.outlook.com ([40.107.8.58]:50689
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727044AbgIYHdX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 25 Sep 2020 03:33:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PaKDSR1f38dT+DXhO77JHgfaNMhaeX/b+1BYDckHJPy+ITxK0CvLX0p9tDKRcQ7X23y0lqbwl3/ILmvqjksy0jUUJhaM2LHwnITRZQ6MENKqEdXLwae4tQjDuBQeE+RQtiHWGaXqTnIyIIbaqHSbrfPbhnMnOPlARn6FlLICGPgECzgJ+KeHFiqxEjiHUApVbXFBSv8uUXwAbFPt4WrVYXSfa7JTesmUaWqqgQhbFCPgbha3NvekhDTjhl3N2rR9CsafgChgnwfuyXuqBPzQTQCDep5upAmLgjbMV6dG1ftTGvYUk1hi1ZwhSLHEVfIJK4DBCVEQtOdNE4D3uzLWMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8FrmW9+Lon+YV5W8Wq5B5pDCEeczdxCd82AWQ2FDrf8=;
 b=cA+eFsjFMxyK8Q4t6IKo2aaG1NMy5/mNypbuHo8r8a+Tb6m1LNqe6wImOcZi6LmXssXPZEG4SEmtHR1n9Gk6R99tUu3z+RYf9YXYKZfQPLdGouedaBLNsnx3XDDZEvV4hwYo2RgVtPVb25YzApajUdM5TDRptBeQGVgdbqkXNKC68GGEMshxrJ6272BthzHrIqPiRaGRpvi3v5OqcOu69o6JUyw+VXVFQZnKeXlIF/f91ni6AWyohNtruEwBEZO52Fo5uIjvuHFoaYaJCA29Be2u+PLIJvWTRcF1UMnPRs8q7yXqypcdj+dQCqUBYrESEluc24ojJdgkhUMqg6TDFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8FrmW9+Lon+YV5W8Wq5B5pDCEeczdxCd82AWQ2FDrf8=;
 b=klgRI5xcI0etwUCFJAVnVOOJgRDoyprLxdwsha6DkFiBXGROKpqkidOHpUlBixRQuvd9Kw0GjIF52e6ET5UDBHHGm4hqUrdOhYDdMYdALNKd2TAdfikGn/FBCJwQGUHRqm8OYIfhw2z/3TDfBOq3KQP0qaTKKv/0UsMp2JJt2Kc=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4960.eurprd04.prod.outlook.com (2603:10a6:803:57::21)
 by VI1PR0402MB3759.eurprd04.prod.outlook.com (2603:10a6:803:1f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Fri, 25 Sep
 2020 07:33:21 +0000
Received: from VI1PR04MB4960.eurprd04.prod.outlook.com
 ([fe80::b178:a37b:1f9e:3a6]) by VI1PR04MB4960.eurprd04.prod.outlook.com
 ([fe80::b178:a37b:1f9e:3a6%3]) with mapi id 15.20.3412.024; Fri, 25 Sep 2020
 07:33:21 +0000
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
Subject: [PATCH 3/3] mic: cosm: module autoprobing support for cosm driver
Date:   Fri, 25 Sep 2020 15:31:58 +0800
Message-Id: <20200925073158.8238-4-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200925073158.8238-1-sherry.sun@nxp.com>
References: <20200925073158.8238-1-sherry.sun@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: AM0P190CA0001.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::11) To VI1PR04MB4960.eurprd04.prod.outlook.com
 (2603:10a6:803:57::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxp.ap.freescale.net (119.31.174.71) by AM0P190CA0001.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24 via Frontend Transport; Fri, 25 Sep 2020 07:33:13 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9e0f8236-f9c3-425f-d7e0-08d8612546f4
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3759:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB37598B5E1278919E08BF678092360@VI1PR0402MB3759.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8nf7+qn4uoat+obPLW+bqFFZoQwip2MyFxWLzzBeaar5mSA1bp+t0nPfGTXPxiT19y+uEG1/ZNESc6LeNMgdL56OSjDGcq/BT0kpRO/6C8Vz7H/F9w1l9nMKCoFCcJhyBKx6ZACf1CTwhNLvflQ4f1SsyoG5U2h0Gcfzv2fCDRUYrGVKjW+qo16aBBb+6talvcAgB0uPWYungPRzwFT9vi8hqO60nbXKiW/MxDQRA6OqooF7OB8hgygmPnNGSyZJ93M1CFBzNHK5ASVEHItzrP514LaSDsth7VKm8K998128u0EKizTu2cznlA63zrVIOWOwN8Z6hIYYbYQmfp6wOl9jVW4ust2MwBxU1x1TpsKV5MvAWHCPPKUTOM/9DWFzgPZAh6KQcbl/0YCFPlmkcoUq181csLyM/yRCZ94xy24=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4960.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(39860400002)(376002)(16526019)(186003)(6666004)(52116002)(2906002)(1076003)(26005)(66556008)(66946007)(66476007)(2616005)(956004)(86362001)(44832011)(4326008)(6512007)(8676002)(7416002)(6486002)(36756003)(316002)(8936002)(478600001)(5660300002)(83380400001)(6506007)(921003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: xWNUd+sEGnRIo2MER8DDiQ4Qp+S1PUyddy0bVfltKU1o0vJr1ccMdUMTTr8e9VG6oXlTvzNSJvmgYo27ENPAydkEQbq0GdSC8uwHBTvKaoA0G8gVgW56mdFwKNpzTU0I+sK/Jkg/hOZWXUQIJXNY7fun0GQiJFvjG0ndgzSxMIoWhR4ZUP5rKDVR1lHC8tTBiDZS7DHfwd818zmuHqUmpQjQHKvPx+Dgxc040eQe197j7V4FtvLzsFSxaAajKvUh2yxPyXDEGAMAh44M73pVIiVIsAWif4Gx1N/fZqN696crHE92pIbtBrAKIiF92rQeS0nuQjBIqsOZKehC1Xfn/jvqt/KXmGAj991qrU+k+HZzbzlomzm4HCmZd8N4NQUGMNTTQ9YAgM5YuXNFrcl3MiD2ppDt9P2buZmkRKbd+z9Lm0mOXprrwjXSSpOum746XiQvbCktsN96cUZJAlpb4UXfPftg7JuCLnWorPzpqb4Q7Tvti9xIT8lpTF88tFqE0KvaqgpDLJkTkSK2vzVTG/OzeS0Qywe+F7Pv1wZcYiZsXqHFPDYO2Jlxx1prjD52obUmkd7avT9srtI4KOeN1NDiUu6R2/2aKAKBxaBZiYA24bsKRnRqo1JnwqFq/tTNVB3QIlQu6td3g76k0w9FtA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e0f8236-f9c3-425f-d7e0-08d8612546f4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4960.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2020 07:33:21.0637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R11qcD6sTJZIpONcWD34TVS9ioM+EVKKLi34hyzJqesWoL3jYrrw8dNi/CAHZmNKjNlFq75PxC5nfXxH8rk0NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3759
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add uevent callback for cosm_bus and add cosm_device_id for cosm driver
which is needed for MODULE_DEVICE_TABLE. Also adding struct
cosm_device_id in devicetable-offsets.c and the cosm entry point in
file2alias.c.

Cosm driver will be autoloaded when cosm device appears.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 drivers/misc/mic/bus/cosm_bus.c   |  8 ++++++++
 drivers/misc/mic/cosm/cosm_main.c |  7 +++++++
 include/linux/mod_devicetable.h   |  8 ++++++++
 scripts/mod/devicetable-offsets.c |  3 +++
 scripts/mod/file2alias.c          | 11 +++++++++++
 5 files changed, 37 insertions(+)

diff --git a/drivers/misc/mic/bus/cosm_bus.c b/drivers/misc/mic/bus/cosm_bus.c
index 5f2141c71738..736e27bbc9f9 100644
--- a/drivers/misc/mic/bus/cosm_bus.c
+++ b/drivers/misc/mic/bus/cosm_bus.c
@@ -14,6 +14,13 @@
 /* Unique numbering for cosm devices. */
 static DEFINE_IDA(cosm_index_ida);
 
+static int cosm_uevent(struct device *d, struct kobj_uevent_env *env)
+{
+	struct cosm_device *dev = dev_to_cosm(d);
+
+	return add_uevent_var(env, "MODALIAS=cosm:cosm-dev%u", dev->index);
+}
+
 static int cosm_dev_probe(struct device *d)
 {
 	struct cosm_device *dev = dev_to_cosm(d);
@@ -33,6 +40,7 @@ static int cosm_dev_remove(struct device *d)
 
 static struct bus_type cosm_bus = {
 	.name  = "cosm_bus",
+	.uevent = cosm_uevent,
 	.probe = cosm_dev_probe,
 	.remove = cosm_dev_remove,
 };
diff --git a/drivers/misc/mic/cosm/cosm_main.c b/drivers/misc/mic/cosm/cosm_main.c
index ebb0eac43754..627e7d5f3a83 100644
--- a/drivers/misc/mic/cosm/cosm_main.c
+++ b/drivers/misc/mic/cosm/cosm_main.c
@@ -12,6 +12,7 @@
 #include <linux/idr.h>
 #include <linux/slab.h>
 #include <linux/cred.h>
+#include <linux/mod_devicetable.h>
 #include "cosm_main.h"
 
 static const char cosm_driver_name[] = "mic";
@@ -323,6 +324,12 @@ static int cosm_suspend(struct device *dev)
 	return 0;
 }
 
+static struct cosm_device_id __maybe_unused cosm_driver_id_table[] = {
+	{ .name	= "cosm-dev*" },
+	{ },
+};
+MODULE_DEVICE_TABLE(cosm, cosm_driver_id_table);
+
 static const struct dev_pm_ops cosm_pm_ops = {
 	.suspend = cosm_suspend,
 	.freeze = cosm_suspend
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 736cdc236cf9..ea6cdfe1a3a3 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -845,4 +845,12 @@ struct vop_device_id {
 };
 #define VOP_DEV_ANY_ID	0xffffffff
 
+/* cosm */
+#define COSM_NAME_SIZE			32
+#define COSM_MODULE_PREFIX	"cosm:"
+
+struct cosm_device_id {
+	char name[COSM_NAME_SIZE];
+};
+
 #endif /* LINUX_MOD_DEVICETABLE_H */
diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
index 393acaa5302a..499a2832878d 100644
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@ -247,5 +247,8 @@ int main(void)
 	DEVID_FIELD(vop_device_id, device);
 	DEVID_FIELD(vop_device_id, vendor);
 
+	DEVID(cosm_device_id);
+	DEVID_FIELD(cosm_device_id, name);
+
 	return 0;
 }
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 8063b778eedf..f7c80e4da137 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -1383,6 +1383,16 @@ static int do_vop_entry(const char *filename, void *symval,
 	return 1;
 }
 
+/* Looks like: cosm:S */
+static int do_cosm_entry(const char *filename, void *symval,
+			  char *alias)
+{
+	DEF_FIELD_ADDR(symval, cosm_device_id, name);
+	sprintf(alias, COSM_MODULE_PREFIX "%s", *name);
+
+	return 1;
+}
+
 /* Does namelen bytes of name exactly match the symbol? */
 static bool sym_is(const char *name, unsigned namelen, const char *symbol)
 {
@@ -1458,6 +1468,7 @@ static const struct devtable devtable[] = {
 	{"wmi", SIZE_wmi_device_id, do_wmi_entry},
 	{"mhi", SIZE_mhi_device_id, do_mhi_entry},
 	{"vop", SIZE_vop_device_id, do_vop_entry},
+	{"cosm", SIZE_cosm_device_id, do_cosm_entry},
 };
 
 /* Create MODULE_ALIAS() statements.
-- 
2.17.1

