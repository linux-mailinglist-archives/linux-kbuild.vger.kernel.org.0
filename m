Return-Path: <linux-kbuild+bounces-9538-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E0FC49521
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 21:55:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F08A84E8706
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 20:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D954C2F6176;
	Mon, 10 Nov 2025 20:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jaUG8b3N"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011012.outbound.protection.outlook.com [52.101.70.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD622F60D5;
	Mon, 10 Nov 2025 20:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762808123; cv=fail; b=PcJ8P0uXFxakxiTVehpIW30k3cV6NZFPAxFJxDQTAGnLwd8xTs993y2ihtpU/VU1//quqMKyhlCH6kUW6UtMCahhMtwIz+qdUBKJWTwaRSS8NAj4CSahOs9iFQMS6ynQb4nhtm7o7u/zTYSwCQtBiJ16XsRzCq6h+RUPWpIzJdk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762808123; c=relaxed/simple;
	bh=FUd4cBq5lboBcW1nHbZQH2sqDmdNvP0o4MjUCO9aeK4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Wb6U1M5Rt7BySpiBHLygOEhmudnFgYxy8qmHWYpurr8W41cQtCsWw0d4WLLm82PGN8RNsbewZQG9oRDtgRs2MOeNl335n+96n7+LQVLLChRRTKms5E1Dmm6kBvKvhxDGXPbexPB3WdQItHS92wAlsLxIbrBETXa/Cnu5blkq3cE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jaUG8b3N; arc=fail smtp.client-ip=52.101.70.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SXgksa3CWsyrzKIdPnG/9yD5uIkJCHkvFZzHg+YoGaeVaURuoliTpfmWkT+u4nawUNvWR6FUCa8gtqf9u4mTJvyYImre3RXBXWG669V+pThUjE45+R++J613CzrrNilw/+3JZlWAzXsXTugso2tffbVHY85YPSXt8tUrDzpHQD8EkDQ3Pgg87RbR4hEsviXNpoVrEd4Mk6ZNTuVCn8HUzv7bN7WsGPNnfP8PFmXbXz+iJRTybtMlka+y7ibC6fr/G0gUy5xxwH+//u/Iv/Ld23qbn61qgbD5wx0i1J3RDmh/sD7ZS7/NnoHX8YeAmdRy6RprSYv600OBncn9xxASDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E3/amf6nicwhwHnEVCk0M1KuiDXbLlTtREd6ayPOfWQ=;
 b=J/5SDHi0x1sGH1NpTEWePdOj4s25j/+3FjXhSnDIt29N8y7nUnWzSJmPlfFeltfK5sZZqv4fjNWKyliopLhgq149o1XJ7cAHHibss1fWF/XFoOP4X+T9ujzT0XAl8IU15A1VaLSIZkfKhZ/HeqBo+Xz8C2Up/jcL6+kzAWNoF3Kr1LGPXkA+9pfwJDU4dSuzlk97maCXWmiCP8rmgnFRt1qQMwImW5NENgO2+1MXR8QyilE2y0G+AvdXkr9Zlv7WDHMlnViP7lW8pOp08+pyoQQFkydew7vwUau3Hr0ScPFRzv8d/DNAcnWDWOVNxfF5YVPzvTjp1ee7/K19llWhAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3/amf6nicwhwHnEVCk0M1KuiDXbLlTtREd6ayPOfWQ=;
 b=jaUG8b3N80oI4k4YkDe7OPyIgs+jKO4dDN6NUkc3O7BHZ3gCqaLwoRUYOGsiOFhNIpcSufHnqpzw/Iegm5j+JYVc1L4CGlHvHpYLAwuZ1+Qgoz5cfIDYejL6NAEy77Uyp1lys4AhP3CHJHuq4YU6YX8c2Ap/aU/xihEc9+PDVxxhmS5IVWamEJUcjMoceVEV07sUEzG8Jkf71el8l8jKJ0WbHnNyog39OqqVlBEeNQ6Uu+8A5ojhU7RnxKPcB1hpsaNvsTvXlvWQC2ws8aJtx28Gqszny6CROZIjGp4Np1y6RPoODkZKg8U9XSZbKMAAiYvbpMXiFtk9LqUpQRKuAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB9075.eurprd04.prod.outlook.com (2603:10a6:102:229::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Mon, 10 Nov
 2025 20:55:19 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 20:55:19 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 10 Nov 2025 15:54:44 -0500
Subject: [PATCH 4/9] arm64: dts: imx8mm-evk: add wakeup-source for usb phy
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-misc_dts-v1-4-7564b9f69a18@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762808097; l=987;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=xA+rBreqLfXu6HVM11dxRXnXUVf4/xFi/oF+XVyzrRc=;
 b=rf3Gb72E/4A8RynGc+Aulwi4Psdztbdlu27U8RC/8Ii5WTQx7c4AjAGx1uhQc/BcDniPJeCkD
 IxVxOFJapPMC1TJzqjPIkRFi3hLs1ArlF+wesbb6YdwOHUW3c4MkePz
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
X-MS-Office365-Filtering-Correlation-Id: 15af7478-1327-4528-19e2-08de209b7510
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U0I5dXlRVEIwODNMSm1tQWJOY2VWYzhzd0o0MWdGRHpQdG1yQ091T2YxT1JF?=
 =?utf-8?B?KzFONENrQ0pVY3duNU1kdk9QbTUvZE5WNHc2UUZyY09JeEZzVGU1WS9oVWlU?=
 =?utf-8?B?YlNOUVR4emRIUkhVdmUwS3JBNnY5UlhPUWY1Zi90UHF1NDJzWVF6V2tCNThX?=
 =?utf-8?B?M0RybXRGRmd1Zm84akdGcmlnM29tL1l1SHBTSGgrcUNNSXgxcVNiVFZzL0Mw?=
 =?utf-8?B?aVNqQmFiRU5uYW5IL0pkZ1BJRHZkWWxuR0o4eG1FQ0FRaElaeXA5aGJGeXBF?=
 =?utf-8?B?TDNqdVh3NDNGT1h2MUxlalJHdjdwdHBVQXJDMkltT2x2cnQxbERZYmxZcHNJ?=
 =?utf-8?B?Q0UvR2VseGRjbTJyMXFDVlE0ZHN2RnE3Vkg0bmNQUzVydVNCQ1VVUlJLNnV1?=
 =?utf-8?B?N1psL1NLS0tSb0NUeWpWNTR4MEZCQkhUUmZwSVNUVjc3Szl5Vy9DcDlGdFZ5?=
 =?utf-8?B?TUUyei9UVjRNS3RjbmdNVmFmZHBQSTJlcGhwL2ZrNzZSNTllS2ZpL285L0VY?=
 =?utf-8?B?VjhudEd4VGFuOTJyWGlnSXlNTFR3WkI2dGJpWGdyV1EyN3ZGbDVEMTBBa2xI?=
 =?utf-8?B?NGpuNlNVeUREZ0N2YnhEVkcydDFJZWJDbnVKSzNBanVuN01ZVHY3eDhUMXJa?=
 =?utf-8?B?dGM5TXhrQzJJR0Z4MVZzTmpCNXRSNXlTK0JjSmJOdVFPY3hYamYyVHBHVk42?=
 =?utf-8?B?dFAwRVlwZTZHNG5wWWpSUDU3dVN3cnowS2xuOENpWm9VRWYwUVRITE9mRFlZ?=
 =?utf-8?B?Qk01ajFpeE5JS3g3MlIxdWM4K1R5SUtZZnhhZi9KaWt4R2Q4T25VZnZmRVo4?=
 =?utf-8?B?dlZxL3JQMXZiNDdKQnBkb0tmRHgvaGVqUGNMRlJHN29RYzVYd2VaYUdXdUxQ?=
 =?utf-8?B?YXZiTnJuY0Z2ck5HZXdBV3lwdmFIUXh2WVVLbjdlL3IxRzB4bys5TmFnOUNs?=
 =?utf-8?B?V0xOMjkvL3o0ekQ1NEpTM05lamhNWElOY0JNZ2hiTHFZUEZjbWo5bXhpYkdN?=
 =?utf-8?B?SFo1MWxVQ293MHdDVURRQXN2RG8wWXdlU0tDay9EZWZuTXAweXlueGdvTDZE?=
 =?utf-8?B?aHg5QUIvTUl1b2VhQTRNZm5BR280dkpaTTRVTzFGeWZQU3NWYVlwVHdKUlB1?=
 =?utf-8?B?TlpxUG45MjZnWGR3QnV4c1ZBUnh1Y28vN3JwN3labFB6cTdpaGtFYjNPUFU4?=
 =?utf-8?B?TWxjdUxkQXlSTDVVanpJMHlQOXhUamt6SGlmUXRtUUo3MXpTL0wyU0g3MWF1?=
 =?utf-8?B?WkcvTGdkNmYvT3ZBbitmMjFnenhmc3lHTmUzdTFpbnY3Ky9JQnZDV0pPbVZZ?=
 =?utf-8?B?TFQwc2J4MkpQbzIwL1IyL2d4MVFuRlFqUU1uQ1I4M2wwRTVmNW1FclVjRkg4?=
 =?utf-8?B?NHhSLzZEemkxV3kvTDFQREJnMktMMUpxM3hmODdNLzl6bEJQSW82cUpQcGds?=
 =?utf-8?B?a2phUmFKMTNNbUtVeFpIVUFXT043Z1crSG14T054SjVMM2xvWEtuOHliOEwr?=
 =?utf-8?B?NzhuQSswK05hSmE4cWlyamJDS0FFV1BTSUNLWnBYZnRVQW9qSFRnYWFILzFr?=
 =?utf-8?B?d3p0TXM2RzVJTFkxaFFpOHhoNWhScHM0dmVBWDZoWk10TDFqd2V1dC8vYUVa?=
 =?utf-8?B?ZHZzS0tLTTRxNkhkbVZydkxjYmhWYUdESnZuMWZLcWp5REFXVmdGSElaaktj?=
 =?utf-8?B?b0xRSzV3UStOa2pWbUZHK3NvN2szbnBxUlJ4c3RKd0dxMHVGeFdLRE5ENXR4?=
 =?utf-8?B?WEhoTmVrSUJTQ2p0OWVPdmdoTGh4NVMyOXZidHVlVVpOcU5JczBRRG5Oekdl?=
 =?utf-8?B?dHhDQzd4R0dRN0duRG9wS1V1TjBkdjFwS0JqNzZsTjlWWW5GK0xlc1Y0Nmpw?=
 =?utf-8?B?QTBiWlRXQzdSbWZmd2c0cUcrZFdwMzc3bGFlL2QwWDZYSWxHT2s4QklwZ3Nw?=
 =?utf-8?B?K1o4bWxEOTVWWTg2blpRWjlObnpWOUJDNVN2UWJXSFgxWi9EZ0FFdFdjOUpp?=
 =?utf-8?B?STQ2ZXJlam1iS01TMFkwdDIxdWpIS0hjZ284WmJWSE9BWTVoOGdFdUQ5eFJZ?=
 =?utf-8?Q?mxcXC1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXZuZnpoS050NUlQcEtaTEtKMGtNdndZVGVUay9mNGVFYUxkcHQ1OTdubC9G?=
 =?utf-8?B?Y3d5SlZSYVBiZHVhOGxtVkttaFdqQmZNYmpOSXd6d0gzUHBPWTBEOVVRTExC?=
 =?utf-8?B?cHF2SmhsMUFSZjE4a2FyRC9yRnF3aVVuMmNGSGdlekVMSS94bTVwb1pCRjF4?=
 =?utf-8?B?cTZpbjd2dURpVDFtYjM2OGZ4ejN5dm9YdThQTThiZ1hDdjZjWEhLMVc1QjdP?=
 =?utf-8?B?NUZCQ0U4emg2Z0crUW1IcW5iVFE0OThNcGJ3WmN3ZDNRWXJBRzg3VXhQZ3F0?=
 =?utf-8?B?SkpjMkdvL1JtS3JzY1dpSjRBaHpieENsVWpMR3Z4d1d0TFRzdG9JTWtoUjNO?=
 =?utf-8?B?ZUVTc3lYdzRaZy9td0xxY2ZEbEV4Sk0renAvcHNDVmQrOS9kdHJKRy9SN21u?=
 =?utf-8?B?bWY5bzVjUEd5ZGRJZWREWVR5VndEd0pHUnE4bVNxVVlnMlhRRU1DT1hmQUUx?=
 =?utf-8?B?ODhveUdFVDlCek5QV2l1d1NWK2RnWHFFUm1tY21BbElLY2NRTi9mWHMySzM4?=
 =?utf-8?B?TlcrZ3dsUHVmaUc5M0hBN1ZCcFFqeExNc0NJODBOZDNBN0hvOElyU3hmMmlR?=
 =?utf-8?B?bEpNM3BGT0ZJaDcxUzd0b056aDJYaHhmS2l4TTBKdEpsN3htMmJTQ29SMGJt?=
 =?utf-8?B?NU53Y0hVcE1pallBKzdFdFJYOW56MlJyK1lyRUcra0IwcXc2TXRlc3hxT24v?=
 =?utf-8?B?K040aG8ybExLODV5UFhoRGhpWWc5RTM4Zk1Rc3N2NkcxSG9wZXMrSWhwK3R6?=
 =?utf-8?B?T3hxelJvbkpKWFBTMHQreVFrQlh3T3VYK1FvNi94Nyt5RnRRVE5YRXBncER2?=
 =?utf-8?B?WW1MbGpZaGlyYW9XSW51WWNTOXdRWGp6VzdRRWQybzFUUDI3WElvNExQNTZK?=
 =?utf-8?B?eGRGaWpRRVhTZ1U5ZFFobmZUQS9FL3dSN2xiWDZEOUlOenZZMGJIRTlGT1RG?=
 =?utf-8?B?V1FMU292TnNQbEFKL0tNVEpQRGQ3QS9uU0NpakNsZ2FRdzNmMGNWem1ZbjFo?=
 =?utf-8?B?aG1McjFET1ZxVVAvUk5yOURPV2VqOHVYeStpOVNLR1JUWGdOandvYkJPV0Nv?=
 =?utf-8?B?NVZTNk5rQnVlRE55b3R3NjdRVThxajdPSXRPQWdWZG1nNzh5SWNtZHF4WjlJ?=
 =?utf-8?B?QjNvUURLcHZzakx0Q2IraEhETzFUK1hUbng0NGJFVm16LzZRQTJXQTQvZG9y?=
 =?utf-8?B?V0NGUndydmZscm1mcmZsR0QxazgrNCtyK2FhMVc4QitZUlg1US9GcFVOM045?=
 =?utf-8?B?am5IRlljT2hQZStNd0MzL1FyQXZnZDBDSHR2dlZXZ3Z3QXZGNS9laW9lM25Y?=
 =?utf-8?B?NnFESGlDRThmVVo3M3gxNnAveS9BZjZvV041TEpjVjYwbjRqOGF3L1A5bmth?=
 =?utf-8?B?YklSWnBnMWNFVjlGbzlEdXZFWVgyYlNLVm8yejRhZjJ3SUNhMzg1aUlvTldE?=
 =?utf-8?B?N1hKQk0rc2RHM2xLZyt4Q2MzZVYxOUdVQ0E0TCtVU0ZFSUtTeVBNVzNCaUtr?=
 =?utf-8?B?YVF4UWxuT05jcVJrMVY4M1VHTno5c01MZUhXbDhLOUZnYy8vRnFjc1ZqbjRo?=
 =?utf-8?B?ZXNXOU5Pd0VFcUU5TzI0NUNOV2hlZUtxSVpWRks3WWM3WXBMN2ZRQ3NDMkph?=
 =?utf-8?B?RlF2M2JwYWMwWjN5WkRFZmxUY1ZpazJUaUYwNE8yTUYrWVdjdDJwQS9mNmsz?=
 =?utf-8?B?THFRUWJ1UU5iUy8zei9ucTNaSDlReG9MUm1zbGVxNGowQXViWGhDZDZqSWN2?=
 =?utf-8?B?SWFQbG8ydUMyb1k5Zko2eXM4ejZIMnZpdkIySndET0VIY2RDK21DODlSaVRN?=
 =?utf-8?B?S05wWWU4a1NwV0hocHdJKzhQQmQ5bkRVU1VmL0ZRa0h6M2Y1Z3lQQzZLQWpt?=
 =?utf-8?B?RDhuL0tTblB3eFluYzhOZkROdFZCaGlKNmhsQ3BRYStuYzkrbkRqWUlQTi9U?=
 =?utf-8?B?eFZ5ZkZkVmtCcVZ3TnNOWDZjZnFZZExLYjk2NEQ0Qy9hZ2xLaE44RzdrM3JR?=
 =?utf-8?B?WnlJaHcwR3lmQUdOcDBNTm96TVlsay9zenUrMjlvSmZJRFUvRGVBSHVqSzdC?=
 =?utf-8?B?L1pYSThaTXpQZWJHZnE3bU5VS2hpVXFrS3FVTFJKa1VETFdrMFpmN0c4d3JF?=
 =?utf-8?Q?bcA1ZehEw4MQ4MX8mZWNkFxgw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15af7478-1327-4528-19e2-08de209b7510
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 20:55:19.2173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YNs2/R9KufCWOZTzY1NroyVTLBHYWty/qwvBnla2UnxbsDEoVNCMbHttIGhcxwK+ddxtYR8I7HPR9tboEJwBww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9075

From: Li Jun <jun.li@nxp.com>

USB phy can be wakeup source to support wakeup system from USB.

Signed-off-by: Li Jun <jun.li@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index ed8b4843acb4804379ba025e83a63fe962c2937e..dfff164db827e80ef8822ae330fa604d1642f6f9 100644
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


