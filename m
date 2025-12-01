Return-Path: <linux-kbuild+bounces-9924-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE8AC982FA
	for <lists+linux-kbuild@lfdr.de>; Mon, 01 Dec 2025 17:10:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 94CFB34541E
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Dec 2025 16:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE9DC334C04;
	Mon,  1 Dec 2025 16:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b="To8BwmS+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from GVAP278CU002.outbound.protection.outlook.com (mail-switzerlandwestazon11020123.outbound.protection.outlook.com [52.101.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE997334366;
	Mon,  1 Dec 2025 16:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.188.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764605283; cv=fail; b=KrpaBO0Ah5DYwqTbjjakS25iDmKMuc6IpKzsuJOkLiDbEl/5cNx4zqEc1vOdKLo3TverXyimxNySD0LUkUwlakRbF9SpAHBr+pJYrOZLeflxzpXoORDBakpywEnrjovXeMPbd6kKDqoz0yuT4mP3JpSarPWf9n4pNTCNYzU6Yq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764605283; c=relaxed/simple;
	bh=w6PbSQ0y0wcfDzC7pKQbfobdhubN7be7l4xb8VhGSSA=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Jr+z5ZeuuBHBwOBF0yKV1zuqEZYbZSW0NmXMLFmtYpKFSzaBHlJAL9R+V+XTk4iwOC97f8B4WZxND5OYBMkC0TprGZkKMPPpeFFifEh3IT+MzZXgXpvXr6ZoNYta0fMix1XwfCGtmhFNjv93W2LFf74+nW6XIAPWpDXEBClMNYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com; spf=pass smtp.mailfrom=duagon.com; dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b=To8BwmS+; arc=fail smtp.client-ip=52.101.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duagon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hGxKw+MTzJaILgHWKNoGcxvMnB/qk8RiCSokX/OSwp6NDBMVHj37b5RQWpKP+gMOKBZDTrcSpw/5LJY/8iBO1AUMbP2wnyOLiA5obIhB8bC0+RPLgTLcbJRPKWLhNhhlE34+B1HQccbpxnVCO3HoujKG9WCrGnWD2YLqygbGvJklbWj5kJAliv4otwwykeIJKvuQNetilDwa4CTFcwac0GCpGtnDTrMRxc0/zoUPTs7Z5hk/M+2Z4ZueixQeNv6OP+/eptPu02PA2YGgGGE3WSrHD6gJ2IlMytzS2X4VxG/PVlODgnKm+YI0XgmxRFBRoKKaa6mnVXGCV98RaCYSbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JDzL58QMckkQZv55HNM211WWWpovCJ0mPXrUqGs62g=;
 b=xfqi3NI2ZcvYcxhmiCBP3S/5cseA5iuX6fNGqmBBxlNcdvx7mSV6HQ5m5as4qO6z83iYGgL70TYv3EXIL4J+nw48m/Mz7tB7PUu9I+1WTVWI2S45W/kaxZONgzE1S+1bG2iMVT545m/496OtQRWGBXC0LavGCi1dNZ00FC1BZNoBZGCNESnqtP0ssXOxEqkzVKyoNbvxgClnIgHY3/vqjd2TazMVLA4AZjx4HXTnEZF+9d39PWn2npVPj2ti4PuM5cWaoN2oqpyAOxaZWLiTiYCCN+ugTHW839WhK8wUpoe20IxdhaBcR6fdN9xs+8eHbTptRMNpBhvuOnEh9N7JCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.86.6) smtp.rcpttodomain=chromium.org smtp.mailfrom=duagon.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=duagon.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JDzL58QMckkQZv55HNM211WWWpovCJ0mPXrUqGs62g=;
 b=To8BwmS+u6I+uUw0ZV22hLOygmEHzVyL4kxe4vo6uym2bqdZhNTwsKUnjfuMKAX+xyiZ9xUM2Gm67PM9zZNWdTB765nX/u2V18umNFOpYC6AI10GCUZ5ExtbOds0BZUbUcCiGZ6q+J4vF0FeQYhnKDyJyRVDEs8wZ91IG8thMyU=
Received: from AM4PR0302CA0012.eurprd03.prod.outlook.com (2603:10a6:205:2::25)
 by ZR0P278MB1461.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:96::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 16:07:57 +0000
Received: from AM3PEPF0000A78F.eurprd04.prod.outlook.com
 (2603:10a6:205:2:cafe::6f) by AM4PR0302CA0012.outlook.office365.com
 (2603:10a6:205:2::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 16:08:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.86.6)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 40.93.86.6 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.86.6; helo=GVAP278CU002.outbound.protection.outlook.com; pr=C
Received: from hz-deliver01.de.seppmail.cloud (162.55.72.219) by
 AM3PEPF0000A78F.mail.protection.outlook.com (10.167.16.118) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Mon, 1 Dec 2025 16:07:57 +0000
Received: from hz-glue05.de.seppmail.cloud (unknown [10.11.0.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-deliver01.de.seppmail.cloud (Postfix) with ESMTPS id 4dKphs0QKGz4wrt;
	Mon,  1 Dec 2025 17:07:57 +0100 (CET)
Received: from hz-glue05.de.seppmail.cloud (unknown [172.18.0.4])
	by hz-glue05.de.seppmail.cloud (Postfix) with SMTP id 4dKphs06kDz1wJd;
	Mon,  1 Dec 2025 17:07:57 +0100 (CET)
X-SEPP-Suspect: c499f0d0fd114543b14b87ba061083e0
Received: from hz-scan01.de.seppmail.cloud (unknown [10.11.0.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by hz-glue03.de.seppmail.cloud (Postfix) with ESMTPS id 4dKphr6Sbzz1xZ9;
	Mon,  1 Dec 2025 17:07:56 +0100 (CET)
Received: from hz-scan01 (localhost [127.0.0.1])
	by hz-scan01.de.seppmail.cloud (Postfix) with SMTP id 4dKphr5rtwz4HhW;
	Mon, 01 Dec 2025 17:07:56 +0100 (CET)
Received: from hz-m365gate03.de.seppmail.cloud (unknown [10.11.0.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-scan01.de.seppmail.cloud (Postfix) with ESMTPS;
	Mon, 01 Dec 2025 17:07:55 +0100 (CET)
Received: from GVAP278CU002.outbound.protection.outlook.com (mail-switzerlandwestazlp17010006.outbound.protection.outlook.com [40.93.86.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by hz-m365gate03.de.seppmail.cloud (Postfix) with ESMTPS id 4dKphn1Q3Yz1w0b;
	Mon,  1 Dec 2025 17:07:53 +0100 (CET)
Received: from AM9P250CA0019.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::24)
 by ZR0P278MB1363.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:82::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 16:07:47 +0000
Received: from AM3PEPF00009B9C.eurprd04.prod.outlook.com
 (2603:10a6:20b:21c:cafe::79) by AM9P250CA0019.outlook.office365.com
 (2603:10a6:20b:21c::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 16:07:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.79.220.33)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 20.79.220.33 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.79.220.33; helo=de1-emailsignatures-cloud.codetwo.com; pr=C
Received: from de1-emailsignatures-cloud.codetwo.com (20.79.220.33) by
 AM3PEPF00009B9C.mail.protection.outlook.com (10.167.16.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 16:07:46 +0000
Received: from ZRZP278CU001.outbound.protection.outlook.com (40.93.85.24) by de1-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Mon, 01 Dec 2025 16:07:45 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=duagon.com;
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:34::6) by
 GV0P278MB1214.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:5d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Mon, 1 Dec 2025 16:07:42 +0000
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::39da:49d1:7c23:953e]) by ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::39da:49d1:7c23:953e%7]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 16:07:42 +0000
From: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
To: andy@kernel.org,
	krzk@kernel.org,
	linus.walleij@linaro.org,
	nathan@kernel.org,
	nsc@kernel.org,
	gregkh@linuxfoundation.org,
	bleung@chromium.org,
	heikki.krogerus@linux.intel.com,
	abhishekpandit@chromium.org,
	masahiroy@kernel.org,
	legion@kernel.org,
	hughd@google.com
CC: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Subject: [PATCH v2 0/1] mcb: Add modpost support for processing MODULE_DEVICE_TABLE
Date: Mon, 1 Dec 2025 17:07:19 +0100
Message-ID: <20251201160720.28580-1-dev-josejavier.rodriguez@duagon.com>
X-Mailer: git-send-email 2.51.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MA2P292CA0023.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::18)
 To ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:34::6)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR0P278MB0523:EE_|GV0P278MB1214:EE_|AM3PEPF00009B9C:EE_|ZR0P278MB1363:EE_|AM3PEPF0000A78F:EE_|ZR0P278MB1461:EE_
X-MS-Office365-Filtering-Correlation-Id: 456e0f5d-f2eb-4fb3-f11d-08de30f3cb13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?9DrodZt506OlhYKtKRj+wH66vPRfQjEw20KzzP+5u0hjdYoOVn6dk/DuxP0E?=
 =?us-ascii?Q?KWxfSam/F/d7jmWSXEV1lRxKVi0LIVGwHNInW44ijSv5UtwC/GQVUTYXzTv2?=
 =?us-ascii?Q?78YwE1EzRHSb1/DgBKRZ+slhj17Ra93UA0abjgJbbnns0mPlrsfmSQJev6Pv?=
 =?us-ascii?Q?SBOP1Zt9r+3O7R002f+BbmEFRzLrSJLxB9OfTaojkgommp9vGV27nWSNP/h+?=
 =?us-ascii?Q?tCe/ke818W3GvTFdYlEpZUg7uNdM/XLb4AcbBpXLslZku/rjsEZepDOucE6U?=
 =?us-ascii?Q?bHCQALx0AwTSJbzQ8ENC6nHBKb6YQKwI7bU5HMvo8jzkubdXyX52BmoB9go+?=
 =?us-ascii?Q?BAfAR6CsHl9MB6I6/kCRZ+6qh4AtmgkD5G6MIxIPeTFl//gB+P39HdbaE2A/?=
 =?us-ascii?Q?Xmn6YYMtbjxqYo6sHujCTmHDLPzjPbP9H8MDUjVJtvbG0+7QOJFynsIEBdJr?=
 =?us-ascii?Q?YkBvp+WH9yCkdSpwsMcH6MGZe2D62IROhWrxOUz2ZX/nEt8/wSXaQPgONkHu?=
 =?us-ascii?Q?hKZ/VBDxMJiTnkByM9USSW8P/nNptwTvKN389b3fW1gnrFHbPCl8pnGRB3P4?=
 =?us-ascii?Q?JVRmd3AEITAw09XOaxpb0mqQ/EonULH36UVmerOfINyHE1ZahqV11qD4rtKz?=
 =?us-ascii?Q?UNpOI1ESC4WQrxWwaALxnzMp6HIy1WeUDYUoo0HziNIpY+NpEp7LaMeVlm0G?=
 =?us-ascii?Q?VG0b8IkMBNdj2FH6OncbFDNf3Idszr1gEfnKovv5/3a0szAnHc6/nPtpVwmO?=
 =?us-ascii?Q?lM/uQRBFZ0iAnGmUcs/RIKGLLcf2tkBGVzEfLgNZ94XwcmLbo08ONPoEhoxZ?=
 =?us-ascii?Q?/CyjFk33nK5pQHBPGDk9vrHC+KB8aIc8wzF5dMK5uZM225qWF459GqkyzVZY?=
 =?us-ascii?Q?I9Nlfs39z2ftOsW4+e/nt5+n06ZUG9vye0De4XhOG92YbkJDiJseMel2dec1?=
 =?us-ascii?Q?tDucdVSkqXi7xelZNtwW+vp3KRVDkSfs6cdojlXeqY7A4u8E7sVP7R2j6gA5?=
 =?us-ascii?Q?sNbjfI7Kts32rnacdtI0szhbr3sCphOEjkgeS3MPwWbIQ9NYhS8/9oUZHLTr?=
 =?us-ascii?Q?d+t1GrIFNZl7cVpFtNdzx114f4CfAMgmW27LDs6ommlafnDIrkX1hX2fgbeO?=
 =?us-ascii?Q?/yxBcjm+aQPF9uC3QN4uKY98Xrsb0i5dzQkyFyRdBWxgFqyRzS8kagNiku4P?=
 =?us-ascii?Q?l9zVD95EJLfx1X0pncysOkA4HKNtHGEIhcKka+QjTWbKKfbvApARLqLbscD8?=
 =?us-ascii?Q?XLbwfugPhe1Ygn6DyNZaVgb9aeTWC7OpftPBGePDEyHudXLRpAHP6Gf9G5z/?=
 =?us-ascii?Q?+PB71dVkozYE26EH5wGhpeSIeJz9q0nEvlgFI9rIEWqdU2o2syOXSs0qJnU3?=
 =?us-ascii?Q?s6jahZ39FlPqvqSGBLnJlEWxkSZzPtk39wgiQeQ/RXoCciI3xuGDap15JsGS?=
 =?us-ascii?Q?cp1Cffr4L9gYmcq83T+Bs2ipjhBlPoWQafqNKOHnpFdc2gtrjtxg7hVp3QKb?=
 =?us-ascii?Q?nmK+lOY1PlkaAXrOGdh3JvFGzbSspc+jwQHfXtxYoQezl97bCSIvcAcksg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB1214
X-CodeTwo-MessageID: ec91eaba-a74c-4e04-8dd2-8a9aa477124f.20251201160745@de1-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 1
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
 bdb27df3-ad65-4556-c357-08de30f3c1c4
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|36860700013|35042699022|82310400026|7416014|376014|14060799003|1800799024|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?y0RrDj7HAM2jG2XsIFrc3kZwePt4xbR8ux0x/s2FE4fp13Tim2JulcOYwZrr?=
 =?us-ascii?Q?V817tDMuI3E7wjoNdpPAawQEXum0YzR6bFU5cqOXfEbpx5UiX47i7v+HWjdT?=
 =?us-ascii?Q?RBsp7NmvbpR/IKzp8nGHp7FBUkJU948rDQk2r1PgEu+RPWkkHhvTC2FpLxud?=
 =?us-ascii?Q?L0M7P+/5G7yYFrpu5mLrTLgxTKmUU/rfBDLH8aAjz1PfHE4QP330KiVXbWlD?=
 =?us-ascii?Q?bdbqOMSf7rkeE4Q7AbkcNl7DSuXP5jzKw+vO/nGDFUG3+RgfbSZ83h6ZwcUR?=
 =?us-ascii?Q?Afi28VpLV3KukAcR3SOHEe2Enny6uyN/SYYHiYfDbEYPmWnjkK994hXLGtYt?=
 =?us-ascii?Q?dn0C+QUnc99CiBqhkBhwnGKa3m3BGkyK7n+qw9rhoTLGytx1WCO5b1v3P5vr?=
 =?us-ascii?Q?a7laVLIoW5bQLv5TF3FYaXuvwvu7kN9X8ioQMQ7FUcD5Mvwx9qLoVqZKwUSD?=
 =?us-ascii?Q?vzRzDfeKO/w14gy/89eEqTO/zQP+UXTyQJYl34mN+X2dNRvq2LDXKmN+jLeM?=
 =?us-ascii?Q?mGNZXpxJWMhXNOhBksAZ3NkDeGJgKsN953fVZPyblxmlHsM95h8bTkgREu2f?=
 =?us-ascii?Q?gkgdcvP68meltYDhc6sBboMiI5c7PJ3vjP3UDHM7BJ/ThHUXmlyUCxTBwEL0?=
 =?us-ascii?Q?f4QIgdqVxPBtjfDjxT1cpbH67ma0rJURZyeF+ylWlYKMuS2k/O1iYiewQyuh?=
 =?us-ascii?Q?mKSv0detC+KKbWRKfErUTHso35qPy5kyH83WkmewQcQv4gAzyQQAaSHlfXQy?=
 =?us-ascii?Q?lEOlNg1AYAjHK6qiwpcTAEmpuhwg5wXAf0D6Tr0z8fX4LIAP5bRhFleYHoMt?=
 =?us-ascii?Q?CqL28iQm0GhvvI1wVeLNiW2onPCyXgoQ7sRCWImjGZpfvaE9NB/37x6UFtgj?=
 =?us-ascii?Q?YoXfwctVFhlLS7sHoPMqSnwkPPkCa1QhhrDIV4pLJdfZyjJNLrfY0crD8Z9v?=
 =?us-ascii?Q?65nzjK1GWiXnXpkcUl9WgsS7L5TZwvgBbyxA7hAb9PT2/FCnKReG3KuUALLv?=
 =?us-ascii?Q?b1yMzoDG0YQT5L3qkO/l5k/GNDR6y70FgwjdX4T1irbAMSbQuQB9+zJ+YSNe?=
 =?us-ascii?Q?gEV88VWVlbDFcAP0TpZ8t+5EEIVb/UyUNgg2fkdbKfWHUX0upxoRKyWYTX7K?=
 =?us-ascii?Q?67wux2RZw73JjT8qNNeqEWeH6mnXvm8LJRJJTcvM1XRTo4YGpW2ylXua7k5r?=
 =?us-ascii?Q?j0c7yNat8xAse+jV+M6BqLnsCQ6kLGS+6Yd/EwDWgY0i0LpEYdubDlZ1w6RY?=
 =?us-ascii?Q?dWcX/r8/txbfSQiH2E8zRvHSL6/qeXpT5NoMy1+faFOkuUndZe8q2n4chq1b?=
 =?us-ascii?Q?1odmiaFPK4LtPQms1u+E1/mXSehmOCGcJyq0ZfpTvaeR5Kinh9AZmoqbJn2n?=
 =?us-ascii?Q?fBKuSsiX1Gdcp6luUtYSd5pfAuk7bYwm7YYOs6Rej/Dl+uMsFm3SM3P8UFJ2?=
 =?us-ascii?Q?0cNnox108lsKdWrCR+TGuE+h/R26w1A8kHarPiFvmKF6BTENb/bQJWbVx7AQ?=
 =?us-ascii?Q?wO7IVt2ISKlQwrudb6Luxve6pYBbUrteqQhvzH7mbNvATnDcCDLCrwu8bVYN?=
 =?us-ascii?Q?vB75lSZOf7Qj7gHLZD4YHse74PwQMhppPhO9Nr/t?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:20.79.220.33;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:de1-emailsignatures-cloud.codetwo.com;PTR:de1-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(82310400026)(7416014)(376014)(14060799003)(1800799024)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB1363
X-SEPP-CCCVersion: 2025-11-05T14:36:24+01:00 6c313bee
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.86.6];domain=GVAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.86.6];domain=GVAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bc9a2a55-8f9b-4dd7-2100-08de30f3c44c
X-SM-ruleversion: 2.1.0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|156008|82310400026|36860700013|35042699022|376014|1800799024|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C3AwfkGl2/HNLHiQEotKx9B9l9FEpTKJbd8FdWEDKroVNzEXPHeGNT73uucc?=
 =?us-ascii?Q?hykt8St13ZvYCrCYwnmwsJFvb7/NusmOFD6IONk+dPFNRMefKGUB0dGRVgpW?=
 =?us-ascii?Q?GRiH6LUze4PiJX1NpbZmO400TbPgabiITXYYrW2E5RFUrUaAO1NgB1F6ofpH?=
 =?us-ascii?Q?JBGNuE4FNgYdgHBozaSXkEO7Jcno3SDn8VkUpQOjLZW6nfIUbiJyBlaAHeMG?=
 =?us-ascii?Q?zm4AD7uB6B/2pXkndEmkh1IKQPJvOIdM87k7eVrq66wiA1rbGdsJuxSztzae?=
 =?us-ascii?Q?FTtcVn7Bv8qZpwM15uBnCDIcP3Ei6ppntrLAxXFgVePEURH/Wi5UjrtteI/Q?=
 =?us-ascii?Q?Nx2c7FCR2+OWM9blmhcqwHixkQdBlt5tVCVKAew21q1zZYMo4uEvBQqmj5Nj?=
 =?us-ascii?Q?zUkbdAhEb+0gY0nMvgMneHkvAl1Qo1pbayNBLKYihm5WSJsWwBwtwBQdNIu8?=
 =?us-ascii?Q?ICRSkClPnWnwlfyGnhUMeaNQ1Jhw2j218AH/KU6AXgHRoOqocArqcFVIrb2f?=
 =?us-ascii?Q?KPUPilJsDiF0YA1ETL8FMLbxbMbeXjUj54rWBasKcII0Y9lLp6yjB+HR35bo?=
 =?us-ascii?Q?x0hxIllVUHaeVDKWk6TPlJqDTxt/ihXBptZIa3VTiqAxI3QEE00bFyf4rvYb?=
 =?us-ascii?Q?dGr6LNgTau/6uXbL+KVkFjsLDJh2l2xaA1/QYoVV9HNBHUpC8Wb9rVwiWvNo?=
 =?us-ascii?Q?K2IYuZq/UOdFB+IpsmiOCMjyBWbV2U85L+42hjyguigQ+1EDmAwQu3PH5A0R?=
 =?us-ascii?Q?cI4GlKA+rzQEmIHk3McOTaI8OmuuNOBESLr0S4CVhTatDFTyiEJJBtfbBOz3?=
 =?us-ascii?Q?ObyyFkU+mrzAu7GERZIZerZ3cIBZ79QPptkKTjGl4sinrATdMtwMpjXL7R1K?=
 =?us-ascii?Q?m21eEs1DbdcE3IhUR2o1fKQMRTaDtMyvHDl8s3qiCQ95yPnTh9Cx4nsDpH8n?=
 =?us-ascii?Q?UPsKPIoDM6BYF4YODnEDjFqDcHZ4+pEGuq0LOOjifAqKPmxe1cNctJJkM1iW?=
 =?us-ascii?Q?ydzBRk/aGGoJj7JFv6h0OqfT/AWogOIt0n5EvsifAcMyIYRL5cTxQwzj2Cv4?=
 =?us-ascii?Q?Lj/ZQahUcxqv5UsOyMINwDpBE+vNbeqHTbwrjPuKyRXOsyXwPSBR+XcKLUeP?=
 =?us-ascii?Q?3zaRiFXalsgykTMDPyBFThydeYWYp2Sa4g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:162.55.72.219;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVAP278CU002.outbound.protection.outlook.com;PTR:mail-switzerlandwestazlp17010006.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(156008)(82310400026)(36860700013)(35042699022)(376014)(1800799024)(7416014)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 16:07:57.4733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 456e0f5d-f2eb-4fb3-f11d-08de30f3cb13
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[162.55.72.219];Helo=[hz-deliver01.de.seppmail.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB1461

During the process of update of one of the device drivers that are part of
mcb bus (gpio-menz127.c), Krzysztof from GPIO subsystem asked me
why I was adding new MODULE_ALIAS when I also added the same new
information on MODULE_DEVICE_TABLE.

You can find the messages here:

https://lore.kernel.org/linux-gpio/80a20b13-7c6a-4483-9741-568424f957ef@ker=
nel.org/

After a deeper analysis, I came across that the mcb_table_id defined inside
MODULE_DEVICE_TABLE on all device drivers was being ignored as modpost was
not processing the mcb MODULE_DEVICE_TABLE entries. For this reason, former
contributors were using MODULE_ALIAS for enabling mcb to autoload the
device drivers.

My proposal with these changes is to complete the mcb bus by adding
modpost support for processing mcb MODULE_DEVICE_TABLE.

Once this patch is merged, I will send patches one by one for removing
MODULE_ALIAS from all device drivers as they are no longer needed
(as Andy Shevchenko suggested in v1 review).

---
Changes in v2:

- Place "mcb" before "mei" to follow the order.
- Send changes for mcb drivers in a per-driver basis.

Jose Javier Rodriguez Barbarin (1):
  mcb: Add missing modpost build support

 scripts/mod/devicetable-offsets.c | 3 +++
 scripts/mod/file2alias.c          | 9 +++++++++
 2 files changed, 12 insertions(+)

--=20
2.51.1

