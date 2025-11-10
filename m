Return-Path: <linux-kbuild+bounces-9539-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BFEC49524
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 21:56:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EDCDD4E8DEF
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 20:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A6842F6578;
	Mon, 10 Nov 2025 20:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LwxsHI67"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011025.outbound.protection.outlook.com [52.101.70.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304842F6195;
	Mon, 10 Nov 2025 20:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762808128; cv=fail; b=Xcpf4rhxgbwG3qXLmRXgMG9d1wzWcoHOJFDPEyDGNh+t95Zdtv/SA8xtXYNR8O41BAlBN2fwpmYrp4AyTxRclq5p/EQTZm1z4vwD8+5BIrUIvQW2bvz8UUKAxY/Yu+/UzvZ+hMhJDYKmowJhKJoGrSfNMq1cjGLck4vAoRjDLgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762808128; c=relaxed/simple;
	bh=IP/e6yZv79bgF07KUMq0iJZui/LzH1b9ZDcPKHGcB5w=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fpDg4xWO8NUToFAzk/YQlCSrRIhORl4AiGvcISLVdUpPxoLse6ar0JBx9p4kXB5+pVsCeWinPbP9HfUZnkgrJXkm7j90qhipdwLhGG3jL2Zp3a+suY9B/HsaGq67SI0uZMIjQSzR8XXPyWj2ShXZA0JXKxbwiRzyVq7+IQJJRgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LwxsHI67; arc=fail smtp.client-ip=52.101.70.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mW5X9LPl3kPrZWbA9CZcEIartuyofecj9ojY0il+IKjMuZHmQOy6wc91eCvwPMb9CPc67aIk59EMA5gt/YMFUUMjc2I2tLbeAkfAqbOBkP/NytR2yQcihtby3NIbPGT5jA+aDWV4g+BleJVfaIDPMuNMv/RfvoTnCpExDLAr8JZI0Qo1Dm0bphUQb641aCLiGmkzSMgnXjvGy+3ar2bUv3gogou3hN3UDMgQSelyEAEitUiCLLbv7QkcwG5erhMBDt8TWJ6XxjkKApItBFPReYskgn74OyGnaw5/QpGu8hcm86Vj8sIWyRqeE+ZvaQaDWcN6FKcBPAymPgC9UP0rTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b0x9IB7EaC5FPtcwKVv/2fYeRImQK6e7HdyQv+CN0c0=;
 b=B2hVuwZbTf/mbQVAqHBuMlqPG5zcPcT8JJwWWzq31mKxvJs5oSA0hlTIWBKMugw1EWY71KGxuJEvLdEgG7hYr9ZgMlMd2ekbLTYtkQkbNiFxUAsdAPoBQsUHri+Dl1R4HTmVL585w2oJ2z90T8MvEYHTJ4LKDjD3zG1b88rTCwbMiama62+qh7vCgtg3TMpMaUF0EmeBH+1Y0zI02qEBylJjpqT/fuiKw9gENhN1q5etPDYMHMCTJyQ05mcpzo1ndw6Z3cnL43V3tHggOv050UlxsV0TGhuovofCEg6CTdtqknhfadTAPrZFmnUX5Rb9jxPS+ITY6XCGR4UdNYhfJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b0x9IB7EaC5FPtcwKVv/2fYeRImQK6e7HdyQv+CN0c0=;
 b=LwxsHI67TA9ka7pmNPgh375QK3svicrwit29BHKX6PAvHqcfTXUlV2yE9FSi8U1hmV8IzX99W5viMDs+K6Pr8ZccI7S49vMPjhIUuqf2SJ6MFCrSPbO0Ba3VzrSy5CrwciOY3lHXtMqGQjfEQAIzJe7oGuItIW5tok3TDnTz0jSMfwvDUowMPvAw//zlGPxW5TFnnQn+4zE6UAF0c7lcWTP66wdjuOPTAzZa6hrnyBecfag6MjVKDdyWLDjT1G4c+8iEOwfXLXFBLHeNUs1Xg0w4fuhAu9d9zeomvD3Jut5iZA6OYh7BPusyvlp7FRwSbX1NGHpW5k4Wb/rRBejBDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB9075.eurprd04.prod.outlook.com (2603:10a6:102:229::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Mon, 10 Nov
 2025 20:55:23 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 20:55:23 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 10 Nov 2025 15:54:45 -0500
Subject: [PATCH 5/9] arm64: dts: imx8mm-evk: add uart3 port
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-misc_dts-v1-5-7564b9f69a18@nxp.com>
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
 Fugang Duan <fugang.duan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762808097; l=1341;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=t5yMn6L/pqjWxLPkPWjLISD9GdR18Nt6QcgWgJXJVmU=;
 b=EcAOQd5AV/zEDexVigqZgvF3RYfy7/pVHVN30jfhUFOH5ionReOax2o2o++HNYxKKqlRXS2Ge
 g4WsnEBRUucAeFzpz9c2ySfCUUN4m/2JiecDeU3vO346r0jvPZ8DT26
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
X-MS-Office365-Filtering-Correlation-Id: 598d20bd-ee8e-404d-dc1c-08de209b778e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZnlYWFFIVWNlY2FteEpkR2tpem1DRVM5VFNwM2xBeUdvTWIxWno2K2grVFlx?=
 =?utf-8?B?cFlmd0dIeXFtMFR4UFMyKzdNWnZNQzV6c0FHLzhTNXFENUpxOGRISFBvQkR6?=
 =?utf-8?B?ZWR2Q2QyZWtTcjl6Qkc0Nkg4QWJ3bHRERWpuVVFGMXg5eVZPNFJHSFRIcVda?=
 =?utf-8?B?Wk9xc2RWK1ZFRFMxOWZ0TU1obkhtQ0dzc0dzdG1JYXdEcjBOQVpNaS9mZ3lE?=
 =?utf-8?B?SzBSWE5pcEw4SlVjZ2ZXUTIybVgzeGlsak5ISnBxWEV0SVp0S0tGRGphTXd2?=
 =?utf-8?B?ZUlkWDN3NjlKbHhoelRvTmVUeGV0YUdyVWJSNHRSdUFNNy83bVVqMDdIeExC?=
 =?utf-8?B?UEt5aWtDMXMxUFdvZi9UTTlHaVlaekprRXZxZTFScGpocnNLU3NLcytUUys3?=
 =?utf-8?B?UXdobjVSZGw1cGswWkJPMS83bXB3Mzl5UUpmREN3MENWck9uRDRVSkx5bWhq?=
 =?utf-8?B?a1FFcXFaT25WZ3dWUUVXbkpBL1h3dk56c0Z1NjVxTVVxNjE5THRZVlExcGdt?=
 =?utf-8?B?OHpwTXdGazBicHVySmZnVWJkMGhnMGU1dmloeXQ1RWtWaWVOa2VyZkJQZlZI?=
 =?utf-8?B?QURqUU93S01FZ0d3ZVliY1VzVWV4R1gyMlQzNktxZ0pHTEVRS2lmM0dUbXI0?=
 =?utf-8?B?REZqN3VkR1NoL1k5Q2NOUk1rUGtYWUVqNVZ4S1pubGNISjYxRDZPYm43ZEU5?=
 =?utf-8?B?LzFBTm1hNGFUajYyV2gwMlNCUlRnemVaVzlLc1VGemlzZTRkQy9CWUc1MjVB?=
 =?utf-8?B?VDdxTklsVTVaZE1Cd1dRV2wvTUxUZmJMRXRuMWkwak5heFBVWUllMXdFajAy?=
 =?utf-8?B?UGVNeEtsMHpwZmk2WmFvR3RzV2h6NUFST3Jxd3dEcVA5aDBtY0g3QlhJb1dQ?=
 =?utf-8?B?cGxQa0lueTNKZmF6aXZGZTBXQm51alFYZTR5MnFQSTliOGNYT3lPL3BNVkd0?=
 =?utf-8?B?SmVhZHg5VFMyVHllYXp3QktmampSbnlSVHJCeGNsdHJ0SXBRWWZsQm5aOW03?=
 =?utf-8?B?NWJaWHk1dG1ETnJFSzJDK2FqVkF0cThLVWN6a2dBeHJYdzh0bzB1UnR6bW1u?=
 =?utf-8?B?K3ByWStobUlySk1vcFZ1YzZDVWl2VWIwRGI1Z0FRWXJoL2cvUUVoeHI4WUlv?=
 =?utf-8?B?bHFSRWUxZXpFenQwdjVXR1RoUklrbmh2S3MvSGtOd1hSQWJwN2FEblN5enda?=
 =?utf-8?B?YkVDTndyMS93NkQ3ZEhVVFRCYlBWQ1FJOEptVGd3ZzNCOWYzZDJFU0lHd29o?=
 =?utf-8?B?TXpNSmVBcHB4eDRubXpFZkNacFVLRXFxU3hoZkpHYkN1eFJWNzl3bXYwV3Ir?=
 =?utf-8?B?eFB1a201bEt4SUhQK21EemkrV09pejhMTzlqTGZ1a1V6ZVVWcW92UFhnTEVN?=
 =?utf-8?B?WVRTQlpweVNiaUJ6YStvcTVvNGhnS2JNM2x6VXEwY3prbEYzb01TL21HS1Nz?=
 =?utf-8?B?b2NwY2dzYjFtZ1psMFhWU2l0WGZqSnlmaEdTTVkxRGREY3ZEbGROVmwxRVZ3?=
 =?utf-8?B?eVg1RzloanRzblVjT1hMdDNRaExna3FSSXBmbW5ia29GMkxPWGU0a3ZBT2dz?=
 =?utf-8?B?eXFlMzcwREtYbXZ1ejVqUkNMWmx6dUp2eitUeWt5encvdzg0ejhyRkdWdUpx?=
 =?utf-8?B?TFVJM0NwN08rSW4xVmRReEtQU0FIeHhaVlhsRm81RzFsQ3A2cjYxT295ZFhj?=
 =?utf-8?B?Unl1emRKamE3eGpUaXBHOVpuVWtvSmxlZGZzcnBLOGVZdURibkFRU3BrK1ZI?=
 =?utf-8?B?ZnJSUnRXckNLSkVST3ZYTVIyQm5lY0FyRVlFS01jQVRhRmQ5a2NxVkQ1Wkts?=
 =?utf-8?B?RWJEU1lUKzFQNTRydlgxWXJsTzFlallMbkt2TENlVVpacEhvYmExYjNpTnJL?=
 =?utf-8?B?NkV1aEJQWHZKMzJ2RXplMzloU2VLV1BiMmFWVlBLWXhaR0FiMS96UHE3a2R0?=
 =?utf-8?B?c2kweTBKV0RoQnlXWm5mclE3cG9QY0hzNnhRbHB2NStJUFFkOG52NUNFWkI0?=
 =?utf-8?B?d0czQXVvOHdLRWFuSmtFdG55eW1qUWRueWdTMlRIQ2d5bTEyUy9yWEtjWlVy?=
 =?utf-8?Q?NjfXY1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVYzQjZKaTRqM3NDY0hCb3d1Skh0SkRnalY1Q3JJZ1lHS3paT1pJMDhaNkdH?=
 =?utf-8?B?cUxKNHJYaWFwTU5KcHlMT3RuSTJiRlB3dHhTTlNyRlA4Z2lyUGkwUDFqS0N2?=
 =?utf-8?B?NVJjSkYwYUV6bkEvY0o5WXNDSGNLWGtnSmVsZE14bjNHRWF1SllEYzZCdW02?=
 =?utf-8?B?WFRnTWhiVDFVQkdMVzNVNE9rTVhyVHdkUWVCNUN0Y3BXSzVsdGFubzYzcTM1?=
 =?utf-8?B?WEYyOU01aTJIcUc4K3h5SjRJVEZNTGlBNUUzYTlGRlVyL1NnblN5ZGxZWWtN?=
 =?utf-8?B?dTZiWXZoRkJQRzFubCtDdFdkWU42dmd2T2VINThkNGtVcE5qWmhIUVZBanMr?=
 =?utf-8?B?Skttd2VpcUh0UFpXTDV2T0dHV0YrbldpTHQ3aEd4WWhLSjFiM1czOVRhV3Zs?=
 =?utf-8?B?eTN6bTgzZDVBa0ZORTNhcXA1cjkyNnlhUGNnYUJsYzVTTFFtWXNmekJsL0tr?=
 =?utf-8?B?NnV4U2FqSGxjMHBWMTNYSVQwTUtKbUdramxxSUI0eGtVNW5xQjdSZGRPUkdR?=
 =?utf-8?B?UGF5WXA0TUxDUGhlQmUrREhkdk5naVo1d2dDcTJ6UnRyK0VjZmdIR0l6MGpG?=
 =?utf-8?B?WnJsK2Z3dG95MVlkZkthYXBhOGg5M2h1Z202Rnl6akNvWHJ0OW1TN1EzalA5?=
 =?utf-8?B?ZDNaMWRwSkovbU0zSmdaUjd2aE9CMkJPK25TSDVnOFlvN2JmN0NTbS9WZGda?=
 =?utf-8?B?T2dUN2lncEMzejhNWW5JTkpXcnFTSGRiYS9rZDlvU3BNem9SNk1MRWpIYW1u?=
 =?utf-8?B?SmJqcFg0bVExQnlVSVZVMHFvZ1FtOE1VUkVZQWQ2NU93VU9GQ0pGTXpaMkZQ?=
 =?utf-8?B?Tk9Pd1dKdGEzT3o5NEJvWWEwMlljN0twWEJqS25oSnJDWjloQkUza3FMaUhD?=
 =?utf-8?B?OVMreW5CQTkrcXdGSnNZTDB3U3poTDN4WExaMnQ1R25MMTMzaUdqM3lqZlBE?=
 =?utf-8?B?NnpOelBlelJJUWM3dzk1eWVBWDlrc0daTnBDME9SRzQ5YmdCUENob2VkNDVr?=
 =?utf-8?B?V0hQOE1rSGJIa2RpUTIwSTlhaHNIVmZaTHNYQlVTU1dFQ0t1OGhoRi9VZlNE?=
 =?utf-8?B?eHMwdHlrT3JsL1VpeTkyMGEvQXdEWGZOWHZBN2NFZk5zZWw5K1hpMU1mWUlz?=
 =?utf-8?B?NktLWk0yd29pdnNZb0hkSktNWWpPdUJCQnZxN3VodThSeFBlaDVOVG1kUXhh?=
 =?utf-8?B?c1kzMzRoTE5sdnVrdGMrNlMveEtoU0xaZmFsUVlzUHpoMWJyY3JleS9FdHdM?=
 =?utf-8?B?ZEFKSGozenNRVlNYdGRXU0pjQXFGWlBLaWJWY2QwYmJDeEkyWG5pVDJ6cmpC?=
 =?utf-8?B?T0l2bCtTVEpJUjFRbWRWRjdFRUl6dXEyOVprU0xYZEUxN3RtcG03NDlrVmpu?=
 =?utf-8?B?aXBHb3lPN0c5M2loUXZXSG0wRGF3bTNMNkZ0ZjE5OEdiVjZoekhBQ3hpUCt4?=
 =?utf-8?B?eXdxM0tSSUd0ZU5IcnhtV0dnNnJrQTN1cTUrYlNQUHJrbmlnS0dqQm40TUI1?=
 =?utf-8?B?RGRnV2JJNnJlc1NaRUY4aWZ6MHBqaC9LSFFQMitmSTByYjR2bTZEOHlqZmJM?=
 =?utf-8?B?MzN1REsxR3drWEg2cGozZWg1bitmMzBYNTJrMC9OOWFRWmZtRm9mYXZER0M5?=
 =?utf-8?B?NXo0WWlhY3AzOWM3Wnl5ZGRYTXl6c2h5eHBvZ0xTQlg5VXQyK1BicWhvbGdw?=
 =?utf-8?B?RGU5TnVMTStXTmFGejlGVVRKM2JBRWFla21RRUdvV2ZHZGhJTG80NGl6dmtp?=
 =?utf-8?B?RTZoRWVqSGZZQ1hvbXQ2Qjg5d0JBanFwYlpKbEg5MWhaVFpiOW9ITDJHY1BE?=
 =?utf-8?B?N1Q1YlBIcWtCaFBURi9FTXpKREQrZktic0Uwa3JMSDZ3c0FlbnlZdks0WUlC?=
 =?utf-8?B?R1RsNkVvcGttTGRsSnRWTVVVYXhwTVlSTlFOa1RGaU1zRGx1UXBaaUxDRzhV?=
 =?utf-8?B?VnN0ZU1kWEpiSklaSU5nb0l4Ty90QTVjRCtnOXhGSWo4OWg1ZUxPTEhuNGhl?=
 =?utf-8?B?ZWlUYVZDZC9VWkh2eTRmMEVZK2IrcDN3TTArV3ZSZ3M4ay91RTVvV09XUzNa?=
 =?utf-8?B?YWhjVmdCV0hyTnR1T3Z3ZTRLVC9RVk1zZjdZTFQ0ZmtyTCtrYTJtV1Vnb2g2?=
 =?utf-8?Q?XWn9xP5rUKkMW/i5nLmJi88Wn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 598d20bd-ee8e-404d-dc1c-08de209b778e
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 20:55:23.4793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jqeEj7TfkWnwJMj1g/UjTNSBjIBovPHydoGC6WIiWkxDDEphScaBjmm9AC9faCPpRRerRC9yh4ybnODYNAnbLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9075

From: Fugang Duan <fugang.duan@nxp.com>

Add uart3 port.

Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
index 308e644d2af296ae88cbbe01e3bc59346b310f51..374d375a790397e97e525b53a16c8c842479975a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
@@ -626,6 +626,15 @@ &uart2 { /* console */
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
@@ -818,6 +827,15 @@ MX8MM_IOMUXC_UART2_TXD_UART2_DCE_TX	0x140
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


