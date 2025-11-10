Return-Path: <linux-kbuild+bounces-9540-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7EBC4952A
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 21:56:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CB40B34B622
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 20:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02FF82F6598;
	Mon, 10 Nov 2025 20:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jz4eqe6J"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011052.outbound.protection.outlook.com [52.101.70.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB962F6567;
	Mon, 10 Nov 2025 20:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762808132; cv=fail; b=cGNMRAC5j/0RW4UVzgoEhsYqKKzPOWZBdxKIHcxhgPGx3xut0PZQzNiaL2NQdtS1dzx1YDi0Vcz16JhPifj2mQIYIsPfBOagSRra5aK2pLbNjAbGnycn+7KlGZLYNtXWGLkfUzIK2R42aIGYTDIrPh3x3yLZLcdHWjdbCEUQHlA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762808132; c=relaxed/simple;
	bh=shHvsKTvadnpY7/Pkcz9CKkYunXVj8swpkQHVkMce+U=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=eBNyzSmX9HfKPKvjAnhpqKci262X8V/Hn83FS1ghjhJzfk/WKsbi9AM5ou21i+sFQ9TsD66to/DxpBLuhSDALSU+TUB0e+s1cK2vT23ZqKC02m5kNL8Hikzrf2dYwCZ8m3NF/ycbmiBSxcQ5KeAhvIsOLx1UuqLRzOmKptcrbc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jz4eqe6J; arc=fail smtp.client-ip=52.101.70.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iB/fgZNwXZWaCl+QddQz+hmfzE+CuPHEW7VX9jdJIxx+1oF6nFKwjzOAZBDwJpmx5GjoTRtSGNqF/l0tsdHogNh8G14UE9DRB0H/8Y+mz720h5PRR3MshOkFrR+jVdRhHqYoPZt2sxNZ2hU40bKm6MPosDwsdPgKGUOpP/x/lQvK0Ko9CBmrxdy31+iUoSqIMtezlTzXQl2Mc86fkg5HpmRWpeQOW8KrQQNRmA56mhsWIfquemTl9I41azxPa6XU5u3hS1FiXRNOSK4XaCZyW56VbDfbIYdLExaLCyZN/EGItBc8cp4IPnyxMNlieA5VuznkW5SU1KmcsQDE67fY2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFOXcMgkwJIYv59vNCsUfi5OgsT+art8IW/UrAv6U/M=;
 b=dIYCGfWcI9BhrEB/sZOaVNK87iY594zDTQfPsJJ3GAsHJD4f3zPP/b1/ctHwvXkE4Uwqp9GDp+roInHXjYu+GTg2F6Mgq7S+W1/H97VjbbQmSBcV1TTxBBr2sdAVWVIhTZEVr8Ip78LW9Jv9w4Abd2Gq8kp287RsoZossPMme86qbPl0qPOe502HXU1/toFlySjCvvr3BQm4DCfi3D9dotB97nd19HJ1e5vt3ND5zzTrGTi5FrDTKOt0A9i4EqbngX2muu1Mb0C7YOU//oBFH0CSIgrdFDVPmpD+G09dakMsu984CpXEUUoF+CZQpOSsAHrmIvBiAaf52VLjhI4CTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFOXcMgkwJIYv59vNCsUfi5OgsT+art8IW/UrAv6U/M=;
 b=jz4eqe6Jl5mBD3ilCZyDnbAe0kkhvtVJMS5Bu1zeShyfVPoNmze2v0oF25PNKbElzFGqKjvzzTCYE+CEIROyc6VWzRxGa3/0EbKGVHIu1vLZGtYDvyBvYRdnQMZQ2/Phtwoi2S3d9Dy7XhgWvUaU+UfFC9l8xQWoSUFVKH2yy8Pl9Voo+VY2UVrVSOJm2W2hBxIn1XA1jkGazVYKWV7hyy3pwguw7NBuIyswPqB9FBeGKrd+LcqR0nPN2qZdQJNq5EJhG84aV471Y3cv2O2RxpkS1CzMg1T1QUJJLbAHYdUmNJ/Eo/rPIl4mpGkiRGQ/MhBkUol7HP5qpy+xwYpv2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB9075.eurprd04.prod.outlook.com (2603:10a6:102:229::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Mon, 10 Nov
 2025 20:55:28 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 20:55:28 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 10 Nov 2025 15:54:46 -0500
Subject: [PATCH 6/9] arm64: dts: imx8mn-evk: add bluetooth dts node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-misc_dts-v1-6-7564b9f69a18@nxp.com>
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
 linux-kbuild@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Sherry Sun <sherry.sun@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762808097; l=771;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=uG04miELlkG9b3Dtx/9qcoI9g6Fip2oH2LQaCWN7op0=;
 b=0iqDii3hJ2DNU/iSzLIsA5qMjfxiA8J3us37c2ZC6Bhlpw5NnuLD6KSepgOwhQxD/ncdYb6E0
 1Mq/OF9ANlqDBuwhyR5t82/S7upUDid7Y5RAzLJp4IDiRYjRcWT/P0W
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
X-MS-Office365-Filtering-Correlation-Id: 33e93c7e-3213-4047-54ae-08de209b7a51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WWhUK25EVjZsKzNsOVBoMW5GMzMrdER1cXgzb0hVNkNzNlcrdmRkMDd6dDJ6?=
 =?utf-8?B?WVBkbHdkQUo2ZUVyT0V0MHM5RHVPMUE2T3hWS1FnTVluYitueDV5R0N4MWJG?=
 =?utf-8?B?N2M3UHlseUlRTHhPOU8xVFBla2wzQ09ZNHdCeThBN21IWXJ4L2VOK09UTFJv?=
 =?utf-8?B?THF1NVRpMW1lZFVPeWt2c1FsWFhYRkxzKzVwZWFSUnpZRVNLSmRKUENONk5x?=
 =?utf-8?B?OEdZZDBQVncvdml6V0s3Mnd2Tk54K3dQbUxuaHF3TW9VaGU2akwvMUZVZGxt?=
 =?utf-8?B?TXUrSXAwc1lFbVFsZjlDTGlmcjAvMlFrQS8wRW5mMlJTT1Z2T3BjYlkyVTJV?=
 =?utf-8?B?K0F3MlVFRnJXWm9nN2xYNDlvMGtzRldyeWZJd0JRN0hPU0tmdC9LWWJTdjdT?=
 =?utf-8?B?NFhBRkQ0MHlZM1dNb3o5MWNRZWFQQjdleDFkNGZVWEoyaUlra2xKSERXTC83?=
 =?utf-8?B?SjZzcnlKeDZMNFNZbStVRG9rMzZTZ2tvTkNNa3c1YkJ4dnowcnhIWVJLcmFJ?=
 =?utf-8?B?OVdLVGFrLzg1Zm1lS2k0MlJqZCtXbkxWM3dEWHVvNldhNHkrWGRhQ1BGaStw?=
 =?utf-8?B?WmUxTmlYSGl5N0hRTUFJT3B4UXR6dVpVOGxLamc0eWpLdUJMWC9wQVJhTldI?=
 =?utf-8?B?emNYZjQ4UE1ZRENnRnJONUIxRGRtZ1UyNGNwNmh0QkhlQ2U1SzB0KzJjSTlo?=
 =?utf-8?B?QjdnOUZZbmdydUQ1LzJMZVFUa3NBZitjazdMSWVsMnB1NjlvUzZyL1BQczkz?=
 =?utf-8?B?YkMydG1tRmlZTERTenRCa1RnV3psMmtMYjJsRGVRSkgybUJPaEcwQ3U0czNP?=
 =?utf-8?B?cjBYYUN0ZFRSWmZibjY1TUJUZmYvZ3RlS1h3UnQxRnZYVzZsNHpRbDYrRURh?=
 =?utf-8?B?OHJIK3N0SmZWUHU4WTIxb1VyQ1BJYklsNnVxU0ZUclpBRjJkZFZlRXFXcGht?=
 =?utf-8?B?RjIzU2I5N1Ria2lzS0ZZYjMzMGcvOVc0OTdvNU54b3ZTQWorTTFhR3ZDTHhH?=
 =?utf-8?B?bnFQRWhNOVI3bzR4ODhNZzdVOXE4Y3F3WVRFbzFLZGJNWFpKTDdrYU5yL1k1?=
 =?utf-8?B?MEZ3eXpaQk1uZWF5NUExQ21RenUvWUR1NFFaaDVhYVRVdGVjc2JTYnZWYkNJ?=
 =?utf-8?B?dzJ6cWF5Vk8vZnBrSExPOWl0WEpzamUvbVBKSnErUndpTWNzZ29pT3ZJSThs?=
 =?utf-8?B?T2N6QzBnL3ZjbC96L3doOERGSjNEL1I2MVlBTGMrSXlxeVNKLzhqY09pTXBz?=
 =?utf-8?B?ZXJ3RktGQ1BzckFlQ09UeFdyY1FsWjJ6Q0cyT3dITGhQbkFQbWFPbkRNUG9h?=
 =?utf-8?B?MkVVNmhnay8xWUFFdGZhSFZlemFEckVsaEZEWXZmelVrSWNOL0xFV1FaNElL?=
 =?utf-8?B?STZpM0gyYUkwd3Q2WkNsRldzbTIwSERCeWxuK2IrRHp0WGU3SHQwbERjeDVt?=
 =?utf-8?B?R0lKRHZIRFFxNWo0b1gzQ01PQXk5elhLSVBRbjcyYXZLa1pHaVk3L3U2L1Ix?=
 =?utf-8?B?VlF5aEFrY0hHRmorWE80Y0JRN2Q5VFFRM0dHOFVyeTBmWThZSUZnR3pFTVM1?=
 =?utf-8?B?aHQra1VsQ1B6dmJmMTE5cHdudzJqaWZQY080cUNoT0g5MFExMFE5Yi9CQmxn?=
 =?utf-8?B?REFSZDgvZEE3amlGZjFqdXIweGNpQmlHK0RBUlR3ajZpbmZ0ekZ2cTZnUDRL?=
 =?utf-8?B?ZkxWSmdjcXRkVkt0OVVCZnY3cTVKTDVOVTA2cXBUdC9RNENzMW1nZmJWMVN4?=
 =?utf-8?B?MGkrWDRTUUNMWjNzbldiOHhWMXRDRlJsNE9Uc3BOS0Rkcy9pZUhSVEhHZkhs?=
 =?utf-8?B?c1pWNnhYWk1nRjJqcjNjWHd3SUloS0FyMVQwNWpnWW5jRGREb1NaV2dweXVz?=
 =?utf-8?B?dVZYRithTHVtYVBkSGQ1KzBLOFZTUUVnVm0xWDFURFdXUWlVMGV1dXlZeDZ1?=
 =?utf-8?B?N1ZpNXExSHBBRTBIQlFQSkVtYTViUDVJSkdUZnlTc2JyYmdWbXRYaWM2d2FG?=
 =?utf-8?B?NTUzMjYwaWloNTVtMDJsVUFvU1F6NC8wSzV3TkwyL29RV3ptYWIxYS9SL1Br?=
 =?utf-8?Q?w2GPXU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TllZbVJRNit6WU5nbnR3QnRaZkp0SDczU0hHejdjN3d5M1g0U1ZGVFJhVmQw?=
 =?utf-8?B?SzRsa3U5S3FIaVJXTy9odTBEQWllNnAxYVhaaFhkQURLeEVQekxXQm9CL1lw?=
 =?utf-8?B?OGxCYmtBRk8yWjJXL1R0UlE1bmNMbjREMGM0Ukx3UkpqZVpoaEpiYTFVTEFP?=
 =?utf-8?B?YmhaWU5VcTBpY1JOYkNQRWpWK0M2MFE3bzdVQXVlaHk1R3EzdUNaMmh3bGZ5?=
 =?utf-8?B?dHp0RDd6TEpJTmtwUitSM0ZONWdxa040TmpmblVOdGFCSStzdldXT2pGa3RG?=
 =?utf-8?B?aXBSTUVoTk40NE1NaEJ4Qy9obCtCQlRIRTFWdmV2dDh0cDR5WDN1ejEzdFJs?=
 =?utf-8?B?OGhEay9IY3Q0TkhTVnc5RHJ5eERkQkZWc1QyQ1ZpSnBFblZGMzRUdjRNendj?=
 =?utf-8?B?VkRwcXlkNDRzUkI3VS93bGlzK0dTbTM4NVJ4MUZoekJvTzh1UVA2VWZ3R3RD?=
 =?utf-8?B?NGQyK2VRNTBpMmZ6bWxEWnlzS2NGSzF5d2t3TmN2c2I0VDFpVUtCRnptS1Vw?=
 =?utf-8?B?QjkyOUMwUlJtZER5RG4zaFpGdlV4V0FiZnFjanVmTnQ4Zzk0SkQ5L3c0REZx?=
 =?utf-8?B?RFBGNHZ6bUhnSithSjBOdXBqc3N2UUtqaW8xeXlkYnRTYmI0MkxEZGNoZ0lB?=
 =?utf-8?B?OEJLVExuRmVIK1RJMFdCZnN0U0pzcVdxUVY1aThXZUQyT3pQVFdhMG5BOU9W?=
 =?utf-8?B?OXl2NWJ2bHhIOS9MWFlFY3BlbVlPSU1pRGNmZDhFWUxGQUlQR0NKTUpSb3R5?=
 =?utf-8?B?dXZvRGdCQXdNb29pRTRPaGFUZ3ZyVXFuQ29uM3pzekh1ZHVRUmt3VW5PUXoy?=
 =?utf-8?B?NFI4MnJwalZUcWRKNmhabyt0NnFYMWlDL3NoaWFsMll5d2JtNUZRZFhEOHNZ?=
 =?utf-8?B?SVBqUEJpTDlJdDdTOEM5WDdiTXJuS2RsZEFLZDd1TEhBY0tDR216VllWRWEz?=
 =?utf-8?B?dkRmYTN6a2dxdzcxT2R1aWIxV3k1ZzhoZnB5c1BpMHJObzVkZUtjdUVtY1pz?=
 =?utf-8?B?bUFxOGF0dTdsSWcwcmkxODZEdmlZbUxNMk9KT3NWNW9DRTdWQi9MUjVDUGFm?=
 =?utf-8?B?UzQ5RnlHNUxYUVp2aklPcU1vUHdPWURIMWx3ZjhZSzdRWDZIUXJuYTlYRHR3?=
 =?utf-8?B?UjVQNmg2SzlwUHY2UzBFaHFDeXgyY2xsZDEwSm81bjhyeGdaNXNibFpZWjVn?=
 =?utf-8?B?ZEZJOFhuY1JGL05SREwyQUFuVGt1a0F0d3JJOXlXbmY3Sis5a25oVllQRnVE?=
 =?utf-8?B?QTVJQUR3U1ptaVllWnZMSm44SUNmb1Y0WXNwOTI3S1V1YkR6M0RLNXh4RmxT?=
 =?utf-8?B?d0Ezd29vUUdiK0VleGc4SFJqcVlRWjFHYlNkU0o4RkpMSEFYditSd3FMY29K?=
 =?utf-8?B?V3BhTDRrMnh5MTJrRzVRNEpjNExkVEFsdGRBS0FRd1A2OU5Vb3F4M1UxajRO?=
 =?utf-8?B?RCtEZEV2d2dnbGVjU2pleUNXVXNEc0R6R252bDZJRmRNU1lLQWplcndWZkZR?=
 =?utf-8?B?WnJVSmEvWnJOSGtuRkl3Rm1tZjVFTmtGMHptbzhBTVBKZUFJVVVrOWhUVzJw?=
 =?utf-8?B?dkVSejF6OTh4VFdYMkJWODZrVWRQRXhrUjJMUkhrZVpaNCt3RzQzcUJQNTgr?=
 =?utf-8?B?cVlvUHhic0NTbytERTNIb3Z0dEgyZThwVUNEOUlrd0FQenB6dXJ6QWZxM2Z1?=
 =?utf-8?B?N2FiWHpyb1Y4YU92NWlRTUViMEQvR28wZk1WTWdUR3FvR1Vxczd0S0d3bGQr?=
 =?utf-8?B?MlkrQWdPbTlDNnpWQzRvYlcxVU9TZ0hKU0J0QmI0bGpWVGQxeUN2YVpjeTZL?=
 =?utf-8?B?K0IzZDZ3dTlFcEpkRUZLSitQTmZpYmNkcmFQNG5ydWNrMmRNOHVOZjd0bE9Z?=
 =?utf-8?B?SnFWdTQvU3F0VDBWMlRtclFYVURyekFyQlVJOTFVNG1ISitZT2VQakZMQ0Zq?=
 =?utf-8?B?cjBidSt1STZ3M1N4UmxBdHduYXF5bTlYOWordDM5ZjJuN3d3VHZkZmFIU0pB?=
 =?utf-8?B?c1hlOHRjSmxwZlhOcUxvWVNkUDRUMDJXT1V2b0RGTXlXZllNajFad3BaRzZS?=
 =?utf-8?B?Y0IxaFhoSG1xaktNdVNTQ1V5dFZKbW9hbWtqQXZMQVFkdUQ2Vk5nQTFMU2JH?=
 =?utf-8?Q?iwXhMgYf7bw3oXW6f89VooQ86?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e93c7e-3213-4047-54ae-08de209b7a51
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 20:55:28.1832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vn9wYvduqNBwJGnqsznuJu7Qs1TJ54lFMAKVjZ+dQMGxZs/8OXfAwdC3z6FabOy3s2XkflsLpOF3pgv7vzLHRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9075

From: Sherry Sun <sherry.sun@nxp.com>

Add bluetooth dts node.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
index 145355ff91b454795478b504eb403b0590848d46..3e590afa4fabb0cd881d87c953459f9cf2b3bf65 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
@@ -415,6 +415,10 @@ &uart1 { /* BT */
 	assigned-clock-parents = <&clk IMX8MN_SYS_PLL1_80M>;
 	uart-has-rtscts;
 	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
 };
 
 &uart2 { /* console */

-- 
2.34.1


