Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1C3E3C9BC8
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Jul 2021 11:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241155AbhGOJ3k (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Jul 2021 05:29:40 -0400
Received: from mail-bn7nam10on2055.outbound.protection.outlook.com ([40.107.92.55]:7937
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241126AbhGOJ3i (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Jul 2021 05:29:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YoaIWY6+DiE7sJQT7vGfboadSB8EJOpTB1AxsETPlncdnjIFeoa9zX15OfjzxSlDECcZGBKR8pOxWOAKP4CGVF+bwg+oLjXhllaDH5mo2Gkd3TJUzW0qoIffjh79cdvcrancOltVVOKn2N9JgeaoknbmP0F1BW0BYDjAJvujox90QK6jRmRtW+sSuLdubI9rETxeONCpAIyppG5D4CDDuQrL5ksdo6mrIzv+LRq3aAmoqP7MNgoiDduzWt9Q6biaiCjg6Q0yCjpxXY6KhVdUS5AtkAFU+FQJ1tTXgSMP7aCqCKFdeIeo7GlWvppWTCHkoFyGE4CUoznVyH9LL5Qi6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0XZRass8LKPPFk+z7BJsvP7k1o9KJ0LMmOsqDx6Vok=;
 b=fmG2+OtRF1WaNo81RT1deGwuZWerqhzsRHcZLNtJN98VH4813f7a3iPCJGKDc1hb/mc4QAi+uYHyZR203+JANSBT2ID6hglcX/3/DEVf5uXTwZ/rrqcCOteG7rWNS2tcyIOk+I5TuA3KNI7Tyt5sc7JYZcR0xiqoVAPBnFJvRJokTvhp7L0gL+KfpVZ7kSmJZbTp0yCZovedth4P8VpalzWHN2zTBt/c6xol0TsRzwnMfhlMvJYaYFu9qzjdPhC69xj5iN3FopbnawCpsnRfe3JdusO3IQdaUWRvEVIMJQNyPZcfq6wjAMVWbWF5DShmEtQ4z35z+MXDlA49GMid7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0XZRass8LKPPFk+z7BJsvP7k1o9KJ0LMmOsqDx6Vok=;
 b=bHQNxrVUcQXfDMZm60J/zKpMQ+Z+gxVrmVn4FBGbb3Eir7mRx5pKSi+ieqEBSGCrFWIUeQflwzrCNj+tpeTOJS95zQlhFzIDPsBSzMxkyo+U0Y1i1jvOxax0tA9ygS9ly6fRuvTxJQUOE6sLnyGeq42+61x1bQcq4eQyaG5z0mE=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3657.namprd12.prod.outlook.com (2603:10b6:5:149::18)
 by DM5PR12MB2568.namprd12.prod.outlook.com (2603:10b6:4:b5::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Thu, 15 Jul
 2021 09:26:42 +0000
Received: from DM6PR12MB3657.namprd12.prod.outlook.com
 ([fe80::9178:207b:3b1b:fdf9]) by DM6PR12MB3657.namprd12.prod.outlook.com
 ([fe80::9178:207b:3b1b:fdf9%6]) with mapi id 15.20.4308.027; Thu, 15 Jul 2021
 09:26:42 +0000
From:   Robert Richter <rrichter@amd.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Robert Richter <rrichter@amd.com>, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation/kbuild: Document the kconfig choice default value
Date:   Thu, 15 Jul 2021 11:26:03 +0200
Message-Id: <49b4c2512afba7a2c2ee39e10f14188ecfcdffc0.1626262835.git.rrichter@amd.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <ad9c50c54887bde41ae5de782248231c06a527c0.1626262835.git.rrichter@amd.com>
References: <ad9c50c54887bde41ae5de782248231c06a527c0.1626262835.git.rrichter@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6PR08CA0030.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::18) To DM6PR12MB3657.namprd12.prod.outlook.com
 (2603:10b6:5:149::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from rric.localdomain (77.11.111.27) by AM6PR08CA0030.eurprd08.prod.outlook.com (2603:10a6:20b:c0::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 09:26:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fb00ed6-6403-4413-c401-08d94772a80e
X-MS-TrafficTypeDiagnostic: DM5PR12MB2568:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB2568885A35108BDCFA639B579C129@DM5PR12MB2568.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jH+5M9k3JbR46zTzyH4uqOWWs2iFpRtlXqhAZd1iwx1ZPd1KqtKeML8w9Oej7NSHrtnZxs09gsgar30q21BlkROnm8n5EDzwxgLKCRCQmGL2T3368pFfimp+afQluol+MHs7z3Cg/FF3wGi1jag/rL1qSTb5TmBn51TfvlbmdJcHRYFybgZDfqjOTNcCXImpezM2FkCMavGNyaw0sKyMImONSI6r17bM/yITzDV7GjOoPatJsbcTr+Lw+ntr+QcKlnccCivX9Gr/yRSNaJtxvJw3hhumDuFy1WiiBEDEZsVSiR+SJ2SaPGWSlS7kjwHcX77EGzD7Y6Wj03AuC89ffjt40bmHVWU5R7kYotK9R1WJF7yJPWW7ZtEngJO6uM3jYvRK0Gg3XCU+n9qBgKsmhtPRAfxmc9LnxzDl4ecQ2CLpttjC+yCFmUF6a6Lyt5KSrVNYviITVm+udIsWiFLrYhxkUxT2ZWPXKGGE6LyvoSePNBZ2ZiqubEJtCEzape9NyFVjYgsdJ+uCkS4slH50BHUtX/McEtevCt+lZrExivIEkol9joDdVNdUvpnLYQzfWlZk76DvR47jRzdE6QoMuNRVE9bJHWyxVBYFkt4bBnx9ls7VipsdV/xPloIhKyMYT//lJpNjmaE2jcsXrv33+gwgMQRTXK/O+uL+TjF3M6x7ZaSss5niuzFt+GnJO6VWHCvPTOiuY8yoFgIokBkEM89BOAE/08PZx+AMvbJACif0Xv9paiyRwR72B0MTOUfOl9LrL8a4idHAH4mfxlfT3G4TT1mWmAfRueWYKVnfgdzvP481JYYV/f+6LYuxgyKl
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3657.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(366004)(39860400002)(376002)(5660300002)(478600001)(966005)(6506007)(66476007)(6512007)(66556008)(4326008)(52116002)(2616005)(66946007)(2906002)(26005)(38350700002)(38100700002)(8676002)(186003)(36756003)(316002)(8936002)(6486002)(956004)(110136005)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YDXMcX+hmw1VPPKRmZUQisrsUezbzSOINZSoYiIS4+fndn9n2oPtjiqJikn0?=
 =?us-ascii?Q?sQFcNbym/F5FGCCsTqo72bSnHn5aaHPDX94WqfFG9m0xmfU6AcnjXlDCq4lZ?=
 =?us-ascii?Q?tYKhM9kwhL+LIa73daI775Tdk4TF/puOOteYXen7g02TjTu2JCjyy1AGi0kH?=
 =?us-ascii?Q?4fzaIMnkI8OiRqzoIsvr+/swbqkZohC/izjIWud4fvflrKWBPXSe+py/7AOh?=
 =?us-ascii?Q?sQO7EVLU5j+geuWUunYzMAbcZNHzvMi1c0CmgR9ywzL8j+DDoSdTVFc9te/0?=
 =?us-ascii?Q?CnVoje5yK3LOz1XRyDwgmU+a2Y+KiqJ1pcZjcVetrrZYBitm+hoI2xJcYfb5?=
 =?us-ascii?Q?fw+T5iVBNYvMNysirP5xhbYobOzfUWOQ1nbLflzVIa8FDWDdbcLG58naXdL1?=
 =?us-ascii?Q?sNBaW3BbNrX3BbcXQesIZOz2xCzPwgFsIIaHF37tTCyrIDHJxOG905kPogqw?=
 =?us-ascii?Q?LQvPanziwoLRsEfa7N8hpGbIV1FTap7tnAwHonMwXZ9gmAWXbCJQYdFAULyv?=
 =?us-ascii?Q?lN2U79qFKHwsU0EO7FJ6TIriVRQ6kpoPuG0Tb3r07j73HrdapDjS3I9Gof9j?=
 =?us-ascii?Q?D/uMcA1vKLuR+OtxhIIVTn+AOjNAd6dNQM7yRzdILZnI9V5GE+OjdFL7GL2U?=
 =?us-ascii?Q?r8TzIoh0B28mIFlJpwUBXqymadY5leasKTSRF3dwj8GraGZUE4WZN4c4TGae?=
 =?us-ascii?Q?PHU8NB+qUDVGQlXenT5qKDDSAeY6ZkvOXE71WDOaIjx0uvlMT8yNiVkh/Us5?=
 =?us-ascii?Q?66MhxWHByLc13hVvh7tAtpgDKM05X+dznmgGP0Bilpoj4efprM4zemjr8h1P?=
 =?us-ascii?Q?5Q4OpPc9DlPMz1LXWviLJiwj6nWImXeZVQcB8ILRLtwnvmVfPz2W2dD9BzPa?=
 =?us-ascii?Q?QF9HnwqngSJBlstc0eQcYAvMcXN4fB4MVQkP+XnUKBwpsqukjZ8JgISu/M8f?=
 =?us-ascii?Q?aOV7tYDRjv7IUvd8n3i9DeoASBuC3kkS+h+Lr+PA7zzxqnl2W5qxRevYJ5Fz?=
 =?us-ascii?Q?vJuBbpUMK++7xLR3VPh+aGyAcJ2zbYNPb2EsYw5Kw55Dr2cOzcr5lA+9wgZ7?=
 =?us-ascii?Q?OuVCTx1Jt7nb09A6k3bcl1k77uKAN2ejXP2aOMdiG/59Em4xn+GUQGw16DQb?=
 =?us-ascii?Q?BSUsFQ27cmxszURMdetXa+Ev1LZobYuGgh1sinbyfMARrubGCCShzBYA71UK?=
 =?us-ascii?Q?IRh82kJdtiIk6dQo5950qLhbaaerHsUHtiJ5lnQt4Tve2VNdn12zgsJ88L3N?=
 =?us-ascii?Q?Kwh6HPQBrcEutsbmUOIxGkvgUQOjLW4KxMKjIdFYEG5r/bUMcIUxXHvEJimQ?=
 =?us-ascii?Q?L++d3Qy41HVd0KOPmrgutu9X?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb00ed6-6403-4413-c401-08d94772a80e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3657.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 09:26:42.3748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oZhoao5CHj1MygE2XWcFr+D3sWmUrolMrHI98BfzCkeya5ZT4RWIs7XLYwywiWYQv4xXpgY6nReqU/JM3F90FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2568
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Document how choice defaults are determined:

Default of a choice is its first visible choice element [1]. Choice
elements do not support default attributes. [2]

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/kconfig/symbol.c?h=v5.14-rc1#n245
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/kconfig/menu.c?h=v5.14-rc1#n494

Signed-off-by: Robert Richter <rrichter@amd.com>
---
 Documentation/kbuild/kconfig-language.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index 98c24183d8c3..e4d3463594e1 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -417,6 +417,9 @@ definitions of that choice. If a [symbol] is associated to the choice,
 then you may define the same choice (i.e. with the same entries) in another
 place.
 
+The default value of a choice is set to the first visible choice element.
+Choice elements do not support the default attribute like menu entries do.
+
 comment::
 
 	"comment" <prompt>
-- 
2.29.2

