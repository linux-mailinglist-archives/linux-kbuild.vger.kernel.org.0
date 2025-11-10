Return-Path: <linux-kbuild+bounces-9534-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 644B5C49503
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 21:55:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 579E24E2DA2
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 20:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30D082F5320;
	Mon, 10 Nov 2025 20:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RLX3E/QM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013013.outbound.protection.outlook.com [52.101.72.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1C32F28EC;
	Mon, 10 Nov 2025 20:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762808110; cv=fail; b=BBHDyld8+HurG4OADChJ8HJQtCDqeBe05C1sTtMxuXtOMVachDHu+b3bYOneRXYPAUy+YDRRTyp7ajZ7b6D4y7ocUq2PPybLbB+DM1icwBUm8KZAuIv1vdfsXXa/QskPZ/og5HVS9XuWprxc2vDuMKSBVqVBHF6G8ERVebFn08M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762808110; c=relaxed/simple;
	bh=J0D2qnkspe5RZJy0CfZJksKDysPrJjLRUSMOPZ0TBT0=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=qhqFzik7QoqWJyOjzwuOPhrsLmVj5LEdKMn/CCYLHp92Avr//OL5i3Hsp5uc9MXiFY+ZubpJtFm9X2iVHuerTJo8dIO7wkADRZGyVZxU2SmmymwrEZCMs4cd+jYqzrry1H/Ov0Q4K1fFRQ5dqygoHn7lSZHHOD8oeqDX5zILo00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RLX3E/QM; arc=fail smtp.client-ip=52.101.72.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wAGOmJXAdz56NXYLUsasqJrOBbWb57iuIlImeFiQ2ZJBMk2G17FJ/EXYCfLW1CyIgP+OpXJ3+LyO07y92ChydYh+ACA/JZl5jwmrgTNixyqRZPKGoOBXQxotih1LD9Q/nP7ir7YC8OH0q6fDHFojXZpfmR3Ehn9+nMRQfE/W9qSIpOQOwtEcDzqnzLY8skyoF7rryRj5CN1RrtMgJ8YbRUidM209s/BIqo2BJVYV2pi5hzES5qGTFmmK2KENdGamZRBazXSxObI38IjWP+TTU4EJcsA2Sa1rqjor2++cUA0BRbvt8/GQmm08YWHHr4YSZcJRueJT8YRArtpjBfiBGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/faaoNzPB9953pfRilV6n1dRUTX5kpC0aHb2cvknfo=;
 b=MmJuKtBSxeJpLVI/MHEPwjG0f1ELPEZnKBNrZryjZmJ6Tw0I/J76tGGpfsmk0D8a09IXxjXrV+Sa1Ub67S7xUVLQN6LgJWUkuD2bd/wj+OqUiwO1Q6w1uJVLA75feqybBIsebbRyKhR9Vd59d1GBsaBwPOUiGtdmBdjo5dE1pnyCq6DrCdsgSGx7ZX32UsaOzno7+iQkQ7AQvkrvCBxQI+c0D9eY4HJI5e/ZvleavHURenMX3ZbifyRxaMuvGLNiXzDOqedzcFQA7xv/M3tAMZWXNHSro18OeVBKsomgjonJMM6J2/HZRHgeJDPMBOg/8YXNIp5R6+taMojJruvGVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/faaoNzPB9953pfRilV6n1dRUTX5kpC0aHb2cvknfo=;
 b=RLX3E/QMXAom66TfPIUTGTdDwDLeaAkQe0w1Kmyu5J1PlUsPAdQR522CAu+0T5G6QI2b50mTM1mOaAqOQMWCDBvLQqMx+56civS67pgSDurIoEdGQbcUv0H5NYfCQd+ZK/S0+cDqhxbs1YAo6p1+EshGhMHO88DHiNOHiOI6EXtMPwjmeVho7LVgWJ1TRWXv06knNezvAnPO/KHsxAqIkYGefeQ1cMWIPGSRVBF5Ijenpv8dBpX3ytrYBsYZjrZc7nJ0uL8vWc8xwHyeW6QzrvQrG1WtEoeVVROF7owXExAFpu+FH8yO6vtB0wkukmdYWtETukP8IyTFF0htnOkUWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB9075.eurprd04.prod.outlook.com (2603:10a6:102:229::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Mon, 10 Nov
 2025 20:55:02 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 20:55:01 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 0/9] arm64: dts: imx8m*: misc update
Date: Mon, 10 Nov 2025 15:54:40 -0500
Message-Id: <20251110-misc_dts-v1-0-7564b9f69a18@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABBREmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQwNz3dzM4uT4lJJi3WST5GQLkzTDxFTTNCWg8oKi1LTMCrBR0bG1tQB
 W0GUiWgAAAA==
X-Change-ID: 20251107-misc_dts-c4cc84f1ae5f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Sherry Sun <sherry.sun@nxp.com>, 
 Li Jun <jun.li@nxp.com>, Fugang Duan <fugang.duan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762808097; l=1203;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=J0D2qnkspe5RZJy0CfZJksKDysPrJjLRUSMOPZ0TBT0=;
 b=qTLSlEDKtXs3Q3MXGP4BHyiATobLj8hEvFxPoEYnYaFq5bM0vqQEfqMZyyFTGDgSEi5VIxyXv
 XM27+BYonNyAgDzUC88NXgW0It6czTLUM+AYvkjzAsTTsAMLk8MlYZ2
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
X-MS-Office365-Filtering-Correlation-Id: 12fa737b-f50b-401b-3c75-08de209b6acd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TWt4OXlDeFJqdkhLaGVzdk9aQTV5TDZJejhlYmVGN1NsOEw2Rzhsc2dRaE5v?=
 =?utf-8?B?RUcvVC9PQ0FSS2p0aG9pdyttVzl4VWpaRndBbXQyNVdaMVl3dFUzaFZORlRj?=
 =?utf-8?B?ZUQ0NHRocUJOd1RmTDNIZUhyTVlUOHZPVitLbENXMmtDYWdCRGVhU0RRSVdN?=
 =?utf-8?B?cVRjckZiUXViOExQSDk1QWo5SHBpV2d2ZDdvaUZxZGUyQ1NsNnd1a2hJZFZi?=
 =?utf-8?B?S2dINEFla1dkZzBQRHpoZ09EUG85ZWxmaVlFdHFPYThHVUREMkNVcVdkelgz?=
 =?utf-8?B?Z2FDRkgzNEFLc2YxTTN2ZVVIZC91czA3YTJmVnRqM2YrYmtleHNjNXByL2Rr?=
 =?utf-8?B?SlVET0RVdWhJWGk5Y1RzTTVTQ3I5U01xZDZVQ1NGT2xCT2pLeHVsbWFTL00r?=
 =?utf-8?B?aGFrNU9NSEJ5NHRsaldTZVRoSkVGa01HL1NYRWdLVzAxUGNWSlZ0aTZra1Q1?=
 =?utf-8?B?bW1FVFFzZWUyODVoY3gwQ3BGSTNxZUpGcDhBaGE0VlI4NjA2VGxEaXJhbGNm?=
 =?utf-8?B?NDlucFVDSWtrYWpEZ3l1bFA1cko5d0swYmV3ZWNMOW0wWU1lV0ZwQzBjN2py?=
 =?utf-8?B?cVFiVVJ6L1hoSjk1MTh4bk9Za0xUY0RKK2VuVitwcWpwV3JnZEpudnNhaFpO?=
 =?utf-8?B?Z2NFWUt0Y0JPQU9VZDFhVmhwdmttZ1QrL2Vpak83blhvUlVwTEMrL0xFWDZ2?=
 =?utf-8?B?VnpTdE1IWVhXSlpIRjdtM0hDU0d6ZmZteG1aLzdlVldHcE0zQjMzS0JFKy9T?=
 =?utf-8?B?QThkZi96VjN2Zmw3YlgrdElKM2hUSlFzUjljak9lakdLaWdKWkMzRkVSdit5?=
 =?utf-8?B?UklyUmZ4d0c4QVZabU5Ndzc4NEg5U2hRdHpZMTd2V3hVYVI0bmd6TXNtcER3?=
 =?utf-8?B?eG1MR1NZTHdtb2RUQ3VlOWhILzZ4RjRnUFd3bGVKWldiYktGSVkxTEZUSG13?=
 =?utf-8?B?YThSbVRSeHlEbGlZYU5Ra1EyckNzWnVoUG9IU1VndDhoL0xyeWl5RDBGMmhD?=
 =?utf-8?B?WTFNUjMwbHBNSVlVNi8raXY2cnc2Qk9VODMrWUp0bklyTUZGM2dlbUhlVmQy?=
 =?utf-8?B?K0g2OS9WdFpPMFlxZXBLMVRoQ2wycVE0VFdhbWRLWDdqRGhmOWQySjJaaUd0?=
 =?utf-8?B?Y2p4OVdWbUcyK3dGRS90b3FhSVNneVdIR0U0WGEwNjBOK1JSd1B3eG5CUHc2?=
 =?utf-8?B?Sjg1QUdSckEvZVdSenpETXJBdzgxZC9PWHJTZTVoNzhobktsQnR2ZDZXcDRl?=
 =?utf-8?B?MEZubmZObzdMYjdQbGNIWG8vT2xiNXNRTW9ZR01tam8yTzB0LzlLR1JGd3pS?=
 =?utf-8?B?c1JEWWUyMkdFQnk4cS9RVkRpb3R0SUVqVy82QTBnd1pRN1hkQTBxYnRlUE5T?=
 =?utf-8?B?QUlUWVZvc3pEYnFVcDU3WjkwWk9TS0xwT0RqVkNBeWh4aU1MNGlGL01jM01G?=
 =?utf-8?B?WnA2SEQ3bnNnV01yMmZlUXEzcERwS2szczgwanJmWU1tMW1VOGxBMlRqdVND?=
 =?utf-8?B?WGlhYkMwblFQaXY2Z004VXNQYmdnN0pkbFJKSXVpVWs0ZGF3STVldmNGT1JR?=
 =?utf-8?B?N1JaVnlJSjdYNnZoeTFTbmdNT3E4RzBJWlJDaXhoOW92U21ZSTFVL0pjQzlE?=
 =?utf-8?B?eUJSbGxxSWxUREF1NTFlNE9xeVlpTTR6MmNJLzdoWGtmNk5uRmVXVjdDZzZx?=
 =?utf-8?B?WFFmRmF6OXRITmE5d0VxVW1acXpscVB5OXVGQ1UzUDJhMVdnYzd4dE9hUEhh?=
 =?utf-8?B?dlpSQjhmcnBSWHNuc2hyMnpyRzhRMlJnN1dNb1FLUWFOK0diUXlsdCtWSkJT?=
 =?utf-8?B?U21nVTZva3liUVB4ZlZzNzRTcU5iVXVKL2owV3dWYnI3MVVRMHA5WTl2VjRv?=
 =?utf-8?B?SDRseERVaDV5N1VDNE5OMHo5NnJYV2dOTmxQc3Awb3ZmZVZlUUZlQzBTY3Bt?=
 =?utf-8?B?MTdUbHMzdjFRZkhxaElXWStNM0VaTFhmOWFzVWVmZ0RqZCtMaDdYaHg5eVky?=
 =?utf-8?B?TWhjOVlOMkgvWE4rcjFQcFBKWjNMK0ZhbVliTzFQMEYvd3ZSRytVUE5NVGJp?=
 =?utf-8?Q?Ny/sYN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TldBRXZmRktEaVdRVStIdlgrWU1yZ2ZxeXlQcDRYbk5jQ0Uvd3FrKzZCTHpn?=
 =?utf-8?B?RWZuN3JmK1Zqc1FRMERiUjZjTEM1RlM0ZUI5SEJHUXZYZHBURHpiay8vRzUv?=
 =?utf-8?B?Qk0zZWFZNHNVVWN4Zy9sMmZJOHBDT0MwM29HV3UyOThEc0hYNnRxV0M0TDcz?=
 =?utf-8?B?VCt2OW8vUGlORXFaSllRTlBPTng2TVl3TDlkVDVLZlFXdmpQeTRzMlV0c2dk?=
 =?utf-8?B?RzRrWjU5TXRvVFRNTWRQeFQ5dzRLY05pV2VhYklpMGJmS2RGclIzakVONUt2?=
 =?utf-8?B?V2JKTHE3emxyUk91UkxxSWxaVHpueUh6STFscC92TzZkVHFOd01PYW16eW8v?=
 =?utf-8?B?L1BuQ1RtWlkzUCs5YUFGTnY4Ly83bW53czh4aUg1UnpLMTYyU29OOG1wQStn?=
 =?utf-8?B?dXQyUHFBVVQzMlNjYU9VRitPMzN6WCtsbTJTWGNDQ2tyeHMxbUF5Z1V5UDVF?=
 =?utf-8?B?QWdwcXRnTWQ3Zk93dm5qVmJBZVZaWFRYdzdqZVlvYkVPLzg0bFRiVzdPU1JG?=
 =?utf-8?B?eDV0QkxaQUJzUTl3cnZ4SmI1YWRCRmloY0thbTNVS1hPcWJrNVNrQWZwbE5r?=
 =?utf-8?B?cUROUHZjd3d1OEhiRE1JMjBZcFVGM3RFMXNuMm1NQWRRck40aXNqRDFibU1r?=
 =?utf-8?B?d3cxZTRuTURYYVJXbG5wd1FXNkJiY3FOOHFya1FFZXdCWldXUFhRZTFsRkQr?=
 =?utf-8?B?ajYyVU9mV3FxOTljMWhuWUtIaTF3cVVSUUkvQVFaenUwdmt4c2gvNFZ3RU05?=
 =?utf-8?B?N0V0cjNiT2x0eEFWVkZOQmtHZkhFTnpUSjN2RTJLZG9wMldpSmlmeGRuK1hI?=
 =?utf-8?B?M0pWTiszQmhzNk0xWkxMdUQwRExUUHlRdEdHZm9pNHNFWERlZ2VYeEg2TjRq?=
 =?utf-8?B?ODR4WVBPSDEvVXJUZGFGTmovOXZJbHNUVW9ZYmpJN2dzYmhmcXhkZHE5cGlz?=
 =?utf-8?B?a3NyeGU0QnF6VkVuVmpDWGM2czROZHVDNUZNQjRhV0FsZ3prZlZyeGd1WmFm?=
 =?utf-8?B?M1RWZm1WcEt1eGFVdVpNcDZ4T09JamZ5TW9zTGp6S3VqOURtZVBmWWl3ZExQ?=
 =?utf-8?B?bEFMV01BMEduZ2xWZEdMR1lUMXJWcStFdWhuUWxQcHFyYkF0ZVp2UmNSNHRE?=
 =?utf-8?B?TlVtaU9tT2M1WEhEVEhBRWJhU01yWmxGYUtjdkNzRlUzMW4yeVFGcXQ5amJY?=
 =?utf-8?B?RndyTkVTSHJOdzIzcWxuQUxDZ21uMVBVU1U5UHZXY1JmMUxENHlRdkpWelNN?=
 =?utf-8?B?ODhUY2lrRnFydFlwQS95VlNsbkhJNFZlRjJKWE0zc1ArUUlERUhYV04zVFFB?=
 =?utf-8?B?dis4SnVXaUxKZWYvc0RhQkhXNlFNVDlITTM0bkZPaUQyNVo3ekt1WGZ5ZTFa?=
 =?utf-8?B?MWxPc0NlelhFVDZVSFhOcWdIeVpEUDVoRkFVbjJrSFg5ays1anRBd0hVb2FD?=
 =?utf-8?B?MUJ6VTVianNERDFuSC8yYVdaM3BBMVBubXVNRmt0Ri90NThIcUhncGhMSUxp?=
 =?utf-8?B?Ry9MOTlRRjNOTEFKYkhqN3lRSVc2Y1BIVVZpeVZlbmVzYnpjNUEzUURlMHh1?=
 =?utf-8?B?bU1jQW9GMXlMRUxIaTdEbWlvYXNpdndyWXBCYTYrTy9xYUlTOEZvaGgyME5G?=
 =?utf-8?B?YUpFL296dEMxV1Z6a2VjNTEwSFE1R2JkeERTOE1iZTZIWE5nN200Z0cxeWtK?=
 =?utf-8?B?ekRhQ0ZBY0ZKTEt5WEhmcWhiT0hsaTA3cWFHZkNFc0g1b2trYWN5UkZZYTdB?=
 =?utf-8?B?cjBEQm9yL1VuN1BBZm80SlBuVXBlSnhqTWhkb3BJTW5UY05pT1ZUcEQveGEx?=
 =?utf-8?B?UnN4NFF5UlJFQ1BYTmprbUp6Q3hxVklwbXBwWFMyd2dNZndJUGJ0UEplTG9Q?=
 =?utf-8?B?MzVZWEQrN1cxR1RyRFk2WldpRTFGbUJtenp0dXZqVkphallwbUw2Witvb05H?=
 =?utf-8?B?anc0NkZBcXVQWUg1blBNZDNRL2hEdGVLOHJKU2tXdUtqQXVua2puME5ONWVh?=
 =?utf-8?B?Mit1Rms1dmsxeXJtQzM0WDlKa2NUYWtDN2VDSXFLQlJJWEdwbUFWeUFocnJE?=
 =?utf-8?B?NDV4bElCcHZ3SCt6cG81L1VOcEFwWFJKSmFFd0taZlJpZmtJVnNiaEwrZ21H?=
 =?utf-8?Q?gofhyw4x4Qeb1B3WyPmkJzEgh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12fa737b-f50b-401b-3c75-08de209b6acd
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 20:55:01.8674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1CLQwzusjg/ZnYyhPi3Xj1SFwK/rG7VL5BHYYx2jJnbvRCXRIEzbdUIKKN154KSiZRthwxpoMOKTnLLTOzG4Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9075

Some misc update for imx8m* dts

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (2):
      arm64: dts: imx8mm-evk: replace space with tab
      arm64: dts: imx8mp-evk: replace space with tab

Fugang Duan (1):
      arm64: dts: imx8mm-evk: add uart3 port

Li Jun (2):
      arm64: dts: imx8mm-evk: add wakeup-source for usb phy
      arm64: dts: imx8mn: add wakeup-source for usb phy

Shengjiu Wang (1):
      arm64: dts: imx8mm-evk: correct the spdif compatible string

Sherry Sun (3):
      arm64: dts: imx8mm-evk: add uart1 and bluetooth node
      arm64: dts: imx8mn-evk: add bluetooth dts node
      arm64: dts: imx8mp-evk: add bluetooth dts node

 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 78 ++++++++++++++++++++-------
 arch/arm64/boot/dts/freescale/imx8mm.dtsi     |  4 +-
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi |  4 ++
 arch/arm64/boot/dts/freescale/imx8mn.dtsi     |  1 +
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts  | 32 ++++++-----
 5 files changed, 85 insertions(+), 34 deletions(-)
---
base-commit: b9e97ce705fb1873265ba0004041b55258d26dad
change-id: 20251107-misc_dts-c4cc84f1ae5f

Best regards,
--
Frank Li <Frank.Li@nxp.com>


