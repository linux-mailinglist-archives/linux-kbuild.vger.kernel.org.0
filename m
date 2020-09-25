Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70D262781AA
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Sep 2020 09:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727441AbgIYHdI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 25 Sep 2020 03:33:08 -0400
Received: from mail-eopbgr80041.outbound.protection.outlook.com ([40.107.8.41]:62789
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727435AbgIYHdH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 25 Sep 2020 03:33:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ONglSJlVTcQa7KRO5DNW1O+ekBbKET59yYAejp2g3Cavdyx2uPCYwdWRoQsblgqgcycDcY8rzOt7SDnBDE76ffhAkMfryfoCJTWMcGDVmaw6YKfmNvVAuATIKO7vF3eNYA+jIGV+NWER4AYXpxLEFPxK8oruLXFGMmJifOWbA9bbK0VhdYQm5MJw/noyYzW6ePu7dByxvCBWSoIPjqcEu5R87filSwi7Bm8QAxFehl95CCZFAUSYIsVoa4oI45jnoknRaNZXx+JM9YVPHu7ZgENEY2k+2uicnexYP13PBpvwh48jPttyEzQ8jMElHgAubBntOEfzyLK6TomObswkVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4YLjKlm/UykgZjKXATlB7aqXgK+Tqsk6jHQjifNbNUk=;
 b=IByIsTv4ZZ/nXkOFicj1yYHG8Qm1PVunreUpD2xFCY2IHV/tZ6dhB/s9u/Y8Vto3crefYE/LUf9xzxUGePtlT3WtU6qj5bwCbuCcFQjY4EG7H1io22sHitzecL0RFvNnZRYzMW497NeZtHc0k4G+QCzm6AaVOG9UbVovt+fDW9uF017y2q2HPLj50uf5kMj/ryvbHPesYYoP8EPoULk27jiChHHtPGdYrqWDkm2M4E/jXcsKrGsSnXZBsyUerZGCfhuakaoGY3k9uTtySgwDdo1B6SWogFK/pTL+nJF8z+gH93cj11wh9anUalPSjMmMfnruf9z7C0R6XlgXo7RDhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4YLjKlm/UykgZjKXATlB7aqXgK+Tqsk6jHQjifNbNUk=;
 b=IzfbPRciM3RXljnKW7gi64xbgzwaFEchqLKVcvdLlcEUSC4IdtLVYCAeR4KG1sw4SqH/IyzQ9PmN5rA+MqM5Cni8ZUYvNa48hSljJstzZG+pCFva9gQ9zLedWsNII0JcA8Gf1Y8udrONR/T+UteVwZUCT7eo9hdknzkMBfcX8zE=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4960.eurprd04.prod.outlook.com (2603:10a6:803:57::21)
 by VI1PR0402MB3759.eurprd04.prod.outlook.com (2603:10a6:803:1f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Fri, 25 Sep
 2020 07:33:04 +0000
Received: from VI1PR04MB4960.eurprd04.prod.outlook.com
 ([fe80::b178:a37b:1f9e:3a6]) by VI1PR04MB4960.eurprd04.prod.outlook.com
 ([fe80::b178:a37b:1f9e:3a6%3]) with mapi id 15.20.3412.024; Fri, 25 Sep 2020
 07:33:04 +0000
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
Subject: [PATCH 1/3] mic: vop: fix a written error in MODULE_DEVICE_TABLE
Date:   Fri, 25 Sep 2020 15:31:56 +0800
Message-Id: <20200925073158.8238-2-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200925073158.8238-1-sherry.sun@nxp.com>
References: <20200925073158.8238-1-sherry.sun@nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: AM0P190CA0001.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::11) To VI1PR04MB4960.eurprd04.prod.outlook.com
 (2603:10a6:803:57::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxp.ap.freescale.net (119.31.174.71) by AM0P190CA0001.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24 via Frontend Transport; Fri, 25 Sep 2020 07:32:56 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f4d1a642-d1f7-40be-08b9-08d861253d16
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3759:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3759F5788B1B984562BC4DE792360@VI1PR0402MB3759.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xVzwEW4h59vEnmZki477B17fUP0DWKpSW5i7ReBw9cdG3ugFZYSsJ5Il7VWexbvDMZZBs58voGgn93OeGnexhCXedq2dRHWLNX3LS2HiMnRjNbBii+3/IwBQ5dGPgDvLHH5A58mtZ6A351RK+W0w4r/BZ7e61KepruGKlb7fcroxg6tLGmn/JoECK/G1kGAfoIVCBoUsEoxxQ1MWdoxdWRGaPFkU05q7biwMr3o8hm7U4aAF4VmweEq6fn1xYTwLHg5ByluBF7lrVofSzNBiProYWQmeiCU01TeJ0cyNaP0357t8IgoreZhmLpoXgddwOgEkuKSUGtGHr9IjUow8NfHgeBSVpxHxrBEVoAN6i0ebP10Y2sWmPSoqQC0tP6PCZQMBU3elldkdf5jJzphbDaJymEY2TZ0TazD6K1zUlEQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4960.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(39860400002)(376002)(16526019)(186003)(52116002)(2906002)(1076003)(26005)(66556008)(66946007)(66476007)(2616005)(956004)(86362001)(44832011)(4326008)(6512007)(8676002)(7416002)(6486002)(36756003)(316002)(8936002)(4744005)(478600001)(5660300002)(83380400001)(6506007)(921003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: VuBYGqWgGqIEkHngdM/fHUVAjlupRpR+I2koAs4ZBTUVxh3CkcoYmTdUYUYdrlHyvgLldx5x0UoyPYR5q7mzZpQgt0iesn/GMsQk8pgpcOJ1PiDxLEXOYZ5kPJBzCezYF8wNK1Dd+0bM5+cI9MScH3RNPxPCx/NK1F46nqCZzvNLLfTk1Hn1NPs8yfiVbOjn4P9fV83+f9Tdos/k28mrqKRT4uHMEAdc314qrZ9GIT+ODgVIgS1ytBtRkxHGbSPQDsaAj1IqVvC4athfzlPslF2VfliYd1FtcSHsqaWV+luPReYSBiGSj7lo7k+PiFHDIwqKpU5Y6RAh7A5JupCADBRnYJJiWcvZQJB+Io6pzjG1XcKWhqGU7H9a9SU3S9kIaXo7dAddt0RCjOT4m8EfmorC5LVe34i0vdxBMI6CfCfSg2qjWa78MbxzG7oHXCmhbsivb7C3k8q9lzZdLT2Lw0TsN6lbowQrKuFL38l631HUDhoVfHXLA5kMNYack77ZG3oC9UCFKiPJHkNsQhMqR+qpDAVbW6mb3J+vUmhdeJc1ZESTynsvBu0TXg02FuqUmwXMYzwBpWQycN/TSBeTBlRZJyKlU8NwRj6Z4KEQPaLQzhIEj8+aLVnB5sUKO8pFYUku4jNzFRcuo8kss6Hf9Q==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4d1a642-d1f7-40be-08b9-08d861253d16
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4960.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2020 07:33:04.3461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0pEcy3Rn+tawxnKJnaBfF3jRpiT4fb0UxhMK1B6T0rIX23LWsyWpjHqzS8Krf1NTXkEWBmjjlGiSoZC3ejr/0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3759
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

For vop bus, the first parameter should be vop in MODULE_DEVICE_TABLE.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
Signed-off-by: Joakim Zhang <qiangqing.zhang@nxp.com>
---
 drivers/misc/mic/vop/vop_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/mic/vop/vop_main.c b/drivers/misc/mic/vop/vop_main.c
index d609f0dc6124..589425fa78d4 100644
--- a/drivers/misc/mic/vop/vop_main.c
+++ b/drivers/misc/mic/vop/vop_main.c
@@ -796,7 +796,7 @@ static struct vop_driver vop_driver = {
 
 module_vop_driver(vop_driver);
 
-MODULE_DEVICE_TABLE(mbus, id_table);
+MODULE_DEVICE_TABLE(vop, id_table);
 MODULE_AUTHOR("Intel Corporation");
 MODULE_DESCRIPTION("Intel(R) Virtio Over PCIe (VOP) driver");
 MODULE_LICENSE("GPL v2");
-- 
2.17.1

