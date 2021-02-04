Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2250F30FE17
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Feb 2021 21:23:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240052AbhBDUWc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Feb 2021 15:22:32 -0500
Received: from mail-eopbgr00058.outbound.protection.outlook.com ([40.107.0.58]:16259
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240038AbhBDUWZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Feb 2021 15:22:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wr9VtnR02dKxE2sJ1SdxVTXe37NO33EcdxCFpoDdTbFyKU7HR/nkfaiyQTVEo1Z4O+D5QnJz9Pj3P8/dvALglnBRh3EyKIT7twguEyX3Tat9gwzBDigLK4qWFNwQy5ew5h8a0w6Ijd1G9WLD5yXknqJEf1fhp/gmiLwGRgs2rf9A3Dxdpbs0ASTtUb1yu9j1JGH7CJuTZP77yppB87sAY1gw4NZ5i9EbpiyinbXOVq59IJ2EnUITH0Um7R+fz7TM3hexQ0aam2Ohm4yeS4/1NRVf9tvgOd/tjarutRP8Q/14+c2hrCCMnS49ZmzhUyroRgUvzaKGqGwqRP54AFdE0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGPU55OFfOf8CZBS79tMR5QGuIhZxAPUUAd31w1UbXU=;
 b=JeT59jeBOSGOoRhO0v5JzXxvVQ+rRs5NAbD3kNBLLvQa96rguVGEmVa46jDb+aoYA9WNlfeygI3uAHtWSOT2AVxiKjO7zMQWu62hhuocG7cx0T/pozhr69FwesH1NHL9QYRQxXi5ZGOKzgm3Nczsh69iAtwIdLBfgDBIuaQy8N64spdPuEPd/ba1mTlGvoLMSST0mK+BQpslroCp44ThykUJBdk3FJUGytnR0e6c7Blj83er6kJXqi3vNoKpuQEjqmr62oxNItQ+thaCAULMr0d12CvwvnlLok2hNjN79IZeSmvuRCMMdjiFRyZUJ5ZjC5uCEiQk2HMGCWKmx49u6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGPU55OFfOf8CZBS79tMR5QGuIhZxAPUUAd31w1UbXU=;
 b=3cmS1alU3zdeJAaf3WqEu22TKz6HVuRkHeZe2UMqKSSWzqaWxZuHtx5fwWe9By8UGirnHNC4E2iisegKBI3Yb1QjsynW1WFQSVO7vuuuMete602AlmwqgzrRsI5KPmxOnpeoJ4pcZEx5lEAgqsAylZeT0OQpXfocEbQGyGF0ysc=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=seco.com;
Received: from AM9PR03MB7251.eurprd03.prod.outlook.com (2603:10a6:20b:26e::16)
 by AM0PR03MB6132.eurprd03.prod.outlook.com (2603:10a6:20b:145::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Thu, 4 Feb
 2021 20:21:37 +0000
Received: from AM9PR03MB7251.eurprd03.prod.outlook.com
 ([fe80::a8f2:7dd:46e5:8526]) by AM9PR03MB7251.eurprd03.prod.outlook.com
 ([fe80::a8f2:7dd:46e5:8526%6]) with mapi id 15.20.3825.019; Thu, 4 Feb 2021
 20:21:37 +0000
From:   Sean Anderson <sean.anderson@seco.com>
To:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH] builddeb: Don't look for a missing Module.symvers
Date:   Thu,  4 Feb 2021 15:20:53 -0500
Message-Id: <20210204202054.1608664-1-sean.anderson@seco.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [50.195.82.171]
X-ClientProxiedBy: BL1PR13CA0328.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::33) To AM9PR03MB7251.eurprd03.prod.outlook.com
 (2603:10a6:20b:26e::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from plantagenet.inhand.com (50.195.82.171) by BL1PR13CA0328.namprd13.prod.outlook.com (2603:10b6:208:2c1::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.11 via Frontend Transport; Thu, 4 Feb 2021 20:21:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fe80c7b-43c3-46cd-5441-08d8c94a7903
X-MS-TrafficTypeDiagnostic: AM0PR03MB6132:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR03MB6132FDD5378CDF25EB344EF996B39@AM0PR03MB6132.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tgQbBnhUXfndfYTVgqs3yDS9/DRi+GnMYXmpLAx5QSeFgji18w8A+06upWYs+c1DYBEICGaY6gDNXFT4s2vBd63w70QVV0IE2tDJbqULAfLTFoXMKyHFdzMl87NBYdaGRw/So6fgltbATpQUSqMiXnBQSFcd70WaacM2w5bpr6UNw1GfBCsFssKWDUDpVTWW/bAmHzwqfZgK90iTH3EuQvO3uU+AwbHH31qttWaSXozKF55s74qFiVPA2jVIjkV/XwPEWBi8W/UcLndh1ePjkyVvvkRg3zJ8cFzftUX7o/twASLdNEFsRNJ9diMrjv61hhlTB8hE2fqGIuBqm0L66M5OqWna1QlzvlzdDiTLObSVOLPLbaV3OWX5NY2pgI2XG6WGtCRcQfbs6hkIGhyvRDB02QnCX88NQPVQwvzMD87mxpIS5PkEvRful5FXKOsAy1lX61vffmXrYwXfBoYlf8VA0slSLlpPQ3Ie5GyHUa9+RRTFxEQYFJmKUaAeN5y03JH+Tox3Cb6tZtwKOtiJPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB7251.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(136003)(396003)(39840400004)(346002)(16526019)(44832011)(54906003)(6486002)(5660300002)(2906002)(2616005)(1076003)(6506007)(316002)(956004)(36756003)(478600001)(26005)(4744005)(6666004)(86362001)(107886003)(66476007)(4326008)(83380400001)(186003)(52116002)(8676002)(8936002)(66556008)(6512007)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cmpBMEpzbDU4N1E4MlhxV1d2NUhDYkJRQnJtbWpSTVJENUNRK3NvSmEzdlM3?=
 =?utf-8?B?N1h4V0J2YS85U3YxUmlpdlhLbndXWmRXQks3VE9keGQyY0NRVndDczZhMlV1?=
 =?utf-8?B?RDRFaHJVSC9SQTJiSTdDQlVDTktZcVFUL3ZDYWJxaG9wZERRRFdQc1FwUEla?=
 =?utf-8?B?RitmaVI2TXFNQ1RCN2xBZy9YSGpjK2JGSU8rcGRlQXkybTl2eTBVc2xDVnVx?=
 =?utf-8?B?TDJuUndSMGxDL2dibUxwRXJpbDF1UHRDOEs5V3dFQTVYL2tkNDE4ZXE0QVc0?=
 =?utf-8?B?MlN3SDYyVkpmUUdZWWF6cEIwWFNiNzFHY21JdVYrMXRqbyt5dDdpYUZBaE5F?=
 =?utf-8?B?SkhMOVRvRXBOSHZFcWNPRUJLVEFpaWErM0hNOGt6SzFxVi9FU2lvQ3h2U3JH?=
 =?utf-8?B?bDdiSTI0MXlXc3p2WjQ4Y00yODl3azAySktvR3AyWVdUcXlyY251a0xQQ1pa?=
 =?utf-8?B?eWFYNjUzMmlJVVM2NzdhUzJ2cXNBZ2ZLSUJTWGVsQ2prSFZLaFVkNjNzeVp5?=
 =?utf-8?B?VDV2OGZXcTg5K25uSHByL0h4S2xacFZKeDEySmFpVmd3c2lnNkVJYzhaSzZv?=
 =?utf-8?B?Yk1lU3dZQjdRODlQR2FMSE1uVTRqbDFVZkpLL3hjRHRveExVdFM4b0d6dHZl?=
 =?utf-8?B?cDE0SkYydG5oRWcxM2IzUkcvSmlZNmwwdkNzQXo0bDljZGtKb0U3MnFUdStk?=
 =?utf-8?B?MXhUZ1BzaEpMTkkvVjRkZERta2IybHR5aE1tMG0zTk5yZFp5Y1hkUGsvelpq?=
 =?utf-8?B?QlI2bjBBS3A2czF4cURLSXI2OXFMRlhuMlJPa0w4SDkxOHY1Q012ZytLRmFB?=
 =?utf-8?B?UlVZd2RxWHpmMlVkK1FKM3kvNUorQkg1YkEvd1daU0c5WlU4ZjZUR09qWGpT?=
 =?utf-8?B?TVJJanpJNjRlR21XcXNpdCtLZmxydFFRMTNCNTVIK1M2Lys4TWxqN2xaYVRx?=
 =?utf-8?B?bnVDQVFYTUZET2svM3A0Tyt2UG9jdEhkbmp5U252NCthMldXRnljdzRhTXNa?=
 =?utf-8?B?Q2l3eWpiUUZvMjJqQVRNSjJrTEF6U3F1Q2dTcFdia25jYnFtcmprWEI4eUlF?=
 =?utf-8?B?MnY3U1pycm5sNHJKOTFvT3VBd2JFa0M5TzdWcHhYcTRwU2tFd01vMWc0WFlw?=
 =?utf-8?B?SEtqc3JJam90cm1rUWFOZU96V1Y4NlZsamI4VDlzRzlaRVgrcnNnVTRrNk1F?=
 =?utf-8?B?eS8yTGZadndVa0VOZEQ2N2lHMjFNS2txL2pZRTA0bm5yeXUxa2NsZzZDeTE1?=
 =?utf-8?B?VC9kQnpWSFVwL0F5YS8xcUk5RmNpUlFtNFcybFJyNFdVK0NTS251M1NmYzhK?=
 =?utf-8?B?TWpONi93R2xKeURXMjI5UzczelZVK0JtQ2VvSGF4N0pRZkxpSjRpMGVENFZ3?=
 =?utf-8?B?MmhSa0hqWWxVOEVwWHZJRWpDaG0xZ2dSWGJhditiQWZESUhraUFXVCtoZ3Jv?=
 =?utf-8?Q?2TYxbI8T?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fe80c7b-43c3-46cd-5441-08d8c94a7903
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7251.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 20:21:37.0109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tN6rxnyc9kIFh9GojQVKP1V7AXqZke+JRpIn/X80HI3XK74Q80tvL2sBCyjmk9fMcquNAD6ZXF43n+M1yuInwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6132
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

If deb-pkg is run with CONFIG_MODULES disabled, then make fails with

find: ‘Module.symvers’: No such file or directory
make[4]: *** [scripts/Makefile.package:87: intdeb-pkg] Error 1
make[3]: *** [Makefile:1523: intdeb-pkg] Error 2
make[2]: *** [debian/rules:9: binary-arch] Error 2

Only add it to headerobjfiles if we actually have modules.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

 scripts/package/builddeb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 91a502bb97e8..19d44704832b 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -71,7 +71,11 @@ deploy_kernel_headers () {
 			echo tools/objtool/objtool
 		fi
 
-		find arch/$SRCARCH/include Module.symvers include scripts -type f
+		if is_enabled CONFIG_MODULES; then
+			echo Module.symvers
+		fi
+
+		find arch/$SRCARCH/include include scripts -type f
 
 		if is_enabled CONFIG_GCC_PLUGINS; then
 			find scripts/gcc-plugins -name \*.so
-- 
2.25.1

