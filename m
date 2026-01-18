Return-Path: <linux-kbuild+bounces-10627-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9354CD3927F
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 04:39:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9F0030318F4
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 03:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DAAB30BF77;
	Sun, 18 Jan 2026 03:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gdKG6fX9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010049.outbound.protection.outlook.com [52.101.69.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C9C30DD1F;
	Sun, 18 Jan 2026 03:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768707506; cv=fail; b=MFstxgKKyTYBfO5QaoG1BZWaIpVHbz48AZKHeeHBXdoKhVt+jDYW6M3SV+njISiPWQUnPUvX5chlvm6loCnvHArk1/DLFOmaudnkLO73xJv6ciyqmKniDWU8dCpRLhQ9rizwkAzrdLRcncDoJtESmVevK4sOFTvFYmOP+NW+Awo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768707506; c=relaxed/simple;
	bh=FuvXm18QEpP8eUO5qN8OMCzfyDpZaXBvkKmUHashOfU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Q8movd3k4EJ+oP5qSl/nfygRJoVXnbViypTz0K8SJPE6kUWw1VOV1Hg5uj0ZxkcNxwM08srAIV4xWjEN9zNWO9dOK9vQq3XrKp/o4TpouBQ5aRqfTWXPzlrMyqcZEG1thjsGr8j9G/VP9WjeHz5JO5w99kG5IXMUWtcf+tk9k4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gdKG6fX9; arc=fail smtp.client-ip=52.101.69.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PpWgvD5hm6cXcKcRGM5D44SgQgFXSgoMUo2oBsMSIUogs7X5+N+yN22RuQv0tfU0cKHep++XVtueqzVtyzUQxTiN1HCQIIh+r75gAvC7nhSqWyZbaSxYiuPJz9Rz3+79CIMVxxZKW3rduWbtGXks7xsO/AibzhHFnwBTdMvJcgH1y9NoOxLd/Qo4+XaWSlsN1EMLG9d3L2Py3R9lGy6z4Xin6Fs6CHwkkG3ntsi8GDRUAZU9ulzGeQutUhlWrMQ6blW+XSg1VZtRl57HKV57s+LRKLkUSdFhcFgofJ00XPn23cQ75BTv72OrfVgv/gaViQtwPkgQyvHgGPbT1g6x/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VPDF9W/lTkAoSDPj/8A7uCwJhkanwZjOFxX8Hju6zjA=;
 b=N2Q282PXaclUxTR5UNlEIetpVAGl8fwdDBrtDK74BBINFny7SrjKCluJgCjSJGnv69P16mApsxCNnn/NMqomS7WB74GF5mIMCbkDnaVOPcu5x9VTR46G6mqUXL7C/zf1kXeslBhaanLWQL79cD3RcVGDUM6D7xqaTR9k+m9EiwatoLJgVahIBgN6hTa8oviDrblFHwN+lc8tF6sEhcm6kwTA5UIMd3GdfWYMcZwDWeJ/WbJBF/LvL9jXAnK0XMFw271oe7+nBqp07lMG5zFqtQ8SSAS6j2fbyR2q3ST4sXv7HHJAXUF3C01+TTy9qhW6wNhf8yYGf1hrY/qFK3xE9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VPDF9W/lTkAoSDPj/8A7uCwJhkanwZjOFxX8Hju6zjA=;
 b=gdKG6fX9B/5rOKjlV5qz/OyJZ4/AP0od+q7+kcHFfqllZ67b5KHNQ8mflL6AMbnyx3VVYCBS9kmFFq/kXM3kVMp8ue6MH12AmDkDTYdr08THKBXteMHB4PjxOlwBRIjwXRf+IgPPTy88YEn0IWoUpxS6Jr+s0+YYGiGc7gLRbSvY1g/svgYuPFzPDRdx6skR5SjbJSo5rt2uJk5gLybhLSOiQgRVrVFv75CP2l9DSHbCleL4/PI+ZeCH4Y6Fcnb2rqqyXiiTViVDr5SCOPkN7TvIzTwL9+KW+18erc+/zuLnJrPjHAm8FA18A8w5iSy0El3droUmhyV0XewfQDLMVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GVXPR04MB10021.eurprd04.prod.outlook.com (2603:10a6:150:112::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Sun, 18 Jan
 2026 03:38:22 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Sun, 18 Jan 2026
 03:38:22 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Sat, 17 Jan 2026 22:37:37 -0500
Subject: [PATCH v2 3/9] arm64: dts: imx8mm-evk: add uart1 and bluetooth
 node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260117-misc_dts-v2-3-0f319c7e9b55@nxp.com>
References: <20260117-misc_dts-v2-0-0f319c7e9b55@nxp.com>
In-Reply-To: <20260117-misc_dts-v2-0-0f319c7e9b55@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Sherry Sun <sherry.sun@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768707488; l=1428;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Aakr2MDTWYDz4wEhoRuZyZDiRkC1stP/8vm1jDQCzjE=;
 b=JrMGfjrjkwpE7pbuNw0o5i2LervxURrgDEm3Badulda7gIJqzMuhy9Lm9lBIHEusujmmGteIf
 oHalanPdGYkDj8tnyqFZU0Sy3Y02i2A+eOWcHCS/0TQkqg8FR+FOgQs
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR02CA0033.namprd02.prod.outlook.com
 (2603:10b6:510:2da::6) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|GVXPR04MB10021:EE_
X-MS-Office365-Filtering-Correlation-Id: f09ccbd4-2adf-45c0-7ab4-08de56430765
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|19092799006|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cyt0M0VDMGYrZUlKYklONk13TGNZOTFKbU1RYlpzak9iSVc4RkJxUkRSbWwx?=
 =?utf-8?B?dW5RMDhoZ05ONmtmSGZnQW1VQ25oNUR4b0I1b2lMalhvaEViVnQwc2tMVVBz?=
 =?utf-8?B?LzRaV1pEQ3BiTmtNa1pLQWtjU0NZRDN2Y21hb1JlSWwwamFBYmJ6d3JXUDZ6?=
 =?utf-8?B?NlVuSjdhR29XNHNvTXBtalk3ZXd3ZG01dk5kYjZ5d0l2Wk5SRjNmK09tQm94?=
 =?utf-8?B?aVhWRGIxd0NtZ0hkaGxLVVY1SW4wKzZoaVIyYlFsa0JoT2xRRXVqV0NjNFlX?=
 =?utf-8?B?QkdRTGhjdkg3NGVKalVPR2kwVlJrZXRFamhyT01BeWtBMzlSOENOY0NPT1h3?=
 =?utf-8?B?OHFBbktaYmltc3p4amszWnkrOWNpRDJ1RWFtOCtGc0NYMklmL1gzZ3VWMEVx?=
 =?utf-8?B?bHJpbDhaNGt6WjFacE9pc2xjY1d3NVpkaUU1ZlhLbWlETmhFNTVGM2p1V0Vq?=
 =?utf-8?B?eDAzWFVLaUZ5ajRYSGRpU3MxWkFrRWNkNkZLWVVNckFidStFOVJRSlBiUG9a?=
 =?utf-8?B?U2pCb2tQR1FmaFNZbFVzOHZlbGhEbDdDaTZwemh4TU5LRkR4dXV5dFBiM2NV?=
 =?utf-8?B?TVJDYmdPYjgxUTUxOWkrdjFxS0xYSFYvSXJQb05BaDhDTDFHcHRXZEg3ZUhM?=
 =?utf-8?B?M25GWWRwd2ZSeWIxZTV1bzZ5d1BMOE5DdTRseG9ab3ZrU1FackNiQmtMcE9t?=
 =?utf-8?B?eGZxb1d3cm4reTQrLzd2d3V2c3hFdzVXUCtwMjcyYlZWQS93SG1iUDJ6b0FU?=
 =?utf-8?B?WW5OZlZmNWZoUGkvcVlWUHFHUUlOd3k4eWFoSWpadnpuRHUyZUx4U3VCTkw4?=
 =?utf-8?B?bEg4UzJSWTZ2L3gvNVAybnlTY1Q1UTdYK1ZLdmNLaldYQk9nRnJLZTRxb0VZ?=
 =?utf-8?B?N0FxQk5aK0hJbmc4M1l3WVMzOEQxRG5temZpM3lBSE4vNkpreG5VZ0dnNnJT?=
 =?utf-8?B?TlVwU2l0V3RHL1ZzMkZ0OXI4ZDZXZEg4NG5JTDRxWkJ3Rk5rUGJjZm9sdzJ6?=
 =?utf-8?B?YWZlMlh4NTI3Q2t0OEtSQWlabUtRSXBINWdNYUtkWDhITGtINko3M3R5bjg3?=
 =?utf-8?B?bURuZ0xoVXZkOVBtaWlqZExkc2RMemRvekx0T3JEcFE0aE04L0JtRFZiSGZY?=
 =?utf-8?B?SnVocFhoTmsvQnVTakxvSDdSb1R2UGhVOFpPZ0RETVU2MXVFMURzWkQyci8y?=
 =?utf-8?B?WnFEb0h6TUp3MXRlc2NnZGx4ZnB1SGloSFFLbGFWSWx6MHUyK0ZNVUcwRS9R?=
 =?utf-8?B?b0dLNm5oN1pldm1JSkJHaTN2cUc5eWZWMEJZUTdnRVhXcEgxL3FIS1BqK2Js?=
 =?utf-8?B?ZytIaGpQcFk4U09FZmNDRlVkY011eGFhOXgxbXIzSkRkTkllK3QyQnJRcEhy?=
 =?utf-8?B?d0FxRzA3Vmdjc1A3dm1LUHJLejZvRk9MTEszSXNJY1VhYmg0UUdtVGZCK0ZZ?=
 =?utf-8?B?NDhmZTV5eXgyMjAvZEw5TVRNdjdpZC92K0lZeVBQT0NrOG9VNHBXZU5xOWlK?=
 =?utf-8?B?UmhjSzZzNEJvd3BRQ3dPeTl0eHZjanZoZ0R3OWV4RlNpTlhMa0hPRFRoR1Iy?=
 =?utf-8?B?bFdaMkhDR1lWOFR4aUFxdGQ2MFpWelp4R2hDYTZPS3h5SENvWGZGU0RXL012?=
 =?utf-8?B?cDMyVy9OdXQ0VkUzeGl2OHhyanh3djRVelNCSzF0aEVtRkNudEpGVm80OWtY?=
 =?utf-8?B?YStjeGRvK1ZIZmhqMy8xL2N6Z09lZWQwRElQTm5jL0JsQ2F0VDU5aEUxZnFB?=
 =?utf-8?B?Z3hEbnpmZGZobkoreWdEQVZ1cjdYWVJ3MXVTNTRIUDBQT0hBVGZ5RUpQUnd5?=
 =?utf-8?B?b2h3NzdXYnlwb1hwc2hXNnlLbE14bUx6ZU5Kd1NveHFhVEtCb0dDTlhUckcy?=
 =?utf-8?B?YTlZN0xLTTYxK0diSStjbC8yam81c3RGUUM1ZVR1aTdCR3VNSExOMDZ1ak5p?=
 =?utf-8?B?TnZxZXBKaU5QZzRlSmxjK1AxazI2UStMZmJuTTMzamNzVmVUWWZIOEp1c1BD?=
 =?utf-8?B?a3FFRTE3OHJvVWU0Z1laTjZpRzJzVm54bGpERy90UDBYQ2Fac29lV0JqcnVo?=
 =?utf-8?B?ZHBnZUl1aVk2SFRkazF4N0trOE1lY1NwaExodWJUWTJYYjhnajdjbTZzVnVp?=
 =?utf-8?B?ZmZzSnhIMjc3dGV1RFJBMFYwS01XRWJ1SEx5dmYwRkZ6eCtScTJnc2gzRmdG?=
 =?utf-8?Q?FF/O7bBHVyjou6dkpTCzun4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(19092799006)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmtoTElNL08xYWVXejQySnFGQUl3NmF4bmNwR092dWVFYWc5TDFBdmZQWFRx?=
 =?utf-8?B?SVhtWWRqZ29qa2VNQzk5ZXFtb3NrdnV0UlpEd3JFWFA5Zk5JVlpCQ0ZmSnFk?=
 =?utf-8?B?Ymc2ak1Lb2xaWERuT1p3cklZQ3ErWkZDSDhjYlV0QWpHZUZ4UHYvZVlKZGcw?=
 =?utf-8?B?cHpPdW5oTHJsMUxya2JNam92ZksxeFZROHZxUkN2dUhDazYzS3VJRjhSRjFM?=
 =?utf-8?B?NUR0VGd0c3I3Nnlmb1ZsVHBEVndPZ3J5QTV5VThNQkNFQTViV3l2RmUvTHgw?=
 =?utf-8?B?dXlBR1IrSU5YTXBWTWZ3Zk04dkZDMDU1Zm1FWFE2OEozQ3NwSlBlVTZ5bjZJ?=
 =?utf-8?B?ZEFtWFcrcGh5VTNvL3dMalJiM1hMTWU3ckRvT1RhRWZnWmV0dmFKSU12dXpm?=
 =?utf-8?B?T1kvRXExYXcwNDcxVXU4RTVwRUR4TGFoTjcxTC9oS1BHVFZnT2NYeG41QmE1?=
 =?utf-8?B?cmZldUozUGIyK3dyenYrUEtjTitZUkhPeTNYaHN3Q0N3S2VyOFhYbVRsd3Jp?=
 =?utf-8?B?L3AzQmZsVk9YU2VYcDFCNnoxUDZzclI3T1ZnRlNoRmdhTC9aQk1Wb0NKcVox?=
 =?utf-8?B?RUNkRE5pTENCZit2NVMwY1h5dUQ3aGFOVDZud2Vsd1dyWitWbng5ZlVJWGlB?=
 =?utf-8?B?bjhwbzZvWHp5WUNtSGVkeCtnZFFmNTFFeUkxd0Y5ZG9DNE8vNHpMVllVS3Bw?=
 =?utf-8?B?dEd2NlM2M1dzQ2xYWUZlWUdWRTJZTVROQW5ZbGRSS0pWb05GZE9HNHlnNkxS?=
 =?utf-8?B?U0phbTFHaUdSUlp4Y0VpUTJOSmRqTHRtMXlIenRySU9hL1ppUkRqTDVzSytE?=
 =?utf-8?B?dUV0dmdzTi81dnBKMkNGQlk2U2hvWXhoR0NZOHRYQXdoekpyTmp4VzltU3lC?=
 =?utf-8?B?OU9WNklSQUpqelo3d1ZrSkZOV3J6eS9uUXpMZjhCVFh6NlJENVNHd2t4RE5Y?=
 =?utf-8?B?eExmYnBuVUpDM0NjQ1BubTRIMjY0REQySDB3WGJ2NXJzNVA3bVRUNE1qWTdo?=
 =?utf-8?B?SDhGbTA2dWJySXpKOVd2b3hOUGhwa1dNOG5RaEFIQ3hOY0s3Q2ZzNVM4OGlM?=
 =?utf-8?B?a1pWbFRMYVVOdFZoaEZURkF1OGl0c0l4N0NYZzNDQXhVUWJDUml1Z0NkU2Z3?=
 =?utf-8?B?TjEvU3hGaW5IZit1b3lUd3dYL1ZOVy9STXM4c1pXdjhkbU5IQ2tyM1NmS3hF?=
 =?utf-8?B?OXVTenBZWmtaa21UUkFsU25BWWQ1MzVDY0RKM3NCRVEvcGNkcmtGOTJxcTB4?=
 =?utf-8?B?VVVSVWJzeDl0RGR3ZmFaeGNXWENZNE1jNE5OSXRiemw3OWpkN3VUeFhmdHNP?=
 =?utf-8?B?eVVxcUNaa2kvbUY1Ylhra01seHFXMHZJN0Fod3ZjbEJqbGpLcFViWkU1YWNS?=
 =?utf-8?B?OSt5ZG15TkpBeGxTOWphVGVkUGRtNEozbFFVejd0djBPTWFoQ09rNGMzYlRo?=
 =?utf-8?B?cytzVE5ud0lWd3dKTTdLNm90eGtMVkZCVGlsTUVaQTU3ZUhabnhDc2dDcklT?=
 =?utf-8?B?TXVESGl5bmI1KzNnQkhoemNoaFY5RFZrRDdybzNkaURGSFZHcDdSbTErWVJT?=
 =?utf-8?B?Rm1ZVUdyQlV2V2hCejJNVkhxUEI3MDZ3VGttNGVvd1lJcDF3NmtMMHI4Sjli?=
 =?utf-8?B?anhRY2VVazJHNXhBSitFYkw1SnpSaWZTeThmN1R6WDd5cUdqOEdhRXdGK094?=
 =?utf-8?B?WllUeDZGRm85VVBub0RhWTBsZUM2WGdRWlZ1UGFMU0g3dTVoeG5CSkNMUHR3?=
 =?utf-8?B?b2d1UkFkblhPTktMVzJsY3RUVkwrT2NSRUlXUGNxTm1oTXJMbWM1ZE00UDk1?=
 =?utf-8?B?YnMvZmpaSW1pVnZSL3kzM1NpQkFIYWsvQkFjcDhieHFCZXp1cWVyK1FzZU5S?=
 =?utf-8?B?TXdXWFh0T0VwUlNESXhid0hGQ0xFdW0vSEN1eTI3VE5weEdWUGVYVWZYS2p5?=
 =?utf-8?B?T2ZkR0wxYWt5VXp4OG1yTWFYQ2RSLzdmZGRGSFBQZ1JNSU85YVhvTTRUbGJW?=
 =?utf-8?B?aEo2djJCbnJ1RDg2Uzd1cU9neldlcTVWblVaSGpxYW9xSVlUbHc2SXBpUzFi?=
 =?utf-8?B?SHJJQVQ1UjRZTmtkL1ExTWREdjJIUWZic3RlbkRaYTBqZmJhZTY0eXNGc0hr?=
 =?utf-8?B?d050TytNK3JZbFcrZ2FUZFZPd3NLQWFDN1FEQWZndERFK1I4OG40WUJKTkZR?=
 =?utf-8?B?WGdYMk1uQU5HTlBHSzRPc0Eza0FRbGdhK2NNc0ZEMk5Cc1IxSE4weFVxVVhs?=
 =?utf-8?B?VnkxdGZ1TFZjR2o4QnkvT0EwbTYzc0pwVXhMWXA4WDBaRW9VK0V3K283dkda?=
 =?utf-8?Q?HjM3ZR0s5aAfI/pxQY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f09ccbd4-2adf-45c0-7ab4-08de56430765
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 03:38:22.1212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CS4R2rlEAYb4Uifs1P4hZ4mdi4eyW1wlKOrZkFGkxq9I5lnd2uLNlQB9l6aox9ehE/N083ywQSS1eyCUqYLpRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10021

From: Sherry Sun <sherry.sun@nxp.com>

Add uart1 and bluetooth node.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
index f58d849a8709485424d811f32f565590f2eb3f52..30b13b4d630f8b8b0531fad531081d4ee32849f9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
@@ -608,6 +608,19 @@ &spdif1 {
 	status = "okay";
 };
 
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	assigned-clocks = <&clk IMX8MM_CLK_UART1>;
+	assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_80M>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
 &uart2 { /* console */
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2>;
@@ -790,6 +803,15 @@ MX8MM_IOMUXC_SD1_STROBE_GPIO2_IO11	0x159
 		>;
 	};
 
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART1_RXD_UART1_DCE_RX	0x140
+			MX8MM_IOMUXC_UART1_TXD_UART1_DCE_TX	0x140
+			MX8MM_IOMUXC_UART3_RXD_UART1_DCE_CTS_B	0x140
+			MX8MM_IOMUXC_UART3_TXD_UART1_DCE_RTS_B	0x140
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_UART2_RXD_UART2_DCE_RX	0x140

-- 
2.34.1


