Return-Path: <linux-kbuild+bounces-10628-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 033FAD39282
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 04:39:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3955B300C15C
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 03:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93B202EBB8A;
	Sun, 18 Jan 2026 03:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Mg9WjZIE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011013.outbound.protection.outlook.com [40.107.130.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A7430BF77;
	Sun, 18 Jan 2026 03:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768707583; cv=fail; b=DZ8VHDl4HlyD6MnGN1G10igCxWNiJmsoQK6ZdkqlLTyTOEZpqd0b/B8ENxle5RzteKu6PtHM7omlxJvMUsdkC1LM4CC9zcNCFMdO8R8h2TPp+pE/TAJmIq9b2FkdamnDzjvdS7QQK6RqXC4nsriVk2S0VvibvKT1C9pZXExR048=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768707583; c=relaxed/simple;
	bh=nx3v9efAsL8FWGLXOsUr9yBPhLN2JBBbLBiObSOJJSA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ETVXAB6SYxHF8E4O1Jsbd/vP1HvAirVtNlOEJBbg8RGmy1C2UFBXmtqzW6rS0f6fd+UKW48oVpzRf0CdnNwVLMHHJ50uhWFCNu4PzjY9zFOU7Uhmi2kjIBjoyHqSGW6nsvx1vQiPKa3HEIC6eiHA/SJeYVjhoPIcfrNeO4FjhL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Mg9WjZIE; arc=fail smtp.client-ip=40.107.130.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qxy2pmR7jU33a89K2THG9zXk/yV7+9J+T2vNrtu9/ruP+IvTjsEv2KG9FT4eB5zOYD7+5/rGQB6ClJqdpfG9iAj/PgO4GkyDXv1QLP1lIeisN1L8GZUyeXYexBj46h86BoUdrJgBrR40//om5OA4+OgLZqjJqsVrDgKxnjm/tf8CmAPPQdt7v4sLOHqZkQ+4nxftdq5ac/9xJlvERdTg0T9SIPXKPe1e6sq0mr4JclDJHvaJax9cEKrEQ8KXudDHhCN8ihWxaZZztpIi7qRQRZU6uI6m46BrG8Hz7lIhJP1Al66UEon+HGdPC/e7T8Y9LcdWCcj/EN7+Odan/Sx1aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hh0P+XeP7sPpWrJgQzRdesH39GWv92Rw73fip9DF8gU=;
 b=Mu4pi1vMoClvasoIkPmSjE7IFY2IiefELGWFfDEPmnjZ+0Fjmwqw/zyyPg4Xz/2mWTj8TJyEmJ5Ob6xiT3hbbheuxeyq0qtUmeBffJUZ5WIza/8CDiai+evfYXBR5XgvrG1UfGzpd86D2HxUY+lWUvVMGJRNgBPt3nUjl4MZ6uez1IMCHsTskNEePQztCW7Z+ruQqoUMIRovHMdlDD6mCFx2WEuIrhDQkMjptS5qqe0rZJjtQMTHnxtuTsmqakJmCV0KSG7zGKRpNXCsr6Wr1PAv7sGmHQFmF0QQKIptZdRX8DXqDFrny8aZDYkxid9muDITU5RZaGOSjqgvIV4q+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hh0P+XeP7sPpWrJgQzRdesH39GWv92Rw73fip9DF8gU=;
 b=Mg9WjZIE8bUCN6PodmGXm/fXzMCZEFtt5lmuEIPYhuXHLCl0JPS9cuoHa5ltDfkkEloHDUr3/NPg+aY3WIpoa1rlYwCL1snTTxxXPyUJ2xn3VrN+OyZOys90QeCdTsuWsxMtM3WYolPg1QpR4mWPpiPFlraKHlN+ygar5D8kCsxPg6z/hkguKHDJV8+Nk0WwveaI2rDxHMue/p2eECLkb12JCKPYD6bgl6+AEvXLXey11xINlJGTra98K4GvivR+ppEVZ2OejeszI4K+wWN2MyeBA34GN7jnO8FeIOzDKuhw5l77axhduyYX0o3/SQZwmAJlar4/xNr7XrQONo0ABw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GVXPR04MB10021.eurprd04.prod.outlook.com (2603:10a6:150:112::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Sun, 18 Jan
 2026 03:38:28 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Sun, 18 Jan 2026
 03:38:28 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Sat, 17 Jan 2026 22:37:39 -0500
Subject: [PATCH v2 5/9] arm64: dts: imx8mm-evk: add uart3 port
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260117-misc_dts-v2-5-0f319c7e9b55@nxp.com>
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
 Fugang Duan <fugang.duan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768707488; l=1341;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=YB4Z00MqTDcHFOKihjZ3rrQf5j451VEbsBX4upacPVA=;
 b=uzGwsSh5VqFmZNKh4W5HH+3GN6H3xMRTC6EfXYcDhepfgcuhq3gwCcTeefSZpsyc9T0wbaqri
 veIyZs1IDxSCoRWRORz4fjD/9cCwHh81rkQjZtnY11ybnW8RpupE2ML
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
X-MS-Office365-Filtering-Correlation-Id: e3a37bd8-2ccc-4102-7288-08de56430b58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|19092799006|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dEgxcU9IM2pJSlg1ajlxK3VXdjU0YjQ4YStWR2ZJSERkUFcrR0R0ZnNMWEFl?=
 =?utf-8?B?bWhXZFJXT1hOUjVrNWYvUW1lcXArYUE3RVBzMlE2bHBoT3V3cUpHV3ByN3JI?=
 =?utf-8?B?YzVVRkNXK3VvN1V4SjFNT2FLVXk3MmhJWlRlZitZUXZFb1VDeEx3ZTAxWE1O?=
 =?utf-8?B?Z3hwYjY0SXNmQklQaWtHYUcxbVBSZFJvZW9YMHZTTzArODJ4L2p4ZHE4aDlX?=
 =?utf-8?B?SWUrRkFsbmhNQkRjcEFsSFFZd2h6Ri9KQnprN29YT0RBekNqYWVNdUpBSFBM?=
 =?utf-8?B?RlNrR2RkZjhzenZwQnBhdkUwVjA1aVVWc05qVHc0L0VFUWZyanB2a3N0U0NK?=
 =?utf-8?B?S2c1OE1nQmlqOWg1amxsR0tHSVhQeXVxQUhLMDhxUXBvQzlwdXY1N0VUUXJ4?=
 =?utf-8?B?bG9PR0lraWV4SkowQlpyTkkyNVh5YnlaU1I1ckx5NTl5NU5DY0dtQ3pRN2RL?=
 =?utf-8?B?a0NxNUVWWXZxT1Q0NHd3SloyWUx1WG50aTBIaE51UUd0TElwNzZjTjhCa3V6?=
 =?utf-8?B?RzdVSWpxUjNmS0JtVFVmQU1Ld09tYVdYNTBKSU1Ua0NIQVBaWlRBdEFwNWl4?=
 =?utf-8?B?b2xTbitrU1MzRjVNR05yeFV6d3pEclEwNHgweElDZmthbkYycXhZa09rQTRP?=
 =?utf-8?B?SmZXVlFDSEhDSUdqZzZjSTNzdXYvSXNOeE00ODBBUU93ZVpjbXRjaWM1eWJ3?=
 =?utf-8?B?akN6ODNoVzQxZ0VvZHpVbnJwUVpTVWx0L3F0bFlzbVBTaHVKSkRzYTR2T0ZE?=
 =?utf-8?B?cHdoYnZJOXU1WHl0bEl1REMyeG5jc2pOSldGYmxZNUorVy9jUERCZmlMd1dW?=
 =?utf-8?B?NitKVXRyREhSMmx1SDA3U0VNMFFZUWRuSk9yY3B5RXFuS2U4b2xkZUZsM3FH?=
 =?utf-8?B?eC9hSXpZTFhiV0oyK09pdW9OWm80TktYcVRUWnU3bEFVd1hleG9ibEc1YnJt?=
 =?utf-8?B?SkZGaHhSNlNKOUYyL1lUZGtUZ3Eyc2ExV2RsV3BqSVZ0VkpOY0lYZDdoNXho?=
 =?utf-8?B?cFBzemI1V3Q4V3FqWExQc1oxU3hydmVSWUNCL0ludTlZc1JDdmRic0hGVXZL?=
 =?utf-8?B?dU5TSVN1L3pwc0VNODFHYzlnQ2s2L08yMHp3d25hVExqczlWZmNmaWttVTJU?=
 =?utf-8?B?c2RNY1JxTWgwMFpFRzBhVWlRcElqeHdYQU55T1BGUmVqL3hLdW1nekpaN2ov?=
 =?utf-8?B?SGVVcTF4dmVBTTM0dWxuQW55NVhQSWJ6aDFtUjEwQ3JUbWMzZ3VkdGZSb0hZ?=
 =?utf-8?B?QXlxN2VxR093aXhVVVpZcTNkNDZ4SGlFZWNFdlFSQTBGT3VLMXZheU1vbmxW?=
 =?utf-8?B?NXg0QkhsVG1CM1pTU0pldkZSczhSQ21xVlRTejQ2L2YrNTBtMkhER2czUnVp?=
 =?utf-8?B?M1ZHYWplVWtzN0I1ei9oOU5oN3ZucGtIenliSXJ0eWYyZThwekl5eWY2Ti9s?=
 =?utf-8?B?RjVGcmJKamgvQ0pyeTY0OWN3Q0pyNUZGb3YrL2ZnWm54ajduQmRBQTJ1R254?=
 =?utf-8?B?TU5rK1FyQmtmNTYwajIzSlcydGpXcTFDU0g5M0VuRFVzNkZ2ZDVqQ0ZWUnAr?=
 =?utf-8?B?U2dqUS9XOCtKMGdoKzNKVjJ5MVVQeWN5bmlGN0p3WHdsMXN4RFIvcHlpdCtm?=
 =?utf-8?B?RkpscVZEek45Ny96dFl4VTBxNUhVU1dRUzI1VzZ3My9YMnNNcjNnYkdNemJJ?=
 =?utf-8?B?WDFLcFlDdStrZ1JLTTZrRWh5cWQrR0l3cTZDeEs3ZkpJQ1JhQng0SUhyMHZT?=
 =?utf-8?B?WkptUnBxc2R1c3ZidkxZRkEvNC8xK3RDNDM3SnkxTHo4S3hRaDdTWlpiSW56?=
 =?utf-8?B?VDJjMnFyMThCOW4zQlRFVlF3UE5xSC9pRVkrdnlhMkZvQkJYQytpc3VoM2p3?=
 =?utf-8?B?MXFwSXhqdkVvS1ZuSGNqZWc4L2JKRWRWMG9NSFYvREozV2JHWlgrQU5WT2xY?=
 =?utf-8?B?R0tRdm44cE9pajJSRERRRHEyaE1VeUNqWkg3bnV2NWIrUUhZaU9lZjltNFJw?=
 =?utf-8?B?bG5xMWVsaUZET0tHSkxlbFBrTVBFeE16L0pTbnpVYWZXVUp0K0xzQnBwRmlk?=
 =?utf-8?B?T3MrOHFtZEpWNDFhc3MrVzBqd3c0V2R1TkVPeEwvY3VuVEs2ZXN1aXcrYVFV?=
 =?utf-8?B?dVdXVVNQbW81MXhXdHVGYWRCUytTaXRuNzBYWWY1VzllVkpsT2VjV3R2V3JI?=
 =?utf-8?Q?tECm8oGCUH9BY34+MxgumPI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(19092799006)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3lFcW95SHZEaEdOOFNrNktkZ3ZxdkdOWVU0SUVpdzdZNW02RkJNeXdaVkNa?=
 =?utf-8?B?bEdpdGdiZWN1S1hiRXJ3QzN6M1gyTDQrZTdTbXBCaUZHRnN6UVROVDJSVnRt?=
 =?utf-8?B?eUxJZDJ3NUdXQml6ditldEM3TGJZS1dyemU3ZWhHRWxtSXQvUVBzN1lrbEZW?=
 =?utf-8?B?MlhiTDlYUGx5M3VuRGhla1NjcWRwV2JQaFdldkRFaE9RT3JCaUZZNjNiT0d5?=
 =?utf-8?B?a2pTM3pOU0ZGYkp4eXpiNG44M2IvS1E4Rjl0RkY3bFQ1VVpVQURuZHpEd0Rj?=
 =?utf-8?B?MTRtT0pEc3FQeEZobkpYeERRYzFCaDBKNGdGb0o2SnRUcXlMUld6Qy9rYldB?=
 =?utf-8?B?TDlwTjNMOEY2K2wxdFVXaUhmK0hseXFHWGxJdXo2NUl1T0o5dlgxZmZRUmdC?=
 =?utf-8?B?WHZSRS9LVk9CL0tzZnM3a0Jxc0l5ejN6L2dCcHAwb1IyREI3aFVEYldwblZN?=
 =?utf-8?B?OFNRWkdYRUtiQkl5Z1RnVUwzcGlqNys0aWdJSWhJWG85d0NKRFVKY3RTOUsz?=
 =?utf-8?B?L2JydytxY1VpVFRtSWFNSkpDNDZEcTRqbFZ5UkFFTHUxUGN5cjg3TkQvUSt6?=
 =?utf-8?B?aGtZWFRENmt3ZHlMQTNQQ2hPN2Vqd0RiS1F5VmJTdkx1dVkvVnhQbUxxRlo2?=
 =?utf-8?B?RFJCT2FOTENkTlIrc04zeWU0R3BLY2tJRHljZnVJM0JTeDdmZFN6YjVTRWtq?=
 =?utf-8?B?dkNSaER6OXdEb2NJVGtCdnRzeEdWUmQ5eGxDdmJXMFI2VDh4QzlsMTcwRlNK?=
 =?utf-8?B?OGY5VEV1OXlpU091eURySlkrK0dRelZVcFpSMTd3RXpTUGVTOHVPS3p2cENj?=
 =?utf-8?B?TFBVdGJhZUEzK1k3NDl2cUpvM3M0TmQveStpNzczaW5ybXFBcUIxcFFDNVds?=
 =?utf-8?B?aFA4NGJVZU9iOGhsOEZCK0FmVm5lYXZ0WmZRZDZxNktTMmVHa29Wa3BuMEd1?=
 =?utf-8?B?ZHJPT3h5NDFQUlI0Um4yK1ExelBxNmhCOS9nRTdRT3FRSmorK0l1MlJFcUsw?=
 =?utf-8?B?ekcrdWlJSlJMcXlOOWtSd0hnUGFhU1NuVmJnVUIxVU5nQ3FuUkJxQWp6YXI3?=
 =?utf-8?B?cWtIc3VCTEJlaVprdDZENDZic1J0WjZJZ3FqZVRaWFVJZEJhVHdmMWxZZ3pi?=
 =?utf-8?B?MWNmUUlNY0llYVhuZE1GSFh1VGlERC9OZ2hwcHh3eTkwZFNDWmcrVXFzeUpz?=
 =?utf-8?B?UW5PcE9QMFRYQjJuSlg2Yy8vUmkyTG0vQWpYTVNLT3BjM1hUaHZ6WTNEZkkw?=
 =?utf-8?B?QVA0d29XTVJBM3lVYTF1RXM3WUVvVlRaaGYyWmZEMTR1WjhtVG5MeC8rVm5L?=
 =?utf-8?B?d0NQSm5OYm1xZEV2ZUhmR1U4c2FJQk03UExDRmpQNnRWbGdJdzF6Q2xJd21n?=
 =?utf-8?B?M2ozcXFFdjEzcWc1cllJa09sRHh3WUVVMFo2OWYyZGs1a2QwaW84akEwemEr?=
 =?utf-8?B?TDdLS205cEw1cDcwK2QrNFdEaTZpSUhWT3ZDR1paN3B4Q3FQdkx2d1l6QUZC?=
 =?utf-8?B?UG41QnFZczl5UFBhTVI2Ui9aS25nenhLYmpVSE5uNmNETmJ2NnIybm5aTzMx?=
 =?utf-8?B?a1ZpTEVYQ0grNkV4ZG02c1N0bzJkS1BDY2g0a0Q4djNxNUxrdzc5RVJra0ha?=
 =?utf-8?B?TWpGcFczVVRRSWR3a0hmbWFOVjlzQ2RJejIzNXN0WjVBU2plTkJGTnZsZ0NU?=
 =?utf-8?B?andsYnh6N0VaYlRtRUlHMXorbFFRdFlpTGZEN0p1V0FxWXJJbVJkTFlSVFor?=
 =?utf-8?B?bHdWcCtMZ2JtUVY5cklMb1N6aXdYdlhBWXVkTzlMYXpPSTIzRlJLZ2J6eng2?=
 =?utf-8?B?bnUyRGh1aGJLM0lkRW9qN1k3aE9vY2YvdnBoa1E0V1FxT2N3V3lDTmtjRzhP?=
 =?utf-8?B?THBqM0hoNUJ0QkhONTF1MTErVDJZRWkzai9pdE5CRzJ0VzJZTmVuSzBpeERU?=
 =?utf-8?B?VERoSnFqV0JVcW1FT0FENWNLU3Eza0F1bGxGR3VDVG84MlNTVUplWFlBRHl4?=
 =?utf-8?B?R1ZPckRVdzdWUjJtb0dCYTZnTjBhMlk4TUIvZ3d5bGhhMHh4MlAwSzdUTXIy?=
 =?utf-8?B?alI0U3AzL2wyeEtBUzRseHhUQTFFdjkxVXNqcmNQR0NZVm1JK1ZGRHdYMFR6?=
 =?utf-8?B?OHBXUXNUVytwVlJadjExYUpORXdCdGlBR3ZZTWZsMHV1amYrNUJidktSZE9T?=
 =?utf-8?B?TmlZSjJ1cSszT3VrVDQyYi9zVXBFODdaRUNZQm5YQ0V6bGZCMy9EeTBvVjlU?=
 =?utf-8?B?WlZhMXhOOUlkbEZzS09OQ2l5UG9rTkMrYkhzS3lRZGhZdktRUGVwa2lNRHVK?=
 =?utf-8?Q?bOYQkQHI9BFO2VI03a?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3a37bd8-2ccc-4102-7288-08de56430b58
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 03:38:28.7554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NwTFyUlEHjg+uSXEJUne4z2HwqHoWzOGKYSkI+B4spI8yVqJ8Gbqc6EYNd8c8jJ7ia1cmXsj7QtPaxQVz5ZrbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10021

From: Fugang Duan <fugang.duan@nxp.com>

Add uart3 port.

Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
index 30b13b4d630f8b8b0531fad531081d4ee32849f9..8be44eaf4e1e0adc2921db8cc5f2dc69586b68cf 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
@@ -627,6 +627,15 @@ &uart2 { /* console */
 	status = "okay";
 };
 
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart3>;
+	assigned-clocks = <&clk IMX8MM_CLK_UART3>;
+	assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_80M>;
+	uart-has-rtscts;
+	status = "okay";
+};
+
 &usbphynop1 {
 	wakeup-source;
 };
@@ -819,6 +828,15 @@ MX8MM_IOMUXC_UART2_TXD_UART2_DCE_TX	0x140
 		>;
 	};
 
+	pinctrl_uart3: uart3grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_ECSPI1_SCLK_UART3_DCE_RX		0x140
+			MX8MM_IOMUXC_ECSPI1_MOSI_UART3_DCE_TX		0x140
+			MX8MM_IOMUXC_ECSPI1_SS0_UART3_DCE_RTS_B		0x140
+			MX8MM_IOMUXC_ECSPI1_MISO_UART3_DCE_CTS_B	0x140
+		>;
+	};
+
 	pinctrl_usdhc2_gpio: usdhc2grpgpiogrp {
 		fsl,pins = <
 			MX8MM_IOMUXC_GPIO1_IO15_GPIO1_IO15	0x1c4

-- 
2.34.1


