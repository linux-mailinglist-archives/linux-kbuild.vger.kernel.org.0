Return-Path: <linux-kbuild+bounces-10639-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6E5D397EC
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 17:30:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D962300C6F5
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 16:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F802248B3;
	Sun, 18 Jan 2026 16:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WKu+KqrX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010029.outbound.protection.outlook.com [52.101.84.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A61821A453;
	Sun, 18 Jan 2026 16:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768753735; cv=fail; b=lL3fuLgZgRa3sGxuiS5vTnJBz+mijnn72YgL7xxvkfv+nVrEfStpmX6Up6UH2C7d6cnp+rNru1fVxsab0e8ajhvuBIK3uLrZcTu8iyCbSyNERjCcbhJYsGZCNfXdOfge7AHw2JQAG00HIMsbq2dOBvIp/vCPNjPiCc0HJ1dK3Yg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768753735; c=relaxed/simple;
	bh=oSI8rxV92A6YE2nxE1kAsoz0DgmIhyzWgTe+5tKoOXs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=gGvfuAIRhtGJ2x21lKiYI1sY/ApSxUhJzPnV4W1qhrTo5LPasE3NqKWm07JSqXR44Vb4hDSujkxai9vhgnmiHVpnXJ56hlJnoPXJUY454st1b+08V82ME7kdh/jr1yilR4u5qMiA6uHWkWLfDBy2R1XxSn+2BtpXCU6latffpmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WKu+KqrX; arc=fail smtp.client-ip=52.101.84.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WjijM6RyTVdLRf+d05B2dpwIQaQjWlV7JFc1Ssb7nY8n0GCmA/B51e8faxj9FQOuOMSnWTK4ChcFTVxxcADeBNIqsWwLxYsMHC7JVS9bL622b/FREKeJ9Vox8y3E90kkoTZtyIKNuAgwR6qAawz4frtadAVe2t2b4plTgQ4VK/pmAXzqHEb4l8YyszvHwAV0p+7Dm5C6T6P/k6pSn/Lkmef9rJaPM7U4YDiWVROz/xHLDGlzXKhhDg3zOCHljV6iQzLIUUdpPrhkmd6tdzX+2WJH2LeNcjwVOX+7J++szWXf/UCWFvEfZOu1XWNuZCEk0MmkiE4P75uCC4Q3rawXwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RYuZbzh88WYCydGA8wZA1/SEin1B6wF2FKN2yxSzuMU=;
 b=VRlxEs4Qs1ZLQNfIjN90xGiMvcSzO8HAwaespHp/fbjUehDT0zCKZEdattP2CWQMSZiaKSVfuh2ynrsYWISqwQKu7y+GZDWp4vp3XKwIb5xZkPCisSJ+uazvboPi/UW9dtz55KI583R5UTjHyubRRTn1vFeFRbJdWLIc5pSv8jLxLpV+/oDBPWH/QVRrHSShnprM9UseZbU6g7f63XO5uP9zdDfUWtH8zm+23T1xHM8hp7pS44zkb8fcJAi33g3vHg8cfWjg+IAkEPEjOWXbrlE9Fbq4he+An/NmNmTTaGAaLIq9ljkGJAvzXSPFyY3DDaPgEg9e8Sqn3teHyts0zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYuZbzh88WYCydGA8wZA1/SEin1B6wF2FKN2yxSzuMU=;
 b=WKu+KqrX13KpQYLLMUs7OwDfCP8LK7BnVOL9tjYbQu6nGVP4XoTkCa/aaMlC6Kc33wsfhUNLAXGcOdzDKahiqWyo/jvBdbCu3oW2Yud73RKiGNY/zhJJTyN31zgYMu8zcVRTboqptph/jvgkoEtT/MewWIv0aQtdcBqT8KBMJzsi2RNQhIr7uXnl3yCB5OZovg8oHTHykQEOWPHyT+NPBaC5hBckgdLFUEXu8R6ELnDhktHy4tNlPG6V+HtGD2GNnju2OPLWo3jNmSQnUYkZVzIjaai5LFa5aksS8oDBv3/A1BZoTg8FtZC1L4lJw8lrzAa4MD/lalUchA4Vp+3Msw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS5PR04MB11348.eurprd04.prod.outlook.com (2603:10a6:20b:6ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Sun, 18 Jan
 2026 16:28:38 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.006; Sun, 18 Jan 2026
 16:28:38 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Sun, 18 Jan 2026 11:28:01 -0500
Subject: [PATCH v3 4/9] arm64: dts: imx8mm: add wakeup-source for usb phy
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-misc_dts-v3-4-d3564716cbf6@nxp.com>
References: <20260118-misc_dts-v3-0-d3564716cbf6@nxp.com>
In-Reply-To: <20260118-misc_dts-v3-0-d3564716cbf6@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Li Jun <jun.li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768753702; l=987;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=NFxSw/nP/882cYIiBrgLrNoZRI4WXxZPhzC77WN0kLg=;
 b=waUZduBpAb+e234qUG5kixz5hsOe6lvLw1P9IZ+em+eEJMQezrIEnVWQAJ6HJfUzeLQddFYRt
 YuHZtH6MdmRAatgwvEGz4qCKCNAzP+RhVEjHSLVFpQppmVOCT3DbTXb
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P220CA0158.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::34) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AS5PR04MB11348:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cc9ae3c-3638-494d-add9-08de56aea276
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZVlBS25jc0F4S1A4U09EaGlNdDM3cFBjL0VpVnFXVUZPcDZUUG1MQ2VVc1dC?=
 =?utf-8?B?MS9SMll5Tnk2Wjc0a3c1MTFpbjhWVGRhb1hJcTJiZG40MGM1cnJTUHBINEx2?=
 =?utf-8?B?aklYOXA2VDJtR1RmQUd6SWxHZmNyb0JzTXNHTldVWHFqeHpVeVRBWHN1NzhD?=
 =?utf-8?B?RlFNZHplejkrbFN1RS9FOHpsT3V0SEpha3ZhckpBR2JCZ1VpaWxSL2h5cUJn?=
 =?utf-8?B?anRTWlBNT3o2VHJRTlVGYWtiT204a1hZRWFONCt2VW9oRm1VRUh3N2dmVmVC?=
 =?utf-8?B?VjIwc3ZNVEF1Yzl4dkdCYjgwY3grUWdsQjlwUys1R0xxeW5lbFZja2E0VGpL?=
 =?utf-8?B?OFgrdkFtUWNQYjZxYzNqU2x3MG1JSFNNRlFYTU5yTXUvbXRkYTA1MVVSemd2?=
 =?utf-8?B?KzNUVUQ0MlBvSDdzQmN3c3dJbGx3WVA4Q29zQkRVQmJjaTZYS2ZQbjZrZnpr?=
 =?utf-8?B?WHVvZnZmMWJjcDdjQis0b0pQSEhzNmdzMjRyWDR6T1BkRkw0SENBbFh3Sm0w?=
 =?utf-8?B?WE1YdG5oRGVOdGtJUVRjRWQ3NnR5ZnZEUjRHenpiU1RQc2pxaXN5RFkza1hy?=
 =?utf-8?B?YmlZTmlQdVdpYVFVV3cyMngzOTdDd0FpMElYaGdKU0FEdC9CTnNMT3JlVDIw?=
 =?utf-8?B?eEpESjdnRjBqTVMvVVUxaUhZekd5a3JTbXQvY2JpNms5cmF2UWRQNlpLaFph?=
 =?utf-8?B?M3JSTmcwRk9PMHdIMStkdnJETkwwWHlSSjNzN3BwamVSNE5PcUh4a3RWNTFP?=
 =?utf-8?B?ZEJDT3REeXh4M1hUSi9jL1RwVlIyS0pORW5SWUM2ZFFmWlAzdmJRb24zT044?=
 =?utf-8?B?UVo2WEYwR25yZzYreXRwOGZUUmVtRmcvOWw3emlZZGNlYllDUmh1OVRqVlZN?=
 =?utf-8?B?NnlxRmF2dVZJYmN2WjNxVDMvTW11QmUybUoydDdSdHhqNFF6UHprRlo4QmFQ?=
 =?utf-8?B?bUwrQXQ1VFl1S1cvUHM5Y0xKbEd5MnhLWm1qNmRFUUN3SE9UTmZIZmZTL3hP?=
 =?utf-8?B?Ri96Z1ZtMXNUSy9ranhHNHZtc2UxSTBja1FKV3FNNXBmSklWR3hOVE5QNUJR?=
 =?utf-8?B?a3RhVFcyeGVMTjRCam1hRXU0TkdEallOdEtpMmRSOHRMZ3NWVVhJQ3lpejlC?=
 =?utf-8?B?ZzRGWm0vMUhPanhObnk1VDYvbFdCSWEwYmpBb0k5d1hiMUpUNlNvQUs0cFJQ?=
 =?utf-8?B?S3ZtU3dvd21hWVMxYitwZVV3Mjhxc2Y2S1dmZ3RaWGt6bmhtUXZyQ3BNR2JZ?=
 =?utf-8?B?czdTZUhBWGgxdTR3WUM1ZXlRMHhYK2ZUUWJmT1orSEZsNnNxazlkcVNLYmtV?=
 =?utf-8?B?VjRqS3NnS0FTWkszeXJFbE42YlZUVjVKZXJqQ1dPMCtES2RDQUlWaVBkelBz?=
 =?utf-8?B?Uitackc2WkJaV0RnUlhBVmNSQnhKdkNHMGRwYmppZU9iL29aai8yTVhLODVV?=
 =?utf-8?B?SlgyaHpWSUh5WGpvRStUQXhub0NaRkIrZHFCTFl1MlBYaFVRWDUwZGloOXdE?=
 =?utf-8?B?VjE2cXlQMTd2N09YZnFRU3lHQXFYTm9saEpuOUtSb05UZko5c1pHbG5oRzVM?=
 =?utf-8?B?V0lUaVFUNmg1K0YzM3p6L3AwYjdoc0RJanNlb3I1ZjdxbElvdExCWEJ2d0V4?=
 =?utf-8?B?WW9zcExST2lBVm1DWDd3TVRFUHJpVG1uY2pqMkl6YlN4SUoySkZMNHUvMDgr?=
 =?utf-8?B?T1dwWVVFc2JrblBFb0ZQTlpuUUIxV2xWQ09zRkhQRGNwQ2s2Q0ZmdXZZUVhq?=
 =?utf-8?B?bWM5djNVYm8zblgxZEZ5a00rV2hMb2FOVm53eFpTR01pV3N0QjBKSlN0ZGRQ?=
 =?utf-8?B?VU4ySzk2R1ZuUmpTWExDVXIxQnpIeSt4a3BoSmhFbUVUV1ZZbld0L1hheUJM?=
 =?utf-8?B?NVk0cFltTGEweEN4Zm9PdUFpWDlsbGFRMmJCcUhrTXl2U3ByZWRBa1ZqM0xP?=
 =?utf-8?B?dnBKclRtS1dIM0sxRDVhL3JqemplWGlOeUhQallkZzdSYjdxZm5laFBZNktT?=
 =?utf-8?B?Ynp5VHVwa1c0ZHEzRnpRZkNMeU9kWnV6UTM4cytuT000NTdRS1BKYzAwNWlE?=
 =?utf-8?B?bDZsWlRmcno3ZFJlK0J1UUlicUl3dXhsK2NHa1VyMk9aV1FvOG9rVmZwQ0h4?=
 =?utf-8?B?MVZxaUozOGpHak1xRUUwOEFMWFRVaFZKTWZWMDN2YUJqajRpeWhCeXk4TVhW?=
 =?utf-8?Q?nhsyBYDmJ6cFOQsl8AuYn4s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTltbTdyU0FQZ2N6c1pPcDM4VHdSTkxUU3kzbVUxN1VRdGMybHNrME1XYS9G?=
 =?utf-8?B?RHJKWmg1RWVCL0V4QTlxQ1c1MnQxMWRGbW5iWGNwVWJhcVcrYTlXVC9xYkZO?=
 =?utf-8?B?c1RWUFErMjZVRTNieHI2ZzgvTkZtNVVOd1NDNWhyV1RKV1FIZm94TDhaa2pj?=
 =?utf-8?B?N1pBNk91Q0hIOWE2ZUhuQkdkOUFXbkcwaVAwdkRWMTN4ZWRsZ3RnKytGRVN2?=
 =?utf-8?B?aWJ4My91UHd5Vkk5RU1YYllsa09obWIwODBBQllDREFiaXFQZVNmNmVjSDc2?=
 =?utf-8?B?dHJkM0FRY3NhTDYzNTh3bk5wcENJVXBQRHc4ZmU2bTc1K0IyelNXczRMbUp1?=
 =?utf-8?B?THRPbUl1Y1Fwcyt5azRZYlNubXZsTjR4STVyUFo5Ujl2QkIvbXBhbkZ4UEtO?=
 =?utf-8?B?eFBBMlhZcU03eTBNRzZkZHZYK0hTOVpxanpGQjhjZk9JYXZHMWNpUWZXck5m?=
 =?utf-8?B?WVhIZHN0a3RxTzNYK2U0WTA5MkJnbFFraGFlOEYvSXg1eGVtWXpiYUNKai8v?=
 =?utf-8?B?UGtNTHlrUWgwek4zVkFseE5VWno0YVhjemdyZGZuRnZIbGR1QWJWQk5WUS9T?=
 =?utf-8?B?Qm44L0hnK3ZKM3hSZVJ0SFJFTml5WG1JSUxSOHYvVnppTTVxdC9sS2VKOWs1?=
 =?utf-8?B?dDNMaGtyV1BZN3N2KzlMdlVhVkE3OEU2Y1Z3RXNmQzk4cmpncnkxbXFqNjMz?=
 =?utf-8?B?RitSQUhSWVpGeks5cUM0ZktFN21ZeXppVFNJb2xXai9ZSkVuUW9LeGwzVDNG?=
 =?utf-8?B?bXdpZmhoaWlaSWlrakwxR2krRk9RWG1sdHloWmNnUEREcCtqUHpMME9lSXRo?=
 =?utf-8?B?azB1OVNTNE0rU0hVT21vald5dkZwWmJqZFVwd25WVmxFOWx0RDkreXlwNEpo?=
 =?utf-8?B?VmZGeDFVeG1qNlZhR2t1UVFJdVZleVpSRnlWcUJiL2tqYk9lZE5zNGY4Ky9z?=
 =?utf-8?B?UUVJU3BWNk9najd4UExvRTZxaFNQTlYxN1dUalRPU0JneTRoRktrejAvblg5?=
 =?utf-8?B?eG9kcWZUZ0hXUEpWS01KWkppNW00Tm5lR0xyeERGOUFTRm1NMDQ3N1dsb2Nv?=
 =?utf-8?B?UDJSVUhWelpPRDl6OUdHV1hQbUhjMUUySFZMMlg4ZUhLdExFVmpyY2UwWjNT?=
 =?utf-8?B?ZHg2L0FZWGt1b2tOUkZnSzRhZ0luWk92QmpJMXlUV0cxQVlEYlZWNG1lcWpo?=
 =?utf-8?B?ZVQySXVnQ1oyY0FuZzM3aFMwZTV2UXhTejRvYk04RUVSQ3Qra05IVTRrUFJm?=
 =?utf-8?B?N1AwS2o5Z3dEZVBrcHA1WExpMWdCMlJlSGUrWmJKenh5STI5TW9xMW5UQzdQ?=
 =?utf-8?B?bi9LVnVHcHVGQ2NLNEwvU3V6RDJWNDhCWW5BcGVIWVR1NDc4WUtsa01LaXFK?=
 =?utf-8?B?by9MNU93K0REbERyMnVtYWVTcm5WdStpbVpPYVlzQTI0MUhieXorU1MzQ3h5?=
 =?utf-8?B?Yi9sR21CZXU0cXkvMUVuL1VxUmtCUzRya09mZFNvc3R0ZmNTdjcwcTZPMXFz?=
 =?utf-8?B?STUzcEhVSHQveU1lZVVIVVpoeW9LZXVKYmhqTFhVc2tQRndXblhnbFZSWUNo?=
 =?utf-8?B?WFNJbXlwZVMyYlpNcVBwMURnRHVONnUxNUF5Z3Q3YzZrM0hLUXhOcm80M1lm?=
 =?utf-8?B?bnBsWlRiam9Dd005Mm15QnZoeTd1K25rRTFoYzJFemxHRUVsRmxaQnRkVkFW?=
 =?utf-8?B?T3dSZ1BIQXJVYktZMDFCME5HSVVDZWdvWEtxb2R4VjdXN0JCT1pZYVFwZVVB?=
 =?utf-8?B?SzBkbWl5RjV1WWQrMDhDcFVLaWdEYndXSXl3UW5uM1M0WDA2MEltREgrdVpI?=
 =?utf-8?B?cmpJcWdObllBemhDRm1uWWNTbFB1aVlDTGpTY0FldDhsL3N5M0xOU281Y01D?=
 =?utf-8?B?Qlk3eExYRXhzRzFhYVVzaUloWE4xbTN4SFY4bjJiMkttNkx4N2xPQXc3aHZq?=
 =?utf-8?B?MG1jSUdIbHZrb2xYNm13TVBzR2hPSHF4dFF4RGl6WEFPU0VwMVpIenF2aEc5?=
 =?utf-8?B?ZGY5cUNKc2FoazJuWWQwdjFoRWk0SDlqKytpQ1IrYUExUVJvd0FDaFNyaWIy?=
 =?utf-8?B?MXREMlpGSXIxK0ZIY3o3c3JhMitSbmpDZVRJdjhKNEQ0RzM1bDI4ZnNzUE4x?=
 =?utf-8?B?emdZcmVWS1BqOHFXTlNpTXVtTU1PK21GZUgxazdKeXZMcjExdWlDZzBONFlt?=
 =?utf-8?B?UDR3c0tDWkRycHVrR2NyZTJtZzN5ZWhNbGxHQVZCTTc3cnA4TS9Rb2NXdGI1?=
 =?utf-8?B?WmQ2bXdta21ZcUoyS01MT3IyUCtlK1FldTRQb2wycEJXUHIxUzA5NHhhVDVL?=
 =?utf-8?Q?coIAlWUkGvbylIKVi5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cc9ae3c-3638-494d-add9-08de56aea276
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 16:28:38.4190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KBR+cyDXG5/1aVzKYg31xWew1rtTIdrSdPzQqSAeLdBfAaHeNfSEL2W76qLduVtz4QM8CoFMK//gGf8SennwPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11348

From: Li Jun <jun.li@nxp.com>

USB phy can be wakeup source to support wakeup system from USB.

Signed-off-by: Li Jun <jun.li@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index f2e1854f38a0a83927f19d0f8630a9d0e5f81aa1..4b662fd7753755f513c172ce30105d4447bd96d7 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -274,6 +274,7 @@ usbphynop1: usbphynop1 {
 		assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_100M>;
 		clock-names = "main_clk";
 		power-domains = <&pgc_otg1>;
+		wakeup-source;
 	};
 
 	usbphynop2: usbphynop2 {
@@ -284,6 +285,7 @@ usbphynop2: usbphynop2 {
 		assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_100M>;
 		clock-names = "main_clk";
 		power-domains = <&pgc_otg2>;
+		wakeup-source;
 	};
 
 	soc: soc@0 {

-- 
2.34.1


