Return-Path: <linux-kbuild+bounces-10644-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD30D39803
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 17:33:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB70D305D90D
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 16:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3AE223D291;
	Sun, 18 Jan 2026 16:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MIATXMDr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010029.outbound.protection.outlook.com [52.101.84.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74949230BDB;
	Sun, 18 Jan 2026 16:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768753762; cv=fail; b=Y3ub2AhbAL/YNFtSk0zipclMCW28lHykjJumSeZ+itKqTpw8rt4LtNyqF8JBJT7hc1YAUmWXOYlqfsAZ4XpEDuVkIP3mJ4HiHJE+5/63loqsZlJGhAMz1YzCPM2uQveMnlD5ZkudWv9VWQOA8LQ5NhwSwmAHNEcNVWFH4K/mmNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768753762; c=relaxed/simple;
	bh=iIrxS7z3jzkfPylJR4lkOK44Tb/yYhbCUvQkqNSUY8c=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=iPajnoHbtBv3FTzp5XsluamO4D2r2YPKI0tuv0r7hGXSED9NxcerLp6L5kMUJT/XATI7THezHrhnf9nxbFdyG8rqpGZ+/QbRlC0u65i4fIDz7538uwqun+OzQNZNM7XGJHjGBtpWEIjWx74sv1TIVvHhbF8Qtyshwbxmcv0NdWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MIATXMDr; arc=fail smtp.client-ip=52.101.84.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQqZfQIxLk9KPisofhg0ZnmfukaoQvSHVnc6NHLbUxNhgTQ/Yli7z04WKRQL3KAsgI86EMLKnfbWDRBCqvByzhh9312uQjdFnm9NDRFJnIb+sbCMxDBA5PKE8Za+hhek5urgfbUNJmGV51TzGC6YTFqRpHi+tnZuO4FxUmJXTa3j34/LnqHJKsndv1/R0m6WI6yda+dJy85PeWr/APZBRDhyHOnFEHAvbEEpSVTp5lo5vpLrvliEkLZO6tIPHITnWJ2HbitsdlVF3/vsjCslDSdu5e8eYHRrNGrn3nB2Qwa3HUOqdfqEjpVjBDXe5kSzxGk892kPWFvZTOFPwrg2hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMFNtBSYXTplYmf4GRBvTx7SsY0HwmebVfzBNKjVS38=;
 b=NY12JFE1mFBiI0eXf5uhyMUyc6n9krX5MdLS+pKa0BZZNljb+oKeBPIfZLBlXT4U7Ag8NY0GYElDVeq1MZ05TP7LjLkCEZFEQNHd65b5dEf5tNvuo+5lNIdGSpPTO8ZpxS6nNrdABYBmLH/U6bEWKJBOkGZUibHAo4hUVe3ckqw4o8D/RANRX0w8tZmaeyeG5FCLrAus3/CqwfytT4cYisBCI4fa/SeIs9x9cyDxOHrMYiJHt5URjcastJtAUjLgHXHWVlEY/IGFQjm2dWS+g6O3dJzxWf3totmIL8hPY6z5s2xvlqtB3Ni3/pIJa9euaAw0Ak9ZUXE8mku3nYjZ+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMFNtBSYXTplYmf4GRBvTx7SsY0HwmebVfzBNKjVS38=;
 b=MIATXMDrfH74imKTLyi40Ope0OzV6GQHAk3T1ZBrCxPEIN0SKiowO0GEG6y7p0CC/m9fKltpMiehkGfbiLB+S7Ff4xBDhsTmpgVCLVdGanfNjMQ5qrkuzfqOX145tnbIO0dlVVP/QNR0ers9HKU170F04kS1/eS0KQxe9uLt1Z+ZhXWZyogZnzIuQ/mSG98sVY0yfU2TDWmUFL95XCjXOHnnvH/hhZEVpkW7sC1TqeAmlQ593NMVDWHMiTf5k0JHWuPzZPVGpssryRw+Y8sUf49hGyvcaB/pPJFtjmFKQ2EdTXW2VGfREySvWmnDq8HjK8JGJ7VqJD5q4jmzp2WIMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS5PR04MB11348.eurprd04.prod.outlook.com (2603:10a6:20b:6ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Sun, 18 Jan
 2026 16:28:55 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.006; Sun, 18 Jan 2026
 16:28:55 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Sun, 18 Jan 2026 11:28:06 -0500
Subject: [PATCH v3 9/9] arm64: dts: imx8mp-evk: add bluetooth dts node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-misc_dts-v3-9-d3564716cbf6@nxp.com>
References: <20260118-misc_dts-v3-0-d3564716cbf6@nxp.com>
In-Reply-To: <20260118-misc_dts-v3-0-d3564716cbf6@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768753702; l=752;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=5b34/7/43scQ2hB5QNkNQEIbdnOfdqT0CBCbY7aotgA=;
 b=CAMmUcsoHxOfFcN8bpFeDn7D5hPW/OWao7bmbPzdEnRR3XtPLvaW8D6S+O7BJbXeBc/APbQRw
 Hsm+qmIQrqoDvLCtw0VqzBIC5QT4N9k8ZmqJ1PZywYs47TldxCeNDQV
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P220CA0158.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::34) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AS5PR04MB11348:EE_
X-MS-Office365-Filtering-Correlation-Id: 8db4a97a-904b-4a7d-9860-08de56aeac22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b2dndE9BbWV6MldyZ3FUU2VYUTFwQjVBN1d4bDA1VThJREM1MVNBbzM0Y1JT?=
 =?utf-8?B?UTNKdWp5RFU1RmV0bHgrYjU4aXpLN01vLzdGRFpvRDBHbTluandpa3Rmczk1?=
 =?utf-8?B?UTc1ODNaS0Y3KzllN0VkbU5QVlRBa1pBbU5mNndBM1hpWFJYL2R5UU54b2lF?=
 =?utf-8?B?V1RLeVpZZWpwRjd0eHUvakNIQ0p3RXVKeUwweTRpZDJrZWtTNVlhOU5LS1VR?=
 =?utf-8?B?T1I5Y3A2Y3pUY3lwemtSelFGcEF3bFFOcHErd0xoRi9pYVlQaGhPc0RNaVlw?=
 =?utf-8?B?OTVmeE5EN1hNQUl4cHRRVVg1Q2NwZHJ0dnVVY0kxNFhpRm1kalNhNGorQzV6?=
 =?utf-8?B?bWxxNllmdENObUxQU000QnJsOVFub0k3dDFnbDV2K3NrRTk2czVwTC9uVSs0?=
 =?utf-8?B?U0p5QzR2NGVjK3hLaSs0M1loaSt1MlE1OWY0L3hrNklFa2E5cnNla3VrYlJH?=
 =?utf-8?B?cC9VdUEyNW45NUdkczNtK1k3VWZyYi9VSXdtaUsvdDAxMWxOOWF6cFQ0Rjhm?=
 =?utf-8?B?blZBcjY2ZzN1emllaFpSZnp3eDBwWm1hcmNvT2l3ZWZvYllWU0ZBMnNiZTd3?=
 =?utf-8?B?eXZUUUVhVUJBRjFpOXo0eHBXN2p2YlN5Ty9mdlNCK0o5Sk9aR1RzOFRQVS9v?=
 =?utf-8?B?dzRmWUJ1blBzbXVCTzdPZnZDU3BINEgyekI1WjFWekcwSno5VkdwNExZRHFj?=
 =?utf-8?B?KzN6cnNOTzNQVm5yVkhmbmlXN3ZSOW8wcjhBMVg4NzlhN1ZXa1JXd0pZU2ln?=
 =?utf-8?B?OWRZcm5BSFZ0ODRJVDBJSHQzZzlwRW9uTS8xSGNkOHlJd05ldThTNU9ZcSsx?=
 =?utf-8?B?R0VIYXFKK2oxUGd4ajNSbjBseWtkUGJvN1JmQmVMMUZCOTBMSjYvT0xScVJE?=
 =?utf-8?B?WitZNTk3RlFscklCZnIwWTZURDdaNXVKOGp1TE5Fc2NtbnZtNkdPa0Z2MU5y?=
 =?utf-8?B?WWFkMko1b3UwN1N2cXl2YUZHVHBzNit4OG1JdW5HY1FaNjlaaG84OUxVZDMw?=
 =?utf-8?B?ZXpjN3F4UVFiSzdIZVdDTkVEV2FmaGdTaS82bVBUVFhsVWYzdVVxdnI5SVo5?=
 =?utf-8?B?UEkyMzVJRUlBYm9iM0pIRmJ1ZU0xVnJEUU5JNGYrVGdKSE5mQXhRVmtjYVVr?=
 =?utf-8?B?S2JvTWtJR0I2Q3dPRXgrWVZFTmt2V3BoRXRaU0ZmZENQU2lRT0VPUHhNVkxk?=
 =?utf-8?B?V3JhbnBDekFmeTBZMkhGSWhoM0UxZzdKeTkwS2pCeVNhQ3JaK2d3eSt4WXVV?=
 =?utf-8?B?RGt3K1NGZTVTd3VmdXpsZzRadEtUZHBWVlgxR0pLSGoram5nNVIwVDdwS3Zu?=
 =?utf-8?B?OVZEWHgwa1JrQmovOWtMV1dXdFMrQ0VJSDN5NENIQzB3T2c2a2s2UzhTVWRG?=
 =?utf-8?B?cEU1MU4zUWdlQ3BYSEYwOXZEVUtUR3QwMXFEdXNCay92OWxsMGdqdFZHT3Yw?=
 =?utf-8?B?QXFCaVFhSGVnN3dWcEFrOW45ZVBpa3hIOE96QlpCRWM3bUxoeDFIcEZCc0Jp?=
 =?utf-8?B?WDk5cFNMQWo2TUFHVllZRVFUcGY1d3ZKZDBESmNFamp3MXZlUVVhaHFvU1Zz?=
 =?utf-8?B?eDZTUkppbklucjJnQ0FKT2RCNzcrRUdGU1VwMXUzQTBXRFM1K2VaWEdwMGFY?=
 =?utf-8?B?eFpLWG9xQTlILzNYV0JVditPVTZpTHdKNndlRnFFQ0U4MTRUZGYzMnRSVlFR?=
 =?utf-8?B?NGtsdlgzSnlDUTV2ditqbGMrNXZ0dERTN3RLcnlUWU10NFAyYi9jbjFzMmNo?=
 =?utf-8?B?dEd0THI1QVJFS0VwdVg0bzY2aXhsVVBWTUdCY3RXZU9QN3NlK3A4U05yVW9s?=
 =?utf-8?B?N1dZUnZoek1pV3B5cHBwcGR2UU9STmphNjZCcTFjVnZkT2x6SWJNQzVSSWZL?=
 =?utf-8?B?VzVUYlg4TUhJQ3JLVVF5aERFME14dVJRdlp3dEdUakV5SjhpeGsyVEJaKy8r?=
 =?utf-8?B?NGVneVlpQ2k1YkxGYlcyaWpDb2szR2VHc1hIckJiQWF4Q2dvNUx1Uk4xNm00?=
 =?utf-8?B?eGlpMXpqMHBLVWorWkhYQy9TcU1QYUZOQ1VlRjFYMVFCN3NYNnZ1WnNhZi95?=
 =?utf-8?B?RG44V2d2UVBvL2VNOGlPUDZmeldBb2NVZW9nZlBZL0lIK3poNXpOZUZjQlpY?=
 =?utf-8?B?RVBSSTNma2IrdXdDSm80cGR3Z0xtMFY5ckZvT1ZXVjN4bi9WcTBkVjBPYlJj?=
 =?utf-8?Q?enAMhB6ohUDZ/o/Oq/Frmog=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1J0Nnp3bDhkL29WUFIwL3d6cDhyYXhDeDczYm1lU0NxdFpvODZBbUxJTGdw?=
 =?utf-8?B?ek9TYndWWWVjeWkrVDJUaThWMHFmUlR1TXZxY3FuSnNVSnlXUzkwMEJWRTlN?=
 =?utf-8?B?UjBLMm9HalhSQ3RsTDJUOGZtZXNtZzZ4Z0hiRXIxcllaMkprdDlOTWxOR0xL?=
 =?utf-8?B?a2gvekJjaThwYWlWYUFKa0tkSmhURk5ZVGdXUkwrQnI0eEJnclRBQ2FCYXVP?=
 =?utf-8?B?YnNEYWlLWjcwNzJWclBYNW42MWZwd3pBcWdGaU9qVEhTWXg5ZE5DcGk4NVpR?=
 =?utf-8?B?K2lLVEhha2I3ajhSOGYyTC9YVVhDRzZSNVlkWTF6YlIxeTd2cVhuWS9RVjJ5?=
 =?utf-8?B?MkJGbXVSSGtmTWFhQkpjbXBLYVhpajdZMXBNdFd6TldUZ2htS1VKcm05ZkU0?=
 =?utf-8?B?N25XU3FiVkJLRHo0UTl2TFQrU3FjUnlFMHo0aTNsT0hMWXoydzdxR2hTUlFj?=
 =?utf-8?B?QW9vaFZpcitOS2Z2cDJxTm5aOFBCMmJEQXp1N2tPNXZQbGgvWjZiZEd2R0s0?=
 =?utf-8?B?RmxOandMWGpvbG9ZNURKeGJoSTJyS21Zam1xZENWa0NMWGNEVU1ZME9SQVFP?=
 =?utf-8?B?Z0pIb1JBNHpxS0VLa0lERnZOY3U5M0U0T29SU3hIcUV3RUFuUExabUVNbHVs?=
 =?utf-8?B?R012ZkQySFI2NnpEQWxialNDK09Vdk9PN2w3Z3BDQkFOTTdqRVJQY2VNdEx3?=
 =?utf-8?B?Ry9tQzNnQlh1NXhPTnVZd1BmR24ycmI0UFJZamJxOU5XUkFYOHF0dU5RYVBF?=
 =?utf-8?B?UlpwOUROazlqbkVoU2tXT0JGY0JiTmVmNFV4dHY1WFRUZlFVNUk5K05lVVAy?=
 =?utf-8?B?VGNSMmY0d1owTytGeU41L0J1TENEWEZhQStXaE9ibXRnY1lhbk1jdGRjZDlF?=
 =?utf-8?B?TVJMallvTGNYbk0wKzc5bkVXOUdHRGJHclZjZFZkRnJPOEFDaW1RaTh4Tkdq?=
 =?utf-8?B?Z3ZHVVoxNG53YnFoQTBza1pkZXd1R0ZmSnBLbERVc1luZDFITGx3MzJOdDhP?=
 =?utf-8?B?TldqRWhYUmZVRGhMWTIrZnVoMlQzZ0hyOWxSNXBjbytiZnkxMXBkUjBZSXFL?=
 =?utf-8?B?OTkrajVES1kzVlNjdk04cWVxKytDYzEwZXdkYTBVenRtaWliYTRvUCtXRm5x?=
 =?utf-8?B?aFhaWG52dWVkZGV5WlJYaG9WaUNTMmR2d0I1YTgxMnNtYkxGN2pyeWNoaU42?=
 =?utf-8?B?b3pzckhwNlVqZjhWcVpRNE1SbFlEaDM5MTFFWjFPdVZjSlYva1YzZXZOZTA1?=
 =?utf-8?B?ZnQvM0twb2Z5eGVaMmZZa2oxRTEwSmZYNHpua0dpRy9SdVJ4OThCc1F0aWZr?=
 =?utf-8?B?aWx3aGF2M2hqOW9DbGROSW5hU3lCbjNXU3l1SGlkYS9CNDh0VzR2Q3ZDZ3ky?=
 =?utf-8?B?eEZjL1RPZEFWOUtPN2Y0MS8xVkgrWk0raG5ZYjExYnlWR01QQlZ4TTRMeTd6?=
 =?utf-8?B?Q1VKemtVcjF3R2RVMUJrejN5UDIxdHFDRGJySG02ejI2d2FXeVBFQTFhZ2sv?=
 =?utf-8?B?U2lSZ2hydE5jK1lWK2UzaFFHK1NxZDBpOU93R3M5R0RGYmhGY013Y1FpODJ2?=
 =?utf-8?B?N2NDMUg5YXI3MktEQUViTTJVVXp6aFFQdzIzdVFLREdaMmErY2pXWXZiYjEw?=
 =?utf-8?B?bmZpbFhWRWpCK0doTkZxUU5wTDZiUnNveWZyY09aN1dIU3luUGhldVZzUXFk?=
 =?utf-8?B?Q3hVdVFvMVhkSGhUY0Y2OGVwM0tPeXJlTlEwOVN1RmVIY1BESEJ2eHV5blEx?=
 =?utf-8?B?UGdpRlpjR0crVUcwK3dUTEF4TGdpOHl4emNyU1NVN0R4RHNlTGQxeFhhQ2g5?=
 =?utf-8?B?WFFyRVNpK2Q0YWk0Y2lVak92QVJWVzZHSVh0dFZwNHNtUndPL2wxb3FRSGRG?=
 =?utf-8?B?Z2JBMERWbXRqTGlXcjhyU01Ka1R0SWF3Z1VoYkZJUEsvNHZ4b08zOCtRN3Yz?=
 =?utf-8?B?R05zTHlvTThKM202akdUNHdaUldLdDZta2RJaUV2T1ZWTWpJSi9JVGZGM2Zu?=
 =?utf-8?B?L0trY1NnRExJSWZ6U3hlTENxd09BQTlndVF3RFJ0cVhDNHdmUUx3VTJSa214?=
 =?utf-8?B?ZDFWbENIUVFBbDdHK1l0ZjdLZmJSZ3N1ZjlkeWZLeXVpcitIRXo0ekZZRDVQ?=
 =?utf-8?B?VzJxZStmNFNMWjQ0VDhpM0VNNk9PYlpqd3RHL2gydGdQQW1FOGw0VUsrbGhJ?=
 =?utf-8?B?dVJoYWo4bHBUTlhHbkUrSHlVcTJwcDB6bk1GK2dGbGY5di9WcTJpaXpSaGFs?=
 =?utf-8?B?YzNKSjNublFnQjVyZ3Q2cnBwaEVnUm5qZU1RQWo2djRQRTF2SVJXa055YUR5?=
 =?utf-8?Q?XnsFpWuXP4/soaeWo8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8db4a97a-904b-4a7d-9860-08de56aeac22
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 16:28:55.3138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5/pkISpdWd2aw+cgHflTNdvygUH30t1i3GkJ9wNNVy3dtd3JccdYTKnNuf10iVxWnjG+ZNxUm1d31uL2PNaAOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11348

From: Sherry Sun <sherry.sun@nxp.com>

Add bluetooth dts node.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index 053c5e91f5aa3aad941820071fe7083e5c18447e..33e7094d0e10d7dca26f5078e032c05a69f3f581 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -825,6 +825,10 @@ &uart1 { /* BT */
 	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
 	uart-has-rtscts;
 	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
 };
 
 &uart2 {

-- 
2.34.1


