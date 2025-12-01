Return-Path: <linux-kbuild+bounces-9923-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 14349C982F4
	for <lists+linux-kbuild@lfdr.de>; Mon, 01 Dec 2025 17:10:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4C0D3344CE9
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Dec 2025 16:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64838334375;
	Mon,  1 Dec 2025 16:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b="qzhB7d+o"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazon11022086.outbound.protection.outlook.com [40.107.168.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5EF333423;
	Mon,  1 Dec 2025 16:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.168.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764605282; cv=fail; b=ZblzncLvMloxYZaTOA8TiX2r7wiaQbDxCavXZm//RMgMafb6lQF7FQWa9Q5L0X2EVdXgIfcHsKa0NuZCvQTq/eZC3WirH/HpyWFFKEFCwmBtOyGALCgKc3Rn279XwiQegnyy/qpbiTStkqi79g3523zFl85Vj2VEYU6OiiUJeek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764605282; c=relaxed/simple;
	bh=iQ40G6GDgqk3Us05KGE+c8OWEmAYu08DBTHV21Mjn6s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KQSGU31CgG9tKznmtpksd3MyhaP+Qq4gIubGDN0JFqnDoq+l/CY6Ylow15HC7JzKcwWZ91sw+B8cFLXIZcdO9jNRZ17HWSgV2hA0YxoYLnWQ7ZrKR1Q6Q3Qx5zmjZTYwUnr7uInUQz3q4EBIezEuae1SDjY3bQ7VPxqFSxBPTzY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com; spf=pass smtp.mailfrom=duagon.com; dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b=qzhB7d+o; arc=fail smtp.client-ip=40.107.168.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duagon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dvM1JqU3nW1ua1vqD693Ltmns7KiJ/5awV+3uGiG1F8iXpYfONVQzJ/20XHJNNlyHpii5g7SDDO43HL1eBAqsI4FwtHI+TUwZ/GWApLjPlBA3tVqPcBHNTiGm4tzeg/s9I0bdJDqt5qwUjTNiXyt2D3xvtSYW+MbztTpX6mGtWRzGOSeoqqbYvQVTHme2dDP+u5JdUXo2wVG2wxZVHZ+XPQ2+vVvhIXpVjVQy+oofOogR3TsuMv7EI8DiWyjWZJRVnQBb3lcfzq8CdY0rkRRZmBWAPAIGJn3sNhvHA5hUFwdY8T0XoHlk5bt4EonzcReXQsFJ+r4jmq5HYwhyDPaLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1YKnHhnQLcaPcBtTBkG16KxyYLlWG9FbIWoYNxSGwY=;
 b=jgU/q2VSqIwU0UqawIvivpb2LULe59Xel51ol4ev4fotAe+Bkw7qprHo8CxMq52ILvzj7xI+j+u9iKhawtYkoDpp/3MS3ywfO62zhr26TZs2EBFCT01aMelQR/DST30sawm+ZQwbXcriFDoUNmOTeOBQP+OZxBADVJYvGiAjD8utL8S1ggvBWA0ZaxFK3LyaNe+EBnImPjU5WThURp4KYAA8HzAy9nlmtsEesJxI8P19RT8YvN16pPOQyE/jmaS0cFcmQLIUadHs9RfzacNYR/AOUptTLoZJcOgKabp4iVl2pg4Kqr0MrSSiSiA2/Uaa26CNdZzd+QSffM+SRXAfKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.85.31) smtp.rcpttodomain=chromium.org smtp.mailfrom=duagon.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=duagon.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/1YKnHhnQLcaPcBtTBkG16KxyYLlWG9FbIWoYNxSGwY=;
 b=qzhB7d+oxwtAXPA9iKDR4E8cXVHTgYj/1SgCvpjQM5wIPR/Fa+EqzPuO7qdKtwwuX1ud6uhlSJAEEJ+GJJXI3VcLlqPPJY4SjyLcDA6ezKtyMxEu0A5DXM24B41Cb4DJezEjMtP2E3MzkDGs+aMOnvkMEYBqH571kHkE6pxkI8c=
Received: from DUZPR01CA0266.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::29) by GV1PPF214E34064.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:718::205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 16:07:56 +0000
Received: from DU2PEPF00028D13.eurprd03.prod.outlook.com
 (2603:10a6:10:4b9:cafe::c4) by DUZPR01CA0266.outlook.office365.com
 (2603:10a6:10:4b9::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 16:07:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.85.31)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 40.93.85.31 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.85.31; helo=ZRZP278CU001.outbound.protection.outlook.com;
 pr=C
Received: from hz-deliver02.de.seppmail.cloud (162.55.72.218) by
 DU2PEPF00028D13.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Mon, 1 Dec 2025 16:07:55 +0000
Received: from hz-glue06.de.seppmail.cloud (unknown [10.11.0.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-deliver02.de.seppmail.cloud (Postfix) with ESMTPS id 4dKphp5sqxz1145;
	Mon,  1 Dec 2025 17:07:54 +0100 (CET)
Received: from hz-glue06.de.seppmail.cloud (unknown [172.18.0.6])
	by hz-glue06.de.seppmail.cloud (Postfix) with SMTP id 4dKphp5Skwz1vcL;
	Mon,  1 Dec 2025 17:07:54 +0100 (CET)
X-SEPP-Suspect: 2e77f255a50247fb87f1824fc7caf9c7
Received: from hz-scan06.de.seppmail.cloud (unknown [10.11.0.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by hz-glue04.de.seppmail.cloud (Postfix) with ESMTPS id 4dKphp43V1z2318;
	Mon,  1 Dec 2025 17:07:54 +0100 (CET)
Received: from hz-scan06 (localhost [127.0.0.1])
	by hz-scan06.de.seppmail.cloud (Postfix) with SMTP id 4dKphp3ZXRz1krR;
	Mon, 01 Dec 2025 17:07:54 +0100 (CET)
Received: from hz-m365gate04.de.seppmail.cloud (unknown [10.11.0.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-scan06.de.seppmail.cloud (Postfix) with ESMTPS;
	Mon, 01 Dec 2025 17:07:53 +0100 (CET)
Received: from ZRZP278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazlp17011031.outbound.protection.outlook.com [40.93.85.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by hz-m365gate04.de.seppmail.cloud (Postfix) with ESMTPS id 4dKphm0kt4z1w8v;
	Mon,  1 Dec 2025 17:07:51 +0100 (CET)
Received: from AS4P190CA0013.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::15)
 by GV0P278MB1549.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:66::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 16:07:49 +0000
Received: from AMS1EPF00000043.eurprd04.prod.outlook.com
 (2603:10a6:20b:5de:cafe::b4) by AS4P190CA0013.outlook.office365.com
 (2603:10a6:20b:5de::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 16:07:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.79.220.33)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 20.79.220.33 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.79.220.33; helo=de1-emailsignatures-cloud.codetwo.com; pr=C
Received: from de1-emailsignatures-cloud.codetwo.com (20.79.220.33) by
 AMS1EPF00000043.mail.protection.outlook.com (10.167.16.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 16:07:48 +0000
Received: from GVAP278CU002.outbound.protection.outlook.com (40.93.86.6) by de1-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Mon, 01 Dec 2025 16:07:47 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=duagon.com;
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:34::6) by
 GV0P278MB1214.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:5d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Mon, 1 Dec 2025 16:07:46 +0000
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::39da:49d1:7c23:953e]) by ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::39da:49d1:7c23:953e%7]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 16:07:46 +0000
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
Subject: [PATCH v2 1/1] mcb: Add missing modpost build support
Date: Mon, 1 Dec 2025 17:07:20 +0100
Message-ID: <20251201160720.28580-2-dev-josejavier.rodriguez@duagon.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251201160720.28580-1-dev-josejavier.rodriguez@duagon.com>
References: <20251201160720.28580-1-dev-josejavier.rodriguez@duagon.com>
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
	ZR0P278MB0523:EE_|GV0P278MB1214:EE_|AMS1EPF00000043:EE_|GV0P278MB1549:EE_|DU2PEPF00028D13:EE_|GV1PPF214E34064:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e29d83e-afe4-4536-37b0-08de30f3c9dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?lzb3BQZjTCKKH8Fc8isOEmNpta37+Re+gtEEvvNFO9BaymLYypiu6NwxPdos?=
 =?us-ascii?Q?HmZ2YRTKHfILNBjkZ5urXgUegBXzPbv+wOYggJ7yY8wfVTh1AtcuxHYjPm6S?=
 =?us-ascii?Q?1LpOA7YBlZpvVjXVqWITHvMj2J7k0abBsismU/y8NO2cklKZb83SEZHQacwc?=
 =?us-ascii?Q?P6nZtpVv6Zd7DbRqqgko4PF8kPdf91kB1BpkG4sAzCGX0hBLx2GC3Pzl8mlv?=
 =?us-ascii?Q?V8bKke0Bzp2IFMhw/bDCD0VIbNRhf5OSQc8iZiP92nGNJfN/NxJXriKFWcOa?=
 =?us-ascii?Q?xNFYgVFtKZumzsGRNOm7gY+ZZpYjQ4Npz9IaPKcjKvVMwVr/lAYPeZcPg+8k?=
 =?us-ascii?Q?/RrSKijThfL2nY0oXmSvbX4+rhHcbGLXIjSyDdmrwE0MWR17JIZHh9QjCijH?=
 =?us-ascii?Q?7za6t0Vlcxre18kN+PQEZVfXplRwzCtSgYpRS7ilfoE2/0gsrOsUDuxJaIk7?=
 =?us-ascii?Q?1YyC7gduYrWlFHnHhbEfCiRnsZOEQzs3B+luK8SGUHWd/WL0xJjozv6KWIb+?=
 =?us-ascii?Q?Mzjh4/gFzUQ90+g4t1YGFPfCDy9FCselui1EGMoeP4OOiOmGYsaMdNM4SsWS?=
 =?us-ascii?Q?ru1Qz/77+1pTYkgnEvtztIiHSWn06Z9DeVi9/0KhFTQdEdjGZ4q3im+sdnrl?=
 =?us-ascii?Q?2GSBuckjAnnRBODTZFrv+Lnr/xPUmOE1uHtePGT+yLbH9s5o96bdxLuAc+k1?=
 =?us-ascii?Q?bsN+2B+cbn/mvm6sr4t0xJigL9zT09VnWKcpL2yZfnjqHOi7OID5PDdNOX/w?=
 =?us-ascii?Q?Jjl2DHFrJD86bePpLqJitw4kJv4Tg0658J/336oPTLzmpHRZbwMxSyxK88h1?=
 =?us-ascii?Q?kcEvhhfwrWXG2lmc47oe/Ci0XDng2GW9v6NE/Tv0PqOwx7roJEIdncq3H8cc?=
 =?us-ascii?Q?WaGva8rHhENHrDdUNkLV9pD94vglcfCI/1fq80g+YSG6UTcX8gXlrI2UHubQ?=
 =?us-ascii?Q?dcszXYFMdpLojZE2qmkIOBowb/+SLRSbg1potfn53HxOBEazaVwpHRsPbNY5?=
 =?us-ascii?Q?2xgol6VhEOy3WSsA6Jmmap5iqr6DFNJYT81B0aGWAryB0mqDyepNVSpNeXep?=
 =?us-ascii?Q?UH2k9qfV8CqUld6TfsZoU9QTqLRFFPA6X3AW26uxiKYBlJfvG+P9KNmuWsp/?=
 =?us-ascii?Q?h0DH73WMjaihs/7fCSYo3SFXEAt5fUAifTSQ7N2hIFIBVT1jBeGHYTy32sSU?=
 =?us-ascii?Q?MeuBmF9I86STrq1dEfUI9zjS69zGM4lg3HPAjyoabNKq6qUnGOdwkqpLy/wz?=
 =?us-ascii?Q?KV3eZ3nwEUIMGLpZu8pXYN2ExinMJ0M8i4nPZuQo0YPAMbuChMohinHfzSIh?=
 =?us-ascii?Q?VULNI/Y52OeSFZTOSwQCjTvbTXTworJRB3PcauGcy5lcJJnwokcnAW8qytOx?=
 =?us-ascii?Q?bzDh9EtWh+4W28Ocmpv+XDNTT4YwgdM0HR98HePc0g7gq+7B9XRItq7g/XFI?=
 =?us-ascii?Q?gTy7d6lUlPhrUYf2nE85rRveG5hACWOeVtj8k770VV999lD9jcF0Jp7GfwIK?=
 =?us-ascii?Q?cdHqNZBt/ei6Mv2xlQfEXsKfGhcfLqeYtlqV2lxc1ned/gNMXoIzGR9rQA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB1214
X-CodeTwo-MessageID: d102f2c4-4527-43a3-b4d3-0012b024223e.20251201160747@de1-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 1
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000043.eurprd04.prod.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
 03d95098-d17a-44fd-26d6-08de30f3c417
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|36860700013|376014|1800799024|35042699022|82310400026|14060799003|921020;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?lKwdLmF5/LoeB98I61KEge32Lr/BHc5Y/BKd4xRB10bXDkO2JOd29Y7ocu9J?=
 =?us-ascii?Q?DPpome6IZSZqERnScm4zpzKyZtSPnuAKCwXtnam0kr1r/Lar0zGXszLIKLYp?=
 =?us-ascii?Q?oled/C/yUs6JCvjF50N3dtyts7IvS7jYJs6TWZf+Sfr0H+QTubvu0BwH4PvC?=
 =?us-ascii?Q?1bU/1Ssq9jHqwPKtCxwytbi0uSNSlMxyK13hNtxjaJIW72RsQcxTEy2a5LBQ?=
 =?us-ascii?Q?i98BKnmtn8Jl65a2+Pykjo1gGdJMWViAt8rxpNLWKghaQ6bCbJmJWI/Kx3ot?=
 =?us-ascii?Q?j1xw7Ub/Yd2EMxTqBxrGUWoUginBgSr2S/OZ5FzUf3sY5h2XRxLEf0FpFtNq?=
 =?us-ascii?Q?GS+Vp2JeyW4xy1puZAqMR9x2/bbiCmBXcHTgr7gE+AalIcAWxtwTWRwRDxgO?=
 =?us-ascii?Q?ODZkaaszWAglFJ9rcmxPKD2cvjsTwJup15gPq1nMkH3rGqjbFXnHMIjtrWou?=
 =?us-ascii?Q?ohjx51yXLLf8BWLaMScuj0ANX7FC+E3lIFwLun88D2PNd/2diBPmtSxm1du7?=
 =?us-ascii?Q?IlLd6EGoNPAPiDiZLlDMCKOHbQoRlVDiscCiY0M3UNRZKegm2hddk92Hx/Kw?=
 =?us-ascii?Q?XFNX20GBQZFZRpNdgcKFuPfo6pu5f+qr9v1LWAdQh5iF9NCJTmHj5H7YBn+I?=
 =?us-ascii?Q?kcLiatX1+jp1fAulCozzHMAdedW4WBtHoRRTZd6ToPH2dsbUE5gXKgqjrNRn?=
 =?us-ascii?Q?eMxewWVs/WGD9cFan2a79DEoeRBrG1GOV1c2kYizAVAWooTkg/qHwmWRdIUk?=
 =?us-ascii?Q?XPw3QfySYTxcHPXP8+VrbSDF3k+bxyTePW8McPJ871ZP/mT6lgWA4VrGtoxt?=
 =?us-ascii?Q?KQxbYCU3gzCfo8017Oxz+b9BzDhZS8TEbe2+owp6lkUgnfeobaxpQOPAE7Fk?=
 =?us-ascii?Q?un4T3Kee0o8txlLa3QfdFt4imtcb3axOXeugWTWdssUWOUcyy8P9QunPq7cC?=
 =?us-ascii?Q?PEIIM3t1dj/cT7EIPtki4TEEwowshxT6CQ1h0MAKeSvZyEUQF1ntAhDH4Thv?=
 =?us-ascii?Q?0hL1gHEmcN+1H7C0QafvtrMU2qhGj7su+95UTHjxYuEImrQeBTpPTOtsfC9m?=
 =?us-ascii?Q?Zeh+63YK4tOkOX+KOgGpkFm9EBAgE+o6hFa/SLSxo20Mf9w6ds9N1rG+nsHi?=
 =?us-ascii?Q?9PN/96WCt9irPsEaw9RluTWe6JHdtmXlndId3mysYqa7WYTCOyRUU2F5nDh0?=
 =?us-ascii?Q?0VZvpewqZuhHTEstQCoTvGzeNX6G48Ss+Brajq11NL3+StZk0xW6yjoVQDz9?=
 =?us-ascii?Q?xD8AkJ7HfNRBwltZSfrP0jhlcnt7EWlx6quDkiiprdheFk11N3TeGD+TeiGR?=
 =?us-ascii?Q?E//eGLUiwxZSvtXrcKFVZUVlk7FmQ5RHyeWlU0klmRIXr7gHzzstxrMNnmCz?=
 =?us-ascii?Q?Ngur4IWOdNy94Xa9ztdWR3qZkPXb2zlWQ3fSWxkjRxgzpmblafc6NhSP9a62?=
 =?us-ascii?Q?bRfnoDylCnQISNRljgATkzOl7WL8PdAZ1ywl6UtloQ74lbltn4moLg9kJco4?=
 =?us-ascii?Q?UXIhdJQ3wk3SmsYnUXSK2wYQ9n1MuYyFDP5i7pzTnzLXQsv+ZFnyRMcsvZnP?=
 =?us-ascii?Q?J7sCzzmD5UXnHe6KZezwbxhQBy4w2vt164CxtvyN?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:20.79.220.33;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:de1-emailsignatures-cloud.codetwo.com;PTR:de1-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(376014)(1800799024)(35042699022)(82310400026)(14060799003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB1549
X-SEPP-CCCVersion: 2025-11-05T14:36:24+01:00 6c313bee
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.85.31];domain=ZRZP278CU001.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.85.31];domain=ZRZP278CU001.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D13.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e2417d24-ed22-45e3-0971-08de30f3c5b8
X-SM-ruleversion: 2.1.0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|156008|82310400026|36860700013|35042699022|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AzqYSkTjHFt3LP55VODYSmOkhn2DVq6C24mC/zhMcnw9N9+t3acu8s+BIPZO?=
 =?us-ascii?Q?FLgEmYYPwtMXBe4YqvHDIbjFqvVNfvgsQjw614AY767q/2+I5MIvFjFSovGE?=
 =?us-ascii?Q?5z/pg+jodKHFWNyi/mCMWeYoX7PotArqqRHloyq1qNASnHQN1qBk4YBjcLfN?=
 =?us-ascii?Q?y2tpc/6BmlxM/e3EUAa508HgiMimwAHnp2vYcJ9zXT+62571Bn320VzvmQRr?=
 =?us-ascii?Q?Y9JYtEW6nyGrj0k3KtQUIMiM7/SqStWS3Yk2IF0aFNJ1Y38vMZLD5YwTkjiP?=
 =?us-ascii?Q?F8IEk/ap8gPD34MHg1lI4RV4n7+JaxEyd4bLobrbfdx7FjC85xyCXvJzearE?=
 =?us-ascii?Q?eFM0TR1OBVi0d6V5refh0Kh4YSGbF6M5OMx+GZn5xqciOMZyY+nt8nrJTuu5?=
 =?us-ascii?Q?t3uFNHUFUUtt2LLlXwk0Ly5cCoA3wygHo7fIXY92MdVdU1Dv30CY42QAAa2P?=
 =?us-ascii?Q?t1/dyZl6TFQVqmbMjEFlp4KuydxY0pCarWayuQkwqYvQYWkKekXf23Fz1cBb?=
 =?us-ascii?Q?5U/Zt00CaMo+BwaC45PURuNl8sbpGqDhQN1hM93RqtGZXzE3mHolUxSU+Whc?=
 =?us-ascii?Q?4F8vIBFBPUZ+5TeLCY8xYzJTGNbG15Hnv4b2R5RimH3/tw6wS7BXj0x/FWyV?=
 =?us-ascii?Q?TDKTVWRGONdMAOsrnkU5X7zrq7JVCurn8ALpprXnNAfMfyrSRrMeNZnOPnO0?=
 =?us-ascii?Q?fKo9qaeTB2P/Ye/6gtwXPSHoCZA9sDZe7J49wstOoV/bZrnH/a1ABAWGhaAQ?=
 =?us-ascii?Q?2ZNA/VHWYEfRaV++RYkSqVyOQZRk4TSZcohA4mVbIDSTyJHhPQCJ8P/OUzYr?=
 =?us-ascii?Q?HuM250jscxDi0gYgSsK11tEKtKGXdI4mCmsaw6e+0rTJWsGr3ZkRTQ94pL4n?=
 =?us-ascii?Q?1sB+2C8YzbCtPAb1MrANykcicNcyK9NJ8I4/eWkWclfS5k4C3xmS/NbNJcuY?=
 =?us-ascii?Q?XoLYVFRpL2JX7qyAD9UdwGrxYMC/T67f89iNj6LWnZuLeG0nIzLIAK9I/vl8?=
 =?us-ascii?Q?VODhufz4YlepcErQgfuh1MvsgiGZsS6/1LxTxos9flG6+fTdrK9jdYFmYSxR?=
 =?us-ascii?Q?hnGSXJHamkv/uoyRMPN13jXzTQvdgF/G4S9M0mAcJ1/vxEEdbkh7R4CXK1Fz?=
 =?us-ascii?Q?KRn9DpFLJkESGqJ8ByvL3DkiczaTYcIGeKoBcKLzrMnJ9NtKqQzrpSc=3D?=
X-Forefront-Antispam-Report:
	CIP:162.55.72.218;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRZP278CU001.outbound.protection.outlook.com;PTR:mail-switzerlandnorthazlp17011031.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(156008)(82310400026)(36860700013)(35042699022)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1102;
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 16:07:55.3719
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e29d83e-afe4-4536-37b0-08de30f3c9dc
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[162.55.72.218];Helo=[hz-deliver02.de.seppmail.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D13.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PPF214E34064

mcb bus is not prepared to autoload client drivers with the data defined on
the drivers' MODULE_DEVICE_TABLE. modpost cannot access to mcb_table_id
inside MODULE_DEVICE_TABLE so the data declared inside is ignored.

Add modpost build support for accessing to the mcb_table_id coded on device
drivers' MODULE_DEVICE_TABLE.

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

