Return-Path: <linux-kbuild+bounces-9542-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E14C49536
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 21:56:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9081A34B773
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 20:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7329B2F5339;
	Mon, 10 Nov 2025 20:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aKo6xvBT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011053.outbound.protection.outlook.com [52.101.65.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA2F2F7AC0;
	Mon, 10 Nov 2025 20:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762808142; cv=fail; b=larUdBPEA38Xm4m9RzfrGQ+Q778u7/zJ/+lpb++RHVi6MBQ+4BwNKcSkdRZlxN/Xb/0dMvhHbFI5ISPUvl7vsehyM/w306UDQicAVkCDcS3xdoVGmKpqM5AeAU976s75uUEUWX7U7zGEz22hPA2ZCt7EdGpXNj/PANlAxvyCtMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762808142; c=relaxed/simple;
	bh=1fuCzv7ipFKK0JvHrAbREYZ5qnb88LzcIeb0SxKXAck=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=aLjhvvwl0jHH0LSDYUFmlIWN/Wpq4QtvmyaNU4rsxAUs7cU2zRvLwDuyiENSXzPtJWD58unTZgMSyLZpgfc8uvHZCd1CAL6Owlg2JMh8GPbaXH1ZaztHC6ei8ybl65J1hPKWT8pKZlB4IIhxKh3haxLLmEY+MTGXyrRwOBn2tH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aKo6xvBT; arc=fail smtp.client-ip=52.101.65.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q6JyxL7w+5U7LeXlxpU8UK2ijEHrfhI4LC3ugdLDWy7IO8KVdndCjyYmiYDIV0moH823hs5TiEEEqBMvvSngQAJ6kq4OHadX1dx1SAw1Ft1bdozfiTxWhL0jj5v5GyiASRINcpiNJmKEgh0AOFt0g09En5Xi3WCnraFH3cfDpqUjdx2zRnJRTiL5z+D0As5Nb+YKysLTKseuKKqw992EWyAO/KKWofUaN/8RVAoMFPpYuLTydMUTYc22G52MS37VSSV/s1sgQJU0Yfs+GxM12ZoiGIaCj7X3GXSFt3GIiNeJLN2joD8lD5isIRXiFPIWnV1+Ln6hOnkArI/qwIziug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/lImdaMJDNH8ln6282n1ZD8n9EjX0dsbsTsxd+QsSQ=;
 b=kKlKI+pu88BtdKqHOQIOMGrnxuaNOeNjNKpPHzHgBBaVegJbb0RtOogfOw9dMOkdIm8l74qD2IbKcPCSuqlmdEqFZXKp05F2J4yFla8l0yp6R0XXlIb94/rTJ1Qk9vqANpFf6S5qBMRiQmU8mH9NEIm8ZKzMSKaYGrFhEbiZzJ7SUnPNUosDGPgPVbb2ltlqCX/TEyCISTzMYPHIRamNL/R/tRao8HEw+ymYCg8O2jiOMG8WpJOy2SDJG1oUioO0sl+Sr/jRV1H76JjUouneQ1wNSYZmJkowqBBmGp+ZMN6VVzaCsxRj/PUYbYe8G41qsYYanXOnKWCRW7GQxvcKJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/lImdaMJDNH8ln6282n1ZD8n9EjX0dsbsTsxd+QsSQ=;
 b=aKo6xvBTULzydxpq22gGLL4l0nTYTmPwZqUoD2xx0cMocowe0SxTUmyH2emZGeSwHRzVuesFS6K11s9mcD4AwwqjQzlWzOH6gWrbLhIiINC4pq9NqVLsanvmVhVAtBJq4gW0oydKRmX8tIdeEFKZUoYuFqMjz9VrEhW/KgPkJdKEvrs8RCC4stKnxPceZpEs/4PQ+wWmViik0euTh8waQD2Mek6pDKINTfzB0yJ8s0bBN+fILOpXJP0IsXc2Y9/m+AKSvopr6guOSD2nTlNsiZkiXfzBcHBVD/F67wRPSHewtu7TYLYxQiJsU7cO90tbHKx80jpZqgJ1qhMfkMxkkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AS1PR04MB9431.eurprd04.prod.outlook.com (2603:10a6:20b:4d9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 20:55:37 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 20:55:36 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 10 Nov 2025 15:54:48 -0500
Subject: [PATCH 8/9] arm64: dts: imx8mp-evk: replace space with tab
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-misc_dts-v1-8-7564b9f69a18@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762808097; l=2631;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=1fuCzv7ipFKK0JvHrAbREYZ5qnb88LzcIeb0SxKXAck=;
 b=FXNkhDhUsnKTMzBVEK+rolhMlqRYMOnF44wzM3ZP7VHGZv2Um7Ha9+N0tWZ0mJ044TGmbtpIn
 vf0qw29FqPUDG4YuZ2HTy8RxPVeh5ip/V0NHrDMwY3WGMABpfg3lTN+
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
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AS1PR04MB9431:EE_
X-MS-Office365-Filtering-Correlation-Id: e063874a-f29f-4cc2-3f96-08de209b7f62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVowSmpUa3lDRWNwUWRBOHA5eUUxeHVmL1NmamRMejNsUytTTHVIRlFwWUhK?=
 =?utf-8?B?ZXU0M0NNeU4xSURmV2hielB5RmZGUFJJYWJEamxkRGJEaGNEalpGL1UvdnJE?=
 =?utf-8?B?ZHU4UDl0UjFsMjBXUUVEWDA4cEMyMFdTV3dCcnpidkhhTTU1WlpMZmNtcHA2?=
 =?utf-8?B?WVVvUjRmbGhEL0JIbzRkWlh3bHJMOStBMy80ZVpkRnFYMDU0WE1VTXMwZDJL?=
 =?utf-8?B?RE9hRU9QMGJ6ekRjTlZ3L3lLS1ZTUnlDV1FuaWdtUEZXblpnT0p5ZWE2TG12?=
 =?utf-8?B?c2haemxJeERlMzdVcWQ4RjQzVGdmSkprUlNXaDltd2NhWGJidEFLN1lBV1cv?=
 =?utf-8?B?V3VxZEcvSDhWS3FWWkNTUDh3SjhmTURTQTYvQWdoKzBrSG8vUm1VUjAwSnFZ?=
 =?utf-8?B?VGlqV3ZkbGRITkx3OVQ5TFNrTmtZOXlRam1QNlc1Ymg1cmpnVkxDRTRidnlq?=
 =?utf-8?B?bzFJUUozQkJMWWdZYlNFNHR2MXFJTGR6eTNmZk1BQWhXNWJidGNtZ0xoeFVV?=
 =?utf-8?B?NDNIdFVySzYrVDFXMjRscDU4anZjTWFLM2pPMEpveCtkTllVNklSZmJtVU1F?=
 =?utf-8?B?dDRCdlZZcGdERGlDcG1yWVJFeWprNldTcjRyTWQ4akZMSHN1dzlod0lNYUEy?=
 =?utf-8?B?TDh4dE5xbEIvcWhmMHBEV0JmMFJOMWlvNkpLamd5d0tlT25odjNKTTlhd3pU?=
 =?utf-8?B?bVlLV25wTUpGZjBMODRpTlY5ZnY5bnZBc1hWdTZiQlhZM2lQSDVud1l1N0lJ?=
 =?utf-8?B?LytmZ3diam9Mam9iUzF6V0dnclZGaDdjWnNwNkp3QkgxbHBvcG9CNFhxZHg4?=
 =?utf-8?B?VTZCbG1BTFZ5bDQxbWljR1pKV0JrRjYrNHpYNDhHaHluVnNpb2o2eWRnT1cy?=
 =?utf-8?B?Z3V6VXBJYnpwb1psOWpFcGNidDkwUUY5ZkZyU2Q2dEpwYTl5ei9CTisrUDFh?=
 =?utf-8?B?MnJITXZkWXlSbWZOSVpTTTU0SGVTb1REV2tTbExmQTJTVG1MRy8zWklsUlFS?=
 =?utf-8?B?Mmg4QjhSR2dvWUszUDJHajVOVjNFT2RtZFYvUXZMOUJEZXpjNlN4L0FrOWlz?=
 =?utf-8?B?RHg5Q1VBeURhdUd6WlNmbGpGbDJXZnBkcnAwa1RaYTIwUFR0YkFUR1hHVjVF?=
 =?utf-8?B?cWdCbDNiQXpvV2tLaEVENHYzZW9KdTBZaUptcnNJdm81UnNqeVc0Q1N3d3FK?=
 =?utf-8?B?bUExZW13Y0ZXaHBLV3h2VndvZzRWM0lPYUZjeDQ5Nk1uVnFlZk9nVjB0TFdo?=
 =?utf-8?B?cVFRUFNqV0tWbnJvVFp1SCtjQnIwVU1oaWcraUJ3bDB1QU1iS3hxWTdQNFBI?=
 =?utf-8?B?OG8zWGZIOE1KdEwxSDZHRnlWZGw1U1MvR2xUTWhBWi9pcG04N1RHV0VRdGlv?=
 =?utf-8?B?NWRWNVVOa01rMmVQekxYZG5lNjZWTEIxa1R2b2JYb3pUTWN1NEpsMllHQktr?=
 =?utf-8?B?NG1FeDlrUG81cDN0R0theVFjZHV5dUNSaUxaK0w1WTZWL0lMbnBUVkVlN3hC?=
 =?utf-8?B?T3NaMGZCY0VseWNmRENUMWIwTjlRcHM2dEZDako4aEJab0xTVW5sRTE2WVVC?=
 =?utf-8?B?L2lvdkl0Q2VjZ3BmZWtHZ05seWRRdTlwRHhJV2NCak5UaFdvdlRIU3lNdWhq?=
 =?utf-8?B?NXpta3UzU3lkQnkxOWNVZ3RmYmpKOWZLYUtZd1RralljSTh1cXF1MVBmNU1i?=
 =?utf-8?B?UytpQ0xuMmtrbUU5OW1kandaei9mbmdNbWZ3V3FsdzkvRlFxYjk1YVljaFdu?=
 =?utf-8?B?VnVHS25mcExkSlV2VVBtQ0wrc09EUTAybFpmdm1JUGFsSi9iOGZrZksxSEc5?=
 =?utf-8?B?TlFIY2hpelphNW9HeDJDWnRaUjJyaVB4SDVwZlZDWG1mQ1d6cGMxU1hKUjB2?=
 =?utf-8?B?YlhhRW1reWREdUZGOWN3a2hxa2Z0aTNBakQrRGJWaUVOQlgraHhDN002MkM3?=
 =?utf-8?B?WktwSmg0ZUN3UVdEQmdkN0x0RkVuc1dvbDJoZHBudzVqd3c1ejdyM1V1bFBh?=
 =?utf-8?B?aWd6TEZtU0tyWW0vS1VBcGNkV0pRVTlRMWdoZE03bjYxcWRGcnVnZWxrdGQv?=
 =?utf-8?Q?opT0z3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkdLMjFvSW9hTFZPRjh6SW40YklZRWVsbE5hbUVnRHFEVzFxaGswTzdqNmgy?=
 =?utf-8?B?Rjd2TmU1SkNZeTg4V3dzMUpKTGQwMUs4TGFiU2R4N3pKdWdWeVc3c1ZZODZP?=
 =?utf-8?B?QmV3VThLbzUyQ0RkRTY3OFlSY0dsUWlRVWdVNXpCSmY0UkVHWWNoTEJvc1lG?=
 =?utf-8?B?V2pGUGhBMXZCNkZ2bmpoZ1N3K0FIRUxiODVHWjhxeWVJRDlZR3FmWjhrVGdY?=
 =?utf-8?B?TjdtQ0xXS1dncnBSb3J2NG9kb0FXUnNDbExVenFNL2JNNytSbTM5ckhDdHVr?=
 =?utf-8?B?VkZrYnN1eUdPV0twNGdHS1BoWGFZY1pnSlp1SVZZdE81bGdRbC95RkNvdnRt?=
 =?utf-8?B?QW1qaWZmSGxuMUxHbkxZTmpYWDNDQm5pZWJTVlZTNDJpRUhsNDV6eSswaiti?=
 =?utf-8?B?UGM3MXMzbm9Palc3dXdZZTBIbGFFOFpnT3Y5OGN4VzluYjk3S3hrUk4zR3Bi?=
 =?utf-8?B?Sm5BaytXRE85dDNCWE1jdXhaKzg2NEd4cktacHpVdUVOa01hVGozdkY0U0tw?=
 =?utf-8?B?M1RjRUhFekZZWWx6ankvMUtsWk9HeFdhSmxweFdLQjBXcjdWdThlWUwrRHEw?=
 =?utf-8?B?VFJ3ZGg0anp2VEhHU05EL0NhbHdiZGkvS2ZFMkt5OUZCM00rU1FsOThFbkxR?=
 =?utf-8?B?NmMvRGZ0SHVpbTJnTkM1MDZ2b0drNzhnTkdIK3hSek9uUUtVR0p2eGxEd2x1?=
 =?utf-8?B?TUpzM3IvR1RwWWd5ZWtCMWJvR2tLYmtISThCZ2dHR2w2QVZrcnJCNHVweC8x?=
 =?utf-8?B?QmMzeVNjT3VHOFV6MGVheGZWVGVCSW5JaU8zdE4rMWJvcnByeDExODN6ZE5S?=
 =?utf-8?B?TG9RbFZuQi9lT0VCVnczTDZmQ3pOOElVSDhFK0RCUE01T1lueSt0SmVZc1Qv?=
 =?utf-8?B?V1hIT1FRWmFVTktkQ1VUbTd4NlJKdXdpSUxBTmhrdCtGRnpsNHoyRHVObjE2?=
 =?utf-8?B?NGpRZjJqWEk3dlhLaE5WSWxMajI2NXhNY3VwYzE3MVpkOFpQS0JPb2N6RG92?=
 =?utf-8?B?TlNEcEpXUEE0Z2ViYzRjNU14Y0FVY0wwS1h2NkxibzNBMTFBOXlwMFZuQ3VP?=
 =?utf-8?B?V0sxbDRaSnJ2S2NvcFhIRm1TZ2FMdzNtQW9GazZISGh5NDgwN1hRVFZuWWFs?=
 =?utf-8?B?U3Y1dW1NRUQ1anNza1pnbFAwdk1vSmNLZGc3aTlEOHF0eUN6RldzMGlKTEw1?=
 =?utf-8?B?amtyYVhiNFNXOGU4Z3hRWmZaNUI2amxVNXZnSjVWaE1pektnazJOYXVYcWRQ?=
 =?utf-8?B?R0VYaDNFZUxTcTFCcmNOZUVoY0hkYmdBUDN2SHdqQmJkUWY4eVlaK2xSY3Bh?=
 =?utf-8?B?ZUs2N0RzUG9Rc2V5SE10SmpwT1AvK2tiMFpQMXBkaHRPMmU0ZnJtTWQxRFhH?=
 =?utf-8?B?cUQ4N2FRNHZrSUtjZ3lvNWpkZks3d3lTUGFCYlFQZDA4THdGK2lrZGI0RVlZ?=
 =?utf-8?B?blpDTGsrVWRkUFk2T3dJMDVyWWVqQ2duQkZoVVo1Z0hCRlMzTDRHbzc1a2VX?=
 =?utf-8?B?czRhdXE3Q2Iybk1JOXc5QVZxTERxRVVnMGtGV1BxaEYvYXZ3VWpoMS9NMGh5?=
 =?utf-8?B?VFYrWXpBZWJJdVBRcmQ2OHkvMVpEN2pMTEhrRGxJL3FzMUtZa08rb2xNSnBo?=
 =?utf-8?B?YXlYMGhGZHhHV1g5RWcwMkxadjJYUXdvVTVhVmdDbVQ5SHVKeWd6cTF2bjJq?=
 =?utf-8?B?ZmRHK1BwUDQ2MTBEbHlZN0VGMnRyeE5HRmpBS2V5ZFY2eFE2azBiSUtJLzd0?=
 =?utf-8?B?Vi9DVHdMTUphRHhOUE8wYW9DVWlPQTRsS0dZZkVxQ2RUTE1VT1RiQ2ZPNVV6?=
 =?utf-8?B?NTlUNEVqS1hGNVhJMmd4SHIxRUhEUWtOSG02amVPLzlVM0VWN2xyS2p2Kzlu?=
 =?utf-8?B?bFk2Z0h5Y2RKc25ONWRCWEw0OXZQZWg3L052UFdPR1BnRVRwT1NYdzNsVEJa?=
 =?utf-8?B?K1ZwQTRoK3NGTTdROHNPbkJ4bTlJVmgzMWNkK1VRdk5mV2cxV2NEdHlCeXJz?=
 =?utf-8?B?dnNZa0M0TU52dktCTU12SEwxNVhsaVllT3g4OUlnR0lia2ZmNTdhWWF0YlV1?=
 =?utf-8?B?MGpla3d2eGgxY2V5VTV4YjdjVWN1OXBUTFBZam0xMStMRkkvc0xCandDQzFE?=
 =?utf-8?Q?pjcQmu5CnY56UJdZEEGlRbmyN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e063874a-f29f-4cc2-3f96-08de209b7f62
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 20:55:36.4176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c0VwTnNeSNUhB5GZA9OsQfAs2rL/Gxei+FWyQM/Csvf3tsDMJnwKRtl6Mhr5TUwssxfM79gSeUW3Iio97cQpLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9431

Replace spaces with tabs to follow the coding style.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index 3730792daf5010213cbb9f6869a8110ea28eb48a..b3272fffcde813f718ab7653eed6a68fcceca359 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -891,38 +891,38 @@ MX8MP_IOMUXC_SAI1_RXD0__GPIO4_IO02		0x10
 
 	pinctrl_flexcan1: flexcan1grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_SPDIF_RX__CAN1_RX          0x154
-			MX8MP_IOMUXC_SPDIF_TX__CAN1_TX          0x154
+			MX8MP_IOMUXC_SPDIF_RX__CAN1_RX		0x154
+			MX8MP_IOMUXC_SPDIF_TX__CAN1_TX		0x154
 		>;
 	};
 
 	pinctrl_flexcan2: flexcan2grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_SAI5_MCLK__CAN2_RX         0x154
-			MX8MP_IOMUXC_SAI5_RXD3__CAN2_TX         0x154
+			MX8MP_IOMUXC_SAI5_MCLK__CAN2_RX		0x154
+			MX8MP_IOMUXC_SAI5_RXD3__CAN2_TX		0x154
 		>;
 	};
 
 	pinctrl_flexcan1_reg: flexcan1reggrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_SPDIF_EXT_CLK__GPIO5_IO05  0x154   /* CAN1_STBY */
+			MX8MP_IOMUXC_SPDIF_EXT_CLK__GPIO5_IO05	0x154   /* CAN1_STBY */
 		>;
 	};
 
 	pinctrl_flexcan2_reg: flexcan2reggrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_SAI2_MCLK__GPIO4_IO27      0x154   /* CAN2_STBY */
+			MX8MP_IOMUXC_SAI2_MCLK__GPIO4_IO27	0x154   /* CAN2_STBY */
 		>;
 	};
 
 	pinctrl_flexspi0: flexspi0grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_NAND_ALE__FLEXSPI_A_SCLK           0x1c2
-			MX8MP_IOMUXC_NAND_CE0_B__FLEXSPI_A_SS0_B        0x82
-			MX8MP_IOMUXC_NAND_DATA00__FLEXSPI_A_DATA00      0x82
-			MX8MP_IOMUXC_NAND_DATA01__FLEXSPI_A_DATA01      0x82
-			MX8MP_IOMUXC_NAND_DATA02__FLEXSPI_A_DATA02      0x82
-			MX8MP_IOMUXC_NAND_DATA03__FLEXSPI_A_DATA03      0x82
+			MX8MP_IOMUXC_NAND_ALE__FLEXSPI_A_SCLK		0x1c2
+			MX8MP_IOMUXC_NAND_CE0_B__FLEXSPI_A_SS0_B	0x82
+			MX8MP_IOMUXC_NAND_DATA00__FLEXSPI_A_DATA00	0x82
+			MX8MP_IOMUXC_NAND_DATA01__FLEXSPI_A_DATA01	0x82
+			MX8MP_IOMUXC_NAND_DATA02__FLEXSPI_A_DATA02	0x82
+			MX8MP_IOMUXC_NAND_DATA03__FLEXSPI_A_DATA03	0x82
 		>;
 	};
 
@@ -975,8 +975,8 @@ MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA		0x400001c2
 
 	pinctrl_i2c5: i2c5grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_SPDIF_RX__I2C5_SDA         0x400001c2
-			MX8MP_IOMUXC_SPDIF_TX__I2C5_SCL         0x400001c2
+			MX8MP_IOMUXC_SPDIF_RX__I2C5_SDA		0x400001c2
+			MX8MP_IOMUXC_SPDIF_TX__I2C5_SCL		0x400001c2
 		>;
 	};
 

-- 
2.34.1


