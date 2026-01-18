Return-Path: <linux-kbuild+bounces-10625-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AD5D39278
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 04:38:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9A4273010747
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 03:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9DC030BBBD;
	Sun, 18 Jan 2026 03:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZKzsi0J8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011039.outbound.protection.outlook.com [52.101.65.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781C530B51D;
	Sun, 18 Jan 2026 03:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768707500; cv=fail; b=qeCndj8M0tJiz9SGvZrOtZFMUizGByjnzBhA9grQfPpaRIh5HMS3J398YChXmnw2OEK1+N1tT8AQIjAluAYMTetg1n4KsgXv/XjHT336vg5Z6g8y9rbSZ3FqfmR9143kygpid0GCio6WVJYRc1bi6ifu8xugls0ebfF0I6xADqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768707500; c=relaxed/simple;
	bh=OV+HOTvw1Ajrgq+p3EzhWwbcLpmcPveMxd4Kere8yq0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=WzsLDxP4GQ6etOBroSP19rOatFbsQpCYzL0bn48f338Nql4AHn6w+pBRQtoVCoDgfQJOwRCnThxSUZYDvNdIOzm9VB9YVeGDKp1/lmiF/h8yb3y/9r5jgOBBeiUWXu1IHytT6+gE21INkchkyCZ4oKsZocd5ZZ2pj9KGTMUZ3m4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZKzsi0J8; arc=fail smtp.client-ip=52.101.65.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OTdIUG3KV7siWjkIKjwQXRn34MoVXw+WoP+lDVvy0ldXxFu9FqUC2Mcu34eYBvuH3DFtvAoJTy8n6eDkr2A2lwewdsOHwkaCUT0h4EQCvQVw5mBLcYtV8MZeEf1RcvaNlNiwMaUKxUy3gqRae/3n7mNAhG9MKQ6WXEtKdSaB/HntYutybKDqSc48cIKdaz1CJW8lLXS8mskisL4IjY71a7TMOiDuEcGFW055VggtQ/wc7y/ls910tVLOKPzqYFgxVs6fTvbhibkUHkTChFG2jJ30Mgx6hrowonuvb3UZBwddAEgdHjn0OTNyRvrqzrkMxEQNjtnizXbYnzj/mkLCdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxTbAZzPl2kyJyYM7tmn9nMCPt5ETqtocihpCCE6K0g=;
 b=lJa51vsBlc1vOFfvgQGx8B2cGvR54rBGoMQUnIkWHB2sROKjGvIk6VGa7b8XvsR4lPR0CJjEIvXAWvwonP6hEATdY6xzZOY2MM+mRxv3G8sB2b4TgsGylm5xzkY3I3eUPK1z+E+w1R+6e0SOUNUqvkL2SMlQWHFf/M2MYhSYv446ppW46sKbZfulROsJambu7g/vlE2l3ROgIQTh6vdT13Yu+9ElSg0DPLHHabFOxp1+rowVIH7eUInTRF1yevl3EiAGljQ1Sfnzlwwf+1wkXZrlkmMk66dxkcYbWZ25l6WBg9/9UL4E+QWKI3CiSweMclqU6qzThnFkSjJkuKaL5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxTbAZzPl2kyJyYM7tmn9nMCPt5ETqtocihpCCE6K0g=;
 b=ZKzsi0J8NPTyBXcEYMtONZ60qL7SA5N/jyzgTjIDPZIihIsVc0LGTXxxxayl9qXKhpCjdJ0YE3fooTFvHiUi+la82F4BMieynllmotqUlEY2xLG3ZWt9481o1FY3u4oP4bkl6j1pB1wx1X7PMuwjGatLr6M9zx58oxDOOt95phhi59UUqG32QfQNUz3kYOtf/YzDOuydWraaEiG/HmkTVdLvW1brnqRRqFvF0u/hxoHcPaxEv2vWoIVwkwTPl4GSxHjer/ak69lCf/IMGI528AP3CkiQMhywyCReoG0pt7E1xQRZ/TEBq6HhXiglzejJsgygAMkJcuQf5rg7DgIpOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by GVXPR04MB10021.eurprd04.prod.outlook.com (2603:10a6:150:112::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Sun, 18 Jan
 2026 03:38:15 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Sun, 18 Jan 2026
 03:38:15 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Sat, 17 Jan 2026 22:37:35 -0500
Subject: [PATCH v2 1/9] arm64: dts: imx8mm-evk: replace space with tab
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260117-misc_dts-v2-1-0f319c7e9b55@nxp.com>
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
 linux-kbuild@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768707488; l=2939;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=OV+HOTvw1Ajrgq+p3EzhWwbcLpmcPveMxd4Kere8yq0=;
 b=wWYAfSqSBbQrwNxDuZYrQOiwptLNdBD7B+Cga+O/8f7t1i/XgoZJZsTgynSLMV5eKNhMNzJCv
 fbxDklxUAt9AOuuts8cO6SVlH72YTfywJsYQXesveHesJB0UspqocwD
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
X-MS-Office365-Filtering-Correlation-Id: d9bf8b7d-68fc-4906-e098-08de5643037d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|19092799006|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MUZ6MEF5N3ZNVVlOcUVlUkNhVXp2UUxpdHRkeTBueC94Z0kwL2ZBc1lOYm53?=
 =?utf-8?B?alQ0M00vendmZ1pZUVpsZjBqL1JQemRxR04xaEVjR0R0eTdyaHBScUtqM2dm?=
 =?utf-8?B?NTlGczB6SWJOTEh5UXZIOEVWMXVWbTJTdzhOOWxCZFI2V3JzcGtUQXNweFhT?=
 =?utf-8?B?NmpueXgySExKQmtrU0VTV0lleDl6SXM4azYyZkJKV0IwOUZSVE16cXdPdDI3?=
 =?utf-8?B?SFlyZktVREQ3V3R4cGEvdDN6ZG1NcUZsdGhVTXF0MURMUm9iZlcrczJ5L3pF?=
 =?utf-8?B?L2tPVzhIREkwdU5jWSt2eGF3UVJCYkZnMHhjVFM5QURFUmY2MzQxSHMrc1BW?=
 =?utf-8?B?RFVsNzBFNGt5RWVNRTJkVE9WNGxENTVHNXNoSVdVRk1kNStqdjF1VkRtVUFB?=
 =?utf-8?B?SzJsQmF4RzU1RTRGKytVY1hLWlFqRnNtZlo2V1hCbXVsMG1GUEx3eDl3TjBr?=
 =?utf-8?B?UVdLeGh3UE9wZXRMQ2htYmJ4dlFTaUZoaS9OdUZkeGVMOWhtc2VLZXBpSUph?=
 =?utf-8?B?RzJIbjFCei9CR1hYSFZ1ZmRyUVpSeWE2MUFudzVtVTdVT0JqeDExVEhjcUNo?=
 =?utf-8?B?TCtGT2ZSb24vakxuVzNraXlxUGswendoM1NzU0VJSHBuNDJCMjVjSGY2Y1Jk?=
 =?utf-8?B?WmMzbGVYSEJWWHMvRU03SUZObkVvR3hZOW1SdWhzZStwV1Q5UmZHdlVPbThG?=
 =?utf-8?B?QlpLVHJvbldXOVZOUEo1endVbUlJbDk0ZnVCTWpxQTNyYit1NW1CMDV2VGxO?=
 =?utf-8?B?dDcxM1FmbytYbmRaajFHVWdhS05leklUZWg0ejVxVHd3eWdScEhWWWpVMkR3?=
 =?utf-8?B?ZzFKb000enhtQWxNSzZBbjBlQlhxZVcrb1BLaE93YW95WDIxKzR0TlkwWGpT?=
 =?utf-8?B?a0YwZEhPSkZ5emowQXgxS2VxaXBGejRWS3ZhKzZlYmJ1UWt4RVQ3aEtJVVYz?=
 =?utf-8?B?cC9sOTIzRVFWZ0Z3ZzNsTkhhaU1neGt2eWpNdlVtbmJJRERYbzF4bkQrZEhu?=
 =?utf-8?B?N3laRFJueW5iUk1KZ1RnT0ZWcThQeFJpK3k4MW1wazdqR21kTDJUTXBxczlk?=
 =?utf-8?B?MW1jR3RXYmswOUtIQW9uZXJpSmYrck1KRzVOem5ZaENic1cwYWE5bUpoWlUv?=
 =?utf-8?B?elZHNEdDK2ZRck0yeEJobnZ2RHZMTFBKOEF1bzdzYng5TmIzbzNWRlVIeGIx?=
 =?utf-8?B?cHI0eVBHWnVNNFh4TUVUaXNtUWM2Z0tNTW9GNGtwaFNDcWx1RHZrYWg4V3Nu?=
 =?utf-8?B?SnRJUjZ2YkNTZ3hPdStheFpwdWFoYXNZMXJ1WThTbWVjTFIvWGNpQVZMZ3lw?=
 =?utf-8?B?UXRkSDVPa29yS1BrTXdsbnlDRERtd2YvT3pRbGhYN0F1cXhJeFk0WElYRG9m?=
 =?utf-8?B?ZEE1V0FZTmNyTmxlYlRLVTZMSkZEd01XQU9EMXhFMXphaGF4TW5oVlF0SnAx?=
 =?utf-8?B?Nzl4ZHpXaFFwWkdzVmk0SmpaWEtkM0I5SGlPSTRYbTV2T2Y4Skw1TmQyTFAy?=
 =?utf-8?B?Ym1FZFVIVVpqWGVyTHNKZklHR1hhdk9uNEVsRjlqZlZGUGp3bEl5Tjc1NktJ?=
 =?utf-8?B?MGlCcUVlc28yNHlJWTlyNHl5SXg1V3ZQU28wa1FxdURBZUhUVW5IS3V2S295?=
 =?utf-8?B?VWs3WEpJSzNiTnUycnRvWjVTa25jK0FTdDNaSWIvSW4xaXl4eTQ2SlVjMzhl?=
 =?utf-8?B?dTZQVU5rUkJXUmRiYk1JdXpDelEvRkFPZHhpUm5QODRSczJjNHdVd3JPTUk0?=
 =?utf-8?B?UW5OZHI2ZnJUbnlEUjF1NzlQR2RuSWgwWnk0R0lBRFBnbkc0SjlhbHREUC9y?=
 =?utf-8?B?bitMaFhvNXJRVHRoV08vdTVCUGY2b1VhU1k3WjJaK09teHNRZVZxWjVGTXJY?=
 =?utf-8?B?Q09pQXFmaTNRb0J4QVZqQXloUDNha2t2Y0pWY1gyMEQzeGdBSmprT1lHN2wv?=
 =?utf-8?B?MTQ4aVpEYzhhcG1NbFNmNndqTE4xQkVuTVdMa0N3OWFHc1JxOTV2aHBVQSsr?=
 =?utf-8?B?R2ZCMEVVSFFucWN4SW9mcEVGd2pTQXVQUDlnQUd3L29idldYTE83N3RwQ0No?=
 =?utf-8?B?UFRFNmFyOVBNUWVEZ0FTWE9kRXM1ZStXaDl0WUltbWNQVTZ2TWRROXdtcy9V?=
 =?utf-8?B?VlI4TEVJT0pNczgvMUZ1Yy9TVDJjSitNYXNrTWVzVE93bFVuYTlVZVU5ZEZQ?=
 =?utf-8?Q?kmfyNMZq8HA6wmlmk9WMsgI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(19092799006)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zm4wOEthMU5pZnJtSktWSXV2TWxsL01qYmhSWWFNMEVyZm1LcnFsb2xzMHFz?=
 =?utf-8?B?bmFKam9ESFRwejNEaGtWSlNiTkNIa2JMMFVCWDhMUkJwdHVCVXoxRWEwWnYw?=
 =?utf-8?B?cEdQTlVuejBQb0Q4TUcrOVVvN3lPU3FzR2dTUWJSQUFEOEMrWVU3T3NxNXRs?=
 =?utf-8?B?VjBOdlUvR2grUzl6OEt1SktITWZGSXoyZTB3eVZqNDk5Z1ZFcHpLRGs1aWVw?=
 =?utf-8?B?VE93TDJVc2NOaTN0ZkowN1VzbjFKbkFLb1pvS2ZBTWFVMDBQSzZJTUkrNmpK?=
 =?utf-8?B?aGk0Um5mN0lpYjhWVDFrd3N4WHdtY21KMWJmdy9PSWlLSkpLUU9JZDdMQ3NS?=
 =?utf-8?B?bmJqem1MTS9tZUorVWNzS29xc0k1eDZ1Mkc4bnliRGh3R0lBSnZtTndaRWZV?=
 =?utf-8?B?UUJWUCtUMVVTSkhvWjlrY09HTnBxWWl1WEQ5dlZKMjZ5bjNwK29SaGdmcWFo?=
 =?utf-8?B?aU9ySWtCUVVHK0xxZTlNcUwveU94UEtUYXZUcUkyMXdBUUkwMVp5dzlRK0ZN?=
 =?utf-8?B?Q0NGd3ZTcm5xckppckN5YmRRSTFPTDdqN2JWZHpOSkQ0RTV4SHNKT2JoWTk1?=
 =?utf-8?B?MGdTc2RPc25xdUFwckdBOTYxcFIwZkt6c1lFMXp2M2dQeTlwMEQ3SGM5dDBi?=
 =?utf-8?B?bkFNUmF6Zmt5WHRZYWtBanQ5dHM2S09FT3daKzFJc1U4MUVZNkdoZ0d0Q3RN?=
 =?utf-8?B?dUprZmVuK0p2TERkOU5vbzBEcG9MTXA5bjVpL1ZTSjJXSkIrSlJhVTBEUmF5?=
 =?utf-8?B?VC9RVzdVT2lYVUl5MXpMNWhiUFlUZkpzQW1GRStReGM1QTdDTW1JL2U2bnlL?=
 =?utf-8?B?eHlzZkFKN1VTbXpqSm5kck13eDFpZHlYNDUrTi9RM0l1RFYzNFhRcURKQy9U?=
 =?utf-8?B?cnliT1QxaDVPMW1TdmRxTjQ3MzhlYTluZDhNclZqSG9UQ2xPVVFYNC9IMDhD?=
 =?utf-8?B?RmlZVEQyQnQ2UytaRTlwSXkyd1FaU0lLZVd3OFVyOWxFcEpHcC9qQ2tDM041?=
 =?utf-8?B?QlYzNjdyM2p2UytNaERVUjYxNTZNOFUrMkN5ZFViMmN0ejR0WG5JbW8rcmll?=
 =?utf-8?B?UXBTVXVkYjVmaDlQd05PaDlOYTd4NFpSUUZ0M0dpd3NaYVVFMkc1THFoVUts?=
 =?utf-8?B?QStZeWNRRHNBWXB5b1ZDZzVuQkdGZldSczdqM2liZU16KzgzK2F2Ny9EZUNm?=
 =?utf-8?B?QU5yMnVHc0ZHakZCdE5oWVhKS2I3cERQaHVtTm5jNEVSN1oxZ05TVVpxUzRp?=
 =?utf-8?B?bEh1MkNndGMxNHhsMzRvSGVldXorVHlXMngrUlkvWWhqaDZEUmF4OTlwdUF3?=
 =?utf-8?B?dVFOUlpoVmx0ZGhRVHBOSnhlUTFhVDdhckowUURjbWhsL1RzZkN1Z0JCREFH?=
 =?utf-8?B?eXpoZkNNTTJBM3g4KzJtdWMzMnZBS09oeGU4Rkh3RkFPOVZyNjNPaHgxTHJn?=
 =?utf-8?B?MVFkb3NNR0s0VVN1Nmhob3FmZVR5TU5kUHEyNG82OSsydHRqU2tCYnFJbEI5?=
 =?utf-8?B?ZVFpUjdsZlY1ZmRyUEszSEdMV2ZMYTJIc1lwSjAvVExLUVF5MU5nYkc2Z1R5?=
 =?utf-8?B?UUhHM21mNCt1MnJyWC9HSnFoL3JXZ2hoMnlDUldlbVRUNmhsVkp2QUE3WDZM?=
 =?utf-8?B?QW5QNTVlamFIVlF2eFZVdXVpR0Y4SDh1THo2WkcwZXRLNUdWNW5JbWw0ZzRv?=
 =?utf-8?B?MWFJdExZLzdCdHM5TDBFTm01LzdteXlCTnZVdm4vb3VrT1FsSXJGcnFrZGEr?=
 =?utf-8?B?QWtWOWMvVkdnamFxbDlSR2JHV0VzNUk4NWhlckpiNzZXWjBnaHN4ZFVNckVy?=
 =?utf-8?B?cW5kU3BKMiswOVFtVlJ1Z1U1TWU2SVZFbG13WHh4MHExMG9qUkY3MEtvamlH?=
 =?utf-8?B?eG9JUHpmMXZ4R2pwK2pKR3g0bzBqTjRISmlNaWJHd0xuUTg4dUJzRDhLeDY5?=
 =?utf-8?B?YzN4UTAzNDJPZURLSjRnMzhoUHJDdUtlbHR0YUR4aGtmWTFZYVBaYy9iaVI3?=
 =?utf-8?B?Nm1LN0xOcnN5aDgwRmUzdXVSd1dhOGp3cnFvNDBXRUMrNU1BeDZjVW1wTmYw?=
 =?utf-8?B?bGpqQlVBS2JUaWdyMUdQSzZXRko0bWl2MVlaMWNtQ21yeDJDczJsMEk3SVJl?=
 =?utf-8?B?SE9tTW1tcXYrVVg2ckgvb2UvVXpmZHlwQXFEdGlNK1c3NE9nYS96bmJXd2p1?=
 =?utf-8?B?eXlOUG94dTAzOTZESVkvZWMvZW1NcDZSR21yb1pqNlV3bFVjcFRRcGh1dTZp?=
 =?utf-8?B?Y2k2VWJoSlFxZjFWTzdVR28wczVPVnVXOXkzRDJkVkh0U1NhMzdyOEFnczU4?=
 =?utf-8?Q?LqOEja5GP7jLAnp5o7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9bf8b7d-68fc-4906-e098-08de5643037d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 03:38:15.5352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LyyOZafCH0MklSjIOhj4YW1bUi+fbsWtOw4ob1beYCjm9XvZDkKfqSMBjXEOgnToRHoe+tXyF5GjTcUvcxaqig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10021

Replace spaces with tabs to follow the coding style.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 38 +++++++++++++--------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
index 6eab8a6001dbf9d88f1de93709faa3d82dc56da6..f58d849a8709485424d811f32f565590f2eb3f52 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
@@ -691,7 +691,7 @@ MX8MM_IOMUXC_NAND_READY_B_GPIO3_IO16	0x19
 
 	pinctrl_ir: irgrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_GPIO1_IO13_GPIO1_IO13              0x4f
+			MX8MM_IOMUXC_GPIO1_IO13_GPIO1_IO13	0x4f
 		>;
 	};
 
@@ -724,26 +724,26 @@ MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA			0x400001c3
 
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
 
@@ -761,19 +761,19 @@ MX8MM_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x41
 
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


