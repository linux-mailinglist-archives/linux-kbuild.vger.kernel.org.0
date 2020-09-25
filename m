Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA7627819E
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Sep 2020 09:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727132AbgIYHc4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 25 Sep 2020 03:32:56 -0400
Received: from mail-eopbgr80089.outbound.protection.outlook.com ([40.107.8.89]:16867
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727063AbgIYHc4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 25 Sep 2020 03:32:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hIBfFcEHsoC9r4QpoUB+IaxyrQUNiPFeWoURrABNAASgSqm9BKftCWZU0qDJeIVo5j5jMuzcUT3tCKuiVENKMf6PrwDtdzHcKLTYK6ymMDm4pZ3fkYZPQ3jJMWk3WJF+TcfaN+rCTvpsE1Xb0xhLB/+nD4W9A2+kc5XE8xp9Duv6FOIy+nn0Niyw0HCDTEzHH4S1yDJYlUeeDG4eQrpc5eGu21e3Xppgm2xVz7JgThhwQwaf+HhcVFCGwQoY6hH3Sb/9dTgff8q/srdti35xFB+RNhYBukmMgBMo9ysJJ0mRt1dGhnESazZInXE96oJD20SQnJeBjyWMniJNGywW3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DULsGX0LiLgeeBRG8HAIW2+nbijyBDkirlcmaZywJRM=;
 b=WBxKZ6XltWp+a1nPAPBnUjJHZx0dQRW7mg/ECTG9hkPODQvltouAn++zWHHusLZ9nI8VCZrV34Ewh5zrD0wOX6ZAELCqjXfXl0lz8fYs24V0zNkAj+dugFZqV08DzVo0U5TfQehCY92uDp574U3V59+7YRRlOM9I4wvG5SENuBN8WbQwvJiIwakmhDLk4+2LBt5dxbesK8tj6wYB8KM1bJA+kitjITM8ySzMrhdwMs2l2+cC7vHdA99qBMPyZCuJ6gATQ6gQgJI5t4yc6Q1y6B7FtlqRWcG2E6CMXFW2jGAekjPFTua1dUSOjK1qrGXbKuDgDCWrRfplR6oLTsmWpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DULsGX0LiLgeeBRG8HAIW2+nbijyBDkirlcmaZywJRM=;
 b=WgbjpcwdRTWc3aqeVgnS88frmi+NH31wz9tkHw/+UFj19BgUgYmfK8vQTZypWqnCVFtgeSOXcwZA74EfQzsO9OUMsg9JaDgBza8F8PeYdg+IQN98uCAtZfCaa+S9vg13p9QPcTXCWMzf3i3j5mk5I5xatFfIn7M8exznBonWe0M=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4960.eurprd04.prod.outlook.com (2603:10a6:803:57::21)
 by VI1PR0402MB3759.eurprd04.prod.outlook.com (2603:10a6:803:1f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Fri, 25 Sep
 2020 07:32:52 +0000
Received: from VI1PR04MB4960.eurprd04.prod.outlook.com
 ([fe80::b178:a37b:1f9e:3a6]) by VI1PR04MB4960.eurprd04.prod.outlook.com
 ([fe80::b178:a37b:1f9e:3a6%3]) with mapi id 15.20.3412.024; Fri, 25 Sep 2020
 07:32:52 +0000
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
Subject: [PATCH 0/3] Add module autoprobing support for vop and cosm driver 
Date:   Fri, 25 Sep 2020 15:31:55 +0800
Message-Id: <20200925073158.8238-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: AM0P190CA0001.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::11) To VI1PR04MB4960.eurprd04.prod.outlook.com
 (2603:10a6:803:57::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxp.ap.freescale.net (119.31.174.71) by AM0P190CA0001.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24 via Frontend Transport; Fri, 25 Sep 2020 07:32:44 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 89afbc4a-9252-45c3-b660-08d861253585
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3759:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3759F5B1F8FE9264FEFE29D292360@VI1PR0402MB3759.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5amIF2N1/XvT0Wf1GKgOMJi2+CFnWhQzGZZ5sRKybFpLsbCkmr7+/IxfRMzl1ETbBJmD/qJnAInfzDfPrqxgrLmQprdhMPxCmkcSoPA2j+7snQdLNJOFshEH/A2X80HJtJCHv7St9WX16VSjp5+IsLK6uYz7/Qz4SvhDg6CCyBYSQyy3opSgP/UUvfAq9fB6a2KFua/FPEK6+vYVhnHoss1w0OecVj5Dw5FPOtJh/b6PLj2ity42FY6a9rkI3rIc4VuI6OYKME3EZ1Nm/j2G9L7KvsS7NaA9hgYysjz9/9nF//LvYgaNcKa2MPFUwFVnRXjUttpQi4fdPpaBOAd5hXCVBHY3dwaE5jnPgl3PDj6WbSfNMfY+PwjQsFIdsl7P1AcdnJJiNN3NVGnJII9t8Kl1kJMUvadmMKVstpz1IOc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4960.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(39860400002)(376002)(16526019)(186003)(6666004)(52116002)(2906002)(4743002)(1076003)(26005)(66556008)(66946007)(66476007)(2616005)(956004)(86362001)(44832011)(4326008)(6512007)(8676002)(7416002)(6486002)(36756003)(316002)(8936002)(4744005)(478600001)(5660300002)(83380400001)(6506007)(921003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: J/5mrTRNNcfPOjp5i7e8cY1P8ccN35ydYC7Oat5SUfaR6pzPC9yq9rrzfpURM9VzaLZMzX1aHHxpCF4lyJVRdq59uf+XbEMXOrEx1Czk0T0Aj3vuYOi+fSJnJsmgnu6iWSEsFFbE+e8jEuxBsBtHhblwAe/hv3ocqm2U9yNzQBZXjbV+duKBoPUmyj5Gyrit3SeFGAbZrsPRIIBMW+eSViom4ZGTveES0GEitSwZfY62Xg/Ze3BJSqaHhHEN70qC9WjEWsuzbLuT8w7jm8Ll4XEkskyWHviD4tL964jWr9JG8OHcndt+iGWikUjwTP2rfxL2CGYnUWPbp5HkvSRl9GvgMuS/MqSw23/p33cwr6Tc2sliOcU6fZl41528XE35uVYzySYftWb2zW0kvpl6BNd7o+tafe88npEPyxo9mENlqQpzlBHTdVwoP5ITT9P9M3UQWeqqLHE+Kt1BUuYnL1SYVRlL6uVAmd4xvpk5tPbLu4HceN/bx5Z9U7SGMOOsVHuMfztbhfJoULCZe031Vwo83gJjh6HdqpDNsr+TmVG9lxQlZKQ1HU4vbViScWQQ7njfcQZLfIXPg0+g/0vAMX9HNXjCXmRtuu9VRWB8HYpfH/LFxtjNMxiTj0ZzzQFRkbuYwgSCy2DD3UAEACYIdw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89afbc4a-9252-45c3-b660-08d861253585
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4960.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2020 07:32:52.3038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z24vOgL6NRR4lD1a7CkzJFhSo1y/ZI+dKS88kB+dPGehwIEkJ0W2tVRzRd/rWJ9ebwdQXbnQUND44qj8LBkQqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3759
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add module autoprobing support for vop and cosm driver, when the vop/cosm device
appears, the driver will be autoloaded.

Sherry Sun (3):
  mic: vop: fix a written error in MODULE_DEVICE_TABLE
  mic: vop: module autoprobing support for vop drivers
  mic: cosm: module autoprobing support for cosm driver

 drivers/misc/mic/bus/cosm_bus.c   |  8 ++++++++
 drivers/misc/mic/bus/vop_bus.h    |  7 +------
 drivers/misc/mic/cosm/cosm_main.c |  7 +++++++
 drivers/misc/mic/vop/vop_main.c   |  2 +-
 include/linux/mod_devicetable.h   | 15 +++++++++++++++
 scripts/mod/devicetable-offsets.c |  7 +++++++
 scripts/mod/file2alias.c          | 27 +++++++++++++++++++++++++++
 7 files changed, 66 insertions(+), 7 deletions(-)

-- 
2.17.1

