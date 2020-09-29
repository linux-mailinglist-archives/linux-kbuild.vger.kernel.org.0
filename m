Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A76227BEC2
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Sep 2020 10:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727403AbgI2ID6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 29 Sep 2020 04:03:58 -0400
Received: from mail-eopbgr150089.outbound.protection.outlook.com ([40.107.15.89]:12871
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725779AbgI2ID5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Sep 2020 04:03:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMPRxTRAlouV3cBn1aPQxOoog+DWtg8EGfH4Zotw1SEsyZ8CiLT3BkaeSiwJXMiPkRORKS7pgHP4xLKPdctQWDJ1bINS1fs4sz2mbOH89Z8s7z80a+cBLZVHRFNvokF5JAXf3crIEIBLfxs3vbITy57OudHkhz1pSweKjQutvdZpX1JjpMvB8BE7KpJ5vXg1IsA4AjOsvTkHxQfIXkv/SaPtDOIKDYwGZzG8IiU3FfrOvCgAcpJ+QvL03wAjKhypp/7CAw5cfKQ4YbScboUHu8iHedRhzFbV72bQt/kbQkBmy3ll82OcKFiL2lgoGEX5h9jJeb08CJfIYCMvsE8fSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8FrmW9+Lon+YV5W8Wq5B5pDCEeczdxCd82AWQ2FDrf8=;
 b=cueHuV0Qg/lsvFdPhtRmQv0/8Z0ea0QmVn5AWPweNDrL0NjMax/m2a4DUjlfsiBf723t1nx33bC5/f0wzLkXZzaJLLJRP7CEPx97rUnKmiyKripxmIy4rHiCwV9fXii4Tvqm/fDQUwX4XEpD+Ydh17zAlAJjkTfKKAbGp5WGhGoU/72MTU0gW3HV4Q/0YKpvwjFcPUXU2HfqOkVMQcc2LzjeqVwzhqSgbG7BjWT6IJe9M7CxONAIAE2Q3HdVgvQQYijtb1cqkKZjFHQbWEyALiLbDtk7wTm2SRf6zxXQJaLn9FmXSCVEIT19cXmCq6UR0XtCbvSH2w+jxpOjxRH5eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8FrmW9+Lon+YV5W8Wq5B5pDCEeczdxCd82AWQ2FDrf8=;
 b=lVCeXmuvxavB1GDTalcoiFOPPJof4RGZmyAfsC+r/ponSz3OR3rA64waVK7cvkorHbk9u0djiRq1nvlVBkwx1WXc4nbKhJwrpG9VihgOTgdNXz9D4BAnI/vROQ2Mdkh76yOMWQYubigwfz/KQ90mjb4L8SpDf3lrb432N3hd/Rk=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4960.eurprd04.prod.outlook.com (2603:10a6:803:57::21)
 by VI1PR04MB4255.eurprd04.prod.outlook.com (2603:10a6:803:3f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Tue, 29 Sep
 2020 08:03:53 +0000
Received: from VI1PR04MB4960.eurprd04.prod.outlook.com
 ([fe80::b178:a37b:1f9e:3a6]) by VI1PR04MB4960.eurprd04.prod.outlook.com
 ([fe80::b178:a37b:1f9e:3a6%3]) with mapi id 15.20.3412.029; Tue, 29 Sep 2020
 08:03:53 +0000
From:   Sherry Sun <sherry.sun@nxp.com>
To:     sudeep.dutt@intel.com, ashutosh.dixit@intel.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, masahiroy@kernel.org,
        michal.lkml@markovi.net, lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        linux-kbuild@vger.kernel.org
Subject: [PATCH V2 2/2] mic: cosm: module autoprobing support for cosm driver
Date:   Tue, 29 Sep 2020 16:02:14 +0800
Message-Id: <20200929080214.23553-3-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929080214.23553-1-sherry.sun@nxp.com>
References: <20200929080214.23553-1-sherry.sun@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: AM4PR07CA0002.eurprd07.prod.outlook.com
 (2603:10a6:205:1::15) To VI1PR04MB4960.eurprd04.prod.outlook.com
 (2603:10a6:803:57::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxp.ap.freescale.net (119.31.174.71) by AM4PR07CA0002.eurprd07.prod.outlook.com (2603:10a6:205:1::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.13 via Frontend Transport; Tue, 29 Sep 2020 08:03:49 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 403cf4b0-e831-4b63-b249-08d8644e34f8
X-MS-TrafficTypeDiagnostic: VI1PR04MB4255:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB42554464834D2672100CF08092320@VI1PR04MB4255.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R3cW2lGCjLOtZnFqCwrNFbnaCDcLTApCUBY+U9cdkd2N4s3txannewgbtHeq6tOaYErsHm6AjtQdhze6mXamN2OSi0G/RJPToJfRtCD3ufmhBHaq27UR0iPqXgPF834QwO56UhcRPZTpGoWB8yyAs4PdexjbiyetOgHLgKoeRCqzQsIhIWxNOJ5TxY4puugB46x3tr2tUm3kTr7W67fV7QwTuE6TJRGJWQx0olhIaiCL0D4s3n2psAeRZ13hirJXqBZE6X779x4QV/FYV4jAJi1YTNbEFbuxXs/k5S5MdXtL8OMHLtZOOlm8IPL8T6p1cnACJadZkb9JLPYbjfBOUEYY5v6LhleMqb1Ie4QV8/bJb8fekjmwoQFmWLuMF9zN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4960.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(376002)(366004)(396003)(66556008)(66476007)(36756003)(1076003)(4326008)(2906002)(86362001)(316002)(2616005)(956004)(6486002)(6666004)(478600001)(8936002)(44832011)(8676002)(66946007)(6506007)(52116002)(5660300002)(26005)(186003)(83380400001)(16526019)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: yKYrJo0GBfYcqYOWkLmbeE8tV2VRe6/IO7vfcmXIJeIh59JVmlMZzPZCXslTQrvtAW4ZTsgkSb1IzAZNV60lwajHNFfFRtnZPiqQRp9FoDz9OodUg3G34k3SnKfFTo8+2VqLaD5EqTH/YnC0GQaDofaHDgHHvmF6IhoDBHgL4iKVH/ddV090kYomb5Tr8MGvxZJyy7DYBkCDbW3rsTBWp3rKK86onXfl5RJCVNGTecEC15wPnvjKIn4wJapr6o3yeQFP+o0svpW7E3+s94g2Rl3PgYQY9XKhRGFTVNnCnpj/s3nsHH7X7m5C+ZBzjL2E98nftUxW4HqDcLWFbSmM4OLUNFe+sVjuDnr9AMIiBJzhwJWcWXPLfMlfVgRAR2JOui+/V5C0XIdbPb4n2FHtkMdOUoFNbU6XNbZhw/3ZFyUK+tcWi8RBbKoZhB+B4GpV6pYc/vV+qRQ2J/KW02auCl1PXrkfacAMEG05DiO6zX+jnneUnkV78nBLa4DQnfEEYb044JWCIc5/oDBrDde7gDG9E42BhDuBaPkvsS8pG+0KIAOuuLZaiZjdePL+Owf5d3urifoDA2XrpXRtYRPvsH5FDXW592NqxAZ/giknmKGxkn+kpHMOH6oVs7WbrTGY6Hjk7Ed8HCNKHqyjB/kNFA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 403cf4b0-e831-4b63-b249-08d8644e34f8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4960.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2020 08:03:53.6682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qnjfwm1Hjf/97+mA6J3QfoSYEDIk7+Ew3EMomSyRhoDM6II5BpqDklBkeY4wId+o6IZ0f/q/Jid+WPtYaEsxdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4255
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

