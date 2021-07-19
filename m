Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 402DD3CEFD6
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jul 2021 01:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237932AbhGSWrJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Jul 2021 18:47:09 -0400
Received: from mail-co1nam11on2075.outbound.protection.outlook.com ([40.107.220.75]:17377
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1352155AbhGSTtk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Jul 2021 15:49:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XZZ95be/GwpBGTPmHuXJTbtUAWk44VqBnT0s0VLY721jnwLfda22E84cA4D/yIFqpZMxUycbP5JtoeygsFUMUDIL9uMTyLv0yR4iUYZQp3MUhmOVBhX1rnWBlfbexIhcle24A6OvAkEB/K44aJ43PziH4dJYlAcebULJBsRfiFs/xQ3kZQUFQHHmLU540psMWxcf3gdLpVvsWLkhVmlpdcpwg9JMtHQguVwrUSD3ebjDBeEnDNwb8k4+EAq8ePLeigqieuQzYVYp8J3r4aOLkqZWxoapWaPqsi5w0hbTWmjuo4+hFehz7vWxaQpifAAcv/QaC16cpfh9uwPfo7c3tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQdVEjSjFIOiTOQcjk3YGb2GzcHS5NwipC2SUNx3INg=;
 b=dCPdHhP1xVqj69e55SJ4gMX0qklgQ+F9uLrC3y35avig/JdbeDGcIkMe7ivTJp9Y+Iwkr1VFBEfis9n3k+mLhkMtiJ+2kDTQgeix/FPBgXjMp56XXOFnKDswhCccXKMDRHKMtfzuk4JXypaVPDNa3FOFbc3t1QAU/ymsmUaWO24Ybq9Ra8hDpqK2qYlcedt+Ye741/eyBej/RcM0lY/N/sBBwR+MRIZA2XcDA1P30wBu/UkhjanDebmC6AXe/HcYSNo9OpAG4PYo7tdPH2Us4PBSCbV2r6qtGd6/sJWvOu1kElQGI0XDDyTSgT9TGY9qgfb80tR99/d4LhCCFs8GYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQdVEjSjFIOiTOQcjk3YGb2GzcHS5NwipC2SUNx3INg=;
 b=wjAS2b4/JkpSIzyHK4Lyt1YfdEhfulDn4jJZeu+FWrKG+WMqcA+1VrWBB9olBfCn7FHdLoq3rH1SDSM9WKsDtzeV+iCscs92HolxNa/PN9Z0ozdHu0x4x8y71ndWz0nFkqwVe4zJK8mY9hOUjXfWeCLaBk+/Q6imkXWkUa2DnKQ=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3657.namprd12.prod.outlook.com (2603:10b6:5:149::18)
 by DM6PR12MB4986.namprd12.prod.outlook.com (2603:10b6:5:16f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.25; Mon, 19 Jul
 2021 20:29:55 +0000
Received: from DM6PR12MB3657.namprd12.prod.outlook.com
 ([fe80::9178:207b:3b1b:fdf9]) by DM6PR12MB3657.namprd12.prod.outlook.com
 ([fe80::9178:207b:3b1b:fdf9%6]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 20:29:55 +0000
From:   Robert Richter <rrichter@amd.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Robert Richter <rrichter@amd.com>, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] Documentation/kbuild: Document the kconfig choice default value
Date:   Mon, 19 Jul 2021 22:28:44 +0200
Message-Id: <20210719202844.18281-1-rrichter@amd.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <YPXeqUV+22sxXS9y@rric.localdomain>
References: <YPXeqUV+22sxXS9y@rric.localdomain>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8PR04CA0055.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::30) To DM6PR12MB3657.namprd12.prod.outlook.com
 (2603:10b6:5:149::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from rric.localdomain (89.12.10.153) by AS8PR04CA0055.eurprd04.prod.outlook.com (2603:10a6:20b:312::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 20:29:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c931c151-5254-4215-7d52-08d94af3f874
X-MS-TrafficTypeDiagnostic: DM6PR12MB4986:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB49864C4F9208853D162DFEB09CE19@DM6PR12MB4986.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CeL8Lo1+OTwaZ6z9NL/QV+vUBjoawTU68eBz+fJHwnnLaVNmSeq8sUdIc7VS0Q5C7wPH0t3itjvVfFEMwQVXPoLbf1bZKGvZMt0ZjL/mmes+k/r+gThMI0FzrCZcgIz/qUuvYtGgloOkpytXbJf+rCAwMRePSGnE2ur17S4BkvXjb9bK7y2VgwVth1hLsVbGa6yCp5eikDEqhCGMMybwynl1S4NhY8anBdgraMHwYCcbF3dXqCfrn5rNlcqj5QF92POpTDS0m9AuyJWEe8hR1nO39eqh2Mq3jKdweRetXAyS+lS+Ay27PCn6UQ1vEqhK259u46cftb1N0QkAM+VmvGULCTzjk5pC0cCglptuUozUnA7esH1MpYj+tCYMn5x4Z/uVlKXZQJ2Fya630BS6Xv3yLyvCjGxohSo+iCncdjWa1w/d2PY5wwSA6+GoFFJcM+gj0XGYP3n0rNWDkatvJqaxN1i8FZt4ToaRk7YAwKYAwxtxM1qEvrimj6u0W/jW57swsLMe78BxjFmoV7f6x/XDKoMbiiTGXjLnvRO1rLaGYgfavLukJkYvV0yb+ia3cSUUyw6dqihN7fLiBRTtWE/Dvxx129+me+NKYR8bWCi8oeTiE7+B/k7Z216gqCyQlnxjYFOxWP1G6U4BYY8iLYW9la8fVNPZj/06BGDeSJ5I9QZKh6W2Okg9AmowCK9K4460kBlbJH05gn7BVRplEmzSYJ2DhF49rSONu19x8TGTJODk03dpZQxR8iX5+mTCbIY01j9rrOXzlFHk1vftZ+iOST63nSSnQhIW7xDJS4CCIE0awlw3+w0q44u45vbpNDGQMTQ7/9yqgJ0adMLd9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3657.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(366004)(39860400002)(376002)(26005)(316002)(1076003)(478600001)(110136005)(6512007)(6666004)(8936002)(186003)(38100700002)(38350700002)(956004)(5660300002)(52116002)(4326008)(66946007)(8676002)(966005)(36756003)(2906002)(2616005)(6486002)(66556008)(66476007)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YyNMR8dPt6f+fcxijG5sDfyKAuvWWCdfzOAHIwMU7DbJRzQF/LDIguB1f5ab?=
 =?us-ascii?Q?hyXEILz4wkgoLu/dXF3CVl8obZzjEYNH3WPAGKCN3VfHmiNHAcSiTAttvST0?=
 =?us-ascii?Q?IZUufqQ9jUV3Yngxx4vEjepvEgaEPSKQ4mVl0LSeeEwbS6gMlKTXIFFd9O79?=
 =?us-ascii?Q?78bo1LXhKrtnf2h/YI6+kvHz40A582uRtE22MZfzecPRu+CgAYEBl/ZZunS7?=
 =?us-ascii?Q?RwpRhUB528U45aNXzzFueTXXUiGldmHs3MLaJSSRIh6EGOH9l6lpRppPq9Tu?=
 =?us-ascii?Q?nnJqBLghdlwm/Lq0lZLrfN+zvxEsCC6fFdkndwl5pAsAGAT/xP0vVygNRXjf?=
 =?us-ascii?Q?SHxhsBmqnVg5Q5FkXFEgQyiNl7yvLmXEHV0lDgKkxcFIEvL69dzwBaQmlGUk?=
 =?us-ascii?Q?NMyQcr69Mu3PUq6a1HbQnbwLpK7vU/Fq2vzzYAqyCatp7vL/8439AAyKScND?=
 =?us-ascii?Q?9f6k2PpZfI7cC2u263kLbL9h9niDNjEpwPBXwiKIF6RHLCtmYxp2PgO0C4Ki?=
 =?us-ascii?Q?tW74nCfg3qgpzDXM7wIwoSwdn+rneWVdg3YaM/OgsRJNgXUph6pVgDYKvEdB?=
 =?us-ascii?Q?gSEM2meHWwY44sVHFjYMhY+HYOJbTqHWyB55GhOwuNgLVOwP5T2cX96gv95T?=
 =?us-ascii?Q?VrLNmo3PiR40bfJy72UmqmQVsxsgJQvxZb96TyrX4FB0HYskbWfUQAZqK9Rr?=
 =?us-ascii?Q?eEsnzQ+AZygzkpLI393v7g1nOc5ScjgOpZOdHNGAmFs4P71TBPR9ZzDEsO94?=
 =?us-ascii?Q?yqFs/DbAkmksFtAhzD8acBLpcID82Ro0psiOavnRjOcL4HaZlO6JZcnRQo3g?=
 =?us-ascii?Q?e5DLjnJyvuPFt2dnNkPcWCPlMI5kX1PHc+OZjaOnqOPIiNwAliMM6dBO3ZdU?=
 =?us-ascii?Q?0Cgbv37Xy6JmDhy8cofhsBFMMasONxX81Pne5rIM9zJVT5/mRgt0sloU2J4y?=
 =?us-ascii?Q?MmH4A7r1tRqduAv8qXiOj7ZTpPPCgGDxkWyV7UkAgGFVhqmF2QM7ipFpLGot?=
 =?us-ascii?Q?dJvTxQcVQOSD/qkkTUlTV77z+ZBvPg0O6gmJOFFN8FCcvNjvhfColRji+gJY?=
 =?us-ascii?Q?RmQTbZ38J1irfIp7dp7oao976QyreKKR9pCthfJH2ltEThb8daXasTWz86Zo?=
 =?us-ascii?Q?LVYyvfsVDSbuVSs1nYsD6KID863z1pbCRzkhHScC5QAWu2u+zV1Un8ZvaHKn?=
 =?us-ascii?Q?kPaw9Awep64WLt2bOO3GUMYZOou0vbsR/FXhnA65fP+5sW3gpzqPAPwQ8tb8?=
 =?us-ascii?Q?ZQ8AmC3ABwIo3kBgnX+ZHWHpAAfZBm1AbTiZeDKaaGtO8dA94pK2beHqHpqz?=
 =?us-ascii?Q?XKvrcVTu/ohbl2XAr7QkPPzq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c931c151-5254-4215-7d52-08d94af3f874
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3657.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 20:29:55.7097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DPL7duXbB0phi8cv0hXc0onN2y17KJVsELKI3L6f5626jTkdRlWsCLdyLV2ATld4PHDM/EIbHtTak9QA562J2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4986
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Document how choice defaults are determined:

Default of a choice is its first visible choice element unless it is
explicitly set by the 'default' property [1]. Choice elements do not
support default attributes. [2]

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/kconfig/symbol.c?h=v5.14-rc1#n245
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/kconfig/menu.c?h=v5.14-rc1#n494

Signed-off-by: Robert Richter <rrichter@amd.com>
---
v3: Fix base of v2 (rebased onto v5.14-rc2)
v2: clarification on 'default' attribute of a choice
    added example
---
 Documentation/kbuild/kconfig-language.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index 98c24183d8c3..d919dde0bcbf 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -417,6 +417,21 @@ definitions of that choice. If a [symbol] is associated to the choice,
 then you may define the same choice (i.e. with the same entries) in another
 place.
 
+The default value of a choice is set to the first visible choice
+element unless it is explicitly set by the 'default' property.
+
+Note:
+	Choice options do not support the 'default' attribute.
+
+E.g.::
+
+  choice
+	default C1
+  config C0
+  config C1
+	# no default attribute here
+  endchoice
+
 comment::
 
 	"comment" <prompt>
-- 
2.29.2

