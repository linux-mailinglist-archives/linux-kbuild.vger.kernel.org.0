Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A442B27BEBD
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Sep 2020 10:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727260AbgI2IDp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 29 Sep 2020 04:03:45 -0400
Received: from mail-eopbgr00041.outbound.protection.outlook.com ([40.107.0.41]:25707
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725779AbgI2IDp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Sep 2020 04:03:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UiTWnyB76x511baebKNlD6RTSk6DzXqWbx55Km68B0IXxno1AW4JVan6InpAnjfrh4tEpuSJycat1tbapSrr/6/r2OwYdm2c3qOrPBejixApE6ycS105JmWhfKrXjz8pEU9ToMfVDG78vrQ/6bK6Dsvg8+dk8OILFKojR+X3Au6JgSTybPbo8e4Jo0iJLM/dblPt6Hq8YIOWFibRjZLLQV3Thu/WxyjHj4SBl8/075oXL5wQiBRJCYj2lq0XcCWS1YepwX6FKwEmoOEnWVGrE901OuUMXJ5GzNWLFIf1uXMaYuBdpx4TyVOLMAoSfjoCi327xdXfz0KmBvEsNjXLaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npLMllt8Z45U8hY+l0IJSSDI9kmyOK9gwCbvInSiTm4=;
 b=EHT2c5Vk2KUIhwgUnrv15WCab3eSQobvOm7xYVCKOv5cUEl5N1l1Ht3TYvYnUyDKZklBj1dcLE2P85JJikYLsnTa1BRVmKrl8O/6THk2xCA1UeWDO7IyhS8qlN+lVVKpjh+KiEQdLyKgo491pomKoahVznJ74U0C0NjTiXlfGA0oliENYFAg1IsKMC1K6v+osVARglrK33fRLdBKfYcY72KzVNs/VrIOyQ59iKiWPUVOtjo0aOA0P5Rm2O3MyMVVsh0EKuYbc+PD214JzFVmxuVvN30BqaayKJcxDJAp14KhqNaM+WyujIv2DePDJxUVRwa7KKxh7IPjnk1uzzW2sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npLMllt8Z45U8hY+l0IJSSDI9kmyOK9gwCbvInSiTm4=;
 b=LOpXQVBs5ePuRjukT1iK0f8awYOxE7V1BjjjnB//JJ0eH4gu/QFTeTeJUyQEVSsLVGHJxorv5jPk8fmupeuxZgb9urs9Z1CBAGBuxgFJ+UruIKiPaS8N1eE9IhK4pBqE09V7G1nCYFg8cS4da51z7ea4lBcY9GXkkeE36KutZCY=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4960.eurprd04.prod.outlook.com (2603:10a6:803:57::21)
 by VI1PR04MB4255.eurprd04.prod.outlook.com (2603:10a6:803:3f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Tue, 29 Sep
 2020 08:03:42 +0000
Received: from VI1PR04MB4960.eurprd04.prod.outlook.com
 ([fe80::b178:a37b:1f9e:3a6]) by VI1PR04MB4960.eurprd04.prod.outlook.com
 ([fe80::b178:a37b:1f9e:3a6%3]) with mapi id 15.20.3412.029; Tue, 29 Sep 2020
 08:03:42 +0000
From:   Sherry Sun <sherry.sun@nxp.com>
To:     sudeep.dutt@intel.com, ashutosh.dixit@intel.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, masahiroy@kernel.org,
        michal.lkml@markovi.net, lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        linux-kbuild@vger.kernel.org
Subject: [PATCH V2 0/2]  Add module autoloading support for vop and cosm driver 
Date:   Tue, 29 Sep 2020 16:02:12 +0800
Message-Id: <20200929080214.23553-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: AM4PR07CA0002.eurprd07.prod.outlook.com
 (2603:10a6:205:1::15) To VI1PR04MB4960.eurprd04.prod.outlook.com
 (2603:10a6:803:57::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nxp.ap.freescale.net (119.31.174.71) by AM4PR07CA0002.eurprd07.prod.outlook.com (2603:10a6:205:1::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.13 via Frontend Transport; Tue, 29 Sep 2020 08:03:37 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 85f2ba37-262d-4e72-108b-08d8644e2dff
X-MS-TrafficTypeDiagnostic: VI1PR04MB4255:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4255E86C08D92FA52E1F50F092320@VI1PR04MB4255.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hZZvF0a36tw5PjuWKzpDCZeWzoo3fvoOS0FjnBcoowciMM7Pog6du4p3CoV/iI8+qL1+8ieVomIRHET8wnqPgZWiOTNG7KeEmliy+gmbAPloViEb4ALHu6c/Kme0KlEbkrhaer73vKzTV4HnqGGCW3Rrzn/uKOs0K27Jxtwk4GGq/DM4A3PpRwwG0/JRxez3iSwVYpglFf+mYZv0vv/+aRsmqwYi2H7JouICmtGoWEcXiSPtO5qi5lWbwnvf0YKfUrtKKKCU1dxb/A9xciFnzFyIWJCbG8n+Zy4DjvZO8NvbflVNXOQYPrHfj0/wE25CoHNsZ7AE5jVsmYuxl3IFGbq5QobgnbS1sfaU86mf2UH7Ift/VStymzuU7BTQda+d
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4960.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(136003)(376002)(366004)(396003)(66556008)(66476007)(4744005)(36756003)(1076003)(4326008)(2906002)(86362001)(316002)(2616005)(956004)(6486002)(6666004)(478600001)(8936002)(44832011)(8676002)(4743002)(66946007)(6506007)(52116002)(5660300002)(26005)(186003)(83380400001)(16526019)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: SYGDSI/hsdyC/gU0CysrkqhyziUhBLXf+QaTBC3LC/jw5LJ78IYfZAVGAnJfmoLcqdXrKbvVNmdPnOImHR59Fg/0JDCG/d1lwPLYZJBZyhe0RWrTVP5yZM+rikGn4cw6cyeTmU5eHdm0dzlK6ga7dDNAAu5zxKnnbVAQHPc16gLFV7YZujYUBFRLWyPeMuEGSVgtS1UlJIn1aNffR1RkviUC/2vXa1SHOJoJoIqjr5pvGozMKmWohclq3aJv46gdYt4OpoPtn38RT1YAcnRCVk12cu5yqbAEQA+GNMhXX5jGhiZ8tySv7NxyQVFy9LmQcnGio+fRm1SUVnN4zLgVqminEo9y8GemNugZEDLevfat6qYGwekxA3dmF1GJuRuNkvEfmpu2Dp34sy0eOxkqn//q2kDRBEOwPtc6588V9bdVCG9ntGpnT3B1nxTvAg60Xsj3F1HbqGLTqjLDBUJ/HvxDzmbWxxIUlZZVbCPtBBqs4luGvF9tALlkeBWO605SCyXDL8czChlFj3DjYw049L4ApP1fOMnaSL1mtCxR8CONEJny+IPl1jy/bbOwWXGNnHadOtwTUU6499Mxs1Tz8rY9hCsGJHYL1F4YGrCQ/N8JFdAUzqX/g2wGEFxsl4VdemCrJkDKmMqYTd6+Nqugug==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f2ba37-262d-4e72-108b-08d8644e2dff
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4960.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2020 08:03:42.0369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8zjac1jTe7R5u1v0wCaq1NLDrEAU5Fneo/nUTwUgukwvSXQMCfRXT5oO7n3dKgRqaKwIVCZ2fnV2KUmue7uWQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4255
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Changes in V2:
1. Combine patch1 and patch2 in V1 together, as patch1 is a part of autoloading
support for vop driver in patch2.

Add module autoloading support for vop and cosm driver, when the vop/cosm device
appears, the driver will be autoloaded.

Sherry Sun (2):
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

