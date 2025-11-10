Return-Path: <linux-kbuild+bounces-9535-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B869C4950C
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 21:55:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D929E3AE982
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 20:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95CC62F549F;
	Mon, 10 Nov 2025 20:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ffPctXxs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013013.outbound.protection.outlook.com [52.101.72.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652E02F5339;
	Mon, 10 Nov 2025 20:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762808112; cv=fail; b=QaDgq4smoKPBHc6KiHDFqbSDxdDTAXvyYHwrKVyaBYCcOA4vU+/SxdAU8TWSARy4fbWED+PXGWr0LSNXuM/y30qFEoDL/Y4dSS+TrmFTD4bQHh2DzJpBoYPv/w78kzdG6KHqHyQ4+n+7KBRv6aSmvSHjJPP/zG4TCM7MWVODgag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762808112; c=relaxed/simple;
	bh=aC62yHQQn+CX57sXi3jmPArO6WG1ryTq4g4leRKeTDY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=QDeeHAe9CpyxLnoY5cGs+ls0X7h1CUK2XZfAZbPVy6RPFg+mka+6JvOUdhknP7+qlY1x+xTih0ElJhVx1+bPFcmeKHZfydHdtLY2nIfDUlv1Ciiekdzgso0oSfjii/OYnbLwoRR1CRdtvC+4IHm+wkb3+0Fd6B3QTxry1Zrmuqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ffPctXxs; arc=fail smtp.client-ip=52.101.72.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vdYe7oTAzHl6C31Cx5PTaNAZj+FcShandsUh2GUqTkBk48SP2dI8L6NpdJj3IDJGaV57DuJH9kjHF6viGTxTjlePWA6t9lkXlzQwIRWlGDm5CxLnqyBtBn4iDEW90ftDYd4ql/GLVDxEqWBmYqTL4M8ljYtzq/eXK6XZrfAGP57aRUb7bYvtBwe+S7pvXN6Mp04w9G1PTVm06KdxK1s3BqcWlzelJqB16/H6gP7mL/2FkrJIOavsQuRbZMcTLaD/tKodvozK37cHBGSnyrDpcRJfm3Yg/mxyjzcRbmoDe2P26jDm+ebef6zO4pCHjCL1zadOUMVXbjO+tJO9mVHEmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=frXE8lYB0tXQVFNO5eiyb3YpkTMmUAVvOQZbqY20d1g=;
 b=HsYz03aqYoVlfC0FHUlz/s/Dhq7xh7Aynk91atBG9fLAuoLC1Bi+fbbWR/h1wQmToHFH+gDapq7zpPTtX1rvqguQUOYUnRfA7teP8Yv3l0Z5lCbDOKMuJV0NWSoWidFK8cdaX9NUPk1SSJ7538T63q7jPNDpklkEqyVo0R7ygq3BsaUGX8LP+U8VlkOm0y5iSpRiZleL0o8S/TA+lr8XGO54n6tLZrBr4WkxrL48vRktbnupq8Aq4/y9/EsGCcKPUV6EP48MQVEV2h1yqgb+PlxcwrnbGmCN3al7aE0eUslc1776ilCYCGkXmPsEDk8clTp4C7AXx8/Wcss5xFqj8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=frXE8lYB0tXQVFNO5eiyb3YpkTMmUAVvOQZbqY20d1g=;
 b=ffPctXxs6UApGyglv0tMzNEXVf5uDQDAdti5k6+q4LtGdZx62/8FBdtcK+ochy/tmQ2YUJhLKb35PKMqLWZXMQ8sE12CbfyRKJfAIv9diUjW0jH+wq1LrHutfJiEeAzj1LlqQ/Oe2hJhfiK+n5mWykdpfglxiQehyKsNcTB144+z1Hyt5HM8sZAP7RJ4qP5X/7U1NiNReFcqZ1iRYztMksfaSyNVzZFx5jTQPHyf1E5uiCFUfzpSNTFhWoKdLFFhUBVkjm1mi7LVkRb/0X1GMsX64I82fJgBfJuVlw4gnpX0Ph0YOqNBtnj/Ux89nOsIDDOMkBngtQigaXeWFYnXGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB9075.eurprd04.prod.outlook.com (2603:10a6:102:229::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Mon, 10 Nov
 2025 20:55:05 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 20:55:05 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 10 Nov 2025 15:54:41 -0500
Subject: [PATCH 1/9] arm64: dts: imx8mm-evk: replace space with tab
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-misc_dts-v1-1-7564b9f69a18@nxp.com>
References: <20251110-misc_dts-v1-0-7564b9f69a18@nxp.com>
In-Reply-To: <20251110-misc_dts-v1-0-7564b9f69a18@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762808097; l=2939;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=aC62yHQQn+CX57sXi3jmPArO6WG1ryTq4g4leRKeTDY=;
 b=LG64yHW0KOSLWReSo67eeu4AK0pjpaUpHiH9M9B2VsQzQQ/Lk7rrjeEyPYdHve988C1J14LH2
 RiynZuFBuR7AQMZ9yzOQoM5RQeLH3XFFJ0xaSIXGA6wqGXMQ2OG0/jm
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY3PR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::21) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PAXPR04MB9075:EE_
X-MS-Office365-Filtering-Correlation-Id: 546fd4b4-1f5b-4c87-d7df-08de209b6d0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Um9wdXRiV2U0MkpTaktZQ3N1STdDM2hWNjJjZVVYU0dkWnJWUEI1bGNaRFZt?=
 =?utf-8?B?T0FEWHUrOWpTcUs1MU9LenNyUXhYeG1UQ25ldVFZZzVRWG9LVGJETHlnV1Ra?=
 =?utf-8?B?VzhjSFFtZTg5alNiQU5UWXBkRGszQVNwbW5yZWRsY2FMMzFqakRhVUlrUXFY?=
 =?utf-8?B?RGVrSGtGa1IwTnRGcXNjejh6M3lpelNWdlNPRUp4dkZnWUwyQXB0ei9Xd2pG?=
 =?utf-8?B?SVBsTzNKRS95c0lDc3poRXd0WEl0N1k1RUxCY0g0aEVWNDhGeFNzdzJ2K1la?=
 =?utf-8?B?RHFuakV5WUp1WFN6Zng5dnAvMkg4ZUlEYURVOFdIb1crakpHa0FKaHlFSkU0?=
 =?utf-8?B?RjdUdnRmNHZzYXZqYWtHQmh3cjQwNUt2NHFtZ3o1cVd3VloxQ3AzSkJ0Vldu?=
 =?utf-8?B?bkROUzYyV0FOMUJPV01EVUpvdVhKUUJVbCswc21TSnZ5SWE4Q1F5cXAyeXZq?=
 =?utf-8?B?b0VuQUtzWVNBUTJCbmsvMDBkZTcvV3JhVnhrRFpDdzd4alh3N0ozdHJpc3dt?=
 =?utf-8?B?akl6eVJlQmFUempDalZrMFZCbXRNNUZwS3dKTCtQTVgxTTNwc0EzNDRnZElU?=
 =?utf-8?B?VzhGZ0ViR09GV3RNUHAyc3d4TjhybzN0TkM1Zm1mMC9qbXVlc0FpbUlocmhL?=
 =?utf-8?B?VGQxWFVMdlZHU2UwODRtem5BWjFsdlZLZnRsM1FudURVSnhuak0vTHJFT3hL?=
 =?utf-8?B?M2s4RnM4YlAzbGs0cWxBUGR0ckhuYWNmZ3FkRXp5dVF4QTJFdDhWclVOczJJ?=
 =?utf-8?B?TTEwQ2Vkd0pnNGcwY3VvZzRGeTNWY1JqcXNoSDJhZS9mYm5oNEZZNTErQnVj?=
 =?utf-8?B?WUo4eFpTQnd2bmtMNUVYbGFYV2xXWmlQUGZ6TDlBT0hMY3ZnaFpsTEc3WVEr?=
 =?utf-8?B?R3p5ZDB5Y3gzR2pGYXNBQXIzQmpGVFhENU1wQzRwUWovenhNUzFmYzNSdXVB?=
 =?utf-8?B?bSs2R2xOUXZvakpiWXppMUdmOFl3OE44NU41d3pCK1hkb1RUWkd6RU1UOWgw?=
 =?utf-8?B?cUJ1SFNvYzh6OFdkcm5Wd0NheDdzR2pqbGhoWWdBK0h2djhPMTIveFN0amFm?=
 =?utf-8?B?Wk1udzVxTFVXVFhjWVpVMG93SEtvSHZEZFJ5QzI3NGo3YXNRUjBEamxTWFhv?=
 =?utf-8?B?MmtoVHdVVzJWSVlXaVI5OUdncDd6d25WaTVvOHk5bFVKVUlTS1U0aVQ3VjZ5?=
 =?utf-8?B?RGVjUWtLb3B3OE5Zb3NPS3M2MHBZMHd3elRWSnplSUxXYWMvNmlsZGE1RWht?=
 =?utf-8?B?QzhOOVZaVWVVVjN5dzAxYWJSNjc0KzFHK3ZaTS9STHF6ZWFHS3V6YkhUblJy?=
 =?utf-8?B?WTV2Yzg4bjM1anpBNjg2OG9MM0ZzZEY2c0pYNVFoQzM4K2FicmJqTDh3TXUz?=
 =?utf-8?B?NUZCZ2VvcVlPRG42cUg2MlJRSzd1ek9ySEFKcmZML2F6VzdsOWE2UTgzeGZW?=
 =?utf-8?B?Ymd0eVdJSDB5ZmFRYnluRUc2ZmVUejNlUTdEZDQrM1owdWM5dHZESU5vZEV2?=
 =?utf-8?B?emdSN1dqU3lnV1dsUDNCL0trS3FtVWZZNXFnd3pZU2Z1enRFdTY3amNQNXA1?=
 =?utf-8?B?dmQ5N0ludjlxekx4UTNubFZLaEMwSzFLcnhCbCtFNFpvY1d6aDduRERheDA3?=
 =?utf-8?B?Smp0SEJJYVRmbUo1YkVVVXIzU0F6cnNPdGRCaTNlK3FYVWU2dEdRNUM4V3Ri?=
 =?utf-8?B?VUdJdHlnMjhBY3pCU0xSclNITE4yUEg0RGZ1UmR2WSs0RnZob2pNYWg5czRK?=
 =?utf-8?B?MTJ3Z1ZLWHk3MW1tVUF5SlpLWG9taWpGMHNieUQ5dWE0d2M0T054N210TEJp?=
 =?utf-8?B?ZWIzbVZmcWgzYVd1d3dYWWlVZ21yem5HRHFhQTBtVXBrTUIxeGxLVWFXdCta?=
 =?utf-8?B?dWZLVHpadUE3QzFvQXQ4bWp5dFJCNW1FbWtkR0xyU1JQVXlFSHhFMDVyck92?=
 =?utf-8?B?UkhHNGRpK3daKzZuTldkTEN6NlN2enE3cFpPeWhmSFg4RU5oaUFUOFBnd1Va?=
 =?utf-8?B?TjV4SkwyMW82c1YzdmNldzFBWEJSNlYvZm5yMzRjNGNpc2YzUy84UElBb0xD?=
 =?utf-8?Q?yIhi26?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1VPczYvK3Qxbi9Ddnk2ZVgrbitlUjVuYzhRbWNZZU9FeExyQkl5d21qZVp3?=
 =?utf-8?B?V2lScFJyMGpJM1RzSWhtMW1MMzU1S1RNbkNXZjIxZ0VwZlFpS0swTHlCaHVY?=
 =?utf-8?B?Q1JJSDEwTTRCbVZreVBlSTF4dnplanVCKzRFLzhWVUZxNGd0UWozVW5SVGlO?=
 =?utf-8?B?SytRaUo0b1A5UlVPQkc2RktIRlpDQlNwMkRuWTQwUGRZemIvVnFZbHlLeVY0?=
 =?utf-8?B?a1ZEMzJCNU5ZcVhZalB4OXdmeXZOMUl5dm56Yzk4S0hvR0VpSTlKdVcyaDZG?=
 =?utf-8?B?eDU1dFZpdkJscmJ1Zmc5QkZWZncrbDFDd3EvemltclRndVlTL0hoVVNNb2dp?=
 =?utf-8?B?OXpHYmxteUlCSmY4bUNVL2ppclVneGNzMTRhOVA2U2UvUnl1LzVndDBmMnZq?=
 =?utf-8?B?NWIwSkZwRHk2QzgwNHY5MTluUEdsVVpNdVVtME85aGZha05hRHc0akJJNnJR?=
 =?utf-8?B?WUkzVnpPeWloWGI1MjE3dGZtSE1ZalJ4ckpkUlRweTF1WDVYN2JQRXpBS09z?=
 =?utf-8?B?UFg5OUxyOWE4LzdJVThEWEx1UDRaaDI0REEwNVd6bldNVXdBV2xYTW1OSWVG?=
 =?utf-8?B?VTFZSzhCMFlmWHhOdmhNS3M1c0Q1MzcwQnpUd2V4dUVic2UwVXMvVnZ4bGM4?=
 =?utf-8?B?TnJtY0NkNSttdHJxVlNVTFB4MGYzNUFlT3V3SHFsNE52aXZvUVYyNUFDQmVr?=
 =?utf-8?B?MFBlZE94MTUyZE1tWjZNeXRaM3N2UTBrdlM1Q2QySmVTQm5OeHZRWU1MVHRq?=
 =?utf-8?B?R3pxd0cwdjh1OXgyVnJRbFRjVUt2b1RZWmhqQ0lFWlJnLzlpNWNLYzZpUTdy?=
 =?utf-8?B?SEpSNGdlYjE1eVR4RU5Xa09VWGhLNkZEZG8rOEw3T25KYXJ3Y1cySFNvd2J4?=
 =?utf-8?B?Q3RMbEVGQ3FoelJiMVZMTEkwUkV3NTV5elBZUkVZNmpWTHBHcW5DSUtTNk9j?=
 =?utf-8?B?TW8zNlF1bFlJaUorSTZpK3ZndUg2WGQvbkVKNW5CWkRROGVSVGpBeHNpZFF5?=
 =?utf-8?B?TWlPVEJaZjgrN3Z5T3BjY0lwMDdLQVR1ZXJPVXY2bXZlcnNvWWx6NnZjdk1L?=
 =?utf-8?B?Y1BJbXIrT2lNLzFOcmgxQ3lJVit4aklmTHQ0Y1lTUy9rNkFJS0xIU2UxckZ1?=
 =?utf-8?B?YkV2UjNiaTZTUVlVZUh2a3dZaWhlWmJSWGQ5YUZCZ1JhWkdyN09PMk14R0ND?=
 =?utf-8?B?V04wbFVabmFqem5tMjBsa2RYVERmMHNaWHdac0IyTFFsOU1GY1A0bWYzcUNr?=
 =?utf-8?B?SWkwSTVpamJ2enRZU01LSkczeDhjb3VsU0FNSXpCNVhVV1pvVHg0NHcwOWRQ?=
 =?utf-8?B?MnNIWkxxb1N6bjlaYmJxb3RTbTIyQXVveDhWZENFTk90cjQ4clV3TnpNZ2wx?=
 =?utf-8?B?aVFDdzBpNWJ2Qk15cHZta05qWkExMysvVXR3amhZVHlFYzc3OGhZbnR1dlJQ?=
 =?utf-8?B?MEtob0lqQUR6bkxTT1ZSR2JVUHNKQ0NpaUJoZUJFZ1d6ZHAveXlLQWZFdHhS?=
 =?utf-8?B?L3g3K1Q3K0I1L2dsVnB5U1I2MnBkYWFXcVE1azR5OFF0Ym5LNGszTndDTHhh?=
 =?utf-8?B?SWVJQXc4RS9Ud3pIVGo0SmQ4am9YWGt0UEpRZkpZaG5tVmNMN25ONjFsa2tO?=
 =?utf-8?B?UGRJOVcweUdUZDJPUXVRVUdVVmd6UC9qYUR0K0VZQmtmemdtdFJhTnJIcnp2?=
 =?utf-8?B?RDZZdVBGNm9wTzhvQ0I2NVRvRmdjdjFMSmpXdDRmUytpS2IwdkZvVzRLSVFI?=
 =?utf-8?B?TVhBS3RXeUtzUHV1TWZjQWozaEJ4VzV0WGRmbGc3SXNuU2hROGRaNktnQVdj?=
 =?utf-8?B?Q0JhM29TRTY4OHM2TjBTb0xxWnRTY1dPcU5ndDYyeEVNOFZaK21PbDVodkhh?=
 =?utf-8?B?b2EzSEZQZXRQT3dqT0ZtT05pZVFFVkFvN3F2QndXS1VzeWFFblhLRGJuOFNQ?=
 =?utf-8?B?aCt6TkVzOXp6OWs3S2tSd0VJUWtva0xwbkJDR2xhUDVheWRDZDVPOHZGaU5q?=
 =?utf-8?B?L0txRkp5eTllZGNadStObjhwdTFiVTI5UDNUcHZ0Q3haMFh0aXpab3FGR1FM?=
 =?utf-8?B?QmF4T3o3U2I3QnVacURqTm5vd1diTnoydkt3YVovN2VKeFFvRmxTcEIvd2xz?=
 =?utf-8?Q?NIuZyowckpBF5GbAdMGslUWuB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 546fd4b4-1f5b-4c87-d7df-08de209b6d0e
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 20:55:05.6472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fezQDahJYnP5MxIU26065sDZhvPOiV5D/IfLBunW2qzqGPvrqrBQ4V70isC37+VAzR4X6gvlocPEtuAIq9VPRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9075

Replace spaces with tabs to follow the coding style.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 38 +++++++++++++--------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
index ff7ca20752309a6e8c62c09c19d9e7c17f8c26b0..ed8b38c6df3731d51bed42c8f68e7d4e0c2b1820 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
@@ -690,7 +690,7 @@ MX8MM_IOMUXC_NAND_READY_B_GPIO3_IO16	0x19
 
 	pinctrl_ir: irgrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_GPIO1_IO13_GPIO1_IO13              0x4f
+			MX8MM_IOMUXC_GPIO1_IO13_GPIO1_IO13	0x4f
 		>;
 	};
 
@@ -723,26 +723,26 @@ MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA			0x400001c3
 
 	pinctrl_pcie0: pcie0grp {
 		fsl,pins = <
-			MX8MM_IOMUXC_I2C4_SCL_PCIE1_CLKREQ_B    0x61
-			MX8MM_IOMUXC_SAI2_RXFS_GPIO4_IO21       0x41
+			MX8MM_IOMUXC_I2C4_SCL_PCIE1_CLKREQ_B	0x61
+			MX8MM_IOMUXC_SAI2_RXFS_GPIO4_IO21	0x41
 		>;
 	};
 
 	pinctrl_pcie0_reg: pcie0reggrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_GPIO1_IO05_GPIO1_IO5       0x41
+			MX8MM_IOMUXC_GPIO1_IO05_GPIO1_IO5	0x41
 		>;
 	};
 
 	pinctrl_pdm: pdmgrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SAI5_MCLK_SAI5_MCLK        0xd6
-			MX8MM_IOMUXC_SAI5_RXC_PDM_CLK           0xd6
-			MX8MM_IOMUXC_SAI5_RXFS_SAI5_RX_SYNC     0xd6
-			MX8MM_IOMUXC_SAI5_RXD0_PDM_DATA0        0xd6
-			MX8MM_IOMUXC_SAI5_RXD1_PDM_DATA1        0xd6
-			MX8MM_IOMUXC_SAI5_RXD2_PDM_DATA2        0xd6
-			MX8MM_IOMUXC_SAI5_RXD3_PDM_DATA3        0xd6
+			MX8MM_IOMUXC_SAI5_MCLK_SAI5_MCLK	0xd6
+			MX8MM_IOMUXC_SAI5_RXC_PDM_CLK		0xd6
+			MX8MM_IOMUXC_SAI5_RXFS_SAI5_RX_SYNC	0xd6
+			MX8MM_IOMUXC_SAI5_RXD0_PDM_DATA0	0xd6
+			MX8MM_IOMUXC_SAI5_RXD1_PDM_DATA1	0xd6
+			MX8MM_IOMUXC_SAI5_RXD2_PDM_DATA2	0xd6
+			MX8MM_IOMUXC_SAI5_RXD3_PDM_DATA3	0xd6
 		>;
 	};
 
@@ -760,19 +760,19 @@ MX8MM_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x41
 
 	pinctrl_sai2: sai2grp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SAI2_TXC_SAI2_TX_BCLK      0xd6
-			MX8MM_IOMUXC_SAI2_TXFS_SAI2_TX_SYNC     0xd6
-			MX8MM_IOMUXC_SAI2_TXD0_SAI2_TX_DATA0    0xd6
-			MX8MM_IOMUXC_SAI2_RXD0_SAI2_RX_DATA0    0xd6
+			MX8MM_IOMUXC_SAI2_TXC_SAI2_TX_BCLK	0xd6
+			MX8MM_IOMUXC_SAI2_TXFS_SAI2_TX_SYNC	0xd6
+			MX8MM_IOMUXC_SAI2_TXD0_SAI2_TX_DATA0	0xd6
+			MX8MM_IOMUXC_SAI2_RXD0_SAI2_RX_DATA0	0xd6
 		>;
 	};
 
 	pinctrl_sai3: sai3grp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SAI3_TXFS_SAI3_TX_SYNC     0xd6
-			MX8MM_IOMUXC_SAI3_TXC_SAI3_TX_BCLK      0xd6
-			MX8MM_IOMUXC_SAI3_MCLK_SAI3_MCLK        0xd6
-			MX8MM_IOMUXC_SAI3_TXD_SAI3_TX_DATA0     0xd6
+			MX8MM_IOMUXC_SAI3_TXFS_SAI3_TX_SYNC	0xd6
+			MX8MM_IOMUXC_SAI3_TXC_SAI3_TX_BCLK	0xd6
+			MX8MM_IOMUXC_SAI3_MCLK_SAI3_MCLK	0xd6
+			MX8MM_IOMUXC_SAI3_TXD_SAI3_TX_DATA0	0xd6
 		>;
 	};
 

-- 
2.34.1


