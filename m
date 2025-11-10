Return-Path: <linux-kbuild+bounces-9541-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8688BC4953F
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 21:56:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C753A4EBD90
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 20:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31EB02F6939;
	Mon, 10 Nov 2025 20:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XBlpakMz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010007.outbound.protection.outlook.com [52.101.69.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488C22F6914;
	Mon, 10 Nov 2025 20:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762808137; cv=fail; b=XnGJrbumPwJ1ZvEqt9FpBmG1Zpwh/hwyv2L2yxPQX1gsNdjmnvHwYZ3wdZGueQduZB0tPBxi/KbEJ7lbAIugyxbHdC5IoraevKhcwzuHoI0zLQB0B0hGG0vfirGp82uKzySHVVw4qt4UdGObIwzCnPPo4bzDGhCCYAQuqxn12iQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762808137; c=relaxed/simple;
	bh=lBoTVZUt5m3hOeWQr60WbbDwTqzEW+kLM0XPCbq9f00=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=VAs3yL/OPdmanurlMJ7XP1VqozDnU7lMLAj9Xd7P1XQ/JmwD+0JSz3/Alrpg9szlxmuIRzcNl3X4jladN1jo9DY3GRTZwGWNiJcF7BbvES6fjhQ/J1i1GYCYc/1RZ1Zthss9TT5NQSmtkUFrWUXpu4ks1ovOQEzJcr1YKLC+eGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XBlpakMz; arc=fail smtp.client-ip=52.101.69.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EOyEe262oC/uvRClbCwXSkfaIpNWtvpeo4LBZGzyPzMZXkEG4Ol2N2/47ns5DUs3/BPPzgl31f96Wqt1iCAqYy3zTRW4VcXePFWRAb1USYUp016mYrLXePzm3FQeNsWU3jsOZw/E38hmeJfs2O2dry4Hx0DMANUauYwUH51PxVNhFSm9Z8Ts+Cm2seklERvlDQVOdS/vFVCKOStVlwU+7g1hqu/PLtfWpLjC1+u/DZSFlyElwab6T6Mo6RBBOEZHs3NYcq00rkF8lkC1fybGioNNBKRHn149f/HRwQw9Q0/hSDKZ1Y4D0r/3MMJrYeXXYUos6xA4OQh5HNrGv8U7Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WBF4k0F+B5SMUxaMnRzNewxPWXXvN3yT7disMFt4lmA=;
 b=cD+/WqVPqPiRh5p1P97qzbqS4vOTKdOBzPv2iQvEsMJzIxc5F5WEkmbMYx7KVrd9NU+14x4Uh8ofwsaG45V4b67slxGYUS6KowUsFBbP72CnTAcf6qs4QpyqqKJu8LCzmweZoxVL22Lg2ScHGeGS1LmBTs610YbXsxlUIGYtfBS0s813XCkDrcdE4pWXuZd7UCiLadham3ysGwRugqLuB5No8S8sgd31IVudOzgi8/ol3YgI/rMy9NCuFIh9oSRmZzwLlUH3mM2qakj54haHG8tVowb+R9E0YNdF/GMQOQ9xL5sL5qcfR4jfFFCNLDiyMccUQy7VzXRVLFDwVVPaPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WBF4k0F+B5SMUxaMnRzNewxPWXXvN3yT7disMFt4lmA=;
 b=XBlpakMz0WwQ6W+sgf+q0nugqv3SaVuq9cJENSG6dflGUtPMvoaMSRHNuXwUVRV5Uxx3V4qxEwkzw30es9xBYash98hpPgVTci+kW34mPiZJONnhKJHfI8rh5RAOwu6KjK9dS4qs9zn2jy0eLG60AaisVbTb8S2FHRHobqOuGYbyobUR3CMFoqMIjojivvybCLzn5FiP3FTo7sL6t72Lz+WSkSxguFtVGNuNh4tdeoC7ycw19isT53IXDirv6hD1SNxlh8T4VyPC5Khf+ZE7Unqe2hRM13/NydPJDas1EgBmEBv6uTAYkJ29M+uNiFw3DK1ybIu8sATsn5X93AhWTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB9075.eurprd04.prod.outlook.com (2603:10a6:102:229::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Mon, 10 Nov
 2025 20:55:32 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 20:55:32 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 10 Nov 2025 15:54:47 -0500
Subject: [PATCH 7/9] arm64: dts: imx8mn: add wakeup-source for usb phy
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-misc_dts-v1-7-7564b9f69a18@nxp.com>
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
 Li Jun <jun.li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762808097; l=750;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=/VWZbS+hj41hTosxD4U940fd60kDz94wX0PuVEj/l6E=;
 b=dRcYjgQQwHv1+10i1s9zsE8tPdUoga6o1MoqCFl2VV+fSK6Uhoo9o/CJNK5iwFWptIxJS6WE7
 iPLDXPvhz7FAoNEEUHEMKiDhooji1Zc9NG5P6VUOUbJeH2ol98c6yAT
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
X-MS-Office365-Filtering-Correlation-Id: 6f43cbb9-f321-4297-3bbb-08de209b7cfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N24rRnNVVCtYYkVZa294WHJaT1d3ckVzbURxVVlDQUhMdEZhNnFHY3d2UmFT?=
 =?utf-8?B?WUJOSWFUQzNkSjRLMnMrQ2srMmkvdUV5dWlsaFpEYkFYeTY1Sld1Y1o3cXVz?=
 =?utf-8?B?czY0OWw4QkYzVTVXdUY4SW9TbkY3dTFMZ1BpWjZtaytNVXI0ODRjTGlBSzhI?=
 =?utf-8?B?YlpqdVF1NkZsVm9DeGhkcEFpSWRVVnBKMno0WXZzcVNITFkyalRaTW8zTFV6?=
 =?utf-8?B?NUxSSFFrQ2ZrNDFLUDlsYmlHSmlVUnBNdkwxQk9pTWJGZzdLc0kxTWVyTjkz?=
 =?utf-8?B?dzhSQWErT2FyTWdlVG5aSHYzV1liWVVkc2dBbkxvUDB3R2diWk12K0JkR2VQ?=
 =?utf-8?B?d1RFbkl4Um5aUUJrbEZYUUFiZFVKckI5K3hIbno3NUtLSzNKQlEzUnplU003?=
 =?utf-8?B?UkYzSTg4Wm0xa09JUFpyTWRrQWJ4UTNkRVM0WmFNVlpKeXFaMmcxZ04rNnVU?=
 =?utf-8?B?T1lxRDkzTkk3aThNNC9CMW9pbXRiVG5NRjYvcTMyeFc0UEM1dTBCdE9TcFNZ?=
 =?utf-8?B?eEg4d1hOQkwwQ0JNWXRqY0tPUlBjakZhcXFtU3NJNlZXQjlORVJjU3VmbWR4?=
 =?utf-8?B?NUwrcEtuOFJTRTFUd09vT0sxWmV5SVNhU2I2bjFlbWYrbnhrbURLVVJxYWV0?=
 =?utf-8?B?L2FTaUhtTVc3R2E2VVgyREZLTWp3ZlBDU2hpWnY0cEo4MDlYVHo3TkcrWHhj?=
 =?utf-8?B?RjNCODlucWpxNFBzSXVaemRQT3JBUm9USGxlWG1ZQ2F3ZFZ0K09BNkZsSG05?=
 =?utf-8?B?NkNvdlgwcEI3d2o1bWxia2ZHL3pUbnNTVUF0ekJmSEhod3JwVk5aODlSd01j?=
 =?utf-8?B?TEdZWS80QjFFbVUvcTU1ejV2SUFuR1pjcVJoUXZRbkd4NEo1SGdqejJMemg5?=
 =?utf-8?B?Q1MyTTd5bWw2RDg3ZU9hbWE4ZFRPQlJPS280UTN2YXQzVjBGMjIzdmQ3YWNC?=
 =?utf-8?B?ZFpCY0U0Z1U5Y3MxZHhLZVRDdlU4M2RwOHdpNk1SVWJ5MCtsekhyQklKZTY1?=
 =?utf-8?B?clpYN2owcUtxNEVqUFZJVEhveURBZU85S0J4Zm9OSkZVN0I3SGlOdVd4Kzl5?=
 =?utf-8?B?UFRhTWlacFlIenNtV0VKd04vMHZyZHJ5SytnOGh5c3FuVXdncERUdGxyTENj?=
 =?utf-8?B?MjlKWkIzcm9rVkZKT2lHWnRUdEVMZWpWTjU4Z3UwOUZoekdWam42VTlSZERz?=
 =?utf-8?B?WHFVMUsranBEcDE5ZjcwcEZIRmRkR2R3d2hzU0xqS2dseGVtNjFGWmFFUTJF?=
 =?utf-8?B?S0VSR2VueE5rNGliMkZ1VEdZbjdVQ0xyTmh6S2h5NlZqTjFnOEtvQU1tWTVo?=
 =?utf-8?B?ak4rc29iTEk4V2dIUG0vRWdXVi9CK0Rscm8wRGplMjBoYWZ3Z05RUVBJY3Jt?=
 =?utf-8?B?R3FuTi9SbE80SmpFSWNYUUNyWVNZRWE5L1pidGJJYlMwT0ovb09LL2xlUS9k?=
 =?utf-8?B?bStDWVhkN3Z0ZWptVXU1eDZtVzR2R1JaMXN5bWR3a2JRVU42Slh1TFd2ZTc5?=
 =?utf-8?B?UnlhVzFFSEhHeWRlNkJuQjJrVlRlWjk5bHhxQWJxQTJOSG1YckU4YzlhMTJI?=
 =?utf-8?B?a2RCaXVUWGt4TEMxRWhNcnBUa3o3Yk9Qa01GNW1JV3VBSEFoVlRvRVVnOTBk?=
 =?utf-8?B?eHpxMWpWbmlibTYxUmQ2V2Y1NllZSHVkL3owSVphSTdWcm0wcGNVM2daYWxz?=
 =?utf-8?B?K3JPcFEyTXlLS2h2UDMwN2pwUkZxWU56SjRLc3J4WjJQMUhUTmh5LzAyaVk3?=
 =?utf-8?B?UVJGdUZPQ3llYzdsU01NajkzNVFla0dUY05qWCtjWllRUU53UHhzdGtxNkds?=
 =?utf-8?B?RzJza2VLZWJhVzlsTitVaXhreVFxTnUxY0JBZU9VUU01RDRJOVBLWUJUZGFI?=
 =?utf-8?B?TEtxYXlyU2U5TFMxbm9EU0RCL2R1elNVQ2pFaFQ0RnRSZUZJb0YxZ3pRNXVB?=
 =?utf-8?B?S0U5cTNUSUhrbDM5VGdyZDdaRHl5a2V5WVhEOFZmaGZOSTlWWGRZSDFLL2Mr?=
 =?utf-8?B?Rk1md0xjWnlqVlRxNEdjOFJCdUF2cFBHL3NhSy9XMGpnMEkxSWZJSjdkSzkx?=
 =?utf-8?Q?gV+6tP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnYrcDJaRExxSEZCM0E1Slg0bHpLTHVRdFF4MlBTRlFRdkk0ZWgxdmdSVi94?=
 =?utf-8?B?dzBpOVpxamQvNTZicTNrNXQrY29rdGZqOGxrZ1pucWwwdTd2UEZGSktLeVQ5?=
 =?utf-8?B?WmRUcm9vLzlFZ0RYelI1eWtGL296QnMxbk43bXRPbjBiWlZMeTVXeGt6MnBF?=
 =?utf-8?B?bHJRNEZEY3hBNDFUMXdNYnVxYm1PRWVhbW8wWWt2WmJqSWIyVjFPd1p1MG5O?=
 =?utf-8?B?UVBEejRWMlRIVU9TdityckJMREMvMWljam5LM3MybXVDVi9jYlFES2IySk5j?=
 =?utf-8?B?a3FwNFpNWXpRVUpXam5zZDFiL0doR0UvbDNpSEdQZnIwL0k1eUd5MnZOYnBQ?=
 =?utf-8?B?R2s5NUxKK0Z3SmFNcUVReXZLWVB0ZVRxSDBmNXVCL1p2ODFHZXA5UjgzUjlk?=
 =?utf-8?B?M1EycWRJTG9MWWRJdU1BS2tyNXRxRjhYOS9BNVdOUHZSSkVFaFBKMWZFcisw?=
 =?utf-8?B?NXFLYWVTSEZ1SjdldFVRZURBVFNyMmtBTUlBRnllN2VEcE9BSFgyWjN0V01X?=
 =?utf-8?B?cTY1MTdlSDAyNGVuUUNvb1dzMWw1WGZUWGY1blBoMzZBU1F6UHJsZ3lyTzZT?=
 =?utf-8?B?eVM1VVRtWFEzRldFai8wWUZVMTNBV2lKdzZmRUUrcHRKd0F3c05zSlhNWWpl?=
 =?utf-8?B?UTQ3MzdldFRFTEpibEwzV3VOOTZBVzJSWFhEN21tdEFGU3ErWk1WOHhxQ3B4?=
 =?utf-8?B?dzN2bUQzejRvZGw5cHovMWYzMXF2aiszNVJldXNidFNNYnpCTG1RYVI3V3g3?=
 =?utf-8?B?L2VmYW5qem9BNHR3OWdseFdVNURFdHJuQWo2a0RhdWhqTitQNnVWbFc5NW5q?=
 =?utf-8?B?ZU9KdS9tN25mTUtaTTJ1dWJkY24xUVJmZlBwcGg4KytvTFZkZDdPTUNscWRu?=
 =?utf-8?B?aDI4aEhBajRYR1g2NlNXV1BFaHQwczBOa01LcEw2YzZZQVBDa3FGVmFxYkdL?=
 =?utf-8?B?U2R2RnhZalh2dkxWQW83cDVEc3hIUDQ1QUh4U0NmWkhxWWNMVEhxWjg2YXFx?=
 =?utf-8?B?MTc4czV6VHpCSnorcTBBa1AxSUxYKzZHMjl0Rkg5dVB3VDlqSk9ab0JmOUdU?=
 =?utf-8?B?V2VDY255RXJabmpTbVRlUldoK1FRQkZobytCUkF5Z1U4UDFIdnFQYSsrdVp4?=
 =?utf-8?B?dGNEM2tJenU0enY2Uk9idWF0Z1doK1d3MkFIQ2ZZUEcxK1p0SjBsUWVMTnlK?=
 =?utf-8?B?VzgvcHNrQmRaZ2gySFdsQjhueUhMeXNPaFdESzZWMDlwem1ScHk1dHNzbThL?=
 =?utf-8?B?L0YxejJ4WU1mT0M0bmFZTVI1d21keEtHelg2SXJNc2ZDOHNwQ1BDc2ZpMTVZ?=
 =?utf-8?B?M3FaekdpdTA5c3Q4NWhITHpMWlAvMlVRY21saklqQjZwUzlZRjVqL283WHF1?=
 =?utf-8?B?Q3l6NkZmcFltKzRvbm5pNTFpNk43bUUxZ1pDUWFKWFJSM3poa2xNS1FmWHBS?=
 =?utf-8?B?dzQvcXZudWdwOXMwZVNRQ3lJSUx0SUZtbEt4ZFF0djBZR05aK1FreXB0aVMz?=
 =?utf-8?B?V1I5Y1RNWFRqZDAwMjlQNkozNzV5MU5aenFKV2ZQZVFEcW9rdlhrVlBNczdI?=
 =?utf-8?B?dlIrbWY3eTdFYUFZWVhHaExhcXMwNEhDUXJrdEZjNG1KVCtpQW5VSzM0Q0l2?=
 =?utf-8?B?c2V5M09xQ3VON1ZOYkt4a0NOMzl5Tmx3K0FzTENqUjArRUZlWlBMUnBXMjdV?=
 =?utf-8?B?cjIxTmd6UmJ4enpLTHF1VmRRcUJxeER5SEJVU0g1bDBKUmppTUhRWWk3Skky?=
 =?utf-8?B?RGdTNXBQNXhsZjZLbHpDY3U4ai9ZL256ZzZCZDhkTitZby9rT2xyMkF4Wkht?=
 =?utf-8?B?dk8rbktEL1pwRm1lVW0yQUhqQStLKzUybFFoeFc4cVlCK0hFUU14RWZqVTg0?=
 =?utf-8?B?NnBHa0o0K0FQbUZPNW9rMFRkRmFCWEk2WEFramtBYTQ0RmFadVp2MDFvN0dj?=
 =?utf-8?B?c3RTMDJXMUZRL1QyZFkvcDZSTnVhcXAvR1lyeW94Q3o5eEJibzFkYWhLODN0?=
 =?utf-8?B?c0p1MmsxUGRtNVdNQVIyUHVSNnp6cTRTdDVFTnM2L3hHdURWaXJBbWpVaFNO?=
 =?utf-8?B?RlpaaE0yTVhzeWxYamNDV1BFR0JtU3NOWDdsSXFKMFJGSW1xakVZRXU5cHFi?=
 =?utf-8?Q?YjolDoItb3NCjc5BR/VQQ5fsV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f43cbb9-f321-4297-3bbb-08de209b7cfa
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 20:55:32.5438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z+aHzi2qvmk/tSdFc0NA8uA9UrHNUtPvgoiJQX+6ZhPWlCy8DrUaxGf2HgSoj4P37QjVDphrEc4MttOE7rxzKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9075

From: Li Jun <jun.li@nxp.com>

USB phy can be wakeup source to support wakeup system from USB.

Signed-off-by: Li Jun <jun.li@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index b98b3d0ddf25aa4b98f8320ecc7f44e22271178e..f65258aed3b72cf98e82432a59dce2acb001ad95 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -1322,5 +1322,6 @@ usbphynop1: usbphynop1 {
 		assigned-clock-parents = <&clk IMX8MN_SYS_PLL1_100M>;
 		clock-names = "main_clk";
 		power-domains = <&pgc_otg1>;
+		wakeup-source;
 	};
 };

-- 
2.34.1


