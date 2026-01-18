Return-Path: <linux-kbuild+bounces-10643-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D7ED39800
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 17:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 848473016352
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 16:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 535CE2248B3;
	Sun, 18 Jan 2026 16:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OqpLT2p+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010029.outbound.protection.outlook.com [52.101.84.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87F3212F98;
	Sun, 18 Jan 2026 16:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768753761; cv=fail; b=Ba4y2swYh1vXD6WfifwKWp75QmRJ84jSDMPxMYgwPeq0hbYqktYC5To6Qfi4pzdg8m2lomxx5SoEC2OniLXoiDw4Fo7UJHeLtPJpOSvx+VAvPoqI4vXTfSHcca7w0rR4g5KdlZG5QFAjDTJuQf1ggTuAAajx/3pui5tzgjluwBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768753761; c=relaxed/simple;
	bh=bSWNP2BbwNfZCO69628ASv7rmwa409pab4HdsublQ9o=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=C72HuSq3gHOl+lbewNcH7h6ZxZXSf0qDQsv7ohnhMcgz5yvy9eRzPsLJjH7Q63nmE+BLZ3tVB15F3MolNS7yVkG8GTTkkU0OAqlRdlzV+Gwu9+1dwRMfhe09VtAuWv9hQGXAj6YCQVoq43eUaR7WUhjKEXDxuEuMn/umVFPNVc0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OqpLT2p+; arc=fail smtp.client-ip=52.101.84.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m2gkaqXocfiBSmkShJf+CVzIe+TR6biFPoFYjuDsEaMRkm8CtNwzS8oH/Xd5x6ofCTgK6WYCFBRr+8mmSoZkYK85+E7Gr9s5u8gzWkk2EG15kobTe/ACXNXYWbkMBmPaEW8Ie9r389QZveamVYKyAXO2zQwD+x6qcIgUHwLT8/DMmJVng44Kdzbn9R5NIUbsigmryNxPUx9rLLLebVBJ3jjva+Ny6Ub4Uq72o0hXgwcZbrWnRD9wwfaPCrZABayZdiEuHhjMs1nHZ6RVM+r2CNPvt2VvYUGzCM7HVTMlQtfD5eyg3q/k8d2LNTgOM6tDFWPSxitG90Z/IYz3auMrfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lBwyrfwOUZptlvoARDhZz8gBzuvdYTzP+s5Y2p0EJWg=;
 b=p0zQHGII0z1uDpfFZPHGWTvBqEKOfNt+28JQqtcVLBKgFMEkDe58qsgDsI3Xi5SlDVa0TUk2ZQOXa40FHA2JKARdvLrwop6mYZFWlE3NkB+uMUojgLrbdF2X+Ssz6a7DmIaAoJY1IqUNtm7Byoxz7DE/S3BQVZWyzYCiSsj/ZVzM9TK36a1kPSgmEdkgD+4kQktclt+c8BNmTAK8INYiGS9oEnMNjqZntfybluIV5FkfddU7FiNHrkWDXgDSRcdBWpyD0b4A4coaOjr0CL8tYXGtctSIBmgUVYsrMKH/50uDiDPK8zVacA2LP/b9nsiPoTk0jCkcAp42qSHOKBWuNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lBwyrfwOUZptlvoARDhZz8gBzuvdYTzP+s5Y2p0EJWg=;
 b=OqpLT2p+tMJEra3SvL5/6IzfciEm6cZKf9FERj5Jj4iA0zMShWrdz3r+jwpZ/+AcIoj4i5T/cEafCpDnJJpDuJFzm7goAeUY9WTIsrasW4HcAL5PZSf49V2gOJ12RUYp3oxC2DwQtJgSh7oX1+F4HaPr9Mb+CxAr8V5v7TzsJu9MyVN+SsW6sOVfb6Od1VKde1W49QqMO0unwNZ8Mfv9NMmubdCnFmpIplYK3C+wupEt+eo410KVVWKtRhwqNe8HqRJ40MwaBwEqOCcoot2pOstX+WTn8BD0eqiYxJIVfW+glp5Si3MA62v2BZ2f+oINRfpTPWUc5i1T1ah9hFFTog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS5PR04MB11348.eurprd04.prod.outlook.com (2603:10a6:20b:6ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Sun, 18 Jan
 2026 16:28:53 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.006; Sun, 18 Jan 2026
 16:28:53 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Sun, 18 Jan 2026 11:28:05 -0500
Subject: [PATCH v3 8/9] arm64: dts: imx8mp-evk: replace space with tab
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-misc_dts-v3-8-d3564716cbf6@nxp.com>
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
 linux-kbuild@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768753702; l=2556;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=bSWNP2BbwNfZCO69628ASv7rmwa409pab4HdsublQ9o=;
 b=xf5nFhJByEPb/ORIHhRnJX7vUUj9G2ZB95KpPHobO5lP1vRK19vSE6a5pRbiFQn3FlJIVREKu
 9syOH2tSrkEA6gdB1sDlzVFGZLIl12vZt0eq3LE0s2jSC2zxl2XgnwI
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
X-MS-Office365-Filtering-Correlation-Id: c5016f94-b9f3-448b-5b2d-08de56aeaa2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?alhLbzh2RUlvbE1OQVNyNmhQbW16Z2FHaGtETnpmY0QyV2dzT25DM09UdlNW?=
 =?utf-8?B?a1dQbVF2dUc4Vm5nU3dmMTN4cHBxQ0xTUXRtYVFlZ2J1ZzV5RmMwMnBZaGlu?=
 =?utf-8?B?cHVnQThoaXVWaThDam1DTTExU2QxUU9HYUpsdGVhcnNZMHVVTTNMMlZWWWsx?=
 =?utf-8?B?ejY2akUwYTJLc0tpY1NtZ3Z6UXdMSWM4eVR2dXNYclRFT25rc1o3NTc2K1Zi?=
 =?utf-8?B?cEZVVnEyRVBiOXBiM2hubXZqUFhVUmJZYXAvRGRPTjRaaTdZdm16Q2ZXWTYv?=
 =?utf-8?B?cTZOeEFEandUL2ttbmVDV01ZUHZWazUxd2dEbTNsaU44bmYvRlY3c1Buc21E?=
 =?utf-8?B?U1dLdTJrY2JHT2RHcnVDV2EyQ1JVWHFaK1RYQVpmcE93ZTNUSENNTHgySFh6?=
 =?utf-8?B?eXFuVG9acDlybUNFcElINnZ2Y2JnRDBqOVNSTGFoRndFdS8zbDVPWm51Rmd0?=
 =?utf-8?B?TlRDMm5HaWQ5MlRWQVRIejRBbGpwb3Q2YTdKMStCTXNxd1AyelhFVDRCelRj?=
 =?utf-8?B?QUZsYkIvbFppc3M1ejRUVzdqMC82N3paL2xpa3RTRDlEZXI4bnUvQjlZSVo2?=
 =?utf-8?B?d08yWDZNdmhEUmQ0U0w3dk9ucmFXWkZDVjdldmVYbkRiQUdYMlFkQlNCZlND?=
 =?utf-8?B?UGFDU0RybjZVNS8rbHV1aXJtRktzRTgzcWd6aXcyeTdkTEhaV0hBL3RxaFJU?=
 =?utf-8?B?QmdMcUZjeHl6QnArbVNXM2x5eGQ5VHp2bFJObFpwcXhEVzdMakxPalM3RWZH?=
 =?utf-8?B?Z1JJdVp5VTByTnNEY2pTcDU0QUo4VlVZVXMrdGpReS93eEw3WlJuVXlZUVZz?=
 =?utf-8?B?a0tZRDhCZzJUdVVnYVEyVTNJOTZQRlQrYlIvalkxSHNacTJDQzZYODcxakJB?=
 =?utf-8?B?bWp4QVFxUmFLT1lOK3BPaTdIcnIzOHRNbHZwQjZlZU02dXU2UnRDV2N6cGVt?=
 =?utf-8?B?dG1NNm0ydjUvL1pvZkFRaUpjT211RlM1TWxCcnBxSTZzVWpNbFJhOUFYRkls?=
 =?utf-8?B?MWRnK3dEWFpyWUhrTmt0MGJ0MGJURkxDcm9EUkc5bEFMZ245TGFjMjhBUzVq?=
 =?utf-8?B?R3oyV3VJYWprRGgzMWJ1SlEvbU5iSG0zU0U2MmMrZU10MjROMERKSFR4UDFi?=
 =?utf-8?B?NTVZMGtpYlZscEYyMDVzVElucFlVL3A0bThiOEhBdnZUaFYvSVJDUzZ5RWZp?=
 =?utf-8?B?UEJUdUZ0UEpwK2ptdGlwUGViVUdmTGJjRUFVSUNCb05NOEhDZnlzLzhGblFh?=
 =?utf-8?B?M3ZoMm1SV0o2SytJR1ZTWHN0NzlEQkxYTndDK1BiVGZaOXo0cHhEVy9TdlRF?=
 =?utf-8?B?S1BDY1llcFhNMUNJT2ZEUjIxUGlBbGFWRVg2OHpkbEpka1R3NzRVLzhaM1Vw?=
 =?utf-8?B?WjBaVEFWdHJvRGhaMFRKK2xxeWk4V2tRVmM0NDZ6cExOcEg0NTlGNEFSQTht?=
 =?utf-8?B?Q0duUHBVQ2o0SWdsUzFMUWNDZVdBOXBiVEZmdzM0QW5BTG5qUVM5RTFpQXBq?=
 =?utf-8?B?MW53Qk8vT3FMR2lHUWhleHd4VVVRS1A4NG9TN3ova0M5UmswbUhPQUc4eWR4?=
 =?utf-8?B?ZHZTRFlZeDdZYWhINGtaRlhpVi9kQnBJUk8yYUJxSjJiN3FqVGJyR3lXSmZX?=
 =?utf-8?B?Y3grajRITEljMWpPRVJFQUdpSzZtMUFhMjk5YVNLZmc0U1VZNE5lV2hhNk1Q?=
 =?utf-8?B?cDlJU0dxamdvVVVCR29DK1NwR3p4SnpzR0FmMUlrV1hxcDNCZWhReXBuemdp?=
 =?utf-8?B?S08wN3J2NkdGejVSUGJlRVJOUjRzd096bHF0UmtYVTVoWk5RclpNVGJ3K0xF?=
 =?utf-8?B?N1ZFQ051L2tGamxIdVZEakRXYkpYTTM3a3FYbDFkSmJBUWhCVzcvSFZNemhW?=
 =?utf-8?B?eng3Q0Jad3lKaDY2LzhCc1ZsVHlnenY1WkxJQUxVNnl1Z0Z3Sjh4bnNEc1Ir?=
 =?utf-8?B?QXowUVRSSlNMVjQ0OGJBQWhTOE9pY3NYMTdtK1ZLblRrVmswWlVQTENod3Uy?=
 =?utf-8?B?dlNXODdPRHZQU3I2TWJzYktpK1pBOGsvNkNqYkh6WFMrMk5SN3RxaFd3UHd3?=
 =?utf-8?B?WVhFVk5GblVJZTZjcXNsS2dRRzJmYzVIMlpobjREZVBSNWVCNUNhRkVaVUJI?=
 =?utf-8?B?SW14SUQ0cjRTR0Z5RCthTkNkZGpGUDdQSnIwZFU4K3ZCR3dpbStZb25FZis4?=
 =?utf-8?Q?RNBSWMVZVOeURLN1Nll0XHQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlRkNmNJZS9kWnBuTFJmWitJc2ZkOFpjMGE3M2tLcTBtWWJMallzaEsyS21Y?=
 =?utf-8?B?K1RWbTZJa3hhMjVPeTR6c0YxU2hscDdRWHRiMU93RVFKTW5mSXRHQmhvd0NQ?=
 =?utf-8?B?S2ZqbTRCcDdsMytHdnJsWXZWcnNHSS9MNjJvSGJLYWZWbFBHS3QwRFNhdXdZ?=
 =?utf-8?B?VG8vRVZ0WnBjTTJQelRxWjRPWFRhK0hDZWcybzJ3QUljTlZDTFlFRDVIN1Ji?=
 =?utf-8?B?VVZPbzE3OVh4Yy95YWJ1a0Rid3pUQ0Y0ZkE2ZXBERzkzd1dDVHpIbjl1U1RP?=
 =?utf-8?B?WGhkZDRISzZZajc3N0tZbU1pemE2OThtK3daZUhHRjVEU01TR2RkakpSNW9J?=
 =?utf-8?B?OElXbUpKTEN5SDJ5Z2hiL2NISmtWZGtvRXZnbnNJWXVTNDlsektZTTZ1S1pE?=
 =?utf-8?B?ZWxkUmw3bUR4cVRBaTAwQ1B0MXFuQm55amphMGh0RHR0NEFqWDYydFhOaCtE?=
 =?utf-8?B?ZTZZS2J4MVpOOGhINm1ZWS9jUWdWb25mM0Vya0Q2UURIWGVneEd5SG1DU0RN?=
 =?utf-8?B?cnVkOGlYbEo3WGs1ZE9XQnVpbHpyQ1NTK000dnFjTUIvYm4rM0RPaFIyRkNh?=
 =?utf-8?B?ZStVNHZGcUhQNDRoSHhPUDNETWk4WkNqM0h0bXpFN1BaODR4UnNvMnRLcVlO?=
 =?utf-8?B?Qm5lc0liVU5aV2xTMWRYWUhLdDdHL0QxWmRNM3UxcDhPQ0dERmo1TDBBZlh0?=
 =?utf-8?B?Q2c0bmNzMHdhWlF4VTBIbVNxb1NnVUoxNTFIbmdveEFBcTlabUV1cFV1bHl6?=
 =?utf-8?B?Q1dNdkhqYk01aS9zS2tGT3FLaG5hdDVHeitVbGIxSlhaekRQcHFNUUg4TVMx?=
 =?utf-8?B?WjY1OS82SFhFV0NIaXR6TnF2Sk1uYlZHcFhmYXFib0Y0UDVlcFFuL1dtYXF5?=
 =?utf-8?B?T0dlMDd1NjREdnVhWlRzY205dy9kL1BIRHlyVmpOUXYzWklmMGVCcDdXWFJa?=
 =?utf-8?B?cjNHSFlaZWdBMXFFdWtBNHRnTHFQQjJHSW15UGRSWXI0aDBTVlRhUVVjWmdj?=
 =?utf-8?B?NlQ2azJuU2tjSlNySjRtTVhmUVFtNW9ZaEdiMThsL2FrdjVIQkVUcDl5Q2RM?=
 =?utf-8?B?dWUrbGFOOUdOTEZuc050a2J1RmFFenhLUlJjY2lpZnozMGpCVE04MzZBWFlO?=
 =?utf-8?B?ak9nMWZJY3ZKVExNMjVudUN3bm5aNVVpN0YwMGErb205WVd6ZW9xR3JWcGt3?=
 =?utf-8?B?OGtubGxJZEN1VkFUNFZHZDl3enVUSXhMK2VUQkhsNWtoWC85SVVYYkxDamRm?=
 =?utf-8?B?eHRhU2RraDB0bmNWOE82UUd0c0xQbXNpeXl0djZhS2V0SDliZzdGTzhwZjdm?=
 =?utf-8?B?RTJTZTRvYVZnZlpxTmQweG9WSnpxZlNZNkcxR2k5YStTLzN4dWpYd1dZQ0Ur?=
 =?utf-8?B?dW82YTl5dnhKTjVlVDgzcmhkSjRBUXQ0RFdnSU5mTy9ZNFEzQ3BvS2NvN1B2?=
 =?utf-8?B?T2ZSYXhjeXh5bDcyV1dDa3R4S3F5cG54UTdwdk04RlhOVW5POHhjSzVIOTVy?=
 =?utf-8?B?dlYwa1lyWXhhcWFDZC9hZ2VaU0JBMmRkUlc4aFF3UTlhSU5kbXF1R3ZWWVNT?=
 =?utf-8?B?aXRWeWRIM1U3NDFCZ1BjcnFaN1FnUFVUazNPRTFJQkNYYzZITVlZWU4wTmR5?=
 =?utf-8?B?ZmU2dXhPVGJPMFNIaE9JNWFoS2pzVmRYOVg2dkFuQm9qWjlyT256YkpqcXFs?=
 =?utf-8?B?d25WMnpXYWRYcXpaZWpWVGo3dm4zbmxHbEd1clA5OTlURWNEaDZYMnJ4ZUhY?=
 =?utf-8?B?TUdsMm9uc3BkVmE4VFdhMEowRzdQbldPRlpFLzhFQXNBeVpuWDZpU0NHMXRq?=
 =?utf-8?B?V3lmbkdYTGRCZVF0UTJ4R1VkSTBCS0sxUllpL1Myajc3V1I5ZHN2a1phT3B4?=
 =?utf-8?B?Mk5MK2dsTHJtZTdyVk9vVytiK0Q4YjFmYlN3WXBJNnh6V1hSUWF1NzkySlNt?=
 =?utf-8?B?d1lWaWtQVEVyNGVmVXdMR3hFTE1mQ0RocEhSUC9ka3ZicGRaV2p5ZUVmcHFi?=
 =?utf-8?B?ZHBsZzNDNnQ4d012K25MemFFdnhxUWgxWWFZL2g2WDE2TVhaNElQM3FJTldv?=
 =?utf-8?B?dDdQYW82dFd0Q1ZjMGhwRnhIcHoxOThKOHY0aEFWMWFPT0VzWWt6TGhlbFZy?=
 =?utf-8?B?b0VuYXluZExwK1p0TE82UjNLVXZmazgxdTBMcENYY3ZXcFM5d0s2b0EvdTdE?=
 =?utf-8?B?Uk1WT0x4ZkpDNkJVYmJmbjdQUXJBMmROaVRnWVBsL0VuZE1tYnQ4K0J4eXV3?=
 =?utf-8?B?anpFbVZsL1BxK2k2cjNxaW9rMER3L0ZSU1FtOHhWMmFEOERpazQzcXBRWUFI?=
 =?utf-8?Q?YQB4AEyyN5TrkQ53+V?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5016f94-b9f3-448b-5b2d-08de56aeaa2f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 16:28:51.4547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +/z2R+7mBRzBaAvFQrpsf0xdF/43ExfpaPEODoHXNQVQ0x07hKoL08kQaFTJfsz4JQQcNVD0T2ksC6ilYJkrdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11348

Replace spaces with tabs to follow the coding style.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index b256be710ea1281465f5cecc7a3b979f2c068e43..053c5e91f5aa3aad941820071fe7083e5c18447e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -965,33 +965,33 @@ MX8MP_IOMUXC_SAI1_RXD0__GPIO4_IO02		0x10
 
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
 
 	pinctrl_flexcan_phy: flexcanphygrp {
 		fsl,pins = <
-			MX8MP_IOMUXC_SPDIF_EXT_CLK__GPIO5_IO05  0x154   /* CAN1_STBY */
-			MX8MP_IOMUXC_SAI2_MCLK__GPIO4_IO27      0x154   /* CAN2_STBY */
+			MX8MP_IOMUXC_SPDIF_EXT_CLK__GPIO5_IO05	0x154   /* CAN1_STBY */
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
 
@@ -1044,8 +1044,8 @@ MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA		0x400001c2
 
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


