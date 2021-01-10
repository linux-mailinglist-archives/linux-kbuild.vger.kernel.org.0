Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0E22F0949
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Jan 2021 20:09:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbhAJTJG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 10 Jan 2021 14:09:06 -0500
Received: from mail-eopbgr760073.outbound.protection.outlook.com ([40.107.76.73]:16772
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726267AbhAJTJF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 10 Jan 2021 14:09:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HxdkSrGS0zgVNscors/Cs/S9zzCcIyzmbvCIIhFgVVduDDeMN2fEN2qp7F/9119mm+uOBnrNLFWNsvtb5NYpPK2joO1tQ7/d2X21ajUQb/el/s/07VvHfoy0/re8blK+5dK/G8DNvBNuN8dxy1XSDPAxi+2igepI6u+hGgunMX/S6mVkn7ifSu4fa2eFYCJEPxT//zx3L3caIgw09d5Q5fWZNwQLIJYhRvAA6OBUMceMARCLT4Aw8OvCjEZCIzeMQyQ5wzrG2zPeFRTMMtlAoMfWYuHg5bmZQBy/sBzBOS4Z77E41ecfguOMuHjQQbTcrwV4gKttTqI0oGG3UFrtHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0mcHViaGUoM4fhvPIYQJti5KcJtJsflLOYgjCAHaw0=;
 b=Pd4nWinsWyvN1EhYd0ldf2cr8K91GxZMwDn9XG9FhcQy9NgY/h6IiWyj6veMslQxDf885lMvEA4CMzVcJS4aIuqpSZYm9jVEWDj5o8FDWoyrrXdMx5MJkv2iZgH/I70O+F+Pg89IHq9T6cQ6xu+FotLoKW3eGU6XBeAcK1bSxblIb2SBQLhxysE/D+eK94Fp0sTNkpGd0ib1227CZ6Lmmfbkzz+Oh0yHOgqZHwChPaTOTxj2rPrJmYRy/EESXmMqcZCh+U2e/5V2mRtX89sCyWmuGzQ5z++Cyqp4ZCXnvW3/POrFTLWirZAwXao8u14F/d2AI6rR+UcIQYK3P+orpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g0mcHViaGUoM4fhvPIYQJti5KcJtJsflLOYgjCAHaw0=;
 b=jEbkNEQnhbryDIc5KbUR4jijc32NCRhZZv+1ZW+ItuKXAal60ylCbkKUh2uVNdiOXIU8iT+7rwMe7/bD6S+ZzqEBGtwIJQX71Y4uyY8V4Wu+UvQJdUee9MMPj/sY19EsgGziqpZa6+BDzGdEJNo/OEB5jV70+aB+sSsS3OWfw7A=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB4545.namprd11.prod.outlook.com (2603:10b6:5:2ae::14)
 by DM6PR11MB4491.namprd11.prod.outlook.com (2603:10b6:5:204::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sun, 10 Jan
 2021 19:08:23 +0000
Received: from DM6PR11MB4545.namprd11.prod.outlook.com
 ([fe80::87:8baa:7135:501d]) by DM6PR11MB4545.namprd11.prod.outlook.com
 ([fe80::87:8baa:7135:501d%6]) with mapi id 15.20.3742.012; Sun, 10 Jan 2021
 19:08:23 +0000
From:   Paul Gortmaker <paul.gortmaker@windriver.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Gortmaker <paul.gortmaker@windriver.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Will Deacon <will@kernel.org>
Subject: [PATCH] kbuild: partial revert of "remove cc-option test of -Werror=date-time"
Date:   Sun, 10 Jan 2021 14:08:07 -0500
Message-Id: <20210110190807.134996-1-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YTXPR0101CA0046.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::23) To DM6PR11MB4545.namprd11.prod.outlook.com
 (2603:10b6:5:2ae::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from sc2600cp.corp.ad.wrs.com (128.224.252.2) by YTXPR0101CA0046.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Sun, 10 Jan 2021 19:08:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5709ffa-b1de-4235-50de-08d8b59b19de
X-MS-TrafficTypeDiagnostic: DM6PR11MB4491:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR11MB449167261F926B353E17825D83AC0@DM6PR11MB4491.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /UDYyldvvTwTYxRK/9vFb4scgpAmFnmN2FMy3Ig220TDB4WsThi7pFqoIlYSwWirxgvO94VDH1O6waG7ANEZtPpdchPurfD+C16uiCAztM602Ym9YV6/l0j0o/dzPToU2W/BTGQ2ziz2mqi5rQJmWYfOWYg2GfdzuoA8THWffc0q2KSqJBHdo9azTTw+V6DzS4dsdidL/aX1r+DfHYCYyq4+gf0Ru82x2Lm9z5tbwHNoUVIT/v77gu+lgadqTXMPa3nIg+9sehiZmc/KJEWrQvxmv+eck0B5v0rheBY1QnMOvQ3l9s38odR1EJFl7NFsyTiT/CST1zXUTnVQf5QvsOkFVxoZUem/bUn//7R8/UAGWCQPwYFHH1QE6OWamOxoIGM4OT9WN+/aSFzHj0nAOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4545.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39840400004)(136003)(366004)(66946007)(52116002)(54906003)(1076003)(110136005)(5660300002)(316002)(956004)(36756003)(44832011)(16526019)(66556008)(66476007)(2616005)(26005)(478600001)(6486002)(8936002)(83380400001)(2906002)(8676002)(186003)(86362001)(6512007)(6666004)(4326008)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?UZwP1aWunGRZQOWmr9HJBtTNUKHke4O8+AcpsO3aAUx8ZVMtLQ29se6eQRNa?=
 =?us-ascii?Q?SklTlkbQVoEmZyTyZBNIaUb9mpYAg1lmF3SrPjfmcGXjI+R+CHcyDfhOT3Zr?=
 =?us-ascii?Q?o2ZAvzI/DpOByIlxNs0sd5NRZj5SqJwby7iYp4o7RX+utj3Vl0E+JF+S8TpU?=
 =?us-ascii?Q?Un1MwDisGesAeLSz9bjpDs55QiAUnfwEfB76mauNHuT+YbVGppK8nan8gca1?=
 =?us-ascii?Q?JKB4prU7IJCYPPgVBryMlsilt2VrHsIErTSAVuf6UlGml64LB2CUoUVqPlA5?=
 =?us-ascii?Q?wBFH/6KUz7D3okHOORF1az9yWUuJPtQnoH+4o7iTYxhB1l8l42PFeqKwwBoz?=
 =?us-ascii?Q?qZ7VfkELkOBGxyIlhMMUF/jdM29SN8RVl+BrDgJr74b29BvroPvVm8A6p2pw?=
 =?us-ascii?Q?IuXGhj1VmxuiJlnjiywtavfzsUcJMQ6UzhSDjwO7QRi52TibNotVrTejvviw?=
 =?us-ascii?Q?Z7NMMJnLx+8gL9/n0KYzAIay5jtuIc26liTlzb8TsRjDO4d6p8FSmZ9t9Znt?=
 =?us-ascii?Q?W9Q7dWQI+5TLhKHGAg3TfF6vnA/JSugkDbOTO0xwv/5K/46l84Ir6gQE5vso?=
 =?us-ascii?Q?3dF02iuJUG/v7VLbbN+i//t0u7Tn4D1ApYxjTPplK2xH8ZVl9odhvfvF5bwc?=
 =?us-ascii?Q?tddDVZPQX423Z5k7RJSpfavO/u0jM8Jh3H2fPKhwWEnb5YsmNMyJjCGlHLWx?=
 =?us-ascii?Q?PIAdE8TuEfJn0vDJuxTPvcRc35++kuegsssMo+/l+IaCD//nHIgbN/vBZqM3?=
 =?us-ascii?Q?0KCG9FufeTUWpMHWM4Z09zzMnQ+RE4T5p2ztBR23xegEdCk/bl5fQ9IqTrj5?=
 =?us-ascii?Q?2p5G3PMkyuczaeMJLQjrJ7B2mPcthyPVIPXhOIgD4kFcTPNUIhvFTP60kAV1?=
 =?us-ascii?Q?YdE0KFOk7ryB2uqHMm0bm7lSvmAgqHv2sXx65e2qqHZMPcM80RxCJPpb97K1?=
 =?us-ascii?Q?mGiwlZrt2bzB756mWZ2zmiwevjBekik0adVt0/McjdIwAuEhkVgMZFg2MvUs?=
 =?us-ascii?Q?X21H?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4545.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2021 19:08:23.0268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: c5709ffa-b1de-4235-50de-08d8b59b19de
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qcgRnyoqLaiPBbBTMoMTBFMPriJ4cHT775GGWj+vqAca2DG79EV8e9yOaRFHdif2RAavYUATdFwRGAWdBv+5Qmpn1/HHvLcA1HS7I457Yu0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4491
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

In commit 87de84c9140e1ccb221c68bb7e4939e880b3f2bb ("kbuild: remove
cc-option test of -Werror=date-time") the check for support of the
date-time option was removed.

However, by removing it from the top level Makefile, it breaks all
the normal compiler version checks, because GCC fails at the command
line parsing, and never gets to the CPP #error check in the headers.

So for gcc-4.8 (now unsupported) you get the confusing:

   cc1: error: -Werror=date-time: no option -Wdate-time

instead of the previous and expected error message of:

   # error Sorry, your version of GCC is too old - please use 4.9 or newer.

Restore the check in the top level Makefile so the longstanding GCC
arch independent version check works again for v4.8 and older.

Fixes: 87de84c9140e ("kbuild: remove cc-option test of -Werror=date-time")
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <natechancellor@gmail.com>
Cc: Will Deacon <will@kernel.org>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index e30cf02da8b8..e2f9e6582a10 100644
--- a/Makefile
+++ b/Makefile
@@ -937,7 +937,7 @@ KBUILD_CFLAGS  += -fno-stack-check
 KBUILD_CFLAGS   += $(call cc-option,-fconserve-stack)
 
 # Prohibit date/time macros, which would make the build non-deterministic
-KBUILD_CFLAGS   += -Werror=date-time
+KBUILD_CFLAGS   += $(call cc-option,-Werror=date-time)
 
 # enforce correct pointer usage
 KBUILD_CFLAGS   += $(call cc-option,-Werror=incompatible-pointer-types)
-- 
2.17.1

