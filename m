Return-Path: <linux-kbuild+bounces-9931-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 17451C98B4D
	for <lists+linux-kbuild@lfdr.de>; Mon, 01 Dec 2025 19:26:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 922BB344393
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Dec 2025 18:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871D0337BA1;
	Mon,  1 Dec 2025 18:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b="jZ3LSWZo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from ZRAP278CU002.outbound.protection.outlook.com (mail-switzerlandnorthazon11020093.outbound.protection.outlook.com [52.101.186.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3784337B93;
	Mon,  1 Dec 2025 18:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.186.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764613607; cv=fail; b=ojvQoaWNI/uHPQ7v1v48PYCZPm+LAdXf79gzEGbH5Fh/N7YkuNTyBG7EL6jBGutbipSqaLbn8gHIj0FGCNf7jNtUyAkysPXUWWbgsVaaCm68g2TzvyF3iu4fJIO9dFDkReo3LKOhJWSSb2ha7/01hPL1u63pqR7i/q4mf8Fhb34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764613607; c=relaxed/simple;
	bh=OLb7s2jzAHkNhHxp5MCs9WuDav80dgWpGYCfAcbvGsw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lFaZxS4oDFJzu2iLhYGtKUV7yWS53GJI6o8aGg4uQwyfpC0gvmRl9xxfpE3CTtdvcWJs0a8kZNklxgetJeWMPV4TlMmwbLaeIueDoKbyxgIlYh92IwqxeHkA0qpsT0DTWcKxOX7Vq1sVm33IBfEteetLkk3biIsFiL6WEBh7UHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com; spf=pass smtp.mailfrom=duagon.com; dkim=pass (1024-bit key) header.d=duagon.com header.i=@duagon.com header.b=jZ3LSWZo; arc=fail smtp.client-ip=52.101.186.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=duagon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=duagon.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yGrEjHjIf+glF5ibx0LRNW/3KJG0XyiRaImyxpNMrFteM1wnCWhfQQZlTfVkAN9V/RbEIGo+lwKtr33LJadFeO0stliCHoUG2LlWvqBJpTDpyAuFUMP0XWpU0RViXmokzXgWNJK+RcRR6UUYE3rSlwfdr3dolKvhVIzaSL9CJv4wHqvv1fGyfDxWs3t/WeXEdEx520SB0bG/2xP82frv4v+255UUvrcFOPz6fEexwZSkUx8VLygFPKrx6QvC/914rP7Qs8RBeqtG7c0ItpXxx9567i9nSX5EeFw3jduEwcWiSQosSMuviCZWQ6NZq2z/ziybDRMlKWLVNke0xQWu4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DVpays01eYymfy0TaeicSkz8PF6S1sgal81f2Dig9mE=;
 b=mLVDFeerdxOeK0PtLl9mkdWOb5KSI7ZWcZcEiNe7iejXSkMy4P+KDMpuYNHxJ1o2UgMd2W9FINyY5rR5Crng5zVT8vPpDXvB61ZS43BrWf7sZOROKuCfpfFt4NJFHNzGxBXpL9REi4IccKLgLy2i8CrTaqoLxAL4ztam3sLr5AtbpJHedq07Ntbjvn1Cv0Jglf1fjsPH8cvoqolcL38AvFauO0YbaBO2zNbyE8e3uGbFJdV+EG9wq2OM1UaarfHn3ApA2tx485Nle04hwewGWkrW7N3DPKoraiTcvgQoUZ+iob927jTBRr77OG2YiOBTIVhEBmLsANvaSo0Asnwhgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.93.85.5) smtp.rcpttodomain=chromium.org smtp.mailfrom=duagon.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=duagon.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DVpays01eYymfy0TaeicSkz8PF6S1sgal81f2Dig9mE=;
 b=jZ3LSWZozvSTqEZsrrKz0qUoDXshyYqFpcIX3qjpNr484SWQBd5Knb3+S9Pq+mk7ddVcFU9AVqkcYhVF4HlM2OSC6fw9xyxuDPzHQKpuqRKSu5xZIlgdaMCTqaiBOPn3vEB+8/zTSd99fGqbTm9b9DE6kwUKqGcLnBZhtytlMG4=
Received: from DUZPR01CA0097.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::10) by ZR0P278MB0076.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 18:26:40 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:4bb:cafe::63) by DUZPR01CA0097.outlook.office365.com
 (2603:10a6:10:4bb::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 18:26:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.93.85.5)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 40.93.85.5 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.93.85.5; helo=ZRAP278CU002.outbound.protection.outlook.com; pr=C
Received: from hz-deliver01.de.seppmail.cloud (2a01:4f8:a0:900b::219) by
 DB1PEPF000509FD.mail.protection.outlook.com (2603:10a6:18:3::6d7) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Mon, 1 Dec 2025 18:26:40 +0000
Received: from hz-glue03.de.seppmail.cloud (unknown [10.11.0.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-deliver01.de.seppmail.cloud (Postfix) with ESMTPS id 4dKsmv46vnz4wrt;
	Mon,  1 Dec 2025 19:26:39 +0100 (CET)
Received: from hz-glue03.de.seppmail.cloud (unknown [172.18.0.3])
	by hz-glue03.de.seppmail.cloud (Postfix) with SMTP id 4dKsmv3XVZz1xZr;
	Mon,  1 Dec 2025 19:26:39 +0100 (CET)
X-SEPP-Suspect: 466b26bb19e149d59a0d80abcf58fbb5
Received: from hz-scan09.de.seppmail.cloud (unknown [10.11.0.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by hz-glue03.de.seppmail.cloud (Postfix) with ESMTPS id 4dKsmv2fGNz1xZ9;
	Mon,  1 Dec 2025 19:26:39 +0100 (CET)
Received: from hz-scan09 (localhost [127.0.0.1])
	by hz-scan09.de.seppmail.cloud (Postfix) with SMTP id 4dKsmv201hz197W;
	Mon, 01 Dec 2025 19:26:39 +0100 (CET)
Received: from hz-m365gate01.de.seppmail.cloud (unknown [10.11.0.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hz-scan09.de.seppmail.cloud (Postfix) with ESMTPS;
	Mon, 01 Dec 2025 19:26:38 +0100 (CET)
Received: from ZRAP278CU002.outbound.protection.outlook.com (mail-switzerlandnorthazlp17010005.outbound.protection.outlook.com [40.93.85.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (not verified))
	by hz-m365gate01.de.seppmail.cloud (Postfix) with ESMTPS id 4dKsmq5jK9z2sp2;
	Mon,  1 Dec 2025 19:26:35 +0100 (CET)
Received: from DB8PR04CA0012.eurprd04.prod.outlook.com (2603:10a6:10:110::22)
 by GV0P278MB2091.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:6f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 18:26:32 +0000
Received: from DU2PEPF00028D02.eurprd03.prod.outlook.com
 (2603:10a6:10:110:cafe::23) by DB8PR04CA0012.outlook.office365.com
 (2603:10a6:10:110::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 18:26:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.79.220.33)
 smtp.mailfrom=duagon.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 20.79.220.33 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.79.220.33; helo=de1-emailsignatures-cloud.codetwo.com; pr=C
Received: from de1-emailsignatures-cloud.codetwo.com (20.79.220.33) by
 DU2PEPF00028D02.mail.protection.outlook.com (10.167.242.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Mon, 1 Dec 2025 18:26:31 +0000
Received: from ZR1P278CU001.outbound.protection.outlook.com (40.93.85.53) by de1-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Mon, 01 Dec 2025 18:26:30 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=duagon.com;
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:34::6) by
 ZR2P278MB1146.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:5f::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Mon, 1 Dec 2025 18:26:28 +0000
Received: from ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::39da:49d1:7c23:953e]) by ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 ([fe80::39da:49d1:7c23:953e%7]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 18:26:28 +0000
Date: Mon, 1 Dec 2025 19:26:21 +0100
From: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
CC: andy@kernel.org, krzk@kernel.org, linus.walleij@linaro.org,
	nathan@kernel.org, nsc@kernel.org, gregkh@linuxfoundation.org,
	bleung@chromium.org, heikki.krogerus@linux.intel.com,
	abhishekpandit@chromium.org, masahiroy@kernel.org,
	legion@kernel.org, hughd@google.com, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/1] mcb: Add modpost support for processing
 MODULE_DEVICE_TABLE
Message-ID: <aS3dzQ2AUq_TsHsE@MNI-190>
References: <20251201160720.28580-1-dev-josejavier.rodriguez@duagon.com>
 <aS3YvQMhbmnYiZrm@smile.fi.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aS3YvQMhbmnYiZrm@smile.fi.intel.com>
X-ClientProxiedBy: MA4P292CA0004.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::10) To ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:34::6)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR0P278MB0523:EE_|ZR2P278MB1146:EE_|DU2PEPF00028D02:EE_|GV0P278MB2091:EE_|DB1PEPF000509FD:EE_|ZR0P278MB0076:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d91f5cd-1805-45fe-9fce-08de31072bd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?43JqK/PeIWdl9hQYshj/Jvq4uDHMOnYF+dPxJanB5CMqRmrj/2+DBW2WmQdA?=
 =?us-ascii?Q?aS7ux314Q2mqabwvWE4AySYv5+hYYYDvJ194BbIj+JPauwsgZ1u38PCOSNt+?=
 =?us-ascii?Q?eyy4SgT+fBIXgeHYQry8oe3MqGm/ONDKm1PBCTW2GVJOyQWJnpmcgu5VEL1E?=
 =?us-ascii?Q?+YEygwS8zmvsbIeOeYxdO77ax2WB716DVnRtYyxjdvEyxtWBhXCHfTznGHBO?=
 =?us-ascii?Q?CZ8wY1zcE8tPsxzWfvW2j1z8I6h97XW4wdOXkryMDcfoT+Ac0ZSowwUUULZX?=
 =?us-ascii?Q?wVWUdJPEpWzJd8aSx/3S7aaqNGpe1qy2rzcyAsvw03tUhjXbhHP49IJKccU4?=
 =?us-ascii?Q?yKlEy/SK/4VP05frbTJKT1BYbBg5m514nVVFRef99MkrKXew8fBqsU/A5gLp?=
 =?us-ascii?Q?wTWX/GC56FmhwxEqMrYVxO6FiiF93Kwms+NdeTpM84qnksNsvkcc5C8hTCKs?=
 =?us-ascii?Q?98J8jwo0SZW5mBId3zhblDxCsdt4gKLWobJ/51bINLEHva5UVYnBJndl+g9Z?=
 =?us-ascii?Q?IUiUZb+qF87KwwDaIP5Jp7DrhTD0Z5MHeRPw3fP/GyvGJ4+6PUMy/JqLj8Q2?=
 =?us-ascii?Q?WurrZZerRgGkWdQI/IvBn9aa2itkYFWxdEHs/yu5YmOq1TWDUPSNj/DE0NAb?=
 =?us-ascii?Q?xfFXEgQoQZqGykkOfcbeRMRE8jxsVKjb7NqYnVFDmA5VnKJh4WxxY08DRTHu?=
 =?us-ascii?Q?Cf8itGlE/LXi0R0cOQ02X5k077ruD2Ljsykx+//HhcpAgSj5fgHk5yZ7W9qk?=
 =?us-ascii?Q?cvM5SQFEUcdXEPLyiqAiiPqQNVsSNjH5xZVJIaWaPDQv2KMvNCeF88qkH+Gy?=
 =?us-ascii?Q?F0vWpKRXu4gZcXo+KG/YuvlygHxA1uZNEf7izoZd9QjVSURkVKgvF3bduXKQ?=
 =?us-ascii?Q?eiLctEIS4a3B/rs6hSb366Wl9Y9aKtRrerazg6mTqjN/vGCFQIalg+Rrfhp2?=
 =?us-ascii?Q?PvFYRca/11hJsUPYKq3ciw/1x1fx598jAHUl8pZT4hNNbrQ1WjITQkmFa2JJ?=
 =?us-ascii?Q?4G2j3ij+T4B2lAMlH0S4DoYL8YbILdjV1bQgDRBder2eQXoj5D+/w61dZGx1?=
 =?us-ascii?Q?cXeTDBOYPhyFLvOR1aUZtuRtxB5Wsfwm6fa0fmXK1aqqpPjYEl+gDiSAJyJm?=
 =?us-ascii?Q?A9HwN6QaCBLWh0jzXcBrW8HBH3Oz11JE6RtooIqXirD6tR5cVzKaz2iSOatE?=
 =?us-ascii?Q?WU+cVh9U1R1LW9moL+cmL7lN/K3kTlEvBVwsj5bsSL65OoWOtFs+j2my77/b?=
 =?us-ascii?Q?UZ4zc91q1FdCKX2Qz4b9Z22OAjaR+QI6BJtmPX2HKiXG5JupExXSaHdWb2uM?=
 =?us-ascii?Q?8IMMB7an+nFoyecX0cbvf4nIpvZi6SzTKmUL4ykh/iJ0/9CwDCb1bUYpL2H1?=
 =?us-ascii?Q?2A5bp3EyQLRmqXdCUR5oulMU73DYH3fgEhnAYsQqmEVSUHZHG+MMFdVLSUk0?=
 =?us-ascii?Q?5bTHV3taNbPYyNQs12/xm+wmlVgSlBNMPVjNJ/PiN7ALrXfiCLmF7lmeqfc8?=
 =?us-ascii?Q?UZF2LZWM69PEvD9dF5DH+OYY40nFV985//Dx?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0523.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR2P278MB1146
X-CodeTwo-MessageID: df094273-3300-4bd4-9104-7433267b7ce1.20251201182630@de1-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 1
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
 f4ed8eae-fc57-42a7-f599-08de3107244c
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|36860700013|376014|1800799024|35042699022|82310400026|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?tPqCvjK8TEYYoqyF65D4bg+qEH4ThYTxrCoxdw9cVoCuDI0XFF/ohYpFb18J?=
 =?us-ascii?Q?cnxAR1NEG3/ZXJunRUkFMaDcZgjGZuEUxVS+YSgxrsj8RY59nc3j1Tx6nyZw?=
 =?us-ascii?Q?es3UAPEW69Jz6EdSuu4GUu9XJHJMRPnZhipyG5gWKT/r1WwXQb1CYc5/vNO7?=
 =?us-ascii?Q?nb+lfkVU3WU0jpSmffhQhK6PvcToGQneSUwoxgivv62MzzxNhNULIvSPZU59?=
 =?us-ascii?Q?DDIXvob02NfhMPFnBLNgNtTAZQxWeQjWW9ZqAniknytjem3zDDUeHUNA8jYf?=
 =?us-ascii?Q?fHt1Ly2mzz9xoP+neqOMKOdw6Tj/gabEHORsGH/yGcIjDIZ59K0kFMw16cdc?=
 =?us-ascii?Q?J2J+xa7m91eyKZXKV1WT0K+JeYH0teafmsWT7BGwRYbHsCflSaxnifDtGJsO?=
 =?us-ascii?Q?RVXNST2Y2uH+/fZINTqV7j8u5t0IQ3yVuLNUjzPhe8NJVsnZ9Rdsmn/5D1Us?=
 =?us-ascii?Q?6VvkQVfm6r0rnMoaSfeO025nn+MMFpYbIrApLd89C780te+ezhHmqGou3Inz?=
 =?us-ascii?Q?ndQH+o/iagX68d8gaLL6+2C/+UpraxPP5EAwcx3GbikQ5gifGy/IV1BYKSDn?=
 =?us-ascii?Q?dhXSjjMk6cEuIftGWy/gc4Zt8IZOzfWC6AthXRBS1Csm7ZUMSCNBzI/4O1tw?=
 =?us-ascii?Q?uwx0zgbvUXvjIKoDou0ed3NPVstWiOcjzStXJybC9OQFXpHz+gVBDrQVJjwv?=
 =?us-ascii?Q?FjtkLZF4Z+6q/QHGveB3pmzDsHQBZ23+Dn8eVB7Ph4rNM0l3rNRXgW0YQnP2?=
 =?us-ascii?Q?lOfkCvTI4gj3WCxAuKv15D/6xguM0e9HfKWvD6eFyiCiftu5hU1GVlRfy5Aj?=
 =?us-ascii?Q?fGm9wON4vhO8B9lBgQdvXaYGV0KKNSeR8t7HVOaxgnblb5XhyzXGLrOkZIwc?=
 =?us-ascii?Q?1ec/YiD8x6lWfJqfv48PMr7zPFENvZS8kL1qDX0x1Ah6cgkdzu1AKV0QfKvK?=
 =?us-ascii?Q?hKM/JXI3LUG8CT++C40UBuvVc5bwcXH+us7oHOGy6gpayK9bnEc2re0aeHRW?=
 =?us-ascii?Q?/vIGZeNy5QizF2zdpcO1wXIU+6DKrW+gVI7k9YlRk6075khQhPNVkj4D6JpL?=
 =?us-ascii?Q?HtzqIhBspj5/J+P9NYlPdOyZNtjY5g/u1OR+JZ1KwaaBLgwIZQPan9jsrsM9?=
 =?us-ascii?Q?U9xUJIVKv6dxhS+OZRrlTNngVTHZywwRCK1xVjxU24qUGWpBIjAhbd3XP1cP?=
 =?us-ascii?Q?/mQiDxZvcu1Nfqa+Hy3NAndRIIVjopYMx2UE5jTf4nc5ILHTq5k3I0Wm7BbS?=
 =?us-ascii?Q?nmg50ZluOipBD6cmw7alM7AIoLTl2Hb6iwojNeesJ7UDexzyLFTpnXBxuu31?=
 =?us-ascii?Q?w+LuRYpkvzwC2ICEub0QmflfMzXnUEW3I7NtrUhSPgYOIbwx66dPLmJdCzbE?=
 =?us-ascii?Q?JRxMHIOqpBcGc7ffFdeCUxh1kWDhuucPqhla/mxz+pNPqbrG0aay29KGWltq?=
 =?us-ascii?Q?wPOF47DyO/QqrNWWvlxFggYQUnpQyk5kqIts2qjoeIsJlMDkBZMyRazAWumU?=
 =?us-ascii?Q?/iPcJ7foMtxBOX5ypNeORQA6RQRlE2FAfVV4XhfyKPUbDjLZFIFNqR7RAY3w?=
 =?us-ascii?Q?nDltd3pB1HeILkETHNo=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:20.79.220.33;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:de1-emailsignatures-cloud.codetwo.com;PTR:de1-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(376014)(1800799024)(35042699022)(82310400026)(14060799003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB2091
X-SEPP-CCCVersion: 2025-11-05T14:36:24+01:00 6c313bee
X-MS-Exchange-SkipListedInternetSender:
 ip=[40.93.85.5];domain=ZRAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-ExternalOriginalInternetSender:
 ip=[40.93.85.5];domain=ZRAP278CU002.outbound.protection.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	af7e67d5-95d4-4e5e-1ab6-08de310726ba
X-SM-ruleversion: 2.1.0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024|10070799003|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MSr3MMSKuKGH+Qu82dOWUvOSQ2fWXaEQ5HgEpHw7oBYTp35Dmi770dikMpWS?=
 =?us-ascii?Q?c5sasoY2JBTg1NrciwCcOnKtUkp/7rBSwN+U7Xx7n96qybXi3hYcQa0YZFEo?=
 =?us-ascii?Q?vOSKK0QiSH3z9OZxfMhWRkUGvws+5hrR9zouv+ODfj93q/QT8m0tI1+1GtTr?=
 =?us-ascii?Q?xcIqfpEgZhxDb9QE4NdK6rRGAk09Ub23xZ+JRDMHGAgaLFXphd8q2zvlaX9u?=
 =?us-ascii?Q?vLJxrg6EhNX9Av2bYUrMOqljYrEeYSNAXe/6qiU1hluXllzZTN8VarLaULaI?=
 =?us-ascii?Q?rYcGpRVqa5j3IYNY88sw0JgrO5gcO0QzgteW315+fGE4EjR0RmXZsfi32/LB?=
 =?us-ascii?Q?iLhwxCjextqxB46x4LUMFtHil5u/4hWwtxo07aBS8lkQwJvPjIz6cZKhGiWf?=
 =?us-ascii?Q?4g5QXS78+8mdSD7OtfuQWvstTTHq16IKb53QWQ1WcuCGQq4B6+NZnNUDi8ba?=
 =?us-ascii?Q?96c0F+yJOpMAWGdKWBKH4fjcXeSTn8fZi926NoacUCUVNepzvtQE2d8QDqtn?=
 =?us-ascii?Q?RvqSO27WvsdPx0czEc6cFo7Gk9bIQoNl+fEQglCy3xedePzkQfcvfgfoSMDS?=
 =?us-ascii?Q?kdp61TjOCf7pGjHOjAJNoBBvfhXTcTjxXnbxmJKsC0HEwN8OsDqLU2Zoxwam?=
 =?us-ascii?Q?/lOcoJ9zQRkwegbkUKtAGv0jNlNxINFGQbfNGuISizbNiSc8cUbBfEMX4aQ0?=
 =?us-ascii?Q?z3myPnDbvTKWxBNoAExmpYBLafBR03BbYFa1lkv/bgK66j2aq15CUjwt/FPd?=
 =?us-ascii?Q?wVNqcQRI2Rk4bFOOlz9Jcw+6c97UgYkiAGFwgrhuPRuetjmEtxEc4KYwKln1?=
 =?us-ascii?Q?a9UyGrGgovP14ZytKL3Q0pZOJIBNdr1Yj/Nxu8raeSpH5pJswsLDZPQxsnEf?=
 =?us-ascii?Q?paGW4ThX2pdhgaPBWNrTOfAMNixGh/KXOe43EgCk3BiGQiqHIhztlIf4jDRC?=
 =?us-ascii?Q?8JBr2eFW+lGXwAju0BAy3rI23Xc+O5wdtdWhk1OpHgKasDBHADd8H0rVXNNb?=
 =?us-ascii?Q?KYJccHLE+PhrJZlnog5WJKg1F3hHK7VqAatenDcq2ksFJ9QcENfW+uazJSTf?=
 =?us-ascii?Q?PzjNbQyzZ6QTHvi6zXl0v3IlRYDiTDPYoYg53ndoPQbFvYSUbpZB1ix9lhhy?=
 =?us-ascii?Q?cyLOgsvG0wtb?=
X-Forefront-Antispam-Report:
	CIP:2a01:4f8:a0:900b::219;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278CU002.outbound.protection.outlook.com;PTR:mail-switzerlandnorthazlp17010005.outbound.protection.outlook.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024)(10070799003)(35042699022);DIR:OUT;SFP:1102;
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 18:26:40.1824
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d91f5cd-1805-45fe-9fce-08de31072bd4
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[2a01:4f8:a0:900b::219];Helo=[hz-deliver01.de.seppmail.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0076

On Mon, Dec 01, 2025 at 08:04:45PM +0200, Andy Shevchenko wrote:
> On Mon, Dec 01, 2025 at 05:07:19PM +0100, Jose Javier Rodriguez Barbarin wrote:
> > During the process of update of one of the device drivers that are part of
> > mcb bus (gpio-menz127.c), Krzysztof from GPIO subsystem asked me
> > why I was adding new MODULE_ALIAS when I also added the same new
> > information on MODULE_DEVICE_TABLE.
> > 
> > You can find the messages here:
> > 
> > https://lore.kernel.org/linux-gpio/80a20b13-7c6a-4483-9741-568424f957ef@kernel.org/
> > 
> > After a deeper analysis, I came across that the mcb_table_id defined inside
> > MODULE_DEVICE_TABLE on all device drivers was being ignored as modpost was
> > not processing the mcb MODULE_DEVICE_TABLE entries. For this reason, former
> > contributors were using MODULE_ALIAS for enabling mcb to autoload the
> > device drivers.
> > 
> > My proposal with these changes is to complete the mcb bus by adding
> > modpost support for processing mcb MODULE_DEVICE_TABLE.
> > 
> > Once this patch is merged, I will send patches one by one for removing
> > MODULE_ALIAS from all device drivers as they are no longer needed
> > (as Andy Shevchenko suggested in v1 review).
> 
> Not sure if we need a cover letter for a single change, but yes, this
> what I think the best approach and code wise it's fine to me:
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> 
> (but we still need a Fixes tag I assume).

Yes, I also though that a cover letter for a single patch could be a bit
useless but I wanted to explain myself the changes from v1 to v2.

I think now I understood why I should include the fixes tag in the
commit message. Let me send v3 with fixes tag and without a cover letter.

Best regards,

Javier R.

> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

