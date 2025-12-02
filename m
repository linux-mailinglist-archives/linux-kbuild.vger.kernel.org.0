Return-Path: <linux-kbuild+bounces-9940-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE65C9ABB0
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Dec 2025 09:42:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8478F3A50D9
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Dec 2025 08:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BF9A2F691B;
	Tue,  2 Dec 2025 08:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b="ax0plMNl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from ZRAP278CU002.outbound.protection.outlook.com (mail-switzerlandnorthazon11020118.outbound.protection.outlook.com [52.101.186.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF392727F8;
	Tue,  2 Dec 2025 08:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.186.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764664955; cv=fail; b=Df+hrZTv/ilH7UIUxeZflnsrL+wcW3mkp19LncSw+j0JOJxqL7ogIWnJVcvhSa/8FdfMc/pIUg7b/O42rwJjNEDRKem28eRhaM3UcdVv7PEMi2eafcw0HyB6Tz11veWYenRDstdSc/u4hlk+mqFwXb04ktkvxFDcN99QRjDbllc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764664955; c=relaxed/simple;
	bh=hMIe45d8e6ldW1sZzRWVTfoJpQfN10FIobGMP8lUVAw=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=cFHEx0pfrDpZCAFYbKBQBBFytk1PiEAKFOGVzuw7cgE4si50p8VS2pUMckmrTrbueqTOcy4P0qBJkv38Cs3Ki3vG3rNpeLDi3pU2QXlvX0RacaREoyKhVvrbHES+TGyELJMhqPRPhx23STrDrBHtkOSLvM6Uf+nOnLgm2hgEboo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com; spf=pass smtp.mailfrom=duagon.com; dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b=ax0plMNl; arc=fail smtp.client-ip=52.101.186.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duagon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wS9WR/Qn5+AiJ/g54UBcOZWkyZPmPv6+RypWdvdAX2sQPK6NpLYOrVQykceviYS+XWOSZbAhMqheQNtJ4YoJWJVMs6pSe/J3UdNwSpNUhaO0zwp6vS0ZpiKZWMHBtEXyHWLbemMDtgAN/NfENDMTr2SNXGiN+MhectQVwHXNXBQ8lgJjLGL2dQHK1rtGmtQJHjiotX676qf8cfLZrWm8O3uOgVDqVTp/KToWp8trOKUhg8XlKlrfyB5Gs1voM+ELp29lSPUrPPbgdjXFpWq43MuROIf8BjPfyTHSeHGvSPSED5JIiLi621ob3zYFBOEWgWDQbYnghF/zvwzGoKhmPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T9dzEVfc0EpEicydwyaRjxd5x2BBH0MQkgLCFoj/8Es=;
 b=iseeVwSVgwjnxyir0hhTbhqYO+/apFoZnpwvIrheZPVTeqo2BUa6Yu6f3phS9VujADzH3aAIjBm7s4Yc8r+k0tBNFv3WXpd7UydYSP4vtZthGGgZmxF8JTRUorepBEK3EWFgSxhbBIS1I/LPWBQK5HkEhw51Yh6D4PG5nBhHtscB9Hf2Hv0gTx9ORkShNqnesGRfeAdrPNV6+X5kX0ioPt7mpoekfYAcBZ4yUEL25FxYgVf4QlSzijvBmp8JoyaPXJN1utzl8Pf0dyMl5ElemSNz4iaenDkKDFgT1jNkNTEiPtAyg6vyKBGsHeTnKtEUfX/f/aCUmZxlJdR5UnSIwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.85.28) smtp.rcpttodomain=chromium.org smtp.mailfrom=duagon.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=duagon.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9dzEVfc0EpEicydwyaRjxd5x2BBH0MQkgLCFoj/8Es=;
 b=ax0plMNlkq/SABzlu+FawwJ4+OeMT5aHw0TOauZp5Z7xdjmv8HYbklbKBxULLPoLvUhi2ZT3bjNS/rudEwVQm+MCrJ4iMImuua85xcvuqZL4UIgIrAtv8e0xiGc3o9SQAkWegMMjeImqgGGf7yB0xE1tX0jt+SgIvutfPNT5Xkg=
Received: from DU6P191CA0035.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::11)
 by ZRAP278MB0062.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:11::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 08:42:29 +0000
Received: from DB1PEPF000509ED.eurprd03.prod.outlook.com
 (2603:10a6:10:53f:cafe::99) by DU6P191CA0035.outlook.office365.com
 (2603:10a6:10:53f::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 08:42:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.85.28)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 40.93.85.28 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.85.28; helo=ZRZP278CU001.outbound.protection.outlook.com;
 pr=C
Received: from hz-deliver01.de.seppmail.cloud (162.55.72.219) by
 DB1PEPF000509ED.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Tue, 2 Dec 2025 08:42:28 +0000
Received: from hz-glue03.de.seppmail.cloud (unknown [10.11.0.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-deliver01.de.seppmail.cloud (Postfix) with ESMTPS id 4dLDmN1TQ4z4wty;
	Tue,  2 Dec 2025 09:42:28 +0100 (CET)
Received: from hz-glue03.de.seppmail.cloud (unknown [172.18.0.3])
	by hz-glue03.de.seppmail.cloud (Postfix) with SMTP id 4dLDmN0tLhz1xZr;
	Tue,  2 Dec 2025 09:42:28 +0100 (CET)
X-SEPP-Suspect: 544e9abf10604fd5ad5ad66244257357
Received: from hz-scan07.de.seppmail.cloud (unknown [10.11.0.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by hz-glue03.de.seppmail.cloud (Postfix) with ESMTPS id 4dLDmN06G6z1xXq;
	Tue,  2 Dec 2025 09:42:28 +0100 (CET)
Received: from hz-scan07 (localhost [127.0.0.1])
	by hz-scan07.de.seppmail.cloud (Postfix) with SMTP id 4dLDmM6bP8zmJn;
	Tue, 02 Dec 2025 09:42:27 +0100 (CET)
Received: from hz-m365gate03.de.seppmail.cloud (unknown [10.11.0.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-scan07.de.seppmail.cloud (Postfix) with ESMTPS;
	Tue, 02 Dec 2025 09:42:26 +0100 (CET)
Received: from ZRZP278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazlp17011028.outbound.protection.outlook.com [40.93.85.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by hz-m365gate03.de.seppmail.cloud (Postfix) with ESMTPS id 4dLDmJ2jcPz1w0b;
	Tue,  2 Dec 2025 09:42:24 +0100 (CET)
Received: from DUZPR01CA0089.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::12) by GV0P278MB1864.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:70::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 08:42:22 +0000
Received: from DU6PEPF0000A7DD.eurprd02.prod.outlook.com
 (2603:10a6:10:46a:cafe::c8) by DUZPR01CA0089.outlook.office365.com
 (2603:10a6:10:46a::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 08:42:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.79.220.33)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 20.79.220.33 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.79.220.33; helo=de1-emailsignatures-cloud.codetwo.com; pr=C
Received: from de1-emailsignatures-cloud.codetwo.com (20.79.220.33) by
 DU6PEPF0000A7DD.mail.protection.outlook.com (10.167.8.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 08:42:21 +0000
Received: from ZRAP278CU002.outbound.protection.outlook.com (40.93.85.4) by de1-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Tue, 02 Dec 2025 08:42:20 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=duagon.com;
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:34::6) by
 GV0P278MB2028.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:6f::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Tue, 2 Dec 2025 08:42:18 +0000
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::39da:49d1:7c23:953e]) by ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::39da:49d1:7c23:953e%7]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 08:42:18 +0000
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
	Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>,
	Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>
Subject: [PATCH v3] mcb: Add missing modpost build support
Date: Tue, 2 Dec 2025 09:42:00 +0100
Message-ID: <20251202084200.10410-1-dev-josejavier.rodriguez@duagon.com>
X-Mailer: git-send-email 2.51.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MA3P292CA0017.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::8) To ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:34::6)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR0P278MB0523:EE_|GV0P278MB2028:EE_|DU6PEPF0000A7DD:EE_|GV0P278MB1864:EE_|DB1PEPF000509ED:EE_|ZRAP278MB0062:EE_
X-MS-Office365-Filtering-Correlation-Id: 22847a92-a714-42af-2699-08de317eb9ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?RCLh4Wwj4IHd/wB6iWFlzKQld309DASTASq+BRtj9gD/ej5lwze0Ao0ptSO3?=
 =?us-ascii?Q?TlIbHjM6o4eyzEyODpHKO+ArCTiRXAx6FnK9pDcDoKyqLnSWGjqyEpx1vmL8?=
 =?us-ascii?Q?UUse61eIenpEiHYsXgSia5kPirxFBi8nuYSO1nfPwnzKkQQihIdie/xX5/dH?=
 =?us-ascii?Q?gdLimDGqMOkuOG6yci5/627olrw9VelFfliTB3pK9Uafxdr2/PxhO/e8w3SG?=
 =?us-ascii?Q?DfTXJveRgnCh1Tm/T16G8qaebQDP+evS5X44IxHoFvLrqAgPn4nb1i2RrPV2?=
 =?us-ascii?Q?XQhc3qvu4AVfRmwZiPiFtZvrvcrHCk09g7wm/l2iEHEipjBhgArp0WSWHyMx?=
 =?us-ascii?Q?qSyvwAwHk14vV3uA2v5UPhxV0QrUuVZP+2aPZpQkD7Y1mMmA29hUxiw6Ymhr?=
 =?us-ascii?Q?/97lMHhW0r39Isx2A84afk/Zs0qBUwG4QQ/rahachBk0o90KlroYMn/psDur?=
 =?us-ascii?Q?XoPO6Vdo5plZ6ZByABHB5ljUChI2Qj7C6JUpMN5eB8Jw157c5PkqXXyeSNU5?=
 =?us-ascii?Q?2wjTrF9BnlfomiAIyC3HAf5FgI8LQLYW8mmOAUyl1vvepJrA4sEkJwg9adtA?=
 =?us-ascii?Q?t9nGjaD2ZRFjveud7EdWI8fOt8zi32LqtOHtQn8CY1rU3hzR5OLBUKtyBKjo?=
 =?us-ascii?Q?6CTveCpWsUWd8GihQV0NKUVC+JroClbX2NeuVbuU11nRDvj5Q58GfovbCygz?=
 =?us-ascii?Q?Z9Vuer6xrwCQAo9z0+iNcDG1Gyz9L9rMFOywObi+ob2uKtKGWc8pQ+89MgPK?=
 =?us-ascii?Q?1lDupqiEDS3U8fcAmWzkiWylmdE/68NSnJ23cUTDLBS05/2tlZz15ij2uS15?=
 =?us-ascii?Q?yPhEklq5b/1OaAF2aSLYffjWC+U7Tw9DL36o91J6R/Dv/MQPVeDSnmUEuxIO?=
 =?us-ascii?Q?qifH0lSIJNPttvGwHuZVdqz22kyX+lCqq6oJlMJDC566MkwhijqlN9SznV2G?=
 =?us-ascii?Q?9DDLCw30kG+eYfLVSw5vrxtjg9rOHXn4CZtj2Jh7p2HvGGWw5G1ecHeCutii?=
 =?us-ascii?Q?za/TK1WdixK6TY1jS3FkwVQzqF+myxzhH334nxQdQz7j177dmDaDOjb9zREG?=
 =?us-ascii?Q?9kel/+5hlT7Ta3Hkhf+eUpWyuKt8AuOQzW8ZZv3Da59kX9S7lnzVIpaaiVP7?=
 =?us-ascii?Q?/7G2e6Gxs+C9zjDabrDjBdoOdowiAha7NDNvg7+V+l1d0IYa5estDbQldrRa?=
 =?us-ascii?Q?U5FKqm8d5bGVAf71UkEAGP/N4MShtlL1ySOJdJKdH8eRWiky1iVfMWs1P4Sp?=
 =?us-ascii?Q?uXDHV0g6AK2L8FzTaE4YN9w3J9x0uky6cpT+e6nmO7DlWBwVQRmAgCI7g6vQ?=
 =?us-ascii?Q?NLVnAGtLxcJ2yxzBEumSoGYa4epb5j3A1fB3HgjrrWLGDJQnqoPY7dNkMDgQ?=
 =?us-ascii?Q?HKFWqZ7K9lzfNXhZUFRFMCUmOn0mTcsEKq2DFQd98RgCvqrbwUKFoNX+HYG7?=
 =?us-ascii?Q?s/JLFWN+idLAMrgPnSRYNuNhawQTYuwd70W+zHOA+Yytu3pI5V8kY+bxEaxK?=
 =?us-ascii?Q?j3fqQzn7sgsdwQ8ES/o+rCJbz2smnHXAq0DQSqHWKZDps4dmj2NGHsRe0A?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB2028
X-CodeTwo-MessageID: a59c0f8d-4e25-4bfb-ad56-15fee38aeb8a.20251202084220@de1-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 1
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
 6a1e856b-2a3a-4d47-6f0b-08de317eb371
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|35042699022|14060799003|1800799024|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?WZBLQhCzW48yJRzdVfrlz9Q2VSDipKTaw3KTEXuyj4dIlK2argea0OvTp5IC?=
 =?us-ascii?Q?JkTpx3ZdK/81irx/PwGrJcThV7z6Mir9yE9h0q+sW/Z+7ODBGW0up/XEKbtb?=
 =?us-ascii?Q?5RBpwGIxip/afFw7KCB7/fMFIDD10DNZ+L15LsfOwPPy9J/guqwdmUZc1SZj?=
 =?us-ascii?Q?lrtkJ/D7+abObGXwb8fOKtOgYd3q6aq68SetkYdMNuB7/fGLRfHFhdYZzTbK?=
 =?us-ascii?Q?eIwmfpf3sD+ldoSEOuhsjhUE6Cr0tWsAsxqiev6ujZBe5k9GFc8oLEdV0wSZ?=
 =?us-ascii?Q?++rJRzujjrpa9YrATjxAeBvqCjJrSfb05VXrDobqhVYY3IlHUxnzLJJrtbMa?=
 =?us-ascii?Q?JoLao1zJaK5zPlOFDWgEzigz8Ta+HnIHQge4SV3YwPquec+zC/1TSDrZEOUx?=
 =?us-ascii?Q?7BJJgs2hlwF36KZPQ+jmms0nfctF0kYMdkBOcTFetGkTOXUj+XHeP0WmD1sY?=
 =?us-ascii?Q?+ONrLx5S8MMU9DIInMZ/DiN09FcNG4R1QmtomrR+3hg7duNGuH1XvIGq+Y3s?=
 =?us-ascii?Q?UcQRGOzsw/eSAK70V1fTL4KuSF2SsiUu/qrFv9tmHWfY1YGSi78q6y99Z0I1?=
 =?us-ascii?Q?4mHsyTeaRE5OQzQpsKjGtMC34+PZIDemiZUeRqrDi9LJcAJ1tXfPqgLIOH/u?=
 =?us-ascii?Q?JG4ZEFBENu1Cl7+kqpR8Ayy5y7AUlMgTp8AfNANy8LxRm39Nz2fOjSjHUpdx?=
 =?us-ascii?Q?94x0wJQNwUi1HfM4fVirdfWnGdcERP+mde9ml+tQ9K5e3lHQfK20s01nXAXH?=
 =?us-ascii?Q?dbpqXOBh3QBAbdxrob7TlyGUO2PJreS+JJXERZ/yfnUMANC6YkCIk8W9kUP4?=
 =?us-ascii?Q?2LUsHQ85yisfA06UbeQjqGGMCH1uVoVTsjrtavB7jmF2WyNNXfXnjPYwlKW1?=
 =?us-ascii?Q?ZJaiApUkTWH/aMEHimULcAzrEPVQyZ/CeBiL6zO5xDta+j8R8RZL4mtH5TXf?=
 =?us-ascii?Q?QRxlQFf9Zpwp2N3yLka30dP84EJQBHnWWO9yIbK0vMs5YO52u+UctoiK1NQn?=
 =?us-ascii?Q?LYLfPcsmh+LOL3XAx9qZcRnwCYmhvh1GOhM8Kl5wdjdeqdetPSC9Xj6m8dBG?=
 =?us-ascii?Q?7H6AvSsSS/jb2vAUvc9cBC+iVesZHEj2acJLXKjRfhkRfH45wHCHwjpUmf7G?=
 =?us-ascii?Q?iD9ZqWEB3gtE+T5v9l8BVaZTFmTysGpvwZal3E2W4PUvNaSzmF09xsKFYMRq?=
 =?us-ascii?Q?djACzwdSe5hAGJOVisMFBMRmpkmTQePZ1fadyLueHJT75Qjlyae1BikR6nX+?=
 =?us-ascii?Q?ZkPcDE30MtLKMyuE5eWu0vJoEr2DTpKwYJ4psboYZMVmoBgRNGJjkYlCfSoB?=
 =?us-ascii?Q?5R2oDnjkN8SGTdPjs9SjbfqCU3tv3VHq+rOxzDta/QqbxN8h/rbSbyKCnvYp?=
 =?us-ascii?Q?a1m+os1uF9kcrQHE4C6Mll1PhYzAFFKxvlH2zdeNMUIAXHiJUMmYPcxFxTzc?=
 =?us-ascii?Q?OrriSsP1id2URg3K+9VXXe/rMkhTZXx3iMhAd4JMUtDmNBjfHiximiRwlD4s?=
 =?us-ascii?Q?pkGnCBj3FKvZeY8L5lHRvzUzXwuluLJMKMPRZTMm0P1C3SRhcYIAF4qlKtwA?=
 =?us-ascii?Q?Zd0X/GcHUWL96/GgJWEGIxqdrV0NWuFu9flZXDm8?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:20.79.220.33;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:de1-emailsignatures-cloud.codetwo.com;PTR:de1-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(35042699022)(14060799003)(1800799024)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB1864
X-SEPP-CCCVersion: 2025-11-05T14:36:24+01:00 6c313bee
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.85.28];domain=ZRZP278CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.85.28];domain=ZRZP278CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4d43b556-458a-478c-f875-08de317eb605
X-SM-ruleversion: 2.1.0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|156008|82310400026|36860700013|1800799024|35042699022|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wrVySDovGDgESwhjKc2NW0JW5xV2p1twu2vzRfICuK/WX0YNd8y2fS2IKmum?=
 =?us-ascii?Q?LvEXAIBKKGw2mFaA8bHdiuCaHsJtzbKh7gRrMrt5uSNJOgBHVDDF+070QsZ0?=
 =?us-ascii?Q?mLWkdIUCrQsCwQbxMTztEUbZLEcJeSVsjN+VoNOUygqQtR1/NrdlkO3vZLXm?=
 =?us-ascii?Q?3A7vv0ZEIXbXVqL08ahpv/S0pAlI3ISF5YDubxJ9oJWvp7xpPAtscYnc0hOr?=
 =?us-ascii?Q?8MnKJujGZkC+ecoD+SZ2gF80Ht9W1kvae2recsORJbWJ7vzg9ptL1WpoWz+M?=
 =?us-ascii?Q?TkC/TyBy1JV5O1fGwt96lBnUc0YXLR/G7Wof8m996rNW36pN4Z/auwh0SaXx?=
 =?us-ascii?Q?/2iqv1m+lQCYIJIP3RlrzIvYfwXLmBNKZQO7cUlCzfcyag3gm211M8oZRSMj?=
 =?us-ascii?Q?1zUwe/nNDwnaMdFYxZjbze3OWwvMfT2DvtdV36AHU4qeGlsmGZAePvgfXT+p?=
 =?us-ascii?Q?yaL+a9b2R514tbLl2e91zkfdfC3O6O/mPfCvJvgAr+pxLr7X4aMDsX9d+BVu?=
 =?us-ascii?Q?RwhK0wmEfc0r5j0rvOWuqr3UuIZ+WO30DrW0cFntfaxAeaVb7AEslsCmx/F9?=
 =?us-ascii?Q?uBiy2tq+OHuWxElYaYOYKp7K5zzwo++0QAQagS/xQLo6LqjEXHYG9X+VoY3h?=
 =?us-ascii?Q?ewVRQz2pzn4rOlW3tlxfc38FzUq9P2AA5EaHxrKrjTA1ExMAMtcvOxtiG9jC?=
 =?us-ascii?Q?jsZlsvL8q22LZx8O9AX2AADUUchEgyZqbUHtS3EHjmxJD7imhzVIzt+cqmsJ?=
 =?us-ascii?Q?YrKsosbh37VyuFpl5Qi1CQQFhImiqgBmYWKqL9RlV7LiR6J8fq7HdliBQyXt?=
 =?us-ascii?Q?+Qbwdq1SEQ9paj2MIYPnRiJNB0dw/2r/P+kWn79HScJtiLSv6Da2oXtO7rUk?=
 =?us-ascii?Q?DlmqZjuNMZNKg1/y5d5zs6PLvp5HsA8EmEt+pmC79Pk75jOTUpRN1GhnQU5C?=
 =?us-ascii?Q?ndELT/P+A9dniQYgoLRoL9SOeQ99JdtkLEYRUenSN25CiO3jnEEXPVSMXoYP?=
 =?us-ascii?Q?O4tvwVTrAk/uYSgOriGFD/vkrEAYy4viqDK3o08HjmixoJIHn2Yyg4l5ga1y?=
 =?us-ascii?Q?Q+W2qB5dpp1+iNaZ/U25XrPuZu5hxoM8chCaBen8ikkYR5x9bojmLxc+4XBE?=
 =?us-ascii?Q?pYupA7/P+JY9k+fOQv2dnWhgUhZVgXsT8A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:162.55.72.219;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRZP278CU001.outbound.protection.outlook.com;PTR:mail-switzerlandnorthazlp17011028.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(156008)(82310400026)(36860700013)(1800799024)(35042699022)(376014)(7416014)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 08:42:28.6716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22847a92-a714-42af-2699-08de317eb9ea
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[162.55.72.219];Helo=[hz-deliver01.de.seppmail.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRAP278MB0062

mcb bus is not prepared to autoload client drivers with the data defined on
the drivers' MODULE_DEVICE_TABLE. modpost cannot access to mcb_table_id
inside MODULE_DEVICE_TABLE so the data declared inside is ignored.

Add modpost build support for accessing to the mcb_table_id coded on device
drivers' MODULE_DEVICE_TABLE.

Fixes: 3764e82e5150 ("drivers: Introduce MEN Chameleon Bus")
Reviewed-by: Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>
Signed-off-by: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@dua=
gon.com>
---
 scripts/mod/devicetable-offsets.c | 3 +++
 scripts/mod/file2alias.c          | 9 +++++++++
 2 files changed, 12 insertions(+)

diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-of=
fsets.c
index d3d00e85edf7..0470ba7c796d 100644
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@ -198,6 +198,9 @@ int main(void)
 	DEVID(cpu_feature);
 	DEVID_FIELD(cpu_feature, feature);
=20
+	DEVID(mcb_device_id);
+	DEVID_FIELD(mcb_device_id, device);
+
 	DEVID(mei_cl_device_id);
 	DEVID_FIELD(mei_cl_device_id, name);
 	DEVID_FIELD(mei_cl_device_id, uuid);
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index b3333560b95e..4e99393a35f1 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -1110,6 +1110,14 @@ static void do_cpu_entry(struct module *mod, void *s=
ymval)
 	module_alias_printf(mod, false, "cpu:type:*:feature:*%04X*", feature);
 }
=20
+/* Looks like: mcb:16zN */
+static void do_mcb_entry(struct module *mod, void *symval)
+{
+	DEF_FIELD(symval, mcb_device_id, device);
+
+	module_alias_printf(mod, false, "mcb:16z%03d", device);
+}
+
 /* Looks like: mei:S:uuid:N:* */
 static void do_mei_entry(struct module *mod, void *symval)
 {
@@ -1444,6 +1452,7 @@ static const struct devtable devtable[] =3D {
 	{"mipscdmm", SIZE_mips_cdmm_device_id, do_mips_cdmm_entry},
 	{"x86cpu", SIZE_x86_cpu_id, do_x86cpu_entry},
 	{"cpu", SIZE_cpu_feature, do_cpu_entry},
+	{"mcb", SIZE_mcb_device_id, do_mcb_entry},
 	{"mei", SIZE_mei_cl_device_id, do_mei_entry},
 	{"rapidio", SIZE_rio_device_id, do_rio_entry},
 	{"ulpi", SIZE_ulpi_device_id, do_ulpi_entry},
--=20
2.51.1

